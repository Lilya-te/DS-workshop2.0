"""Юнит-тесты сервиса исправления SQL (repair)."""

from __future__ import annotations

from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding
from app.services.repair.llm_repair import LLMRepair
from app.services.repair.prompts import build_repair_system_prompt, build_repair_user_prompt
from app.services.repair.repair import StubRepair
from app.tests.services.conftest import FakeLLM, run_async, schema_cache_from_ddl


def _sample_audit() -> AuditResult:
    return AuditResult(
        overall_risk=7,
        findings=[
            VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.SELECT_STAR_EXCESSIVE,
                risk_score=7,
                explanation="SELECT * раскрывает все колонки",
                suggested_fix="Перечислить id, email явно",
            )
        ],
        summary="Обнаружена 1 уязвимость",
    )


def test_stub_repair_appends_iteration_marker() -> None:
    async def _case() -> None:
        repair = StubRepair()
        sql = await repair.repair(
            original_sql="SELECT * FROM users",
            audit_feedback=_sample_audit(),
            task_description="список пользователей",
            db_schema=None,
            iteration=2,
        )

        assert sql == "SELECT * FROM users\n-- iteration 2"

    run_async(_case())


def test_build_repair_system_prompt_includes_schema() -> None:
    prompt = build_repair_system_prompt("TABLE users (id bigint)")

    assert "TABLE users (id bigint)" in prompt
    assert "ИСПРАВЛЕНИЯ SQL" in prompt


def test_build_repair_user_prompt_includes_feedback_and_sql() -> None:
    audit = _sample_audit()
    prompt = build_repair_user_prompt(
        task_description="вывести пользователей",
        previous_sql="SELECT * FROM users",
        audit=audit,
        iteration=2,
    )

    assert "вывести пользователей" in prompt
    assert "SELECT * FROM users" in prompt
    assert "select_star_excessive" in prompt
    assert "итерация 1" in prompt.lower()


def test_llm_repair_returns_cleaned_sql() -> None:
    async def _case() -> None:
        fake_llm = FakeLLM(
            "```sql\nSELECT id FROM public.users WHERE id = $1 LIMIT 100\n```"
        )
        repair = LLMRepair(
            llm=fake_llm,
            schema_cache=schema_cache_from_ddl(),
            top_k_tables=3,
        )

        sql = await repair.repair(
            original_sql="SELECT * FROM public.users",
            audit_feedback=_sample_audit(),
            task_description="список пользователей",
            db_schema=None,
            iteration=2,
        )

        assert sql == "SELECT id FROM public.users WHERE id = $1 LIMIT 100"
        assert fake_llm.calls[0]["metadata"]["stage"] == "repair"
        assert fake_llm.calls[0]["metadata"]["iteration"] == 2
        assert "public.users" in fake_llm.calls[0]["system_prompt"]

    run_async(_case())
