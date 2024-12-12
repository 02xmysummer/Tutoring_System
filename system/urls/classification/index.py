from django.urls import path
from system.views.classification.classificationlist import ClassificationList
from system.views.classification.addclassification import AddClassification
from system.views.classification.delclassification import DelClassification

urlpatterns = [
    path('classificationlist/', ClassificationList.as_view(), name="sysytem_classificationlist"),
    path('addclassification/', AddClassification.as_view(), name="sysytem_addclassification"),
    path('delclassification/', DelClassification.as_view(), name="sysytem_delclassification"),
]
