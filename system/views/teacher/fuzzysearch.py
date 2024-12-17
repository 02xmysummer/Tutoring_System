from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q
from system.models.teacher import Teacher  # 确保这里正确导入了Teacher模型
from datetime import timezone
import dateutil.parser

class FuzzySearch(APIView):

    def get(self, request):
        search_term = request.GET.get('data')

        index = int(request.GET.get('index', '1'))
        if not search_term:
            # 如果没有提供 'data'，则返回错误响应
            return Response({'error': '搜索数据为空'}, status=400)
        
        # 使用Q对象进行多字段模糊匹配
        teachers = Teacher.objects.filter(
            Q(username__icontains=search_term) |
            Q(nickname__icontains=search_term) |
            Q(province__icontains=search_term)
        )
        count = teachers.count()
        teachers = teachers[(index - 1) * 10:index * 10]
        
        # 检查是否找到了至少一个教师
        if not teachers:
            return Response({'error': '未找到匹配的教师'}, status=404)
        
        res = []
        for teacher in teachers:
            iso_time_str = str(teacher.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.astimezone(tz=None)  # 假设您希望转换为本地时间，这里未指定时区
            teacher_info = {
                'id': teacher.id,
                'username': teacher.username,  # 确保这个字段在Teacher模型中
                'nickname': teacher.nickname,
                'status': '上架' if not teacher.status else '下架',
                'email': teacher.email,
                'hprice': teacher.hprice,
                # 注意：EQ和GENDERS应该在某处被定义，或者这里应该直接使用teacher.eq和teacher.gender的值
                # 'eq': EQ[teacher.eq],
                # 'gender': GENDERS[teacher.gender],
                'gender': teacher.gender,  # 假设gender是一个可以直接显示的字段
                'age': teacher.age,
                'province': teacher.province,
                'remark': teacher.remark,
                'phonenumber': teacher.phonenumber,
                'create_time': localdt.strftime('%Y-%m-%d %H:%M:%S'),
                'count': count
            }
            res.append(teacher_info)
        
        # 返回包含所有匹配教师信息的响应
        return Response(res)