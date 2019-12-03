import pymysql
import sys
import base64
import time
import picamera
import os
import glob
import datetime

class cam :
    def __init__(self):
        self.db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
        self.cur = db.cursor();
        self.image_folder = '/home/pi/Documents/test/'

    def read_file(self, filename):
        self.filename = filename

        with open(filename, 'rb') as f:
            photo = f.read()
        return photo

    def sendimgDB(self, db):
        self.db = db

        err = 0

        with picamera.PiCamera() as camera:
            camera.resolution = (1024,768)
            now = time.strftime("%y%m%d%H%M%S")
            camera.capture(now + '.jpg')
            filename = image_folder + now + ".jpg"
        
            #imageData = convertToBinaryData(read_file(filename))
            blob_value = open(filename, 'rb').read()
            imageSize = os.path.getsize(filename)
            print ("size = ({0})".format(imageSize))
            sql = """INSERT INTO images (title, image, filesize) VALUES (%s, %s, %s)"""
    
    
            args = (now, blob_value, imageSize)
            try :
                print ("Writing imgData to Database...")
                print(sql)
                # Execute SQL
                cur.execute(sql, args)
                # commit to db
                db.commit() 
                print ("Write imgData Complete")
                return err
        
            except :
                #rollback
                db.rollback()
                err = 1
                print ("Failed writing imgData to Database")
                return err
#with picamera.PiCamera() as camera:
    #camera.resolution = (1024,768)
    #camera.start_preview()
    #time.sleep(2)
    #camera.stop_preview()
    #now = time.strftime("%y%m%d%H%M%S")
    #camera.capture(now + '.jpg')
    #filename = image_folder + now + ".jpg"