   0:# INIT TABLES
   7:# 
   8:# ======= START RUNG 1 =======
   9:LabelRung1:
  10:
  11:set bit '$rung_top'
  13:# start series [
  14:# ELEM_CONTACTS
  15:if not 'Xkeys' {
  16:    clear bit '$rung_top'
  17:}
  19:# ELEM_CONTACTS
  20:if not 'Xonoff' {
  21:    clear bit '$rung_top'
  22:}
  24:# ELEM_COIL
  25:let bit 'Yengine' := '$rung_top'
  27:# ] finish series
  28:# 
  29:# ======= START RUNG 2 =======
  30:LabelRung2:
  31:
  32:set bit '$rung_top'
  34:# start series [
  35:# ELEM_CONTACTS
  36:if not 'Yengine' {
  37:    clear bit '$rung_top'
  38:}
  40:# ELEM_COIL
  41:let bit 'Rlights' := '$rung_top'
  43:# ] finish series
  44:# 
  45:# ======= START RUNG 3 =======
  46:LabelRung3:
  47:
  48:set bit '$rung_top'
  50:# start series [
  51:# ELEM_CONTACTS
  52:if not 'Xkeys' {
  53:    clear bit '$rung_top'
  54:}
  56:# ELEM_CONTACTS
  57:if 'Rlights' {
  58:    clear bit '$rung_top'
  59:}
  61:# ELEM_COIL
  62:let bit 'Ysound' := '$rung_top'
  64:# ] finish series
  65:# 
  66:# ======= START RUNG 4 =======
  67:LabelRung4:
  68:
  69:set bit '$rung_top'
  71:# start series [
  72:# start parallel [
  73:let bit '$parThis_0' := '$rung_top'
  74:# start series [
  75:# ELEM_CONTACTS
  76:if not 'Xkeys' {
  77:    clear bit '$parThis_0'
  78:}
  80:# ELEM_COIL
  81:if '$parThis_0' {
  82:    if not '$once_0_TTRIGGER_Rint_light' {
  83:        set bit '$once_0_TTRIGGER_Rint_light'
  84:        if 'Rint_light' {
  85:            clear bit 'Rint_light'
  86:        } else {
  87:            set bit 'Rint_light'
  88:        }
  89:    }
  90:} else {
  91:    clear bit '$once_0_TTRIGGER_Rint_light'
  92:}
  94:# ] finish series
  95:let bit '$parThis_0' := '$rung_top'
  96:# start series [
  97:# ELEM_CONTACTS
  98:if not 'Xkeys' {
  99:    clear bit '$parThis_0'
 100:}
 102:# ELEM_RTO
 103:if 'Tinside_timer' < '5' {
 104:    if '$parThis_0' {
 105:        increment 'Tinside_timer'
 106:        clear bit '$parThis_0'
 107:    }
 108:} else {
 109:    set bit '$parThis_0'
 110:}
 112:# ELEM_CONTACTS
 113:if 'Yengine' {
 114:    clear bit '$parThis_0'
 115:}
 117:# start parallel [
 118:let bit '$parThis_1' := '$parThis_0'
 119:# ELEM_COIL
 120:if '$parThis_1' {
 121:    clear bit 'Rint_light'
 122:}
 124:# ELEM_RES
 125:if '$parThis_0' {
 126:    let var 'Tinside_timer' := 0
 127:}
 129:# ] finish parallel
 130:# ] finish series
 131:# ] finish parallel
 132:# ] finish series
 133:# 
 134:# ======= START RUNG 5 =======
 135:LabelRung5:
 136:
 137:set bit '$rung_top'
 139:# start series [
 140:# ELEM_CONTACTS
 141:if not 'Ynew' {
 142:    clear bit '$rung_top'
 143:}
 145:# ] finish series
 146:LabelRung6:
 147:
 148:# Latest INT_OP here
