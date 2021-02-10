from django.db import models
from django.contrib.auth.models import User
from shopwindow.models import Product

# Create your models here.


class Order(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    order_set = models.IntegerField(default = -1) # 주문 세트 번호
    quantity = models.IntegerField(default= 0) # 주문 수량
    price = models.IntegerField(default=0) # 주문 가격
    order_date = models.DateTimeField("date ordered", auto_now_add=True)
    modify_dt = models.DateTimeField('MODIFY DATE', auto_now=True)
    order_status = models.CharField(max_length=50) # Ordered, Canceled


    class Meta:
        ordering = ('-modify_dt',) 

    def __str__(self):
        own = self.owner.username
        prodcut_name = self.product.name
        return own + prodcut_name