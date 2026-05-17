# API: инструкция запуска

Часть проекта **DS-workshop2.0** (общее описание системы — в корневом `README.md`). Этот документ описывает только запуск и проверку API-сервиса.

## Назначение

FastAPI-сервис принимает описание задачи на естественном языке, генерирует SQL-запрос для PostgreSQL, прогоняет его через аудит безопасности и итеративно правит до одобрения или исчерпания лимита итераций. Каждая итерация пишется в таблицу `audit_log`. На Этапе 1 реальные модели генератора и судьи заменены детерминированными заглушками, которые сходятся за 2 итерации — точки подключения реальных реализаций описаны ниже.

## Требования

- Python 3.10+
- Docker и Docker Compose (для локального PostgreSQL)

## Установка

```bash
python -m venv .venv
# Linux/macOS:
source .venv/bin/activate
# Windows:
.venv\Scripts\activate

pip install -r requirements.txt
```

## Запуск

```bash
docker compose up -d              # поднимает Postgres 16 на хосте порт 5433
cp .env.example .env              # дефолты подходят для локалки
alembic upgrade head              # накатывает таблицу audit_log
uvicorn app.main:app --reload     # API на http://localhost:8000
```

Документация API: `http://localhost:8000/docs`. Корень `/` редиректит туда же.

## Эндпоинты

| Метод | Путь                  | Назначение                                        |
|-------|-----------------------|---------------------------------------------------|
| POST  | `/api/v1/generate`    | Полный цикл генератор → судья → исправление       |
| POST  | `/api/v1/audit`       | Разовый аудит готового SQL                        |
| GET   | `/api/v1/health`      | Liveness — процесс жив                            |
| GET   | `/api/v1/readyz`      | Readiness — БД отвечает на `SELECT 1`             |
| GET   | `/`                   | Редирект на `/docs`                               |

В каждом ответе присутствует заголовок `X-Request-Id` (UUID4); он же пишется в structlog-логи в поле `request_id`.

## Smoke-чеклист

Поднять Postgres, накатить миграции и API. Дальше — по списку. Все команды выполняются из корня репозитория.

### 1. Liveness и readiness

```bash
curl -i http://localhost:8000/api/v1/health
# Ожидание: 200, тело {"status":"ok"}, заголовок X-Request-Id.

curl -i http://localhost:8000/api/v1/readyz
# Ожидание: 200, тело {"status":"ready"}. При остановленном Postgres — 503.
```

### 2. Полный цикл генерации

```bash
curl -s -X POST http://localhost:8000/api/v1/generate \
  -H "Content-Type: application/json" \
  -d '{"task_description":"вывести всех клиентов"}'
```

Ожидание (по логике заглушек):
- `status: "approved"`,
- `total_iterations: 2`,
- `iterations[0].decision == "needs_fix"` с одной finding `select_star_excessive`,
- `iterations[1].decision == "approved"`, пустые findings,
- `final_sql` содержит маркер `-- iteration 2`.

Кейс «упёрлись в лимит»:

```bash
curl -s -X POST http://localhost:8000/api/v1/generate \
  -H "Content-Type: application/json" \
  -d '{"task_description":"вывести всех клиентов","max_iterations":1}'
# status: "iteration_limit_exceeded", final_sql: null, total_iterations: 1.
```

Кейс «валидация»:

```bash
curl -s -X POST http://localhost:8000/api/v1/generate \
  -H "Content-Type: application/json" \
  -d '{"task_description":""}'
# 422 от pydantic — task_description должен быть непустым.
```

### 3. Разовый аудит

```bash
curl -s -X POST http://localhost:8000/api/v1/audit \
  -H "Content-Type: application/json" \
  -d '{"sql":"SELECT * FROM users"}'
# overall_risk: 7, одна finding select_star_excessive.

curl -s -X POST http://localhost:8000/api/v1/audit \
  -H "Content-Type: application/json" \
  -d '{"sql":"SELECT id FROM users -- iteration 2"}'
# overall_risk: 0, findings: [].
```

### 4. Проверка записи в `audit_log`

Через контейнер (внутри Postgres всё равно слушает 5432):

```bash
docker compose exec postgres psql -U greendata -d greendata_sql -c \
  "SELECT id, request_id, iteration, decision, created_at FROM audit_log ORDER BY id DESC LIMIT 10;"
```

С хоста (через проброшенный порт 5433):

