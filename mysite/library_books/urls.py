from .views import BookViewSet
from rest_framework.routers import DefaultRouter


from django.urls import path, include

app_name = 'library_books'

routers = DefaultRouter()
routers.register('books', BookViewSet)

urlpatterns = [
    path('groups/', include(routers.urls)),
]




