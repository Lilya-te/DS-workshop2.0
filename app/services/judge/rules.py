"""Детерминированный (rule-based) слой аудита SQL.

Зачем нужен поверх LLM:
- ловит грубые проблемы быстро и без вызовов модели (regex + sqlglot AST);
- даёт LLM-судье «сводку правил» в промпте, чтобы он не дублировал
  очевидные находки и фокусировался на семантике;
- работает как фолбэк, если LLM упал или вернул невалидный JSON.

Покрывает все 9 классов из app/schemas/sql.py::VulnerabilityClass.

Сигнатура:
    rules_audit(sql: str, tables: list[TableInfo] | None) -> AuditResult

`tables` — релевантные таблицы из SchemaCache. Используются для определения
чувствительных колонок (атрибут column.sensitive). Если None — фолбэк на
зашитый список SENSITIVE_FALLBACK.
"""

from __future__ import annotations

import re

import sqlglot
from sqlglot import expressions as exp

from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding
from app.services._shared.schema_parser import TableInfo


# ----------------------- базовый риск по классам -----------------------

DEFAULT_RISK_BY_CLASS: dict[VulnerabilityClass, int] = {
    VulnerabilityClass.SQL_INJECTION_CLASSIC:        10,
    VulnerabilityClass.UNION_BASED_INJECTION:         9,
    VulnerabilityClass.TIME_BASED_BLIND_INJECTION:    8,
    VulnerabilityClass.PRIVILEGE_ESCALATION_EXECUTE:  8,
    VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE:   9,
    VulnerabilityClass.PLPGSQL_UNSAFE_EXECUTE:        9,
    VulnerabilityClass.SENSITIVE_FIELD_ACCESS:        6,
    VulnerabilityClass.SELECT_STAR_EXCESSIVE:         5,
    VulnerabilityClass.UNBOUNDED_LIMIT:               4,
}


# Фолбэк-список чувствительных имён — используется, только если в схеме
# нет распарсенных таблиц с атрибутом sensitive. В норме берётся из
# SchemaCache (parser сам помечает sensitive по эвристике в schema_parser.py).
SENSITIVE_FALLBACK = frozenset({
    "password", "password_hash", "passwd", "pwd",
    "token", "api_key", "secret", "private_key",
    "ssn", "passport", "snils", "inn",
    "card_number", "card_token", "cvv", "pan",
    "email", "phone",
})


# Дополнительный регекс-детектор чувствительных колонок поверх schema-атрибута.
# Срабатывает на типовые шаблоны имён независимо от того, помечена ли колонка
# в SchemaCache (нужен для случаев, когда генератор «изобретает» имя или когда
# в схеме сидит опечатка, которую эвристика парсера не покрывает).
#
# - address / adress / addres / addrss — корректное и частые опечатки;
# - adress_ad, address_line — варианты адресных полей из реальных схем GreenData;
# - email/e_mail/phone — на всякий случай дублируем (в schema-парсере уже есть).
_SENSITIVE_NAME_HEURISTIC = re.compile(
    r"""
    \b(
        a(?:d{1,2}r|ddr)[a-z]*           # address, adress, addres, addrss и т.п.
        | [a-z_]*addr[a-z_]*             # address_line, home_addr, …
        | [a-z_]*adress[a-z_]*           # adress_ad, adress_home (типичная опечатка)
        | e[-_]?mail
        | phone[a-z_]*
        | passport[a-z_]*
        | snils
        | inn
        | full[_]?name
    )\b
    """,
    re.IGNORECASE | re.VERBOSE,
)


# ----------------------- regex-паттерны -----------------------

