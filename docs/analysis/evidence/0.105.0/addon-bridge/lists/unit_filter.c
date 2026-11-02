undefined8 *
FUN_14599cf60(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  code *pcVar1;
  long *plVar2;
  long lVar3;
  long local_40;

  while( true ) {
    if (param_3 == param_5) {
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    if ((*(char *)(param_3 + 0x68) == '\0') &&
       (((*(long *)(param_3 + 0x18) != -1 || (*(long *)(param_3 + 0x40) != -1)) ||
        (*(char *)(param_3 + 0x15c) != '\0')))) break;
    param_3 = param_3 + 0x160;
  }
  func_0x000140002200();
  plVar2 = (long *)func_0x0001400021c0();
  if (plVar2 == (long *)0x0) {
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *plVar2 = param_3;
  param_3 = param_3 + 0x160;
  local_40 = 1;
  if (param_3 != param_5) {
    lVar3 = 1;
    do {
      while ((*(char *)(param_3 + 0x68) == '\0' &&
             (((*(long *)(param_3 + 0x18) != -1 || (*(long *)(param_3 + 0x40) != -1)) ||
              (*(char *)(param_3 + 0x15c) != '\0'))))) {
        if (lVar3 == 4) {
          func_0x000145bcb2d0();
        }
        plVar2[lVar3] = param_3;
        param_3 = param_3 + 0x160;
        lVar3 = lVar3 + 1;
        local_40 = lVar3;
        if (param_3 == param_5) goto LAB_14599d07d;
      }
      param_3 = param_3 + 0x160;
    } while (param_3 != param_5);
  }
LAB_14599d07d:
  param_4[2] = local_40;
  *param_4 = 4;
  param_4[1] = plVar2;
  return param_4;
}
