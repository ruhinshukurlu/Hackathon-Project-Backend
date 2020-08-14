from django.urls import path
from core.views import *

app_name = 'core'

urlpatterns = [
    path("students", StudentListView.as_view(), name="student-list"),
    path("students/<int:pk>", StudentDetailView.as_view(), name="student-detail"),
]