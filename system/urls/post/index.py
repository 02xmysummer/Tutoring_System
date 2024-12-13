from django.urls import path
from system.views.post.postlist import PostList
from system.views.post.addpost import AddPost
from system.views.post.applypost import ApplyPost
from system.views.post.postinfo import PostInfo
from system.views.post.delpost import DelPost


urlpatterns = [
    path('postlist/', PostList.as_view(), name="sysytem_postlist"),
    path('addpost/', AddPost.as_view(), name="sysytem_addpost"),
    path('applypost/', ApplyPost.as_view(), name="sysytem_applypost"),
    path('postinfo/', PostInfo.as_view(), name="sysytem_postinfo"),
    path('delpost/', DelPost.as_view(), name="sysytem_delpost"),

]
