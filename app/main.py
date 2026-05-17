"""Точка входа FastAPI-приложения."""

import asyncio
import sys
import time
import uuid
from collections.abc import Awaitable, Callable

from fastapi import FastAPI, Request, Response
from fastapi.responses import RedirectResponse

# psycopg async на Windows не работает с ProactorEventLoop (дефолт с Python 3.8).
# Установка политики должна произойти до создания engine.
if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

from app.api.v1 import api_v1_router
from app.core.config import get_settings
from app.core.logging import configure_logging, get_logger, request_id_ctx

settings = get_settings()
configure_logging(settings.log_level)
log = get_logger("app")

app = FastAPI(
    title="GreenData SQL Security API",
    description="Многоагентная генерация и аудит безопасности SQL-запросов.",
    version="0.1.0",
)

app.include_router(api_v1_router)


@app.middleware("http")
async def request_id_middleware(
    request: Request,
    call_next: Callable[[Request], Awaitable[Response]],
) -> Response:
    """Проставляет X-Request-Id, кладёт его в contextvars и логирует длительность запроса."""
    request_id = request.headers.get("X-Request-Id") or str(uuid.uuid4())
    token = request_id_ctx.set(request_id)
    start = time.perf_counter()
    try:
        response = await call_next(request)
    except Exception:
        duration_ms = (time.perf_counter() - start) * 1000
        log.exception(
            "request.failed",
            endpoint=request.url.path,
            method=request.method,
            duration_ms=round(duration_ms, 2),
        )
        raise
    else:
        duration_ms = (time.perf_counter() - start) * 1000
        log.info(
            "request.completed",
            endpoint=request.url.path,
            method=request.method,
            status_code=response.status_code,
            duration_ms=round(duration_ms, 2),
        )
        response.headers["X-Request-Id"] = request_id
        return response
    finally:
        request_id_ctx.reset(token)


@app.get("/", include_in_schema=False)
async def root() -> RedirectResponse:
    return RedirectResponse(url="/docs")
