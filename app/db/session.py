from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Управление сессией SQLAlchemy.
# Здесь будет:
# - создание engine для PostgreSQL;
# - фабрика SessionLocal;
# - dependency для выдачи/закрытия сессии в запросах FastAPI.
