
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,ulong *param_4,ulong param_5)

{
  long lVar1;
  undefined8 *puVar2;
  ulong uVar3;
  ulong uVar4;
  code *pcVar5;
  undefined8 uVar6;
  long lVar7;
  ulong *puVar8;
  long lVar9;
  long lVar10;
  ulong *puVar11;
  
  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (param_5 != param_3) {
    lVar10 = param_5 * 0x10;
    puVar8 = param_4 + param_5 * 2;
    do {
      uVar3 = *puVar8;
      if (uVar3 < puVar8[-2]) {
        uVar4 = puVar8[1];
        lVar9 = lVar10;
        do {
          puVar2 = (undefined8 *)((long)param_4 + lVar9 + -0x10);
          uVar6 = puVar2[1];
          *(undefined8 *)((long)param_4 + lVar9) = *puVar2;
          ((undefined8 *)((long)param_4 + lVar9))[1] = uVar6;
          puVar11 = param_4;
          if (lVar9 == 0x10) goto LAB_1421b81a3;
          lVar1 = lVar9 + -0x10;
          lVar7 = lVar9 + -0x20;
          lVar9 = lVar1;
        } while (uVar3 < *(ulong *)((long)param_4 + lVar7));
        puVar11 = (ulong *)(lVar1 + (long)param_4);
LAB_1421b81a3:
        *puVar11 = uVar3;
        puVar11[1] = uVar4;
      }
      puVar8 = puVar8 + 2;
      lVar10 = lVar10 + 0x10;
    } while (puVar8 != param_4 + param_3 * 2);
  }
  return;
}

