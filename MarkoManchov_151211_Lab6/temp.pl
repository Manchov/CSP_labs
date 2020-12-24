   0:# INIT TABLES
   1:# INIT VARS
   2:if not '$once_0_INIT_VARS' {
   3:    set bit '$once_0_INIT_VARS'
   4:    let var 'Citem_counter' := 0
   5:}
  12:# 
  13:# ======= START RUNG 1 =======
  14:LabelRung1:
  15:
  16:set bit '$rung_top'
  18:# start series [
  19:# start parallel [
  20:clear bit '$parOut_0'
  21:let bit '$parThis_0' := '$rung_top'
  22:# ELEM_CONTACTS
  23:if not 'Xstart' {
  24:    clear bit '$parThis_0'
  25:}
  27:if '$parThis_0' {
  28:    set bit '$parOut_0'
  29:}
  30:let bit '$parThis_0' := '$rung_top'
  31:# ELEM_CONTACTS
  32:if not 'Xmachine_on' {
  33:    clear bit '$parThis_0'
  34:}
  36:if '$parThis_0' {
  37:    set bit '$parOut_0'
  38:}
  39:let bit '$rung_top' := '$parOut_0'
  40:# ] finish parallel
  41:# ELEM_CONTACTS
  42:if 'Xstop' {
  43:    clear bit '$rung_top'
  44:}
  46:# ELEM_COIL
  47:let bit 'Ymachine_on' := '$rung_top'
  49:# ] finish series
  50:# 
  51:# ======= START RUNG 2 =======
  52:LabelRung2:
  53:
  54:set bit '$rung_top'
  56:# start series [
  57:# ELEM_CONTACTS
  58:if not 'Xreset' {
  59:    clear bit '$rung_top'
  60:}
  62:# start parallel [
  63:let bit '$parThis_1' := '$rung_top'
  64:# ELEM_COIL
  65:if '$parThis_1' {
  66:    clear bit 'Ygate_shift'
  67:}
  69:# ELEM_RES
  70:if '$rung_top' {
  71:    let var 'Citem_counter' := 0
  72:}
  74:# ELEM_RES
  75:if '$rung_top' {
  76:    let var 'Tgate_on_timer' := 0
  77:}
  79:# ] finish parallel
  80:# ] finish series
  81:# 
  82:# ======= START RUNG 3 =======
  83:LabelRung3:
  84:
  85:set bit '$rung_top'
  87:# start series [
  88:# ELEM_CONTACTS
  89:if not 'Ymachine_on' {
  90:    clear bit '$rung_top'
  91:}
  93:# ELEM_COIL
  94:let bit 'Rconveyor_motor' := '$rung_top'
  96:# ] finish series
  97:# 
  98:# ======= START RUNG 4 =======
  99:LabelRung4:
 100:
 101:set bit '$rung_top'
 103:# start series [
 104:# ELEM_CONTACTS
 105:if not 'Xproxy_sensor' {
 106:    clear bit '$rung_top'
 107:}
 109:# ELEM_CTU
 110:if '$rung_top' {
 111:    if not '$once_1_CTU_Citem_counter' {
 112:        set bit '$once_1_CTU_Citem_counter'
 113:        if 'Citem_counter' < '1000' {
 114:            increment 'Citem_counter'
 115:        }
 116:    }
 117:} else {
 118:    clear bit '$once_1_CTU_Citem_counter'
 119:}
 120:if 'Citem_counter' < '1000' {
 121:    clear bit '$rung_top'
 122:} else {
 123:    set bit '$rung_top'
 124:}
 126:# ELEM_CONTACTS
 127:if not 'Rconveyor_motor' {
 128:    clear bit '$rung_top'
 129:}
 131:# ELEM_COIL
 132:if '$rung_top' {
 133:    set bit 'Ygate_shift'
 134:}
 136:# ] finish series
 137:# 
 138:# ======= START RUNG 5 =======
 139:LabelRung5:
 140:
 141:set bit '$rung_top'
 143:# start series [
 144:# ELEM_CONTACTS
 145:if not 'Ygate_shift' {
 146:    clear bit '$rung_top'
 147:}
 149:# ELEM_RTO
 150:if 'Tgate_on_timer' < '200' {
 151:    if '$rung_top' {
 152:        increment 'Tgate_on_timer'
 153:        clear bit '$rung_top'
 154:    }
 155:} else {
 156:    set bit '$rung_top'
 157:}
 159:# ELEM_CONTACTS
 160:if not 'Rconveyor_motor' {
 161:    clear bit '$rung_top'
 162:}
 164:# start parallel [
 165:let bit '$parThis_2' := '$rung_top'
 166:# ELEM_COIL
 167:if '$parThis_2' {
 168:    clear bit 'Ygate_shift'
 169:}
 171:# ELEM_RES
 172:if '$rung_top' {
 173:    let var 'Citem_counter' := 0
 174:}
 176:# ELEM_RES
 177:if '$rung_top' {
 178:    let var 'Tgate_on_timer' := 0
 179:}
 181:# ] finish parallel
 182:# ] finish series
 183:LabelRung6:
 184:
 185:# Latest INT_OP here
