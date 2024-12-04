# Generated by Django 4.2.16 on 2024-12-04 13:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0005_remove_sysuser_email_absuser_email'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sysuser',
            name='nickname',
        ),
        migrations.AddField(
            model_name='absuser',
            name='nickname',
            field=models.CharField(default='qwe', max_length=16, verbose_name='昵称'),
        ),
    ]