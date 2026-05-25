"""audit_log: поля error_code и error_message

Revision ID: 0003_audit_log_error_fields
Revises: 0002_audit_log_llm_model
Create Date: 2026-05-25

"""

from collections.abc import Sequence

import sqlalchemy as sa
from alembic import op

revision: str = "0003_audit_log_error_fields"
down_revision: str | Sequence[str] | None = "0002_audit_log_llm_model"
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.add_column(
        "audit_log",
        sa.Column("error_code", sa.String(length=128), nullable=True),
    )
    op.add_column(
        "audit_log",
        sa.Column("error_message", sa.Text(), nullable=True),
    )


def downgrade() -> None:
    op.drop_column("audit_log", "error_message")
    op.drop_column("audit_log", "error_code")
