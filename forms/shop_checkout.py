from django import forms
from django_countries.fields import CountryField
from django_countries.widgets import CountrySelectWidget

PAYMENT_CHOICES = (
    ('S', 'Stripe'),
    ('P', 'PayPal')
)

class ShopCheckoutForm(forms.Form):
    first_name = forms.CharField(required= True,
        widget = forms.TextInput(attrs={ 'class': 'form-control'}))

    last_name = forms.CharField(required= False,
        widget = forms.TextInput(attrs={ 'class': 'form-control'}))

    email = forms.EmailField(required= True ,
        widget = forms.TextInput(attrs={ 'class': 'form-control'}))

    address = forms.CharField(required= False,
        widget = forms.TextInput(attrs={ 'class': 'form-control'}))

    country = CountryField(blank_label='(select country)').formfield( required=False,
        widget=CountrySelectWidget(attrs={'class': 'custom-select d-block w-100',}))

    phone = forms.CharField(required= False,
        widget = forms.TextInput(attrs={ 'class': 'form-control'}))
        
    payment_option = forms.ChoiceField(
        widget=forms.RadioSelect, choices=PAYMENT_CHOICES)