from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import timezone
import dateutil.parser
from system.models.teacher import Teacher
GENDERS = ['男','女']
EQ = ['小学','初中','高中','本科','研究生']
class TeacherList(APIView):

    def get(self,request):
        index = int(request.GET.get('index',1))
        teachers = Teacher.objects.all()[(index-1)*10:index*10]
        count = Teacher.objects.count()
        res = []
        for teacher in teachers:
            iso_time_str = str(teacher.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)

            res.append({
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
            })
        return Response(res)