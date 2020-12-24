   0:# INIT TABLES
  10:# 
  11:# ======= START RUNG 1 =======
  12:LabelRung1:
  13:
  14:set bit '$rung_top'
  16:# start series [
  17:# ELEM_CONTACTS
  18:if not 'XStart' {
  19:    clear bit '$rung_top'
  20:}
  22:# ELEM_CONTACTS
  23:if 'XEstop' {
  24:    clear bit '$rung_top'
  25:}
  27:# ELEM_COIL
  28:let bit 'Ysystem_on' := '$rung_top'
  30:# ] finish series
  31:# 
  32:# ======= START RUNG 2 =======
  33:LabelRung2:
  34:
  35:set bit '$rung_top'
  37:# start series [
  38:# ELEM_CONTACTS
  39:if not 'XEstop' {
  40:    clear bit '$rung_top'
  41:}
  43:# start parallel [
  44:let bit '$parThis_0' := '$rung_top'
  45:# ELEM_COIL
  46:if '$parThis_0' {
  47:    clear bit 'Rheater_1'
  48:}
  50:let bit '$parThis_0' := '$rung_top'
  51:# ELEM_COIL
  52:if '$parThis_0' {
  53:    clear bit 'Rheater_2'
  54:}
  56:let bit '$parThis_0' := '$rung_top'
  57:# ELEM_COIL
  58:if '$parThis_0' {
  59:    clear bit 'Rheater_3'
  60:}
  62:# ] finish parallel
  63:# ] finish series
  64:# 
  65:# ======= START RUNG 3 =======
  66:LabelRung3:
  67:
  68:set bit '$rung_top'
  70:# start series [
  71:# ELEM_CONTACTS
  72:if not 'Ysystem_on' {
  73:    clear bit '$rung_top'
  74:}
  76:# ELEM_CONTACTS
  77:if 'X50t_sensor' {
  78:    clear bit '$rung_top'
  79:}
  81:# ELEM_CONTACTS
  82:if 'X70t_sensor' {
  83:    clear bit '$rung_top'
  84:}
  86:# ELEM_CONTACTS
  87:if 'X80t_sensor' {
  88:    clear bit '$rung_top'
  89:}
  91:# ELEM_CONTACTS
  92:if 'X100t_sensor' {
  93:    clear bit '$rung_top'
  94:}
  96:# start parallel [
  97:let bit '$parThis_1' := '$rung_top'
  98:# ELEM_COIL
  99:if '$parThis_1' {
 100:    set bit 'Rheater_1'
 101:}
 103:let bit '$parThis_1' := '$rung_top'
 104:# ELEM_COIL
 105:if '$parThis_1' {
 106:    set bit 'Rheater_2'
 107:}
 109:let bit '$parThis_1' := '$rung_top'
 110:# ELEM_COIL
 111:if '$parThis_1' {
 112:    set bit 'Rheater_3'
 113:}
 115:# ] finish parallel
 116:# ] finish series
 117:# 
 118:# ======= START RUNG 4 =======
 119:LabelRung4:
 120:
 121:set bit '$rung_top'
 123:# start series [
 124:# ELEM_CONTACTS
 125:if not 'Rheater_1' {
 126:    clear bit '$rung_top'
 127:}
 129:# ELEM_CONTACTS
 130:if not 'Rheater_2' {
 131:    clear bit '$rung_top'
 132:}
 134:# ELEM_CONTACTS
 135:if not 'Rheater_3' {
 136:    clear bit '$rung_top'
 137:}
 139:# ELEM_RTO
 140:if 'Theater_off3' < '60000' {
 141:    if '$rung_top' {
 142:        increment 'Theater_off3'
 143:        clear bit '$rung_top'
 144:    }
 145:} else {
 146:    set bit '$rung_top'
 147:}
 149:# start parallel [
 150:let bit '$parThis_2' := '$rung_top'
 151:# ELEM_COIL
 152:if '$parThis_2' {
 153:    clear bit 'Rheater_1'
 154:}
 156:let bit '$parThis_2' := '$rung_top'
 157:# ELEM_COIL
 158:if '$parThis_2' {
 159:    clear bit 'Rheater_2'
 160:}
 162:let bit '$parThis_2' := '$rung_top'
 163:# ELEM_COIL
 164:if '$parThis_2' {
 165:    clear bit 'Rheater_3'
 166:}
 168:# ] finish parallel
 169:# ] finish series
 170:# 
 171:# ======= START RUNG 5 =======
 172:LabelRung5:
 173:
 174:set bit '$rung_top'
 176:# start series [
 177:# ELEM_CONTACTS
 178:if not 'Ysystem_on' {
 179:    clear bit '$rung_top'
 180:}
 182:# ELEM_CONTACTS
 183:if not 'X50t_sensor' {
 184:    clear bit '$rung_top'
 185:}
 187:# ELEM_CONTACTS
 188:if 'X70t_sensor' {
 189:    clear bit '$rung_top'
 190:}
 192:# ELEM_CONTACTS
 193:if 'X80t_sensor' {
 194:    clear bit '$rung_top'
 195:}
 197:# ELEM_CONTACTS
 198:if 'X100t_sensor' {
 199:    clear bit '$rung_top'
 200:}
 202:# start parallel [
 203:let bit '$parThis_3' := '$rung_top'
 204:# ELEM_COIL
 205:if '$parThis_3' {
 206:    set bit 'Rheater_1'
 207:}
 209:let bit '$parThis_3' := '$rung_top'
 210:# ELEM_COIL
 211:if '$parThis_3' {
 212:    set bit 'Rheater_2'
 213:}
 215:# ] finish parallel
 216:# ] finish series
 217:# 
 218:# ======= START RUNG 6 =======
 219:LabelRung6:
 220:
 221:set bit '$rung_top'
 223:# start series [
 224:# ELEM_CONTACTS
 225:if not 'Rheater_1' {
 226:    clear bit '$rung_top'
 227:}
 229:# ELEM_CONTACTS
 230:if not 'Rheater_2' {
 231:    clear bit '$rung_top'
 232:}
 234:# ELEM_RTO
 235:if 'Theater_off2' < '42000' {
 236:    if '$rung_top' {
 237:        increment 'Theater_off2'
 238:        clear bit '$rung_top'
 239:    }
 240:} else {
 241:    set bit '$rung_top'
 242:}
 244:# start parallel [
 245:let bit '$parThis_4' := '$rung_top'
 246:# ELEM_COIL
 247:if '$parThis_4' {
 248:    clear bit 'Rheater_1'
 249:}
 251:let bit '$parThis_4' := '$rung_top'
 252:# ELEM_COIL
 253:if '$parThis_4' {
 254:    clear bit 'Rheater_2'
 255:}
 257:# ] finish parallel
 258:# ] finish series
 259:# 
 260:# ======= START RUNG 7 =======
 261:LabelRung7:
 262:
 263:set bit '$rung_top'
 265:# start series [
 266:# ELEM_CONTACTS
 267:if not 'Ysystem_on' {
 268:    clear bit '$rung_top'
 269:}
 271:# ELEM_CONTACTS
 272:if not 'X50t_sensor' {
 273:    clear bit '$rung_top'
 274:}
 276:# ELEM_CONTACTS
 277:if not 'X70t_sensor' {
 278:    clear bit '$rung_top'
 279:}
 281:# ELEM_CONTACTS
 282:if 'X80t_sensor' {
 283:    clear bit '$rung_top'
 284:}
 286:# ELEM_CONTACTS
 287:if 'X100t_sensor' {
 288:    clear bit '$rung_top'
 289:}
 291:# ELEM_COIL
 292:if '$rung_top' {
 293:    set bit 'Rheater_1'
 294:}
 296:# ] finish series
 297:# 
 298:# ======= START RUNG 8 =======
 299:LabelRung8:
 300:
 301:set bit '$rung_top'
 303:# start series [
 304:# ELEM_CONTACTS
 305:if not 'Rheater_1' {
 306:    clear bit '$rung_top'
 307:}
 309:# ELEM_RTO
 310:if 'Theater_off1' < '30000' {
 311:    if '$rung_top' {
 312:        increment 'Theater_off1'
 313:        clear bit '$rung_top'
 314:    }
 315:} else {
 316:    set bit '$rung_top'
 317:}
 319:# ELEM_CONTACTS
 320:if not 'X100t_sensor' {
 321:    clear bit '$rung_top'
 322:}
 324:# ELEM_COIL
 325:if '$rung_top' {
 326:    clear bit 'Rheater_1'
 327:}
 329:# ] finish series
 330:LabelRung9:
 331:
 332:# Latest INT_OP here
