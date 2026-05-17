"""Оркестратор цикла 'генератор → судья → исправление'."""

import uuid

from app.core.logging import get_logger
from app.db.repositories.audit_repository import AuditRepository
from app.schemas.sql import (
    AuditResult,
    GenerateResponse,
    IterationStep,
)
from app.services.generator.generator import GeneratorService
from app.services.judge.judge import JudgeService
from app.services.repair.repair import RepairService

log = get_logger("app.orchestrator")


class IterationOrchestrator:
    """Запускает итеративный цикл и пишет каждый шаг в audit_log."""

    def __init__(
        self,
        *,
        generator: GeneratorService,
        judge: JudgeService,
        repair: RepairService,
        audit_repo: AuditRepository,
        max_iterations: int,
    ) -> None:
        self._generator = generator
        self._judge = judge
        self._repair = repair
        self._audit_repo = audit_repo
        self._max_iterations = max_iterations

    async def run(
        self,
        *,
        task_description: str,
        db_schema: dict | None,
        max_iterations_override: int | None = None,
    ) -> GenerateResponse:
        request_id = str(uuid.uuid4())
        limit = max_iterations_override or self._max_iterations

        iterations: list[IterationStep] = []
        previous_classes: list[str] | None = None
        current_sql: str = ""
        current_audit: AuditResult | None = None
        approved = False

        log.info(
            "run.started",
            run_request_id=request_id,
            max_iterations=limit,
            task_length=len(task_description),
        )

        for iteration in range(1, limit + 1):
            log.info("iteration.started", run_request_id=request_id, iteration=iteration)

            if iteration == 1:
                current_sql = await self._generator.generate(
                    task_description=task_description,
                    db_schema=db_schema,
                )
            else:
                assert current_audit is not None  # для типов; цикл гарантирует
                current_sql = await self._repair.repair(
                    original_sql=current_sql,
                    audit_feedback=current_audit,
                    task_description=task_description,
                    db_schema=db_schema,
                    iteration=iteration,
                )

            log.info(
                "iteration.generated",
                run_request_id=request_id,
                iteration=iteration,
                sql_length=len(current_sql),
            )

            current_audit = await self._judge.audit(current_sql, db_schema)
            current_classes = sorted(
                f.vulnerability_class.value for f in current_audit.findings
            )

            log.info(
                "iteration.audited",
                run_request_id=request_id,
                iteration=iteration,
                overall_risk=current_audit.overall_risk,
                findings_count=len(current_audit.findings),
            )

            # TODO: порог одобрения — кандидат на вынос в конфиг.
            is_approved = current_audit.overall_risk == 0 and not current_audit.findings
            decision: str = "approved" if is_approved else "needs_fix"

            iterations.append(
                IterationStep(
                    iteration=iteration,
                    generated_sql=current_sql,
                    audit=current_audit,
                    decision=decision,  # type: ignore[arg-type]
                )
            )

            await self._audit_repo.record_iteration(
                request_id=request_id,
                iteration=iteration,
                task_description=task_description if iteration == 1 else None,
                generated_sql=current_sql,
                audit_result=current_audit.model_dump(mode="json"),
                decision=decision,
            )

            log.info(
                "iteration.decision",
                run_request_id=request_id,
                iteration=iteration,
                decision=decision,
            )

            if previous_classes is not None and previous_classes == current_classes:
                log.warning(
                    "iteration.stuck",
                    run_request_id=request_id,
                    iteration=iteration,
                    vulnerability_classes=current_classes,
                )
            previous_classes = current_classes

            if is_approved:
                approved = True
                break

        status: str = "approved" if approved else "iteration_limit_exceeded"
        final_sql: str | None = current_sql if approved else None

        log.info(
            "run.completed",
            run_request_id=request_id,
            status=status,
            total_iterations=len(iterations),
        )

        return GenerateResponse(
            request_id=request_id,
            status=status,  # type: ignore[arg-type]
            final_sql=final_sql,
            iterations=iterations,
            total_iterations=len(iterations),
        )
