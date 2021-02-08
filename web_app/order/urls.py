from django.urls import path
from order.views import *

app_name = 'order'

urlpatterns = [
    #/order
    # path('',OrderDv.as_view(),name= 'index'),
    # path('',views.index,name = 'index'),
    path('',OrderVW.as_view(),name='pre_order'),
    path('create/',CreateOrderVW.as_view(),name = 'create_order'),
    path('result/',OrderDone.as_view(),name='result'),
    path('cancel/',OrderCancel.as_view(),name="cancel"),

]
