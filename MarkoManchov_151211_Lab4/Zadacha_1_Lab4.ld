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
    2 bytes Tinside_timer 	Now not used !!!
    2 bytes Tkeys_out 	Now not used !!!
    2 bytes Tlock_out 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes duty_cycle 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes var 	Now not used !!!
END

IO LIST
    Xdoors_open at 0 0 0
    Xkeys at 0 0 0
    Xonoff at 0 0 0
    YLock_Car at 0 0 0
    Yengine at 0 0 0
    Ysound at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS Xkeys 0 0
  CONTACTS Xonoff 0 0
  COIL Yengine 0 0 0 0
END
RUNG 2
  CONTACTS Yengine 0 0
  COIL Rlights 0 1 0 0
END
RUNG 3
  CONTACTS Xkeys 0 0
  CONTACTS Rlights 1 0
  COIL Ysound 0 0 0 0
END
RUNG 4
  PARALLEL
    SERIES
      CONTACTS Xkeys 0 0
      COIL Rint_light 0 0 0 1
    END
    SERIES
      CONTACTS Xkeys 0 0
      RTO Tinside_timer 180000000 0
      CONTACTS Yengine 1 0
      PARALLEL
        COIL Rint_light 0 0 1 0
        RES Tinside_timer
      END
    END
  END
END
RUNG 5
  CONTACTS Xkeys 1 0
  RTO Tkeys_out 120000000 0
  CONTACTS Xkeys 1 0
  COIL Rlights 0 0 1 0
END
RUNG 6
  CONTACTS Rlights 1 0
  RTO Tlock_out 18000000 0
  CONTACTS Xdoors_open 1 0
  COIL YLock_Car 0 0 0 0
END
