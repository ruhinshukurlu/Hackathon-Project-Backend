import math
from django.db import models
from django.core.mail import send_mail
from django.core.validators import MaxValueValidator, MinValueValidator
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

    ratings = models.ManyToManyField('self', blank=True, through='RatingUser', related_name='users')

    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return self.email

    @property
    def avatar(self):
        if self.profile_img:
            return self.profile_img.url
        return 'https://user-images.githubusercontent.com/11250/39013954-f5091c3a-43e6-11e8-9cac-37cf8e8c8e4e.jpg'
    
    
    @property
    def rating(self):
        point = self.rating_users.all().aggregate(models.Avg('point'))
        print(point)
        if not point or not point.get('point__avg'):
            return 0.0
        return "{:.1f}".format(point.get('point__avg', 0))


class RatingUser(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE, related_name='rating_owners')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='rating_users')
    point = models.DecimalField(_('Point'), max_digits=2, decimal_places=1, validators=[MinValueValidator(1), MaxValueValidator(5)])

    class Meta:
        verbose_name = _('Rating User')
        verbose_name_plural = _('Ratings')
    
    def __str__(self):
        return self.user.email

    
class Student(models.Model):

    user = models.OneToOneField("account.User", related_name="student", verbose_name=_("Student"), on_delete=models.CASCADE, primary_key=True)
    group = models.ForeignKey("core.Group", related_name="students", verbose_name=_("Group"), on_delete=models.CASCADE)
    level = models.ForeignKey('core.Level', related_name='students', verbose_name=_("Level"), on_delete=models.CASCADE)
    last_month = models.ForeignKey('core.Month', related_name='students', verbose_name=_("Last Month"), on_delete=models.CASCADE)

    class Meta:
        verbose_name = _("Student")
        verbose_name_plural = _("Students")

    def __str__(self):
        return self.user.email



class Teacher(models.Model):

    user = models.OneToOneField("account.User", related_name="teacher", verbose_name=_("Teacher"), on_delete=models.CASCADE, primary_key=True)

    class Meta:
        verbose_name = _("Teacher")
        verbose_name_plural = _("Teachers")

    def __str__(self):
        return self.user.email

