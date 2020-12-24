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
    XIN0 at 0 0 0
    XIN1 at 0 0 0
    XIN3 at 0 0 0
    XIN4 at 0 0 0
    XIN5 at 0 0 0
    YOUT1 at 0 0 0
    YOUT2 at 0 0 0
    YOUT3 at 0 0 0
    YOUT4 at 0 0 0
    YOUT5 at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS XIN0 0 0
  COIL YOUT1 0 0 0 0
END
RUNG 2
  CONTACTS YOUT1 0 0
  CONTACTS XIN1 0 0
  PARALLEL
    COIL YOUT1 0 0 0 0
    COIL YOUT2 0 0 0 0
  END
END
RUNG 3
  CONTACTS YOUT1 0 0
  CONTACTS XIN3 0 0
  COIL YOUT3 0 0 0 0
END
RUNG 4
  CONTACTS YOUT2 0 0
  CONTACTS XIN4 0 0
  COIL YOUT4 0 0 0 0
END
RUNG 5
  PARALLEL
    CONTACTS YOUT3 0 0
    CONTACTS YOUT4 0 0
  END
  CONTACTS XIN5 0 0
  COIL YOUT5 0 0 0 0
END
