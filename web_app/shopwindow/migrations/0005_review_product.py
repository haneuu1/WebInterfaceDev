# Generated by Django 3.1.5 on 2021-02-05 11:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shopwindow', '0004_review'),
    ]

    operations = [
        migrations.AddField(
            model_name='review',
            name='product',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='shopwindow.product'),
        ),
    ]
