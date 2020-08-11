from django.db import models
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin, AbstractUser
from django.utils.translation import ugettext_lazy as _

from account.managers import UserManager


class User(AbstractUser):
    
    email = models.EmailField(_("Email"), max_length=254, unique=True)
    profile_img = models.ImageField(_("Profile image"),upload_to='profile-pictures/', null=True, blank=True)
    bio = models.TextField(_("Biography"))

    USERNAME_FIELD = 'email'    
    REQUIRED_FIELDS = []

    objects = UserManager()

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

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

