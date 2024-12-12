from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
import json

cities_data = {}
json_path = '/home/acs/Tutoring_System/jquery-citys.json'

municipality_code = ['10','11','50','31']

def load_json():
    global cities_data
    with open(json_path, mode='r', encoding='utf-8') as f:
        cities_data = json.load(f)
    # return cities_data
def get_provinces():
    load_json()
    # 初始化一个空字典来存储省份编码和名称的映射
    province_dict = {}
    for code, name in cities_data.items():
        if code.endswith('0000'):
            # 将编码作为键，名称作为值添加到字典中
            province_dict[code] = name
    return province_dict


def get_cities(province_code):
    load_json()
    cities_dict = {}
    k = province_code[:2]
    province = cities_data[province_code]
    for code, name in cities_data.items():
        if k in municipality_code:
            if code.startswith(k) and not code.endswith('0000'):
                cities_dict[code]=name
        else:
            if code.startswith(k) and code.endswith('00') and not code.endswith('0000'):
                cities_dict[code]=name
    return cities_dict

def get_county(city_code):
    load_json()
    if city_code[:2] in municipality_code:
        return {}
    countys_dict = {}

    k = city_code[:4]
    for code, name in cities_data.items():
        if code.startswith(k) and not code.endswith('00'):
            countys_dict[code]=name
    
    return countys_dict
class Provinces(APIView):

    def get(self,request):
        res = get_provinces()

        return Response(res)

class Cities(APIView):

    def get(self,request):
        province_code = request.GET.get('province_code','0')
        if province_code == '0':
            return Response({
                'result':'no this province'
            })
        return Response(get_cities(province_code))
        
class Country(APIView):

    def get(self,request):
        city_code = request.GET.get('city_code','0')
        if city_code == '0':
            return Response({
                'result':'no this city'
            })
        return Response(get_county(city_code))