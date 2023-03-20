FROM python:latest
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
ADD . /app/
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
RUN python manage.py makemigrations && python manage.py migrate
RUN DJANGO_SUPERUSER_USERNAME=admin \
    DJANGO_SUPERUSER_PASSWORD=admin \
    DJANGO_SUPERUSER_EMAIL="admin@admin.com" \
    python manage.py createsuperuser --noinput
EXPOSE 8080
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
