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

    # /product/question/add/
    path('question/add/', QuestionCreateView.as_view(), name="question_add"),
    # /product/question/<int:pk>/update/
    path('question/<int:pk>/update/', QuestionUpdateView.as_view(), name="question_update"),
    # /product/question/<int:pk>/delete/
    path('question/<int:pk>/delete/', QuestionDeleteView.as_view(), name="question_delete"),

    # /product/answer/add/
    path('answer/add/', AnswerCreateView.as_view(), name="answer_add"),
    # /product/answer/<int:pk>/update/
    path('answer/<int:pk>/update/', AnswerUpdateView.as_view(), name="answer_update"),
    # /product/answer/<int:pk>/delete/
    path('answer/<int:pk>/delete/', AnswerDeleteView.as_view(), name="answer_delete"),

]
