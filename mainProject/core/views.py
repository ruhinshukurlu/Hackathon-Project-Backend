import re
from django.shortcuts import render
from django.views.generic import TemplateView, ListView, DetailView, View
from account.models import *
from core.models import *
from django.http import JsonResponse
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.

class HomeView(TemplateView):
    template_name = "index.html"

class StudentListView(ListView):
    model = Student
    context_object_name = 'students'
    template_name = "student-list.html"

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['groups'] = Group.objects.all()
        context['levels'] = Level.objects.all()
        context['sessions'] = Session.objects.all()
        return context


class StudentAjaxListView(ListView):
    model = Student
    context_object_name = 'students'
    template_name = "student_list_ajax.html"

    def get_queryset(self):
        request = self.request
        queryset = super().get_queryset()
        filter_dict = {}
        group = request.GET.get('group')
        level = request.GET.get('level')
        session = request.GET.get('session')
        if not group and not level and not session:
            return queryset
        if group:
            filter_dict['group__id'] = group
        if level:
            filter_dict['level__id'] = level
        if session:
            filter_dict['group__session__id'] = session
        return queryset.filter(**filter_dict)
        
            


class StudentDetailView(DetailView):
    model = Student
    context_object_name = 'student'
    template_name = "student-detail.html"

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        student = self.object
        context['months'] = Month.objects.filter(title__lte=student.last_month.title)
        owner_rating = self.request.user.rating_owners.filter(user=self.object.user).first()
        if owner_rating:
            context['owner_rating'] = owner_rating.point
        else:
            context['owner_rating'] = 0

        context['projects'] = Project.objects.filter(student=self.object)
        return context


class GiveRatingView(LoginRequiredMixin, View):

    def get(self, *args, **kwargs):
        rating = self.request.GET.get('rating')
        owner = self.request.user
        user_id = kwargs.get('pk')
        user = User.objects.get(pk=user_id)
        if not rating or not re.match(r'^-?\d+(?:\.\d+)?$', rating):
            return JsonResponse({'message': 'Something went wrong'})
        rating = float(rating)
        if not 0<rating<=5:
            return JsonResponse({'message': 'Something went wrong'})
        RatingUser.objects.update_or_create(user=user, owner=owner, defaults={'point': rating})
        return JsonResponse({'message': 'success', 'rating': user.rating, 'owner_rating': rating})


