LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz

PULL-UP LIST
END

VAR LIST
    2 bytes Cnew 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes src 	Now not used !!!
END

IO LIST
    X400 at 0 0 0
    X401 at 0 0 0
    X402 at 0 0 0
    Y430 at 0 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    SERIES
      CONTACTS X400 0 0
      CONTACTS X401 0 0
    END
    CONTACTS X402 0 0
  END
  COIL Y430 0 0 0 0
END
RUNG 2
  PARALLEL
    CONTACTS X400 0 0
    CONTACTS X402 0 0
  END
  CONTACTS X401 0 0
  COIL Y430 0 0 0 0
END
