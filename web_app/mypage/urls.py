from django.urls import path
from .views import CanceledLV, Mypage
from .views import OrderLV

app_name = 'mypage'

urlpatterns = [

    path('', Mypage.as_view(), name='mypage'),
    path('myorder', OrderLV.as_view(), name='myorder'),
    path('mycanceled', CanceledLV.as_view(), name='mycanceled'),
    

]
