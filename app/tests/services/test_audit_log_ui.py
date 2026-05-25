"""Тесты страницы журнала audit_log."""

from collections.abc import AsyncIterator
from datetime import UTC, datetime
from unittest.mock import AsyncMock, MagicMock

import pytest
from fastapi.testclient import TestClient

from app.db.models import AuditLog
from app.db.session import get_session
from app.main import app


def _sample_entry() -> AuditLog:
    return AuditLog(
        id=42,
        request_id="11111111-2222-3333-4444-555555555555",
        iteration=1,
        task_description="вывести клиентов",
        generated_sql="SELECT id FROM clients",
        audit_result={"overall_risk": 3, "summary": "низкий риск", "findings": []},
        decision="needs_fix",
        created_at=datetime(2026, 5, 25, 12, 0, 0, tzinfo=UTC),
    )


def _mock_session_factory(
    *,
    total: int,
    entries: list[AuditLog],
) -> AsyncIterator[AsyncMock]:
    async def mock_session() -> AsyncIterator[AsyncMock]:
        session = AsyncMock()
        count_result = MagicMock()
        count_result.scalar_one.return_value = total
        rows_result = MagicMock()
        rows_result.scalars.return_value.all.return_value = entries
        session.execute = AsyncMock(side_effect=[count_result, rows_result])
        yield session

    return mock_session


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


@pytest.fixture
def client_with_audit_logs(client: TestClient) -> TestClient:
    app.dependency_overrides[get_session] = _mock_session_factory(
        total=1,
        entries=[_sample_entry()],
    )
    yield client
    app.dependency_overrides.pop(get_session, None)


@pytest.fixture
def client_with_pagination(client: TestClient) -> TestClient:
    app.dependency_overrides[get_session] = _mock_session_factory(
        total=150,
        entries=[_sample_entry()],
    )
    yield client
    app.dependency_overrides.pop(get_session, None)


def test_audit_log_page_returns_table(client_with_audit_logs: TestClient) -> None:
    """GET /audit_log — HTML-таблица с записями журнала."""
    response = client_with_audit_logs.get("/audit_log")

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert "Журнал аудита" in body
    assert "11111111-2222-3333-4444-555555555555" in body
    assert "SELECT id FROM clients" in body
    assert "needs_fix" in body
    assert "низкий риск" in body


def test_audit_log_page_shows_pagination(client_with_pagination: TestClient) -> None:
    """При >100 записях отображается навигация по страницам."""
    response = client_with_pagination.get("/audit_log")

    assert response.status_code == 200
    assert "/audit_log?page=2" in response.text
    assert "по 100 записей" in response.text


def test_audit_log_page_accepts_page_query(client_with_pagination: TestClient) -> None:
    """GET /audit_log?page=2 — запрос второй страницы."""
    response = client_with_pagination.get("/audit_log?page=2")

    assert response.status_code == 200
    assert "Страница 2 из 2" in response.text
