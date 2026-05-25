"""Тесты логирования времени генерации в UI."""

from app.api.ui import _parse_client_start_ms
from app.services.run_errors import format_duration_display


def test_parse_client_start_ms_accepts_epoch_ms() -> None:
    assert _parse_client_start_ms("1716633600000") == 1716633600000.0


def test_parse_client_start_ms_returns_none_for_empty() -> None:
    assert _parse_client_start_ms("") is None
    assert _parse_client_start_ms("  ") is None


def test_parse_client_start_ms_returns_none_for_invalid() -> None:
    assert _parse_client_start_ms("not-a-number") is None


def test_format_duration_display() -> None:
    assert format_duration_display(3.456) == "3.46 с"
    assert format_duration_display(None) == "—"
