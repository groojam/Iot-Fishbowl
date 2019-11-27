import RPi.GPIO as GPIO



class relay:

    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    RELAIS_1_GPIO = 17
    RELAIS_2_GPIO = 18
    RELAIS_3_GPIO = 27

    GPIO.setup(RELAIS_1_GPIO, GPIO.OUT)
    GPIO.setup(RELAIS_2_GPIO, GPIO.OUT)
    GPIO.setup(RELAIS_3_GPIO, GPIO.OUT)

    def ctrl(self, pctrl, toggle):
        if (pctrl == 1 and toggle == 1):
            GPIO.output(RELAIS_1_GPIO, GPIO.LOW)
        elif (pctrl == 1 and toggle == 0):
            GPIO.output(RELAIS_1_GPIO, GPIO.HIGH)
        elif (pctrl == 2 and toggle == 1):
            GPIO.output(RELAIS_2_GPIO, GPIO.LOW)
        elif (pctrl == 2 and toggle == 0):
            GPIO.output(RELAIS_2_GPIO, GPIO.HIGH)
        elif (pctrl == 3 and toggle == 1):
            GPIO.output(RELAIS_3_GPIO, GPIO.LOW)
        elif (pctrl == 3 and toggle == 0):
            GPIO.output(RELAIS_3_GPIO, GPIO.HIGH)         

#GPIO.output( switch case 
#GPIO.HIGH / LOW => OFF = 1 ON = 0