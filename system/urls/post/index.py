from django.urls import path
from system.views.post.postlist import PostList
from system.views.post.addpost import AddPost
from system.views.post.applypost import ApplyPost


urlpatterns = [
    path('postlist/', PostList.as_view(), name="sysytem_postlist"),
    path('addpost/', AddPost.as_view(), name="sysytem_addpost"),
    path('applypost/', ApplyPost.as_view(), name="sysytem_applypost"),
]
