"""Роутер генерации SQL: запуск полного итеративного цикла."""

from fastapi import APIRouter

from app.dependencies import OrchestratorDep
from app.schemas.sql import GenerateRequest, GenerateResponse

router = APIRouter()


@router.post("/generate", response_model=GenerateResponse)
async def generate_sql(
    payload: GenerateRequest,
    orchestrator: OrchestratorDep,
) -> GenerateResponse:
    return await orchestrator.run(
        task_description=payload.task_description,
        db_schema=payload.db_schema,
        max_iterations_override=payload.max_iterations,
    )
