from django.urls import path
from system.utils.user.Authentication import MyTokenObtainPairView
from rest_framework_simplejwt.views import TokenRefreshView, TokenVerifyView
from system.views.user.userlist import UserList
from system.views.user.register import Register
from system.views.user.userinfo import UserInfo
from system.views.user.search import Search



urlpatterns = [
    path('token/', MyTokenObtainPairView.as_view(), name="token"),
    path("token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("userlist/",UserList.as_view(),name="user_userList"),
    path("register/",Register.as_view(),name="user_register"),
    path("userinfo/",UserInfo.as_view(),name="user_userinfo"),
    path("search/",Search.as_view(),name="user_search"),

]
