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

import asyncio
from typing import Any

from pydantic import ValidationError

from app.core.logging import get_logger
from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding
from app.db.session import engine
from app.services._shared.llm_client import LLMClient
from app.services._shared.schema_cache import SchemaCache
from app.services._shared.schema_parser import schema_detailed
from app.services._shared.table_selector import HybridTableSelector
from app.services.judge.prompts import (
    build_judge_system_prompt,
    build_judge_user_prompt,
)
from app.services.judge.rules import rules_audit
from sqlalchemy import text

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
        db_check_enabled: bool = False,
        db_check_timeout: float = 2.5,
    ) -> None:
        self._llm = llm
        self._schema = schema_cache
        self._top_k = top_k_tables
        self._db_check_enabled = db_check_enabled
        self._db_check_timeout = db_check_timeout
        # Селектор строится один раз на текущей схеме; пересоздаётся при reload.
        self._selector: HybridTableSelector | None = None
        self._selector_fingerprint: int = -1

    async def _db_explain_check(self, sql: str) -> str | None:
        """Пытается прогнать EXPLAIN в PostgreSQL.

        Возвращает None, если всё ок. Иначе — текст ошибки (коротко),
        который можно вложить в finding.

        Важно:
        - EXPLAIN не выполняет запрос, а только строит план;
        - выполняем в отдельном соединении без commit;
        - защищаемся от multi-statement (наивная проверка).
        """
        if not self._db_check_enabled:
            return None

        parts = [p.strip() for p in sql.strip().split(";") if p.strip()]
        if len(parts) != 1:
            return "Обнаружено несколько SQL-операторов (multi-statement). Разрешён только один оператор."

        stmt = parts[0]
        explain_sql = f"EXPLAIN {stmt}"

        try:
            async with engine.connect() as conn:
                await asyncio.wait_for(
                    conn.execute(text(explain_sql)),
                    timeout=self._db_check_timeout,
                )
        except TimeoutError:
            return f"Таймаут проверки EXPLAIN (>{self._db_check_timeout:.1f}s)."
        except Exception as e:
            msg = str(e).replace("\n", " ").strip()
            return msg[:300]

        return None

    def _get_selector(self) -> HybridTableSelector:
        """Лениво строит/пересоздаёт селектор, если схема изменилась.

        Пока без эмбеддингов (emb_model=None) -- поведение эквивалентно
        лексическому TableSelector. Семантику можно включить, прокинув
        emb_model из llm_runtime (как у генератора/репаратора).
        """
        tables = self._schema.all_tables()
        fingerprint = id(tables)
        if self._selector is None or fingerprint != self._selector_fingerprint:
            self._selector = HybridTableSelector(tables, emb_model=None)
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

        # 2.1) Опциональная проверка в PostgreSQL через EXPLAIN
        db_error = await self._db_explain_check(sql)
        if db_error:
            rules_result.findings.append(
                VulnerabilityFinding(
                    vulnerability_class=VulnerabilityClass.SQL_VALIDATION_ERROR,
                    risk_score=8,
                    explanation=(
                        "Запрос не проходит проверку в PostgreSQL (EXPLAIN вернул ошибку). "
                        f"Текст ошибки: {db_error}"
                    ),
                    suggested_fix="Исправь SQL под синтаксис PostgreSQL так, чтобы EXPLAIN выполнялся без ошибок.",
                )
            )
            rules_result.overall_risk = max(
                rules_result.overall_risk, 8
            )
            rules_result.summary = (
                "Обнаружена ошибка валидации SQL на PostgreSQL (EXPLAIN). "
                + rules_result.summary
            )

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
