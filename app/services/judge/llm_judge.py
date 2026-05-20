"""LLM-реализация аудитора SQL ('судья').

Реализует контракт JudgeService: SQL → AuditResult.

Поток работы (по аналогии с LLMGenerator):
1. Берём релевантные таблицы из SchemaCache через TableSelector.
2. Прогоняем детерминированные правила (rules.rules_audit).
3. Собираем промпт: правила безопасности + сводка от правил + сам SQL.
4. Вызываем LLM с response_format={"type": "json_object"} + retry в LLMClient.
5. Парсим JSON через Pydantic (AuditResult.model_validate_json).
6. Сливаем находки правил и LLM, сортируем по убыванию risk_score.

Если LLM упал или вернул невалидный JSON — фолбэк на чистый результат правил.
"""

from __future__ import annotations

from typing import Any

from pydantic import ValidationError

from app.core.logging import get_logger
from app.schemas.sql import AuditResult, VulnerabilityFinding
from app.services._shared.llm_client import LLMClient
from app.services._shared.schema_cache import SchemaCache
from app.services._shared.schema_parser import schema_detailed
from app.services._shared.table_selector import TableSelector
from app.services.judge.prompts import (
    build_judge_system_prompt,
    build_judge_user_prompt,
)
from app.services.judge.rules import rules_audit

log = get_logger("app.judge")


# ----------------------- слияние и сортировка -----------------------

def _merge_findings(
    rules: list[VulnerabilityFinding],
    llm: list[VulnerabilityFinding],
) -> list[VulnerabilityFinding]:
    """Объединяет находки правил и LLM, убирая дубликаты.

    Ключ дедупликации: класс уязвимости + начало explanation (первые 80 символов,
    в нижнем регистре). Правила — приоритет, LLM добавляет уникальное.
    """
    seen: set[str] = set()
    merged: list[VulnerabilityFinding] = []
    for f in list(rules) + list(llm):
        key = f"{f.vulnerability_class.value}::{f.explanation[:80].lower()}"
        if key in seen:
            continue
        seen.add(key)
        merged.append(f)
    return merged


def _sort_by_risk(findings: list[VulnerabilityFinding]) -> list[VulnerabilityFinding]:
    """По убыванию risk_score — критичное первым.

    Это удобно и пользователю в отчёте, и репаратору (в app/services/repair/prompts.py
    findings тоже сортируются по убыванию — _format_audit_feedback).
    """
    return sorted(findings, key=lambda f: f.risk_score, reverse=True)


# ----------------------- LLMJudge -----------------------

class LLMJudge:
    """Реализация JudgeService через LLM + детерминированные правила."""

    def __init__(
        self,
        *,
        llm: LLMClient,
        schema_cache: SchemaCache,
        top_k_tables: int = 5,
    ) -> None:
        self._llm = llm
        self._schema = schema_cache
        self._top_k = top_k_tables
        # Селектор строится один раз на текущей схеме; пересоздаётся при reload.
        self._selector: TableSelector | None = None
        self._selector_fingerprint: int = -1

    def _get_selector(self) -> TableSelector:
        """Лениво строит/пересоздаёт селектор, если схема изменилась."""
        tables = self._schema.all_tables()
        fingerprint = id(tables)
        if self._selector is None or fingerprint != self._selector_fingerprint:
            self._selector = TableSelector(tables)
            self._selector_fingerprint = fingerprint
        return self._selector

    async def audit(
        self,
        sql: str,
        db_schema: dict | None,
        metadata: dict[str, Any] | None = None,
    ) -> AuditResult:
        """Контракт JudgeService.audit(): SQL → AuditResult.

        db_schema из запроса игнорируем (как и генератор) — берём схему из кеша.
        Контракт оркестратора: approved ⇔ overall_risk == 0 AND findings == [].
        """
        _ = db_schema  # override-схема из запроса пока не используется

        # 1) Релевантные таблицы из общего кеша
        selector = self._get_selector()
        selected = selector.select(sql, top_k=self._top_k)
        schema_text = schema_detailed(selected)
        selected_qnames = [t.qualified_name for t in selected]

        # 2) Правила
        rules_result = rules_audit(sql, tables=selected)
        log.info(
            "audit.rules.done",
            overall_risk=rules_result.overall_risk,
            findings_count=len(rules_result.findings),
            selected_tables=selected_qnames,
        )

        # 3) LLM-судья
        system_prompt = build_judge_system_prompt(schema_text)
        user_prompt = build_judge_user_prompt(sql, rules_result)

        try:
            response = await self._llm.chat(
                system_prompt=system_prompt,
                user_prompt=user_prompt,
                response_format={"type": "json_object"},
                metadata={
                    "stage": "audit",
                    "selected_tables": selected_qnames,
                    **(metadata or {}),
                },
            )
        except Exception as e:
            # Сеть/таймауты/исчерпание retry — отдаём чистые правила.
            log.warning(
                "audit.llm.failed",
                error=f"{type(e).__name__}: {e}",
                fallback="rules",
            )
            return AuditResult(
                overall_risk=rules_result.overall_risk,
                findings=_sort_by_risk(rules_result.findings),
                summary=rules_result.summary,
            )

        # 4) Парсинг ответа LLM
        try:
            llm_result = AuditResult.model_validate_json(response.text)
        except (ValidationError, ValueError) as e:
            log.warning(
                "audit.llm.invalid_json",
                error=f"{type(e).__name__}: {e}",
                raw_excerpt=response.text[:300],
                fallback="rules",
            )
            return AuditResult(
                overall_risk=rules_result.overall_risk,
                findings=_sort_by_risk(rules_result.findings),
                summary=rules_result.summary,
            )

        log.info(
            "audit.llm.done",
            overall_risk=llm_result.overall_risk,
            findings_count=len(llm_result.findings),
            latency_seconds=response.latency_seconds,
            attempts=response.attempts,
            total_tokens=response.total_tokens,
        )

        # 5) Слияние и финальная агрегация
        merged = _merge_findings(rules_result.findings, llm_result.findings)
        if merged:
            overall_risk = max(f.risk_score for f in merged)
        else:
            overall_risk = 0

        # summary берём от LLM, если непустой; иначе от правил.
        summary = llm_result.summary.strip() or rules_result.summary

        final = AuditResult(
            overall_risk=overall_risk,
            findings=_sort_by_risk(merged),
            summary=summary,
        )

        log.info(
            "audit.done",
            overall_risk=final.overall_risk,
            findings_count=len(final.findings),
            approved=(final.overall_risk == 0 and not final.findings),
        )
        return final
