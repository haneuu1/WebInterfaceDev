from django.http.response import HttpResponse
from django.shortcuts import render
from shopwindow.models import Product
from cart.models import Cart, CartItem
from django.views.generic import ListView
from django.http import HttpResponse


class CartItemLV(ListView):
    model = CartItem
    template_name = 'cart/cart.html'
