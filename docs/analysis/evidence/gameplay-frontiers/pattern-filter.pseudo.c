longlong * FUN_1459cbd40(longlong *param_1,undefined8 *param_2)

{
  char cVar1;
  code *pcVar2;
  longlong lVar3;
  char *pcVar4;
  longlong lVar5;
  char *pcVar6;
  longlong lVar7;
  longlong lVar8;
  undefined8 auStack_70 [2];
  longlong lStack_60;
  char *pcStack_58;
  longlong lStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lVar7 = param_2[1];
  do {
    if (param_2[2] == lVar7) {
      *param_1 = 0;
      param_1[1] = 1;
      param_1[2] = 0;
      return param_1;
    }
    param_2[1] = lVar7 + 1;
    cVar1 = *(char *)((longlong)param_2 + lVar7 + 0x18);
    lVar7 = lVar7 + 1;
  } while (cVar1 == *(char *)*param_2);
  func_0x000140002200();
  pcVar6 = (char *)func_0x0001400021c0(8,1);
  if (pcVar6 == (char *)0x0) {
    FUN_145da94eb(1,8);
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *pcVar6 = cVar1;
  lStack_60 = 8;
  pcStack_58 = pcVar6;
  lStack_50 = 1;
  pcVar4 = (char *)*param_2;
  lVar7 = param_2[1];
  lVar3 = param_2[2];
  auStack_70[0] = param_2[3];
  if (lVar7 != lVar3) {
    do {
      lVar5 = lStack_50;
      lVar8 = lVar7;
      while (cVar1 = *(char *)((longlong)auStack_70 + lVar8), cVar1 == *pcVar4) {
        lVar8 = lVar8 + 1;
        if (lVar3 == lVar8) goto LAB_1459cbdd8;
      }
      if (lStack_50 == lStack_60) {
        FUN_145c0d470(&lStack_60,lStack_50,1,1,1);
        pcVar6 = pcStack_58;
      }
      lVar7 = lVar8 + 1;
      pcVar6[lVar5] = cVar1;
      lStack_50 = lVar5 + 1;
    } while (lVar3 + -1 != lVar8);
  }
LAB_1459cbdd8:
  param_1[2] = lStack_50;
  *param_1 = lStack_60;
  param_1[1] = (longlong)pcStack_58;
  return param_1;
}
