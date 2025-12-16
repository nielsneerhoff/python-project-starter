install:
    uv sync --all-extras --all-groups --all-packages

lint-fix:
    uv run --group dev ruff check --fix --unsafe-fixes packages/

format-fix:
    uv run --group dev ruff format packages/

fix: format-fix lint-fix

build:
    uv build --package snapshot-testing

publish:
    just build
    uv publish