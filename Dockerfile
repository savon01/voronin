# Используйте базовый образ Python
# Base image
FROM python:3.9

# Set working directory
WORKDIR /code

# Copy the entire project
COPY . .

# Install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Command to run the server
CMD python mysite/manage.py runserver 0.0.0.0:8000