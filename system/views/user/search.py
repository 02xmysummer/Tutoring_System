from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
from system.models.sys_user import SysUser
# from system.models.sys_user import SysUser
from datetime import timezone
import dateutil.parser
ROLES = ['管理员','普通用户','演示账号']

class Search(APIView):

    def get(self, request):
        # 获取查询参数中的 'data'，它应该包含我们要搜索的用户名子字符串
        data = request.GET.get('data')
        index = int(request.GET.get('index','1'))
        if not data:
            # 如果没有提供 'data'，则返回错误响应
            return Response({'error': '搜索数据为空'}, status=400)
        
        # 使用 __icontains 进行大小写不敏感的 LIKE 查询
        users = SysUser.objects.filter(username__icontains=data)
        count = users.count()
        users = users[(index-1)*10:index*10]
        # 检查是否找到了至少一个用户
        if not users:
            # 如果没有找到用户，返回404状态码
            return Response({'error': '用户未找到'}, status=404)
        
        # 如果有多个用户匹配，我们可以选择返回所有匹配的用户信息
        # 或者，根据业务需求，可能只需要返回第一个匹配的用户
        # 这里我们假设返回所有匹配的用户信息
        res = []
        for user in users:
            iso_time_str = str(user.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)
            user_info = {
                'id':user.id,
                'username':user.username,
                'nickname':user.nickname,
                'role':ROLES[user.role],
                'status': '正常' if not user.status else '封禁',
                'email':user.email,
                'phonenumber':user.phonenumber,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                'count':count
            }
            res.append(user_info)
        
        # 返回包含所有匹配用户信息的响应
        return Response(res)