LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz

PULL-UP LIST
END

VAR LIST
    2 bytes Cnew 	Now not used !!!
    2 bytes I0 	Now not used !!!
    2 bytes Inew 	Now not used !!!
    2 bytes Mnew 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes var 	Now not used !!!
END

IO LIST
    XStart at 0 0 0
    XStop at 0 0 0
    YMotor at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS XStart 0 0
  CONTACTS XStop 1 0
  COIL R1 0 0 0 0
END
RUNG 2
  CONTACTS R1 0 0
  COIL YMotor 0 0 0 0
END
