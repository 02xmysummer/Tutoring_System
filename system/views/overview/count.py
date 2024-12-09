import json
from collections import defaultdict
from datetime import datetime, timedelta
import re
from rest_framework.views import APIView
from rest_framework.response import Response
class Count(APIView):
    def get(self, request):
        # 获取当前日期
        today = datetime.now().date()
        # 生成一个列表，包含最近五天的日期字符串
        recent_days = [(today - timedelta(days=i)).strftime("%Y-%m-%d") for i in range(10)]

        # 设定日志文件路径（这里应该替换为实际的日志文件路径）
        log_file_path = '/home/acs/Tutoring_System/login_logs.log'

        # 初始化两个字典，一个用于存储日期和对应的独特IP集合，另一个用于存储日期和对应的请求总数
        unique_ips_by_date = defaultdict(set)
        request_counts_by_date = defaultdict(int)

        obj = re.compile(r'^(?P<date>\d{4}-\d{2}-\d{2}).*?"ip_address": "(?P<ip_address>\d+\.\d+\.\d+\.\d+)"')

        # 读取并解析日志文件
        with open(log_file_path, 'r', encoding='utf-8') as file:
            for line in file:
                r = obj.search(line)
                if r:
                    date = r.group('date')
                    ip = r.group('ip_address')
                    if date in recent_days:
                        unique_ips_by_date[date].add(ip)
                        request_counts_by_date[date] += 1

         # 准备最终的数据结构
        final_data = {}
        for date in recent_days:
            # 计算该日期的总IP数（去重后）
            ip_address_total = len(unique_ips_by_date[date])
            # 获取该日期由独特IP地址发出的请求总数
            # 注意：这里不是独特请求数，而是独特IP地址的数量乘以它们可能发出的请求数
            total_requests = request_counts_by_date[date]
            # 将结果添加到最终的数据结构中
            final_data[date] = {
                'ip_address': ip_address_total,
                'total_requests': total_requests  # 更准确的命名
            }
 
        # 直接返回字典，Django REST framework会自动将其转换为JSON格式的HTTP响应
        return Response(final_data)