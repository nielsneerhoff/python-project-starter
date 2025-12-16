import logging

import pytest
from snapshot_testing import SnapshotSettings, snapshot


@pytest.fixture
def snapshot_settings() -> SnapshotSettings:
    return SnapshotSettings(
        base_dir="custom_snapshots",
        file_extension=".snap",
        capture_logs=False,
        log_level=logging.WARNING,
    )


@snapshot
def test_snapshot_settings(snapshot_settings: SnapshotSettings):
    print("Testing custom snapshot settings")
