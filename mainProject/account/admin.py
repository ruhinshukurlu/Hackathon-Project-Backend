# from django.contrib import admin
# from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# from account.models import *
# from django.contrib.auth import get_user_model

# User = get_user_model()

# class UserAdmin(BaseUserAdmin):
#     fieldsets = (
#         (None, {'fields': ('email', 'password', 'first_name', 'last_name','profile_img',)}),
#         ('Permissions', {'fields': (
#             'is_active',
#             'is_staff',
#             'is_superuser',
#             'is_student',
#             'is_teacher',
#             'groups',
#             'user_permissions',
#         )}),
#     )
#     add_fieldsets = (
#         (
#             None,
#             {
#                 'classes': ('wide',),
#                 'fields': ('email','first_name', 'last_name', 'password1', 'password2','profile_img',)
#             }
#         ),
#     )

#     list_display = ('email', 'id', 'is_staff','is_student','is_teacher',)
#     list_filter = ('is_staff', 'is_superuser', 'is_active', )
#     search_fields = ('email',)
#     ordering = ('email',)

# admin.site.register(User, UserAdmin)



