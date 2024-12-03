from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import timezone
import dateutil.parser
from system.models.abs_user import AbsUser
from system.models.sys_user import SysUser
# GENDERS = ['男','女']
# ROLES = ['管理员','普通用户']
class UserList(APIView):

    def get(self,request):
        sysusers = SysUser.objects.all()
        res = []
        for sysuser in sysusers:
            iso_time_str = str(sysuser.absuser.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)

            res.append({
                'id':sysuser.absuser.id,
                'username':sysuser.absuser.username,
                'nickname':sysuser.nickname,
                'role':'普通用户',
                # 'gender':GENDERS[sysuser.absuser.gender],
                'status': '正常' if not sysuser.absuser.is_active else '封禁',
                'email':sysuser.email,
                'phonenumber':sysuser.absuser.phonenumber,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                # 'count':total
            })
        return Response(res)