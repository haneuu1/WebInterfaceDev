from django.db import models
from django.contrib.auth.models import User
from shopwindow.models import Product

# Create your models here.


class Order(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quntity = models.IntegerField(default= 0)
    price = models.IntegerField(default=0)
    order_date = models.DateTimeField("date ordered")
    order_status = models.CharField(max_length=50)

    def __str__(self):
        own = self.owner.username
        prodcut_name = self.product.name
        return own + prodcut_name