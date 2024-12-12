from django.db import models
from django.utils.timezone import now
# 定义年级和学科的选项

class Classification(models.Model):
    id = models.AutoField('PostID', primary_key=True)
    classname = models.CharField('科目分类', max_length=8)
    class Meta:
        db_table = "classfication"

