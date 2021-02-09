from typing import List
from django.shortcuts import render,redirect
from django.views.generic import ListView, DetailView, View
from order.models import Order
from django.urls import reverse
from django.db.models import Q

from django.contrib.auth.mixins import AccessMixin


class Mypage(View,AccessMixin):
    template_name = 'mypage/mypage.html'

    def get(self,request,*args,**kwargs):
        ## 로그인 안한 상태 일때
        if not request.user.is_authenticated:
            self.handle_no_permission()
            return redirect(self.get_login_url())

        return render(request, self.template_name ,{})


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