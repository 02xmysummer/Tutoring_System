from django.shortcuts import render


def admin(request):
        return render(request, "admin.html")

# def index(request):
#         return render(request, "index.html")       
