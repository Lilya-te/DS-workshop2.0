"""Админ-роутер: служебные операции.

POST /admin/reload-schema -- горячая перезагрузка схемы БД из файла
без рестарта сервиса (например, после обновления data_model.sql).
"""

from fastapi import APIRouter
from pydantic import BaseModel

from app.core.logging import get_logger
from app.dependencies import SchemaCacheDep

router = APIRouter()
log = get_logger("app.admin")


class ReloadSchemaResponse(BaseModel):
    status: str
    tables_count: int


@router.post("/admin/reload-schema", response_model=ReloadSchemaResponse)
async def reload_schema(cache: SchemaCacheDep) -> ReloadSchemaResponse:
    """Перечитывает DDL-файл и обновляет кеш схемы.

    Используется после обновления схемы заказчиком -- чтобы не
    перезапускать сервис целиком.
    """
    count = cache.reload()
    log.info("admin.schema_reloaded", tables_count=count)
    return ReloadSchemaResponse(status="reloaded", tables_count=count)