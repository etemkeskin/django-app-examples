from django.urls import path
from todo.views import *

# Define app name to call
app_name = "todo"

urlpatterns = [
    path('todo-list/', todo_list, name="todo_list"),
    path('todo-edit/<int:id>/', todo_edit, name="todo_edit"),
    path('todo-delete/<int:id>', todo_delete, name="todo_delete"),
    #=============== TODOs AJAX REQUEST =====================
    path('complete-todo/', complete_todo, name="complete_todo"),
]