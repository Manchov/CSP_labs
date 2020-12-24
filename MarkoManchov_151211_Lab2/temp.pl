   0:# INIT TABLES
   8:# 
   9:# ======= START RUNG 1 =======
  10:LabelRung1:
  11:
  12:set bit '$rung_top'
  14:# start series [
  15:# start parallel [
  16:clear bit '$parOut_0'
  17:let bit '$parThis_0' := '$rung_top'
  18:# ELEM_CONTACTS
  19:if not 'XStart' {
  20:    clear bit '$parThis_0'
  21:}
  23:if '$parThis_0' {
  24:    set bit '$parOut_0'
  25:}
  26:let bit '$parThis_0' := '$rung_top'
  27:# ELEM_CONTACTS
  28:if not 'RRun' {
  29:    clear bit '$parThis_0'
  30:}
  32:if '$parThis_0' {
  33:    set bit '$parOut_0'
  34:}
  35:let bit '$rung_top' := '$parOut_0'
  36:# ] finish parallel
  37:# ELEM_CONTACTS
  38:if 'XStop' {
  39:    clear bit '$rung_top'
  40:}
  42:# ELEM_COIL
  43:let bit 'RRun' := '$rung_top'
  45:# ] finish series
  46:# 
  47:# ======= START RUNG 2 =======
  48:LabelRung2:
  49:
  50:set bit '$rung_top'
  52:# start series [
  53:# ELEM_CONTACTS
  54:if not 'Xlevel_sensor' {
  55:    clear bit '$rung_top'
  56:}
  58:# ELEM_COIL
  59:let bit 'Yfull' := '$rung_top'
  61:# ] finish series
  62:# 
  63:# ======= START RUNG 3 =======
  64:LabelRung3:
  65:
  66:set bit '$rung_top'
  68:# start series [
  69:# ELEM_CONTACTS
  70:if 'Xphoto_sensor' {
  71:    clear bit '$rung_top'
  72:}
  74:# ELEM_COIL
  75:let bit 'Yboxes' := '$rung_top'
  77:# ] finish series
  78:# 
  79:# ======= START RUNG 4 =======
  80:LabelRung4:
  81:
  82:set bit '$rung_top'
  84:# start series [
  85:# ELEM_CONTACTS
  86:if not 'RRun' {
  87:    clear bit '$rung_top'
  88:}
  90:# ELEM_CONTACTS
  91:if not 'Yboxes' {
  92:    clear bit '$rung_top'
  93:}
  95:# ELEM_CONTACTS
  96:if not 'Yfull' {
  97:    clear bit '$rung_top'
  98:}
 100:# start parallel [
 101:let bit '$parThis_1' := '$rung_top'
 102:# ELEM_COIL
 103:let bit 'YConveyor' := '$parThis_1'
 105:let bit '$parThis_1' := '$rung_top'
 106:# ELEM_COIL
 107:let bit 'YSolenoid' := '$parThis_1'
 109:let bit '$parThis_1' := '$rung_top'
 110:# ELEM_COIL
 111:let bit 'YGreenLight' := '$parThis_1'
 113:# ] finish parallel
 114:# ] finish series
 115:# 
 116:# ======= START RUNG 5 =======
 117:LabelRung5:
 118:
 119:set bit '$rung_top'
 121:# start series [
 122:# ELEM_CONTACTS
 123:if 'RRun' {
 124:    clear bit '$rung_top'
 125:}
 127:# ELEM_CONTACTS
 128:if not 'Yboxes' {
 129:    clear bit '$rung_top'
 130:}
 132:# ELEM_CONTACTS
 133:if not 'Yfull' {
 134:    clear bit '$rung_top'
 135:}
 137:# ELEM_COIL
 138:let bit 'YRedLight' := '$rung_top'
 140:# ] finish series
 141:# 
 142:# ======= START RUNG 6 =======
 143:LabelRung6:
 144:
 145:set bit '$rung_top'
 147:# start series [
 148:# ELEM_CONTACTS
 149:if not 'Yfull' {
 150:    clear bit '$rung_top'
 151:}
 153:# ELEM_COIL
 154:let bit 'YYellowLight' := '$rung_top'
 156:# ] finish series
 157:LabelRung7:
 158:
 159:# Latest INT_OP here
