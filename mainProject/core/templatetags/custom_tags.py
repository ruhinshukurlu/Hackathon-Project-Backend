from django.template import Library
from core.models import Subject

register = Library()

@register.simple_tag
def get_subjects(month_id, session_id):
    return Subject.objects.filter(month__pk=month_id, session__pk=session_id)