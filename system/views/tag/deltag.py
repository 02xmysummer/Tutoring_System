from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.tag import Tag
from system.utils.user.permissions import IsAdmin
class DelTag(APIView):
    permission_classes = ([IsAdmin])
    def delete(self,request):
        tagname = request.data.get('tagname')
        if tagname is None:
            return Response({
                'error': 'No tagname provided'
            })

        Tag.objects.filter(tagname=tagname).delete()

        return Response({
            'status': 'success',
        })