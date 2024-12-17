from django.urls import path
from system.utils.teacher.Authentication import MyTokenObtainPairView
from rest_framework_simplejwt.views import TokenRefreshView, TokenVerifyView
from system.views.teacher.teacherlist import TeacherList
from system.views.teacher.register import Register
from system.views.teacher.teacherinfo import TeacherInfo
from system.views.teacher.search import Search
from system.views.teacher.fuzzysearch import FuzzySearch




urlpatterns = [
    path('token/', MyTokenObtainPairView.as_view(), name="token"),
    path("token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("teacherlist/",TeacherList.as_view(),name="teacher_teacherlist"),
    path("register/",Register.as_view(),name="teacher_register"),
    path("teacherinfo/",TeacherInfo.as_view(),name="teacher_teacherinfo"),
    path("search/",Search.as_view(),name="user_search"),
    path("fuzzysearch/",FuzzySearch.as_view(),name="user_fuzzysearch"),

]
