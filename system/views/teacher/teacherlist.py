from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import timezone
import dateutil.parser
from system.models.teacher import Teacher
from system.models.classification import Classification
from system.models.tag import Tag

GENDERS = ['男','女']
EQ = ['小学','初中','高中','本科','研究生']
class TeacherList(APIView):

    def get(self,request):
        index = int(request.GET.get('index','1'))
        teacher_type = int(request.GET.get('teacher_type','0')) #推荐，最热，最新 = 0，1，2
        province = request.GET.get('province')
        county = request.GET.get('county')
        city = request.GET.get('city')

        classname = request.GET.get('classname')
        tagname = request.GET.get('tagname')
        #先根据类型选择
        teachers = Teacher.objects.all()
        if teacher_type == 0:#推荐的老师
            teachers = teachers.order_by('-popularity')
        elif teacher_type == 1:#最热的老师,根据teacher的popularity(int)的大小来排序返回
            teachers = teachers.order_by('-popularity')
        else:#最新的老师,根据teacher的create_time = models.DateTimeField('创建时间', default=now)来排序
            teachers = teachers.order_by('-create_time')

        # #根据地区
        if city and county and province:
            teachers = teachers.filter(city=city, county=county, province=province)
        elif not city and county and province:
            teachers = teachers.filter(county=county, province=province)
        elif not city and not county and province:
            teachers = teachers.filter(province=province)


        if classname != None:
            classification = Classification.objects.get(classname=classname)
            teachers = teachers.filter(classification=classification)

        if tagname != None:
            tag = Tag.objects.get(tagname=tagname)
            teachers = teachers.filter(tag=tag)

        teachers = teachers[(index-1)*10:index*10]
        count = Teacher.objects.count()
        res = []
        for teacher in teachers:
            iso_time_str = str(teacher.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)
            photo = ''
            if teacher.avatar == None:
                photo = 'http://47.109.76.15:8000/static/img/teacher/man.jpg' if teacher.gender == 0 else 'http://47.109.76.15:8000/static/img/teacher/woman.jpg'
            else:
                photo = teacher.avatar
            res.append({
                'count':count,
                'id':teacher.id,
                'nickname':teacher.nickname,
                'status': '上架' if not teacher.status else '下架',
                'email':teacher.email,
                'hprice':teacher.hprice,
                'eq':EQ[teacher.eq],
                'gender':GENDERS[teacher.gender],
                'age':teacher.age,
                'province':teacher.province,
                # 'subject':teacher.classification.classname,
                'remark':teacher.remark,
                'phonenumber':teacher.phonenumber,
                'photo':photo,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
            })
        return Response(res)