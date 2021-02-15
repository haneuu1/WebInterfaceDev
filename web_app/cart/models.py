from django.db import models
from django.contrib.auth.models import User
from django.db.models.deletion import CASCADE
from django.db.models.expressions import OrderBy
from shopwindow.models import Product

from django.dispatch import receiver
from django.db.models.signals import post_save

# Create your models here.
class Cart(models.Model):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)
    
    def __str__(self):
        return str(self.id)

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

    def to_json(self):
        return {
            'product_name': self.product.name,
            'product_price': self.product.price,
            'user_quantity': self.quantity
        }

class WishItem(models.Model):
    product     = models.ForeignKey(Product, on_delete=CASCADE)
    owner       = models.ForeignKey(User, on_delete=CASCADE)
    create_dt   = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('-create_dt',)

    def __str__(self):
        return str(self.product)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)