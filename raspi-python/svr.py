from socket import *
from select import select
import sys
from time import ctime

#jsp 와 통신하는 서버. 제어신호를 받는다.
HOST = ''
PORT = 10000
BUFSIZE = 1024
ADDR = (HOST, PORT)

#소켓 생성.
serverSocket = socket(AF_INET, SOCK_STREAM)

#소켓 주소 정보 할당
server.Socket.bind(ADDR)






def ctrSignal(self, dev_no, status):
    self.dev_no = dev_no
    self.status = status

    if dev_no == 1 && status == 1:
        return dev_no, status
        

while True:
    try:
        #연결수신 대기상태
        server.Socket.listen(100)
        
        #연결 수락.
        cilentSocket, addr_info = serverSocket.accept()

        ori_data = (cilent.Socket.recev(1024)).decode
        data = ori_data.split(',')
        dev_no = data[0]
        status = data[1]

        