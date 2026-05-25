"""Проверка сортировки журнала audit_log (новые первые)."""

from datetime import UTC, datetime

import pytest
from fastapi.testclient import TestClient

from app.db.repositories.audit_repository import AuditRequestGroup
from app.dependencies import get_audit_repo
from app.main import app

OLD_ID = "00000000-0000-0000-0000-000000000001"
NEW_ID = "00000000-0000-0000-0000-000000000002"


class OrderedFakeAuditRepository:
    async def list_request_groups_page(
        self, *, offset: int, limit: int
    ) -> tuple[list[AuditRequestGroup], int]:
        _ = offset, limit
        groups = [
            AuditRequestGroup(
                request_id=NEW_ID,
                task_description="новый запрос",
                total_iterations=1,
                final_status="approved",
                last_created_at=datetime(2026, 5, 25, 14, 0, 0, tzinfo=UTC),
                llm_model="stub",
                duration_seconds=1.0,
            ),
            AuditRequestGroup(
                request_id=OLD_ID,
                task_description="старый запрос",
                total_iterations=1,
                final_status="approved",
                last_created_at=datetime(2026, 5, 25, 10, 0, 0, tzinfo=UTC),
                llm_model="stub",
                duration_seconds=2.0,
            ),
        ]
        return groups, 2

    async def get_by_request_id(self, request_id: str) -> list:
        return []


@pytest.fixture
def client() -> TestClient:
    with TestClient(app) as test_client:
        yield test_client


def test_audit_log_page_lists_newer_requests_first(client: TestClient) -> None:
    """На странице журнала более новый request_id идёт выше старого."""
    app.dependency_overrides[get_audit_repo] = lambda: OrderedFakeAuditRepository()
    try:
        response = client.get("/audit_log")
    finally:
        app.dependency_overrides.pop(get_audit_repo, None)

    assert response.status_code == 200
    body = response.text
    assert body.index("новый запрос") < body.index("старый запрос")
