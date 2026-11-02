
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
FUN_145836cb0(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
             undefined8 param_5)

{
  undefined1 auVar1 [16];
  long lStack_230;
  long lStack_60;
  
  auVar1 = func_0x000140bc6760(param_5,param_4,param_5,param_3);
  if ((auVar1._8_8_ < 5) ||
     (DAT_14703a556 != (char)auVar1._0_8_[1] || _DAT_14703a552 != *auVar1._0_8_)) {
    param_4[1] = 0x146ccbdec;
    param_4[2] = 0xf;
  }
  else {
    func_0x0001458d2fb0();
    if (lStack_230 != -1) {
      FUN_14582cde0();
      func_0x00014580ade0();
      if ((lStack_60 != -1) && (func_0x00014580a7a0(), lStack_60 != 0)) {
        func_0x0001400021d0();
      }
      FUN_145831e10();
      func_0x000145d145fb();
      if (lStack_230 == 0) {
        return param_4;
      }
      func_0x0001400021d0();
      return param_4;
    }
    param_4[1] = 0x146ccbdfb;
    param_4[2] = 0xc;
  }
  *param_4 = 0xffffffffffffffff;
  return param_4;
}

