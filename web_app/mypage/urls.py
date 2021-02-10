from django.urls import path
from .views import *

app_name = 'mypage'

urlpatterns = [

    path('', Mypage.as_view(), name='mypage'),
    path('myorder', OrderLV.as_view(), name='myorder'),
    path('mycanceled', CanceledLV.as_view(), name='mycanceled'),

    # 상품 추가
    path('add/', ProductCreateView.as_view(), name="add"),
    path('update/<int:pk>/', ProductUpdateView.as_view(), name="update"),
    path('delete/<int:pk>/', ProductDeleteView.as_view(), name="delete"),


]
