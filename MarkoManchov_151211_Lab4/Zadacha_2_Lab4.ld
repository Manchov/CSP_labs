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
    2 bytes Theater_off 	Now not used !!!
    2 bytes Theater_off1 	Now not used !!!
    3 bytes Theater_off2 	Now not used !!!
    3 bytes Theater_off3 	Now not used !!!
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
    X100t_sensor at 0 0 0
    X50t_sensor at 0 0 0
    X70t_sensor at 0 0 0
    X80t_sensor at 0 0 0
    XEstop at 0 0 0
    XStart at 0 0 0
    Ysystem_on at 0 0 0
END

PROGRAM
RUNG 1
  CONTACTS XStart 0 0
  CONTACTS XEstop 1 0
  COIL Ysystem_on 0 0 0 0
END
RUNG 2
  CONTACTS XEstop 0 0
  PARALLEL
    COIL Rheater_1 0 0 1 0
    COIL Rheater_2 0 0 1 0
    COIL Rheater_3 0 0 1 0
  END
END
RUNG 3
  CONTACTS Ysystem_on 0 0
  CONTACTS X50t_sensor 1 0
  CONTACTS X70t_sensor 1 0
  CONTACTS X80t_sensor 1 0
  CONTACTS X100t_sensor 1 0
  PARALLEL
    COIL Rheater_1 0 1 0 0
    COIL Rheater_2 0 1 0 0
    COIL Rheater_3 0 1 0 0
  END
END
RUNG 4
  CONTACTS Rheater_1 0 0
  CONTACTS Rheater_2 0 0
  CONTACTS Rheater_3 0 0
  RTO Theater_off3 600000000 0
  PARALLEL
    COIL Rheater_1 0 0 1 0
    COIL Rheater_2 0 0 1 0
    COIL Rheater_3 0 0 1 0
  END
END
RUNG 5
  CONTACTS Ysystem_on 0 0
  CONTACTS X50t_sensor 0 0
  CONTACTS X70t_sensor 1 0
  CONTACTS X80t_sensor 1 0
  CONTACTS X100t_sensor 1 0
  PARALLEL
    COIL Rheater_1 0 1 0 0
    COIL Rheater_2 0 1 0 0
  END
END
RUNG 6
  CONTACTS Rheater_1 0 0
  CONTACTS Rheater_2 0 0
  RTO Theater_off2 420000000 0
  PARALLEL
    COIL Rheater_1 0 0 1 0
    COIL Rheater_2 0 0 1 0
  END
END
RUNG 7
  CONTACTS Ysystem_on 0 0
  CONTACTS X50t_sensor 0 0
  CONTACTS X70t_sensor 0 0
  CONTACTS X80t_sensor 1 0
  CONTACTS X100t_sensor 1 0
  COIL Rheater_1 0 1 0 0
END
RUNG 8
  CONTACTS Rheater_1 0 0
  RTO Theater_off1 300000000 0
  CONTACTS X100t_sensor 0 0
  COIL Rheater_1 0 0 1 0
END
