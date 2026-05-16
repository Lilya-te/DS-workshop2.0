from pydantic_settings import BaseSettings, SettingsConfigDict

# Конфигурация приложения через переменные окружения.
# Здесь будет:
# - класс Settings с параметрами FastAPI и Postgres;
# - настройки интеграций (LLM API, observability, feature flags);
# - загрузка значений из .env и окружения контейнера.
