from django.urls import path
from .views import UserRegisterView, UserEditView, PasswordsChangeView
from django.contrib.auth import views as auth_view
from . import views

app_name = 'accounts'

urlpatterns = [

    path('login/', auth_view.LoginView.as_view(), name="login"),
    #path('logout/', auth_view.LogoutView.as_view(template_name = 'registration/logout.html'), name="logout"),
    path('logout/', auth_view.LogoutView.as_view(template_name = 'registration/logout.html'), name="logout"),

    path('register/', UserRegisterView.as_view(), name='register'),
    path('edit_profile/', UserEditView.as_view(), name='edit_profile'),
    #path('password/', auth_views.PasswordChangeView.as_view(template_name = 'registration/change-password.html')),
    path('password/', PasswordsChangeView.as_view(template_name = 'registration/password_change.html')),
    path('password_success', views.password_success, name="password_success"),


]

