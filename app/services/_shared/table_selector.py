"""Селектор релевантных таблиц по текстовому запросу.

Селектор выбирает топ-K таблиц, наиболее релевантных запросу пользователя.

Алгоритм (baseline, без эмбеддингов):
1. Извлекаем ключевые слова из запроса (нормализация + стоп-слова).
2. Считаем "редкость" каждого слова по схеме (idf): слово, встречающееся
   во многих таблицах, весит меньше; редкое и специфичное -- больше.
3. Скорим таблицы: совпадение в имени таблицы важнее, чем в комментарии
   колонки, и каждое совпадение взвешивается на редкость слова.

Используется и генератором, и аудитором (через app/dependencies.py).
"""

from __future__ import annotations

import math
import re
from collections import Counter

from app.services._shared.schema_parser import TableInfo

# Морфологические окончания для грубой нормализации (без полного стемминга).
RU_ENDINGS = [
    "ами", "ями", "ого", "его", "ому", "ему", "ой", "ей", "ую", "юю",
    "ах", "ях", "ам", "ям", "ов", "ев", "ы", "и", "а", "я", "о", "е", "у", "ю",
]
EN_ENDINGS = ["ing", "ed", "es", "s"]

STOPWORDS = {
    # русские
    "и", "в", "не", "на", "с", "по", "для", "за", "от", "до", "у", "о", "из",
    "как", "что", "это", "все", "его", "её", "их", "тот", "та", "то",
    "найди", "получи", "покажи", "выведи", "верни", "сделай", "создай",
    "обнови", "удали", "вставь", "посчитай", "сколько", "каждый", "каждой",
    "запрос", "данные", "таблица", "поле", "значение", "список",
    "последний", "первый", "новый", "старый",
    # английские
    "the", "a", "an", "of", "in", "on", "at", "to", "for", "with", "from",
    "show", "find", "get", "list", "select", "update", "delete", "insert",
    "all", "any", "by", "and", "or", "not", "is", "are", "count",
}


def _normalize_word(w: str) -> str:
    """Нижний регистр + отбрасывание коротких морфологических окончаний."""
    w = w.lower()
    if len(w) <= 3:
        return w
    for end in RU_ENDINGS + EN_ENDINGS:
        if w.endswith(end) and len(w) - len(end) >= 3:
            return w[: -len(end)]
    return w


def extract_keywords(text: str) -> list[str]:
    """Достаёт значимые слова из запроса (>=3 символов, без стоп-слов)."""
    words = re.findall(r"[a-zA-Zа-яА-ЯёЁ_]{3,}", text)
    return [_normalize_word(w) for w in words if w.lower() not in STOPWORDS]


class TableSelector:
    """Выбирает релевантные таблицы под запрос.

    Предвычисляет idf-веса слов один раз (при создании или через fit()),
    чтобы не пересчитывать на каждый запрос.
    """

    # Веса по месту совпадения
    WEIGHT_TABLE_NAME = 3.0
    WEIGHT_TABLE_COMMENT = 2.0
    WEIGHT_COLUMN_NAME = 1.0
    WEIGHT_COLUMN_COMMENT = 1.0

    def __init__(self, tables: list[TableInfo]) -> None:
        self._tables = tables
        self._idf: dict[str, float] = {}
        self._table_tokens: dict[str, dict[str, set[str]]] = {}
        self._fit()

    def _fit(self) -> None:
        """Предвычисляет токены каждой таблицы и idf-веса слов."""
        n_tables = len(self._tables) or 1
        # document frequency: в скольких таблицах встречается слово
        df: Counter[str] = Counter()

        for t in self._tables:
            name_tokens = {_normalize_word(t.name)}
            comment_tokens = set(extract_keywords(t.comment))
            col_name_tokens = {_normalize_word(c.name) for c in t.columns}
            col_comment_tokens: set[str] = set()
            for c in t.columns:
                col_comment_tokens.update(extract_keywords(c.comment))

            self._table_tokens[t.qualified_name] = {
                "table_name": name_tokens,
                "table_comment": comment_tokens,
                "column_name": col_name_tokens,
                "column_comment": col_comment_tokens,
            }

            # Для df считаем уникальные слова таблицы (по всем зонам)
            all_words = name_tokens | comment_tokens | col_name_tokens | col_comment_tokens
            for w in all_words:
                df[w] += 1

        # idf = log(N / (1 + df)). Чем реже слово, тем выше вес.
        for word, freq in df.items():
            self._idf[word] = math.log(n_tables / (1 + freq)) + 1.0

    def _word_weight(self, word: str) -> float:
        """idf-вес слова. Незнакомые слова получают средний вес."""
        return self._idf.get(word, 1.0)

    def select(self, query: str, top_k: int = 5) -> list[TableInfo]:
        """Возвращает топ-K релевантных таблиц под запрос."""
        keywords = extract_keywords(query)
        if not keywords:
            return self._tables[:top_k]

        scores: dict[str, float] = {}
        for t in self._tables:
            zones = self._table_tokens[t.qualified_name]
            score = 0.0
            for kw in keywords:
                w = self._word_weight(kw)
                if kw in zones["table_name"]:
                    score += self.WEIGHT_TABLE_NAME * w
                if kw in zones["table_comment"]:
                    score += self.WEIGHT_TABLE_COMMENT * w
                if kw in zones["column_name"]:
                    score += self.WEIGHT_COLUMN_NAME * w
                if kw in zones["column_comment"]:
                    score += self.WEIGHT_COLUMN_COMMENT * w
            if score > 0:
                scores[t.qualified_name] = score

        if not scores:
            # Ничего не нашлось -- запрос мутный, отдаём первые top_k
            return self._tables[:top_k]

        ranked = sorted(scores.items(), key=lambda kv: kv[1], reverse=True)
        top_qnames = [q for q, _ in ranked[:top_k]]
        by_qname = {t.qualified_name: t for t in self._tables}
        return [by_qname[q] for q in top_qnames]

    def select_with_scores(self, query: str, top_k: int = 5) -> list[tuple[TableInfo, float]]:
        """Как select(), но возвращает пары (таблица, скор) -- для отладки."""
        keywords = extract_keywords(query)
        if not keywords:
            return [(t, 0.0) for t in self._tables[:top_k]]

        scores: dict[str, float] = {}
        for t in self._tables:
            zones = self._table_tokens[t.qualified_name]
            score = 0.0
            for kw in keywords:
                w = self._word_weight(kw)
                if kw in zones["table_name"]:
                    score += self.WEIGHT_TABLE_NAME * w
                if kw in zones["table_comment"]:
                    score += self.WEIGHT_TABLE_COMMENT * w
                if kw in zones["column_name"]:
                    score += self.WEIGHT_COLUMN_NAME * w
                if kw in zones["column_comment"]:
                    score += self.WEIGHT_COLUMN_COMMENT * w
            if score > 0:
                scores[t.qualified_name] = score

        by_qname = {t.qualified_name: t for t in self._tables}
        ranked = sorted(scores.items(), key=lambda kv: kv[1], reverse=True)
        return [(by_qname[q], round(s, 2)) for q, s in ranked[:top_k]]