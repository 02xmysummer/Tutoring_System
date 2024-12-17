from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
from system.models.teacher import Teacher
from datetime import timezone
import dateutil.parser

class Search(APIView):

    def get(self, request):
        data = request.GET.get('data')

        index = int(request.GET.get('index','1'))
        if not data:
            # 如果没有提供 'data'，则返回错误响应
            return Response({'error': '搜索数据为空'}, status=400)
        
        teachers = Teacher.objects.filter(nickname__icontains=data)
        count = teachers.count()
        teachers = teachers[(index-1)*10:index*10]
        # 检查是否找到了至少一个用户
        if not teachers:
            return Response({'error': '该老师未找到'}, status=404)
        
        res = []
        for teacher in teachers:
            iso_time_str = str(teacher.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)
            teacher_info = {
                'id':teacher.id,
                'nickname':teacher.nickname,
                'status': '上架' if not teacher.status else '下架',
                'email':teacher.email,
                'hprice':teacher.hprice,
                'eq':EQ[teacher.eq],
                'gender':GENDERS[teacher.gender],
                'age':teacher.age,
                'province':teacher.province,
                'remark':teacher.remark,
                'phonenumber':teacher.phonenumber,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                'count':count
            }
            res.append(teacher_info)
        
        # 返回包含所有匹配用户信息的响应
        return Response(res)