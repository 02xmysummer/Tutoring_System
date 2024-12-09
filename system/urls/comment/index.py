from django.urls import path
from system.views.comment.commentlist import CommentList
from system.views.comment.addcomment import AddComment
from system.views.comment.delcomment import DelComment

urlpatterns = [
    path('commentlist', CommentList.as_view(), name="commentlist"),
    path('add', AddComment.as_view(), name="addcomment"),
    path('del', DelComment.as_view(), name="delcomment"),

]
