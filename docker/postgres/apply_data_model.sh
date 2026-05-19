#!/bin/bash
# Раскатывает data_model.sql в БД из POSTGRES_DB (greendata_sql).
# Пропускает CREATE DATABASE demo_db и \connect — дамп из GreenData
# рассчитан на отдельную БД, а приложение подключается к greendata_sql.

set -euo pipefail

SCHEMA_FILE="${SCHEMA_FILE:-/schema/data_model.sql}"

if [[ ! -f "$SCHEMA_FILE" ]]; then
  echo "Schema file not found: $SCHEMA_FILE" >&2
  exit 1
fi

echo "Applying schema from $SCHEMA_FILE to database: ${POSTGRES_DB}"

sed -e '/^CREATE DATABASE/d' -e '/^\\connect/d' "$SCHEMA_FILE" | \
  psql -v ON_ERROR_STOP=1 \
    --username "${POSTGRES_USER}" \
    --dbname "${POSTGRES_DB}"

echo "Schema applied successfully."
