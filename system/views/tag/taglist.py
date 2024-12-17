from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.tag import Tag
import json


class TagList(APIView):

    def get(self,request):
        tags = Tag.objects.all()
        res = []
        res.append({
            'id':0,
            'tagname':'全部',
        })
        for tag in tags:
            c = {
                'id':tag.id,
                'tagname':tag.tagname,
            }
            res.append(c)
        return Response(res)