_RE = {
    # SQL_INJECTION_CLASSIC
    "py_concat":        re.compile(r"""['"]\s*\+\s*\w+|\w+\s*\+\s*['"]"""),
    "format_string":    re.compile(r"""%\s*\(|\.format\s*\(|f['"].*\{.*\}"""),
    "tautology":        re.compile(
        r"""\bOR\s+['"]?1['"]?\s*=\s*['"]?1['"]?\b|\bWHERE\s+['"]?1['"]?\s*=\s*['"]?1['"]?\b""",
        re.IGNORECASE,
    ),
    "comment_inj":      re.compile(r"""(--\s|/\*|;\s*--)"""),

    # TIME_BASED_BLIND_INJECTION
    "time_based":       re.compile(
        r"""\bpg_sleep\s*\(|\bWAITFOR\s+DELAY\b|\bBENCHMARK\s*\(""",
        re.IGNORECASE,
    ),

    # PRIVILEGE_ESCALATION_EXECUTE
    "security_definer": re.compile(r"""\bSECURITY\s+DEFINER\b""", re.IGNORECASE),
    "execute_keyword":  re.compile(r"""\bEXECUTE\b""", re.IGNORECASE),

    # PLPGSQL_UNSAFE_EXECUTE
    "execute_format":   re.compile(r"""\bEXECUTE\s+format\s*\(""", re.IGNORECASE),
    "execute_using":    re.compile(r"""\bEXECUTE\b[\s\S]*?\bUSING\b""", re.IGNORECASE),
    "execute_concat":   re.compile(r"""\bEXECUTE\b[\s\S]*?\|\|""", re.IGNORECASE),
}


# ----------------------- утилиты -----------------------

def _stmt_kind(tree: exp.Expression) -> str:
    if isinstance(tree, exp.Delete):        return "DELETE"
    if isinstance(tree, exp.Update):        return "UPDATE"
    if isinstance(tree, exp.Drop):          return "DROP"
    if isinstance(tree, exp.TruncateTable): return "TRUNCATE"
    if isinstance(tree, exp.Select):        return "SELECT"
    return tree.__class__.__name__.upper()


def _aggregate_overall_risk(findings: list[VulnerabilityFinding]) -> int:
    """overall_risk = max(risk_score). Approved ⇔ нет находок и риск 0."""
    if not findings:
        return 0
    return max(f.risk_score for f in findings)


def _summary(findings: list[VulnerabilityFinding]) -> str:
    if not findings:
        return "Правила не нашли уязвимостей."
    by_class: dict[str, int] = {}
    for f in findings:
        key = f.vulnerability_class.value
        by_class[key] = by_class.get(key, 0) + 1
    parts = [f"{cls}={n}" for cls, n in by_class.items()]
    return f"Правила обнаружили {len(findings)} замечан(ия/ий): " + ", ".join(parts)


def _collect_sensitive_names(tables: list[TableInfo] | None) -> set[str]:
    """Имена чувствительных колонок из распарсенной схемы (атрибут c.sensitive)."""
    s: set[str] = set()
    for t in tables or []:
        for c in t.columns:
            if c.sensitive:
                s.add(c.name.lower())
    return s


# ----------------------- главный детектор -----------------------

