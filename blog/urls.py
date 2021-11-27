from django.urls import path
from blog.views import *

# Define app name to call
app_name = "blog"

urlpatterns = [
    path('posts/', posts, name="posts"),
    path('post/<slug:slug>/', post, name='post'),

    path('post-list/', post_list, name="post_list"),
    path('post-create/', post_create, name="post_create"),    
    path('<slug:slug>/update/', post_update, name='post_update'),
    path('<int:id>/delete/', post_delete, name='post_delete'),
]