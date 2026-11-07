
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,uint *param_4,ulong param_5)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  uint uVar3;
  uint uVar4;
  code *pcVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  uint *puVar12;
  long lVar13;
  uint uVar14;
  uint *puVar15;
  long lVar16;
  undefined4 local_2c;
  undefined4 uStack_28;
  
  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (param_5 != param_3) {
    lVar13 = param_5 * 0x20;
    puVar12 = param_4 + param_5 * 8;
    do {
      uVar3 = *puVar12;
      uVar14 = (uint)((int)uVar3 >> 0x1f) >> 1 ^ uVar3;
      if ((int)uVar14 < (int)((uint)((int)puVar12[-8] >> 0x1f) >> 1 ^ puVar12[-8])) {
        uVar6 = *(undefined8 *)(puVar12 + 1);
        uVar7 = *(undefined8 *)(puVar12 + 3);
        uVar8 = *(undefined8 *)(puVar12 + 6);
        uStack_28 = (undefined4)((ulong)*(undefined8 *)(puVar12 + 4) >> 0x20);
        local_2c = (undefined4)((ulong)uVar7 >> 0x20);
        lVar16 = lVar13;
        do {
          puVar1 = (undefined8 *)((long)param_4 + lVar16 + -0x20);
          uVar9 = *puVar1;
          uVar10 = puVar1[1];
          puVar1 = (undefined8 *)((long)param_4 + lVar16 + -0x10);
          uVar11 = puVar1[1];
          puVar2 = (undefined8 *)((long)param_4 + lVar16 + 0x10);
          *puVar2 = *puVar1;
          puVar2[1] = uVar11;
          *(undefined8 *)((long)param_4 + lVar16) = uVar9;
          ((undefined8 *)((long)param_4 + lVar16))[1] = uVar10;
          puVar15 = param_4;
          if (lVar16 == 0x20) goto LAB_141928ee3;
          uVar4 = *(uint *)((long)param_4 + lVar16 + -0x40);
          lVar16 = lVar16 + -0x20;
        } while ((int)uVar14 < (int)((uint)((int)uVar4 >> 0x1f) >> 1 ^ uVar4));
        puVar15 = (uint *)(lVar16 + (long)param_4);
LAB_141928ee3:
        *puVar15 = uVar3;
        *(undefined8 *)(puVar15 + 1) = uVar6;
        *(undefined8 *)(puVar15 + 3) = uVar7;
        *(ulong *)(puVar15 + 4) = CONCAT44(uStack_28,local_2c);
        *(undefined8 *)(puVar15 + 6) = uVar8;
      }
      puVar12 = puVar12 + 8;
      lVar13 = lVar13 + 0x20;
    } while (puVar12 != param_4 + param_3 * 8);
  }
  return;
}

