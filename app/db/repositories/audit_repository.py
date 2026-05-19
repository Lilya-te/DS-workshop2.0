"""Репозиторий аудита: запись лога итераций."""

from typing import Any

from sqlalchemy.ext.asyncio import AsyncSession

from app.db.models import AuditLog


class AuditRepository:
    """Запись итераций цикла генератор → судья → исправление в audit_log."""

    def __init__(self, session: AsyncSession) -> None:
        self._session = session

    async def record_iteration(
        self,
        *,
        request_id: str,
        iteration: int,
        task_description: str | None,
        generated_sql: str,
        audit_result: dict[str, Any],
        decision: str,
    ) -> None:
        """Добавляет запись в session; commit делает request-scoped сессия."""
        entry = AuditLog(
            request_id=request_id,
            iteration=iteration,
            task_description=task_description,
            generated_sql=generated_sql,
            audit_result=audit_result,
            decision=decision,
        )
        self._session.add(entry)
        await self._session.flush()
