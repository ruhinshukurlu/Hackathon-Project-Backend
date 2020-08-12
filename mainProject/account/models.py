from django.db import models
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin, AbstractBaseUser
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone

from account.managers import UserManager

class User(AbstractBaseUser, PermissionsMixin):
    first_name = models.CharField(_("First name"), max_length=50)
    last_name = models.CharField(_("Last name"), max_length=50)
    email = models.EmailField(_('email address'), unique=True)
    bio = models.TextField(_("User bio"), blank = True, null = True)
    profile_img = models.ImageField(_("Profile Image"), upload_to='profile-pictures/',blank = True)
    date_joined = models.DateTimeField(default=timezone.now)

    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return self.email


    
class Student(models.Model):

    user = models.OneToOneField("account.User", verbose_name=_("Student"), on_delete=models.CASCADE, primary_key=True)
    group = models.ForeignKey("core.Group", verbose_name=_(""), on_delete=models.CASCADE)

    class Meta:
        verbose_name = _("Student")
        verbose_name_plural = _("Students")

    def __str__(self):
        return self.user.email



class Teacher(models.Model):

    user = models.OneToOneField("account.User", verbose_name=_("Teacher"), on_delete=models.CASCADE, primary_key=True)

    class Meta:
        verbose_name = _("Teacher")
        verbose_name_plural = _("Teachers")

    def __str__(self):
        return self.user.email

