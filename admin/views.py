from ast import Add
from django.shortcuts import render
from django.http import HttpResponseRedirect,HttpResponse
from django.urls import reverse
from django.views import generic
from django.conf import settings
from django.shortcuts import redirect
from django.contrib.auth import authenticate, login,logout
from django.contrib.admin.models import LogEntry, ADDITION, CHANGE, DELETION
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
import json

def index(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            logs = LogEntry.objects.exclude(change_message="No fields changed.").order_by('-action_time')[:20]
            logCount = LogEntry.objects.exclude(change_message="No fields changed.").order_by('-action_time')[:20].count()
            return render(request, 'admin.html',{'username':request.user,'logs':logs,'logCount':logCount})
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
def user(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            Users = User.objects.all()
            return render(request, 'user.html',{'username':request.user,'Users':Users})
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def create_user(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            if request.method == "POST":
                name = request.POST['username']
                email = request.POST['email']
                password = request.POST['password']
                try:
                    u = User.objects.get(username=name)
                except User.DoesNotExist:
                    user = User.objects.create_user(name, email, password)
                    user.save()
                    log = LogEntry.objects.log_action(
                            user_id=request.user.id,
                            object_id=user.id,
                            change_message='Add user',
                            content_type_id=ContentType.objects.get_for_model(User).pk,
                            action_flag=ADDITION,
                            object_repr=user.username)
                    return render(request, 'create_user.html',{'username':request.user,'message':"User created!",'class':'text-success'})
                else:
                    return render(request, 'create_user.html',{'username':request.user,'message':"User already exists!",'class':'text-danger'})
            else:
                return render(request, 'create_user.html',{'username':request.user})
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def edit_user(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            if request.method == "POST":
                return render(request, 'edit_user.html',{'username':request.user,'logs':logs,'logCount':logCount})
            else:
                logs = LogEntry.objects.exclude(change_message="No fields changed.").order_by('-action_time')[:20]
                logCount = LogEntry.objects.exclude(change_message="No fields changed.").order_by('-action_time')[:20].count()
                return render(request, 'edit_user.html',{'username':request.user,'logs':logs,'logCount':logCount})
        else:
            return redirect('%s?next=%s' % (settings.ADMIN_URL, request.path))
def create_group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))

def edit_group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
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
    return render(request, 'change.html',{'username':request.user,'message':message})
