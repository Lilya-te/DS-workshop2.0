"""Сборка LLM-сервисов и оркестратора под выбранную конфигурацию запуска."""

from dataclasses import dataclass
from typing import Literal

from app.core.config import Settings
from app.core.logging import get_logger
from app.db.repositories.audit_repository import AuditRepository
from app.services._shared.llm_factory import build_llm_client
from app.services._shared.schema_cache import SchemaCache
from app.services.generator.generator import GeneratorService, StubGenerator
from app.services.generator.llm_generator import LLMGenerator
from app.services.judge.judge import JudgeService, StubJudge
from app.services.judge.llm_judge import LLMJudge
from app.services.orchestration import IterationOrchestrator
from app.services.repair.llm_repair import LLMRepair
from app.services.repair.repair import RepairService, StubRepair

log = get_logger("app.llm_runtime")

LlmProvider = Literal["stub", "openrouter", "ollama", "openai", "yandexgpt"]

LLM_PROVIDER_CHOICES: list[tuple[str, str]] = [
    ("stub", "Stub (без LLM, для тестов)"),
    ("openrouter", "OpenRouter"),
]

LLM_MODEL_CHOICES: list[str] = [ 
    "openai/gpt-oss-20b:free",
    "qwen/qwen3-coder-30b-a3b-instruct",
]


@dataclass(frozen=True)
class LlmRunConfig:
    provider: LlmProvider
    model: str | None = None


def resolve_audit_llm_model(config: LlmRunConfig, settings: Settings) -> str:
    """Строка модели для сохранения в audit_log."""
    if config.provider == "stub":
        return "stub"
    model = (config.model or "").strip()
    if model:
        return model
    if settings.llm_model:
        return settings.llm_model
    if settings.generator_model:
        return settings.generator_model
    return config.provider


def default_run_config(settings: Settings) -> LlmRunConfig:
    model = (
        settings.llm_model
        or settings.generator_model
        or settings.repair_model
        or settings.judge_model
    )
    return LlmRunConfig(provider=settings.llm_provider, model=model)


def _resolve_role_model(
    config: LlmRunConfig,
    settings: Settings,
    *,
    role_model: str | None,
    role_label: str,
) -> str:
    model = (config.model or "").strip() or role_model or settings.llm_model
    if not model:
        raise ValueError(
            f"Не задана модель для {role_label}. Укажите модель в форме или "
            "LLM_MODEL / *_MODEL в .env."
        )
    return model


def create_generator(
    config: LlmRunConfig,
    settings: Settings,
    schema_cache: SchemaCache,
) -> GeneratorService:
    if config.provider == "stub":
        return StubGenerator()
    model = _resolve_role_model(
        config,
        settings,
        role_model=settings.generator_model,
        role_label="генератора",
    )
    llm = build_llm_client(settings, model, provider=config.provider)
    log.info(
        "llm_runtime.generator",
        provider=config.provider,
        model=model,
    )
    return LLMGenerator(
        llm=llm,
        schema_cache=schema_cache,
        top_k_tables=settings.schema_top_k_tables,
    )


def create_judge(
    config: LlmRunConfig,
    settings: Settings,
    schema_cache: SchemaCache,
) -> JudgeService:
    if config.provider == "stub":
        return StubJudge()
    model = _resolve_role_model(
        config,
        settings,
        role_model=settings.judge_model,
        role_label="аудитора",
    )
    llm = build_llm_client(settings, model, provider=config.provider)
    return LLMJudge(
        llm=llm,
        schema_cache=schema_cache,
        top_k_tables=settings.schema_top_k_tables,
    )


def create_repair(
    config: LlmRunConfig,
    settings: Settings,
    schema_cache: SchemaCache,
) -> RepairService:
    if config.provider == "stub":
        return StubRepair()
    model = _resolve_role_model(
        config,
        settings,
        role_model=settings.repair_model,
        role_label="репаратора",
    )
    llm = build_llm_client(settings, model, provider=config.provider)
    return LLMRepair(
        llm=llm,
        schema_cache=schema_cache,
        top_k_tables=settings.schema_top_k_tables,
    )


def create_orchestrator(
    config: LlmRunConfig,
    settings: Settings,
    schema_cache: SchemaCache,
    audit_repo: AuditRepository,
) -> IterationOrchestrator:
    return IterationOrchestrator(
        generator=create_generator(config, settings, schema_cache),
        judge=create_judge(config, settings, schema_cache),
        repair=create_repair(config, settings, schema_cache),
        audit_repo=audit_repo,
        max_iterations=settings.max_iterations,
        llm_model=resolve_audit_llm_model(config, settings),
    )
