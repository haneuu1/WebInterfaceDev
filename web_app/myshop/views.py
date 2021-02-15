from shopwindow.models import Product
from django.contrib.auth.mixins import AccessMixin
from django.urls import reverse_lazy
from django.views.generic import ListView
from django.views.generic import TemplateView

from shopwindow.models import Product
from order.models import Order

# TemplateView
class HomeView(ListView):
    model = Product
    paginate_by = 3
    template_name = 'homepage.html'



class OwnerOnlyMixin(AccessMixin):
    raise_exeption = True
    permission_denied_message = "Owner only can update/delete the object"

    def get(self, request, *args, **kwargs):
        self.object = self.get_object() # 모델 인스턴스 얻기
        if self.request.user != self.object.owner:  #소유자인지 확인
            self.handle_no_permission() # 예외 발생

        return super().get(request, *args, **kwargs)


class SuperOnlyMixin(AccessMixin):
    raise_exeption = True
    permission_denied_message = "Owner only can update/delete the object"

    def get(self, request, *args, **kwargs):
        self.object = self.get_object() # 모델 인스턴스 얻기
        if not self.request.user.is_superuser:  #소유자인지 확인
            self.handle_no_permission() # 예외 발생

        return super().get(request, *args, **kwargs)