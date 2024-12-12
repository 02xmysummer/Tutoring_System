from django.urls import path
from system.views.tools.cities import Provinces,Cities,Country



urlpatterns = [
    path("provinces/",Provinces.as_view(),name="get_provinces"),
    path("cities/",Cities.as_view(),name="get_cities"),
    path("country/",Country.as_view(),name="get_country"),
]
