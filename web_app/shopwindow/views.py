from django.shortcuts import render
from django.views.generic import ListView,DetailView
from shopwindow.models import Product


# Create your views here.
class ProductLV(ListView):
    model = Product
    paginate_by = 3

class ProductDV(DetailView):
    model = Product

class Productcategory(ListView):
    template_name = 'shopwindow/product_category_list.html'

    model = Product
    paginate_by = 3

    def get_queryset(self):
        return Product.objects.filter(category=self.kwargs.get('category'))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.kwargs['category']
        return context