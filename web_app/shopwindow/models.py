from django.db import models
from django.db.models.base import Model
from django.urls import reverse


from photo.fields import ThumbnailImageField

# Create your models here.

def user_directory_path(instance, filename):
    return f'photo/user_{instance.name}/{filename}'

class Category(models.Model):
    name=models.CharField(max_length=10, db_index=True)
    #db_index는 카테고리 정보가 저장되는 테이블에서 이 열을 인덱스 열로 설정한다는 옵션.
    

    def __str__(self):
        return self.subject



class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    description = models.CharField(max_length=5000)
    image = ThumbnailImageField('IMAGE',upload_to=user_directory_path,blank = True)
    quantity = models.IntegerField(default=0)
    category = models.CharField(max_length= 100, blank=True)

    def __str__(self):
        return self.name
        
    def get_absolute_url(self): # 현재 데이터의 절대 경로 추출
        return '' # reverse('blog:post_detail', args=(self.slug,))
    
    def get_previous(self): # 이전 데이터 추출
        return self.get_previous_by_modify_dt()

    def get_next(self): # 다음 데이터 추출
        return self.get_next_by_modify_dt()
    
    def save(self, *args, **kwargs):
        if self.id is None:
            temp_image = self.image
            self.image = None
            super().save(*args, **kwargs)
            self.image = temp_image
        super().save(*args, **kwargs)