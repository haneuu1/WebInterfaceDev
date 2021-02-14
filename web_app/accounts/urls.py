from django.urls import path
#from .views import PasswordsChangeView
from .views import UserEditView, PasswordsChangeView

from django.contrib.auth import views as auth_view
from . import views
from .views import register

app_name = 'accounts'

urlpatterns = [
    # ./account/
    path('login/', auth_view.LoginView.as_view(), name="login"),
    path('logout/', auth_view.LogoutView.as_view(template_name = 'registration/logout.html'), name="logout"),

    path('register/', register, name='register'),
    path('edit_profile/', UserEditView.as_view(), name='edit_profile'),

    path('password/', PasswordsChangeView.as_view(template_name = 'registration/password_change.html'), name="password_change"),
    path('password_success', views.password_success, name="password_success"),
]