# Мой проект Django

 ## Запуск проекта в контейнерах Docker

 1. Установите Docker и Docker Compose, если они еще не установлены.

 2. Склонируйте репозиторий проекта:

    ```
    https://github.com/savon01/voronin.git
    ```

 3. Перейдите в каталог проекта:

    ```
    cd voronin
    ```

 4. Создайте файл `.env` и укажите необходимые переменные окружения:

    ```
    DEBUG=True
    SECRET_KEY=your-secret-key
    MYSQL_DATABASE=mydatabase
    MYSQL_USER=myuser
    MYSQL_PASSWORD=mypassword
    MYSQL_ROOT_PASSWORD=myrootpassword
    ```

 5. Соберите и запустите контейнеры:

    ```
    docker-compose up --build
    ```

 6. После успешного запуска контейнеров, ваше Django-приложение будет доступно по адресу `http://localhost:8000`.

 ## Взаимодействие с контейнером

 - Для выполнения команд Django внутри контейнера, используйте следующую команду:

   ```
   docker-compose exec web python manage.py <command>
   ```

 - Для доступа к интерактивной оболочке Django, выполните:

   ```
   docker-compose exec web python manage.py shell
   ```

 - Чтобы остановить контейнеры, выполните:

   ```
   docker-compose down
   ```

 ## Примечания

 - После каждого изменения зависимостей Python в файле `requirements.txt`, необходимо выполнить команду `docker-compose up --build`, чтобы обновить контейнер с зависимостями.

 - Если требуется добавить другие сервисы или настройки Docker, отредактируйте файл `docker-compose.yml` соответствующим образом.

 - Убедитесь, что ваши файлы проекта Django находятся в корневом каталоге проекта, чтобы они были доступны внутри контейнера.


Обратите внимание, что в инструкциях предполагается, что вы используете файл `.env` для хранения конфиденциальных переменных окружения. Убедитесь, что файл `.env` добавлен в файл `.gitignore`, чтобы не попасть в систему контроля версий и сохранить конфиденциальность.

Установите Docker и Docker Compose, склонируйте свой проект, укажите переменные окружения в файле `.env`, выполните команду `docker-compose up --build`, и ваше Django-приложение будет запущено в контейнере Docker.

Не забудьте настроить соответствующие параметры подключения к базе данных MySQL и Redis в файле настроек Django (settings.py).