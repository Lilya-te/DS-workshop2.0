"""Роутер аудита SQL: разовая проверка без генерации."""

from fastapi import APIRouter

from app.dependencies import JudgeDep
from app.schemas.sql import AuditRequest, AuditResult

router = APIRouter()


@router.post("/audit", response_model=AuditResult)
async def audit_sql(
    payload: AuditRequest,
    judge: JudgeDep,
) -> AuditResult:
    return await judge.audit(payload.sql, payload.db_schema)
