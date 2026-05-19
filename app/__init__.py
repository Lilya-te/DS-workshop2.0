"""Корень FastAPI-приложения.

На Windows psycopg async несовместим с ProactorEventLoop (дефолт с Python 3.8).
Политику цикла ставим как можно раньше — до того, как uvicorn создаст
свой event loop, иначе соединения через async-engine упадут с
InterfaceError. Для Linux/macOS блок ничего не делает.
"""

import asyncio
import sys

if sys.platform == "win32":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
