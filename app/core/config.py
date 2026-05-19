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

    llm_provider: Literal["stub", "openai", "yandexgpt"] = "stub"
    llm_api_key: str | None = None
    llm_base_url: str | None = None
    llm_model: str | None = None

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


@lru_cache
def get_settings() -> Settings:
    return Settings()
