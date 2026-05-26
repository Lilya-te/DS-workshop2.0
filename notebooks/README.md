# Jupyter notebooks

В этой папке исследовательские ноутбуки:
- анализ схемы базы;
- тестирование промптов;
- оценка метрик качества генерации и аудита.

## Доступные ноутбуки

### `01_generator_experiments_exp.ipynb`

Эксперименты с моделью-генератором SQL. Подключение к LLM через OpenRouter
(облако) или Ollama (локально), парсинг DDL заказчика на sqlglot, подвыборка
релевантных таблиц под запрос, baseline-промпт, прогон на тест-кейсах,
структурированное логирование всех вызовов в JSONL.

#### Запуск

1. **Окружение.** Из корня проекта:
```bash
   python3 -m venv .venv
   source .venv/bin/activate     # macOS / Linux
   # .venv\Scripts\activate      # Windows
   pip install -r requirements.txt
```

2. **API-ключ OpenRouter.** Получить на https://openrouter.ai/keys (бесплатно).
   Создать `.env` в корне проекта:
   OPENROUTER_API_KEY=sk-or-v1-...

3. **(Опционально) Ollama** для локальных моделей:
```bash
   brew install ollama       # macOS
   ollama serve              # в отдельном терминале
   ollama pull qwen2.5-coder:7b
```

4. **Запустить ноутбук:**
```bash
   jupyter lab notebooks/01_generator_experiments_exp.ipynb
```

#### Что внутри

Структура ноутбука по секциям:
1. Окружение и LLMClient.
2. Парсер DDL на sqlglot (47 таблиц схемы заказчика).
2b. Подвыборка релевантных таблиц по ключевым словам.
3. Системный промпт v0 (baseline без few-shot).
4. Универсальные тест-кейсы (CRUD, агрегация, чувствительные данные).
5. Прогон baseline по выбранным моделям.
6. Анализ результатов в pandas (латентность, токены, эвристические проверки).

#### Логи экспериментов

Каждый LLM-вызов пишется в `notebooks/experiment_logs/generator_calls.jsonl`
со всеми деталями (промпт, ответ, латентность, токены, метаданные эксперимента).
Логи в git **не коммитятся** (см. `.gitignore`).

#### Текущие ограничения

- Парсер пока не понимает NOT NULL, выставленный отдельным `ALTER TABLE`.
- Селектор таблиц — простая эвристика по ключевым словам, иногда ошибается
  на расплывчатых запросах (см. TODO в ноутбуке).
- На бесплатных тирах OpenRouter возможны 429 (rate limit) — нужно ретраить
  или подключить платный тир.

### `sql_auditor.ipynb`

Ноутбук-аудитор («судья») — второй агент в связке *генератор → судья → исправление*.
Синхронизирован с `app/services/judge/`:

- контракт `AuditResult` / `VulnerabilityClass` (включая `sql_validation_error`);
- rule-based слой `rules_audit()` (regex + sqlglot AST);
- LLM-судья с промптом на русском;
- гибридный агрегатор «правила → LLM» с фейловером моделей (Colab).

#### Запуск

1. Окружение — как для генератора (`pip install -r requirements.txt`).
2. API-ключи: Groq / Gemini / OpenRouter через Colab Secrets или переменные окружения.
3. *(Опционально)* PostgreSQL для runtime-проверки:
   ```python
   CONFIG["judge_db_check_enabled"] = True
   CONFIG["postgres_url"] = "postgresql://greendata:greendata@localhost:5433/greendata_sql"
   ```
4. ```bash
   jupyter lab notebooks/sql_auditor.ipynb
   ```

#### Что покрывает rule-based слой

| Проверка | Пример |
|---|---|
| Чувствительные колонки | `adress_ad`, `password_hash` (эвристика + DDL) |
| Диалект PostgreSQL | `UPDATE ... LIMIT 1` → finding |
| SQL-инъекции | тавтологии, `UNION SELECT`, `pg_sleep` |
| Массовые DML | `DELETE`/`UPDATE` без `WHERE` |
| DoS | `SELECT` без `LIMIT` |

Entrypoint для прогонов: `audit_for_generator(sql, db_schema)`.
Контракт для интеграции: `audit_async(sql, db_schema) -> AuditResult`.