from django.urls import path
from cart.views import *

app_name = 'cart'

urlpatterns = [
    #/cart
    path('',CartItemLV.as_view(),name= 'cart'),
    #/<cart:id>
    # path('<int:pk>', CartView.as_view(), name='detail'), 
    
]
