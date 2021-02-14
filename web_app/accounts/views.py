from django.views.generic import TemplateView, CreateView, UpdateView
from django.shortcuts import render
from .forms import SignUpForm
from django.contrib.auth.views import PasswordChangeView
from .forms import SignUpForm, EditProfileForm, PasswordChangingForm, ProfileForm
from django.urls import reverse_lazy

def register(request):
    if request.method == "POST":
        user_form = SignUpForm(request.POST)
        profile_form = ProfileForm(request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            new_user = user_form.save(commit=False)
            new_user.set_password(user_form.cleaned_data['password1'])
            new_user.save()
            profile_form.save()
            return render(request, 'registration/register_done.html',{'new_user':new_user})

    else:
        user_form = SignUpForm()
        profile_form = ProfileForm()
    return render(request, 'registration/register.html', {'form':user_form, 'profile_form':profile_form})


class PasswordsChangeView(PasswordChangeView):
    form_class = PasswordChangingForm
    success_url = reverse_lazy('accounts:password_success')

def password_success(request):
    return render(request, 'registration/password_success.html', {})

class UserEditView(UpdateView):
    template_name = 'registration/edit_profile.html'
    form_class = EditProfileForm
    success_url = reverse_lazy('accounts:login')

    def get_object(self):
        return self.request.user