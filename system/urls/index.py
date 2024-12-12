from django.urls import path, include
from system.views.index import index
urlpatterns = [
    path("", index, name="index"),
    path("user/",include("system.urls.user.index")),    
    path("teacher/",include("system.urls.teacher.index")),    
    path("log/",include("system.urls.log.index")),    
    path("comment/",include("system.urls.comment.index")),    
    path("overview/",include("system.urls.overview.index")),    
    path("classification/",include("system.urls.classification.index")),    
    path("tag/",include("system.urls.tag.index")), 
    path("post/",include("system.urls.post.index")), 
    path("tool/",include("system.urls.tool.index")), 
]
