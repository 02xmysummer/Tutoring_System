from django.urls import path, include
# from mysystem.views.index import index
urlpatterns = [
    # path("", index, name="index"),
    path("user/",include("system.urls.user.index")),    
    path("teacher/",include("system.urls.teacher.index")),    
    path("log/",include("system.urls.log.index")),    

]
