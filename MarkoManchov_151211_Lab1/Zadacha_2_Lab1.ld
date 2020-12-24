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
    X0 at 0 0 0
    YQ20 at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS X0 0 0
  CONTACTS R1 1 0
  COIL R0 0 0 0 0
END
RUNG 2
  PARALLEL
    CONTACTS X0 1 0
    CONTACTS R0 0 0
  END
  COIL YQ20 0 0 0 0
END
RUNG 3
  COMMENT -------------
END
RUNG 4
  CONTACTS X0 0 0
  CONTACTS RB1 1 0
  COIL RB0 0 0 0 0
END
RUNG 5
  CONTACTS RB0 0 0
  COIL RB1 0 1 0 0
END
RUNG 6
  CONTACTS X0 1 0
  COIL RB1 0 0 1 0
END
