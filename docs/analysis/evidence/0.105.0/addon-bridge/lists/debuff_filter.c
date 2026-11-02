/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
FUN_14599d110(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  code *pcVar1;
  long *plVar2;
  int *piVar3;
  long lVar4;
  long local_50;

  if (param_3 != param_5) {
    do {
      if (*(char *)(param_3 + 0x68) == '\0') {
        if (*(long *)(param_3 + 0x18) == -1) {
          if (*(long *)(param_3 + 0x40) == -1) {
            piVar3 = (int *)&DAT_146bb9718;
            if (*(char *)(param_3 + 0x15c) == '\x01') goto LAB_14599d15d;
            goto LAB_14599d179;
          }
        }
        else {
          piVar3 = (int *)&DAT_146bb971d;
          if (*(char *)(*(long *)(param_3 + 0x30) + 0x54) != '\0') {
LAB_14599d15d:
            if ((char)piVar3[1] != DAT_146bb9721 || *piVar3 != _DAT_146bb971d) goto LAB_14599d179;
          }
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
        local_50 = 1;
        if (param_3 == param_5) goto LAB_14599d2bc;
        lVar4 = 1;
        goto LAB_14599d220;
      }
LAB_14599d179:
      param_3 = param_3 + 0x160;
    } while (param_3 != param_5);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
LAB_14599d220:
  if (*(char *)(param_3 + 0x68) == '\0') {
    if (*(long *)(param_3 + 0x18) == -1) {
      if (*(long *)(param_3 + 0x40) == -1) {
        piVar3 = (int *)&DAT_146bb9718;
        if (*(char *)(param_3 + 0x15c) == '\x01') goto LAB_14599d24f;
        goto LAB_14599d268;
      }
    }
    else {
      piVar3 = (int *)&DAT_146bb971d;
      if (*(char *)(*(long *)(param_3 + 0x30) + 0x54) != '\0') {
LAB_14599d24f:
        if ((char)piVar3[1] != DAT_146bb9721 || *piVar3 != _DAT_146bb971d) goto LAB_14599d268;
      }
    }
    if (lVar4 == 4) {
      func_0x000145bcb2d0();
    }
    plVar2[lVar4] = param_3;
    param_3 = param_3 + 0x160;
    lVar4 = lVar4 + 1;
    local_50 = lVar4;
    if (param_3 == param_5) goto LAB_14599d2bc;
    goto LAB_14599d220;
  }
LAB_14599d268:
  param_3 = param_3 + 0x160;
  if (param_3 == param_5) {
LAB_14599d2bc:
    param_4[2] = local_50;
    *param_4 = 4;
    param_4[1] = plVar2;
    return param_4;
  }
  goto LAB_14599d220;
}
