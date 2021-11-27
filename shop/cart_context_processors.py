#We define variables that can be used within all templates

from shop.models import ShopCart
from django.contrib.auth.models import User 

def cart_count(request):
    current_user = request.user
    count = ShopCart.objects.filter(user_id = current_user.id).count()

    return {"cart_count" : count}