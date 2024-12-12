from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
from django.shortcuts import get_object_or_404
from system.models.sys_user import SysUser
from system.models.post import Post
from system.models.classification import Classification
from system.models.tag import Tag
from system.utils.user.permissions import IsAdminOrSelf

class PostInfo(APIView):
    permission_classes = [IsAdminOrSelf]

    def get(self, request):
        user_id = request.data.get('user_id')

        if not user_id:
            return Response({'error': '参数错误'}, status=HTTP_400_BAD_REQUEST)

        try:
            user = get_object_or_404(SysUser, id=int(user_id))
        except SysUser.DoesNotExist:
            return Response({'error': '用户不存在'}, status=HTTP_404_NOT_FOUND)

        posts = Post.objects.filter(user=user)

        res = []
        for post in posts:
            res.append({
                'id':post.id,
                'grade':post.classification.classname, 
                'tag':post.tag.tagname,
                'hprice':post.hprice,
                'weekly_lessons':post.weekly_lessons,
                'lesson_duration':post.lesson_duration,
                'location':post.location,
                'require':post.require
            })
        return Response({'success': 'success'})