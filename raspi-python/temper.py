import os
import glob
import time
import datetime
#import mysql.connector
import pymysql

os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')


base_dir = '/sys/bus/w1/devices/'
device_folder = glob.glob(base_dir + '28*')[0]
device_file = device_folder + '/w1_slave' #temp_sensor

#Variables for DBConnection

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
cur = db.cursor();
class tmp :
    def __init__(self):
        pass

    def temp_c_Read(self):
        f = open(device_file,'r')
        lines = f.readlines()
        f.close()
        temp_output = lines[1].find('t=')
        if temp_output != -1:
            temp_string = lines[1][temp_output+2:]
            temp_c = float(temp_string) / 1000.0
        return round(temp_c, 2)

    def temp_f_Read(self):
        f = open(device_file,'r')
        lines = f.readlines()
        f.close()
        temp_output = lines[1].find('t=')
        if temp_output != -1:
            temp_string = lines[1][temp_output+2:]
            temp_c = float(temp_string) / 1000.0
            temp_f = temp_c * 9.0 / 5.0 + 32.0
        return round(temp_f, 2)

    def sendtmpDB(self, db):
        self.db = db
        
        err = 0

        temp_c = self.temp_c_Read()
        temp_f = self.temp_f_Read()
        print ("c:{0} f:{1}".format(temp_c, temp_f))
        datetimeWrite = (time.strftime("%y%m%d") + time.strftime("%H%M%S"))
        print (datetimeWrite)
        #print("Cel temp = %f / Fah temp = %f" %read_temp())
        #data = {'date':datetimeWrite, 'tempc':temp_c, 'tempf':temp_f}
        sql = """INSERT INTO tmp (time, temp_c, temp_f) VALUES ({0}, {1}, {2})""".format(datetimeWrite, temp_c, temp_f)
    
        #sql = 'insert into tmp (time, temp_c, temp_f) values(%s, %s, %s)'
        try :
            print ("Writing tempData to Database...")
            print(sql)
            # Execute SQL
            cur.execute(sql)
            # commit to db
            db.commit() 
            print ("tempData Write Complete")
            return err
        
        except :
            #rollback
            db.rollback()
            err = 1
            print ("Failed writing tempData to Database")
            return err

