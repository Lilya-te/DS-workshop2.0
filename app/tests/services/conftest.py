"""Общие фикстуры и хелперы для юнит-тестов сервисного слоя."""

from __future__ import annotations

import asyncio
from typing import Any

from app.services._shared.llm_client import LLMResponse
from app.services._shared.schema_cache import SchemaCache

MINIMAL_DDL = """
CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(200)
);
"""

SENSITIVE_DDL = """
CREATE TABLE public.accounts (
    id bigint NOT NULL,
    password_hash character varying(200)
);
"""


def run_async(coro):  # type: ignore[no-untyped-def]
    """Запускает корутину без pytest-asyncio."""
    return asyncio.run(coro)


def schema_cache_from_ddl(ddl: str = MINIMAL_DDL) -> SchemaCache:
    cache = SchemaCache()
    cache.load_from_text(ddl, source_label="test")
    return cache


class FakeLLM:
    """Подмена LLMClient для generator/judge/repair."""

    def __init__(
        self,
        text: str,
        *,
        raise_error: bool = False,
        response_format: dict[str, str] | None = None,
    ) -> None:
        self.text = text
        self.raise_error = raise_error
        self.expected_response_format = response_format
        self.calls: list[dict[str, Any]] = []

    async def chat(
        self,
        *,
        system_prompt: str,
        user_prompt: str,
        response_format: dict[str, str] | None = None,
        metadata: dict[str, Any] | None = None,
    ) -> LLMResponse:
        if self.raise_error:
            raise RuntimeError("LLM unavailable")
        self.calls.append(
            {
                "system_prompt": system_prompt,
                "user_prompt": user_prompt,
                "response_format": response_format,
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
