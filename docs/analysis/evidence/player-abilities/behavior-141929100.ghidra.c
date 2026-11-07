
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,uint *param_4,ulong param_5)

{
  undefined8 *puVar1;
  uint uVar2;
  uint uVar3;
  undefined8 uVar4;
  code *pcVar5;
  undefined8 uVar6;
  uint *puVar7;
  uint *puVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  
  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (param_5 != param_3) {
    lVar10 = param_5 * 0x10;
    puVar7 = param_4 + param_5 * 4;
    do {
      uVar2 = *puVar7;
      uVar11 = (uint)((int)uVar2 >> 0x1f) >> 1 ^ uVar2;
      if ((int)uVar11 < (int)((uint)((int)puVar7[-4] >> 0x1f) >> 1 ^ puVar7[-4])) {
        uVar4 = *(undefined8 *)(puVar7 + 2);
        lVar9 = lVar10;
        do {
          puVar1 = (undefined8 *)((long)param_4 + lVar9 + -0x10);
          uVar6 = puVar1[1];
          *(undefined8 *)((long)param_4 + lVar9) = *puVar1;
          ((undefined8 *)((long)param_4 + lVar9))[1] = uVar6;
          puVar8 = param_4;
          if (lVar9 == 0x10) goto LAB_141929133;
          uVar3 = *(uint *)((long)param_4 + lVar9 + -0x20);
          lVar9 = lVar9 + -0x10;
        } while ((int)uVar11 < (int)((uint)((int)uVar3 >> 0x1f) >> 1 ^ uVar3));
        puVar8 = (uint *)(lVar9 + (long)param_4);
LAB_141929133:
        *puVar8 = uVar2;
        *(undefined8 *)(puVar8 + 2) = uVar4;
      }
      puVar7 = puVar7 + 4;
      lVar10 = lVar10 + 0x10;
    } while (puVar7 != param_4 + param_3 * 4);
  }
  return;
}

