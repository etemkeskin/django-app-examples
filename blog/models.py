from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from django.utils.text import slugify
from django.db.models.signals import pre_save
import random
from ckeditor_uploader.fields import RichTextUploadingField #CKEditor

STATUS_CHOICES = ( 
   ('draft', 'Draft'), 
   ('published', 'Published'), 
) 

class Post(models.Model):
    user = models.ForeignKey(User, on_delete= models.CASCADE )
    title = models.CharField(max_length=250, null=True, blank=True)
    content = RichTextUploadingField(extra_plugins=['codesnippet'],null=True, blank = True) #CKEditor
    image = models.ImageField(upload_to='pictures/%Y/%m/%d/' , max_length=255, null=True, blank=True)
    slug = models.SlugField(unique = True, editable = False, max_length = 150)
    status = models.CharField(max_length = 10, choices = STATUS_CHOICES, default ='draft')
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now= True)

    class Meta: 
        ordering = ('-created_at', )

    def __str__(self): 
        return self.title

    def get_absolute_url(self):
        return reverse('blog:post', kwargs={'slug': self.slug})

# Create unique slug .
def create_slug(instance, new_slug = None):
    slug = slugify(instance.title)     
    if new_slug is not None: 
        slug = new_slug 
    else: 
        slug = slugify(instance.title)

    qs = Post.objects.filter(slug = slug).order_by("-id")
    exists = qs.exists()
    if exists: 
        new_slug = "{slug}-{id}".format( slug = slug, id = qs.first().id)               
        return create_slug(instance, new_slug = new_slug) 
    return slug 

def pre_save_receiver(sender, instance, *args, **kwargs): 
   if not instance.slug: 
       instance.slug = create_slug(instance) 
    
pre_save.connect(pre_save_receiver, sender = Post) 
