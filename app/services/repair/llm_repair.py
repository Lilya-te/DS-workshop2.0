"""LLM-реализация репаратора SQL.

Реализует контракт RepairService: исправляет SQL по фидбэку аудитора.

Поток работы:
1. Подбираем релевантные таблицы под исходную задачу (тот же селектор,
   что у генератора).
2. Собираем retry-промпт: системные правила + задача + прошлый SQL + фидбэк.
3. Вызываем LLM (с retry на уровне LLMClient).
4. Чистим ответ от markdown-обёрток.
5. Возвращаем исправленный SQL.
"""

from __future__ import annotations

from typing import Any

from app.core.logging import get_logger
from app.schemas.sql import AuditResult
from app.services._shared.llm_client import LLMClient
from app.services._shared.schema_cache import SchemaCache
from app.services._shared.schema_parser import schema_detailed
from app.services._shared.table_selector import HybridTableSelector
from app.services.generator.llm_generator import clean_sql, validate_sql
from app.services.repair.prompts import (
    build_repair_system_prompt,
    build_repair_user_prompt,
)

log = get_logger("app.repair")


class LLMRepair:
    """Реализация RepairService через LLM."""

    def __init__(
        self,
        *,
        llm: LLMClient,
        schema_cache: SchemaCache,
        top_k_tables: int = 5,
        emb_model=None,
    ) -> None:
        self._llm = llm
        self._schema = schema_cache
        self._top_k = top_k_tables
        self._emb_model = emb_model
        self._selector: HybridTableSelector | None = None
        self._selector_fingerprint: int = -1

    def _get_selector(self) -> HybridTableSelector:
        """Лениво строит/пересоздаёт селектор при смене схемы."""
        tables = self._schema.all_tables()
        fingerprint = id(tables)
        if self._selector is None or fingerprint != self._selector_fingerprint:
            self._selector = HybridTableSelector(tables, emb_model=self._emb_model)
            self._selector_fingerprint = fingerprint
        return self._selector

    async def repair(
        self,
        *,
        original_sql: str,
        audit_feedback: AuditResult,
        task_description: str,
        db_schema: dict | None,
        iteration: int,
    ) -> str:
        """Контракт RepairService: исправляет SQL по фидбэку аудитора."""
        _ = db_schema  # override-схема пока не используется (берём из кеша)

        selector = self._get_selector()
        selected = selector.select(task_description, top_k=self._top_k)
        schema_text = schema_detailed(selected)
        selected_qnames = [t.qualified_name for t in selected]

        system_prompt = build_repair_system_prompt(schema_text)
        user_prompt = build_repair_user_prompt(
            task_description=task_description,
            previous_sql=original_sql,
            audit=audit_feedback,
            iteration=iteration,
        )

        response = await self._llm.chat(
            system_prompt=system_prompt,
            user_prompt=user_prompt,
            metadata={
                "stage": "repair",
                "iteration": iteration,
                "selected_tables": selected_qnames,
            },
        )

        sql = clean_sql(response.text)
        validation = validate_sql(sql)

        log.info(
            "repair.done",
            iteration=iteration,
            sql_length=len(sql),
            blocking=validation.blocking,
            warnings_count=len(validation.warnings),
            overall_risk_before=audit_feedback.overall_risk,
            findings_before=len(audit_feedback.findings),
        )

        return sql