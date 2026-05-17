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
from app.services.generator.generator import GeneratorService, StubGenerator
from app.services.judge.judge import JudgeService, StubJudge
from app.services.orchestration import IterationOrchestrator
from app.services.repair.repair import RepairService, StubRepair

SettingsDep = Annotated[Settings, Depends(get_settings)]
SessionDep = Annotated[AsyncSession, Depends(get_session)]


@lru_cache
def _stub_generator() -> StubGenerator:
    return StubGenerator()


@lru_cache
def _stub_judge() -> StubJudge:
    return StubJudge()


@lru_cache
def _stub_repair() -> StubRepair:
    return StubRepair()


def get_generator(settings: SettingsDep) -> GeneratorService:
    if settings.llm_provider == "stub":
        return _stub_generator()
    # TODO: подключение реальных провайдеров (openai, yandexgpt) — Егор.
    raise NotImplementedError(
        f"Генератор для провайдера {settings.llm_provider!r} ещё не подключён"
    )


def get_judge(settings: SettingsDep) -> JudgeService:
    if settings.llm_provider == "stub":
        return _stub_judge()
    # TODO: подключение реальных провайдеров — Саша.
    raise NotImplementedError(
        f"Судья для провайдера {settings.llm_provider!r} ещё не подключён"
    )


def get_repair(settings: SettingsDep) -> RepairService:
    if settings.llm_provider == "stub":
        return _stub_repair()
    raise NotImplementedError(
        f"Репаратор для провайдера {settings.llm_provider!r} ещё не подключён"
    )


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
