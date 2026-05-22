"""Базовые тесты доступности API."""

from collections.abc import AsyncIterator
from unittest.mock import AsyncMock

import pytest
from fastapi.testclient import TestClient

from app.db.session import get_session
from app.main import app


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


def test_health_liveness_returns_ok(client: TestClient) -> None:
    """GET /api/v1/health — сервис отвечает (liveness)."""
    response = client.get("/api/v1/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_readyz_returns_ready_when_db_available(client: TestClient) -> None:
    """GET /api/v1/readyz — readiness при доступной БД."""

    async def mock_session() -> AsyncIterator[AsyncMock]:
        session = AsyncMock()
        session.execute = AsyncMock(return_value=None)
        yield session

    app.dependency_overrides[get_session] = mock_session
    try:
        response = client.get("/api/v1/readyz")
    finally:
        app.dependency_overrides.pop(get_session, None)

    assert response.status_code == 200
    assert response.json() == {"status": "ready"}


def test_readyz_returns_503_when_db_unavailable(client: TestClient) -> None:
    """GET /api/v1/readyz — 503, если БД недоступна."""

    async def failing_session() -> AsyncIterator[AsyncMock]:
        session = AsyncMock()
        session.execute = AsyncMock(side_effect=RuntimeError("connection refused"))
        yield session

    app.dependency_overrides[get_session] = failing_session
    try:
        response = client.get("/api/v1/readyz")
    finally:
        app.dependency_overrides.pop(get_session, None)

    assert response.status_code == 503
    assert "database unavailable" in response.json()["detail"]


def test_openapi_schema_available(client: TestClient) -> None:
    """OpenAPI-схема доступна — приложение поднялось и маршруты зарегистрированы."""
    response = client.get("/openapi.json")

    assert response.status_code == 200
    payload = response.json()
    assert payload.get("info", {}).get("title") == "GreenData SQL Security API"
    paths = payload.get("paths", {})
    assert "/api/v1/health" in paths
    assert "/api/v1/readyz" in paths


def test_root_redirects_to_docs(client: TestClient) -> None:
    """Корень перенаправляет на Swagger UI."""
    response = client.get("/", follow_redirects=False)

    assert response.status_code in (302, 307)
    assert response.headers["location"].endswith("/docs")


def test_request_id_header_is_returned(client: TestClient) -> None:
    """Middleware проставляет X-Request-Id в ответ."""
    response = client.get("/api/v1/health")

    assert response.status_code == 200
    assert response.headers.get("X-Request-Id")
