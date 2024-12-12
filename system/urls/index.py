from django.urls import path, include
from system.views.index import index

# from rest_framework.routers import DefaultRouter
# from drf_yasg.views import get_schema_view
# from drf_yasg import openapi
# from rest_framework import permissions
# from system.utils.user import Authorization

# 文档视图
# schema_view = get_schema_view(
#     # API 信息
#     openapi.Info(
#         title='SQTP API',   # API文档标题
#         default_version='V1',   # 版本信息
#         description='SQTP 接口文档',    # 描述内容
#         terms_of_service='https://test.com',    # 开发团队地址
#         contact=openapi.Contact(email='https://test.@163com',url='https://test.com'),   # 联系人信息：邮件、网址
#         license=openapi.License(name='Test License'),    # 证书
#     ),
#     public=True,    # 是否公开
#     # permission_classes=(permissions.AllowAny,)   # 设置用户权限

# )

# router = DefaultRouter()
# router.register(r'requests',Authorization)

# Swagger documentation setup
from rest_framework.documentation import include_docs_urls 



urlpatterns = [
    path("", index, name="index"),
    path("user/",include("system.urls.user.index")),    
    path("teacher/",include("system.urls.teacher.index")),    
    path("log/",include("system.urls.log.index")),    
    path("comment/",include("system.urls.comment.index")),    
    path("overview/",include("system.urls.overview.index")),    
    path("classification/",include("system.urls.classification.index")),    
    path("tag/",include("system.urls.tag.index")), 
    path("post/",include("system.urls.post.index")), 
    path("tool/",include("system.urls.tool.index")), 
    path('docs/', include_docs_urls(title='家教管理系统api文档')),
    # path('swagger/',schema_view.with_ui('swagger',cache_timeout=0),name='schema-swagger-ui'),   #互动模式
    # path('redoc/',schema_view.with_ui('redoc',cache_timeout=0),name='schema-redoc'),   #文档模式


]
