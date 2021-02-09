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
from shopwindow.models import *



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
    paginate_by = 6

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        product = self.get_object()
        quantity_list = []
        for i in range(1, product.quantity) :
            quantity_list.append(i)
        context['quantity_list'] = quantity_list
        context['reviews'] = Review.objects.all()
        context['qnas'] = QuestionAnswer.objects.all()

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
        context['categories'] = Category.objects.all()

        return context

class CategoryLV(ListView):
    template_name = 'shopwindow/../templates/category_bar.html'
    model = Category


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
    fields = ['title', 'product', 'content']
    # initial = {'title':'title', 'content':'content'}
    
    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))

class ReviewUpdateView(OwnerOnlyMixin, UpdateView):
    model = Review
    fields = ['title', 'content', 'product']
    # success_url = reverse_lazy('shopwindow:index')

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))

class ReviewDeleteView(OwnerOnlyMixin, DeleteView) :
    model = Review
    # success_url = reverse_lazy('shopwindow:index')

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))


#--- FormView, Q&A
class QACreateView(LoginRequiredMixin, CreateView):
    model = QuestionAnswer
    template_name = 'shopwindow/qna_form.html'
    fields = ['title', 'content', 'product']
    # initial = {'title':'title', 'content':'content'}
    
    def form_valid(self, form):
        form.instance.owner = self.request.user
        return super().form_valid(form)

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))

class QAUpdateView(OwnerOnlyMixin, UpdateView):
    model = QuestionAnswer
    template_name = 'shopwindow/qna_form.html'
    fields = ['title', 'content', 'product']
    # success_url = reverse_lazy('shopwindow:index')

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))

class QADeleteView(OwnerOnlyMixin, DeleteView) :
    model = QuestionAnswer
    template_name = 'shopwindow/qna_confirm_delete.html'
    # success_url = reverse_lazy('shopwindow:index')

    def get_success_url(self):
        return reverse('shopwindow:detail',args=(self.object.product.id,))