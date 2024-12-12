from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.classification import Classification
from system.utils.user.permissions import IsAdmin
class AddClassification(APIView):
    permission_classes = ([IsAdmin])
    def post(self,request):
        classname = request.data.get('classname','')
        if not classname:
            return Response({
                'error': 'No classname provided'
            })
        if Classification.objects.filter(classname=classname).exists():
            return Response({
                'error': 'Classification with this classname already exists'
            })
        Classification.objects.create(classname=classname)

        return Response({
            'status': 'success',
        })