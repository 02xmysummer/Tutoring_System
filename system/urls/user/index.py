from django.urls import path

from system.views.user.userlist import UserList
from system.views.user.register import Register
from system.views.user.userinfo import UserInfo


urlpatterns = [
    path("userlist/",UserList.as_view(),name="user_userList"),
    path("register/",Register.as_view(),name="user_register"),
    path("userinfo/",UserInfo.as_view(),name="user_userinfo"),
]
