from django.forms import ModelForm
from quiz.models import Topic

class QuizTopicForm(ModelForm):

    class Meta:
        model = Topic
        fields = [
            'subject',
            'title'
        ]