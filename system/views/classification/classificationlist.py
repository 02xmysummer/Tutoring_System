from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.classification import Classification

class ClassificationList(APIView):

    def get(self,request):
        classfications = Classification.objects.all()
        res = []
        for classfication in classfications:
            c = {
                'id':classfication.id,
                'classname':classfication.classname,
            }
            res.append(c)
        return Response(res)
