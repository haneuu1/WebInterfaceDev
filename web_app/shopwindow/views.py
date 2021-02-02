from django.shortcuts import render
from django.views.generic import ListView,DetailView
from shopwindow.models import Product


# Create your views here.
class ProductLV(ListView):
    model = Product
    paginate_by = 2

class ProductDV(DetailView):
    model = Product

