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
        
    def get_absolute_url(self): # 현재 데이터의 절대 경로 추출
        return '' # reverse('blog:post_detail', args=(self.slug,))
    
    def get_previous(self): # 이전 데이터 추출
        return self.get_previous_by_modify_dt()

    def get_next(self): # 다음 데이터 추출
        return self.get_next_by_modify_dt()