FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir fastapi uvicorn jinja2 aiofiles pyvmomi python-jenkins

EXPOSE 8003

ENV HOST 0.0.0.0

ENV PORT 8003

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8003", "--reload"]
