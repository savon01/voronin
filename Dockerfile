# Используйте базовый образ Python
FROM python:3.9

# Установите переменную среды PYTHONUNBUFFERED в значение 1
ENV PYTHONUNBUFFERED=1

# Установите рабочую директорию внутри контейнера
WORKDIR /code

# Скопируйте requirements.txt в контейнер
COPY requirements.txt /code/

# Установите зависимости
RUN pip install -r requirements.txt

# Скопируйте все содержимое текущей папки в контейнер
COPY . /code/

# Запустите команду миграции и сбора статических файлов Django
RUN python manage.py migrate
RUN python manage.py collectstatic --no-input

# Откройте порт 8000 для веб-сервера Django
EXPOSE 8000

# Запустите сервер Django при запуске контейнера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
