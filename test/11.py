import pymysql

db = pymysql.connect(host='18.222.181.183', user='pi', passwd='pikey999', db='raspi_db');
cur = db.cursor();


sql = "select * from tmp"
cur.execute(sql)

temp = cur.fetchall()
print(temp)

cur.close()