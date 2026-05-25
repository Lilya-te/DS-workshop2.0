"""Тесты сборки LLM-сервисов под конфигурацию запуска."""

from app.core.config import Settings
from app.services.generator.generator import StubGenerator
from app.services.generator.llm_generator import LLMGenerator
from app.services.judge.judge import StubJudge
from app.services.llm_runtime import (
    LlmRunConfig,
    create_generator,
    default_run_config,
    resolve_audit_llm_model,
)
from app.services.repair.repair import StubRepair
from app.tests.services.conftest import schema_cache_from_ddl


def test_default_run_config_uses_settings_provider() -> None:
    settings = Settings(llm_provider="openrouter", llm_model="test/model")
    config = default_run_config(settings)

    assert config.provider == "openrouter"
    assert config.model == "test/model"


def test_create_generator_returns_stub_for_stub_provider() -> None:
    settings = Settings(llm_provider="stub")
    cache = schema_cache_from_ddl()

    generator = create_generator(
        LlmRunConfig(provider="stub"),
        settings,
        cache,
    )

    assert isinstance(generator, StubGenerator)


def test_resolve_audit_llm_model_for_stub_and_config() -> None:
    settings = Settings(llm_provider="openrouter", llm_model="env/model")

    assert resolve_audit_llm_model(LlmRunConfig(provider="stub"), settings) == "stub"
    assert (
        resolve_audit_llm_model(
            LlmRunConfig(provider="openrouter", model="form/model"),
            settings,
        )
        == "form/model"
    )
    assert (
        resolve_audit_llm_model(LlmRunConfig(provider="openrouter"), settings)
        == "env/model"
    )


def test_create_generator_passes_form_model_to_llm_client() -> None:
    """Модель из формы имеет приоритет над GENERATOR_MODEL / LLM_MODEL в .env."""
    settings = Settings(
        llm_provider="openrouter",
        llm_api_key="test-key",
        llm_model="env/model",
        generator_model="env/generator-model",
    )
    selected = "openai/gpt-oss-20b:free"
    generator = create_generator(
        LlmRunConfig(provider="openrouter", model=selected),
        settings,
        schema_cache_from_ddl(),
    )

    assert isinstance(generator, LLMGenerator)
    assert generator._llm.model == selected


def test_create_generator_requires_model_for_llm_provider() -> None:
    settings = Settings(llm_provider="openrouter", llm_api_key="key", llm_model=None)
    cache = schema_cache_from_ddl()

    try:
        create_generator(LlmRunConfig(provider="openrouter"), settings, cache)
    except ValueError as exc:
        assert "генератора" in str(exc)
    else:
        raise AssertionError("ожидался ValueError")
