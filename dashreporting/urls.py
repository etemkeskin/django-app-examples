from django.urls import path
from dashreporting.views import *
from dashreporting.dash_apps import app1,  app3, app4  # should include dash apps, django-dash-plotly app2,

app_name = "dashreporting"

urlpatterns=[
     path('app1/', dash_demo_one, name = "dash_demo_one"),
     # path('app2/', dash_demo_two, name = "dash_demo_two"),
     path('app3/', dash_demo_three, name = "dash_demo_three"),
     path('app4/', dash_demo_four, name = "dash_demo_four"),
]

