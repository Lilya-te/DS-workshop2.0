"""Базовые тесты доступности API."""

from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_health_liveness_returns_ok() -> None:
    """GET /api/v1/health — сервис отвечает (liveness)."""
    response = client.get("/api/v1/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_openapi_schema_available() -> None:
    """OpenAPI-схема доступна — приложение поднялось и маршруты зарегистрированы."""
    response = client.get("/openapi.json")

    assert response.status_code == 200
    payload = response.json()
    assert payload.get("info", {}).get("title") == "GreenData SQL Security API"
    assert "/api/v1/health" in payload.get("paths", {})


def test_root_redirects_to_docs() -> None:
    """Корень перенаправляет на Swagger UI."""
    response = client.get("/", follow_redirects=False)

    assert response.status_code in (302, 307)
    assert response.headers["location"].endswith("/docs")
