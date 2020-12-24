LDmicro0.2
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x0
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz

PULL-UP LIST
END

VAR LIST
    2 bytes Tmixing 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
END

IO LIST
    Xhighlevel_sensor at 0 0 0
    Xlowerlevel_sensor at 0 0 0
    Xstart_button at 0 0 0
    Xstop_button at 0 0 0
    Ymachine_on at 0 0 0
    Ymotor at 0 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    CONTACTS Xstart_button 0 0
    CONTACTS Ymachine_on 0 0
  END
  CONTACTS Xstop_button 1 0
  COIL Ymachine_on 0 0 0 0
END
RUNG 2
  CONTACTS Xstop_button 0 0
  PARALLEL
    COIL Rmotor 0 0 1 0
    COIL Rinput_valve 0 0 1 0
    COIL Routput_valve 0 0 1 0
  END
END
RUNG 3
  CONTACTS Ymachine_on 0 0
  PARALLEL
    CONTACTS Xlowerlevel_sensor 0 0
    CONTACTS Xlowerlevel_sensor 1 0
  END
  CONTACTS Xhighlevel_sensor 1 0
  CONTACTS Ymotor 1 0
  CONTACTS Routput_valve 1 0
  COIL Rinput_valve 0 1 0 0
END
RUNG 4
  CONTACTS Rinput_valve 0 0
  CONTACTS Xhighlevel_sensor 1 0
  COIL Rinput_valve 0 0 1 0
END
RUNG 5
  CONTACTS Ymachine_on 0 0
  CONTACTS Xhighlevel_sensor 0 0
  CONTACTS Rinput_valve 1 0
  CONTACTS Routput_valve 1 0
  COIL Rmotor 0 1 0 0
END
RUNG 6
  CONTACTS Rmotor 0 0
  RTO Tmixing 2000000 0
  PARALLEL
    COIL Rmotor 0 0 1 0
    RES Tmixing
    COIL Routput_valve 0 1 0 0
  END
END
RUNG 7
  CONTACTS Routput_valve 0 0
  CONTACTS Xlowerlevel_sensor 1 0
  COIL Routput_valve 0 0 1 0
END
