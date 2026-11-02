
undefined8 entry(undefined8 param_1,undefined8 param_2,byte *param_3,long param_4,ulong param_5)

{
  undefined8 *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  byte bVar5;
  int iVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  code *UNRECOVERED_JUMPTABLE;
  ulong uVar12;
  char in_stack_00000028;
  undefined8 local_60;
  long local_58;
  undefined8 *local_50;
  undefined8 local_48;

  uVar11 = param_5 & 0xffffffff;
  uVar12 = (ulong)*param_3;
  if (uVar12 < 7) {
    UNRECOVERED_JUMPTABLE = (code *)((long)*(int *)(uVar12 * 4 + 0x146e7b6b8) + 0x146e7b6b8);
                    /* WARNING: Could not emulate address calculation at 0x00014592e84f */
                    /* WARNING: Treating indirect jump as call */
    uVar7 = (*UNRECOVERED_JUMPTABLE)(uVar11,param_3,0x146e7b6b8,param_4,UNRECOVERED_JUMPTABLE);
    return uVar7;
  }
  if ((in_stack_00000028 == '\x02') || ((int)param_5 == 0)) {
    return 0;
  }
  bVar5 = *(char *)(param_4 + 0x304) - 2;
  if (bVar5 < 10) {
    lVar9 = *(long *)((ulong)bVar5 * 8 + 0x146e7b190);
  }
  else {
    lVar9 = 0x146bab7a8;
  }
  puVar1 = *(undefined8 **)(lVar9 + 0x30);
  lVar9 = *(long *)(lVar9 + 0x38);
  lVar2 = *(long *)(param_4 + 0xb8);
  lVar3 = *(long *)(param_4 + 0xc0);
  puVar8 = puVar1;
  while (puVar8 != puVar1 + lVar9 * 2) {
    local_60 = *puVar8;
    lVar4 = puVar8[1];
    lVar10 = 0;
    local_58 = lVar4;
    while ((*(long *)(lVar10 + 0x146bacae0) != lVar4 || (iVar6 = func_0x000145bc9787(), iVar6 != 0))
          ) {
      lVar10 = lVar10 + 0x78;
      if (lVar10 == 0x34f8) {
        local_50 = &local_60;
        local_48 = 0x1400020c0;
        func_0x000145d699c0();
                    /* WARNING: Does not return */
        UNRECOVERED_JUMPTABLE = (code *)invalidInstructionException();
        (*UNRECOVERED_JUMPTABLE)();
      }
    }
    if ((*(int *)(lVar10 + 0x146bacb18) == (int)uVar11) ||
       (puVar8 = puVar8 + 2, *(int *)(lVar10 + 0x146bacb3c) == (int)uVar11)) goto LAB_14592e960;
  }
  lVar9 = 0;
  do {
    if (lVar3 * 0x70 - lVar9 == 0) {
      return 0;
    }
    lVar4 = *(long *)(lVar2 + lVar9);
  } while ((*(int *)(lVar4 + 0x40) != (int)uVar11) &&
          (lVar9 = lVar9 + 0x70, *(int *)(lVar4 + 100) != (int)uVar11));
LAB_14592e960:
                    /* WARNING: Could not emulate address calculation at 0x00014592e96a */
                    /* WARNING: Treating indirect jump as call */
  uVar7 = (*(code *)((long)*(int *)(uVar12 * 4 + 0x146e7b6d4) + 0x146e7b6d4))();
  return uVar7;
}
