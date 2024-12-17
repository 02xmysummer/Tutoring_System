from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.post import Post
from system.models.sys_user import SysUser

class PostList(APIView):

    def get(self,request):
        user_id = request.GET.get('user_id')
        min_hprice = request.GET.get('min_hprice')
        max_hprice = request.GET.get('max_hprice')
        posts = Post.objects.filter(teacher__isnull=True)
        if user_id is not None:
            user = SysUser.objects.get(id=int(user_id))
            posts = posts.filter(user=user)
        if min_hprice is not None and max_hprice is not None:
            posts = posts.filter(hprice__range=(int(min_hprice), int(max_hprice)))
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


