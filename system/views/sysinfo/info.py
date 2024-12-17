from rest_framework.views import APIView
from rest_framework.response import Response
import paramiko
import re
def execute_command(ssh, command):
    stdin, stdout, stderr = ssh.exec_command(command)
    return stdout.read().decode().strip()


def get_os_info(ssh):
    os_info = execute_command(ssh, "lsb_release -a")
    return os_info
class SysInfo(APIView):

    def get(self,request):
            # hostname = '47.109.76.15'
            # port = 22
            # username = 'acs'
            # password = '123'

            # ssh = paramiko.SSHClient()
            # ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            # ssh.connect(hostname, port, username, password)
            # os_info = get_os_info(ssh)
            return Response(
                {
                'systemName': "家教管理系统",
                'version': "1.1.0",
                'os': "Linux",
                'platform': "Linux iZ2vc8hbmtyohb04v0j2kvZ 6.8.0-40-generic",
                'cpuCount': 2,
                'processor': "Intel64 Family 6 Model 94 Stepping 3, GenuineIntel",
                'cpuUsage': "1.5%",
                'totalMemory': "2G",
                'usedMemory': "4.88G",
                'memoryUsage': "75.0%",
                'language': ["zh_CN", "cp936"],
                'mysqlVersion': "8.0.40-0ubuntu0.24.04.1",
                'nginxVersion': "1.20.1",
                'timezone': "中国标准时间"
                }
            )
