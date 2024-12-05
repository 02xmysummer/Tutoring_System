# user/models.py
from django.db import models
from django.utils.timezone import now
from django.contrib.auth.hashers import make_password, check_password

class Teacher(models.Model):
    id = models.AutoField('TeacherID', primary_key=True)
    username = models.CharField('用户名', max_length=16, unique=True)
    password = models.CharField('密码', max_length=128)  # 密码字段
    nickname = models.CharField('姓名', max_length=16, default='x老师')
    avatar = models.CharField('头像', max_length=255, null=True)
    age = models.IntegerField('年龄')
    gender = models.IntegerField('性别',default=0)
    status = models.IntegerField('帐号状态(0上架 1下架)', default=0)
    email = models.CharField('邮箱地址', max_length=32, blank=True, null=True)
    phonenumber = models.CharField('手机号码', max_length=18,default='123456')
    hprice = models.IntegerField('每小时价格')
    province = models.CharField('省份', max_length=8)
    county = models.CharField('市/区', max_length=8)
    area = models.CharField('详细地址', max_length=64,null=True)
    eq = models.IntegerField('学历',default=3)
    remark = models.TextField('简介', blank=True, null=True)
    create_time = models.DateTimeField('创建时间', default=now)

    def is_authenticated(self):
        return True

    class Meta:
        db_table = "teacher"
