"""Pydantic-схемы API: запросы, ответы и описание уязвимостей."""

from enum import StrEnum
from typing import Literal

from pydantic import BaseModel, Field


class VulnerabilityClass(StrEnum):
    """Классы уязвимостей из ТЗ заказчика."""

    SQL_VALIDATION_ERROR = "sql_validation_error"
    SQL_INJECTION_CLASSIC = "sql_injection_classic"
    UNION_BASED_INJECTION = "union_based_injection"
    TIME_BASED_BLIND_INJECTION = "time_based_blind_injection"
    PRIVILEGE_ESCALATION_EXECUTE = "privilege_escalation_execute"
    SELECT_STAR_EXCESSIVE = "select_star_excessive"
    UPDATE_DELETE_WITHOUT_WHERE = "update_delete_without_where"
    SENSITIVE_FIELD_ACCESS = "sensitive_field_access"
    UNBOUNDED_LIMIT = "unbounded_limit"
    PLPGSQL_UNSAFE_EXECUTE = "plpgsql_unsafe_execute"


class VulnerabilityFinding(BaseModel):
    """Одна находка аудитора. StrEnum сериализуется в JSON по value автоматически."""

    vulnerability_class: VulnerabilityClass
    risk_score: int = Field(ge=0, le=10)
    explanation: str
    suggested_fix: str | None = None


class AuditResult(BaseModel):
    """Результат аудита SQL."""

    overall_risk: int = Field(ge=0, le=10)
    findings: list[VulnerabilityFinding] = Field(default_factory=list)
    summary: str


class IterationStep(BaseModel):
    """Шаг цикла: сгенерированный SQL и решение аудитора."""

    iteration: int = Field(ge=1)
    generated_sql: str
    audit: AuditResult
    decision: Literal["approved", "needs_fix"]


class GenerateRequest(BaseModel):
    task_description: str = Field(min_length=1)
    db_schema: dict | None = None
    max_iterations: int | None = Field(default=None, ge=1, le=20)


class GenerateResponse(BaseModel):
    request_id: str
    status: Literal["approved", "iteration_limit_exceeded"]
    final_sql: str | None
    iterations: list[IterationStep]
    total_iterations: int = Field(ge=0)


class AuditRequest(BaseModel):
    sql: str = Field(min_length=1)
    db_schema: dict | None = None
