   0:# INIT TABLES
   8:# 
   9:# ======= START RUNG 1 =======
  10:LabelRung1:
  11:
  12:set bit '$rung_top'
  14:# start series [
  15:# ELEM_CONTACTS
  16:if not 'Xkeys' {
  17:    clear bit '$rung_top'
  18:}
  20:# ELEM_CONTACTS
  21:if not 'Xonoff' {
  22:    clear bit '$rung_top'
  23:}
  25:# ELEM_COIL
  26:let bit 'Yengine' := '$rung_top'
  28:# ] finish series
  29:# 
  30:# ======= START RUNG 2 =======
  31:LabelRung2:
  32:
  33:set bit '$rung_top'
  35:# start series [
  36:# ELEM_CONTACTS
  37:if not 'Yengine' {
  38:    clear bit '$rung_top'
  39:}
  41:# ELEM_COIL
  42:if '$rung_top' {
  43:    set bit 'Rlights'
  44:}
  46:# ] finish series
  47:# 
  48:# ======= START RUNG 3 =======
  49:LabelRung3:
  50:
  51:set bit '$rung_top'
  53:# start series [
  54:# ELEM_CONTACTS
  55:if not 'Xkeys' {
  56:    clear bit '$rung_top'
  57:}
  59:# ELEM_CONTACTS
  60:if 'Rlights' {
  61:    clear bit '$rung_top'
  62:}
  64:# ELEM_COIL
  65:let bit 'Ysound' := '$rung_top'
  67:# ] finish series
  68:# 
  69:# ======= START RUNG 4 =======
  70:LabelRung4:
  71:
  72:set bit '$rung_top'
  74:# start series [
  75:# start parallel [
  76:let bit '$parThis_0' := '$rung_top'
  77:# start series [
  78:# ELEM_CONTACTS
  79:if not 'Xkeys' {
  80:    clear bit '$parThis_0'
  81:}
  83:# ELEM_COIL
  84:if '$parThis_0' {
  85:    if not '$once_0_TTRIGGER_Rint_light' {
  86:        set bit '$once_0_TTRIGGER_Rint_light'
  87:        if 'Rint_light' {
  88:            clear bit 'Rint_light'
  89:        } else {
  90:            set bit 'Rint_light'
  91:        }
  92:    }
  93:} else {
  94:    clear bit '$once_0_TTRIGGER_Rint_light'
  95:}
  97:# ] finish series
  98:let bit '$parThis_0' := '$rung_top'
  99:# start series [
 100:# ELEM_CONTACTS
 101:if not 'Xkeys' {
 102:    clear bit '$parThis_0'
 103:}
 105:# ELEM_RTO
 106:if 'Tinside_timer' < '18000' {
 107:    if '$parThis_0' {
 108:        increment 'Tinside_timer'
 109:        clear bit '$parThis_0'
 110:    }
 111:} else {
 112:    set bit '$parThis_0'
 113:}
 115:# ELEM_CONTACTS
 116:if 'Yengine' {
 117:    clear bit '$parThis_0'
 118:}
 120:# start parallel [
 121:let bit '$parThis_1' := '$parThis_0'
 122:# ELEM_COIL
 123:if '$parThis_1' {
 124:    clear bit 'Rint_light'
 125:}
 127:# ELEM_RES
 128:if '$parThis_0' {
 129:    let var 'Tinside_timer' := 0
 130:}
 132:# ] finish parallel
 133:# ] finish series
 134:# ] finish parallel
 135:# ] finish series
 136:# 
 137:# ======= START RUNG 5 =======
 138:LabelRung5:
 139:
 140:set bit '$rung_top'
 142:# start series [
 143:# ELEM_CONTACTS
 144:if 'Xkeys' {
 145:    clear bit '$rung_top'
 146:}
 148:# ELEM_RTO
 149:if 'Tkeys_out' < '12000' {
 150:    if '$rung_top' {
 151:        increment 'Tkeys_out'
 152:        clear bit '$rung_top'
 153:    }
 154:} else {
 155:    set bit '$rung_top'
 156:}
 158:# ELEM_CONTACTS
 159:if 'Xkeys' {
 160:    clear bit '$rung_top'
 161:}
 163:# ELEM_COIL
 164:if '$rung_top' {
 165:    clear bit 'Rlights'
 166:}
 168:# ] finish series
 169:# 
 170:# ======= START RUNG 6 =======
 171:LabelRung6:
 172:
 173:set bit '$rung_top'
 175:# start series [
 176:# ELEM_CONTACTS
 177:if 'Rlights' {
 178:    clear bit '$rung_top'
 179:}
 181:# ELEM_RTO
 182:if 'Tlock_out' < '1800' {
 183:    if '$rung_top' {
 184:        increment 'Tlock_out'
 185:        clear bit '$rung_top'
 186:    }
 187:} else {
 188:    set bit '$rung_top'
 189:}
 191:# ELEM_CONTACTS
 192:if 'Xdoors_open' {
 193:    clear bit '$rung_top'
 194:}
 196:# ELEM_COIL
 197:let bit 'YLock_Car' := '$rung_top'
 199:# ] finish series
 200:LabelRung7:
 201:
 202:# Latest INT_OP here
