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

mdformat:
    uv run --with mdformat-mkdocs mdformat --check README.md

mdformat-fix:
    uv run --with mdformat-mkdocs mdformat README.md

doccmd-ruff-format:
    uv run --with doccmd doccmd --language=python --no-pad-file --no-pad-groups --command="ruff format --quiet" README.md

doccmd-ruff-lint:
    uv run --with doccmd doccmd --language=python --no-pad-file --no-pad-groups --command="ruff check --quiet --fix --unsafe-fixes" README.md

doccmd-fix: doccmd-ruff-format doccmd-ruff-lint

ssort:
    uv run --with ssort ssort --check packages/

ssort-fix:
    uv run --with ssort ssort packages/

fix:  ssort-fix format-fix lint-fix mdformat-fix doccmd-fix