from django.urls import path
from main.views import *

handler404 = 'main.views.handler404'

# Define app name to call
app_name = "main"

urlpatterns = [
    path('', home, name="home"),
    path('home/', home, name="home"),
    path('dashboard/', dashboard, name="dashboard"),
    path('settings/', settings, name="settings"),
    path('profile/', profile, name="profile"),
    path('contact/', contact, name="contact"),
]