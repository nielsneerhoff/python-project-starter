install:
    uv sync --all-extras --all-groups --all-packages

lint:
    uv run --group lint ruff check packages/

lint-fix:
    uv run --group lint ruff check --fix --unsafe-fixes packages/

format:
    uv run --group lint ruff format --check packages/

format-fix:
    uv run --group lint ruff format packages/

fix: format-fix lint-fix

build:
    uv build --package snapshot-testing

publish:
    just build
    uv publish

typing: mypy ty

mypy:
    uv run --group typing mypy packages/

ty:
    uv run --group typing ty check packages/