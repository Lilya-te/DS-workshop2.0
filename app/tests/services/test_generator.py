"""Юнит-тесты сервиса генератора SQL."""

from __future__ import annotations

import asyncio
from typing import Any

import pytest

from app.services._shared.llm_client import LLMResponse
from app.services._shared.schema_cache import SchemaCache
from app.services.generator.generator import StubGenerator
from app.services.generator.llm_generator import (
    LLMGenerator,
    clean_sql,
    validate_sql,
)
from app.services.generator.prompts import build_system_prompt, build_user_prompt

MINIMAL_DDL = """
CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(200)
);
"""


def _run(coro):  # type: ignore[no-untyped-def]
    """Запускает корутину без pytest-asyncio."""
    return asyncio.run(coro)


# ----------------------- StubGenerator -----------------------


def test_stub_generator_returns_fixed_sql() -> None:
    async def _case() -> None:
        generator = StubGenerator()
        sql = await generator.generate("любая задача", db_schema=None)
        assert sql == "SELECT 1 -- stub"

    _run(_case())


def test_stub_generator_ignores_schema() -> None:
    async def _case() -> None:
        generator = StubGenerator()
        sql = await generator.generate("задача", db_schema={"tables": []})
        assert sql == "SELECT 1 -- stub"

    _run(_case())


# ----------------------- clean_sql -----------------------


@pytest.mark.parametrize(
    ("raw", "expected"),
    [
        ("SELECT 1", "SELECT 1"),
        ("```sql\nSELECT id FROM users\n```", "SELECT id FROM users"),
        ("SQL: SELECT 1", "SELECT 1"),
        ("Запрос: SELECT 1", "SELECT 1"),
    ],
)
def test_clean_sql_strips_wrappers(raw: str, expected: str) -> None:
    assert clean_sql(raw) == expected


# ----------------------- validate_sql -----------------------


def test_validate_sql_empty_is_blocking() -> None:
    result = validate_sql("")

    assert result.blocking is True
    assert "Пустой ответ" in result.warnings[0]


def test_validate_sql_non_sql_prefix_is_blocking() -> None:
    result = validate_sql("это не запрос")

    assert result.blocking is True


def test_validate_sql_select_star_warns() -> None:
    result = validate_sql("SELECT * FROM users")

    assert result.blocking is False
    assert any("SELECT *" in w for w in result.warnings)


def test_validate_sql_update_without_where_warns() -> None:
    result = validate_sql("UPDATE users SET email = 'x'")

    assert any("WHERE" in w for w in result.warnings)


def test_validate_sql_update_with_where_passes() -> None:
    result = validate_sql("UPDATE users SET email = 'x' WHERE id = $1")

    assert "UPDATE/DELETE содержит WHERE." in result.passed
    assert "Используется параметризация ($N)." in result.passed


def test_validate_sql_valid_select_passes() -> None:
    result = validate_sql("SELECT id, email FROM users WHERE id = $1 LIMIT 10")

    assert result.blocking is False
    assert "Нет SELECT *." in result.passed


# ----------------------- prompts -----------------------


def test_build_system_prompt_includes_schema() -> None:
    prompt = build_system_prompt("TABLE users (id bigint)")

    assert "TABLE users (id bigint)" in prompt
    assert "PostgreSQL" in prompt


def test_build_user_prompt_strips_whitespace() -> None:
    assert build_user_prompt("  вывести пользователей  ") == "вывести пользователей"


# ----------------------- LLMGenerator (mock LLM) -----------------------


class _FakeLLM:
    """Подмена LLMClient: возвращает заранее заданный ответ."""

    def __init__(self, text: str) -> None:
        self.text = text
        self.calls: list[dict[str, Any]] = []

    async def chat(
        self,
        *,
        system_prompt: str,
        user_prompt: str,
        metadata: dict[str, Any] | None = None,
    ) -> LLMResponse:
        self.calls.append(
            {
                "system_prompt": system_prompt,
                "user_prompt": user_prompt,
                "metadata": metadata,
            }
        )
        return LLMResponse(
            text=self.text,
            model="test-model",
            provider="test",
            latency_seconds=0.01,
            prompt_tokens=10,
            completion_tokens=5,
            total_tokens=15,
            attempts=1,
        )


def _schema_cache_with_users() -> SchemaCache:
    cache = SchemaCache()
    cache.load_from_text(MINIMAL_DDL, source_label="test")
    return cache


def test_llm_generator_generate_returns_cleaned_sql() -> None:
    async def _case() -> None:
        fake_llm = _FakeLLM("```sql\nSELECT id FROM public.users LIMIT 10\n```")
        generator = LLMGenerator(
            llm=fake_llm,
            schema_cache=_schema_cache_with_users(),
            top_k_tables=3,
        )

        sql = await generator.generate("список пользователей", None)

        assert sql == "SELECT id FROM public.users LIMIT 10"
        assert len(fake_llm.calls) == 1
        assert fake_llm.calls[0]["user_prompt"] == "список пользователей"
        assert "public.users" in fake_llm.calls[0]["system_prompt"]

    _run(_case())


def test_llm_generator_generate_detailed_includes_validation() -> None:
    async def _case() -> None:
        fake_llm = _FakeLLM("SELECT * FROM public.users")
        generator = LLMGenerator(
            llm=fake_llm,
            schema_cache=_schema_cache_with_users(),
            top_k_tables=3,
        )

        result = await generator.generate_detailed("все пользователи", None)

        assert result.sql == "SELECT * FROM public.users"
        assert result.stats.model == "test-model"
        assert result.stats.provider == "test"
        assert result.validation.blocking is False
        assert any("SELECT *" in w for w in result.validation.warnings)
        assert isinstance(result.selected_tables, list)

    _run(_case())


def test_llm_generator_blocking_validation_on_garbage_response() -> None:
    async def _case() -> None:
        fake_llm = _FakeLLM("не SQL")
        generator = LLMGenerator(
            llm=fake_llm,
            schema_cache=_schema_cache_with_users(),
        )

        result = await generator.generate_detailed("задача", None)

        assert result.validation.blocking is True

    _run(_case())
