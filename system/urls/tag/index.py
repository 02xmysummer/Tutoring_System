from django.urls import path
from system.views.tag.taglist import TagList
from system.views.tag.addtag import AddTag
from system.views.tag.deltag import DelTag

urlpatterns = [
    path('taglist/', TagList.as_view(), name="sysytem_taglist"),
    path('addtag/', AddTag.as_view(), name="sysytem_addtag"),
    path('deltag/', DelTag.as_view(), name="sysytem_deltag"),
]
