from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Profile(models.Model):
    user = models.OneToOneField(User, null=False, on_delete=models.CASCADE, unique=True, primary_key=True)
    phone = models.CharField(max_length=20)
    address = models.CharField(max_length=20)

    def __str__(self):
        return str(self.user)