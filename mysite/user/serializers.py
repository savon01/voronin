from rest_framework import serializers
from .models import User
from .tasks import send_welcome_email


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'registration_date']
        read_only_fields = ['id']

    def create(self, validated_data):
        user = User.objects.create(**validated_data)

        # Запуск задачи Celery для отправки приветственного письма асинхронно
        send_welcome_email.delay(user.id)

        return user





