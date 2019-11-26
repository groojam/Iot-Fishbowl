import pymysql
import sys
import base64
import time
import picamera
import os
import glob
import datetime

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
cur = db.cursor();

image_folder = '/home/pi/Documents/test/'

class cam :
    def __init__(self):
        pass

    def read_file(self, filename):
        self.filename = filename

        with open(filename, 'rb') as f:
            photo = f.read()
        return photo

    def sendimgDB(self, db):
        self.db = db
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
        
            except :
                #rollback
                db.rollback()
                print ("Failed writing imgData to Database")
#with picamera.PiCamera() as camera:
    #camera.resolution = (1024,768)
    #camera.start_preview()
    #time.sleep(2)
    #camera.stop_preview()
    #now = time.strftime("%y%m%d%H%M%S")
    #camera.capture(now + '.jpg')
    #filename = image_folder + now + ".jpg"