```bash
psql -h localhost -p 5433 -U greendata -d greendata_sql -c \
  "SELECT id, request_id, iteration, decision, created_at FROM audit_log ORDER BY id DESC LIMIT 10;"
```

Ожидание: на каждый успешный `POST /api/v1/generate` — по 2 строки (итерации 1 и 2), значения `decision`: `needs_fix` затем `approved`, общий `request_id`.

### 5. Структурные логи

В stdout `uvicorn` — JSON-строки с полями `event`, `request_id`, `iteration` и др. Ключевые события:

- `request.completed` — каждый HTTP-запрос: `endpoint`, `method`, `status_code`, `duration_ms`.
- `run.started`, `run.completed` — границы запуска оркестратора.
- `iteration.started`, `iteration.generated`, `iteration.audited`, `iteration.decision` — шаги цикла.
- `iteration.stuck` — если набор `vulnerability_class` повторяется относительно прошлой итерации (на стабах не срабатывает: цикл сходится за 2 шага).

## Структура `app/`

```
app/
  main.py               # точка входа FastAPI, middleware request_id, монтаж роутера
  dependencies.py       # фабрики Depends: Settings, сессия БД, сервисы, оркестратор
  core/
    config.py           # Settings (pydantic-settings) + computed DATABASE_URL
    logging.py          # structlog: JSON в stdout, contextvars
  api/v1/
    __init__.py         # сборка api_v1_router (префикс /api/v1)
    generate_sql.py     # POST /generate
    audit_sql.py        # POST /audit
    health.py           # GET /health, GET /readyz
  schemas/sql.py        # pydantic-модели запросов и ответов, классы уязвимостей
  services/
    generator/generator.py   # GeneratorService (Protocol) + StubGenerator
    judge/judge.py           # JudgeService (Protocol) + StubJudge
    repair/repair.py         # RepairService (Protocol) + StubRepair
    orchestration.py         # IterationOrchestrator + запись в audit_log
  db/
    session.py          # async-engine на psycopg v3, get_session
    models.py           # Base, AuditLog (JSONB)
    repositories/audit_repository.py  # запись AuditLog
```

## Точки расширения для коллег

В `app/dependencies.py` фабрики `get_generator`, `get_judge`, `get_repair` смотрят на `Settings.llm_provider`:

- `LLM_PROVIDER=stub` (по умолчанию) — отдают `StubGenerator`/`StubJudge`/`StubRepair`.
- `LLM_PROVIDER=openai` / `yandexgpt` — сейчас бросают `NotImplementedError`. Сюда Егор и Саша подключают свои реализации, удовлетворяющие протоколам `GeneratorService` / `JudgeService` / `RepairService` из `app/services/{generator,judge,repair}/`. Менять сигнатуры протоколов без согласования не нужно — на них завязан оркестратор.

## Переменные окружения (`.env.example`)

| Переменная           | Дефолт          | Назначение                                              |
|----------------------|-----------------|---------------------------------------------------------|
| `APP_ENV`            | `dev`           | Окружение приложения                                    |
| `LOG_LEVEL`          | `INFO`          | Уровень логов structlog                                 |
| `API_HOST`           | `0.0.0.0`       | Хост uvicorn                                            |
| `API_PORT`           | `8000`          | Порт API                                                |
| `MAX_ITERATIONS`     | `5`             | Лимит итераций оркестратора                             |
| `LLM_PROVIDER`       | `stub`          | `stub` / `openai` / `yandexgpt`                         |
| `LLM_API_KEY`        | —               | Ключ LLM-провайдера                                     |
| `LLM_BASE_URL`       | —               | Базовый URL LLM (для совместимых API)                   |
| `LLM_MODEL`          | —               | Имя модели                                              |
| `POSTGRES_HOST`      | `localhost`     | Хост БД                                                 |
| `POSTGRES_PORT`      | `5433`          | Порт на хосте (5432 у разработчика может быть занят)    |
| `POSTGRES_DB`        | `greendata_sql` | Имя БД                                                  |
| `POSTGRES_USER`      | `greendata`     | Пользователь                                            |
| `POSTGRES_PASSWORD`  | `greendata`     | Пароль (для локалки; в проде переопределяется)          |

`DATABASE_URL` собирается автоматически в `Settings.database_url` как
`postgresql+psycopg://{user}:{pwd}@{host}:{port}/{db}`.
