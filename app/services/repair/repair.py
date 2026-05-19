"""Сервис исправления SQL по фидбэку судьи."""

from typing import Protocol

from app.schemas.sql import AuditResult


class RepairService(Protocol):
    """Контракт репаратора: исправление SQL по замечаниям судьи.

    Точка расширения для реальной модели. Получает исходный SQL, фидбэк
    аудитора, исходную задачу и схему БД. Возвращает улучшенный SQL.
    """

    async def repair(
        self,
        *,
        original_sql: str,
        audit_feedback: AuditResult,
        task_description: str,
        db_schema: dict | None,
        iteration: int,
    ) -> str: ...


class StubRepair:
    """Заглушка репаратора: дописывает маркер итерации к предыдущему SQL.

    Без состояния на инстансе — номер итерации приходит в аргументах.
    Судья по маркеру -- iteration в SQL понимает, что фидбэк дошёл, и
    одобряет запрос. Так цикл на стабах сходится за 2 итерации.
    """

    async def repair(
        self,
        *,
        original_sql: str,
        audit_feedback: AuditResult,
        task_description: str,
        db_schema: dict | None,
        iteration: int,
    ) -> str:
        _ = audit_feedback, task_description, db_schema
        return f"{original_sql}\n-- iteration {iteration}"
