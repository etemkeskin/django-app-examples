# Generated by Django 3.1.1 on 2020-10-30 11:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0008_auto_20201028_2236'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentanswers',
            name='result',
            field=models.CharField(choices=[('CORRECT', 'CORRECT'), ('WRONG', 'WRONG'), ('EMPTY', 'EMPTY')], default='EMPTY', max_length=10),
        ),
    ]
