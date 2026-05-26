"""Парсер DDL-схемы PostgreSQL на sqlglot.

Разбирает дамп схемы (CREATE TABLE + COMMENT ON) в структурированное
представление: таблицы, колонки, типы, NOT NULL, PK, комментарии.
Помечает чувствительные поля по эвристике (имена + комментарии).

Используется генератором, аудитором и репаратором -- через SchemaCache.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field

import sqlglot
from sqlglot import exp


# ----------------------- структуры -----------------------

@dataclass
class ColumnInfo:
    name: str
    type: str
    nullable: bool = True
    comment: str = ""
    sensitive: bool = False
    is_pk: bool = False


@dataclass
class TableInfo:
    name: str
    schema: str = "public"
    columns: list[ColumnInfo] = field(default_factory=list)
    comment: str = ""

    @property
    def qualified_name(self) -> str:
        return f"{self.schema}.{self.name}" if self.schema else self.name


# ----------------------- эвристики чувствительности -----------------------

# Английские паттерны -- ищем в имени колонки.
SENSITIVE_NAME_PATTERNS = [
    r"password", r"passwd", r"hash", r"token", r"secret", r"api_key",
    r"card_number", r"card_token", r"cvv", r"pan\b",
    r"ssn", r"passport", r"inn\b", r"snils",
    r"email", r"phone", r"birthday", r"birth_date",
    r"full_name", r"fio\b",
    r"salary", r"balance",
    r"address", r"adress", r"addr",
]

# Русские и английские триггеры в комментариях.
SENSITIVE_COMMENT_PATTERNS = [
    r"пароль", r"пасс", r"токен", r"секрет",
    r"e-?mail", r"телефон", r"паспорт", r"снилс", r"инн\b",
    r"ФИО", r"фамилия", r"имя", r"отчество",
    r"дата\s+рожд", r"день\s+рожд",
    r"зарплат", r"оклад",
    r"адрес", r"прописк",
    r"PII", r"персональные\s+данные",
]

_name_re = re.compile("|".join(SENSITIVE_NAME_PATTERNS), re.IGNORECASE)
_comment_re = re.compile("|".join(SENSITIVE_COMMENT_PATTERNS), re.IGNORECASE)


def is_sensitive(column_name: str, comment: str) -> bool:
    """True, если поле похоже на чувствительное (PII или секрет)."""
    if _name_re.search(column_name):
        return True
    if comment and _comment_re.search(comment):
        return True
    return False


# Служебные таблицы, которые не нужны модели в контексте.
SERVICE_TABLE_PATTERNS = [
    r"^ms_[0-9a-z]{20,}$",   # JPA materialized states с хеш-именами
    r"^_",
    r"^pg_",
]
_service_re = re.compile("|".join(SERVICE_TABLE_PATTERNS), re.IGNORECASE)


def is_service_table(name: str) -> bool:
    """True для служебных таблиц (хеш-имена ORM, системные)."""
    return bool(_service_re.search(name))


# ----------------------- препроцессинг psql-дампа -----------------------

def preprocess_psql_dump(text: str) -> str:
    """Убирает psql-специфичные команды, которые sqlglot не парсит
    (\\connect, SET, CREATE DATABASE)."""
    lines_cleaned = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("\\"):
            continue
        if s.startswith("CREATE DATABASE"):
            continue
        if s.startswith("SET "):
            continue
        lines_cleaned.append(line)
    return "\n".join(lines_cleaned)


# ----------------------- парсер -----------------------

def parse_ddl(ddl_text: str, dialect: str = "postgres") -> list[TableInfo]:
    """Разбирает DDL в список TableInfo. Возвращает только пользовательские
    таблицы (служебные ms_*, pg_* отфильтрованы)."""
    ddl_text = preprocess_psql_dump(ddl_text)
    statements = sqlglot.parse(ddl_text, dialect=dialect)

    tables: dict[str, TableInfo] = {}

    # 1. CREATE TABLE
    for stmt in statements:
        if not isinstance(stmt, exp.Create) or stmt.args.get("kind") != "TABLE":
            continue
        table_node = stmt.this
        if isinstance(table_node, exp.Schema):
            tbl = table_node.this
            cols_defs = table_node.expressions
        else:
            tbl = table_node
            cols_defs = []

        if not isinstance(tbl, exp.Table):
            continue
        name = tbl.name
        schema = tbl.db or "public"

        if is_service_table(name):
            continue

        cols: list[ColumnInfo] = []
        for col_def in cols_defs:
            if not isinstance(col_def, exp.ColumnDef):
                continue
            cname = col_def.name
            ctype = col_def.args.get("kind")
            ctype_str = ctype.sql(dialect=dialect) if ctype else "UNKNOWN"
            nullable = True
            is_pk = False
            for constraint in col_def.constraints or []:
                kind = constraint.args.get("kind")
                if isinstance(kind, exp.NotNullColumnConstraint):
                    nullable = False
                elif isinstance(kind, exp.PrimaryKeyColumnConstraint):
                    is_pk = True
                    nullable = False
            cols.append(ColumnInfo(name=cname, type=ctype_str, nullable=nullable, is_pk=is_pk))
        tables[f"{schema}.{name}"] = TableInfo(name=name, schema=schema, columns=cols)

    # 2. COMMENT ON TABLE / COLUMN
    for stmt in statements:
        if not isinstance(stmt, exp.Comment):
            continue
        kind = stmt.args.get("kind")
        target = stmt.this
        text_node = stmt.args.get("expression")
        comment_text = text_node.this if text_node else ""
        if not isinstance(comment_text, str):
            comment_text = str(comment_text) if comment_text else ""

        if kind == "TABLE":
            if isinstance(target, exp.Table):
                qname = f"{target.db or 'public'}.{target.name}"
                if qname in tables:
                    tables[qname].comment = comment_text
        elif kind == "COLUMN":
            if isinstance(target, exp.Column):
                cname = target.name
                tname_node = target.args.get("table")
                schema_node = target.args.get("db")
                schema = schema_node.name if schema_node else "public"
                table_name = tname_node.name if tname_node else None
                if table_name:
                    qname = f"{schema}.{table_name}"
                    if qname in tables:
                        for c in tables[qname].columns:
                            if c.name == cname:
                                c.comment = comment_text
                                break

    # 3. Помечаем чувствительные колонки (после загрузки комментариев)
    for t in tables.values():
        for c in t.columns:
            c.sensitive = is_sensitive(c.name, c.comment)

    return list(tables.values())


# ----------------------- форматирование под промпт -----------------------

def schema_overview(tables: list[TableInfo]) -> str:
    """Компактный обзор: одна строка на таблицу. Для шага выбора таблиц."""
    lines = ["## Доступные таблицы (краткий обзор)\n"]
    for t in tables:
        sens_count = sum(1 for c in t.columns if c.sensitive)
        sens_marker = f" [!{sens_count} sens]" if sens_count else ""
        desc = (t.comment[:120] + "...") if len(t.comment) > 120 else t.comment
        lines.append(
            f"- `{t.qualified_name}` ({len(t.columns)} cols{sens_marker}): "
            f"{desc or '(без описания)'}"
        )
    return "\n".join(lines)


def schema_detailed(tables: list[TableInfo]) -> str:
    """Полное описание выбранных таблиц со всеми колонками."""
    lines = []
    for t in tables:
        lines.append(f"### Таблица `{t.qualified_name}`")
        if t.comment:
            lines.append(f"({t.comment})")
        lines.append("")
        lines.append("| Колонка | Тип | NULL | PK | Sensitive | Комментарий |")
        lines.append("|---|---|---|---|---|---|")
        for c in t.columns:
            null = "" if c.nullable else "NO"
            pk = "PK" if c.is_pk else ""
            sens = "[!]" if c.sensitive else ""
            comment = c.comment.replace("|", "\\|").replace("\n", " ")
            lines.append(f"| {c.name} | {c.type} | {null} | {pk} | {sens} | {comment} |")
        lines.append("")
    return "\n".join(lines)