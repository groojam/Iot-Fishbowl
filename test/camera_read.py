from PIL import Image
import pymysql
import io
from io import StringIO

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db', charset='utf8');
cur = db.cursor();
image_folder = '/home/pi/Documents/test/images'

while True:
    cur.execute("SELECT * FROM images")
    img = cur.fetchall()
    
    image_file = cString.IO.StringIO(base64.b64ecode(img[0][0]))
    
    photo = Image.open(image_file, 'r').convert('RGB')
    photo.show()
    
    #img_file = io.BytesIO(img)
    
    #image = Image.open(img_file)
    #image.show()
    cur.close()
    db.close()
    
#    cur.execute("select * from images")
#    image_name = input("input image name: ")
#    image_str = cur.execute("select image from images where title = {0}".format(image_name))
#    image = cur.fetchall()
#    open(image, 'wb').write(
#        )
#
#    
#    photo = Image.open(ByteIO(image))