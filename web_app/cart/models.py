from django.db import models
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE
from shopwindow.models import Product

# Create your models here.
class Cart(models.Model):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)

class CartItem(models.Model):
    product         = models.ForeignKey(Product, on_delete=CASCADE)
    cart            = models.ForeignKey(Cart, on_delete=CASCADE)
    user_quantity   = models.IntegerField(default=1)
    active          = models.BooleanField(default=True)

    def sub_total(self):
        return self.product.price * self.user_quantity

    def __str__(self):
        return str(self.product)
