from django.contrib import admin
from core.models import *
from django.contrib.auth import get_user_model
from account.models import Student
User = get_user_model()


admin.site.register([Session, Subject, Month, Comment, Level, ])


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):

    def render_change_form(self, request, context, *args, **kwargs):
        print(request.user.groups.filter(name="teacher").exists())

        if request.user.groups.filter(name="teacher").exists():
            student_ids = request.user.teacher.group_set.values_list('students', flat=True)
            student_list = Student.objects.filter(pk__in=student_ids)
            context['adminform'].form.fields['student'].queryset = student_list
        elif not request.user.is_superuser:
            context['adminform'].form.fields['student'].queryset = Student.objects.filter(user=request.user)
        return super().render_change_form(request, context, *args, **kwargs)



@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):

    def get_readonly_fields(self, request, *args, **kwargs):
        if request.user.groups.filter(name="teacher").exists():
            return ('teacher', 'session', 'start_date', )
        return super().get_readonly_fields(request, *args, **kwargs)


    # def render_change_form(self, request, context, *args, **kwargs):
    #     print(request.user.groups.filter(name="teacher").exists())

    #     if request.user.groups.filter(name="teacher").exists():
    #         student_ids = request.user.teacher.group_set.values_list('students', flat=True)
    #         student_list = Student.objects.filter(pk__in=student_ids)
    #         context['adminform'].form.fields['student'].queryset = student_list
    #     elif not request.user.is_superuser:
    #         context['adminform'].form.fields['student'].queryset = Student.objects.filter(user=request.user)
    #     return super().render_change_form(request, context, *args, **kwargs)


@admin.register(UserSocialMediaLink)
class UserSocialMediaLinkAdmin(admin.ModelAdmin):

    def render_change_form(self, request, context, *args, **kwargs):
        if not request.user.is_superuser:
            context['adminform'].form.fields['user'].queryset = User.objects.filter(pk=request.user.pk)
        return super().render_change_form(request, context, *args, **kwargs)

# Register your models here.
