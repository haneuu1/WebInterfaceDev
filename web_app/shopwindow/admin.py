from django.contrib import admin
from shopwindow.models import Product, Review

# Register your models here.
@admin.register(Product)
class BookmarkAdmin(admin.ModelAdmin):
    list_display = ('name','price','description','quantity','image','category')


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('title','content','create_dt','modify_dt','owner')