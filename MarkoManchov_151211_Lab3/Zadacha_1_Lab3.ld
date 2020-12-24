LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILER=IHEX

PULL-UP LIST
END

VAR LIST
    2 bytes Cnew 	Now not used !!!
    2 bytes I0 	Now not used !!!
    2 bytes Inew 	Now not used !!!
    2 bytes Ivalve 	Now not used !!!
    2 bytes M 	Now not used !!!
    2 bytes MValve 	Now not used !!!
    2 bytes Mnew 	Now not used !!!
    2 bytes Mvalve 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes duty_cycle 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes var 	Now not used !!!
END

IO LIST
    XStart at 0 0 0
    XStop at 0 0 0
    Xlevel_sensor at 0 0 0
    Xphoto_sensor at 0 0 0
    YConveyor at 0 0 0
    YGreenLight at 0 0 0
    YRedLight at 0 0 0
    YSolenoid at 0 0 0
    YYellowLight at 0 0 0
    Yboxes at 0 0 0
    Yfull at 0 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    CONTACTS XStart 0 0
    CONTACTS RRun 0 0
  END
  CONTACTS XStop 1 0
  COIL RRun 0 0 0 0
END
RUNG 2
  CONTACTS Xlevel_sensor 0 0
  COIL Yfull 0 0 0 0
END
RUNG 3
  CONTACTS Xphoto_sensor 1 0
  COIL Yboxes 0 0 0 0
END
RUNG 4
  CONTACTS RRun 0 0
  CONTACTS Yboxes 0 0
  CONTACTS Yfull 0 0
  PARALLEL
    COIL YConveyor 0 0 0 0
    COIL YSolenoid 0 0 0 0
    COIL YGreenLight 0 0 0 0
  END
END
RUNG 5
  CONTACTS RRun 1 0
  CONTACTS Yboxes 0 0
  CONTACTS Yfull 0 0
  COIL YRedLight 0 0 0 0
END
RUNG 6
  CONTACTS Yfull 0 0
  COIL YYellowLight 0 0 0 0
END
