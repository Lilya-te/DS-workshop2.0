"""GreenData SQL Security System baseline for hackathon participants.

Минимальный каркас:
- только контракты (вход/выход),
- пустые методы для реализации командой,
- одна итоговая функция запуска пайплайна.
"""

from __future__ import annotations


from datetime import datetime
from dataclasses import dataclass, field
from typing import Any


@dataclass
class Vulnerability:
    """Найденная уязвимость."""

    vuln_class: str          # Ключ из справочника VULN_CLASSES
    risk_score: float        # Оценка риска от 0.0 до 10.0
    description: str         # Человекочитаемое пояснение
    recommendation: str      # Конкретный совет по исправлению
    line_hint: int = ""      # Необязательно: позиция в исходном SQL, где найдена проблема


@dataclass
class AuditResult:
    """Результат проверки SQL."""

    approved: bool                          # True — запрос прошёл проверку
    vulnerabilities: list[Vulnerability]    # Список найденных уязвимостей (пусто если approved=True)
    overall_risk_score: float               # Итоговый риск: 0.0 (безопасно) … 10.0 (критично)
    summary: str                            # Краткий вердикт для пользователя


@dataclass
class IterationLog:
    """Лог одной итерации."""
    timestamp: datetime
    iteration: int
    sql_query: str
    audit_result: AuditResult
    revision_notes: str = ""    # Что именно было исправлено по сравнению с предыдущей итерацией


@dataclass
class SystemResult:
    """Финальный результат системы."""

    final_sql: str                      # Итоговый SQL-запрос
    approved: bool                      # Одобрен ли финальный запрос
    iterations_used: int                # Сколько итераций потребовалось
    iterations_log: list[IterationLog]  # Полный лог всех итераций
    audit_log: str                      # Человекочитаемый отчёт для аналитика
    metadata: dict[str, Any] = field(default_factory=dict)  # Любые доп. данные команды


class SQLGenerator:
    """Генерирует SQL по текстовому описанию задачи."""

    def __init__(self, db_schema: dict[str, Any] | None = None, **kwargs: Any) -> None:
        self.db_schema = db_schema or {}
        self.kwargs = kwargs

    def generate(
        self,
        task_description: str,
        sql_history: list[str] | None = None,
        audit_feedback: AuditResult | None = None,
        iteration: int = 1,
    ) -> str:
        """Input: task_description/sql_history/audit_feedback/iteration. Output: SQL string."""
        raise NotImplementedError("Implement SQLGenerator.generate()")


class SecurityAuditor:
    """Проверяет SQL-запрос на типовые уязвимости."""
    VULN_CLASSES = {                                                            
        "SQL_INJ_CLASSIC": "SQL Injection (классический)",                      
        "SQL_INJ_UNION": "Union-based Injection",                               
        "DML_NO_WHERE": "UPDATE/DELETE без WHERE",                              
        "SELECT_STAR": "Избыточный SELECT *",                                   
        "DIRECT_SENSITIVE": "Прямой доступ к чувствительным полям",             
        "NO_PAGINATION": "Неограниченный LIMIT / отсутствие пагинации",         
        "SQL_INJ_TIME": "Time-based blind Injection",                           
        "PRIV_ESCALATE": "Privilege Escalation через EXECUTE",                  
        "PLPGSQL_UNSAFE": "PL/pgSQL: небезопасный EXECUTE",                     
    }                                                                           
    RISK_THRESHOLD = 4.0                                                    


    def __init__(self, **kwargs: Any) -> None:
        self.kwargs = kwargs

    def audit(self, sql_query: str, db_schema: dict[str, Any] | None = None) -> AuditResult:
        """Input: sql_query/db_schema. Output: AuditResult with vulnerabilities, risk and approval."""
        raise NotImplementedError("Implement SecurityAuditor.audit()")


class SQLSecuritySystem:
    """Оркестрирует цикл генерация -> аудит -> исправление."""

    DEFAULT_MAX_ITERATIONS = 5

    def __init__(
        self,
        generator: SQLGenerator,
        auditor: SecurityAuditor,
        max_iterations: int = DEFAULT_MAX_ITERATIONS,
    ) -> None:
        self.generator = generator
        self.auditor = auditor
        self.max_iterations = max_iterations

    def run(self, task_description: str) -> SystemResult:
        """Input: task_description. Output: SystemResult with final SQL, approval flag and iteration log."""
        raise NotImplementedError("Implement SQLSecuritySystem.run()")


def run_sql_security_pipeline(
    task_description: str,
    db_schema: dict[str, Any] | None = None,
    max_iterations: int = SQLSecuritySystem.DEFAULT_MAX_ITERATIONS,
    generator_kwargs: dict[str, Any] | None = None,
    auditor_kwargs: dict[str, Any] | None = None,
) -> SystemResult:
    """Main entrypoint.

    Input:
    - task_description: natural language task.
    - db_schema: machine-readable DB schema.
    - max_iterations: iteration limit for generator->auditor loop.
    - generator_kwargs/auditor_kwargs: optional params for custom implementations.

    Output:
    - SystemResult.
    """
    generator = SQLGenerator(db_schema=db_schema or {}, **(generator_kwargs or {}))
    auditor = SecurityAuditor(**(auditor_kwargs or {}))
    system = SQLSecuritySystem(generator=generator, auditor=auditor, max_iterations=max_iterations)
    return system.run(task_description=task_description)

