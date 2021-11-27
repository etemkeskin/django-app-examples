from django.db import models
from django.contrib.auth.models import User

class Todo(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE )
    description = models.CharField(max_length=250, null=True, blank=True)
    status = models.BooleanField(null=True, blank = True, default = False)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now= True)

    def __str__(self): 
        return self.description 
    
