"""Общие FastAPI-зависимости (DI).

Точки расширения для коллег:
- get_generator — реальная модель Егора (LLM_PROVIDER != "stub");
- get_judge — реальная модель Саши (LLM_PROVIDER != "stub");
- get_repair — реальный репаратор (LLM_PROVIDER != "stub").

Заглушки stateless и отдаются как синглтоны: безопасно шарить между
параллельными запросами. Реальные реализации при необходимости можно
переключить на request-scoped (Depends без lru_cache).
"""

from functools import lru_cache
from typing import Annotated

from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.config import Settings, get_settings
from app.db.repositories.audit_repository import AuditRepository
from app.db.session import get_session
from app.services._shared.llm_factory import build_llm_client
from app.services._shared.schema_cache import SchemaCache
from app.services.generator.generator import GeneratorService, StubGenerator
from app.services.generator.llm_generator import LLMGenerator
from app.services.judge.judge import JudgeService, StubJudge
from app.services.orchestration import IterationOrchestrator
from app.services.repair.llm_repair import LLMRepair
from app.services.repair.repair import RepairService, StubRepair
from app.services.judge.llm_judge import LLMJudge

SettingsDep = Annotated[Settings, Depends(get_settings)]
SessionDep = Annotated[AsyncSession, Depends(get_session)]


@lru_cache
def get_schema_cache() -> SchemaCache:
    """Синглтон кеша схемы. Загружается при старте приложения (lifespan)."""
    return SchemaCache()


SchemaCacheDep = Annotated[SchemaCache, Depends(get_schema_cache)]

@lru_cache
def _stub_generator() -> StubGenerator:
    return StubGenerator()


@lru_cache
def _stub_judge() -> StubJudge:
    return StubJudge()


@lru_cache
def _stub_repair() -> StubRepair:
    return StubRepair()


@lru_cache
def _llm_generator() -> LLMGenerator:
    """Синглтон LLM-генератора."""
    settings = get_settings()
    model = settings.effective_generator_model
    if not model:
        raise ValueError(
            "Не задана модель генератора. Укажи GENERATOR_MODEL или LLM_MODEL в .env."
        )
    llm = build_llm_client(settings, model=model)
    return LLMGenerator(
        llm=llm,
        schema_cache=get_schema_cache(),
        top_k_tables=settings.schema_top_k_tables,
    )

@lru_cache
def _llm_judge() -> LLMJudge:
    """Синглтон LLM-аудитора."""
    settings = get_settings()
    model = settings.effective_judge_model
    if not model:
        raise ValueError(
            "Не задана модель аудитора. Укажи JUDGE_MODEL или LLM_MODEL в .env."
        )
    llm = build_llm_client(settings, model=model)
    return LLMJudge(
        llm=llm,
        schema_cache=get_schema_cache(),
        top_k_tables=settings.schema_top_k_tables,
    )

def get_generator(settings: SettingsDep) -> GeneratorService:
    if settings.llm_provider == "stub":
        return _stub_generator()
    return _llm_generator()


def get_judge(settings: SettingsDep) -> JudgeService:
    if settings.llm_provider == "stub":
        return _stub_judge()
    return _llm_judge()


@lru_cache
def _llm_repair() -> LLMRepair:
    """Синглтон LLM-репаратора."""
    settings = get_settings()
    model = settings.effective_repair_model
    if not model:
        raise ValueError(
            "Не задана модель репаратора. Укажи REPAIR_MODEL или LLM_MODEL в .env."
        )
    llm = build_llm_client(settings, model=model)
    return LLMRepair(
        llm=llm,
        schema_cache=get_schema_cache(),
        top_k_tables=settings.schema_top_k_tables,
    )


def get_repair(settings: SettingsDep) -> RepairService:
    if settings.llm_provider == "stub":
        return _stub_repair()
    return _llm_repair()


GeneratorDep = Annotated[GeneratorService, Depends(get_generator)]
JudgeDep = Annotated[JudgeService, Depends(get_judge)]
RepairDep = Annotated[RepairService, Depends(get_repair)]


def get_audit_repo(session: SessionDep) -> AuditRepository:
    return AuditRepository(session)


AuditRepoDep = Annotated[AuditRepository, Depends(get_audit_repo)]


def get_orchestrator(
    generator: GeneratorDep,
    judge: JudgeDep,
    repair: RepairDep,
    audit_repo: AuditRepoDep,
    settings: SettingsDep,
) -> IterationOrchestrator:
    return IterationOrchestrator(
        generator=generator,
        judge=judge,
        repair=repair,
        audit_repo=audit_repo,
        max_iterations=settings.max_iterations,
    )


OrchestratorDep = Annotated[IterationOrchestrator, Depends(get_orchestrator)]
