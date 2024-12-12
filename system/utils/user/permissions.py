from rest_framework.permissions import BasePermission, IsAuthenticated
from system.models.sys_user import SysUser
class IsAdminOrSelf(BasePermission):
    def has_permission(self, request, view):
        return IsAuthenticated().has_permission(request, view)

    def has_object_permission(self, request, view, obj=None):
        current_user = request.user
        try:
            user_id = int(request.data.get('user_id'))
            target_user = SysUser.objects.get(id=user_id)
        except (ValueError, SysUser.DoesNotExist):
            return False

        # 检查当前用户是否是管理员（role == 0）或尝试修改自己的信息（current_user.id == target_user.id）
        return current_user.role == 0 or current_user.id == target_user.id

class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        return IsAuthenticated().has_permission(request, view)

    def has_object_permission(self, request, view, obj=None):
        current_user = request.user
        try:
            user_id = int(request.data.get('user_id'))
            target_user = SysUser.objects.get(id=user_id)
        except (ValueError, SysUser.DoesNotExist):
            return False

        # 检查当前用户是否是管理员（role == 0）
        return current_user.role == 0