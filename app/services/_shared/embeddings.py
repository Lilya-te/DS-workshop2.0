"""Ленивая загрузка модели эмбеддингов для семантического слоя селектора.

Модель грузится один раз при первом обращении (~3-5 сек, ~400MB) и кешируется.
Если sentence-transformers не установлен -- возвращаем None, и селектор
работает в чисто лексическом режиме (без падения).
"""

from __future__ import annotations

from functools import lru_cache

from app.core.logging import get_logger

log = get_logger("app.embeddings")

# Multilingual-модель: запросы на русском, часть комментариев схемы на английском.
EMB_MODEL_NAME = "sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2"


@lru_cache
def get_embedding_model():
    """Возвращает загруженную модель эмбеддингов или None, если библиотека
    недоступна. Результат кешируется (lru_cache) -- грузим один раз."""
    try:
        from sentence_transformers import SentenceTransformer
    except ImportError:
        log.warning(
            "embeddings.unavailable",
            hint="sentence-transformers не установлен; селектор работает в лексическом режиме.",
        )
        return None

    try:
        model = SentenceTransformer(EMB_MODEL_NAME)
        log.info("embeddings.loaded", model=EMB_MODEL_NAME)
        return model
    except Exception as e:
        log.warning("embeddings.load_failed", error=f"{type(e).__name__}: {e}")
        return None