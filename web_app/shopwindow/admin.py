from django.contrib import admin
from shopwindow.models import Product

# Register your models here.
@admin.register(Product)
class BookmarkAdmin(admin.ModelAdmin):
    list_display = ('name','price','description','quantity')