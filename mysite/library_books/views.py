from rest_framework import viewsets
from rest_framework.response import Response

from .models import Book
from .serializers import BookSerializer
from rest_framework import generics


class BookViewSet(viewsets.ModelViewSet):
    queryset = Book.objects.all()
    serializer_class = BookSerializer

    def list(self, request):
        # Получение списка книг
        queryset = self.get_queryset()  # Получение QuerySet всех книг

        # Применение фильтров, если они переданы в запросе
        title = request.query_params.get('title')
        author = request.query_params.get('author')
        if title:
            queryset = queryset.filter(title__icontains=title)
        if author:
            queryset = queryset.filter(author__icontains=author)


        # Сериализация и возврат ответа
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

