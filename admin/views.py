from ast import Add
from tkinter.messagebox import NO
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
from django.contrib.auth.models import Permission
from django.db.models import Q
import json

def index(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            logs = LogEntry.objects.select_related('user').order_by('-action_time')[:10]
            if request.user.has_perm('auth.add_user'):
                per_add = 1
            else:
                per_add = 0
            if request.user.has_perm('auth.change_user'):
                per_change = 1
            else:
                per_change = 0
            return render(request, 'admin.html',{'username':request.user,'logs':logs,'per_add':per_add,'per_change':per_change})
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
def user(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            if request.user.has_perm('auth.view_user'):
                Users = User.objects.all()
                if request.user.has_perm('auth.add_user'):
                    per_add = 1
                else:
                    per_add = 0
                if request.user.has_perm('auth.change_user'):
                    per_change = 1
                else:
                    per_change = 0                
                if request.user.has_perm('auth.delete_user'):
                    per_delete = 1
                else:
                    per_delete = 0
                return render(request, 'user.html',{'username':request.user,'Users':Users,'per_add':per_add,'per_change':per_change,'per_delete':per_delete})
            else:
                redirect('admin')
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def create_user(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            if request.user.has_perm('auth.add_user'):
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
                return redirect('admin')
        else:
            return redirect('%s?next=%s' % (settings.HOME_URL, request.path))
def edit_user(request,id):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    else:
        if request.user.is_staff:
            if request.user.has_perm('auth.change_user'):
                if request.method == "POST":
                    firstname = request.POST['firstname']
                    lastname = request.POST['lastname']
                    email = request.POST['email']    
                    checkboxs_str = request.POST.getlist('checkbox[]')
                    checkboxs_per = request.POST.getlist('checkper[]')
                    u = User.objects.get(id=id)
                    u.first_name = firstname
                    u.last_name = lastname
                    u.email = email        
                    u.is_staff = False
                    u.is_active = False
                    u.is_superuser = False
                    if checkboxs_per:
                        for checker in checkboxs_per:
                            if not checker.isspace():
                                if checker == '1':
                                    u.is_staff = True
                                if checker == '2':
                                    u.is_active = True
                                if checker == '3':
                                    u.is_superuser = True
                    u.save()
                    log = LogEntry.objects.log_action(
                                user_id=request.user.id,
                                object_id=u.id,
                                change_message='Edit user',
                                content_type_id=ContentType.objects.get_for_model(User).pk,
                                action_flag=CHANGE,
                                object_repr=u.username)
                    Pers = Permission.objects.all().filter(user=u.id)
                    for per in Pers:
                        permission = Permission.objects.get(id=per.id)
                        u.user_permissions.remove(permission)
                    if checkboxs_str:
                        for checkbox in checkboxs_str:
                            if not checkbox.isspace():
                                permission = Permission.objects.get(id=checkbox)
                                u.user_permissions.add(permission)
                        return redirect('user')
                    else:
                        return redirect('user')
                else:
                    try:
                        user = User.objects.get(id=id)
                    except  User.DoesNotExist:
                        return redirect('%s?next=%s' % (settings.ADMIN_URL, request.path))
                    else:
                        Per_all = Permission.objects.all().filter(Q(user=None) | Q(user=id)).values('id','name','user')
                        return render(request, 'edit_user.html',{'username':request.user,'user_e':user,'pers':Per_all})
            else:
                return redirect('admin')
        else:
            return redirect('%s?next=%s' % (settings.ADMIN_URL, request.path))
def create_group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))

def edit_group(request):
    return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
def change_pass(request):
    uname = request.user.username
    message = ''
    class_css = ''
    if request.method == 'POST':
        old_password = request.POST.get('old_password')
        new_password = request.POST.get('new_password')
        retype_new_password = request.POST.get('re_password')
        user = authenticate(username=uname, password=old_password)
        if user is not None:
            if new_password == retype_new_password and new_password != '':
                u = User.objects.get(username=uname)
                u.set_password(new_password)
                u.save()
                login(request,u)
                message = 'Successfully Changed the Password.'
                class_css = 'text-success'
            else:
                message = 'Invalid Passwords!'
                class_css = 'text-danger'
        else:
            message = 'Invalid Password!'
            class_css = 'text-danger'
    return render(request, 'change.html',{'username':request.user,'message':message,'class_css':class_css})
    
def delete_user(request):
    if request.method == 'POST' and request.user.is_authenticated:
        id = request.POST.get('id')
        if request.user.has_perm('auth.delete_user'):
            u = User.objects.get(id=id)
            u.delete()
            log = LogEntry.objects.log_action(
                            user_id=request.user.id,
                            object_id=u.id,
                            change_message='Delete user',
                            content_type_id=ContentType.objects.get_for_model(User).pk,
                            action_flag=DELETION,
                            object_repr=u.username)
    return redirect('user')
