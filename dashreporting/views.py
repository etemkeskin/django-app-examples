from django.shortcuts import render

def dash_demo_one(request):
    return render(request, 'dashreporting/dash1.html')

# def dash_demo_two(request):
#     return render(request, 'dashreporting/dash2.html')

def dash_demo_three(request):
    return render(request, 'dashreporting/dash3.html')

def dash_demo_four(request):
    return render(request, 'dashreporting/dash4.html')