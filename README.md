# Интеллектуальная система генерации и аудита безопасности SQL-запросов

## Собрать и поднять контейнер

```
docker compose build
```

```
docker compose up -d
docker compose run --rm api alembic upgrade head
```
Документация API будет доступна локально [тут](http://127.0.0.1:8000/docs)

### Схема GreenData (`data_model.sql`)

При **первом** создании тома Postgres скрипт применяется автоматически (`docker/postgres/apply_data_model.sh`).

Если база уже была создана раньше — применить вручную:

```
docker compose exec postgres bash /schema/apply_data_model.sh
```

Полная пересборка БД с нуля (удалит данные):

```
docker compose down -v
docker compose up -d
docker compose run --rm api alembic upgrade head
```

### Проверка таблиц
```
docker compose exec postgres psql -U greendata -d greendata_sql -c "\dt public.*" | head -20
```

### Миграции Alembic (`audit_log`)

```
docker compose run --rm api alembic upgrade head
```

Если `api` уже запущен:

```
docker compose exec api alembic upgrade head
```
