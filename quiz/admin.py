from django.contrib import admin
from quiz.models import Subject, Topic, Question, Quiz, StudentExam, StudentAnswers

admin.site.register(Subject)
admin.site.register(Topic)
admin.site.register(Question)
admin.site.register(Quiz)
admin.site.register(StudentExam)
admin.site.register(StudentAnswers)