from django.contrib import admin
from cart.models import Cart, CartItem
# Register your models here.

@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('user',)

@admin.register(CartItem)
class CartItemAdmin(admin.ModelAdmin):
    list_distplay = ('product', 'cart', 'user_quantity', 'active')