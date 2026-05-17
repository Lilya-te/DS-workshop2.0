"""audit_log: первичная схема логов итераций

Revision ID: 0001_audit_log
Revises:
Create Date: 2026-05-17

"""

from collections.abc import Sequence

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects.postgresql import JSONB

revision: str = "0001_audit_log"
down_revision: str | Sequence[str] | None = None
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.create_table(
        "audit_log",
        sa.Column("id", sa.Integer(), primary_key=True, autoincrement=True),
        sa.Column("request_id", sa.String(length=36), nullable=False),
        sa.Column("iteration", sa.Integer(), nullable=False),
        sa.Column("task_description", sa.Text(), nullable=True),
        sa.Column("generated_sql", sa.Text(), nullable=False),
        sa.Column("audit_result", JSONB(), nullable=False),
        sa.Column("decision", sa.String(length=16), nullable=False),
        sa.Column(
            "created_at",
            sa.DateTime(timezone=True),
            server_default=sa.func.now(),
            nullable=False,
        ),
    )
    op.create_index("ix_audit_log_request_id", "audit_log", ["request_id"])


def downgrade() -> None:
    op.drop_index("ix_audit_log_request_id", table_name="audit_log")
    op.drop_table("audit_log")
