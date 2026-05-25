"""Репозиторий аудита: запись лога итераций."""

from dataclasses import dataclass
from datetime import datetime
from typing import Any

from sqlalchemy import func, select
from sqlalchemy.ext.asyncio import AsyncSession

from app.db.models import AuditLog


@dataclass(frozen=True)
class AuditRequestGroup:
    """Сводка по одному request_id для списка журнала."""

    request_id: str
    task_description: str | None
    total_iterations: int
    final_status: str
    last_created_at: datetime


def _final_status_from_decision(decision: str) -> str:
    return "approved" if decision == "approved" else "iteration_limit_exceeded"


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

    async def list_request_groups_page(
        self, *, offset: int, limit: int
    ) -> tuple[list[AuditRequestGroup], int]:
        """Страница сгруппированных запросов (новые первые) и их общее число."""
        total_result = await self._session.execute(
            select(func.count(func.distinct(AuditLog.request_id)))
        )
        total = total_result.scalar_one()

        group_keys = (
            select(
                AuditLog.request_id,
                func.max(AuditLog.created_at).label("last_created_at"),
                func.max(AuditLog.iteration).label("total_iterations"),
                func.max(AuditLog.task_description).label("task_description"),
            )
            .group_by(AuditLog.request_id)
            .order_by(func.max(AuditLog.created_at).desc())
            .offset(offset)
            .limit(limit)
            .subquery()
        )

        rows_result = await self._session.execute(
            select(
                group_keys.c.request_id,
                group_keys.c.task_description,
                group_keys.c.total_iterations,
                group_keys.c.last_created_at,
                AuditLog.decision,
            ).join(
                AuditLog,
                (AuditLog.request_id == group_keys.c.request_id)
                & (AuditLog.iteration == group_keys.c.total_iterations),
            )
        )

        groups = [
            AuditRequestGroup(
                request_id=row.request_id,
                task_description=row.task_description,
                total_iterations=row.total_iterations,
                final_status=_final_status_from_decision(row.decision),
                last_created_at=row.last_created_at,
            )
            for row in rows_result.all()
        ]
        return groups, total

    async def get_by_request_id(self, request_id: str) -> list[AuditLog]:
        """Все итерации одного запроса по порядку."""
        rows_result = await self._session.execute(
            select(AuditLog)
            .where(AuditLog.request_id == request_id)
            .order_by(AuditLog.iteration.asc())
        )
        return list(rows_result.scalars().all())
