from django.urls import path
from . import views

from django.views.generic.base import TemplateView # new

urlpatterns = [
    path('', views.index, name='admin'),
    path('group/', views.group, name='group'),
    path('user/', views.user, name='user'),
    path('create-user/', views.create_user, name='create_user'),
    path('edit-user/', views.edit_user, name='edit_user'),
    path('create-group/', views.create_group, name='create_group'),
    path('edit-group/', views.edit_group, name='edit_group'),
    path('change/', views.change_pass, name='change'),
]