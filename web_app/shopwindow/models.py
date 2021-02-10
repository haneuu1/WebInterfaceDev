from django.db import models
from django.db.models.base import Model
from django.contrib.auth.models import User
from django.urls import reverse
from tinymce.models import HTMLField

from photo.fields import ThumbnailImageField

# Create your models here.

def user_directory_path(instance, filename):
    return f'photo/user_{instance.name}/{filename}'

class Category(models.Model):
    name=models.CharField(max_length=10, db_index=True)
    #db_index는 카테고리 정보가 저장되는 테이블에서 이 열을 인덱스 열로 설정한다는 옵션.
    
    def __str__(self):
        return self.name

    class Meta:
        ordering = ('id',) 


class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    description = models.CharField(max_length=5000)
    image = ThumbnailImageField('IMAGE',upload_to=user_directory_path,blank = True)
    quantity = models.IntegerField(default=0)
    category = models.CharField(max_length= 100, blank=True)
    # category = models.ForeignKey(Category, on_delete=models.CASCADE, default=1)

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


class Review(models.Model):
    title = models.CharField(verbose_name='TITLE', max_length=50)
    content = HTMLField('CONTENT')
    create_dt = models.DateTimeField('CREATE DATE', auto_now_add=True)
    modify_dt = models.DateTimeField('MODIFY DATE', auto_now=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE,
                                verbose_name='OWNER', blank=True, null=True)
    # 전체 상품 말고 주문한 상품으로 받기
    product = models.ForeignKey(Product, on_delete=models.CASCADE, default=1)

    class Meta:
        ordering = ('-create_dt',) 

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return '' # reverse('shopwindows:review_add', args=(self.id,))
    
    def get_previous(self):
        return self.get_previous_by_create_dt()

    def get_next(self):
        return self.get_next_by_create_dt()

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)


class Question(models.Model):
    title = models.CharField(verbose_name='TITLE', max_length=50)
    content = models.TextField('CONTENT')
    create_dt = models.DateTimeField('CREATE DATE', auto_now_add=True)
    modify_dt = models.DateTimeField('MODIFY DATE', auto_now=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE,
                                verbose_name='OWNER', blank=True, null=True)
    # 전체 상품 말고 주문한 상품으로 받기
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        ordering = ('-create_dt',)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return '' # reverse('shopwindows:review_add', args=(self.id,))
    
    def get_previous(self):
        return self.get_previous_by_create_dt()

    def get_next(self):
        return self.get_next_by_create_dt()

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)


class Answer(models.Model):
    content = models.TextField('CONTENT')
    create_dt = models.DateTimeField('CREATE DATE', auto_now_add=True)
    modify_dt = models.DateTimeField('MODIFY DATE', auto_now=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE,
                                verbose_name='OWNER', blank=True, null=True)
    # product = models.ForeignKey(Product, on_delete=models.CASCADE)
    question = models.OneToOneField(Question, on_delete=models.CASCADE)

    class Meta:
        ordering = ('-create_dt',) 

    def __str__(self):
        return self.question

    def get_absolute_url(self):
        return '' # reverse('shopwindows:review_add', args=(self.id,))
    
    def get_previous(self):
        return self.get_previous_by_create_dt()

    def get_next(self):
        return self.get_next_by_create_dt()

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
