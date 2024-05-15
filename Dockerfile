# Good explaination of multi stage builds with poetry:
# https://medium.com/@albertazzir/blazing-fast-python-docker-builds-with-poetry-a78a66f5aed0

FROM python:3.12-buster as builder

RUN pip install poetry==1.8.3

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

# install dependencies before copying code to maximize docker cache capabilities
COPY pyproject.toml poetry.lock README.md ./

RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --without dev --no-root

FROM cgr.dev/chainguard/python:latest as runtime

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"
    
COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

# REPLACE: project names here
COPY src/banking ./banking

# REPLACE: run command here
CMD python --versions