from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.post import Post

class PostList(APIView):

    def get(self,request):
        posts = Post.objects.filter(teacher__isnull=True)
        res = []
        for post in posts:
            res.append({
                'id':post.id,
                'username':post.user.username,
                'nickname':post.user.nickname,
                'grade':post.grade.classname,
                'subject':post.tag.tagname,
                'hprice':post.hprice,
                'weekly_lessons':post.weekly_lessons,
                'lesson_duration':post.lesson_duration,
                'location':post.location,
                'require':post.require
            })
        return Response(res)


