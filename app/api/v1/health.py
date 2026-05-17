"""Роутер healthcheck: liveness (/health) и readiness (/readyz)."""

from fastapi import APIRouter, HTTPException, status
from sqlalchemy import text

from app.dependencies import SessionDep

router = APIRouter()


@router.get("/health")
async def health() -> dict[str, str]:
    """Liveness: процесс жив."""
    return {"status": "ok"}


@router.get("/readyz")
async def readyz(session: SessionDep) -> dict[str, str]:
    """Readiness: БД отвечает на SELECT 1."""
    try:
        await session.execute(text("SELECT 1"))
    except Exception as exc:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=f"database unavailable: {exc.__class__.__name__}",
        ) from exc
    return {"status": "ready"}
