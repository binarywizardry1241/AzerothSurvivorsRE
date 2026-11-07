undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  code *pcVar4;
  long *plVar5;
  long lVar6;
  long *plVar7;

  plVar1 = (long *)param_3[1];
  lVar2 = param_3[2];
  plVar5 = (long *)*param_3;
  do {
    if (plVar5 == plVar1) {
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    plVar7 = plVar5 + 1;
    *param_3 = (long)plVar7;
    lVar6 = *plVar5;
    plVar5 = plVar7;
  } while (*(char *)(lVar6 + 0x70) != *(char *)(lVar2 + 0x70));
  func_0x000140002200();
  plVar5 = (long *)func_0x0001400021c0();
  if (plVar5 != (long *)0x0) {
    *plVar5 = lVar6;
    lVar6 = 1;
    while (plVar7 != plVar1) {
      lVar3 = *plVar7;
      plVar7 = plVar7 + 1;
      if (*(char *)(lVar3 + 0x70) == *(char *)(lVar2 + 0x70)) {
        if (lVar6 == 4) {
          func_0x000145bfa970();
        }
        plVar5[lVar6] = lVar3;
        lVar6 = lVar6 + 1;
      }
    }
    param_4[2] = lVar6;
    *param_4 = 4;
    param_4[1] = plVar5;
    return param_4;
  }
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
