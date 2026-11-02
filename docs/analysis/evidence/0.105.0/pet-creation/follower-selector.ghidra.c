
undefined8 * entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  char *pcVar1;
  char *pcVar2;
  code *pcVar3;
  char *pcVar4;
  long *plVar5;
  char *pcVar6;
  long lVar7;
  char *pcVar8;
  long local_50;

  pcVar1 = (char *)param_3[1];
  if ((char *)*param_3 != pcVar1) {
    pcVar2 = (char *)param_3[2];
    pcVar6 = (char *)*param_3;
    do {
      pcVar8 = pcVar6 + 0x40;
      if ((*pcVar6 == '\x1d') &&
         ((lVar7 = *(long *)(pcVar6 + 8), *pcVar2 != '\x01' ||
          (3 < (byte)(*(char *)(lVar7 + 0x39) - 1U))))) {
        *param_3 = pcVar8;
        func_0x000140002200();
        plVar5 = (long *)func_0x0001400021c0();
        if (plVar5 == (long *)0x0) {
          func_0x000145d6944b();
                    /* WARNING: Does not return */
          pcVar3 = (code *)invalidInstructionException();
          (*pcVar3)();
        }
        *plVar5 = lVar7;
        local_50 = 1;
        while (pcVar8 != pcVar1) {
          while ((*pcVar8 != '\x1d' ||
                 ((lVar7 = *(long *)(pcVar8 + 8), *pcVar2 == '\x01' &&
                  ((byte)(*(char *)(lVar7 + 0x39) - 1U) < 4))))) {
            pcVar6 = pcVar8 + 0x40;
            pcVar8 = pcVar8 + 0x40;
            if (pcVar6 == pcVar1) goto LAB_14599ceba;
          }
          if (local_50 == 4) {
            func_0x000145bcb2d0();
          }
          plVar5[local_50] = lVar7;
          local_50 = local_50 + 1;
          pcVar8 = pcVar8 + 0x40;
        }
LAB_14599ceba:
        param_4[2] = local_50;
        *param_4 = 4;
        param_4[1] = plVar5;
        return param_4;
      }
      pcVar4 = pcVar6 + 0x40;
      pcVar6 = pcVar8;
    } while (pcVar4 != pcVar1);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}
