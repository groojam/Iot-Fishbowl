import os
import datetime
import glob
import time
import base64
import sys
import pymysql
import picamera
import RPi.GPIO as GPIO

#각 기능별 모듈 import
import temper
import relay
import cam

os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')


base_dir = '/sys/bus/w1/devices/'
device_folder = glob.glob(base_dir + '28*')[0]
device_file = device_folder + '/w1_slave' #temp_sensor

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
cur = db.cursor();

while True:
    temper.sendDB()
    
