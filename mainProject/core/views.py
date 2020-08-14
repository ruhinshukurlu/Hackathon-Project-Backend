from django.shortcuts import render
from django.views.generic import TemplateView, ListView, DetailView
from account.models import *
from core.models import *

# Create your views here.

class HomeView(TemplateView):
    template_name = "index.html"

class StudentListView(ListView):
    model = Student
    context_object_name = 'students'
    template_name = "student-list.html"


class StudentDetailView(DetailView):
    model = Student
    context_object_name = 'student'
    template_name = "student-detail.html"
