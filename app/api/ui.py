"""HTML-интерфейс генерации SQL."""

import time
import uuid
from pathlib import Path
from typing import cast

from fastapi import APIRouter, Form, HTTPException, Query, Request
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.templating import Jinja2Templates

from app.core.config import Settings
from app.core.logging import get_logger
from app.dependencies import AuditRepoDep, SettingsDep, get_schema_cache
from app.services.llm_runtime import (
    LLM_MODEL_CHOICES,
    LLM_PROVIDER_CHOICES,
    LlmProvider,
    LlmRunConfig,
    create_orchestrator,
    default_run_config,
    resolve_audit_llm_model,
)
from app.services.run_errors import (
    compute_duration_seconds,
    format_duration_display,
    format_error_code,
    format_error_message,
)

_VALID_PROVIDERS = {value for value, _ in LLM_PROVIDER_CHOICES}

AUDIT_LOG_PAGE_SIZE = 100

log = get_logger("app.ui")

router = APIRouter(tags=["ui"], include_in_schema=False)

_templates_dir = Path(__file__).resolve().parent.parent / "templates"
templates = Jinja2Templates(directory=str(_templates_dir))


def _parse_client_start_ms(client_started_at: str) -> float | None:
    """Метка времени (ms) с клиента в момент submit формы."""
    raw = client_started_at.strip()
    if not raw:
        return None
    try:
        return float(raw)
    except ValueError:
        return None


def _log_generate_timing(
    *,
    started_at: float,
    client_start_ms: float | None,
    **fields: object,
) -> None:
    """Логирует длительность генерации: серверную и от нажатия кнопки до ответа."""
    duration_seconds = compute_duration_seconds(
        started_at=started_at,
        client_start_ms=client_start_ms,
    )
    log.info("ui.generate.completed", duration_seconds=duration_seconds, **fields)


def _resolve_form_llm_model(settings: Settings, llm_model: str) -> str:
    """Выбранная или модель по умолчанию из списка UI."""
    if llm_model in LLM_MODEL_CHOICES:
        return llm_model
    defaults = default_run_config(settings)
    if defaults.model in LLM_MODEL_CHOICES:
        return defaults.model
    return LLM_MODEL_CHOICES[0]


def _index_context(
    settings: Settings,
    *,
    task_description: str = "",
    result=None,
    llm_provider: str | None = None,
    llm_model: str = "",
    error: str | None = None,
) -> dict:
    defaults = default_run_config(settings)
    provider = llm_provider or defaults.provider
    return {
        "task_description": task_description,
        "result": result,
        "llm_providers": LLM_PROVIDER_CHOICES,
        "llm_models": LLM_MODEL_CHOICES,
        "llm_provider": provider,
        "llm_model": _resolve_form_llm_model(settings, llm_model),
        "error": error,
    }


@router.get("/", response_class=HTMLResponse)
async def index(request: Request, settings: SettingsDep) -> HTMLResponse:
    return templates.TemplateResponse(
        request,
        "index.html",
        _index_context(settings),
    )


