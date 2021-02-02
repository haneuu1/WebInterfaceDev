from django.urls import path
from shopwindow.views import *

app_name = 'shopwindow'

urlpatterns = [
    #/product
    path('',ProductLV.as_view(),name= 'index'),
    #/<product:id>
    path('<int:pk>', ProductDV.as_view(), name='detail'), 




]
