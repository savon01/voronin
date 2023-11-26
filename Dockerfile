
FROM python:3.9

WORKDIR /code

COPY . .

COPY requirements.txt /code/
RUN pip install -r requirements.txt

EXPOSE 8000

CMD python mysite/manage.py runserver 0.0.0.0:8000