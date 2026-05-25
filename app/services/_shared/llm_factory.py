"""Фабрика LLM-клиентов из настроек приложения.

Резолвит base_url и api_key по имени провайдера, создаёт LLMClient
с нужной моделью. Используется в app/dependencies.py для генератора,
репаратора и аудитора.
"""

from __future__ import annotations

from app.core.config import Settings
from app.services._shared.llm_client import LLMClient

# Базовые URL для известных провайдеров.
PROVIDER_BASE_URLS: dict[str, str] = {
    "openrouter": "https://openrouter.ai/api/v1",
    "ollama": "http://localhost:11434/v1",
    "openai": "https://api.openai.com/v1",
}


def build_llm_client(
    settings: Settings,
    model: str,
    *,
    provider: str | None = None,
) -> LLMClient:
    """Создаёт LLMClient для заданной модели по настройкам приложения.

    base_url берётся из llm_base_url (если задан явно) или из реестра
    по имени провайдера. api_key -- из llm_api_key (для ollama не обязателен).
    """
    provider = provider or settings.llm_provider

    # base_url: явный override или из реестра
    base_url = settings.llm_base_url or PROVIDER_BASE_URLS.get(provider)
    if not base_url:
        raise ValueError(
            f"Не удалось определить base_url для провайдера {provider!r}. "
            f"Задай LLM_BASE_URL в .env."
        )

    # api_key: для ollama допустим фиктивный
    api_key = settings.llm_api_key
    if not api_key:
        if provider == "ollama":
            api_key = "ollama"
        else:
            raise ValueError(
                f"Не задан LLM_API_KEY для провайдера {provider!r}."
            )

    return LLMClient(
        base_url=base_url,
        api_key=api_key,
        model=model,
        provider_name=provider,
        temperature=settings.llm_temperature,
        max_tokens=settings.llm_max_tokens,
        timeout=settings.llm_timeout,
        max_retries=settings.llm_max_retries,
    )