from django.db import models
from django.contrib.auth.models import User

class Event(models.Model):
    title = models.CharField(max_length = 200)
    user = models.ForeignKey(User, on_delete=models.CASCADE,  null=True, blank = True)
    color = models.CharField(max_length = 200, default = "blue")

    def __str__(self):
        return self.title

class Schedule(models.Model):
    event = models.ForeignKey(Event, on_delete = models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name  = "schedules")
    start_date = models.DateTimeField(null=True, blank = True)
    end_date = models.DateTimeField(null=True, blank = True)
    all_day = models.CharField(max_length = 20, null=True, blank = True)
    url = models.CharField(max_length = 300, null=True, blank = True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # def __str__(self):
    #     return self.title
