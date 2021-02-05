from django.urls import path
from shopwindow.views import *

app_name = 'shopwindow'

urlpatterns = [
    # /product/
    path('',ProductLV.as_view(),name= 'index'),
    # /product/<product:id>
    path('<int:pk>', ProductDV.as_view(), name='detail'), 
    # /product/category/<str:category>
    path('category/<str:category>',Productcategory.as_view(),name='category'),
    # /product/search/
    path('search/', SearchFormView.as_view(), name='search'),

    # /product/review/
    path('review/', ReviewCreateView.as_view(), name="review_add"),
    # /product/review/<int:pk>/update/
    path('<int:pk>/update/', ReviewUpdateView.as_view(), name="update"),
    # /product/review/<int:pk>/delete/
    path('<int:pk>/delete/', ReviewDeleteView.as_view(), name="delete"),
]
