from django.urls import path
from account.views import *
from django.contrib.auth.views import LogoutView

app_name = 'account'

urlpatterns = [
    path('register', RegisterView.as_view(), name = 'register'),
    path('login', LoginView.as_view(), name = 'login'),
    path('logout', LogoutView.as_view(), name = 'logout'),
]