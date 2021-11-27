from django.db import models
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField #CKEditor

class Subject(models.Model):
    title = models.CharField(max_length = 250, null = True, blank = True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return "{0}".format(self.title)

class Topic(models.Model):
    title = models.CharField(max_length = 250, null = True, blank = True)
    subject = models.ForeignKey(Subject, on_delete = models.CASCADE, related_name = "topics" )
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return "{0}".format(self.title)

LEVEL_CHOICES = (
    ('L', 'LOW'),
    ('M', 'MEDIUM'),
    ('A', 'ADVANCED'),
)

ANSWER_CHOICES = (
    ('A', 'A'),
    ('B', 'B'),
    ('C', 'C'),
    ('D', 'D'),
)
class Quiz(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE, null = True, blank = True)   
    quiz_title = models.CharField(max_length = 150, null = True, blank = True)
    quiz_note = models.CharField(max_length = 500, null = True, blank = True)
    quiz_datetime = models.DateTimeField(null = True, blank = True)
    quiz_duration = models.PositiveSmallIntegerField(null=True, blank = True)
    marks_per_right_answer = models.DecimalField( max_digits=4, decimal_places=2, null = True, blank = True)
    marks_per_wrong_answer = models.DecimalField( max_digits=4, decimal_places=2, null = True, blank = True)
    quiz_status = models.BooleanField(default= False, blank = True)
    quiz_code = models.CharField(max_length = 50, null = True, blank = True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now= True)

    def __str__(self):
        return "{0}".format(self.quiz_title)

class Question(models.Model):
    title = RichTextUploadingField(null = True, blank = True)
    quiz = models.ManyToManyField(Quiz, blank =True)
    image = models.ImageField(upload_to = 'pictures/%Y/%m/%d/', max_length = 255, null=True, blank =True)
    topic = models.ForeignKey(Topic, on_delete = models.CASCADE )
    level = models.CharField(choices = LEVEL_CHOICES, default = 'L', max_length=2)  
    option_a = models.CharField(max_length = 1000, null = True, blank = True)
    option_b = models.CharField(max_length = 1000, null = True, blank = True)
    option_c = models.CharField(max_length = 1000, null = True, blank = True)
    option_d = models.CharField(max_length = 1000, null = True, blank = True)
    answer = models.CharField(choices = ANSWER_CHOICES, max_length=2, null = True, blank = True)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return "{0}".format(self.title)

    
class StudentExam(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE)
    quiz = models.ForeignKey(Quiz, on_delete= models.CASCADE)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

RESULT_CHOICES = (
    ('CORRECT', 'CORRECT'),
    ('WRONG', 'WRONG'),
    ('EMPTY', 'EMPTY'),
)

class StudentAnswers(models.Model):
    studentexam = models.ForeignKey(StudentExam, on_delete= models.CASCADE)    
    question = models.ForeignKey(Question, on_delete= models.CASCADE)
    answer = models.CharField(choices = ANSWER_CHOICES, max_length=2)
    marks = models.DecimalField( max_digits=4, decimal_places=2, null = True, blank = True)
    result = models.CharField(choices = RESULT_CHOICES, max_length=10, default = "EMPTY")

# class StudentAssesments(models.Model):
