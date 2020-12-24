LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz

PULL-UP LIST
END

VAR LIST
    1 bytes Citem_counter 	Now not used !!!
    1 bytes Cnew 	Now not used !!!
    1 bytes Cnewitem_counter 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes Tstandby_time 	Now not used !!!
END

IO LIST
    Xphoto_sensor at 0 0 0
    Xstart at 0 0 0
    Xstop at 0 0 0
    Yconveyor_1 at 0 0 0
    Yconveyor_2 at 0 0 0
    Ymachine_on at 0 0 0
    Ystandby at 0 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    CONTACTS Xstart 0 0
    CONTACTS Ymachine_on 0 0
  END
  CONTACTS Xstop 1 0
  COIL Ymachine_on 0 0 0 0
END
RUNG 2
  CONTACTS Ymachine_on 0 0
  CONTACTS Ystandby 1 0
  COIL Yconveyor_1 0 0 0 0
END
RUNG 3
  CONTACTS Ymachine_on 0 0
  CONTACTS Ystandby 0 0
  COIL Yconveyor_2 0 0 0 0
END
RUNG 4
  CONTACTS Xphoto_sensor 0 0
  CTU Citem_counter 15 0 /
  COIL Ystandby 0 1 0 0
END
RUNG 5
  CONTACTS Ystandby 0 0
  RTO Tstandby_time 25000000 0
  PARALLEL
    COIL Ystandby 0 0 1 0
    RES Citem_counter
    RES Tstandby_time
  END
END
