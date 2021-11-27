from django.db import models
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.db.models.signals import post_save # Produce a signal if there is any database action.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete= models.CASCADE )
    occupation = models.CharField(max_length=150, null=True, blank=True)
    phone = models.CharField(max_length=30, null=True, blank=True)
    address = models.CharField(max_length=250, null=True, blank=True)
    city = models.CharField(max_length=150, null=True, blank=True)
    country = models.CharField(max_length=150, null=True, blank=True)
    image = models.ImageField(upload_to='pictures/%Y/%m/%d/' , max_length=255, null=True, blank=True)

    def __str__(self):
        return "{0}".format(self.user.email)

# When any User instance created, Profile object instance is created automatically linked by User 
@receiver(post_save, sender = User)
def user_is_created(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user= instance)
    else:
        instance.profile.save()

# class Setting(models.model):
#     facebook = models.CharField(max_length=150, null=True, blank=True, default ="facebook")
#     email = models.CharField(max_length=150, null=True, blank=True, default = "trial @ trial.com")
#     recaptcha = models.CharField(max_length=150, null=True, blank=True, default = "recaptcha")
#     google_analytics = models.CharField(max_length=150, null=True, blank=True, default = "analytics" )

class Contact(models.Model):
    email = models.CharField(max_length=150)
    subject = models.CharField(max_length=250, null=True, blank=True)
    message = models.CharField(max_length=1000, null=True, blank=True) 