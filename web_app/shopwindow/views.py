from django.shortcuts import render
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from shopwindow.models import Category, Product
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy, reverse

from django.views.generic import FormView
from django.db.models import Q
from django.shortcuts import render
from myshop.views import OwnerOnlyMixin

from shopwindow.forms import ProductSearchForm
from shopwindow.models import Review



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

    # def get_queryset(self):
    #     return Review.objects.filter(tags__name=self.kwargs.get('tag'))

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

class ReviewLV(ListView):
    model = Review
    paginate_by = 6


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

#--- FormView, review
class ReviewCreateView(LoginRequiredMixin, CreateView):
    model = Review
    template_name = 'shopwindow/review_form.html'
    fields = ['title', 'content', 'product']
    # initial = {'title':'title', 'content':'content'}
    
    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))


 

class ReviewUpdateView(OwnerOnlyMixin, UpdateView):
    model = Review
    fields = ['title', 'content']
    success_url = reverse_lazy('shopwindow:detail')

class ReviewDeleteView(OwnerOnlyMixin, DeleteView) :
    model = Review
    success_url = reverse_lazy('shopwindow:detail')