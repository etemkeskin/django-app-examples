from django.forms import ModelForm, Textarea, NumberInput, CharField, EmailField, TextInput, DecimalField, DateTimeField, DateTimeInput, DateInput
from django.core.exceptions import ValidationError
from django import forms
from quiz.models import Quiz

class QuizQuizForm(ModelForm):
 
    quiz_title = CharField(
        max_length = '150',
        required=True,
        error_messages= {
            'max_length' : 'Title length should not be more than 150 characters'
        },
        widget = TextInput(attrs={ 'class': 'form-control'})      
    )

    quiz_note = CharField(
        max_length = '500',
        error_messages= {
            'max_length' : 'Quiz note length should not be more than 500 characters'
        },
        widget = TextInput(attrs={'class': 'form-control'})      
    )

    quiz_code = CharField(
            max_length = '50',
            error_messages= {
                'max_length' : 'Quiz code length should not be more than 50 characters'
            },
            widget = TextInput(attrs={'class': 'form-control'})      
        )

    quiz_datetime = DateTimeField(
        required=True,
        error_messages= {
            'required': 'Please enter datetime'
        },
        widget = DateInput(format='%Y-%m-%d', attrs={'class': 'form-control', 'type': 'date'})      
    )

    quiz_duration = DecimalField(
        required=True,
        error_messages= {
            'required': 'Please enter duration'
        },
        widget = NumberInput(attrs={'class': 'form-control'})    
    )

    marks_per_right_answer = DecimalField(
        required=True,
        error_messages= {
            'required': 'Please enter mark per right answer'
        },
        widget = NumberInput(attrs={'class': 'form-control', 'step': "0.1"})   
    )

    marks_per_wrong_answer = DecimalField(
        required=True,
        error_messages= {
            'required': 'Please enter mark per wrong answer'
        },
        widget = NumberInput(attrs={'class': 'form-control', 'step': "0.1"})    
    )

    class Meta:
        model = Quiz #We define which form will be used.
        fields = ['quiz_title', 'quiz_note', 'quiz_code', 'quiz_datetime', 'quiz_duration', 'marks_per_right_answer', 'marks_per_wrong_answer' ]
        
