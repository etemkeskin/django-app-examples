from django.forms import ModelForm, Textarea, FileInput, CharField, EmailField, TextInput
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from main.models import Profile

class MainProfileForm(ModelForm):
    phone = CharField(
        max_length = '13',
        required=True,
        error_messages= {
            'max_length' : 'Phone length should not be more than 13 characters'
        },
        widget = TextInput(attrs={ 'class': 'form-control'})      
    )

    address = CharField(
        max_length = '500',
        required=True,
        error_messages= {
            'max_length' : 'Address length should not be more than 500 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    country = CharField(
        max_length = '200',
        required=True,
        error_messages= {
            'max_length' : 'Last name length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    occupation = CharField(
        max_length = '250',
        required=True,
        error_messages= {
            'max_length' : 'Occupation length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    class Meta:
        model = Profile #We define which form will be used.
        fields = ['phone', 'occupation', 'image', 'country', 'address']
        
        widgets = {
            'image': FileInput(attrs={'class': 'custom-file-input', 'aria-describedby':'image', 'id': 'exampleInputFile'} ),
        }
