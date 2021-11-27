from django.forms import ModelForm
from quiz.models import Subject

class QuizSubjectForm(ModelForm):

    class Meta:
        model = Subject
        fields = [
            'title'
        ]
