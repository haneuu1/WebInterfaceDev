from django import template

register = template.Library()

# 커스텀 태그 곱하기를 사용하기위한 부분
@register.filter
def multiply(value, arg):
    try:
        return value * arg
    except Exception:
        return ''