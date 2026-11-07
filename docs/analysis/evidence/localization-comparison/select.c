/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,short *param_4)

{
  if ((param_3 != 2) || (*param_4 == 0x6e65)) {
    _DAT_1480520d0 = 0;
    return;
  }
  if (*param_4 == 0x6c70) {
    _DAT_1480520d0 = 1;
    return;
  }
  if (*param_4 == 0x7363) {
    _DAT_1480520d0 = 2;
    return;
  }
  if (*param_4 == 0x6564) {
    _DAT_1480520d0 = 3;
    return;
  }
  if (*param_4 == 0x7470) {
    _DAT_1480520d0 = 4;
    return;
  }
  if (*param_4 == 0x7365) {
    _DAT_1480520d0 = 5;
    return;
  }
  if (*param_4 != 0x7266) {
    if (*param_4 == 0x6f72) {
      _DAT_1480520d0 = 7;
      return;
    }
    if (*param_4 == 0x7274) {
      _DAT_1480520d0 = 8;
      return;
    }
    if (*param_4 == 0x7572) {
      _DAT_1480520d0 = 9;
      return;
    }
    if (*param_4 != 0x6b75) {
      if (*param_4 == 0x687a) {
        _DAT_1480520d0 = 0xb;
        return;
      }
      if (*param_4 != 0x616a) {
        _DAT_1480520d0 = 0xd;
        if (*param_4 != 0x6f6b) {
          _DAT_1480520d0 = 0;
        }
        return;
      }
      _DAT_1480520d0 = 0xc;
      return;
    }
    _DAT_1480520d0 = 10;
    return;
  }
  _DAT_1480520d0 = 6;
  return;
}
