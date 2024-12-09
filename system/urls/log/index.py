from django.urls import path
from system.views.log.loginlog import LoginLogView

urlpatterns = [
    path("loginlog/", LoginLogView.as_view(), name="loginlog"),
]
