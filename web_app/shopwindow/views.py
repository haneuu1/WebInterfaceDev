from django.shortcuts import render
from django.views.generic import ListView,DetailView
from shopwindow.models import Category, Product

from django.views.generic import FormView
from django.db.models import Q
from django.shortcuts import render

from shopwindow.forms import ProductSearchForm



# Create your views here.
class ProductLV(ListView):
    model = Product
    paginate_by = 6

    # def get_queryset(self):
    #     return Product.objects.category.all()

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     context['category'] = self.kwargs['category']


    #     return context

class ProductDV(DetailView):
    model = Product

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        product = self.get_object()
        quantity_list = []
        for i in range(1, product.quantity) :
            quantity_list.append(i)
        context['quantity_list'] = quantity_list
        return context

class Productcategory(ListView):
    template_name = 'shopwindow/product_category_list.html'

    model = Product
    paginate_by = 6

    def get_queryset(self):
        return Product.objects.filter(category=self.kwargs.get('category'))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.kwargs['category']

        return context

#--- FormView
class SearchFormView(FormView):
    form_class = ProductSearchForm
    template_name = 'shopwindow/product_list.html'

    def form_valid(self, form):
        searchWord = form.cleaned_data['search_word']
        post_list = Product.objects.filter(\
                    Q(name__icontains=searchWord) |\
                    Q(description__icontains=searchWord) \
                    ).distinct()

        context = {}
        context['form'] = form
        context['search_term'] = searchWord
        context['object_list'] = post_list

        return render(self.request, self.template_name, context)