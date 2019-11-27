import os
import glob
import time
import datetime
#import mysql.connector
import pymysql

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
cur = db.cursor();

class events:
    def __init__(self, d1, d2, d3):
        self.d1 = d1
        self.d2 = d2
        self.d3 = d3

    def sendevtDB(self, db, err):
        self.db = db
        self.isrun = err
        self.device = device

        if isrun == 1:
            err = 0
            

        datetimeWrite = (time.strftime("%y%m%d") + time.strftime("%H%M%S"))
        print (datetimeWrite)
        #print("Cel temp = %f / Fah temp = %f" %read_temp())
        #data = {'date':datetimeWrite, 'tempc':temp_c, 'tempf':temp_f}
        sql = """INSERT INTO events (time, name, isrun) VALUES ({0}, {1}, {2})""".format(datetimeWrite, device, isrun)
    
        #sql = 'insert into tmp (time, temp_c, temp_f) values(%s, %s, %s)'
        try :
            print ("Writing evtData to Database...")
            print(sql)
            # Execute SQL
            cur.execute(sql)
            # commit to db
            db.commit() 
            print ("evtData Write Complete")

        
        except :
            #rollback
            db.rollback()
            print ("Failed writing evtData to Database")
            err = 1
            return err