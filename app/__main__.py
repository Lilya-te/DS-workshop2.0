"""Точка входа для `python -m app`.

Запускает uvicorn так, чтобы не сломалось взаимодействие psycopg async ↔
event loop на Windows. Без этого враппера сценарий выглядит так:
ProactorEventLoop устанавливается самим uvicorn в `auto_loop_setup`, и
psycopg падает с InterfaceError при первом запросе к БД.

Что делаем:
1. Ставим WindowsSelectorEventLoopPolicy ДО импорта uvicorn.
2. Передаём `loop="none"`, чтобы uvicorn не трогал политику и не затирал
   её собственным `auto_loop_setup`.

На Linux/macOS блок про set_event_loop_policy не выполняется, а
`loop="none"` означает «пусть asyncio.run сам выберет дефолт» — это
SelectorEventLoop, что и нужно.
"""

import asyncio
import sys

if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

import uvicorn

from app.core.config import get_settings


def main() -> None:
    settings = get_settings()
    uvicorn.run(
        "app.main:app",
        host=settings.api_host,
        port=settings.api_port,
        reload=False,
        loop="none",
    )


if __name__ == "__main__":
    main()
