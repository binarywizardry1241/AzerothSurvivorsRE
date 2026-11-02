
undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  long lVar1;
  code *pcVar2;
  long *plVar3;
  long lVar4;
  
  do {
    if (param_3 == param_5) {
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    lVar4 = *(long *)(param_3 + 0x108);
    param_3 = param_3 + 0x128;
  } while (lVar4 < 0);
  func_0x000140002200();
  plVar3 = (long *)func_0x0001400021c0();
  if (plVar3 != (long *)0x0) {
    *plVar3 = lVar4;
    lVar4 = 1;
    while (param_3 != param_5) {
      lVar1 = *(long *)(param_3 + 0x108);
      param_3 = param_3 + 0x128;
      if (-1 < lVar1) {
        if (lVar4 == 4) {
          func_0x000146005df0();
        }
        plVar3[lVar4] = lVar1;
        lVar4 = lVar4 + 1;
      }
    }
    param_4[2] = lVar4;
    *param_4 = 4;
    param_4[1] = plVar3;
    return param_4;
  }
  func_0x0001461add5b();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}

