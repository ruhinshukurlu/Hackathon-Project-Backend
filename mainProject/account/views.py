from django.shortcuts import render
from django.views.generic.edit import CreateView
from django.views.generic import DetailView, UpdateView
from django.urls import reverse_lazy
from django.views import View
from account.forms import *
from django.contrib.auth.views import LoginView
# Create your views here.

from django.contrib.auth import get_user_model

User = get_user_model()

class RegisterView(CreateView):
    template_name = 'register.html'
    model = User
    form_class = RegisterForm
    success_url = reverse_lazy('core:home')


class LoginView(LoginView):
    template_name = 'login.html'
    form_class = LoginForm

    def get_success_url(self, **kwargs): 
        return reverse_lazy('core:home')

