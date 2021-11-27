from django.shortcuts import render
from todo.models import Todo
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger   #Pagination
from django.urls import reverse
from django.http import HttpResponseRedirect, JsonResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from aws.role_decorator import role_required

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def todo_list(request):
    context = {}
    todo_list = Todo.objects.filter( user = request.user).order_by('status')   

    #Pagination START
    page = request.GET.get('page')
    paginator = Paginator(todo_list, 13)
    try:
        todos = paginator.page(page)
    except PageNotAnInteger:
        todos = paginator.page(1)
    except EmptyPage:
        todos = paginator.page(paginator.num_pages)
    #Pagination END!
    context['todos'] = todos
    #Create todo
    if request.method == "POST":
        current_user = request.user
        description = request.POST["description"]
        try:
            Todo.objects.create(user=current_user, description=description)
        except Exception:
            messages.warning(request, "There was a problem while saving. ")
        HttpResponseRedirect(reverse('todo:todo_list'))
    return render(request, 'todo/todo_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def todo_edit(request, id=None):
    if request.method == "POST":
        current_user = request.user
        description = request.POST["description"]
        try:
            todo = Todo.objects.filter(id = id).first()
            todo.description = description
            todo.save()
            messages.success(request, "Edited Successfully ")
        except Exception:
            messages.warning(request, "There was a problem while saving. ")
        return HttpResponseRedirect(reverse('todo:todo_list'))
    return HttpResponseRedirect(reverse('todo:todo_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def todo_delete(request, id=None):
    if request.method == "POST":
        id = id
        Todo.objects.filter(id=id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('todo:todo_list'))

#Ajax Request Function
@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"]) 
def complete_todo(request):
    data = {}
    if request.method == "POST":
        todo_id = request.POST['todo_id']
        status = request.POST['todo_status']
        try:
            todo = Todo.objects.filter(id = todo_id).first()
            todo.status = status
            todo.save()
            data = {
                'is_taken': 'success'
            }
        except Exception:
            data['error_message'] = 'error'
            return JsonResponse(data)
        return JsonResponse(data)

