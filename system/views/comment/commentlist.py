from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.sys_user import SysUser
from system.models.teacher import Teacher
from system.models.comment import Comment
from datetime import timezone
import dateutil.parser
class CommentList(APIView):

    def get(self,request):
        #教师id
        index = int(request.GET.get('index',1))
        comments = Comment.objects.all()[(index-1)*10:index*10]
        count = Comment.objects.count()
        res = []
        for comment in comments:
            iso_time_str = str(comment.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)
            user = SysUser.objects.get(id=comment.user_id)
            teacher = Teacher.objects.get(id=comment.teacher_id)
            c = {
                'id':comment.id,
                'username':user.username,
                'teachername':teacher.nickname,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                'comment':comment.comment,
                'count':count
            }
            res.append(c)
        return Response(res)
