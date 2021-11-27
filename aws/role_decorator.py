from django.http import HttpResponseRedirect
from django.core.exceptions import PermissionDenied
from django.urls import reverse
from django.contrib.auth.models import User, Group

def role_required(allowed_roles=[]):
    def decorator(view_func):
        def wrap(request, *args, **kwargs):            
            for user_role in request.user.groups.all():
                for role in allowed_roles:
                    if user_role.name == role:
                        return view_func(request, *args, **kwargs)
            return HttpResponseRedirect(reverse('main:home'))
        return wrap
    return decorator
