#python3

import socket
import sys

HOST = '' #all available interfaces
PORT = 7777

def getDevData(dev_no) :
    return dev_no
    
    def getSingalData(status):
    return status
#1. open Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print ('Socket created')

#2. bind to a address and port
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    print ('Bind Failed. Error code: ' + str(msg[0]) + ' Message: ' + msg[1])
    sys.exit()

print ('Socket bind complete')

#3. Listen for incoming connections
s.listen(10)
print ('Socket now listening')


#keep talking with the client
while 1:
    #4. Accept connection
    conn, addr = s.accept()
    print ('Connected with ' + addr[0] + ':' + str(addr[1]))
    
    #5. Read/Send
    ori_data = conn.recv(1024)
    if not data:
        break
    data = ori_data.decode().split(',')
    dev_no = data[0]
    status = data[1]
    return dev_no, status
    
conn.close()
s.close()