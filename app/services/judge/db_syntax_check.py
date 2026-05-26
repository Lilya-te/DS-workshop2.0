"""Третий контур аудита: проверка SQL средствами реального PostgreSQL.

Зачем нужен поверх правил и LLM-судьи
-------------------------------------
* `rules.py` — regex/AST на sqlglot. sqlglot прощает не-PG диалекты
  (`UPDATE ... LIMIT`, кавычки MySQL, …) и не знает имён функций/колонок.
* `llm_judge.py` — арбитр-LLM поверх правил. Семантика на догадках, без
  верификации.
* Этот модуль — спрашиваем саму базу: «переваришь ли такой SQL?». Реальный
  планировщик ловит синтаксические/семантические ошибки, недоступные предыдущим
  слоям.

Безопасность: без выполнения опасного DML
-----------------------------------------
Используем `EXPLAIN <sql>` внутри `BEGIN ... ROLLBACK`:

* `EXPLAIN` без `ANALYZE` парсит и планирует, но **не исполняет** запрос.
* Транзакция с явным rollback — пояс безопасности (на случай, если кто-то
  переиспользует модуль с `EXPLAIN (ANALYZE)`).
* DDL/`TRUNCATE`/`COPY`/`CALL`/`GRANT` до базы вообще не пускаем — для них
  правил достаточно, а EXPLAIN либо бессмыслен, либо пишет данные.

Архитектура
-----------
* `DbSyntaxChecker` (Protocol) — интерфейс «проверь SQL → AuditResult».
* `PostgresExplainChecker` — продакшн-реализация на async SQLAlchemy.
* `check_with_timeout` — обёртка с timeout и graceful fallback (None при отказе).

`LLMJudge` принимает опциональный `db_checker: DbSyntaxChecker | None`. Если
None — слой выключен (как и было до интеграции). Включается флагом
`Settings.enable_db_syntax_check`.
"""

from __future__ import annotations

import asyncio
import re
from typing import Protocol

from sqlalchemy import text
from sqlalchemy.exc import DBAPIError, SQLAlchemyError
from sqlalchemy.ext.asyncio import async_sessionmaker

from app.core.logging import get_logger
from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding

log = get_logger("app.judge.db_check")


# Команды, которые даже через EXPLAIN не имеет смысла отдавать в БД
# (DDL/служебные/побочные эффекты).
_FORBIDDEN_PREFIXES = re.compile(
    r"^\s*(DROP|TRUNCATE|ALTER|CREATE|GRANT|REVOKE|COPY|CALL|VACUUM|REINDEX)\b",
    re.IGNORECASE,
)

# Поддерживаемые DML/DQL — EXPLAIN для них безопасен (без ANALYZE).
_ALLOWED_PREFIXES = re.compile(
    r"^\s*(SELECT|WITH|UPDATE|DELETE|INSERT)\b",
    re.IGNORECASE,
)


class DbSyntaxChecker(Protocol):
    """Контракт DB-проверки. Реализация: PostgresExplainChecker."""

    async def check(self, sql: str) -> AuditResult: ...


def _skip_result(reason: str) -> AuditResult:
    return AuditResult(overall_risk=0, findings=[], summary=reason)


def _error_result(error_message: str) -> AuditResult:
    """Конвертирует ошибку PG в одну находку аудитора."""
    first_line = error_message.strip().splitlines()[0] if error_message.strip() else "unknown"
    return AuditResult(
        overall_risk=9,
        findings=[
            VulnerabilityFinding(
                vulnerability_class=VulnerabilityClass.UPDATE_DELETE_WITHOUT_WHERE,
                risk_score=9,
                explanation=(
                    f"PostgreSQL отказался планировать запрос: {first_line}. "
                    "Такой SQL не должен попадать пользователю — перепишите его."
                ),
                suggested_fix=(
                    "Сверьте синтаксис с документацией PostgreSQL "
                    "(`UPDATE ... LIMIT`, `RETURNING`, кавычки идентификаторов, "
                    "имена функций/колонок)."
                ),
            )
        ],
        summary="DB-проверка: PostgreSQL отверг запрос на этапе планировщика.",
    )


def _is_supported(sql: str) -> AuditResult | None:
    """Возвращает skip-результат, если SQL не подходит для DB-проверки; иначе None."""
    if _FORBIDDEN_PREFIXES.match(sql):
        return _skip_result(
            "DDL/TRUNCATE/COPY не проверяются через БД (политика безопасности)."
        )
    if not _ALLOWED_PREFIXES.match(sql):
        return _skip_result(
            "Команда не поддерживается для DB-проверки — пропускаем."
        )
    return None


class PostgresExplainChecker:
    """Прод-реализация DbSyntaxChecker.

    На каждый вызов `check()` создаём короткоживущую сессию через переданный
    `async_sessionmaker`, запускаем `EXPLAIN` в транзакции и откатываем.
    """

    def __init__(self, session_factory: async_sessionmaker) -> None:  # type: ignore[type-arg]
        self._session_factory = session_factory

    async def check(self, sql: str) -> AuditResult:
        skip = _is_supported(sql)
        if skip is not None:
            return skip

        try:
            async with self._session_factory() as session:
                async with session.begin():
                    await session.execute(text(f"EXPLAIN {sql}"))
                    # begin() сам сделает rollback при исключении; принудительно
                    # откатываем после успеха, чтобы никаких побочек не осталось
                    # даже если в будущем кто-то заменит EXPLAIN на EXPLAIN ANALYZE.
                    await session.rollback()
        except (DBAPIError, SQLAlchemyError) as e:
            msg = str(getattr(e, "orig", e))
            log.info("audit.db_check.rejected", error=msg.splitlines()[0] if msg else "")
            return _error_result(msg)
        except Exception as e:  # noqa: BLE001 — сетевые/неожиданные классы
            # Не PG-ошибка, а связь/драйвер/что-то ещё. Это не «SQL плохой»,
            # это «БД недоступна». Не блокируем аудит — отдаём skip.
            log.warning(
                "audit.db_check.unavailable",
                error=f"{type(e).__name__}: {e}",
            )
            return _skip_result("DB-проверка недоступна (соединение/драйвер).")

        return AuditResult(
            overall_risk=0,
            findings=[],
            summary="DB-проверка: PostgreSQL принял запрос (EXPLAIN успешен).",
        )


async def check_with_timeout(
    checker: DbSyntaxChecker,
    sql: str,
    timeout_seconds: float,
) -> AuditResult | None:
    """Запускает checker.check() с таймаутом.

    Возвращает None при таймауте или внутренней ошибке — это сигнал «слой
    промолчал», и `LLMJudge` пойдёт дальше как будто DB-проверки не было.
    """
    try:
        return await asyncio.wait_for(checker.check(sql), timeout=timeout_seconds)
    except asyncio.TimeoutError:
        log.warning("audit.db_check.timeout", timeout_seconds=timeout_seconds)
        return None
    except Exception as e:  # noqa: BLE001
        log.warning("audit.db_check.error", error=f"{type(e).__name__}: {e}")
        return None
