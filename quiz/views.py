from django.shortcuts import render
from quiz.models import Question, Topic, Subject, Quiz, StudentExam, StudentAnswers
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.urls import reverse
from django.contrib import messages
from forms.quiz_subject import QuizSubjectForm
from forms.quiz_topic import QuizTopicForm
from forms.quiz_quiz import QuizQuizForm
from forms.quiz_question import QuizQuestionForm
from django.contrib.auth.decorators import login_required
from aws.role_decorator import role_required
from django.db.models import Avg, Count, Min, Sum

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def my_quizzes(request):
    context = {}
    current_user = request.user
    quizzes = StudentExam.objects.filter(user = current_user)
    context['my_quizzes'] = quizzes
    return render(request, 'quiz/my_quizzes.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def my_quiz(request, id=None):
    context = {}
    total_point = ""
    student_exam = StudentExam.objects.filter(id = id).first()
    total_question = Question.objects.filter(quiz = student_exam.quiz).count()
    correct_answer = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").count()
    wrong_answer = StudentAnswers.objects.filter(studentexam = student_exam, result = "WRONG").count()
    correct_point = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").aggregate(Sum('marks'))
    wrong_point = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").aggregate(Sum('marks'))
    if correct_point['marks__sum']:
        total_point = correct_point['marks__sum'] - wrong_point['marks__sum']
    context['student_exam'] = student_exam
    context['total_question'] = total_question
    context['correct_answer'] = correct_answer
    context['wrong_answer'] = wrong_answer
    context['marks_per_right_answer'] = student_exam.quiz.marks_per_right_answer
    context['marks_per_wrong_answer'] = student_exam.quiz.marks_per_wrong_answer
    if total_point != "":
        context['total_point'] = total_point
    quiz_questions =  StudentAnswers.objects.filter(studentexam = student_exam)
    context['quiz_questions'] = quiz_questions
    return render(request, 'quiz/my_quiz.html', context)

def quizzes(request):
    context = {}
    quizs = Quiz.objects.all()
    context['quizs'] = quizs
    return render(request, 'quiz/quizzes.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def quiz_start(request, id=None):
    context = {}
    quiz = Quiz.objects.filter(id = id).first()
    total_question = Question.objects.filter(quiz = quiz).count()
    context['quiz'] = quiz
    context['total_question'] = total_question
    return render(request, 'quiz/quiz_start.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def quiz_test(request, id=None):
    context = {}
    current_user = request.user
    quiz = Quiz.objects.filter(id = id).first()
    question_1 = Question.objects.filter(quiz = quiz).first()
    next_question = Question.objects.filter(quiz = quiz, pk__gt = question_1.id).first() 
    try:
        student_exam = StudentExam()
        student_exam.user = current_user
        student_exam.quiz = quiz
        student_exam.save()
    except Exception:
        pass
    context['quiz'] = quiz
    context['question_1'] = question_1
    context['next_question'] = next_question
    context['student_exam'] = student_exam   
    return render(request, 'quiz/quiz_test.html', context)

#=============== AJAX REQUESTS =====================
@login_required(login_url = "/login/") 
@role_required(allowed_roles = ["admin", "visitor"])
def quiz_test_action(request):
    checked_answer = ""    
    if request.method == "POST":        
        question_id = request.POST['question_id']
        next_question_id = request.POST['next_question_id']
        student_exam_id = request.POST['student_exam']
        answer = request.POST['answer']
        next_previous = request.POST['next_previous']

        solved_question = Question.objects.filter(id = question_id).first() # SOLVED QUESTION
        quiz = Quiz.objects.filter(question = solved_question).first()
        #SAVE OR UPDATED ANSWER   try_catch  block must be
        student_exam = StudentExam.objects.filter(id = student_exam_id).first()
        #### Student Question Answer and Check answer If it is correct or wrong #######
        result = ""
        marks = 0
        if answer == "empty":
            answer = ""
            result = ""
            marks = 0
        student_answer = StudentAnswers.objects.filter(studentexam = student_exam, question = solved_question).first()
        if student_answer:
            student_answer.answer = answer            
            if answer == solved_question.answer:
                result = "CORRECT"
                marks = quiz.marks_per_right_answer
            elif answer != "":
                result = "WRONG"
                marks = quiz.marks_per_wrong_answer
            student_answer.result = result
            student_answer.marks = marks
            student_answer.save()
        else:
            if answer == solved_question.answer:
                result = "CORRECT"
                marks = quiz.marks_per_right_answer
            elif answer != "":
                result = "WRONG"
                marks = quiz.marks_per_wrong_answer
            student_answer = StudentAnswers.objects.create(studentexam = student_exam, question = solved_question, answer = answer,
                                marks = marks, result = result)
        #### Student Question Answer and Check answer If it is correct or wrong END! #######
        if next_previous == "next":
            question = Question.objects.filter(id = next_question_id).first() 
            nq = StudentAnswers.objects.filter(studentexam = student_exam, question = question).first()
            if nq:
                checked_answer = nq.answer

        if next_previous == "previous":
            previous_question = Question.objects.filter(quiz = quiz, pk__lt = question_id).last()# PROBLEM
            question = previous_question# solved_question
            pq = StudentAnswers.objects.filter(studentexam = student_exam, question = question).first()
            if previous_question:
                checked_answer = pq.answer

        previous_question = Question.objects.filter(quiz = quiz, pk__lt = question.id).last()
        next_question = Question.objects.filter(quiz = quiz, pk__gt = question.id).first()        
        ##########################################################################################
        disabled = ""
        a, b, c, d = "", "", "", ""
        if checked_answer == "A":
            a = "checked"
        elif checked_answer == "B":
            b = "checked"
        elif checked_answer == "C":
            c = "checked"
        elif checked_answer == "D":
            d = "checked"
        else:
            a, b, c, d = "", "", "", ""
        # Check whether there is  an image
        image = ""
        if question.image:
            image = '<div class="container"><img src="{image_url}" class="mb-2" style="width:100%; max-width:800px; height: auto;" alt="Question-Image">\
                </div>'.format(image_url = question.image.url )
        # Check whether there is  an image 

        load_question = '<div id="load_question">\
        <div class="card-body">{image}\
            <p><strong><span id="quizQuestion">1</span></strong> {question_title}</p>\
            <div class="form-group clearfix">\
                <div class="row"><div class="icheck-primary d-inline">\
                        <input type="radio" id="radioPrimary1" name="answer" {a} value="A">\
                        <label for="radioPrimary1"> <strong>A ) </strong>{question_option_a}</label> </div></div>\
                <div class="row"><div class="icheck-primary d-inline">\
                    <input type="radio" id="radioPrimary2" name="answer" {b} value="B">\
                    <label for="radioPrimary2"> <strong>B ) </strong>{question_option_b}</label></div></div>\
                <div class="row"><div class="icheck-primary d-inline">\
                        <input type="radio" id="radioPrimary3" name="answer" {c} value="C">\
                        <label for="radioPrimary3"><strong>C ) </strong> {question_option_c}</label></div></div>\
                <div class="row"><div class="icheck-primary d-inline">\
                        <input type="radio" id="radioPrimary4" name="answer" {d} value="D">\
                        <label for="radioPrimary4"><strong>D ) </strong> {question_option_d}</label></div></div></div>\
            '.format(question_title = question.title, question_option_a = question.option_a, question_option_b = question.option_b,
                        question_option_c = question.option_c, question_option_d = question.option_d,
                        a = a, b  = b, c = c, d = d, image = image )

        if next_question and next_previous == "next":
            load_question += '<button type="button" class="btn btn-info btn-flat {disabled}" onclick="PreviousQuestion();">&laquo; Previous</button>\
            <button type="button" class="btn btn-info btn-flat {disabled}" onclick="NextQuestion();">Next &raquo;</button>\
            <a href="/quiz/quiz-result/{student_exam_id}/" class="btn btn-info btn-flat float-right">Finish Quiz</a>\
            <input type="hidden" name="question_id" value="{question_id}">\
            <input type="hidden" name="student_exam" value="{student_exam_id}">\
            <input type="hidden" name="next_question_id" value="{next_question_id}"></div>'.format( 
                question_id = question.id, next_question_id = next_question.id, student_exam_id = student_exam.id, disabled = disabled)
        elif previous_question and next_previous == "previous":
            load_question += '<button type="button" class="btn btn-info btn-flat {disabled}" onclick="PreviousQuestion();">&laquo; Previous</button>\
            <button type="button" class="btn btn-info btn-flat {disabled}" onclick="NextQuestion();">Next &raquo;</button>\
            <a href="/quiz/quiz-result/{student_exam_id}/" class="btn btn-info btn-flat float-right">Finish Quiz</a>\
            <input type="hidden" name="question_id" value="{question_id}">\
            <input type="hidden" name="student_exam" value="{student_exam_id}">\
            <input type="hidden" name="next_question_id" value="{next_question_id}"></div>'.format( 
                question_id = question.id, next_question_id = next_question.id, student_exam_id = student_exam.id, disabled = disabled)
        elif not previous_question and next_previous == "previous":
            load_question += '<button type="button" class="btn btn-info btn-flat" {disabled}>&laquo; Previous</button>\
            <button type="button" class="btn btn-info btn-flat" onclick="NextQuestion();">Next &raquo;</button>\
            <a href="/quiz/quiz-result/{student_exam_id}/" class="btn btn-info btn-flat float-right">Finish Quiz</a>\
            <input type="hidden" name="question_id" value="{question_id}">\
            <input type="hidden" name="student_exam" value="{student_exam_id}">\
            <input type="hidden" name="next_question_id" value="{next_question_id}"></div>'.format(
            question_id = question.id, next_question_id = next_question.id, student_exam_id = student_exam.id, disabled = "disabled") 
        else:
            load_question += '<button type="button" class="btn btn-info btn-flat" onclick="PreviousQuestion();">&laquo; Previous</button>\
            <button type="button" class="btn btn-info btn-flat {disabled}">Next &raquo;</button>\
            <a href="/quiz/quiz-result/{student_exam_id}/" class="btn btn-info btn-flat float-right">Finish Quiz</a>\
            <input type="hidden" name="question_id" value="{question_id}">\
            <input type="hidden" name="student_exam" value="{student_exam_id}">\
            <input type="hidden" name="next_question_id" value="{next_question_id}"></div>'.format(
            question_id = question.id, next_question_id = "", student_exam_id = student_exam.id, disabled = "disabled")  
    return HttpResponse(load_question)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def quiz_result(request, id=None):
    context = {}
    student_exam = StudentExam.objects.filter(id = id).first()
    total_question = Question.objects.filter(quiz = student_exam.quiz).count()
    correct_answer = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").count()
    wrong_answer = StudentAnswers.objects.filter(studentexam = student_exam, result = "WRONG").count()
    correct_point = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").aggregate(Sum('marks'))
    wrong_point = StudentAnswers.objects.filter(studentexam = student_exam, result = "CORRECT").aggregate(Sum('marks'))
    total_point = correct_point['marks__sum'] - wrong_point['marks__sum']
    context['student_exam'] = student_exam
    context['total_question'] = total_question
    context['correct_answer'] = correct_answer
    context['wrong_answer'] = wrong_answer
    context['total_point'] = total_point
    return render(request, 'quiz/quiz_result.html', context)

#################################
@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def question_list(request):
    context = {}
    questions = Question.objects.all()
    quizs = Quiz.objects.all()
    context['questions'] = questions
    context['quizs'] = quizs
    return render(request, 'quiz/question_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def question_create(request):
    context = {}
    form = QuizQuestionForm()
    subjects = Subject.objects.all()
    context['form'] = form
    context['subjects'] = subjects
    if request.method == "POST":
        try:
            form = QuizQuestionForm(request.POST, request.FILES)
            topic_id = request.POST["topic"]
            topic = Topic.objects.filter(id = topic_id).first()
            if form.is_valid():
                form = form.save(commit = False)
                form.topic = topic
                form.save()
            messages.success(request, "Question has been successfully created.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
    return render(request, 'quiz/question_create.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def question_update(request, id=None):
    context = {}
    question = Question.objects.filter(id = id).first()
    form = QuizQuestionForm(instance = question)
    subject = Subject.objects.filter().first()
    subjects = Subject.objects.all()
    context['subjects'] = subjects
    context['form'] = form
    context['question'] = question
    context['question'] = question
    if request.method == "POST":
        try:
            form = QuizQuestionForm(request.POST, request.FILES, instance = question)
            topic_id = request.POST["topic"]
            topic = Topic.objects.filter(id = topic_id).first()
            if form.is_valid():
                form = form.save(commit = False)
                form.topic = topic
                form.save()
            messages.success(request, "Question has been successfully updated.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
    return render(request, 'quiz/question_edit.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def question_delete(request, id):
    if request.method == "POST":
        id = id
        Question.objects.filter(id = id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('quiz:question_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def add_to_quiz(request, id):
    if request.method == "POST":
        try:
            quiz_id = request.POST["quiz_id"]
            question = Question.objects.filter(id = id).first()
            quiz = Quiz.objects.filter(id = quiz_id).first()
            question.quiz.add(quiz)
            quiz.save()
            messages.success(request, "Question has been successfully added to quiz.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:question_list'))
    return HttpResponseRedirect(reverse('quiz:question_list'))

@login_required(login_url = "/login/")
def question(request):
    context = {}    
    return render(request, 'quiz/question.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def quiz(request, id=None):
    context = {}
    quiz = Quiz.objects.filter(id = id).first()
    questions = Question.objects.filter(quiz = quiz)
    context['quiz'] = quiz
    context['questions'] = questions
    return render(request, 'quiz/quiz.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def quiz_create(request):
    context = {}
    form = QuizQuizForm()
    context['form'] = form
    # Create 10 and n questions quiz Service or add questions one by one
    if request.method == "POST":
        try:
            form = QuizQuizForm(request.POST)
            if form.is_valid():
                form.save()
            messages.success(request, "Quiz has been successfully created.")
            return HttpResponseRedirect(reverse('quiz:quiz_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:quiz_list'))
    return render(request, 'quiz/quiz_create.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def quiz_update(request, id=None):
    context = {}
    quiz = Quiz.objects.filter(id = id).first()
    form = QuizQuizForm(instance = quiz)
    context['form'] = form
    if request.method == "POST":
        try:
            form = QuizQuizForm(request.POST, instance = quiz)
            if form.is_valid():
                form.save()
            messages.success(request, "Quiz has been successfully updated.")
            return HttpResponseRedirect(reverse('quiz:quiz_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:quiz_list'))
    return render(request, 'quiz/quiz_edit.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def quiz_delete(request, id=None):
    if request.method == "POST":
        id = id
        Quiz.objects.filter(id=id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('quiz:quiz_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def quiz_list(request):
    context = {}    
    quizs = Quiz.objects.all()
    context['quizs'] = quizs
    return render(request, 'quiz/quiz_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def subject_list(request):
    context = {}
    # We fetched subjects with children(topics)
    subjects = Subject.objects.prefetch_related('topics').all()
    form1 = QuizSubjectForm()
    form2 = QuizTopicForm()
    topics = Topic.objects.all()
    context['subjects'] = subjects
    context['topics'] = topics
    context['form1'] = form1
    context['form2'] = form2
    return render(request, 'quiz/subject_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def subject_create(request):
    context = {}
    if request.method == "POST":
        try:
            form = QuizSubjectForm(request.POST)
            if form.is_valid():
                form.save()
            messages.success(request, "Subject has been successfully created.")
            return HttpResponseRedirect(reverse('quiz:subject_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:subject_list'))
    return HttpResponseRedirect(reverse('quiz:subject_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def subject_update(request, id):
    context = {}    
    if request.method == "POST":
        title = request.POST["title"]
        try:
            subject = Subject.objects.filter(id = id).first()            
            subject.title = title
            subject.save()
            messages.success(request, "Edited Successfully ")
        except Exception:
            messages.warning(request, "There was a problem while saving. ")
        return HttpResponseRedirect(reverse('quiz:subject_list'))
    return HttpResponseRedirect(reverse('quiz:subject_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def subject_delete(request, id=None):
    if request.method == "POST":
        id = id
        Subject.objects.filter(id=id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('quiz:subject_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def topic_create(request):
    context = {}
    if request.method == "POST":
        try:
            form = QuizTopicForm(request.POST)
            if form.is_valid():
                form.save()
            messages.success(request, "Topic has been successfully created.")
            return HttpResponseRedirect(reverse('quiz:subject_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('quiz:subject_list'))
    return HttpResponseRedirect(reverse('quiz:subject_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def topic_update(request, id):
    context = {}    
    if request.method == "POST":
        title = request.POST["title"]
        subject_id = request.POST["subject"]
        subject = Subject.objects.filter(id = subject_id).first()
        try:
            topic = Topic.objects.filter(id = id).first()            
            topic.title = title
            topic.subject = subject
            topic.save()
            messages.success(request, "Edited Successfully ")
        except Exception:
            messages.warning(request, "There was a problem while saving. ", e)
        return HttpResponseRedirect(reverse('quiz:subject_list'))
    return HttpResponseRedirect(reverse('quiz:subject_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def topic_delete(request, id=None):
    if request.method == "POST":
        id = id
        Topic.objects.filter(id=id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('quiz:subject_list'))

#=============== AJAX REQUEST =====================
@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def get_topics_ajax(request):
    if request.method == "POST":
        subject_id = request.POST['subject_id']
        try:
            subject = Subject.objects.filter(id = subject_id).first()
            topics = Topic.objects.filter(subject = subject)
        except Exception:
            data['error_message'] = 'error'
            return JsonResponse(data)
        return JsonResponse(list(topics.values('id', 'title')), safe = False) 