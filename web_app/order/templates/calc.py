from django import template

register = template.Library()

# 커스텀 태그 곱하기를 사용하기위한 부분
@register.filter
def multiply(value, arg):
    try:
        return value * arg
    except Exception:
        return ''


@register.filter
def total(products):
    try:
        total_price = 0
        for product in products:
            total_price += (product.price*product.quantity) 
        return total_price
    except Exception as e:
        return e