@router.post("/", response_class=HTMLResponse)
async def generate_form(
    request: Request,
    settings: SettingsDep,
    audit_repo: AuditRepoDep,
    task_description: str = Form(..., min_length=1),
    llm_provider: str = Form(...),
    llm_model: str = Form(""),
    client_started_at: str = Form(""),
) -> HTMLResponse:
    started_at = time.perf_counter()
    client_start_ms = _parse_client_start_ms(client_started_at)

    model_value = llm_model.strip()
    if llm_provider != "stub":
        if model_value not in LLM_MODEL_CHOICES:
            model_value = LLM_MODEL_CHOICES[0]
    else:
        model_value = ""

    llm_config = LlmRunConfig(
        provider=cast(LlmProvider, llm_provider),
        model=model_value or None,
    )
    llm_label = resolve_audit_llm_model(llm_config, settings)
    request_id = str(uuid.uuid4())

    try:
        if llm_provider not in _VALID_PROVIDERS:
            raise ValueError(f"Неизвестный провайдер LLM: {llm_provider}")

        log.info(
            "ui.generate.started",
            llm_provider=llm_provider,
            llm_model=model_value or None,
        )
        orchestrator = create_orchestrator(
            llm_config,
            settings,
            get_schema_cache(),
            audit_repo,
        )
        result = await orchestrator.run(
            task_description=task_description,
            db_schema=None,
        )
    except Exception as exc:
        error_code = format_error_code(exc)
        error_message = format_error_message(exc)
        duration_seconds = compute_duration_seconds(
            started_at=started_at,
            client_start_ms=client_start_ms,
        )
        await audit_repo.record_run_failure(
            request_id=request_id,
            iteration=1,
            task_description=task_description,
            llm_model=llm_label,
            error_code=error_code,
            error_message=error_message,
            duration_seconds=duration_seconds,
        )
        _log_generate_timing(
            started_at=started_at,
            client_start_ms=client_start_ms,
            outcome="error",
            request_id=request_id,
            llm_provider=llm_provider,
            llm_model=llm_label,
            error_code=error_code,
        )
        return RedirectResponse(
            url=f"/audit_log/{request_id}",
            status_code=303,
        )

    if result.status == "failed":
        duration_seconds = compute_duration_seconds(
            started_at=started_at,
            client_start_ms=client_start_ms,
        )
        await audit_repo.set_request_duration(result.request_id, duration_seconds)
        _log_generate_timing(
            started_at=started_at,
            client_start_ms=client_start_ms,
            outcome="failed",
            request_id=result.request_id,
            llm_provider=llm_provider,
            llm_model=llm_label,
            error_code=result.error_code,
        )
        return RedirectResponse(
            url=f"/audit_log/{result.request_id}",
            status_code=303,
        )

    context = _index_context(
        settings,
        task_description=task_description,
        llm_provider=llm_provider,
        llm_model=llm_model.strip(),
    )
    duration_seconds = compute_duration_seconds(
        started_at=started_at,
        client_start_ms=client_start_ms,
    )
    await audit_repo.set_request_duration(result.request_id, duration_seconds)
    context["result"] = result
    context["duration_display"] = format_duration_display(duration_seconds)
    _log_generate_timing(
        started_at=started_at,
        client_start_ms=client_start_ms,
        outcome=result.status,
        request_id=result.request_id,
        llm_provider=llm_provider,
        llm_model=llm_label,
        total_iterations=result.total_iterations,
    )
    return templates.TemplateResponse(request, "index.html", context)


@router.get("/audit_log", response_class=HTMLResponse)
async def audit_log_page(
    request: Request,
    repo: AuditRepoDep,
    page: int = Query(1, ge=1),
) -> HTMLResponse:
    offset = (page - 1) * AUDIT_LOG_PAGE_SIZE
    groups, total = await repo.list_request_groups_page(
        offset=offset, limit=AUDIT_LOG_PAGE_SIZE
    )

    if total == 0:
        total_pages = 1
    else:
        total_pages = (total + AUDIT_LOG_PAGE_SIZE - 1) // AUDIT_LOG_PAGE_SIZE
        if page > total_pages:
            page = total_pages
            offset = (page - 1) * AUDIT_LOG_PAGE_SIZE
            groups, total = await repo.list_request_groups_page(
                offset=offset, limit=AUDIT_LOG_PAGE_SIZE
            )

    return templates.TemplateResponse(
        request,
        "audit_log.html",
        {
            "groups": groups,
            "page": page,
            "total_pages": total_pages,
            "total": total,
            "page_size": AUDIT_LOG_PAGE_SIZE,
        },
    )


@router.get("/audit_log/{request_id}", response_class=HTMLResponse)
async def audit_log_detail(
    request: Request,
    repo: AuditRepoDep,
    request_id: str,
) -> HTMLResponse:
    entries = await repo.get_by_request_id(request_id)
    if not entries:
        raise HTTPException(status_code=404, detail="Запрос не найден")

    task_description = next(
        (entry.task_description for entry in entries if entry.task_description),
        None,
    )
    failed_entry = next((entry for entry in reversed(entries) if entry.decision == "failed"), None)
    iteration_entries = [entry for entry in entries if entry.decision != "failed"]
    last_entry = iteration_entries[-1] if iteration_entries else entries[-1]

    if failed_entry:
        final_status = "failed"
        final_sql = None
        error_code = failed_entry.error_code
        error_message = failed_entry.error_message
    else:
        final_status = (
            "approved"
            if last_entry.decision == "approved"
            else "iteration_limit_exceeded"
        )
        final_sql = (
            last_entry.generated_sql if last_entry.decision == "approved" else None
        )
        error_code = None
        error_message = None

    llm_model = next((entry.llm_model for entry in entries if entry.llm_model), None)
    duration_seconds = next(
        (entry.duration_seconds for entry in reversed(entries) if entry.duration_seconds is not None),
        None,
    )

    return templates.TemplateResponse(
        request,
        "audit_log_detail.html",
        {
            "request_id": request_id,
            "task_description": task_description,
            "final_status": final_status,
            "final_sql": final_sql,
            "total_iterations": len(iteration_entries),
            "llm_model": llm_model,
            "duration_display": format_duration_display(duration_seconds),
            "error_code": error_code,
            "error_message": error_message,
            "entries": iteration_entries,
            "failed_entry": failed_entry,
        },
    )
