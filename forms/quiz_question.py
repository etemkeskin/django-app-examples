from django.forms import ModelForm, Textarea, NumberInput, CharField, EmailField, TextInput, DecimalField, DateTimeField, DateTimeInput, FileInput,  ChoiceField, Select
from django.core.exceptions import ValidationError
from django import forms
from quiz.models import Question
from ckeditor.widgets import CKEditorWidget

class QuizQuestionForm(ModelForm):
    title =  forms.CharField(widget=CKEditorWidget())

    option_a = CharField(
        max_length = '1000',
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    option_b = CharField(
        max_length = '1000',
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    option_c = CharField(
        max_length = '1000',
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    option_d = CharField(
        max_length = '1000',
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    ANSWER_CHOICES = (
        ('A', 'A'),
        ('B', 'B'),
        ('C', 'C'),
        ('D', 'D'),
    )
 
    answer = ChoiceField(
        choices = ANSWER_CHOICES,
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        }        ,
        widget = Select(attrs={'class': 'form-control custom-select'})     
    )

    LEVEL_CHOICES = (
        ('L', 'LOW'),
        ('M', 'MEDIUM'),
        ('A', 'ADVANCED'),
    )

    level = ChoiceField(
        choices = LEVEL_CHOICES,
        error_messages= {
            'max_length' : 'Option length should not be more than 1000 characters'
        }        ,
        widget = Select(attrs={'class': 'form-control custom-select'})     
    )

    class Meta:
        model = Question #We define which form will be used.
        fields = ['title', 'option_a', 'option_b', 'option_c', 'option_d', 'image', 'answer', 'level' ]
        
        widgets = {
            'image': FileInput(attrs={'aria-describedby':'image'} ),
        }


    

        
