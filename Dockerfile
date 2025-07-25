# Используем официальный образ питона
FROM python:3.11-slim

# Переменные окружения
ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONBUFFERED=1

# Рабочая директория
WORKDIR /app

# Cтавим системные зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Копируем зависимости и ставим
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект
COPY . .

# Указываем порт
EXPOSE 8000

# Запускаем сервер
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# Eso es que Gracias a Dios.!
