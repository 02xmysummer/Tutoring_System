from django.db import models
from django.utils.timezone import now

class Comment(models.Model):
    id = models.AutoField('CommentID', primary_key=True)
    teacher_id = models.IntegerField('老师id')
    user_id =  models.IntegerField('用户id')
    create_time = models.DateTimeField('创建时间', default=now)
    comment = models.TextField('评论')
    
    class Meta:
        db_table = "comment"