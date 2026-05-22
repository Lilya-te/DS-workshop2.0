"""Юнит-тесты оркестратора итеративного цикла."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

from app.services.generator.generator import StubGenerator
from app.services.judge.judge import StubJudge
from app.services.orchestration import IterationOrchestrator
from app.services.repair.repair import StubRepair
from app.tests.services.conftest import run_async


@dataclass
class FakeAuditRepository:
    records: list[dict[str, Any]] = field(default_factory=list)

    async def record_iteration(self, **kwargs: Any) -> None:
        self.records.append(kwargs)


def test_orchestrator_stub_cycle_approves_in_two_iterations() -> None:
    async def _case() -> None:
        repo = FakeAuditRepository()
        orchestrator = IterationOrchestrator(
            generator=StubGenerator(),
            judge=StubJudge(),
            repair=StubRepair(),
            audit_repo=repo,
            max_iterations=5,
        )

        result = await orchestrator.run(
            task_description="тестовая задача",
            db_schema=None,
        )

        assert result.status == "approved"
        assert result.total_iterations == 2
        assert result.final_sql is not None
        assert "-- iteration 2" in result.final_sql
        assert len(result.iterations) == 2
        assert result.iterations[0].decision == "needs_fix"
        assert result.iterations[1].decision == "approved"
        assert len(repo.records) == 2
        assert repo.records[0]["iteration"] == 1
        assert repo.records[1]["decision"] == "approved"

    run_async(_case())


def test_orchestrator_respects_max_iterations_limit() -> None:
    async def _case() -> None:
        orchestrator = IterationOrchestrator(
            generator=StubGenerator(),
            judge=StubJudge(),
            repair=StubRepair(),
            audit_repo=FakeAuditRepository(),
            max_iterations=1,
        )

        result = await orchestrator.run(
            task_description="тестовая задача",
            db_schema=None,
        )

        assert result.status == "iteration_limit_exceeded"
        assert result.final_sql is None
        assert result.total_iterations == 1
        assert result.iterations[0].decision == "needs_fix"

    run_async(_case())


def test_orchestrator_honors_max_iterations_override() -> None:
    async def _case() -> None:
        orchestrator = IterationOrchestrator(
            generator=StubGenerator(),
            judge=StubJudge(),
            repair=StubRepair(),
            audit_repo=FakeAuditRepository(),
            max_iterations=1,
        )

        result = await orchestrator.run(
            task_description="тестовая задача",
            db_schema=None,
            max_iterations_override=3,
        )

        assert result.status == "approved"
        assert result.total_iterations == 2

    run_async(_case())
