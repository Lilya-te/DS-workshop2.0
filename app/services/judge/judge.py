"""Сервис аудита SQL ('судья')."""

from typing import Protocol

from app.schemas.sql import AuditResult, VulnerabilityClass, VulnerabilityFinding


class JudgeService(Protocol):
    """Контракт судьи: SQL → набор уязвимостей и итоговая оценка риска.

    Точка расширения для реальной модели Саши.
    """

    async def audit(self, sql: str, db_schema: dict | None) -> AuditResult: ...


class StubJudge:
    """Заглушка судьи: stateless, решение по маркеру -- iteration в SQL.

    Первая итерация (маркера нет): одна finding SELECT_STAR_EXCESSIVE,
    overall_risk=7, статус needs_fix.
    Вторая итерация (маркер есть): пустые findings, overall_risk=0,
    статус approved. Так цикл сходится за 2 итерации.
    """

    async def audit(self, sql: str, db_schema: dict | None) -> AuditResult:
        _ = db_schema
        if "-- iteration" in sql:
            return AuditResult(
                overall_risk=0,
                findings=[],
                summary="Запрос не содержит выявленных уязвимостей.",
            )
        return AuditResult(
            overall_risk=7,
            findings=[
                VulnerabilityFinding(
                    vulnerability_class=VulnerabilityClass.SELECT_STAR_EXCESSIVE,
                    risk_score=7,
                    explanation=(
                        "Запрос использует SELECT *: возвращаются все поля таблицы, "
                        "включая потенциально чувствительные."
                    ),
                    suggested_fix="Явно перечислить необходимые поля вместо *.",
                )
            ],
            summary="Обнаружена 1 уязвимость уровня риска 7/10.",
        )
