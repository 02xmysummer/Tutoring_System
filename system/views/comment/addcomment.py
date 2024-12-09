from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
from system.models.sys_user import SysUser
from system.models.teacher import Teacher
from system.models.comment import Comment
from django.shortcuts import get_object_or_404
from system.utils.user.permissions import IsAdminOrSelf  

class AddComment(APIView):
    # permission_classes = ([IsAdminOrSelf])
    def post(self, request):
        # 从 GET 请求中获取参数（通常应使用 POST 请求的 body）
        user_id = request.data.get('user_id')
        teacher_id = request.data.get('teacher_id')
        comment = request.data.get('comment')

        # 检查所有必需参数是否存在
        if not (user_id and teacher_id and comment):
            return Response({'error': '参数错误'}, status=HTTP_400_BAD_REQUEST)

        try:
            # 尝试获取用户对象，如果不存在则抛出 404 错误
            get_object_or_404(SysUser, id=user_id)
            get_object_or_404(Teacher, id=teacher_id)
        except SysUser.DoesNotExist:
            return Response({'error': '用户不存在'}, status=HTTP_404_NOT_FOUND)
        except Teacher.DoesNotExist:
            return Response({'error': '教师不存在'}, status=HTTP_404_NOT_FOUND)

        # 创建评论对象
        Comment.objects.create(user_id=user_id, teacher_id=teacher_id, comment=comment)
        return Response({'status': '评论添加成功'})