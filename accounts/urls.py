from django.urls import path
from . import views

from django.views.generic.base import TemplateView # new

urlpatterns = [
    path('login/', views.index, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('change-pass/', views.change_pass, name='change-pass'),
    #path('signup/', TemplateView.as_view(template_name='signup.html'), name='signup'),
]