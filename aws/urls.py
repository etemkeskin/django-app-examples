"""aws URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from main.views import *
from django.conf.urls.static import static #For img 
from django.conf import settings #For img
# For password reset email template to render html tags
from django.contrib.auth import views as auth_views

# handler404 = 'main.views.error_404_view'
from dashreporting.views import *
from django.urls import re_path

urlpatterns = [
    # For password reset email template to render html tags
    # path('accounts/password_reset/', auth_views.PasswordResetView.as_view(
    #     html_email_template_name='registration/password_reset_email.html'
    # )),

    path('accounts/', include('django.contrib.auth.urls')),

    path('admin/', admin.site.urls),

    path('', include('main.urls')),

    path('todo/', include('todo.urls')),
    path('quiz/', include('quiz.urls')),
    path('blog/', include('blog.urls')),
    path('shop/', include('shop.urls')),

    path('dash/', include('dashreporting.urls')),
    path('calendar/', include('calendar_app.urls')),

    path('login/', user_login, name="login"),
    path('logout/', user_logout, name="logout"),
    path('signup/', signup, name="signup"),
    # path('signup-done/', signup_done, name="signup_done"),
    path('change-password/', change_password, name="change-password"),

    path('ckeditor/', include('ckeditor_uploader.urls')), #for ckeditor

    # Django Dash Plotly 
    path('django_plotly_dash/', include('django_plotly_dash.urls')),
    

] + static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT) #For img
