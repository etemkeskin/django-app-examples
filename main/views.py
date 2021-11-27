from django.shortcuts import render
from django.urls import reverse, reverse_lazy
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
# For change password
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
# For change password end
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from main.models import Profile
from forms.main_profile import MainProfileForm
from forms.main_contact import MainContactForm
import requests
from main.mail_services import send_email_admin


@login_required(login_url = "/login/")
def profile(request):
    context = {}
    user = User.objects.filter( username = request.user).first()
    profile = Profile.objects.filter( user = user).first()
    context['user'] = user
    if request.method == 'POST':    
        try:
            profile_edit_form = MainProfileForm(request.POST, request.FILES, instance=profile)
            context['profile_edit_form'] = profile_edit_form
            if profile_edit_form.is_valid():
                u = profile_edit_form.save()
            user.first_name = request.POST["first_name"]
            user.last_name = request.POST["last_name"]
            user.save()
            context['first_name'] = user.first_name
            context['last_name'] = user.last_name
            messages.success(request, "Your profile updated successfully.")
            return render(request, 'main/profile.html', context)
        except Exception as e:
            messages.warning(request, "There was a problem updating your profile.{0}".format(e))
            return render(request, 'main/profile.html', context)
    else:
        profile_edit_form = MainProfileForm(instance = profile)
        context['first_name'] = user.first_name
        context['last_name'] = user.last_name
        context['profile_edit_form'] = profile_edit_form
        return render(request, 'main/profile.html', context)
    return render(request, 'main/profile.html', context)

def home(request):   
    return render(request, 'main/home.html')

def dashboard(request):
    return render(request, 'main/dashboard.html')

@login_required(login_url = "/login/")
def settings(request):
    return render(request, 'main/settings.html')

def user_login(request):
    context = {}
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        ## reCaptcha implementation
        # captcha = request.POST['g-recaptcha-response']
        # url = "https://www.google.com/recaptcha/api/siteverify"
        # response = requests.post(
        #     url,
        #     data={
        #         "secret": "6Lf2pJAUAAAAABQr5aAZUe_5QI2n7YvIe_r0oK7Q",
        #         "response": captcha
        #     }
        # )
        # response_dict = response.json()
        # if(not response_dict["success"] or (captcha is None)):
        #     messages.warning(request, "Please use the recaptcha service and then press the login button.")
        #     return render(request, "auth/login.html", context)
        ## reCaptcha implementation END!!!! requests i prodda yükle

        # Mail activation completed control
        # if BootcampUser.objects.filter(username = username, is_active = False).first():
        #     messages.warning(request, "Please activate your account by clicking the link on your registered mail.")
        #     return render(request, "auth/login.html", context)
        # Mail activation completed control END!!!

        #Control account whether exist.
        user_exist = User.objects.filter( username = username).first()
        if not user_exist:
            context["error"] = "We could not this account!"

        user = authenticate(request, username = username, password = password)
        if user:
            login(request, user)
            if request.GET.get('next', None): #If logged in, redirect to next page.
                return HttpResponseRedirect(request.GET['next'])
            return HttpResponseRedirect(reverse('main:home')) 
        else:
            context["error"] = "Provide valid credentials !!"
            # messages.warning(request, "The username or password is incorrect.")
            return render(request, "auth/login.html", context)
    else:
        return render(request, "auth/login.html", context)

def user_logout(request):
    logout(request)
    return HttpResponseRedirect(reverse('main:home'))

def signup(request):
    response_data = {}
    if request.method == 'POST':
        username = request.POST["email"]
        email = request.POST["email"]
        password = request.POST["password"]
        password_correction = request.POST["password_correction"]
        terms = request.POST["terms"]        
        # reCaptcha implementation
        captcha = request.POST['g-recaptcha-response']
        url = "https://www.google.com/recaptcha/api/siteverify"
        response = requests.post(
            url,
            data={
                "secret": "6LdocuIZAAAAALACRMthpdGxnsjeHyGnm33Y9276",
                "response": captcha
            }
        )
        response_dict = response.json()
        if(not response_dict["success"] or (captcha is None)):
            messages.warning(request, "Please use the recaptcha service and then press the signup button.")
            return HttpResponseRedirect(reverse('signup'))
        # reCaptcha implementation END!!!! 
        user_exist = User.objects.filter(username = username).first()
        if user_exist:
            messages.warning(request, "A user is already registered to the system.")
            return HttpResponseRedirect(reverse('signup'))

        if not email and not password:
            messages.warning(request, "Email and password required.")
            return HttpResponseRedirect(reverse('signup'))

        if password != password_correction:
            messages.warning(request, "Your passwords do not match.")
            return HttpResponseRedirect(reverse('signup'))

        try:
             # Users will registered as a client.
            # groups_type = "student"  #Roles are used at Groups model.
            # groups = Group.objects.filter(name__exact = groups_type).first()
            
            user = User.objects.create_user(
                password = password, email = email, username = username, is_active = True )

            ##======= EMAIL ACTIVATION =====
            # current_site = get_current_site(request)
            # token = account_activation_token.make_token(user)
            # uid = urlsafe_base64_encode(force_bytes(user.pk))
            # activation_email(email, current_site, token, uid)
            ##======= EMAIL ACTIVATION END=====
            # register_email(email)
            # messages.success(request, "Your account has been successfully created. Please check your email inbox to activate your account.")
            # return HttpResponseRedirect(reverse('signup_done'))
            messages.success(request, "Your account has been successfully created.")
            return HttpResponseRedirect(reverse('login'))
        except Exception as e:
            messages.warning(request, "We're sorry. A problem occurred during creating the account.")
            return HttpResponseRedirect(reverse('signup'))
    return render(request, 'auth/register.html')

@login_required(login_url = "/login/")
def change_password(request):
    context = {}
    if request.method == "POST":
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.success(request, "Password was updated.")
            return HttpResponseRedirect(reverse('website:profile'))
        else:
            messages.warning(request, "Your password has not been updated. Correct errors.")
    else:
        form = PasswordChangeForm(user=request.user)
    context["form"] = form
    return render(request, "auth/change_password.html", context)

def contact(request):
    context = {}
    if request.method == "POST":
        # reCaptcha implementation
        captcha = request.POST['g-recaptcha-response']
        url = "https://www.google.com/recaptcha/api/siteverify"
        response = requests.post(
            url,
            data={
                "secret": "6LdocuIZAAAAALACRMthpdGxnsjeHyGnm33Y9276",
                "response": captcha
            }
        )
        response_dict = response.json()
        if(not response_dict["success"] or (captcha is None)):
            messages.warning(request, "Please use the recaptcha service and then press the send message button.")
            return HttpResponseRedirect(reverse('main:contact'))
        # reCaptcha implementation END!!!! 
        try:
            form = MainContactForm(request.POST)
            if form.is_valid():
                form.save()
                send_email_admin(subject = "djangorocket contact form", info = request.POST['message'])
                messages.success(request, "Your message has been successfully submitted.")                
                return HttpResponseRedirect(reverse('main:home'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return render(request, "main/contact.html", context)
    else:
        form = MainContactForm()    
    context['form'] = form
    return render(request, "main/contact.html", context)

# 404 PAGE 
def handler404(request, exception=None):
    return render(request, 'auth/404.html')
