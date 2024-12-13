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
            hostname = '47.109.76.15'
            port = 22
            username = 'acs'
            password = '123'

            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect(hostname, port, username, password)
            os_info = get_os_info(ssh)
            return Response({
                'os_info':os_info
            })
