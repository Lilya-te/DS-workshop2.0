"""Юнит-тесты сервиса аудита SQL (judge)."""

from __future__ import annotations

import asyncio
import json

from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding
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


class FakeDbChecker:
    """Подмена DbSyntaxChecker. Управляется аргументами конструктора."""

    def __init__(
        self,
        *,
        result: AuditResult | None = None,
        raise_error: bool = False,
        sleep_seconds: float = 0.0,
    ) -> None:
        self._result = result or AuditResult(
            overall_risk=0, findings=[], summary="ok"
        )
        self._raise = raise_error
        self._sleep = sleep_seconds
        self.calls: list[str] = []

    async def check(self, sql: str) -> AuditResult:
        self.calls.append(sql)
        if self._sleep:
            await asyncio.sleep(self._sleep)
        if self._raise:
            raise RuntimeError("DB unavailable")
        return self._result


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


def test_rules_audit_detects_adress_typo_as_sensitive() -> None:
    """sensitive_01: генератор отдаёт adress_ad — это поле адреса,
    аудитор обязан помечать его как SENSITIVE_FIELD_ACCESS, даже если
    в схеме атрибут sensitive по такой опечатке не выставлен."""
    sql = (
        "SELECT id, first_name, adress_ad, pers_emp_number "
        "FROM public.sys_employee WHERE id = $1 LIMIT 10"
    )
    result = rules_audit(sql)

    sensitive = [
        f for f in result.findings
        if f.vulnerability_class == VulnerabilityClass.SENSITIVE_FIELD_ACCESS
    ]
    assert sensitive, "ожидался флаг SENSITIVE_FIELD_ACCESS для adress_ad"
    assert "adress_ad" in sensitive[0].explanation.lower()


def test_rules_audit_detects_address_variants_as_sensitive() -> None:
    """Корректное написание address и иные адресные варианты тоже ловятся."""
    for col in ("address", "home_address", "addr_line", "adress_home"):
        sql = f"SELECT id, {col} FROM public.persons WHERE id = $1 LIMIT 10"
        result = rules_audit(sql)
        assert any(
            f.vulnerability_class == VulnerabilityClass.SENSITIVE_FIELD_ACCESS
            for f in result.findings
        ), f"не сработал детектор для колонки {col}"


def test_rules_audit_detects_update_with_limit_as_postgres_syntax_error() -> None:
    """dml_01: UPDATE ... LIMIT 1 — MySQL-изм, в PostgreSQL это syntax error.
    Аудитор должен пометить запрос до выдачи пользователю."""
    sql = (
        "UPDATE public.requests SET status = 'approved' "
        "WHERE id = $1 LIMIT 1"
    )
    result = rules_audit(sql)

    dml_findings = [
        f for f in result.findings
        if f.vulnerability_class == VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE
    ]
    assert dml_findings, "ожидалась находка UPDATE_DELETE_WITHOUT_WHERE для UPDATE ... LIMIT"
    assert any("LIMIT" in f.explanation and "PostgreSQL" in f.explanation
               for f in dml_findings)
    assert result.overall_risk >= 9


def test_rules_audit_detects_delete_with_limit_as_postgres_syntax_error() -> None:
    sql = "DELETE FROM public.requests WHERE id = $1 LIMIT 1"
    result = rules_audit(sql)

    assert any(
        f.vulnerability_class == VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE
        and "LIMIT" in f.explanation
        for f in result.findings
    )


