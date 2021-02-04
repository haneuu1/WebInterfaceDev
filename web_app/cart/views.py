from django.http.response import HttpResponse
from django.shortcuts import render

from django.views.generic import ListView, DetailView
from django.views.generic import DeleteView
from django.http import HttpResponse
from django.urls import reverse_lazy

from cart.models import Cart, CartItem
from shopwindow.models import Product
from myshop.views import OwnerOnlyMixin


class CartItemLV(ListView):
    model = CartItem
    template_name = 'cart/cart.html'

class CartItemDeleteVeiw(DeleteView):
    model = CartItem
    success_url = reverse_lazy('cart:index')
