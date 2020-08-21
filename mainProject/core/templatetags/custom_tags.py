from django.template import Library
from core.models import Subject, SkillCategory

register = Library()

@register.simple_tag
def get_subjects(month_id, session_id):
    return Subject.objects.filter(month__pk=month_id, session__pk=session_id)

@register.simple_tag
def get_student_skill_categories(student):
    student_skill_ids = student.student_skills.values_list('skill', flat=True)
    categories = SkillCategory.objects.filter(skills__in=student_skill_ids).distinct('id')
    return categories

@register.simple_tag
def get_student_skill_by_category(student, category):
    return student.student_skills.filter(skill__category=category)
