from django.urls import path
from cart.views import *

app_name = 'cart'

urlpatterns = [
    # /cart/cart_id
    path('<int:cart_id>',CartItemLV.as_view(), name='index'),
    # /cart/cart_id/delete
    path('<int:cart_id>', CartItemDeleteVeiw.as_view(), name='delete'), 
    

]
