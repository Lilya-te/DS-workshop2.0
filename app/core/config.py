"""Конфигурация приложения через переменные окружения."""

from functools import lru_cache
from typing import Literal

from pydantic import Field, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Настройки приложения. Источник — переменные окружения и файл .env."""

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        case_sensitive=False,
        extra="ignore",
    )

    app_env: Literal["dev", "prod"] = "dev"
    log_level: str = "INFO"

    max_iterations: int = Field(default=5, ge=1, le=20)

    llm_provider: Literal["stub", "openrouter", "ollama", "openai", "yandexgpt"] = "stub"
    llm_api_key: str | None = None
    llm_base_url: str | None = None
    llm_model: str | None = None  # общая модель по умолчанию (fallback)

    # Раздельные модели для генератора / репаратора / аудитора.
    # Если не заданы -- используется llm_model.
    generator_model: str | None = None
    repair_model: str | None = None
    judge_model: str | None = None

    # Параметры генерации LLM
    llm_temperature: float = Field(default=0.2, ge=0.0, le=2.0)
    llm_max_tokens: int = Field(default=1024, ge=1, le=8192)
    llm_timeout: float = Field(default=60.0, ge=1.0)
    llm_max_retries: int = Field(default=4, ge=0, le=10)

    # Путь к DDL-схеме БД (парсится в SchemaCache при старте)
    db_schema_path: str = "data_model.sql"

    # Число релевантных таблиц, подаваемых в контекст промпта
    schema_top_k_tables: int = Field(default=5, ge=1, le=20)

    # Доп. уровень валидации SQL: безопасный EXPLAIN в PostgreSQL (опционально).
    judge_db_check_enabled: bool = False
    judge_db_check_timeout: float = Field(default=2.5, ge=0.1, le=30.0)

    api_host: str = "0.0.0.0"
    api_port: int = 8000

    postgres_host: str = "localhost"
    postgres_port: int = 5433
    postgres_db: str = "greendata_sql"
    postgres_user: str = "greendata"
    postgres_password: str = "greendata"

    @computed_field  # type: ignore[prop-decorator]
    @property
    def database_url(self) -> str:
        return (
            f"postgresql+psycopg://{self.postgres_user}:{self.postgres_password}"
            f"@{self.postgres_host}:{self.postgres_port}/{self.postgres_db}"
        )
	
    @computed_field  # type: ignore[prop-decorator]
    @property
    def effective_generator_model(self) -> str | None:
        """Модель для генератора: generator_model или общий llm_model."""
        return self.generator_model or self.llm_model

    @computed_field  # type: ignore[prop-decorator]
    @property
    def effective_repair_model(self) -> str | None:
        """Модель для репаратора: repair_model или общий llm_model."""
        return self.repair_model or self.llm_model

    @computed_field  # type: ignore[prop-decorator]
    @property
    def effective_judge_model(self) -> str | None:
        """Модель для аудитора: judge_model или общий llm_model."""
        return self.judge_model or self.llm_model


@lru_cache
def get_settings() -> Settings:
    return Settings()
