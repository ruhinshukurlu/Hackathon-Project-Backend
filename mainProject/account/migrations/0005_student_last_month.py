# Generated by Django 3.0.8 on 2020-08-14 11:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20200814_1047'),
        ('account', '0004_student_level'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='last_month',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.CASCADE, related_name='students', to='core.Month', verbose_name='Last Month'),
            preserve_default=False,
        ),
    ]