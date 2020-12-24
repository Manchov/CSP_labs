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
    XManuel_Auto at 0 0 0
    XON_OFF at 0 0 0
    Xhigh_level at 0 0 0
    Xlow_level at 0 0 0
    YGreenLight at 0 0 0
    YRedLight at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS RPump 0 0
  COIL YGreenLight 0 0 0 0
END
RUNG 2
  CONTACTS Xlow_level 1 0
  COIL YRedLight 0 0 0 0
END
RUNG 3
  CONTACTS Xhigh_level 0 0
  COIL YGreenLight 0 0 0 0
END
RUNG 4
  PARALLEL
    SERIES
      CONTACTS XManuel_Auto 1 0
      CONTACTS Xlow_level 0 0
    END
    SERIES
      CONTACTS XManuel_Auto 0 0
      CONTACTS Rvalve 0 0
    END
  END
  CONTACTS XON_OFF 0 0
  COIL RPump 0 0 0 0
END
RUNG 5
  CONTACTS XManuel_Auto 0 0
  CONTACTS Xhigh_level 0 0
  COIL Rvalve 0 0 1 0
END
RUNG 6
  PARALLEL
    SERIES
      CONTACTS XManuel_Auto 0 0
      CONTACTS Xlow_level 1 0
    END
    CONTACTS XManuel_Auto 1 0
  END
  COIL Rvalve 0 1 0 0
END
