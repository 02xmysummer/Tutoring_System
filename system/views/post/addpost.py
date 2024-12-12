from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND
from django.shortcuts import get_object_or_404
from system.models.sys_user import SysUser
from system.models.post import Post
from system.models.classification import Classification
from system.models.tag import Tag
from system.utils.user.permissions import IsAdminOrSelf

class AddPost(APIView):
    permission_classes = [IsAdminOrSelf]

    def post(self, request):
        user_id = request.data.get('user_id')
        classname = request.data.get('classname')
        tagname = request.data.get('tagname')
        hprice = request.data.get('hprice')
        weekly_lessons = request.data.get('weekly_lessons')
        lesson_duration = request.data.get('lesson_duration')
        location = request.data.get('location')
        require = request.data.get('require', '')

        if not (user_id and classname and tagname and hprice and weekly_lessons and lesson_duration and location):
            return Response({'error': '参数错误'}, status=HTTP_400_BAD_REQUEST)

        try:
            user = get_object_or_404(SysUser, id=int(user_id))
            classification = get_object_or_404(Classification, classname=classname)
            tag = get_object_or_404(Tag, tagname=tagname)
        except SysUser.DoesNotExist:
            return Response({'error': '用户不存在'}, status=HTTP_404_NOT_FOUND)
        except Classification.DoesNotExist:
            return Response({'error': 'Classification不存在'}, status=HTTP_404_NOT_FOUND)
        except Tag.DoesNotExist:
            return Response({'error': 'Tag'}, status=HTTP_404_NOT_FOUND)

        post = Post.objects.filter(user=user,
            grade=classification, 
            tag=tag,
            hprice=int(hprice),
            weekly_lessons=int(weekly_lessons),
            lesson_duration=int(lesson_duration),
            location=location,
            )
        if post.exists():
            return Response({
                'result': "post已经存在"
            })

        Post.objects.create(
            user=user,
            grade=classification, 
            tag=tag,
            hprice=int(hprice),
            weekly_lessons=int(weekly_lessons),
            lesson_duration=int(lesson_duration),
            location=location,
            require=require
        )
        return Response({'success': 'success'})