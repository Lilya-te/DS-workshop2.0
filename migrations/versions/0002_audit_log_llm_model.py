"""audit_log: колонка llm_model

Revision ID: 0002_audit_log_llm_model
Revises: 0001_audit_log
Create Date: 2026-05-25

"""

from collections.abc import Sequence

import sqlalchemy as sa
from alembic import op

revision: str = "0002_audit_log_llm_model"
down_revision: str | Sequence[str] | None = "0001_audit_log"
branch_labels: str | Sequence[str] | None = None
depends_on: str | Sequence[str] | None = None


def upgrade() -> None:
    op.add_column(
        "audit_log",
        sa.Column("llm_model", sa.String(length=256), nullable=True),
    )


def downgrade() -> None:
    op.drop_column("audit_log", "llm_model")
