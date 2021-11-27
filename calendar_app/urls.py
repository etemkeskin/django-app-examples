from django.urls import path
from calendar_app.views import *

# Define app name to call
app_name = "calendar_app"

urlpatterns = [
    path('calendar/', calendar, name="calendar"),
    #=============== CALENDAR AJAX REQUEST =====================
    path('schedule-create/', schedule_create, name="schedule_create"),
    path('schedule-delete/', schedule_delete, name="schedule_delete"),
    path('event-create/', event_create, name="event_create"),
]