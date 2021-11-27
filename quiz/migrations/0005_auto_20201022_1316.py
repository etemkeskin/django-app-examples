# Generated by Django 3.1.1 on 2020-10-22 10:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0004_auto_20201020_2022'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='quiz',
            field=models.ManyToManyField(blank=True, null=True, to='quiz.Quiz'),
        ),
        migrations.AlterField(
            model_name='topic',
            name='subject',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to='quiz.subject'),
        ),
        migrations.DeleteModel(
            name='QuestionsInQuiz',
        ),
    ]
