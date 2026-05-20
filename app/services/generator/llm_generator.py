"""LLM-реализация генератора SQL.

Реализует контракт GeneratorService: текстовое описание задачи -> SQL.

Поток работы:
1. Берём релевантные таблицы из SchemaCache через TableSelector.
2. Собираем системный промпт с описанием этих таблиц.
3. Вызываем LLM (с retry на уровне LLMClient).
4. Чистим ответ от markdown-обёрток.
5. Прогоняем эвристические валидации.
6. Возвращаем SQL (контракт) + детали доступны через generate_detailed().
"""

from __future__ import annotations

import re
from dataclasses import asdict, dataclass, field
from typing import Any

from app.core.logging import get_logger
from app.services._shared.llm_client import LLMClient
from app.services._shared.schema_cache import SchemaCache
from app.services._shared.schema_parser import schema_detailed
from app.services._shared.table_selector import TableSelector
from app.services.generator.prompts import build_system_prompt, build_user_prompt

log = get_logger("app.generator")


# ----------------------- структурированный результат -----------------------

@dataclass
class GenerationStats:
    """Статистика вызова -- для метрик и отчёта."""
    latency_seconds: float
    prompt_tokens: int | None
    completion_tokens: int | None
    total_tokens: int | None
    attempts: int
    model: str
    provider: str


@dataclass
class GenerationValidation:
    """Результаты эвристических проверок сгенерированного SQL."""
    passed: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    blocking: bool = False  # True -> SQL заведомо непригоден, нужен повтор


@dataclass
class GenerationResult:
    """Полный структурированный результат генерации."""
    sql: str
    raw_response: str
    selected_tables: list[str]
    validation: GenerationValidation
    stats: GenerationStats

    def to_dict(self) -> dict[str, Any]:
        return {
            "sql": self.sql,
            "raw_response": self.raw_response,
            "selected_tables": self.selected_tables,
            "validation": asdict(self.validation),
            "stats": asdict(self.stats),
        }


# ----------------------- очистка SQL -----------------------

_CODE_FENCE_RE = re.compile(r"```(?:sql)?\s*(.*?)\s*```", re.IGNORECASE | re.DOTALL)


def clean_sql(raw: str) -> str:
    """Убирает markdown-обёртки и преамбулы из ответа модели."""
    text = raw.strip()
    # Если есть ```sql ... ``` -- берём содержимое первого блока
    m = _CODE_FENCE_RE.search(text)
    if m:
        text = m.group(1).strip()
    # Иногда модель пишет "SQL:" или подобное перед запросом
    text = re.sub(r"^(SQL|Запрос|Ответ)\s*:\s*", "", text, flags=re.IGNORECASE).strip()
    return text


# ----------------------- эвристические валидации -----------------------

def validate_sql(sql: str) -> GenerationValidation:
    """Простые проверки SQL по регуляркам. Не заменяют аудитора,
    но ловят очевидный брак до того, как он уйдёт дальше."""
    v = GenerationValidation()
    s = sql.strip()
    upper = s.upper()

    # Блокирующие проблемы -- SQL заведомо непригоден
    if not s:
        v.blocking = True
        v.warnings.append("Пустой ответ модели.")
        return v

    if not re.match(r"^\s*(SELECT|INSERT|UPDATE|DELETE|WITH)\b", upper):
        v.blocking = True
        v.warnings.append("Ответ не начинается с SQL-оператора (SELECT/INSERT/UPDATE/DELETE/WITH).")

    # Эвристики безопасности (не блокирующие -- это работа аудитора, но фиксируем)
    if re.search(r"SELECT\s+\*", upper):
        v.warnings.append("Используется SELECT * -- стоит перечислить колонки явно.")
    else:
        v.passed.append("Нет SELECT *.")

    has_update = bool(re.search(r"\bUPDATE\b", upper))
    has_delete = bool(re.search(r"\bDELETE\b", upper))
    has_where = bool(re.search(r"\bWHERE\b", upper))
    if (has_update or has_delete) and not has_where:
        v.warnings.append("UPDATE/DELETE без WHERE -- модификация всей таблицы.")
    elif has_update or has_delete:
        v.passed.append("UPDATE/DELETE содержит WHERE.")

    if re.search(r"\$\d+", s):
        v.passed.append("Используется параметризация ($N).")

    return v


# ----------------------- генератор -----------------------

class LLMGenerator:
    """Реализация GeneratorService через LLM."""

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
        # Селектор строится один раз на текущей схеме.
        # При reload схемы пересоздаётся (см. _get_selector).
        self._selector: TableSelector | None = None
        self._selector_fingerprint: int = -1

    def _get_selector(self) -> TableSelector:
        """Лениво строит/пересоздаёт селектор, если схема изменилась."""
        tables = self._schema.all_tables()
        fingerprint = id(tables)  # меняется при reload (новый список)
        if self._selector is None or fingerprint != self._selector_fingerprint:
            self._selector = TableSelector(tables)
            self._selector_fingerprint = fingerprint
        return self._selector

    async def generate_detailed(
        self,
        task_description: str,
        db_schema: dict | None = None,
        metadata: dict[str, Any] | None = None,
    ) -> GenerationResult:
        """Полная генерация со структурированным результатом."""
        _ = db_schema  # override-схема из запроса пока не используется (берём из кеша)

        selector = self._get_selector()
        selected = selector.select(task_description, top_k=self._top_k)
        schema_text = schema_detailed(selected)
        selected_qnames = [t.qualified_name for t in selected]

        system_prompt = build_system_prompt(schema_text)
        user_prompt = build_user_prompt(task_description)

        response = await self._llm.chat(
            system_prompt=system_prompt,
            user_prompt=user_prompt,
            metadata={
                "stage": "generate",
                "selected_tables": selected_qnames,
                **(metadata or {}),
            },
        )

        sql = clean_sql(response.text)
        validation = validate_sql(sql)

        stats = GenerationStats(
            latency_seconds=response.latency_seconds,
            prompt_tokens=response.prompt_tokens,
            completion_tokens=response.completion_tokens,
            total_tokens=response.total_tokens,
            attempts=response.attempts,
            model=response.model,
            provider=response.provider,
        )

        log.info(
            "generate.done",
            sql_length=len(sql),
            blocking=validation.blocking,
            warnings_count=len(validation.warnings),
            selected_tables=selected_qnames,
        )

        return GenerationResult(
            sql=sql,
            raw_response=response.text,
            selected_tables=selected_qnames,
            validation=validation,
            stats=stats,
        )

    async def generate(
        self,
        task_description: str,
        db_schema: dict | None,
    ) -> str:
        """Контракт GeneratorService: возвращает только SQL-строку.

        Внутри использует generate_detailed(); оркестратору отдаёт SQL.
        Детали (статистика, валидации) уходят в лог.
        """
        result = await self.generate_detailed(task_description, db_schema)
        return result.sql