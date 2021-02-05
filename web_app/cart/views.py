from django.http.response import HttpResponse

from django.views.generic import ListView, DetailView
from django.views.generic import DeleteView
from django.http import HttpResponse
from django.urls import reverse_lazy

from django.shortcuts import render, redirect, get_object_or_404
from shopwindow.models import Product
from cart.models import Cart, CartItem
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import *

def _cart_id(request):
    cart = Cart.objects.get(user_id=request.user)
    # request.session['cart_id']= cart.id
    # print(request.session['user'])
    if not cart:
        cart = request.session.create()
    return cart.id

# 장바구니에 추가.. 수량 1로 고정. 
# product_detail 장바구니 버튼에 적용 고민.....
def plus_cart(request, product_id):
    product = Product.objects.get(id=product_id)
    try:
        cart = Cart.objects.get(id=_cart_id(request))
    except Cart.DoesNotExist:
        cart = Cart.objects.create(
            pk = _cart_id(request)
        )
        cart.save()
    
    try:
        cart_item = CartItem.objects.get(product=product, cart=cart)
        # 재고 고려
        if cart_item.quantity < cart_item.product.quantity:
            cart_item.quantity += 1
        else:
            pass #재고가 없습니다
        cart_item.save()
    except CartItem.DoesNotExist:
        cart_item = CartItem.objects.create(
            product = product,
            quantity = 1,
            cart = cart
        )
        cart_item.save()
    return redirect('cart:cart_detail')

def minus_cart(request, product_id):
    cart = Cart.objects.get(id=_cart_id(request))
    product = get_object_or_404(Product, id=product_id)
    cart_item = CartItem.objects.get(product=product, cart=cart)
    if cart_item.quantity > 1:
        cart_item.quantity -= 1
        cart_item.save()
    else:
        cart_item.delete()
    return redirect('cart:cart_detail')

def remove_cart(request, product_id):
    cart = Cart.objects.get(id=_cart_id(request))
    product = get_object_or_404(Product, id=product_id)
    cart_item = CartItem.objects.get(product=product, cart=cart)
    cart_item.delete()
    return redirect('cart:cart_detail')

def cart_detail(request, total=0, counter=0, cart_items=None):
    cart = Cart.objects.get(id=_cart_id(request))
    cart_items = CartItem.objects.filter(cart=cart, active=True)
    for cart_item in cart_items:
        total += (cart_item.product.price * cart_item.quantity)
        counter += cart_item.quantity
    return render(request, 'cart/cart_list.html', dict(cart_items=cart_items, total=total, counter=counter))
