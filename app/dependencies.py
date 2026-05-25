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
from app.services._shared.schema_cache import SchemaCache
from app.services.generator.generator import GeneratorService
from app.services.judge.judge import JudgeService
from app.services.llm_runtime import (
    create_generator,
    create_judge,
    create_orchestrator,
    create_repair,
    default_run_config,
)
from app.services.orchestration import IterationOrchestrator
from app.services.repair.repair import RepairService

SettingsDep = Annotated[Settings, Depends(get_settings)]
SessionDep = Annotated[AsyncSession, Depends(get_session)]


@lru_cache
def get_schema_cache() -> SchemaCache:
    """Синглтон кеша схемы. Загружается при старте приложения (lifespan)."""
    return SchemaCache()


SchemaCacheDep = Annotated[SchemaCache, Depends(get_schema_cache)]

def get_generator(settings: SettingsDep) -> GeneratorService:
    return create_generator(
        default_run_config(settings), settings, get_schema_cache()
    )


def get_judge(settings: SettingsDep) -> JudgeService:
    return create_judge(default_run_config(settings), settings, get_schema_cache())


def get_repair(settings: SettingsDep) -> RepairService:
    return create_repair(default_run_config(settings), settings, get_schema_cache())


GeneratorDep = Annotated[GeneratorService, Depends(get_generator)]
JudgeDep = Annotated[JudgeService, Depends(get_judge)]
RepairDep = Annotated[RepairService, Depends(get_repair)]


def get_audit_repo(session: SessionDep) -> AuditRepository:
    return AuditRepository(session)


AuditRepoDep = Annotated[AuditRepository, Depends(get_audit_repo)]


def get_orchestrator(
    audit_repo: AuditRepoDep,
    settings: SettingsDep,
) -> IterationOrchestrator:
    return create_orchestrator(
        default_run_config(settings),
        settings,
        get_schema_cache(),
        audit_repo,
    )


OrchestratorDep = Annotated[IterationOrchestrator, Depends(get_orchestrator)]
