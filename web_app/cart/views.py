from django.http.response import HttpResponse
from django.urls import reverse_lazy, reverse
from django.shortcuts import render, redirect, get_object_or_404
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import *
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, CreateView, DeleteView, View
from django.contrib.auth.mixins import AccessMixin, LoginRequiredMixin
from django.db.models import Q

from myshop.views import OwnerOnlyMixin
from shopwindow.models import Product
from cart.models import Cart, CartItem, WishItem
from accounts.models import User

import json

@login_required
def _cart_id(request):
    cart = Cart.objects.get(user_id=request.user)
    if not cart:
        cart = request.session.create()
    return cart.id

# 장바구니에 추가.. 수량 1로 고정. 
# product_detail 장바구니 버튼에 적용 고민.....
@login_required
def plus_cart(request, product_id, user_select_quantity=1):
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
            cart_item.quantity += user_select_quantity
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

@login_required
def cart_detail(request, total=0, counter=0, cart_items=None):
    cart = Cart.objects.get(id=_cart_id(request))
    cart_items = CartItem.objects.filter(cart=cart, active=True)
    items_js = json.dumps([item.to_json() for item in cart_items]) 
    # print(f'items: {items_js}')
    return render(request, 'cart/cart_list.html', dict(cart_items=cart_items, items_js=items_js))


@login_required
def add_wish(request, product_id):
    product = Product.objects.get(id=product_id)
    owner = User.objects.get(username=request.user)
    try:
        wish_item = WishItem.objects.get(product=product, owner=owner)
        wish_item.save()
    except WishItem.DoesNotExist:
            wish_item= WishItem.objects.create(
                product = product,
                owner = owner,
            )
            wish_item.save()

    return redirect('cart:wish_list')

def remove_wish(request, product_id):
    owner = User.objects.get(username=request.user)
    product = get_object_or_404(Product, id=product_id)
    wish_item = WishItem.objects.get(product=product, owner=owner)
    wish_item.delete()
    return redirect('cart:wish_list')

class WishLV(View, AccessMixin):
    model = WishItem
    template_name = 'cart/wish_list.html'

    def get(self,request,*args,**kwargs):
        ## 로그인 안한 상태 일때
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())
        context = self.get_context_data(**kwargs)
        return render(request, self.template_name, context=context)

    def get_context_data(self, **kwargs):
        context = dict()
        context["products"] = WishItem.objects.filter(owner=self.request.user)
        return context