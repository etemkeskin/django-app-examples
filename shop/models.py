from django.db import models
from django.shortcuts import reverse
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.db.models.signals import pre_save
from django_countries.fields import CountryField

class Category(models.Model):
    title = models.CharField(max_length=250)
    parent = models.ForeignKey("Category", on_delete = models.SET_NULL, null=True, blank = True, related_name='children')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
            return self.title

LABEL_CHOICES = (
    ('new', 'new'),
    ('free_shipping', 'free_shipping')
)

class Product(models.Model):
    title = models.CharField(max_length = 100)
    code = models.CharField(max_length = 100)
    short_description = models.TextField(null=True, blank=True)
    description = models.TextField()    
    image = models.ImageField(upload_to='pictures/%Y/%m/%d/' , max_length=255, null=True, blank=True)
    price = models.FloatField()
    discount_price = models.FloatField(blank = True, null = True )
    category = models.ForeignKey(Category, on_delete = models.CASCADE, null=True, blank=True)
    label = models.CharField(choices = LABEL_CHOICES, max_length=20)
    stock = models.IntegerField(default=1, null=True, blank=True)
    slug = models.SlugField(unique = True, editable = False, max_length = 250)
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now= True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("shop:product", kwargs={'slug':self.slug})

    def get_add_to_cart_url(self):
        return reverse("shop:add-to-cart", kwargs={'slug':self.slug})

    def get_remove_from_cart_url(self):
        return reverse("shop:remove-from-cart", kwargs={'slug':self.slug})

class Order(models.Model):
    user = models.ForeignKey(User, on_delete = models.CASCADE, blank = True, null = True)
    first_name = models.CharField(max_length = 50)
    last_name= models.CharField(max_length = 50)
    company = models.CharField(max_length = 150, blank = True, null = True)
    address = models.CharField(max_length = 150)
    city = models.CharField(max_length = 70, blank = True, null = True)
    country = CountryField(blank_label='(select country)')
    phone = models.CharField(max_length = 50)
    total = models.FloatField()
    ordered = models.BooleanField(default = False)
    note = models.TextField(null = True, default="")
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return self.user.email

class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, blank = True, null = True)
    quantity = models.IntegerField(default=1)
    price = models.FloatField()
    total = models.FloatField()
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now= True)

class ShopCart(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    quantity = models.IntegerField(default = 1)

    def __str__(self):
        return self.product

    @property
    def amount(self):
        return (self.quantity*self.product.price)

class ProductGallery(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='pictures/%Y/%m/%d/' , max_length=255)

    def __str__(self):
        return self.product.title

# Create unique slug .
def create_slug(instance, new_slug = None):
    slug = slugify(instance.title)     
    if new_slug is not None: 
        slug = new_slug 
    else: 
        slug = slugify(instance.title)

    qs = Product.objects.filter(slug = slug).order_by("-id")
    exists = qs.exists()
    if exists: 
        new_slug = "{slug}-{id}".format( slug = slug, id = qs.first().id)               
        return create_slug(instance, new_slug = new_slug) 
    return slug 

def pre_save_receiver(sender, instance, *args, **kwargs): 
   if not instance.slug: 
       instance.slug = create_slug(instance) 
    
pre_save.connect(pre_save_receiver, sender = Product) 

