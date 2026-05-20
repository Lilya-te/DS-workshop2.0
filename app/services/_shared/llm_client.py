"""Асинхронный LLM-клиент для OpenAI-совместимых провайдеров.

Используется генератором, аудитором и репаратором. Поддерживает:
- OpenRouter (облако): https://openrouter.ai/api/v1
- Ollama (локально): http://localhost:11434/v1
- Любой другой OpenAI-compatible endpoint.

Особенности:
- Асинхронный (AsyncOpenAI) — не блокирует event loop FastAPI.
- Retry с экспоненциальным backoff на 429 (rate limit) и временные ошибки.
- Опциональный structured output через response_format.
- Логирование вызовов через structlog (request_id подхватывается из contextvars).
"""

from __future__ import annotations

import asyncio
import time
from dataclasses import dataclass, field
from typing import Any

from openai import (
    APIConnectionError,
    APITimeoutError,
    AsyncOpenAI,
    InternalServerError,
    RateLimitError,
)

from app.core.logging import get_logger

log = get_logger("app.llm_client")

# Ошибки, при которых имеет смысл повторить запрос.
RETRYABLE_ERRORS = (
    RateLimitError,       # 429 — превышен лимит запросов
    APITimeoutError,      # таймаут
    APIConnectionError,   # сетевые проблемы
    InternalServerError,  # 5xx на стороне провайдера
)


@dataclass
class LLMResponse:
    """Результат вызова LLM с метаданными для статистики."""

    text: str
    model: str
    provider: str
    latency_seconds: float
    prompt_tokens: int | None = None
    completion_tokens: int | None = None
    total_tokens: int | None = None
    attempts: int = 1
    metadata: dict[str, Any] = field(default_factory=dict)


class LLMClient:
    """Асинхронный клиент к OpenAI-совместимому LLM-провайдеру.

    Один экземпляр = одна модель + один провайдер. Для разных моделей
    (например, генератор и аудитор на разных моделях) создаются разные клиенты.
    """

    def __init__(
        self,
        *,
        base_url: str,
        api_key: str,
        model: str,
        provider_name: str = "custom",
        temperature: float = 0.2,
        max_tokens: int | None = 1024,
        timeout: float = 60.0,
        max_retries: int = 4,
        base_backoff: float = 1.0,
    ) -> None:
        self.model = model
        self.provider_name = provider_name
        self.temperature = temperature
        self.max_tokens = max_tokens
        self.max_retries = max_retries
        self.base_backoff = base_backoff
        self._client = AsyncOpenAI(
            base_url=base_url,
            api_key=api_key,
            timeout=timeout,
        )

    async def chat(
        self,
        *,
        user_prompt: str,
        system_prompt: str = "",
        temperature: float | None = None,
        max_tokens: int | None = None,
        response_format: dict[str, Any] | None = None,
        metadata: dict[str, Any] | None = None,
    ) -> LLMResponse:
        """Один запрос к LLM с retry. Возвращает LLMResponse с метаданными.

        response_format: например {"type": "json_object"} для structured output.
        metadata: произвольные данные для логирования (test_case_id, iteration и т.п.).
        """
        messages: list[dict[str, str]] = []
        if system_prompt:
            messages.append({"role": "system", "content": system_prompt})
        messages.append({"role": "user", "content": user_prompt})

        kwargs: dict[str, Any] = {
            "model": self.model,
            "messages": messages,
            "temperature": temperature if temperature is not None else self.temperature,
            "max_tokens": max_tokens if max_tokens is not None else self.max_tokens,
        }
        if response_format is not None:
            kwargs["response_format"] = response_format

        started = time.monotonic()
        last_error: Exception | None = None

        for attempt in range(1, self.max_retries + 1):
            try:
                response = await self._client.chat.completions.create(**kwargs)
                latency = time.monotonic() - started
                text = response.choices[0].message.content or ""
                usage = response.usage

                log.info(
                    "llm.call.success",
                    provider=self.provider_name,
                    model=self.model,
                    attempt=attempt,
                    latency_seconds=round(latency, 3),
                    total_tokens=usage.total_tokens if usage else None,
                    **(metadata or {}),
                )

                return LLMResponse(
                    text=text,
                    model=self.model,
                    provider=self.provider_name,
                    latency_seconds=round(latency, 3),
                    prompt_tokens=usage.prompt_tokens if usage else None,
                    completion_tokens=usage.completion_tokens if usage else None,
                    total_tokens=usage.total_tokens if usage else None,
                    attempts=attempt,
                    metadata=metadata or {},
                )

            except RETRYABLE_ERRORS as exc:
                last_error = exc
                if attempt >= self.max_retries:
                    break
                # Экспоненциальный backoff: 1s, 2s, 4s, 8s...
                backoff = self.base_backoff * (2 ** (attempt - 1))
                log.warning(
                    "llm.call.retry",
                    provider=self.provider_name,
                    model=self.model,
                    attempt=attempt,
                    error=f"{type(exc).__name__}: {exc}",
                    backoff_seconds=backoff,
                    **(metadata or {}),
                )
                await asyncio.sleep(backoff)

            except Exception as exc:
                # Невосстановимая ошибка — не ретраим, сразу пробрасываем
                latency = time.monotonic() - started
                log.error(
                    "llm.call.failed",
                    provider=self.provider_name,
                    model=self.model,
                    attempt=attempt,
                    error=f"{type(exc).__name__}: {exc}",
                    latency_seconds=round(latency, 3),
                    **(metadata or {}),
                )
                raise

        # Исчерпали все попытки на retryable-ошибках
        latency = time.monotonic() - started
        log.error(
            "llm.call.exhausted",
            provider=self.provider_name,
            model=self.model,
            attempts=self.max_retries,
            error=f"{type(last_error).__name__}: {last_error}" if last_error else "unknown",
            latency_seconds=round(latency, 3),
            **(metadata or {}),
        )
        raise RuntimeError(
            f"LLM call failed after {self.max_retries} attempts: {last_error}"
        )