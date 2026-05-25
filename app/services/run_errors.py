"""Форматирование ошибок выполнения цикла генерации."""

from __future__ import annotations

import time


def format_error_code(exc: BaseException) -> str:
    """Код ошибки: имя типа и HTTP-статус (если есть)."""
    code = type(exc).__name__
    status = getattr(exc, "status_code", None)
    if status is None:
        response = getattr(exc, "response", None)
        if response is not None:
            status = getattr(response, "status_code", None)
    if status is not None:
        return f"{code}:{status}"[:128]
    return code[:128]


def compute_duration_seconds(
    *,
    started_at: float,
    client_start_ms: float | None,
) -> float:
    """Длительность запроса: от кнопки (если есть метка) иначе серверная."""
    if client_start_ms is not None:
        return round((time.time() * 1000 - client_start_ms) / 1000, 3)
    return round(time.perf_counter() - started_at, 3)


def format_duration_display(duration_seconds: float | None) -> str:
    """Форматирование длительности для UI."""
    if duration_seconds is None:
        return "—"
    return f"{duration_seconds:.2f} с"


def format_error_message(exc: BaseException) -> str:
    """Текст ошибки для отображения пользователю."""
    message = str(exc).strip()
    return message if message else repr(exc)
