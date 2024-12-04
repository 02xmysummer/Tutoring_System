# user/models.py
from django.db import models
from .abs_user import AbsUser
class SysUser(models.Model):
    id = models.AutoField('AbsUserID', primary_key=True)
    absuser = models.OneToOneField(AbsUser, on_delete=models.CASCADE, related_name='sysuser')
    def is_authenticated(self):
        return True

    class Meta:
        db_table = "sys_user"
