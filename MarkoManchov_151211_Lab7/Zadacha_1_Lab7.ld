LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz

PULL-UP LIST
END

VAR LIST
    2 bytes Citem_counter 	Now not used !!!
    1 bytes Cnew 	Now not used !!!
    1 bytes Cnewitem_counter 	Now not used !!!
    2 bytes Tgate_on_timer 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes Tstandby_time 	Now not used !!!
END

IO LIST
    Xmachine_on at 0 0 0
    Xproxy_sensor at 0 0 0
    Xreset at 0 0 0
    Xstart at 0 0 0
    Xstop at 0 0 0
    Ygate_shift at 0 0 0
    Ymachine_on at 0 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    CONTACTS Xstart 0 0
    CONTACTS Xmachine_on 0 0
  END
  CONTACTS Xstop 1 0
  COIL Ymachine_on 0 0 0 0
END
RUNG 2
  CONTACTS Xreset 0 0
  PARALLEL
    COIL Ygate_shift 0 0 1 0
    RES Citem_counter
    RES Tgate_on_timer
  END
END
RUNG 3
  CONTACTS Ymachine_on 0 0
  COIL Rconveyor_motor 0 0 0 0
END
RUNG 4
  CONTACTS Xproxy_sensor 0 0
  CTU Citem_counter 1000 0 /
  CONTACTS Rconveyor_motor 0 0
  COIL Ygate_shift 0 1 0 0
END
RUNG 5
  CONTACTS Ygate_shift 0 0
  RTO Tgate_on_timer 2000000 0
  CONTACTS Rconveyor_motor 0 0
  PARALLEL
    COIL Ygate_shift 0 0 1 0
    RES Citem_counter
    RES Tgate_on_timer
  END
END
