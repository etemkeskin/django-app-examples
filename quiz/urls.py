from django.urls import path
from quiz.views import *

# Define app name to call
app_name = "quiz"

urlpatterns = [
    path('subject-list/', subject_list, name="subject_list"),
    path('subject/<int:id>/update/', subject_update, name='subject_update'),
    path('subject/<int:id>/delete/', subject_delete, name='subject_delete'),
    path('subject-create/', subject_create, name="subject_create"),

    path('topic/<int:id>/update/', topic_update, name='topic_update'),
    path('topic/<int:id>/delete/', topic_delete, name='topic_delete'),
    path('topic-create/', topic_create, name="topic_create"),

    path('question-list/', question_list, name="question_list"),
    
    path('question-create/', question_create, name="question_create"),
    path('question/<int:id>/update/', question_update, name='question_update'),
    path('question/<int:id>/delete/', question_delete, name='question_delete'),
    path('question/', question, name="question"),

    path('quiz-list/', quiz_list, name="quiz_list"),
    path('quiz/<int:id>/', quiz, name="quiz"),
    path('quiz/<int:id>/update/', quiz_update, name='quiz_update'),
    path('quiz/<int:id>/delete/', quiz_delete, name='quiz_delete'),
    path('quiz-create/', quiz_create, name="quiz_create"),

    path('add-to-quiz/<int:id>/', add_to_quiz, name="add_to_quiz"),

    path('my-quizzes/', my_quizzes, name="my_quizzes"),
    path('my-quiz/<int:id>/', my_quiz, name="my_quiz"),     
    #=============== QUIZs AJAX REQUEST =====================
    path('quiz_test_action/', quiz_test_action, name="quiz_test_action"),
    path('get-topics-ajax/', get_topics_ajax, name="get_topics_ajax"),

    path('quizzes/', quizzes, name="quizzes"),
    path('quiz-start/<int:id>/', quiz_start, name="quiz_start"),
    path('quiz-test/<int:id>/', quiz_test, name="quiz_test"),
    path('quiz-result/<int:id>/', quiz_result, name="quiz_result"),
]