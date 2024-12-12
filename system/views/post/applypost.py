from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
from django.shortcuts import get_object_or_404
from system.models.teacher import Teacher
from system.models.post import Post
from system.utils.user.permissions import IsAdminOrSelf

class ApplyPost(APIView):
    permission_classes = [IsAdminOrSelf]

    def post(self, request):
        user_id = request.data.get('user_id')
        post_id = request.data.get('post_id')

        if not user_id:
            return Response({'error': '参数错误'}, status=HTTP_400_BAD_REQUEST)

        #检查teacher是否符合要求
        try:
            teacher = get_object_or_404(Teacher, id=int(user_id))
            post = get_object_or_404(Post, id=post_id)
        except Teacher.DoesNotExist:
            return Response({'error': 'Teacher不存在'}, status=HTTP_404_NOT_FOUND)
        except Post.DoesNotExist:
            return Response({'error': 'Post不存在'}, status=HTTP_404_NOT_FOUND)

        if post.teacher is None:
            return Response({'error': '该帖子已经被获取'})
        post.teacher = teacher
        post.save()  # 保存更改
        return Response({'success': 'success'})