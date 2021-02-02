from django.urls import path
from shopwindow.views import *

app_name = 'shopwindoow'

urlpatterns = [
    # path('', ProductLV.as_view(),name= 'index'),
    path('<int:pk>', ProductDV.as_view(), name='detail'),
]