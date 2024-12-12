from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.teacher import Teacher
from django.shortcuts import get_object_or_404
from datetime import timezone
import dateutil.parser
GENDERS = ['男','女']
EQ = ['小学','初中','高中','本科','研究生']
class TeacherInfo(APIView):
    def get(self, request):
        try:
            user_id = int(request.GET.get('user_id','0'))
            teacher = Teacher.objects.get(id=user_id)
            iso_time_str = str(teacher.create_time)
            dateObject = dateutil.parser.isoparse(iso_time_str)
            localdt = dateObject.replace(tzinfo = timezone.utc).astimezone(tz=None)
            photo = ''
            if teacher.avatar == None:
                photo = 'http://47.109.76.15:8000/static/img/teacher/man.jpg' if teacher.gender == 0 else 'http://47.109.76.15:8000/static/img/teacher/woman.jpg'
            else:
                photo = teacher.avatar
            return Response({
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
                'photo':photo,
                'subject':teacher.classification.classname,
                'phonenumber':teacher.phonenumber,
                'create_time':localdt.strftime('%Y-%m-%d %H:%M:%S'),
                })
        except Exception as e:
            return Response({
                'result': "输入参数错误" + str(e)
            })
    
    
    def post(self, request):
        try:
            user_id = int(request.data.get('user_id'))
            nickname = request.data.get('nickname').strip()
            role = request.data.get('role').strip()
            status = request.data.get('status').strip()
            email = request.data.get('email').strip()
            phonenumber = request.data.get('phonenumber').strip()
            hprice = request.data.get('hprice').strip()
            eq = request.data.get('eq').strip()
            gender = request.data.get('gender').strip()
            age = request.data.get('age').strip()
            remark = request.data.get('remark').strip()
            user = get_object_or_404(SysUser, id=user_id)


            if nickname:
                user.nickname = nickname
            if status:  
                user.status = int(status) 
            if role:
                user.role = int(role)
            if email:
                user.email = email
            if phonenumber:
                user.phonenumber = phonenumber
            if hprice:
                user.hprice = int(hprice)
            if eq:
                user.eq = int(eq)
            if gender:
                user.gender = int(gender)
            if age:
                user.age = int(age)
            if remark:
                user.remark = remark

    
            user.save()
            return Response({'result': '修改成功'})
    
        except ValueError as e:
            return Response({'result': '输入参数类型错误: {}'.format(e)})
        except SysUser.DoesNotExist:
            return Response({'result': '用户不存在'})
        except Exception as e:
            return Response({'result': '发生错误: {}'.format(str(e))})

    def delete(self, request):
        try:
            user_id = request.data.get('user_id')  # 使用getlist来处理列表数据
            if not teacher_id:
                return Response({'error': 'Invalid user_id'})
            
            # 使用QuerySet的filter和delete方法来批量删除用户
            Teacher.objects.filter(id=int(user_id)).delete()
            
            return Response({'result': '删除成功'})
        except Teacher.DoesNotExist:
            # 注意：在批量删除时，通常不会抛出DoesNotExist异常，
            # 因为filter()方法返回的是一个QuerySet，即使没有找到任何对象，
            # 调用其delete()方法也不会引发异常。
            # 这里保留异常处理主要是为了捕获其他可能的数据库错误。
            return Response({'result': '发生错误: 用户不存在'})
        except Exception as e:
            return Response({'result': '发生错误: {}'.format(str(e))})






