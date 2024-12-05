from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import timezone
import dateutil.parser
from system.models.sys_user import SysUser
# GENDERS = ['男','女']
ROLES = ['管理员','普通用户','演示账号']
class UserList(APIView):

    def get(self,request):
        index = int(request.GET.get('index',1))
        sysusers = SysUser.objects.all()[(index-1)*10:index*10]
        count = SysUser.objects.count()
        res = []
        for sysuser in sysusers:
            iso_time_str = str(sysuser.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)

            res.append({
                'id':sysuser.id,
                'username':sysuser.username,
                'nickname':sysuser.nickname,
                'role':ROLES[sysuser.role],
                'status': '正常' if not sysuser.status else '封禁',
                'email':sysuser.email,
                'phonenumber':sysuser.phonenumber,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                'count':count
            })
        return Response(res)