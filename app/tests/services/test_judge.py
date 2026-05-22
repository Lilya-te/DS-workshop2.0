"""Юнит-тесты сервиса аудита SQL (judge)."""

from __future__ import annotations

import json

from app.schemas.sql import VulnerabilityClass, VulnerabilityFinding
from app.services.judge.judge import StubJudge
from app.services.judge.llm_judge import LLMJudge, _merge_findings, _sort_by_risk
from app.services.judge.prompts import build_judge_system_prompt, build_judge_user_prompt
from app.services.judge.rules import rules_audit
from app.tests.services.conftest import (
    FakeLLM,
    SENSITIVE_DDL,
    run_async,
    schema_cache_from_ddl,
)


# ----------------------- StubJudge -----------------------


def test_stub_judge_finds_issue_on_first_iteration() -> None:
    async def _case() -> None:
        judge = StubJudge()
        result = await judge.audit("SELECT * FROM users", None)

        assert result.overall_risk == 7
        assert len(result.findings) == 1
        assert (
            result.findings[0].vulnerability_class
            == VulnerabilityClass.SELECT_STAR_EXCESSIVE
        )

    run_async(_case())


def test_stub_judge_approves_when_iteration_marker_present() -> None:
    async def _case() -> None:
        judge = StubJudge()
        result = await judge.audit("SELECT 1 -- iteration", None)

        assert result.overall_risk == 0
        assert result.findings == []

    run_async(_case())


# ----------------------- rules_audit -----------------------


def test_rules_audit_detects_select_star_and_unbounded_limit() -> None:
    result = rules_audit("SELECT * FROM public.users")

    classes = {f.vulnerability_class for f in result.findings}
    assert VulnerabilityClass.SELECT_STAR_EXCESSIVE in classes
    assert VulnerabilityClass.UNBOUNDED_LIMIT in classes
    assert result.overall_risk >= 5


def test_rules_audit_detects_delete_without_where() -> None:
    result = rules_audit("DELETE FROM public.users")

    assert any(
        f.vulnerability_class == VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE
        for f in result.findings
    )
    assert result.overall_risk == 9


def test_rules_audit_detects_sql_injection_tautology() -> None:
    result = rules_audit("SELECT 1 FROM users WHERE 1=1")

    assert any(
        f.vulnerability_class == VulnerabilityClass.SQL_INJECTION_CLASSIC
        for f in result.findings
    )


def test_rules_audit_detects_time_based_injection() -> None:
    result = rules_audit("SELECT pg_sleep(5)")

    assert any(
        f.vulnerability_class == VulnerabilityClass.TIME_BASED_BLIND_INJECTION
        for f in result.findings
    )


def test_rules_audit_safe_select_has_no_findings() -> None:
    result = rules_audit(
        "SELECT id FROM public.users WHERE id = $1 LIMIT 100"
    )

    assert result.overall_risk == 0
    assert result.findings == []


def test_rules_audit_detects_sensitive_columns_from_schema() -> None:
    cache = schema_cache_from_ddl(SENSITIVE_DDL)
    result = rules_audit(
        "SELECT password_hash FROM public.accounts LIMIT 10",
        tables=cache.all_tables(),
    )

    assert any(
        f.vulnerability_class == VulnerabilityClass.SENSITIVE_FIELD_ACCESS
        for f in result.findings
    )


def test_rules_audit_detects_plpgsql_unsafe_execute() -> None:
    sql = """
    CREATE FUNCTION f() RETURNS void AS $$
    BEGIN
      EXECUTE format('SELECT %s', user_input);
    END;
    $$ LANGUAGE plpgsql;
    """
    result = rules_audit(sql)

    assert any(
        f.vulnerability_class == VulnerabilityClass.PLPGSQL_UNSAFE_EXECUTE
        for f in result.findings
    )


def test_rules_audit_union_injection_with_tautology() -> None:
    result = rules_audit(
        "SELECT name FROM users WHERE id = 1 OR 1=1 UNION SELECT password FROM admins --"
    )

    assert any(
        f.vulnerability_class == VulnerabilityClass.UNION_BASED_INJECTION
        for f in result.findings
    )


# ----------------------- merge / sort -----------------------


