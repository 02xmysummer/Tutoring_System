from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
from system.models.sys_user import SysUser
from system.models.teacher import Teacher
from system.models.comment import Comment
from django.shortcuts import get_object_or_404
from system.utils.user.permissions import IsAdminOrSelf  

class DelComment(APIView):
    permission_classes = ([IsAdminOrSelf])
    def delete(self, request):
        comment_id = int(request.data.get('comment_id','0'))

        Comment.objects.filter(id=comment_id).delete()
        return Response({'status': '评论删除成功'})