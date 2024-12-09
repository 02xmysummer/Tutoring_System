from django.urls import path
from system.views.overview.count import Count

urlpatterns = [
    path("count/", Count.as_view(), name="count"),
]