def test_rules_audit_update_without_limit_does_not_trigger_limit_rule() -> None:
    """Контроль: корректный UPDATE с WHERE и без LIMIT не должен ложно срабатывать."""
    sql = "UPDATE public.requests SET status = 'approved' WHERE id = $1"
    result = rules_audit(sql)

    assert not any(
        "LIMIT" in f.explanation for f in result.findings
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


# ----------------------- DB syntax check integration -----------------------


def _clean_llm_json() -> str:
    return json.dumps(
        {"overall_risk": 0, "findings": [], "summary": "ok"}, ensure_ascii=False
    )


def test_llm_judge_without_db_checker_works_as_before() -> None:
    """Флаг выключен (db_checker=None) — поведение совместимо."""
    async def _case() -> None:
        judge = LLMJudge(
            llm=FakeLLM(_clean_llm_json()),
            schema_cache=schema_cache_from_ddl(),
        )
        result = await judge.audit(
            "SELECT id FROM public.users WHERE id = $1 LIMIT 10", None,
        )
        assert result.overall_risk == 0

    run_async(_case())


def test_llm_judge_uses_db_checker_when_provided() -> None:
    """Когда DB-чекер находит ошибку, она попадает в findings даже если LLM чисто."""
    async def _case() -> None:
        db_finding = VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE,
            risk_score=9,
            explanation="PostgreSQL отказался планировать запрос: syntax error at or near \"LIMIT\"",
            suggested_fix="Уберите LIMIT в DML.",
        )
        checker = FakeDbChecker(
            result=AuditResult(
                overall_risk=9, findings=[db_finding], summary="rejected",
            ),
        )
        judge = LLMJudge(
            llm=FakeLLM(_clean_llm_json()),
            schema_cache=schema_cache_from_ddl(),
            db_checker=checker,
            db_check_timeout_seconds=1.0,
        )
        sql = "SELECT id FROM public.users WHERE id = $1 LIMIT 10"

        result = await judge.audit(sql, None)

        assert checker.calls == [sql], "DB-чекер должен вызываться один раз"
        assert any(
            "PostgreSQL отказался" in f.explanation for f in result.findings
        ), "находка из DB-чекера должна попасть в итог"
        assert result.overall_risk == 9

    run_async(_case())


def test_llm_judge_db_checker_skip_does_not_pollute_findings() -> None:
    """Если DB-чекер вернул пустой результат — поведение как без чекера."""
    async def _case() -> None:
        checker = FakeDbChecker(
            result=AuditResult(overall_risk=0, findings=[], summary="ok"),
        )
        judge = LLMJudge(
            llm=FakeLLM(_clean_llm_json()),
            schema_cache=schema_cache_from_ddl(),
            db_checker=checker,
            db_check_timeout_seconds=1.0,
        )
        result = await judge.audit(
            "SELECT id FROM public.users WHERE id = $1 LIMIT 10", None,
        )
        assert checker.calls, "чекер должен вызываться"
        assert result.overall_risk == 0
        assert result.findings == []

    run_async(_case())


def test_llm_judge_db_checker_timeout_falls_back_gracefully() -> None:
    """При таймауте DB-чекера аудит не падает, отдаёт rules+LLM как есть."""
    async def _case() -> None:
        checker = FakeDbChecker(sleep_seconds=0.5)
        judge = LLMJudge(
            llm=FakeLLM(_clean_llm_json()),
            schema_cache=schema_cache_from_ddl(),
            db_checker=checker,
            db_check_timeout_seconds=0.05,  # форсируем таймаут
        )
        # Безопасный SQL — без DB-чекера правил-находок не было бы.
        result = await judge.audit(
            "SELECT id FROM public.users WHERE id = $1 LIMIT 10", None,
        )
        assert result.overall_risk == 0
        assert result.findings == []

    run_async(_case())


def test_llm_judge_db_checker_exception_does_not_break_audit() -> None:
    """Исключение в DB-чекере (БД недоступна) — graceful fallback на rules+LLM."""
    async def _case() -> None:
        checker = FakeDbChecker(raise_error=True)
        judge = LLMJudge(
            llm=FakeLLM(_clean_llm_json()),
            schema_cache=schema_cache_from_ddl(),
            db_checker=checker,
            db_check_timeout_seconds=1.0,
        )
        # Опасный SQL: rules должны его поймать; DB-чекер бросает ошибку.
        result = await judge.audit("DELETE FROM public.users", None)
        assert result.overall_risk == 9
        assert any(
            f.vulnerability_class == VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE
            for f in result.findings
        )

    run_async(_case())


