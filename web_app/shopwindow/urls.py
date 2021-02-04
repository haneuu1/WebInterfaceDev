from django.urls import path
from shopwindow.views import *

app_name = 'shopwindow'

urlpatterns = [
    #/product
    path('',ProductLV.as_view(),name= 'index'),
    #/<product:id>
    path('<int:pk>', ProductDV.as_view(), name='detail'), 
    #/category/<str:category>
    path('category/<str:category>',Productcategory.as_view(),name='category' )
    
]