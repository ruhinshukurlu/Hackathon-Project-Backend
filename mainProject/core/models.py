from django.db import models
from django.utils.translation import ugettext as _

# Create your models here.

class Group(models.Model):

    name = models.CharField(_("Group Name"), max_length=50)
    teacher = models.ForeignKey("account.Teacher", verbose_name=_("Teacher"), on_delete=models.CASCADE)
    session = models.ForeignKey("core.Session", verbose_name=_("Session"), on_delete=models.CASCADE)
    current_month = models.ForeignKey("core.Month", verbose_name=_("Current month"), on_delete=models.CASCADE)
    start_date = models.DateField(_("Start Date"))
    end_date = models.DateField(_("End Date"))

    class Meta:
        verbose_name = _("Group")
        verbose_name_plural = _("Groups")

    def __str__(self):
        return self.name


class Session(models.Model):

    name = models.CharField(_("Session Name"), max_length=50)

    class Meta:
        verbose_name = _("Session")
        verbose_name_plural = _("Sessions")

    def __str__(self):
        return self.name
  

class Subject(models.Model):

    title = models.CharField(_("Subject title"), max_length=50)
    session = models.ForeignKey("core.Session", verbose_name=_("session"), on_delete=models.CASCADE)
    month = models.ForeignKey("core.Month", verbose_name=_("Month"), on_delete=models.CASCADE)

    class Meta:
        verbose_name = _("Subject")
        verbose_name_plural = _("Subjects")

    def __str__(self):
        return self.name


class Month(models.Model):

    MONTH_CHOICES = (
        (1,_('1 month')),
        (2,_('2 month')),
        (3,_('3 month')),
        (4,_('4 month')),
        (5,_('5 month')),
        (6,_('6 month')),
        (7,_('7 month')),
        (8,_('8 month')),
    )

    title = models.IntegerField(_("title"), choices=MONTH_CHOICES)

    class Meta:
        verbose_name = _("Month")
        verbose_name_plural = _("Months")

    def __str__(self):
        return self.name


class Project(models.Model):

    name = models.CharField(_("Project Name"), max_length=150)
    student = models.ForeignKey("account.Student", verbose_name=_("Student"), on_delete=models.CASCADE)
    image = models.ImageField(_("Image"), upload_to='project-photos')
    link = models.URLField(_("Link"), max_length=200)

    class Meta:
        verbose_name = _("Project")
        verbose_name_plural = _("Projects")

    def __str__(self):
        return self.name


class UserSocialMediaLink(models.Model):

    user = models.ForeignKey("account.User", verbose_name=_("User"), on_delete=models.CASCADE)
    name = models.CharField(_("Name"), max_length=50)
    url = models.URLField(_("Url"), max_length=200)

    class Meta:
        verbose_name = _("UserSocialMediaLink")
        verbose_name_plural = _("UserSocialMediaLinks")

    def __str__(self):
        return self.name


class Comment(models.Model):

    author = models.ForeignKey("account.User", verbose_name=_("Author"), on_delete=models.CASCADE, related_name='author_comment')
    student = models.ForeignKey("account.User", verbose_name=_("Student"), on_delete=models.CASCADE, related_name='comment')
    text = models.TextField(_("Text"))
    commented_at = models.DateTimeField(_("Commented At"),auto_now_add=True)
    updated_at = models.DateTimeField(_("Updated"), auto_now=True)

    class Meta:
        verbose_name = _("Comment")
        verbose_name_plural = _("Comments")

    def __str__(self):
        return self.author

   
class Level(models.Model):

    title = models.CharField(_("Title"), max_length=50)
    student = models.ForeignKey("account.Student", verbose_name=_("Student"), on_delete=models.CASCADE)

    class Meta:
        verbose_name = _("Level")
        verbose_name_plural = _("Levels")

    def __str__(self):
        return self.title

       