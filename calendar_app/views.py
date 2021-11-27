from django.shortcuts import render
from calendar_app.models import Event, Schedule
from django.urls import reverse
from django.http import HttpResponseRedirect, JsonResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required

@login_required(login_url = "/login/")
def calendar(request):
    context = {}
    events = Event.objects.filter(user =  request.user)
    schedules = []
    schedules_obj = Schedule.objects.filter(user =  request.user)
    if schedules_obj :
        for i in schedules_obj:
            schedules.append({  'id' : i.id,
                                'title' : i.event.title,
                                'start' : i.start_date.strftime("%Y-%m-%d %H:%M:%S"),
                                'end' : i.end_date.strftime("%Y-%m-%d %H:%M:%S"),
                                'backgroundColor' : i.event.color,
                                'borderColor' : i.event.color,
                                'allDay' : i.all_day if i.all_day != None else '',
                                'url' : i.url if i.all_day != None else '',
                                'extendedProps':{'db_ID':i.id}
                                })
    else:
        schedules.append({      'id' : '',
                                'title' : '',
                                'start' : '',
                                'end' : '',
                                'backgroundColor' : '',
                                'borderColor' : '',
                                'allDay' : '',
                                'url' : '',
                                'extendedProps':{'db_ID':''}
                                })
    context['schedules'] =  schedules
    context['events'] =  events
    return render(request, 'calendar_app/calendar.html', context)

#Ajax Request Function
@login_required(login_url = "/login/")
def schedule_delete(request):
    data = {}
    if request.method == "POST":
        id = request.POST['id']
        try:
            Schedule.objects.filter(id=id).delete()
            data = {
                'action': 'success'
            }
        except Exception:
            data['error_message'] = 'error'
            return JsonResponse(data)
        return JsonResponse(data)
        
@login_required(login_url = "/login/")
def event_create(request):
    data = {}
    if request.method == "POST":
        title = request.POST['title']
        color = request.POST['color']
        print(title)
        try:
            Event.objects.create(user =  request.user, title = title, color = color)
            data = {
                'action': 'success'
            }
        except Exception:
            data['error_message'] = 'error'
            return JsonResponse(data)
        return JsonResponse(data)

from datetime import datetime
from django.utils.timezone import get_current_timezone, make_aware
import pytz

@login_required(login_url = "/login/")
def schedule_create(request):
    data = {}
    print(get_current_timezone())
    if request.method == "POST":
        title = request.POST['title']        
        start = request.POST['start']
        end = request.POST['end']
        all_day = request.POST['all_day']
        start = datetime.strptime(start, '%Y-%m-%d %H:%M:%S')
        start = make_aware(start) #to add timezone
        all_day = all_day if all_day == "true" else ''
        try:
            event = Event.objects.filter(title = title).first()
            schedule = Schedule.objects.create(user = request.user, event = event, start_date = start, end_date = start, all_day = all_day, url= "")
            data = {
                'action': 'success',
                'schedule_id': schedule.id
            }
        except Exception as e:
            print(e)
            data['error_message'] = 'error'
            return JsonResponse(data)
        return JsonResponse(data)


