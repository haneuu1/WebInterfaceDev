from django.urls import path
from cart import views

app_name = 'cart'

urlpatterns = [
    # /cart/
    path('',views.cart_detail, name='cart_detail'),
    # /cart/add/product_id/
    path('plus/<int:product_id>/', views.plus_cart, name='plus_cart'), 
    path('minus/<int:product_id>/', views.minus_cart, name='minus_cart'),
    path('remove/<int:product_id>/', views.remove_cart, name='remove_cart'), 
]
