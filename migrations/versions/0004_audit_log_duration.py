"""audit_log: колонка duration_seconds

Revision ID: 0004_audit_log_duration
Revises: 0003_audit_log_error_fields
Create Date: 2026-05-25

"""

from collections.abc import Sequence

import sqlalchemy as sa
from alembic import op

revision: str = "0004_audit_log_duration"
down_revision: str | Sequence[str] | None = "0003_audit_log_error_fields"
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.add_column(
        "audit_log",
        sa.Column("duration_seconds", sa.Float(), nullable=True),
    )


def downgrade() -> None:
    op.drop_column("audit_log", "duration_seconds")
