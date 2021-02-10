from django.urls import path
from cart.views import *
from cart import views

app_name = 'cart'

urlpatterns = [
    # /cart/
    path('',views.cart_detail, name='cart_detail'),
    # /cart/add/product_id/
    path('plus/<int:product_id>/', views.plus_cart, name='plus_cart'), 
    path('minus/<int:product_id>/', views.minus_cart, name='minus_cart'),
    path('remove/<int:product_id>/', views.remove_cart, name='remove_cart'), 
    # /cart/wish/
    path('wish', WishLV.as_view(), name='wish_list'),
    path('awish/<int:product_id>/', views.add_wish, name="add_wish"),
    path('rwish/<int:product_id>/', views.remove_wish, name="remove_wish"),
]
