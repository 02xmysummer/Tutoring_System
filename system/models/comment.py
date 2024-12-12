from django.db import models
from django.utils.timezone import now
from system.models.sys_user import SysUser
from system.models.teacher import Teacher
class Comment(models.Model):
    id = models.AutoField('CommentID', primary_key=True)
    user = models.ForeignKey(SysUser, on_delete=models.CASCADE) 
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE) 
    create_time = models.DateTimeField('创建时间', default=now)
    comment = models.TextField('评论')
    
    class Meta:
        db_table = "comment"