from django.urls import path, include
# from mysystem.views.index import index
from system.utils.Authentication import MyTokenObtainPairView
from rest_framework_simplejwt.views import TokenRefreshView, TokenVerifyView

urlpatterns = [
    # path("", index, name="index"),
    path('token/', MyTokenObtainPairView.as_view(), name="token"),
    path("token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("user/",include("system.urls.user.index")),    
    path("log/",include("system.urls.log.index")),    
]
