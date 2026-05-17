"""API v1 package: сборка sub-роутеров под единый префикс /api/v1."""

from fastapi import APIRouter

from app.api.v1.audit_sql import router as audit_router
from app.api.v1.generate_sql import router as generate_router
from app.api.v1.health import router as health_router

api_v1_router = APIRouter(prefix="/api/v1")
api_v1_router.include_router(generate_router, tags=["generation"])
api_v1_router.include_router(audit_router, tags=["audit"])
api_v1_router.include_router(health_router, tags=["health"])
