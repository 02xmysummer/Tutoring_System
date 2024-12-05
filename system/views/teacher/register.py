from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
from system.models.teacher import Teacher
def are_all_fields_filled(username, password, hprice, nickname, phonenumber, eq, age, gender, province, county):
    return (username and password and hprice and nickname and phonenumber and eq and
            age and gender and province and county)


class Register(APIView):

    def post(self,request):
        data = request.data
        username = data.get("username", "").strip()
        password = data.get("password", "").strip()
        password_confirm = data.get("password_confirm", "").strip()
        nickname = data.get("nickname", "").strip()
        age = data.get("age", "").strip()
        gender = data.get("gender", "").strip()
        eq = data.get("eq", "").strip()
        status = data.get("status", "").strip()
        email = data.get("email", "").strip()
        phonenumber = data.get("phonenumber", "").strip()
        province = data.get("province", "").strip()
        county = data.get("county", "").strip()
        hprice = data.get("hprice", "").strip()

        if not are_all_fields_filled(username, password, hprice, nickname, phonenumber, eq, age, gender, province, county):
            return Response({
                'result': "参数列表错误"
            })
        if password != password_confirm:
            return Response({
                'result': "两个密码不一致",
            })
        if Teacher.objects.filter(username=username).exists():
            return Response({
                'result': "Teacher已存在"
            })
        passwd = make_password(password)
        teacher = Teacher.objects.create(
            username=username,
            password=passwd,
            nickname=nickname,
            status=0,
            email=email,
            phonenumber=phonenumber,
            eq = int(eq),
            age=int(age),
            gender=int(gender),
            province=province,
            county=county,
            hprice=int(hprice)
        )
        return Response({
            'result': "add teacher success",
        })