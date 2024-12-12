from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.classification import Classification
from system.utils.user.permissions import IsAdmin
class DelClassification(APIView):
    permission_classes = ([IsAdmin])
    def delete(self,request):
        classname = request.data.get('classname','')
        if not classname:
            return Response({
                'error': 'No classname provided'
            })

        Classification.objects.filter(classname=classname).delete()

        return Response({
            'status': 'success',
        })