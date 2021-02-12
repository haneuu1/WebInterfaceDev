from django.contrib import admin
from cart.models import Cart, CartItem, WishItem
# Register your models here.

@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('user',)

@admin.register(CartItem)
class CartItemAdmin(admin.ModelAdmin):
    list_distplay = ('product', 'cart', 'user_quantity', 'active')

@admin.register(WishItem)
class CartItemAdmin(admin.ModelAdmin):
    list_distplay = ('product', 'owner', 'create_dt')