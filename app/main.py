"""Точка входа FastAPI-приложения.

Политика event loop для Windows-окружения выставляется в app/__init__.py —
до любых импортов asyncio-кода.
"""

import time
import uuid
from collections.abc import AsyncIterator, Awaitable, Callable
from contextlib import asynccontextmanager

from fastapi import FastAPI, Request, Response

from app.api.ui import router as ui_router
from app.api.v1 import api_v1_router
from app.core.config import get_settings
from app.core.logging import configure_logging, get_logger, request_id_ctx
from app.dependencies import get_schema_cache

settings = get_settings()
configure_logging(settings.log_level)
log = get_logger("app")


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncIterator[None]:
    """Инициализация при старте: загрузка схемы БД в кеш.

    Парсинг DDL (~0.5с) делается один раз здесь, а не на каждом запросе.
    Если файл схемы не найден -- логируем предупреждение, но не падаем
    (stub-провайдер схему не использует, сервис должен подняться).
    """
    cache = get_schema_cache()
    try:
        cache.load_from_file(settings.db_schema_path)
        log.info("startup.schema_loaded", tables=cache.tables_count())
    except FileNotFoundError:
        log.warning(
            "startup.schema_not_found",
            path=settings.db_schema_path,
            hint="Кеш схемы пуст. LLM-провайдеры не смогут работать без схемы.",
        )
    yield
    # Здесь можно закрывать ресурсы при остановке (пока ничего не нужно)


app = FastAPI(
    title="GreenData SQL Security API",
    description="Многоагентная генерация и аудит безопасности SQL-запросов.",
    version="0.1.0",
    lifespan=lifespan,
)

app.include_router(ui_router)
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

