from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.tag import Tag
from system.utils.user.permissions import IsAdmin
class AddTag(APIView):
    permission_classes = ([IsAdmin])
    def post(self,request):
        tagname = request.data.get('tagname')
        if not tagname:
            return Response({
                'error': 'No tagname provided'
            })
        if Tag.objects.filter(tagname=tagname).exists():
            return Response({
                'error': 'Classification with this tagname already exists'
            })
        Tag.objects.create(tagname=tagname)

        return Response({
            'status': 'success',
        })