from rest_framework.views import APIView
from rest_framework.response import Response
from system.models.post import Post
from system.utils.user.permissions import IsAdminOrSelf
class DelPost(APIView):
    permission_classes = ([IsAdminOrSelf])
    def delete(self,request):
        post_id = request.data.get('post_id')
        if post_id is None:
            return Response({
                'error': 'No post_id provided'
            })
        Post.objects.filter(id=int(post_id)).delete()

        return Response({
            'status': 'success',
        })