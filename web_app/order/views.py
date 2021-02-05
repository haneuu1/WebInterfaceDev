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

        return render(request,self.template_name,{})

    def post(self,request,*args,**kwargs):
        ## 로그인 안한 상태 일때
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(reverse('shopwindow:index'))

        product_quantity = list(map(int,request.POST['user_select_quantity']))
        print("quant :",product_quantity)
        product_ids = list(request.POST['product_id'])
        product_ids.append(1)
        products = []
        for product_id in product_ids:
            product = get_object_or_404(Product,pk=product_id)
            product.quantity = product_quantity[0]
            products.append(product)
        # 수량은 이후에 받아서 업데이트 시켜야 함
        context = dict()
        context['user']=request.user
        context['products']=products
        print(context)

        return render(request,self.template_name,context)


class CreateOrder(View):
    template_name = 'order/create_order.html'


    def post(self,request,*args,**kwargs):
        context = dict()
        user = self.request.user
        product_ids = self.request.POST.getlist('product_id')
        product_prices = self.request.POST.getlist('product_price')
        product_quantity = self.request.POST.getlist('product_quantity')
        print("user",user)
        print("id",product_ids)
        print("price",product_prices)
        print("qu",product_quantity)
        for id,price,quantity in zip(product_ids,product_prices,product_quantity):
            product = get_object_or_404(Product,pk=id)
            new_order = Order(owner = user, product=product, quantity=quantity,\
                price = price, order_status = "Ordered")
            new_order.save()
        
        return redirect(reverse('order:result'))


class OrderDone(ListView):
    model = Order
    template_name = 'order/create_order.html'


    def get_queryset(self):
        super().get_queryset()

        newest_order = Order.objects.filter(owner = self.request.user)[0]
        print(newest_order.order_date)
    

