from django.db import models
from django.utils.timezone import now
from .sys_user import SysUser
from .teacher import Teacher
from .tag import Tag
from .classification import Classification
# 学生发布的家教要求帖子
class Post(models.Model):
    # 帖子ID，作为主键
    id = models.AutoField('PostID', primary_key=True)
    user = models.ForeignKey(SysUser, on_delete=models.CASCADE) 
    teacher = models.ForeignKey(Teacher, on_delete=models.SET_NULL, null=True, blank=True)
    create_time = models.DateTimeField('创建时间', default=now)
    grade = models.ForeignKey(Classification, on_delete=models.CASCADE,null=True) 
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE,null=True) 
    hprice = models.IntegerField('时薪',default=100) 
    weekly_lessons = models.IntegerField('每周堂数')
    lesson_duration = models.IntegerField('每堂时间', help_text='以分钟为单位')
    location = models.CharField('地点', max_length=255)  # 可以是具体地址或区域
    require = models.TextField('其他要求')
    
    class Meta:
        db_table = "post"

