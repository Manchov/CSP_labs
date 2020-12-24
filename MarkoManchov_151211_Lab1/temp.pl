   0:# INIT TABLES
   7:# 
   8:# ======= START RUNG 1 =======
   9:LabelRung1:
  10:
  11:set bit '$rung_top'
  13:# start series [
  14:# ELEM_CONTACTS
  15:if not 'XIN0' {
  16:    clear bit '$rung_top'
  17:}
  19:# ELEM_COIL
  20:let bit 'YOUT1' := '$rung_top'
  22:# ] finish series
  23:# 
  24:# ======= START RUNG 2 =======
  25:LabelRung2:
  26:
  27:set bit '$rung_top'
  29:# start series [
  30:# ELEM_CONTACTS
  31:if not 'YOUT1' {
  32:    clear bit '$rung_top'
  33:}
  35:# ELEM_CONTACTS
  36:if not 'XIN1' {
  37:    clear bit '$rung_top'
  38:}
  40:# start parallel [
  41:let bit '$parThis_0' := '$rung_top'
  42:# ELEM_COIL
  43:let bit 'YOUT1' := '$parThis_0'
  45:let bit '$parThis_0' := '$rung_top'
  46:# ELEM_COIL
  47:let bit 'YOUT2' := '$parThis_0'
  49:# ] finish parallel
  50:# ] finish series
  51:# 
  52:# ======= START RUNG 3 =======
  53:LabelRung3:
  54:
  55:set bit '$rung_top'
  57:# start series [
  58:# ELEM_CONTACTS
  59:if not 'YOUT1' {
  60:    clear bit '$rung_top'
  61:}
  63:# ELEM_CONTACTS
  64:if not 'XIN3' {
  65:    clear bit '$rung_top'
  66:}
  68:# ELEM_COIL
  69:let bit 'YOUT3' := '$rung_top'
  71:# ] finish series
  72:# 
  73:# ======= START RUNG 4 =======
  74:LabelRung4:
  75:
  76:set bit '$rung_top'
  78:# start series [
  79:# ELEM_CONTACTS
  80:if not 'YOUT2' {
  81:    clear bit '$rung_top'
  82:}
  84:# ELEM_CONTACTS
  85:if not 'XIN4' {
  86:    clear bit '$rung_top'
  87:}
  89:# ELEM_COIL
  90:let bit 'YOUT4' := '$rung_top'
  92:# ] finish series
  93:# 
  94:# ======= START RUNG 5 =======
  95:LabelRung5:
  96:
  97:set bit '$rung_top'
  99:# start series [
 100:# start parallel [
 101:clear bit '$parOut_0'
 102:let bit '$parThis_1' := '$rung_top'
 103:# ELEM_CONTACTS
 104:if not 'YOUT3' {
 105:    clear bit '$parThis_1'
 106:}
 108:if '$parThis_1' {
 109:    set bit '$parOut_0'
 110:}
 111:let bit '$parThis_1' := '$rung_top'
 112:# ELEM_CONTACTS
 113:if not 'YOUT4' {
 114:    clear bit '$parThis_1'
 115:}
 117:if '$parThis_1' {
 118:    set bit '$parOut_0'
 119:}
 120:let bit '$rung_top' := '$parOut_0'
 121:# ] finish parallel
 122:# ELEM_CONTACTS
 123:if not 'XIN5' {
 124:    clear bit '$rung_top'
 125:}
 127:# ELEM_COIL
 128:let bit 'YOUT5' := '$rung_top'
 130:# ] finish series
 131:LabelRung6:
 132:
 133:# Latest INT_OP here
