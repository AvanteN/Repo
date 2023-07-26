# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:light
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.14.7
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# +
import serial
from time import sleep
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

MAIN_ACTION_IDLE = 0
MAIN_ACTION_RXDB = 1
MAIN_ACTION_TXROBOT = 2
MAIN_ACTION_RXROBOT = 3
MAIN_ACTION_TXLM = 4
MAIN_ACTION_RXLM = 5
MAIN_ACTION_END = 6

ser = serial.Serial ("/dev/ttyS3", 115200)    #Open port with baud rate
mainActionVal = MAIN_ACTION_IDLE

""""""
class DataExChange :
    
    def __init__(self,received_data,transmit_data) :
        self.received_data = received_data
        self.transmit_data = transmit_data

while True:
    """
    received_data = ser.read()              #read serial port
    sleep(0.03)
    data_left = ser.inWaiting()             #check for remaining byte
    received_data += ser.read(data_left)
    received_str = received_data.decode("utf-8")

    
    if(received_str  == '1'):
       GPIO.output(17,True)                #transmit data serially
    else :
      break;
    received_data = ''
    """
    
    # Receive Value from Firebase
    """
    cred = credentials.Certificate("./project-2d9e4-firebase-adminsdk-2rz33-e572236bc5.json")
    firebase_admin.initialize_app(cred,{'databaseURL':'https://project-2d9e4-default-rtdb.firebaseio.com/'})
    ref=db.reference().child('1table').child('food_3')
    send_data = ref.get()
    mainActionVal = 1
    """
    
    Firebase = DataExchange()     # firebase 데이터 객체
    Robot = DataExchange()        # robot 동작 송수신 데이터 객체
    LmGuide = DataExChange()      # lm가이드 동작 송수신 데이터 객체
    

    if (mainActionVal == MAIN_ACTION_RXDB) :
        cred = credentials.Certificate("./project-2d9e4-firebase-adminsdk-2rz33-e572236bc5.json")
        firebase_admin.initialize_app(cred,{'databaseURL':'https://project-2d9e4-default-rtdb.firebaseio.com/'})
        ref=db.reference().child('1table').child('food_3')
        Firebase.received_data = ref.get()
        Robot.trasmit_data = Firebase.received_data.encode()
        mainActionVal = MAIN_ACTION_TXROBOT
        
    
    elif (mainActionVal == MAIN_ACTION_TXROBOT) :
        if (Robot.transmit_data == "1") :
            Robot.transmit_data = 
            ser.write(Robot.transmit_data.encode())
            sleep(1)
            mainActionVal = MAIN_ACTION_RXROBOT
        elif (Robot.transmit_data == "2") :
            Robot.transmit_data = "2"
            ser.write(Robot.transmit_data.encode())
            sleep(1)
            mainActionVal = MAIN_ACTION_RXROBOT
        else :
            mainActionVal = MAIN_ACTION_IDLE
    
    elif (mainActionVal == MAIN_ACTION_RXROBOT and ser.read() != None) :
        Robot.received_data = ser.read()
        data_left = ser.inWaiting()             #check for remaining byte
        Robot.received_data += ser.read(data_left)
        received_str = Robot.received_data.decode("utf-8")
        Robot.received_data = ''
        if (received_str == "1") :
            mainActionVal = MAIN_ACTION_TXLM
        elif (received_str == "2") :
            mainActionVal = MAIN_ACTION_TXLM
        sleep(1)
        
    elif ((mainActionVal == MAIN_ACTION_TXLM or mainActionVal == MAIN_ACTION_RXLM)and ser.read() != None) :
        LmGuide.transmit_data = ser.read()
        while() #limit switch2가 작동할 때 까지 - limit switch 값이 0(1?)이 되면 
            GPIO.output(D_IR,0)
            pwm_A.ChangeDutyCycle(50)
            timesleep(15)
        
            GPIO.output(D_IR,1)
            pwm_A.ChangeDutyCycle(50)
            timesleep(15)
        LmGuide.received_data = "6"
        ser.write(LmGuide.received_data.encode())
        
        

        

        
        
        
  
# -




