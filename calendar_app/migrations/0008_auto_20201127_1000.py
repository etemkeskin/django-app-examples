# Generated by Django 3.1.1 on 2020-11-27 07:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('calendar_app', '0007_auto_20201125_2119'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schedule',
            name='all_day',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
    ]
