"""Сервис первичной генерации SQL по описанию задачи."""

from typing import Protocol


class GeneratorService(Protocol):
    """Контракт генератора: текстовое описание задачи → SQL.

    Точка расширения для реальной модели Егора. Реализация подменяется через
    app/dependencies.py в зависимости от LLM_PROVIDER.
    """

    async def generate(
        self,
        task_description: str,
        db_schema: dict | None,
    ) -> str: ...


class StubGenerator:
    """Заглушка генератора. Без состояния — синглтон через Depends."""

    async def generate(
        self,
        task_description: str,
        db_schema: dict | None,
    ) -> str:
        _ = task_description, db_schema
        return "SELECT 1 -- stub"
