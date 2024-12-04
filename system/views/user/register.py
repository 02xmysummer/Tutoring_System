from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
from system.models.abs_user import AbsUser
from system.models.sys_user import SysUser


class Register(APIView):

    def post(self,request):
        data = request.data
        username = data.get("username", "").strip()
        password = data.get("password", "").strip()
        password_confirm = data.get("password_confirm", "").strip()
        nickname = data.get("nickname", "").strip()
        role = data.get("role", "").strip()
        status = data.get("status", "").strip()
        email = data.get("email", "").strip()
        phonenumber = data.get("phonenumber", "").strip()
        if not username or not password:
            return Response({
                'result': "用户名和密码不能为空"
            })
        if password != password_confirm:
            return Response({
                'result': "两个密码不一致",
            })
        if AbsUser.objects.filter(username=username).exists():
            return Response({
                'result': "用户名已存在"
            })
        passwd = make_password(password)
        absuser = AbsUser.objects.create(username=username,password=passwd,role=1)
        if nickname:
            absuser.nickname = nickname
        if status:  
            absuser.status = int(status) 
        if role:
            absuser.role = int(role)
        if email:
            absuser.email = email
        if phonenumber:
            absuser.phonenumber = phonenumber
        absuser.save()
        SysUser.objects.create(absuser=absuser)
        return Response({
            'result': "add user success",
        })