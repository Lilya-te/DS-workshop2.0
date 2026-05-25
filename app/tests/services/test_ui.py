"""Тесты HTML-интерфейса."""

from unittest.mock import AsyncMock, patch

import pytest
from fastapi.testclient import TestClient

from app.dependencies import get_audit_repo
from app.main import app
from app.schemas.sql import GenerateResponse
from app.services.llm_runtime import LLM_MODEL_CHOICES
from app.tests.services.test_orchestration import FakeAuditRepository


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


@pytest.fixture
def client_stub_orchestrator(client: TestClient) -> TestClient:
    """Генерация без БД — подмена audit_repo."""
    app.dependency_overrides[get_audit_repo] = lambda: FakeAuditRepository()
    yield client
    app.dependency_overrides.pop(get_audit_repo, None)


def test_index_returns_form(client: TestClient) -> None:
    """GET / — страница с формой ввода запроса."""
    response = client.get("/")

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert 'name="task_description"' in body
    assert 'name="llm_provider"' in body
    assert 'name="llm_model"' in body
    for model in LLM_MODEL_CHOICES:
        assert model in body
    assert "Сгенерировать SQL" in body


def test_generate_form_returns_result_html(client_stub_orchestrator: TestClient) -> None:
    """POST / — submit формы вызывает orchestrator и показывает SQL."""
    response = client_stub_orchestrator.post(
        "/",
        data={
            "task_description": "вывести всех клиентов",
            "llm_provider": "stub",
            "llm_model": "",
        },
    )

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert "вывести всех клиентов" in body
    assert "-- iteration 2" in body
    assert "approved" in body


def test_generate_form_rejects_empty_task(client: TestClient) -> None:
    """POST / — пустой запрос возвращает 422."""
    response = client.post(
        "/",
        data={"task_description": "", "llm_provider": "stub", "llm_model": ""},
    )

    assert response.status_code == 422


def test_generate_form_requires_task_field(client: TestClient) -> None:
    """POST / — отсутствие поля task_description возвращает 422."""
    response = client.post("/", data={"llm_provider": "stub"})

    assert response.status_code == 422


def test_generate_form_redirects_to_audit_log_on_failure(
    client_stub_orchestrator: TestClient,
) -> None:
    """POST / — при status=failed редирект на страницу запроса."""
    failed = GenerateResponse(
        request_id="aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
        status="failed",
        final_sql=None,
        iterations=[],
        total_iterations=0,
        error_code="RuntimeError",
        error_message="boom",
    )
    mock_orchestrator = AsyncMock()
    mock_orchestrator.run = AsyncMock(return_value=failed)
    with patch("app.api.ui.create_orchestrator", return_value=mock_orchestrator):
        response = client_stub_orchestrator.post(
            "/",
            data={
                "task_description": "тест",
                "llm_provider": "openrouter",
                "llm_model": LLM_MODEL_CHOICES[0],
            },
            follow_redirects=False,
        )

    assert response.status_code == 303
    assert (
        response.headers["location"]
        == "/audit_log/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
    )


def test_generate_form_redirects_on_setup_error(client: TestClient) -> None:
    """POST / — ошибка до run() сохраняется и редиректит в журнал."""
    repo = FakeAuditRepository()
    app.dependency_overrides[get_audit_repo] = lambda: repo
    try:
        response = client.post(
            "/",
            data={
                "task_description": "тест",
                "llm_provider": "unknown",
                "llm_model": "",
            },
            follow_redirects=False,
        )
    finally:
        app.dependency_overrides.pop(get_audit_repo, None)

    assert response.status_code == 303
    assert response.headers["location"].startswith("/audit_log/")
    assert len(repo.records) == 1
    assert repo.records[0]["error_code"] == "ValueError"
