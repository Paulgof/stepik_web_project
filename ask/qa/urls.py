from django.urls import path

from .views import test

urlpatterns = [
    path(r'', test, name='home'),
    path(r'^login/', test, name='login'),
    path(r'^signup/', test, name='signup'),
    path(r'^question/.+/', test, name='question'),
    path(r'^ask/', test, name='ask'),
    path(r'^popular/', test, name='popular'),
    path(r'^new/', test, name='new')
]
