from django.shortcuts import render 
from blog.models import Post
from django.http import HttpResponse, HttpResponseRedirect
from forms.post_create import PostCreateForm
from django.contrib import messages
from django.urls import reverse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger   #Pagination
from django.contrib.auth.decorators import login_required
from aws.role_decorator import role_required

# Frontend Section
def posts(request):
    context = {}
    post_list =Post.objects.filter( status = "Published").order_by('-created_at')

    #Pagination START
    page = request.GET.get('page')
    paginator = Paginator(post_list, 5)
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    #Pagination END!
    context['posts'] = posts
    # SEARCH START
    query = request.GET.get('q')    
    if query:
        post_list = post_list.filter(
            Q(title__icontains = query) |
            Q(content__icontains = query)
        )
        context['posts'] = post_list
        return render(request, 'blog/posts.html', context)
    # SEARCH END !!!
    return render(request, 'blog/posts.html', context)

def post(request, slug):
    context = {}
    q = Post.objects.filter(slug__iexact = slug) 
    if q.exists():
        q = q.first() 
    else: 
        return HttpResponse('<h1>Post Not Found</h1>')
    context['post'] = q
    return render(request, 'blog/post.html', context)

# Backend Section
@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin", "visitor"])
def post_list(request):
    context = {}
    post_list = Post.objects.all()
    context['posts'] = post_list    
    return render(request, 'blog/post_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def post_create(request):
    context = {}
    user = request.user
    if request.method == "POST":
        try:
            form = PostCreateForm(request.POST, request.FILES)
            if form.is_valid():
                post_form = form.save(commit = False)
                post_form.user = user
                post_form.save()
            messages.success(request, "Your post has been successfully submitted.")
            return HttpResponseRedirect(reverse('blog:post_list'))
        except Exception as e:
            messages.warning(request, "There was a problem.")
            return render(request, 'blog/post_create.html', context)
    else:
        form = PostCreateForm()    
    context['form'] = form
    return render(request, 'blog/post_create.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def post_update(request, slug):
    context = {}
    user = request.user
    post = Post.objects.filter(slug = slug).first()
    if request.method == "POST":
        try:
            form = PostCreateForm(request.POST, request.FILES, instance=post)
            if form.is_valid():
                post_form = form.save(commit = False)
                post_form.user = user
                post_form.save()
            messages.success(request, "Your post has been successfully updated.")
            return HttpResponseRedirect(reverse('blog:post_list'))
        except Exception as e:
            messages.warning(request, "There was a problem.")
            return render(request, 'blog/post_update.html', context)
    else:
        form = PostCreateForm(instance = post)    
    context['form'] = form
    return render(request, 'blog/post_edit.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def post_delete(request, id):
    if request.method == "POST":
        id = id
        Post.objects.filter(id = id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('blog:post_list'))