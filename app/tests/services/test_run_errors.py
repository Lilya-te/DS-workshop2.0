"""Тесты форматирования ошибок запуска."""

import httpx

from app.services.run_errors import format_error_code, format_error_message


def test_format_error_code_uses_exception_type() -> None:
    assert format_error_code(ValueError("bad")) == "ValueError"


def test_format_error_code_includes_http_status() -> None:
    request = httpx.Request("GET", "https://example.com")
    response = httpx.Response(503, request=request)
    exc = httpx.HTTPStatusError("error", request=request, response=response)
    assert format_error_code(exc) == "HTTPStatusError:503"


def test_format_error_message_falls_back_to_repr() -> None:
    assert format_error_message(RuntimeError()) == "RuntimeError()"
