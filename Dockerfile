FROM python:3.9-alpine
ARG POETRY_VERSION="1.1.13"
WORKDIR /workspace

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1


RUN apk add --no-cache bash curl gcc git groff libffi-dev musl-dev clang lld && \
    /usr/local/bin/python -m pip install --upgrade pip && \
    pip --no-cache-dir install poetry=="$POETRY_VERSION"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /workspace

COPY pyproject.toml .
COPY poetry.lock .
COPY src ./src

RUN poetry config virtualenvs.create false && \
    poetry install

EXPOSE 5000

ENTRYPOINT [ "uvicorn" ,  "src.app:app","--host", "0.0.0.0","--port","5000" ]
