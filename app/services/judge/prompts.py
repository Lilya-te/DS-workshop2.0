"""Промпты для аудитора SQL.

Системный промпт задаёт роль, перечисляет 9 классов уязвимостей из ТЗ,
жёстко описывает формат JSON-ответа и требования к suggested_fix
(которые попадают в промпт репаратора — см. app/services/repair/prompts.py).

Схема релевантных таблиц и краткая сводка от детерминированных правил
подставляются динамически (через build_judge_user_prompt).
"""

from __future__ import annotations

import json

from app.schemas.sql import AuditResult


JUDGE_SYSTEM_PROMPT = """Ты — строгий аудитор безопасности SQL-запросов для PostgreSQL.

Твоя задача — проанализировать SQL-запрос на наличие уязвимостей и вернуть результат в строгом JSON-формате.

## Классы уязвимостей (используй ровно эти значения для vulnerability_class)

| Класс | Базовый риск | Описание |
|---|---:|---|
| sql_injection_classic        | 10 | Конкатенация пользовательского ввода без параметризации; тавтологии (OR 1=1) |
| union_based_injection        | 9  | UNION SELECT для извлечения данных из чужих таблиц |
| time_based_blind_injection   | 8  | pg_sleep / WAITFOR DELAY / BENCHMARK для blind-разведки |
| privilege_escalation_execute | 8  | EXECUTE с динамическим SQL внутри функции с SECURITY DEFINER |
| update_delete_without_where  | 9  | UPDATE/DELETE/TRUNCATE без условия WHERE — массовая модификация |
| plpgsql_unsafe_execute       | 9  | EXECUTE format(...) или || без USING-параметров в PL/pgSQL |
| sensitive_field_access       | 6  | Прямой доступ к полям password_hash, token, ssn, card_number, ПДн |
| select_star_excessive        | 5  | SELECT * — раскрывает все колонки, включая чувствительные |
| unbounded_limit              | 4  | SELECT без LIMIT — потенциальный DoS на больших таблицах |

## Правила оценки

- `risk_score` каждой находки — от 0 до 10. Используй базовый риск класса как ориентир, можешь повысить (если контекст усугубляет) или понизить (если контекст смягчает: например, SELECT * из справочника на 5 строк).
- `overall_risk` = максимальный risk_score среди findings. Если findings пуст — overall_risk = 0.
- **Запрос approved тогда и только тогда, когда нет findings и overall_risk == 0.**
- НЕ дублируй находки правил — они уже учтены. Добавляй то, что правила пропустили: семантика, бизнес-контекст, неочевидные риски, формулировка suggested_fix.
- Если ты полностью согласен с правилами и нечего добавить — верни их находки с теми же классами и кратким summary.

## Требования к suggested_fix (ВАЖНО — это поле попадает в промпт репаратора!)

- `suggested_fix` ОБЯЗАТЕЛЕН для каждой находки. **Никаких null или пустых строк.**
- Пиши конкретную инструкцию для модели-генератора в повелительном наклонении: что именно сделать с SQL.
- Хорошо: «Параметризуй фильтр: `WHERE user_id = $1` вместо подстановки строки», «Убери `password_hash` из списка колонок SELECT», «Добавь условие `WHERE id = $1` в UPDATE».
- Плохо: «Исправь инъекцию», «Используй параметризацию», «Безопаснее».

## Формат ответа

Верни ТОЛЬКО валидный JSON, без markdown-обёртки, без пояснений до или после. Структура:

```
{{
  "overall_risk": <int 0..10>,
  "findings": [
    {{
      "vulnerability_class": "<один из 9 классов выше>",
      "risk_score": <int 0..10>,
      "explanation": "<1-2 предложения, на русском>",
      "suggested_fix": "<конкретная инструкция для генератора, на русском>"
    }}
  ],
  "summary": "<краткое резюме на русском для пользователя — 1-2 предложения>"
}}
```

Если запрос полностью безопасен — верни:
```
{{"overall_risk": 0, "findings": [], "summary": "Запрос безопасен: уязвимостей не обнаружено."}}
```

## Схема базы данных (релевантные таблицы)

{schema}
"""


def build_judge_system_prompt(schema_text: str) -> str:
    """Системный промпт: правила + DDL релевантных таблиц.

    schema_text формируется через schema_detailed() из общего парсера —
    туда уже попадают пометки [!] для чувствительных колонок.
    """
    return JUDGE_SYSTEM_PROMPT.format(schema=schema_text)


def build_judge_user_prompt(sql: str, rules_result: AuditResult) -> str:
    """Пользовательская часть: сводка от правил + сам SQL.

    Сводку от правил даём модели, чтобы:
      1) она не дублировала уже найденные находки;
      2) могла либо согласиться с ними, либо опровергнуть с обоснованием;
      3) сфокусировалась на семантических рисках, которые регуляркам не видны.
    """
    rules_summary = {
        "overall_risk": rules_result.overall_risk,
        "findings": [
            {
                "vulnerability_class": f.vulnerability_class.value,
                "risk_score": f.risk_score,
                "explanation": f.explanation,
            }
            for f in rules_result.findings
        ],
    }
    return (
        "=== СВОДКА ОТ ДЕТЕРМИНИРОВАННЫХ ПРАВИЛ ===\n"
        + json.dumps(rules_summary, ensure_ascii=False, indent=2)
        + "\n\n=== SQL-ЗАПРОС ===\n"
        + sql.strip()
        + "\n\n=== ТВОЙ ОТВЕТ (ТОЛЬКО JSON) ==="
    )
