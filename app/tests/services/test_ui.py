"""Тесты HTML-интерфейса."""

import pytest
from fastapi.testclient import TestClient

from app.dependencies import get_orchestrator
from app.main import app
from app.services.generator.generator import StubGenerator
from app.services.judge.judge import StubJudge
from app.services.orchestration import IterationOrchestrator
from app.services.repair.repair import StubRepair
from app.tests.services.test_orchestration import FakeAuditRepository


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


@pytest.fixture
def client_stub_orchestrator(client: TestClient) -> TestClient:
    """Orchestrator без БД — как в test_orchestration."""

    def _stub_orchestrator() -> IterationOrchestrator:
        return IterationOrchestrator(
            generator=StubGenerator(),
            judge=StubJudge(),
            repair=StubRepair(),
            audit_repo=FakeAuditRepository(),
            max_iterations=5,
        )

    app.dependency_overrides[get_orchestrator] = _stub_orchestrator
    yield client
    app.dependency_overrides.pop(get_orchestrator, None)


def test_index_returns_form(client: TestClient) -> None:
    """GET / — страница с формой ввода запроса."""
    response = client.get("/")

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert 'name="task_description"' in body
    assert "Сгенерировать SQL" in body


def test_generate_form_returns_result_html(client_stub_orchestrator: TestClient) -> None:
    """POST / — submit формы вызывает orchestrator и показывает SQL."""
    response = client_stub_orchestrator.post(
        "/",
        data={"task_description": "вывести всех клиентов"},
    )

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert "вывести всех клиентов" in body
    assert "-- iteration 2" in body
    assert "approved" in body


def test_generate_form_rejects_empty_task(client: TestClient) -> None:
    """POST / — пустой запрос возвращает 422."""
    response = client.post("/", data={"task_description": ""})

    assert response.status_code == 422


def test_generate_form_requires_task_field(client: TestClient) -> None:
    """POST / — отсутствие поля task_description возвращает 422."""
    response = client.post("/", data={})

    assert response.status_code == 422
