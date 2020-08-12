from django.contrib.auth.forms import UserCreationForm, UserChangeForm,AuthenticationForm, PasswordChangeForm, PasswordResetForm, SetPasswordForm
from django import forms
from django.contrib.auth import get_user_model

User = get_user_model()


class RegisterForm(UserCreationForm):
    password1 = forms.CharField(widget = forms.PasswordInput(attrs = {
       'class' : 'form-control',
       'placeholder' : 'Password *' 
    }), required=True)
    password2 = forms.CharField(widget = forms.PasswordInput(attrs = {
       'class' : 'form-control',
       'placeholder' : 'Re-enter password *' 
    }), required=True)

    class Meta:
        model = User
        fields = ('first_name','last_name','email','password1','password2',)

        widgets = {
            'first_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder' : 'First Name *',
                }),
            'last_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder' : 'Last Name *',
                }),
            'email' : forms.EmailInput(attrs = {
                'class' : 'form-control',
                'placeholder' : 'Email *'
            }),
        }


class LoginForm(AuthenticationForm):
    username = forms.EmailField(widget = forms.EmailInput(attrs = {
        'placeholder' : 'Email *',
        'class' : 'form-control',
    }))
    password = forms.CharField(widget = forms.PasswordInput(attrs = {
        'placeholder' : 'Password *',
        'class' : 'form-control',
    }))


