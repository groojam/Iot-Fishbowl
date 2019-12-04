import os
import datetime
import glob
import time
import base64
import sys
import pymysql
import socket
import sys

#카메라 라이브러리
import picamera
import RPi.GPIO as GPIO

#통신 라이브러리
import socket
#import urllib.response
#import urllib.request
#import http.server
#import webiopi

#각 기능별 모듈 import
import temper
import relay
import cam
import events
import client
#import svr
#import svr2

#host = '18.216.172.165'

#port = 9999

#server_socket = socket.scoket(socket.AF_INET, soket.SOCK_STREAM)

#server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
#server_socket.bind((host, port))
#server_socket.listen()
#client_socket, addr = server_socket.accept()
#print('Connected by', addr)

def runningTime(self):
    pass

def nowMin(self, nowTime):
    self.nowTime = nowTime
    min = nowTime.strftime('%s')
    return min
    
if __name__ == "__main__" :
    os.system('modprobe w1-gpio')
    os.system('modprobe w1-therm')

    base_dir = '/sys/bus/w1/devices/'
    device_folder = glob.glob(base_dir + '28*')[0]
    device_file = device_folder + '/w1_slave' #temp_sensor

    image_folder = '/home/pi/Documents/test/'

    db = pymysql.connect(host='18.216.172.165', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
    cur = db.cursor();

    temper = temper
    cam = cam


    HOST = '' #all available interfaces
    PORT = 7777

    def getDevData(dev_no) :
        return dev_no
    
    def getSingalData(status):
        return status
    


    while True:
        
        try:
            #4. Accept connection    
            
    
            #5. Read/Send
            #ori_data = conn.recv(1024)
            if not ori_data:
                print("There is no Data!")
            data = ori_data.decode().split(',')
            dev_no = data[0]
            signal = data[1]
            err = 0
            nowTime = datetime.datetime.now()
            signal = client_socket.recv(1024)

            print("어항관리 시스템 작동 시작")
            if(nowMin(nowTime)%10 == 0):
                temper.sendtmpDB(db)
                events.endevtDB(temper, err)
            elif(nowMin(nowTime)%23 == 0):
                cam.sendomgDb(db)
                events.endevtDB(cam, err)
            
            if(signal == 0):
                status = 0
                relay.ctrl(dev_no, status)
            elif(signal == 1):
                status = 1
                relay.ctrl(dev_no, status)

        except Exception as e:
            print('py main error!')
            break

client_socket.close()
server_socket.close()
sys.exit()

        
        
    
