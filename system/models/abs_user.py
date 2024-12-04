# user/models.py
from django.db import models
from django.utils.timezone import now
from django.contrib.auth.hashers import make_password, check_password

class AbsUser(models.Model):
    id = models.AutoField('AbsUserID', primary_key=True)
    username = models.CharField('用户名', max_length=16, unique=True)
    password = models.CharField('密码', max_length=128)  # 密码字段
    nickname = models.CharField('昵称', max_length=16, default='qwe')
    avatar = models.CharField('用户头像', max_length=255, null=True)
    phonenumber = models.CharField('手机号码', max_length=15, blank=True, null=True)
    role = models.IntegerField('角色（0管理员 1普通用户 2老师）')
    status = models.IntegerField('帐号状态(0正常 1封禁/0上线 1下线)', default=0)
    email = models.CharField('邮箱地址', max_length=32, blank=True, null=True)
    create_time = models.DateTimeField('创建时间', default=now)
    def is_authenticated(self):
        return True

    class Meta:
        db_table = "abs_user"
