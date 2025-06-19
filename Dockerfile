#Made by Krushna Jagdale #DevOps Engineer 



FROM python:3.12-slim as builder

RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | bash

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /app

COPY . .

RUN uv sync

FROM python:3.12-slim

RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | bash

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 8000

CMD ["uv", "run", "fastapi", "run", "server.py"]

