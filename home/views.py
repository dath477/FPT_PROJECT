from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.conf import settings
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.urls import resolve

def index(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        return render(request, 'index.html',{'url_name':resolve(request.path_info).url_name})
def profile(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.method == "GET":
            return render(request, 'profile.html',{'firstname':request.user.first_name,'lastname':request.user.last_name,'email':request.user.email})
        else:
            firstname = request.POST['firstname']
            lastname = request.POST['lastname']
            email = request.POST['email']
            u = User.objects.get(username=request.user.username)
            u.first_name = firstname
            u.last_name = lastname
            u.email = email
            u.save()
            return redirect('home')
def about(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        return render(request, 'about.html',{'url_name':resolve(request.path_info).url_name})
        