from django.forms import ModelForm, Textarea, CharField, EmailField, TextInput
from django.core.exceptions import ValidationError
from main.models import Contact

class MainContactForm(ModelForm):
    email = EmailField(
        max_length = '150',
        required=True,
        error_messages= {
            'max_length' : 'Email length should not be more than 150 characters'
        },
        widget = TextInput(attrs={ 'class': 'form-control'})      
    )

    subject = CharField(
        max_length = '250',
        required=True,
        error_messages= {
            'max_length' : 'Subject length should not be more than 250 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    message = CharField(
        max_length = '1000',
        required=True,
        error_messages= {
            'max_length' : 'Message length should not be more than 1000 characters'
        },
        widget = Textarea(attrs={'rows': 5, 'class': 'form-control form-control-sm'})      
    )

    class Meta:
        model = Contact
        fields = ['email', 'subject', 'message']
        