from socket import *
from select import select
import sys
from time import ctime




class svr:

    def __init__(self) :
        #jsp 와 통신하는 서버. 제어신호를 받는다.
        self.HOST = ''
        self.PORT = 10000
        self.BUFSIZE = 1024
        self.ADDR = (HOST, PORT)
        self.dev_no = 0
        self.status = 0

        #소켓 생성.
        self.serverSocket = socket(AF_INET, SOCK_STREAM)

        #소켓 주소 정보 할당
        self.server.Socket.bind(ADDR)
            
    def getDevData(self) :
        return self.dev_no
    
    def getSingalData(self):
        return self.status



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

        except Exception as e:
            print('%s:%s'%ADDR)
            print('py svr error!')
            sys.exit()
        