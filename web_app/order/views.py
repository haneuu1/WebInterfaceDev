from shopwindow.models import Product
from order.models import Order
from django.shortcuts import get_object_or_404, redirect, render
from django.views.generic import View,ListView,DetailView,TemplateView
from django.urls import reverse

from django.contrib.auth.mixins import AccessMixin
from django.views.defaults import permission_denied

# Create your views here.

class OrderVW(View,AccessMixin):
    template_name = 'order/order_detail.html'
    context_object_name = 'objects'

    permission_denied_message = "You must login before buy something"

    def get(self,request,*args,**kwargs):
        
        return redirect(self.get_login_url())

    def post(self,request,*args,**kwargs):
        ## 로그인 안한 상태 일때
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())

        product_quantity = list(map(int,request.POST.getlist('user_select_quantity')))
        print("quant :",product_quantity)
        product_quantity.append(1)
        product_ids = list(request.POST.getlist('product_id'))
        product_ids.append(1)
        products = []
        for product_id,quantity in zip(product_ids,product_quantity):
            product = get_object_or_404(Product,pk=product_id)
            product.quantity = quantity
            products.append(product)
        # 수량은 이후에 받아서 업데이트 시켜야 함  --> 시킴
        context = dict()
        context['user']=request.user
        context['products']=products

        return render(request,self.template_name,context)


class CreateOrderVW(View):
    template_name = 'order/create_order.html'

    def post(self,request,*args,**kwargs):
        context = dict()
        user = self.request.user
        product_ids = self.request.POST.getlist('product_id')
        product_prices = self.request.POST.getlist('product_price')
        product_quantity = self.request.POST.getlist('product_quantity')
        order_set_num = -1
        # print("order check")
        # print("user",user)
        # print("id",product_ids)
        # print("price",product_prices)
        # print("qu",product_quantity)
        # print("order check end")
        for id,price,quantity in zip(product_ids,product_prices,product_quantity):
            # 새로운 주문 생성
            product = get_object_or_404(Product,pk=id)
            new_order = Order(owner = user, product=product, quantity=quantity,\
                price = price, order_status = "Ordered")
            new_order.save() # db 에 저장 해야만 pk를 알수있음

            # 주문세트의 번호 설정(첫번째 주문의 pk로 전부 설정)
            if order_set_num == -1:
                order_set_num = new_order.pk
            new_order.order_set= order_set_num
            new_order.save()
        
        return redirect(reverse('order:result'))


class OrderDone(ListView,AccessMixin):
    model = Order
    template_name = 'order/create_order.html'

    def get(self,request,*args,**kwargs):
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())
        return super().get(request,*args,**kwargs)

    def get_queryset(self):
        newest_order = Order.objects.filter(owner = self.request.user)[0]
        # print(">",newest_order.order_set)
        # print(">",Order.objects.filter(order_set = newest_order.order_set))
        return Order.objects.filter(order_set = newest_order.order_set)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['orderDone_list'] = self.get_queryset()
        # print(context['orderDone_list'])
        return context




    
class OrderCancel(View,AccessMixin):

    def get(self,request,*args,**kwargs):
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())

        return redirect(reverse('mypage:myorder'))

    def post(self,request,*args,**kwargs):
        cancel_order_pk = request.POST['cancel_order_pk']
        target_order = get_object_or_404(Order,pk=cancel_order_pk)
        target_order.order_status = "Canceled"
        target_order.save()

        return redirect(reverse('mypage:myorder'))
    
