from celery import shared_task
from django.core.mail import send_mail
from .models import User


@shared_task
def send_welcome_email(user_id):
    user = User.objects.get(id=user_id)
    subject = 'Добро пожаловать в прилодение'
    message = f'Добро, {user.username}, пожаловать в прилодение!'
    from_email = 'savonvictor@gmail.com'
    to_email = user.email
    send_mail(subject, message, from_email, [to_email])
