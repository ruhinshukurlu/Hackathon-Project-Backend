from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from account.models import *
from django.contrib.auth import get_user_model

User = get_user_model()

class UserAdmin(BaseUserAdmin):
    fieldsets = (
        (None, {'fields': ('email', 'password', 'first_name', 'last_name','bio','profile_img',)}),
        ('Permissions', {'fields': (
            'is_active',
            'is_staff',
            'is_superuser',
            'groups',
            'user_permissions',
        )}),
    )
    add_fieldsets = (
        (
            None,
            {
                'classes': ('wide',),
                'fields': ('email','first_name', 'last_name', 'password1', 'password2','profile_img','bio',)
            }
        ),
    )

    list_display = ('email', 'id', 'is_staff',)
    list_filter = ('is_staff', 'is_superuser', 'is_active', )
    search_fields = ('email',)
    ordering = ('email',)

    def get_queryset(self, request, *args, **kwargs):
        queryset = super().get_queryset(request, *args, **kwargs)
        if request.user.is_superuser:
            return queryset
        return queryset.filter(id=request.user.pk)

    def get_readonly_fields(self, request, *args, **kwargs):
        if request.user.is_superuser:
            return ()
        return ('is_staff', 'is_superuser', 'is_active', 'groups', 'user_permissions',)

    

admin.site.register(User, UserAdmin)

admin.site.register([Student, Teacher, RatingUser])



