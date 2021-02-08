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

    # /product/review/add/
    path('review/add/', ReviewCreateView.as_view(), name="review_add"),
    # /product/review/<int:pk>/update/
    path('review/<int:pk>/update/', ReviewUpdateView.as_view(), name="review_update"),
    # /product/review/<int:pk>/delete/
    path('review/<int:pk>/delete/', ReviewDeleteView.as_view(), name="review_delete"),
    # /product/review/
    # path('review/', ReviewLV.as_view(), name="review_list"),

    # /product/Q&A/add/
    path('QnA/add/', QACreateView.as_view(), name="QnA_add"),
    # /product/review/<int:pk>/update/
    path('QnA/<int:pk>/update/', QAUpdateView.as_view(), name="QnA_update"),
    # /product/review/<int:pk>/delete/
    path('QnA/<int:pk>/delete/', QADeleteView.as_view(), name="QnA_delete"),

]
