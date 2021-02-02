from django.shortcuts import render
from django.views.generic import DetailView
from shopwindow.models import Product

# Create your views here.
class ProductDV(DetailView):
    model = Product