def rules_audit(sql: str, tables: list[TableInfo] | None = None) -> AuditResult:
    """Детерминированный аудит. Возвращает AuditResult в формате контракта (0..10)."""
    findings: list[VulnerabilityFinding] = []

    sensitive_names = _collect_sensitive_names(tables) or set(SENSITIVE_FALLBACK)

    # ---------- 1. SQL_INJECTION_CLASSIC: конкатенация / format / тавтология ----------
    if _RE["py_concat"].search(sql) or _RE["format_string"].search(sql):
        findings.append(VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.SQL_INJECTION_CLASSIC,
            risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.SQL_INJECTION_CLASSIC],
            explanation="Запрос собирается через конкатенацию строк или format/f-string. "
                        "Это классический вектор SQL-инъекции — пользовательский ввод "
                        "попадает напрямую в текст запроса.",
            suggested_fix="Используйте параметризованные запросы ($1, $2 для PostgreSQL).",
        ))
    if _RE["tautology"].search(sql):
        findings.append(VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.SQL_INJECTION_CLASSIC,
            risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.SQL_INJECTION_CLASSIC],
            explanation="Обнаружено тавтологическое условие вида 'OR 1=1' / 'WHERE 1=1' — "
                        "признак инъекции или маскировки опасной операции.",
            suggested_fix="Удалите тавтологию; используйте конкретный фильтр.",
        ))

    # ---------- 2. TIME_BASED_BLIND_INJECTION ----------
    if _RE["time_based"].search(sql):
        findings.append(VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.TIME_BASED_BLIND_INJECTION,
            risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.TIME_BASED_BLIND_INJECTION],
            explanation="Запрос содержит pg_sleep / WAITFOR DELAY / BENCHMARK — "
                        "функции, используемые для time-based blind SQL-инъекций.",
            suggested_fix="Удалите задержки; они не имеют легитимного применения в аналитических запросах.",
        ))

    # ---------- 3. PRIVILEGE_ESCALATION_EXECUTE ----------
    if _RE["security_definer"].search(sql) and _RE["execute_keyword"].search(sql):
        findings.append(VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.PRIVILEGE_ESCALATION_EXECUTE,
            risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.PRIVILEGE_ESCALATION_EXECUTE],
            explanation="EXECUTE с динамически формируемой строкой внутри функции с SECURITY DEFINER. "
                        "Позволяет повысить привилегии: код выполнится с правами владельца функции.",
            suggested_fix="Используйте EXECUTE ... USING $1 и валидируйте имена объектов через quote_ident.",
        ))

    # ---------- 4. PLPGSQL_UNSAFE_EXECUTE ----------
    if _RE["execute_keyword"].search(sql) and not _RE["execute_using"].search(sql):
        if _RE["execute_format"].search(sql) or _RE["execute_concat"].search(sql):
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.PLPGSQL_UNSAFE_EXECUTE,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.PLPGSQL_UNSAFE_EXECUTE],
                explanation="Динамический SQL через EXECUTE format(...) или конкатенацию '||' "
                            "без USING-параметров. Открытый вектор инъекции в PL/pgSQL.",
                suggested_fix="Передавайте значения через EXECUTE ... USING $1, "
                              "а имена объектов — через quote_ident().",
            ))

    # ---------- 5. UNION_BASED_INJECTION ----------
    has_union = bool(re.search(r"\bUNION\b\s+(?:ALL\s+)?SELECT\b", sql, re.IGNORECASE))
    if has_union:
        suspicious = (
            _RE["tautology"].search(sql) is not None
            or _RE["py_concat"].search(sql) is not None
            or bool(re.search(r"SELECT\s+NULL\s*(?:,\s*NULL\s*){1,}", sql, re.IGNORECASE))
            or bool(re.search(r"--\s|/\*", sql))
        )
        if suspicious:
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.UNION_BASED_INJECTION,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.UNION_BASED_INJECTION],
                explanation="UNION SELECT в сочетании с признаками инъекции (тавтология / NULL-разведка / "
                            "комментарии-обрезки). Типичный паттерн извлечения данных из других таблиц.",
                suggested_fix="Запретите конкатенацию SQL; перепишите запрос через параметры.",
            ))

    # ---------- 6. AST-анализ ----------
    try:
        tree = sqlglot.parse_one(sql, dialect="postgres")
    except Exception as e:
        # SQL не парсится — отдаём то, что нашли regex-ом, и фиксируем в summary.
        return AuditResult(
            overall_risk=max(_aggregate_overall_risk(findings), 5),
            findings=findings,
            summary=f"SQL не парсится (sqlglot: {e}). " + _summary(findings),
        )

    kind = _stmt_kind(tree)

    # ---------- 7. UPDATE_DELETE_WITHOUT_WHERE / TRUNCATE / DROP ----------
    if kind in ("DELETE", "UPDATE"):
        where = tree.args.get("where")
        if where is None or _RE["tautology"].search(sql):
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE],
                explanation=f"{kind} без условия WHERE (или с тавтологическим WHERE 1=1). "
                            f"Затронет все строки таблицы — необратимая массовая операция.",
                suggested_fix=f"Добавьте конкретное условие WHERE для {kind}.",
            ))
        # UPDATE/DELETE ... LIMIT — недопустимый синтаксис в PostgreSQL (MySQL-изм).
        # sqlglot парсит его в `limit`, но PG такой запрос отклонит ещё до выполнения,
        # поэтому ловим до выдачи пользователю.
        if tree.args.get("limit") is not None:
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE],
                explanation=f"{kind} ... LIMIT не поддерживается в PostgreSQL "
                            f"(это синтаксис MySQL). Запрос упадёт с syntax error при "
                            f"выполнении; кроме того, LIMIT в DML маскирует отсутствие "
                            f"корректного WHERE и делает результат недетерминированным.",
                suggested_fix=f"Уберите LIMIT и используйте однозначный WHERE "
                              f"(например, по первичному ключу) или CTE с "
                              f"SELECT ... LIMIT, чтобы заранее зафиксировать строки: "
                              f"WITH t AS (SELECT id FROM ... LIMIT 1) "
                              f"{kind} ... WHERE id IN (SELECT id FROM t).",
            ))
    if kind in ("TRUNCATE", "DROP"):
        findings.append(VulnerabilityFinding(
            vulnerability_class=VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE,
            risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE],
            explanation=f"Операция {kind} необратима и удаляет данные/схему. "
                        "Не должна выполняться из аналитических запросов.",
            suggested_fix=f"Перенесите {kind} в отдельный согласованный процесс DBA-миграций.",
        ))

    # ---------- 8. SELECT-специфика ----------
    if kind == "SELECT":
        has_limit = tree.args.get("limit") is not None
        has_where = tree.args.get("where") is not None
        has_agg = (
            any(isinstance(n, exp.AggFunc) for n in tree.walk())
            or tree.args.get("group") is not None
        )

        # SELECT_STAR_EXCESSIVE: только bare * в SELECT-листе, без COUNT(*) и т.п.
        select_exprs = tree.expressions or []
        bare_star = (
            any(isinstance(e, exp.Star) for e in select_exprs)
            or any(
                isinstance(e, exp.Column) and isinstance(e.this, exp.Star)
                for e in select_exprs
            )
        )
        if bare_star:
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.SELECT_STAR_EXCESSIVE,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.SELECT_STAR_EXCESSIVE],
                explanation="Запрос использует SELECT *: возвращает все колонки, включая потенциально "
                            "чувствительные (пароли, токены, ПДн).",
                suggested_fix="Перечислите только необходимые колонки явно.",
            ))

        # UNBOUNDED_LIMIT
        if not has_limit and not has_agg:
            risk = DEFAULT_RISK_BY_CLASS[VulnerabilityClass.UNBOUNDED_LIMIT]
            if not has_where:
                risk = min(10, risk + 3)  # без WHERE опаснее
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.UNBOUNDED_LIMIT,
                risk_score=risk,
                explanation="SELECT без LIMIT и без агрегации"
                            + (" и без WHERE" if not has_where else "")
                            + " — может вернуть миллионы строк и вызвать DoS.",
                suggested_fix="Добавьте LIMIT (например, 1000) или агрегатную функцию.",
            ))

        # SENSITIVE_FIELD_ACCESS
        col_names = [(c.name or "").lower() for c in tree.find_all(exp.Column)]
        cols_text = " ".join(col_names)
        matched: list[str] = []
        for sens in sensitive_names:
            if re.search(rf"\b{re.escape(sens)}\b", cols_text):
                matched.append(sens)
        # Дополнительная эвристика: ловим адресо-подобные имена с опечатками
        # (adress_ad, addr_home) даже если в схеме их атрибут sensitive не выставлен.
        for name in col_names:
            if not name or name in matched:
                continue
            if _SENSITIVE_NAME_HEURISTIC.search(name):
                matched.append(name)
        if matched:
            findings.append(VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.SENSITIVE_FIELD_ACCESS,
                risk_score=DEFAULT_RISK_BY_CLASS[VulnerabilityClass.SENSITIVE_FIELD_ACCESS],
                explanation=f"Запрос обращается к чувствительным колонкам: {', '.join(matched)}. "
                            "Эти поля содержат ПДн или секреты.",
                suggested_fix=f"Уберите колонки {', '.join(matched)} из выборки "
                              "или замаскируйте через view.",
            ))

    return AuditResult(
        overall_risk=_aggregate_overall_risk(findings),
        findings=findings,
        summary=_summary(findings),
    )
