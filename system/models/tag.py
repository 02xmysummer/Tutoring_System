from django.db import models
from django.utils.timezone import now

class Tag(models.Model):
    id = models.AutoField('TagsID', primary_key=True)
    tagname = models.CharField('标签', max_length=16)
    class Meta:
        db_table = "tag"