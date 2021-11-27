from django.utils import timezone
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags

#=================== EMAIL SERVICES ===================
def base_email(to, subject, info):
    try:
        context = {}
        subject = subject
        html_message = render_to_string('mail/mail_base.html', {'info': info})
        plain_message = strip_tags(html_message)
        from_email = 'Djangorocket <info@djangorocket.com>'
        to = to
        send_mail(subject, plain_message, from_email, [to], html_message=html_message, fail_silently=False)
    except Exception as e:
        print(e)

def register_email(to):
    try:
        to = to
        subject = 'Sign up message'
        html_message = render_to_string('mail/register_email.html')
        plain_message = strip_tags(html_message)
        from_email = 'Djangorocket <info@djangorocket.com>'
        send_mail(subject, plain_message, from_email, [to], html_message=html_message, fail_silently=False)
    except Exception as e:
        print(e)

def send_email_admin(subject, info):
    try:
        context = {}
        to = "etemkeskin@yahoo.com"
        subject = subject
        plain_message = info
        from_email = 'Djangorocket <info@djangorocket.com>'
        send_mail(subject, plain_message, from_email, [to], fail_silently=False)
    except Exception as e:
        print(e)

def send_email_to(to, subject, info):
    try:
        context = {}
        to = to
        subject = subject
        html_message = render_to_string('mail/mail_base.html', {'info': info})
        plain_message = strip_tags(html_message)
        from_email = 'Djangorocket <info@djangorocket.com>'
        send_mail(subject, plain_message, from_email, [to], html_message=html_message, fail_silently=False)
    except Exception as e:
        print(e)