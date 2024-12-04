# user/models.py
from django.db import models
from .abs_user import AbsUser
class Teacher(models.Model):
    id = models.AutoField('TeacherID', primary_key=True)
    absuser = models.OneToOneField(AbsUser, on_delete=models.CASCADE, related_name='teacher')
    nickname = models.CharField('姓名', max_length=16, default='x老师')
    age = models.IntegerField('年龄')
    email = models.CharField('邮箱地址', max_length=32, blank=True, null=True)
    hprice = models.IntegerField('每小时价格')
    province = models.CharField('省份', max_length=8,null=True)
    county = models.CharField('市/区', max_length=8,null=True)
    area = models.CharField('详细地址', max_length=64,null=True)
    eq = models.CharField('学历', max_length=15, blank=True, null=True)
    remark = models.TextField('简介', blank=True, null=True)
    def is_authenticated(self):
        return True

    class Meta:
        db_table = "sys_user"
