from django.db import models
from django.urls import reverse

# Create your models here.

class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    description = models.CharField(max_length=5000)
    #image
    quantity = models.IntegerField(default=0)

    def __str__(self):
        return self.name
    