from cart.models import WishItem
from shopwindow.models import Product
from typing import List
from django.shortcuts import render,redirect
from django.views.generic import ListView, DetailView, View
from order.models import Order
from django.urls import reverse
from django.db.models import Q

from django.contrib.auth.mixins import AccessMixin

from django.views.generic import CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from myshop.views import OwnerOnlyMixin,SuperOnlyMixin



class Mypage(View,AccessMixin):
    template_name = 'mypage/mypage.html'

    def get(self,request,*args,**kwargs):
        ## 로그인 안한 상태 일때
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())

        context = self.get_context_data(**kwargs)

        return render(request, self.template_name ,context)

    def get_context_data(self, **kwargs):
        context = dict()
        context["order_num"] = Order.objects.filter(Q(owner=self.request.user)&\
                                    Q(order_status = "Ordered")).count()

        context["cancel_num"] = Order.objects.filter(Q(owner=self.request.user)&\
                                Q(order_status = "Canceled")).count()
        
        context["wish_num"] = WishItem.objects.filter(owner=self.request.user).count()
        return context
    
    

class OrderLV(ListView):
    model = Order
    template_name = 'mypage/order_list.html'
    paginate_by = 10
    
    def get_queryset(self):
        return Order.objects.filter(Q(owner=self.request.user)&\
                                    Q(order_status = "Ordered"))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["user"] = self.request.user.username
        return context
    

class CanceledLV(ListView):
    model = Order
    template_name = 'mypage/canceled_list.html'
    paginate_by = 10


    def get_queryset(self):
        return Order.objects.filter(Q(owner=self.request.user)&\
                                Q(order_status = "Canceled"))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["user"] = self.request.user.username
        return context


class ProductCreateView(LoginRequiredMixin, CreateView):
    model = Product
    template_name = 'management/Add_product.html'
    fields = ['name','price', 'description', 'image', 'quantity', 'category']
    success_url = reverse_lazy('shopwindow:index')

    def get(self,request,*args,**kwargs):
        if not request.user.is_superuser:
            return redirect(reverse('shopwindow:index'))
        return super().get(request,*args,**kwargs)

    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

class ProductUpdateView(SuperOnlyMixin, UpdateView):
    model = Product
    fields = ['name','price', 'description', 'image', 'quantity', 'category']
    template_name = 'management/Add_product.html'
    success_url = reverse_lazy('shopwindow:index')

class ProductDeleteView(SuperOnlyMixin, DeleteView) :
    model = Product
    template_name = 'management/Delete_product.html'
    success_url = reverse_lazy('shopwindow:index')