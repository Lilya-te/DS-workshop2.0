"""HTML-интерфейс генерации SQL."""

from pathlib import Path

from fastapi import APIRouter, Form, Query, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

from app.db.repositories.audit_repository import AuditRepository
from app.dependencies import OrchestratorDep, SessionDep

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
    session: SessionDep,
    page: int = Query(1, ge=1),
) -> HTMLResponse:
    repo = AuditRepository(session)
    offset = (page - 1) * AUDIT_LOG_PAGE_SIZE
    entries, total = await repo.list_page(offset=offset, limit=AUDIT_LOG_PAGE_SIZE)

    if total == 0:
        total_pages = 1
    else:
        total_pages = (total + AUDIT_LOG_PAGE_SIZE - 1) // AUDIT_LOG_PAGE_SIZE
        if page > total_pages:
            page = total_pages
            offset = (page - 1) * AUDIT_LOG_PAGE_SIZE
            entries, total = await repo.list_page(
                offset=offset, limit=AUDIT_LOG_PAGE_SIZE
            )

    return templates.TemplateResponse(
        request,
        "audit_log.html",
        {
            "entries": entries,
            "page": page,
            "total_pages": total_pages,
            "total": total,
            "page_size": AUDIT_LOG_PAGE_SIZE,
        },
    )
