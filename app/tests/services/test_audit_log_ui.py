"""Тесты страницы журнала audit_log."""

from datetime import UTC, datetime

import pytest
from fastapi.testclient import TestClient

from app.db.models import AuditLog
from app.db.repositories.audit_repository import AuditRequestGroup
from app.dependencies import get_audit_repo
from app.main import app

REQUEST_ID = "11111111-2222-3333-4444-555555555555"


def _sample_entry(*, iteration: int = 1, decision: str = "needs_fix") -> AuditLog:
    return AuditLog(
        id=40 + iteration,
        request_id=REQUEST_ID,
        iteration=iteration,
        task_description="вывести клиентов" if iteration == 1 else None,
        generated_sql=f"SELECT id FROM clients -- {iteration}",
        audit_result={"overall_risk": 3, "summary": "низкий риск", "findings": []},
        decision=decision,
        created_at=datetime(2026, 5, 25, 12, iteration, 0, tzinfo=UTC),
    )


def _sample_group(*, final_status: str = "iteration_limit_exceeded") -> AuditRequestGroup:
    return AuditRequestGroup(
        request_id=REQUEST_ID,
        task_description="вывести клиентов",
        total_iterations=2,
        final_status=final_status,
        last_created_at=datetime(2026, 5, 25, 12, 2, 0, tzinfo=UTC),
    )


class FakeAuditRepository:
    def __init__(
        self,
        *,
        groups: list[AuditRequestGroup] | None = None,
        total_groups: int = 0,
        entries_by_request: dict[str, list[AuditLog]] | None = None,
    ) -> None:
        self._groups = groups or []
        self._total_groups = total_groups
        self._entries_by_request = entries_by_request or {}

    async def list_request_groups_page(
        self, *, offset: int, limit: int
    ) -> tuple[list[AuditRequestGroup], int]:
        _ = offset, limit
        return self._groups, self._total_groups

    async def get_by_request_id(self, request_id: str) -> list[AuditLog]:
        return self._entries_by_request.get(request_id, [])


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


@pytest.fixture
def client_with_audit_logs(client: TestClient) -> TestClient:
    repo = FakeAuditRepository(
        groups=[_sample_group()],
        total_groups=1,
        entries_by_request={
            REQUEST_ID: [
                _sample_entry(iteration=1),
                _sample_entry(iteration=2, decision="approved"),
            ],
        },
    )
    app.dependency_overrides[get_audit_repo] = lambda: repo
    yield client
    app.dependency_overrides.pop(get_audit_repo, None)


@pytest.fixture
def client_with_pagination(client: TestClient) -> TestClient:
    repo = FakeAuditRepository(
        groups=[_sample_group()],
        total_groups=150,
    )
    app.dependency_overrides[get_audit_repo] = lambda: repo
    yield client
    app.dependency_overrides.pop(get_audit_repo, None)


def test_audit_log_page_returns_grouped_list(client_with_audit_logs: TestClient) -> None:
    """GET /audit_log — сгруппированный список запросов."""
    response = client_with_audit_logs.get("/audit_log")

    assert response.status_code == 200
    assert "text/html" in response.headers["content-type"]
    body = response.text
    assert "Журнал аудита" in body
    assert "вывести клиентов" in body
    assert f'href="/audit_log/{REQUEST_ID}"' in body
    assert "итераций: 2" in body
    assert "iteration_limit_exceeded" in body


def test_audit_log_page_shows_pagination(client_with_pagination: TestClient) -> None:
    """При >100 запросах отображается навигация по страницам."""
    response = client_with_pagination.get("/audit_log")

    assert response.status_code == 200
    assert "/audit_log?page=2" in response.text
    assert "по 100 запросов" in response.text


def test_audit_log_page_accepts_page_query(client_with_pagination: TestClient) -> None:
    """GET /audit_log?page=2 — запрос второй страницы."""
    response = client_with_pagination.get("/audit_log?page=2")

    assert response.status_code == 200
    assert "Страница 2 из 2" in response.text


def test_audit_log_detail_returns_full_log(client_with_audit_logs: TestClient) -> None:
    """GET /audit_log/{request_id} — полный лог итераций."""
    response = client_with_audit_logs.get(f"/audit_log/{REQUEST_ID}")

    assert response.status_code == 200
    body = response.text
    assert "Лог запроса" in body
    assert "вывести клиентов" in body
    assert "Итерация 1" in body
    assert "Итерация 2" in body
    assert "SELECT id FROM clients -- 2" in body
    assert "approved" in body


def test_audit_log_detail_returns_404_for_unknown_request(client: TestClient) -> None:
    """GET /audit_log/{request_id} — 404 для неизвестного id."""
    repo = FakeAuditRepository()
    app.dependency_overrides[get_audit_repo] = lambda: repo
    try:
        response = client.get("/audit_log/00000000-0000-0000-0000-000000000000")
    finally:
        app.dependency_overrides.pop(get_audit_repo, None)

    assert response.status_code == 404
