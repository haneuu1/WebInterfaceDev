from django.db import models
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE
from shopwindow.models import Product

from django.dispatch import receiver
from django.db.models.signals import post_save

# Create your models here.
class Cart(models.Model):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)

@receiver(post_save, sender=User)
def create_user_cart(sender, instance, created, **kwargs):
    if created:
        Cart.objects.get_or_create(user=instance)

class CartItem(models.Model):
    product    = models.ForeignKey(Product, on_delete=CASCADE)
    cart       = models.ForeignKey(Cart, on_delete=CASCADE)
    quantity   = models.IntegerField(default=1)
    active     = models.BooleanField(default=True)

    def __str__(self):
        return str(self.product)

    def sub_total(self):
        return self.product.price * self.quantity
