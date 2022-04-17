from email import message
from django.http import HttpResponseRedirect,HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.conf import settings
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.models import User
import json

def index(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect(settings.HOME)
        else:  
            return render(request, 'login.html',{'message':"You have entered an invalid username or password!"})
    else:
        if request.user.is_authenticated:
            return redirect(settings.HOME_URL)
        else:
            next=request.GET.get('next')
            if next == '/admin/':
                settings.HOME = settings.ADMIN_URL
            else:
                settings.HOME = settings.HOME_URL
            return render(request, 'login.html',{})
def logout_view(request):
    logout(request)
    return render(request, 'login.html',{})
def change_pass(request):
    uname = request.user.username
    message = {}
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        retype_new_password = request.POST.get('re_new_password')
        user = authenticate(username=uname, password=old_password)
        if user is not None:
            if new_password == retype_new_password and new_password != '':
                u = User.objects.get(username=uname)
                u.set_password(new_password)
                u.save()
                login(request,u)
                message = 'Successfully Changed the Password.'
            else:
                message = 'Invalid Passwords!'
        else:
            message = 'Invalid Password!'
    return HttpResponse(json.dumps(message), content_type='application/json')