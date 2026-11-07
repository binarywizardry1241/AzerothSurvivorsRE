
undefined8 *
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,long param_5,
     ulong param_6)

{
  int local_68;
  int iStack_64;
  int iStack_60;
  int iStack_5c;
  int local_58;
  int iStack_54;
  
  func_0x000145afbe60();
  if (local_68 == 1) {
    if (param_6 != 0) {
      if ((iStack_64 != 0) && (*(long *)(param_5 + 0x10) != 0)) {
        func_0x000146034930();
        func_0x000145b54cc0();
        func_0x000145af3a50();
        if (CONCAT44(iStack_64,1) != 0) {
          func_0x0001400021d0();
        }
      }
      if (param_6 != 1) {
        if ((iStack_60 != 0) && (*(long *)(param_5 + 0x28) != 0)) {
          func_0x000146034930();
          func_0x000145b54cc0();
          func_0x000145af3a50();
          if (CONCAT44(iStack_64,1) != 0) {
            func_0x0001400021d0();
          }
        }
        if (2 < param_6) {
          if ((iStack_5c != 0) && (*(long *)(param_5 + 0x40) != 0)) {
            func_0x000146034930();
            func_0x000145b54cc0();
            func_0x000145af3a50();
            if (CONCAT44(iStack_64,1) != 0) {
              func_0x0001400021d0();
            }
          }
          if (param_6 != 3) {
            if ((local_58 != 0) && (*(long *)(param_5 + 0x58) != 0)) {
              func_0x000146034930();
              func_0x000145b54cc0();
              func_0x000145af3a50();
              if (CONCAT44(iStack_64,1) != 0) {
                func_0x0001400021d0();
              }
            }
            if (((4 < param_6) && (iStack_54 != 0)) && (*(long *)(param_5 + 0x70) != 0)) {
              func_0x000146034930();
              func_0x000145b54cc0();
              func_0x000145af3a50();
              if (CONCAT44(iStack_64,1) != 0) {
                func_0x0001400021d0();
              }
            }
          }
        }
      }
    }
    func_0x000145b00d90();
  }
  else {
    *param_4 = 0xffffffffffffffff;
    if (*param_3 != 0) {
      func_0x0001400021d0();
    }
  }
  return param_4;
}