def test_merge_findings_deduplicates_by_class_and_explanation() -> None:
    rules = [
        VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.SELECT_STAR_EXCESSIVE,
            risk_score=5,
            explanation="SELECT * раскрывает все колонки",
            suggested_fix="Перечислить колонки",
        )
    ]
    llm = [
        VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.SELECT_STAR_EXCESSIVE,
            risk_score=6,
            explanation="SELECT * раскрывает все колонки",
            suggested_fix="Убрать звёздочку",
        ),
        VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.UNBOUNDED_LIMIT,
            risk_score=4,
            explanation="Нет LIMIT",
            suggested_fix="Добавить LIMIT",
        ),
    ]

    merged = _merge_findings(rules, llm)

    assert len(merged) == 2


def test_sort_by_risk_orders_descending() -> None:
    findings = [
        VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.UNBOUNDED_LIMIT,
            risk_score=4,
            explanation="a",
        ),
        VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.SQL_INJECTION_CLASSIC,
            risk_score=10,
            explanation="b",
        ),
    ]

    sorted_findings = _sort_by_risk(findings)

    assert sorted_findings[0].risk_score == 10


# ----------------------- prompts -----------------------


def test_build_judge_system_prompt_includes_schema() -> None:
    prompt = build_judge_system_prompt("TABLE users (id bigint)")

    assert "TABLE users (id bigint)" in prompt
    assert "sql_injection_classic" in prompt


def test_build_judge_user_prompt_includes_rules_and_sql() -> None:
    rules_result = rules_audit("SELECT * FROM users")
    prompt = build_judge_user_prompt("SELECT * FROM users", rules_result)

    assert "=== СВОДКА ОТ ДЕТЕРМИНИРОВАННЫХ ПРАВИЛ ===" in prompt
    assert "SELECT * FROM users" in prompt


# ----------------------- LLMJudge -----------------------


def test_llm_judge_merges_rules_and_llm_findings() -> None:
    async def _case() -> None:
        llm_json = json.dumps(
            {
                "overall_risk": 4,
                "findings": [
                    {
                        "vulnerability_class": "unbounded_limit",
                        "risk_score": 4,
                        "explanation": "Нет LIMIT в запросе",
                        "suggested_fix": "Добавьте LIMIT 1000",
                    }
                ],
                "summary": "LLM: нужен LIMIT",
            },
            ensure_ascii=False,
        )
        fake_llm = FakeLLM(llm_json)
        judge = LLMJudge(
            llm=fake_llm,
            schema_cache=schema_cache_from_ddl(),
            top_k_tables=3,
        )

        result = await judge.audit("SELECT * FROM public.users", None)

        assert result.overall_risk >= 5
        assert result.summary == "LLM: нужен LIMIT"
        assert any(
            f.vulnerability_class == VulnerabilityClass.SELECT_STAR_EXCESSIVE
            for f in result.findings
        )
        assert fake_llm.calls[0]["response_format"] == {"type": "json_object"}

    run_async(_case())


def test_llm_judge_falls_back_to_rules_when_llm_fails() -> None:
    async def _case() -> None:
        judge = LLMJudge(
            llm=FakeLLM("", raise_error=True),
            schema_cache=schema_cache_from_ddl(),
        )

        result = await judge.audit("SELECT * FROM public.users", None)

        assert result.overall_risk >= 5

    run_async(_case())


def test_llm_judge_falls_back_to_rules_on_invalid_json() -> None:
    async def _case() -> None:
        judge = LLMJudge(
            llm=FakeLLM("not json"),
            schema_cache=schema_cache_from_ddl(),
        )

        result = await judge.audit("DELETE FROM public.users", None)

        assert result.overall_risk == 9

    run_async(_case())


def test_llm_judge_llm_approves_clean_query() -> None:
    async def _case() -> None:
        llm_json = json.dumps(
            {
                "overall_risk": 0,
                "findings": [],
                "summary": "Запрос безопасен",
            }
        )
        judge = LLMJudge(
            llm=FakeLLM(llm_json),
            schema_cache=schema_cache_from_ddl(),
        )
        sql = "SELECT id FROM public.users WHERE id = $1 LIMIT 10"

        result = await judge.audit(sql, None)

        assert result.overall_risk == 0
        assert result.findings == []

    run_async(_case())
