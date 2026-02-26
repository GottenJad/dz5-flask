# Базовый образ
FROM python:3.11-slim AS base

# Установка системных зависимостей для psycopg2 и gunicorn
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

COPY requirements.txt .

# Установка Python-зависимостей
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# Запуск с gunicorn
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "wsgi:app"]