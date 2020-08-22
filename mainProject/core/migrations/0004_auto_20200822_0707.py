# Generated by Django 3.0.8 on 2020-08-22 07:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0005_student_last_month'),
        ('core', '0003_auto_20200821_1051'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='studentskill',
            options={'ordering': ('-percentage',), 'verbose_name': 'Student Skill', 'verbose_name_plural': 'Student Skills'},
        ),
        migrations.CreateModel(
            name='StudentTask',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('percentage', models.IntegerField(verbose_name='Percentage')),
                ('clean_code', models.IntegerField(verbose_name='clean_code')),
                ('practice', models.IntegerField(verbose_name='Practice')),
                ('algorithm', models.IntegerField(verbose_name='Algorithm')),
                ('month', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_tasks', to='core.Month')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_tasks', to='account.Student')),
            ],
            options={
                'verbose_name': 'Student Task',
                'verbose_name_plural': 'Student Tasks',
                'ordering': ('-month',),
            },
        ),
        migrations.CreateModel(
            name='StudentContinuity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('percentage', models.IntegerField(verbose_name='Percentage')),
                ('month', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='continuities', to='core.Month')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='continuities', to='account.Student')),
            ],
            options={
                'verbose_name': 'Student Continuity',
                'verbose_name_plural': 'Student Continuities',
                'ordering': ('-month',),
            },
        ),
        migrations.CreateModel(
            name='StudentActivity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('percentage', models.IntegerField(verbose_name='Percentage')),
                ('creativity', models.IntegerField(verbose_name='Creativity')),
                ('problem_solving', models.IntegerField(verbose_name='Problem solving')),
                ('responsibility', models.IntegerField(verbose_name='Responsibility')),
                ('month', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='activities', to='core.Month')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='activities', to='account.Student')),
            ],
            options={
                'verbose_name': 'Student Activity',
                'verbose_name_plural': 'Student Activities',
                'ordering': ('-month',),
            },
        ),
    ]