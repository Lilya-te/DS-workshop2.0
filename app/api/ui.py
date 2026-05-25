"""HTML-интерфейс генерации SQL."""

from pathlib import Path

from fastapi import APIRouter, Form, HTTPException, Query, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.dependencies import AuditRepoDep, OrchestratorDep

AUDIT_LOG_PAGE_SIZE = 100

router = APIRouter(tags=["ui"], include_in_schema=False)

_templates_dir = Path(__file__).resolve().parent.parent / "templates"
templates = Jinja2Templates(directory=str(_templates_dir))


@router.get("/", response_class=HTMLResponse)
async def index(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(
        request,
        "index.html",
        {"task_description": "", "result": None},
    )


@router.post("/", response_class=HTMLResponse)
async def generate_form(
    request: Request,
    orchestrator: OrchestratorDep,
    task_description: str = Form(..., min_length=1),
) -> HTMLResponse:
    result = await orchestrator.run(
        task_description=task_description,
        db_schema=None,
    )
    return templates.TemplateResponse(
        request,
        "index.html",
        {
            "task_description": task_description,
            "result": result,
        },
    )


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
    last_entry = entries[-1]
    final_status = (
        "approved"
        if last_entry.decision == "approved"
        else "iteration_limit_exceeded"
    )
    final_sql = (
        last_entry.generated_sql if last_entry.decision == "approved" else None
    )

    return templates.TemplateResponse(
        request,
        "audit_log_detail.html",
        {
            "request_id": request_id,
            "task_description": task_description,
            "final_status": final_status,
            "final_sql": final_sql,
            "total_iterations": len(entries),
            "entries": entries,
        },
    )
