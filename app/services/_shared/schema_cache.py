"""Кеш распарсенной схемы БД.

Парсит DDL один раз при старте приложения и держит результат в памяти, так как делать это на каждый запрос расточительно. Кеш позволяет:
- быстро отдавать таблицы из памяти (микросекунды);
- перезагружать схему на лету через reload() без рестарта сервиса.

Используется генератором, аудитором и репаратором через app/dependencies.py.
"""

from __future__ import annotations

from pathlib import Path

from app.core.logging import get_logger
from app.services._shared.schema_parser import (
    TableInfo,
    parse_ddl,
    schema_overview,
)

log = get_logger("app.schema_cache")


class SchemaCache:
    """Хранит распарсенную схему БД в памяти.

    Один экземпляр на приложение (создаётся в app/dependencies.py).
    Инициализируется при старте через load_from_file(), дальше отдаёт
    таблицы из памяти.
    """

    def __init__(self) -> None:
        self._tables: list[TableInfo] = []
        self._by_qname: dict[str, TableInfo] = {}
        self._by_name: dict[str, TableInfo] = {}
        self._source_path: Path | None = None
        self._loaded: bool = False

    # ----------------------- загрузка -----------------------

    def load_from_text(self, ddl_text: str, source_label: str = "<text>") -> None:
        """Парсит DDL из строки и обновляет кеш."""
        tables = parse_ddl(ddl_text)
        self._tables = tables
        self._by_qname = {t.qualified_name: t for t in tables}
        # Индекс по короткому имени (если коллизий нет; при коллизии
        # qualified_name всё равно остаётся основным ключом)
        self._by_name = {t.name: t for t in tables}
        self._loaded = True
        log.info(
            "schema_cache.loaded",
            source=source_label,
            tables_count=len(tables),
            sensitive_tables=sum(
                1 for t in tables if any(c.sensitive for c in t.columns)
            ),
        )

    def load_from_file(self, path: str | Path) -> None:
        """Читает DDL-файл и парсит его в кеш."""
        p = Path(path)
        if not p.exists():
            raise FileNotFoundError(f"DDL-файл не найден: {p}")
        text = p.read_text(encoding="utf-8")
        self._source_path = p
        self.load_from_text(text, source_label=str(p))

    def reload(self) -> int:
        """Перечитывает схему из исходного файла (для hot-reload эндпоинта).
        Возвращает число таблиц после перезагрузки."""
        if self._source_path is None:
            raise RuntimeError(
                "reload() невозможен: схема была загружена не из файла. "
                "Используй load_from_file() или load_from_text()."
            )
        self.load_from_file(self._source_path)
        return len(self._tables)

    # ----------------------- доступ -----------------------

    @property
    def is_loaded(self) -> bool:
        return self._loaded

    def all_tables(self) -> list[TableInfo]:
        """Все распарсенные таблицы."""
        self._ensure_loaded()
        return self._tables

    def get_table(self, name: str) -> TableInfo | None:
        """Таблица по имени. Принимает и короткое (sys_employee),
        и полное (public.sys_employee) имя."""
        self._ensure_loaded()
        if name in self._by_qname:
            return self._by_qname[name]
        return self._by_name.get(name)

    def overview(self) -> str:
        """Компактный обзор всех таблиц (для шага выбора релевантных)."""
        self._ensure_loaded()
        return schema_overview(self._tables)

    def tables_count(self) -> int:
        self._ensure_loaded()
        return len(self._tables)

    # ----------------------- внутреннее -----------------------

    def _ensure_loaded(self) -> None:
        if not self._loaded:
            raise RuntimeError(
                "SchemaCache не инициализирован. Вызови load_from_file() "
                "при старте приложения (см. app/main.py lifespan)."
            )