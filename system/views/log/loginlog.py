from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import os
from pathlib import Path
import logging
from django.dispatch import receiver
from django.dispatch import receiver, Signal
from datetime import datetime
import json
import re
# 配置日志记录器
BASE_DIR = Path(__file__).resolve().parent.parent.parent.parent
logger = logging.getLogger('login_logger')
logger.setLevel(logging.INFO)  # 设置日志级别为 INFO

# 创建一个文件处理器，将日志写入文件
file_handler = logging.FileHandler('login_logs.log')
file_handler.setLevel(logging.INFO)

# 创建一个日志格式器，并设置给文件处理器
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)

# 将文件处理器添加到日志记录器中
logger.addHandler(file_handler)
user_jwt_logged_in = Signal()

@receiver(user_jwt_logged_in)
def jwt_user_logged_in_receiver(sender, user, request, **kwargs):
    # 记录登录信息，比如 IP 地址、user-agent 和登录时间
    ip_address = request.META.get('REMOTE_ADDR')
    user_agent = request.META.get('HTTP_USER_AGENT', 'Unknown User-Agent')
    login_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    
    # 创建一个字典来存储登录信息
    login_info = {
        'user': user.username,
        'ip_address': ip_address,
        'user_agent': user_agent,
        'login_time': login_time
    }
    
    # 将字典转换为JSON字符串
    login_info_json = json.dumps(login_info, ensure_ascii=False)  # ensure_ascii=False以保持非ASCII字符的可读性
    
    # 使用日志记录器记录登录信息（作为JSON字符串）
    logger.info(login_info_json)
    # 如果还需要将这些信息保存到数据库中，你可以在这里添加相应的数据库操作代码
class LoginLogView(APIView):
    def get(self, request, format=None):
        log_file_path = os.path.join(BASE_DIR, 'login_logs.log')
        print(log_file_path)
        logs = []
        with open(log_file_path, 'r') as file:
            for line in file:
                match = re.search(r'-\s*(\{.*?\})\s*$', line)
                log_entry = json.loads(match.group(1))
                logs.append(log_entry)
            
        return Response(logs)