# Используйте базовый образ Python
FROM python:3.9

# Установка переменных среды
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Создание рабочей директории в контейнере
WORKDIR /code

# Установка зависимостей Python
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Копирование кода приложения в контейнер
COPY . /code/

# Запуск команды при старте контейнера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