# ----------------------- DB syntax check (модуль) -----------------------


def test_db_syntax_check_skips_ddl() -> None:
    """DDL/TRUNCATE даже не пытаются дойти до базы."""
    from app.services.judge.db_syntax_check import PostgresExplainChecker

    class _NeverCalled:
        def __call__(self) -> None:  # pragma: no cover — не должен вызываться
            raise AssertionError("session_factory called for DDL")

    checker = PostgresExplainChecker(_NeverCalled())  # type: ignore[arg-type]

    async def _case() -> None:
        result = await checker.check("DROP TABLE users")
        assert result.findings == []
        assert "не проверяются" in result.summary

    run_async(_case())


def test_db_syntax_check_skips_unsupported() -> None:
    from app.services.judge.db_syntax_check import PostgresExplainChecker

    class _NeverCalled:
        def __call__(self) -> None:  # pragma: no cover
            raise AssertionError("session_factory called for unsupported")

    checker = PostgresExplainChecker(_NeverCalled())  # type: ignore[arg-type]

    async def _case() -> None:
        result = await checker.check("VACUUM users")
        assert result.findings == []

    run_async(_case())


def test_check_with_timeout_returns_none_on_timeout() -> None:
    from app.services.judge.db_syntax_check import check_with_timeout

    checker = FakeDbChecker(sleep_seconds=0.5)

    async def _case() -> None:
        out = await check_with_timeout(checker, "SELECT 1", timeout_seconds=0.05)
        assert out is None

    run_async(_case())


def test_check_with_timeout_returns_none_on_exception() -> None:
    from app.services.judge.db_syntax_check import check_with_timeout

    checker = FakeDbChecker(raise_error=True)

    async def _case() -> None:
        out = await check_with_timeout(checker, "SELECT 1", timeout_seconds=1.0)
        assert out is None

    run_async(_case())


def test_create_judge_passes_db_checker_when_flag_on(monkeypatch) -> None:  # type: ignore[no-untyped-def]
    """create_judge() читает флаг settings и прокидывает DB-чекер в LLMJudge."""
    import app.services.llm_runtime as runtime
    from app.core.config import Settings

    captured: dict[str, object] = {}

    class _StubLLMJudge:
        def __init__(self, **kwargs: object) -> None:
            captured.update(kwargs)

        async def audit(self, *_a: object, **_kw: object) -> AuditResult:  # pragma: no cover
            return AuditResult(overall_risk=0, findings=[], summary="x")

    class _SentinelChecker:
        async def check(self, _sql: str) -> AuditResult:  # pragma: no cover
            return AuditResult(overall_risk=0, findings=[], summary="x")

    monkeypatch.setattr(runtime, "LLMJudge", _StubLLMJudge)
    monkeypatch.setattr(runtime, "build_llm_client", lambda *a, **kw: object())
    monkeypatch.setattr(
        runtime, "_build_db_checker", lambda settings: _SentinelChecker(),
    )

    settings = Settings(
        llm_provider="openrouter", llm_model="test/model",
        enable_db_syntax_check=True, db_check_timeout_seconds=1.5,
    )
    cfg = runtime.LlmRunConfig(provider="openrouter", model="test/model")
    runtime.create_judge(cfg, settings, schema_cache_from_ddl())

    assert isinstance(captured.get("db_checker"), _SentinelChecker)
    assert captured.get("db_check_timeout_seconds") == 1.5


def test_create_judge_no_db_checker_when_flag_off() -> None:
    """Если флаг выключен — db_checker=None, поведение совместимо со старым."""
    import app.services.llm_runtime as runtime
    from app.core.config import Settings

    settings = Settings(enable_db_syntax_check=False)
    assert runtime._build_db_checker(settings) is None
