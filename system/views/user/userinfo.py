from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from system.models import AbsUser,SysUser
from system.utils.permissions import IsAdminOrSelf  # 假设你将自定义权限类放在了名为 permissions.py 的文件中
from django.shortcuts import get_object_or_404
ROLES = ['管理员','普通用户']
class UserInfo(APIView):
    permission_classes = ([IsAdminOrSelf])
    def dispatch(self, request, *args, **kwargs):
        # 根据请求方法动态设置权限类
        if request.method.lower() in ['post', 'put','delete']:  # 如果你还有 PUT 方法用于更新，也应该包括它
            self.permission_classes = [IsAdminOrSelf]
        else:
            self.permission_classes = [IsAuthenticated]
        return super().dispatch(request, *args, **kwargs)
    
    def get(self, request):
        try:
            user_id = int(request.GET.get('user_id'))
            user = AbsUser.objects.get(id=user_id)
            if user.role == 0 or user.role == 1:
                return Response({
                        'id': user.id,
                        'username': user.username,
                        'nickname':user.nickname,
                        'avatar': user.avatar,
                        'status': '正常' if not user.status else '封禁',
                        'email':user.email,
                        'role':ROLES[user.role],
                        'phonenumber':user.phonenumber,
                    })
            else:
                return Response({
                        'error':'你无权访问'
                    })
        except Exception as e:
            return Response({
                'result': "输入参数错误" + str(e)
            })
    
    
    def post(self, request):
        try:
            user_id = int(request.data.get('user_id'))
            nickname = request.data.get('nickname')
            role = request.data.get('role') 
            status = request.data.get('status')
            email = request.data.get('email')
            phonenumber = request.data.get('phonenumber')
            user = get_object_or_404(AbsUser, id=user_id)
    

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

    
            user.save()
            return Response({'result': '修改成功'})
    
        except ValueError as e:
            return Response({'result': '输入参数类型错误: {}'.format(e)})
        except AbstractUser.DoesNotExist:
            return Response({'result': '用户不存在'})
        except Exception as e:
            return Response({'result': '发生错误: {}'.format(str(e))})

    def delete(self, request):
        try:
            user_id = request.data.get('user_id')  # 使用getlist来处理列表数据
            if not user_id:
                return Response({'error': 'Invalid user_id'})
            
            # 使用QuerySet的filter和delete方法来批量删除用户
            AbsUser.objects.filter(id=user_id).delete()
            
            return Response({'result': '删除成功'})
        except AbsUser.DoesNotExist:
            # 注意：在批量删除时，通常不会抛出DoesNotExist异常，
            # 因为filter()方法返回的是一个QuerySet，即使没有找到任何对象，
            # 调用其delete()方法也不会引发异常。
            # 这里保留异常处理主要是为了捕获其他可能的数据库错误。
            return Response({'result': '发生错误: 用户不存在'})
        except Exception as e:
            return Response({'result': '发生错误: {}'.format(str(e))})






