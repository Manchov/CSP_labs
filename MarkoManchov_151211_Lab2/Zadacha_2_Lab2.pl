   0:# INIT TABLES
   8:# 
   9:# ======= START RUNG 1 =======
  10:LabelRung1:
  11:
  12:set bit '$rung_top'
  14:# start series [
  15:# ELEM_CONTACTS
  16:if not 'RPump' {
  17:    clear bit '$rung_top'
  18:}
  20:# ELEM_COIL
  21:let bit 'YGreenLight' := '$rung_top'
  23:# ] finish series
  24:# 
  25:# ======= START RUNG 2 =======
  26:LabelRung2:
  27:
  28:set bit '$rung_top'
  30:# start series [
  31:# ELEM_CONTACTS
  32:if 'Xlow_level' {
  33:    clear bit '$rung_top'
  34:}
  36:# ELEM_COIL
  37:let bit 'YRedLight' := '$rung_top'
  39:# ] finish series
  40:# 
  41:# ======= START RUNG 3 =======
  42:LabelRung3:
  43:
  44:set bit '$rung_top'
  46:# start series [
  47:# ELEM_CONTACTS
  48:if not 'Xhigh_level' {
  49:    clear bit '$rung_top'
  50:}
  52:# ELEM_COIL
  53:let bit 'YGreenLight' := '$rung_top'
  55:# ] finish series
  56:# 
  57:# ======= START RUNG 4 =======
  58:LabelRung4:
  59:
  60:set bit '$rung_top'
  62:# start series [
  63:# start parallel [
  64:clear bit '$parOut_0'
  65:let bit '$parThis_0' := '$rung_top'
  66:# start series [
  67:# ELEM_CONTACTS
  68:if 'XManuel_Auto' {
  69:    clear bit '$parThis_0'
  70:}
  72:# ELEM_CONTACTS
  73:if not 'Xlow_level' {
  74:    clear bit '$parThis_0'
  75:}
  77:# ] finish series
  78:if '$parThis_0' {
  79:    set bit '$parOut_0'
  80:}
  81:let bit '$parThis_0' := '$rung_top'
  82:# start series [
  83:# ELEM_CONTACTS
  84:if not 'XManuel_Auto' {
  85:    clear bit '$parThis_0'
  86:}
  88:# ELEM_CONTACTS
  89:if not 'Rvalve' {
  90:    clear bit '$parThis_0'
  91:}
  93:# ] finish series
  94:if '$parThis_0' {
  95:    set bit '$parOut_0'
  96:}
  97:let bit '$rung_top' := '$parOut_0'
  98:# ] finish parallel
  99:# ELEM_CONTACTS
 100:if not 'XON_OFF' {
 101:    clear bit '$rung_top'
 102:}
 104:# ELEM_COIL
 105:let bit 'RPump' := '$rung_top'
 107:# ] finish series
 108:# 
 109:# ======= START RUNG 5 =======
 110:LabelRung5:
 111:
 112:set bit '$rung_top'
 114:# start series [
 115:# ELEM_CONTACTS
 116:if not 'XManuel_Auto' {
 117:    clear bit '$rung_top'
 118:}
 120:# ELEM_CONTACTS
 121:if not 'Xhigh_level' {
 122:    clear bit '$rung_top'
 123:}
 125:# ELEM_COIL
 126:if '$rung_top' {
 127:    clear bit 'Rvalve'
 128:}
 130:# ] finish series
 131:# 
 132:# ======= START RUNG 6 =======
 133:LabelRung6:
 134:
 135:set bit '$rung_top'
 137:# start series [
 138:# start parallel [
 139:clear bit '$parOut_1'
 140:let bit '$parThis_1' := '$rung_top'
 141:# start series [
 142:# ELEM_CONTACTS
 143:if not 'XManuel_Auto' {
 144:    clear bit '$parThis_1'
 145:}
 147:# ELEM_CONTACTS
 148:if 'Xlow_level' {
 149:    clear bit '$parThis_1'
 150:}
 152:# ] finish series
 153:if '$parThis_1' {
 154:    set bit '$parOut_1'
 155:}
 156:let bit '$parThis_1' := '$rung_top'
 157:# ELEM_CONTACTS
 158:if 'XManuel_Auto' {
 159:    clear bit '$parThis_1'
 160:}
 162:if '$parThis_1' {
 163:    set bit '$parOut_1'
 164:}
 165:let bit '$rung_top' := '$parOut_1'
 166:# ] finish parallel
 167:# ELEM_COIL
 168:if '$rung_top' {
 169:    set bit 'Rvalve'
 170:}
 172:# ] finish series
 173:LabelRung7:
 174:
 175:# Latest INT_OP here
