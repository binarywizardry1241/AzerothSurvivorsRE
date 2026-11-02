
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,undefined8 *param_4,ulong param_5)

{
  undefined8 *puVar1;
  byte bVar2;
  undefined8 uVar3;
  code *pcVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  long lVar10;
  undefined8 *puVar11;
  long lVar12;
  undefined8 *puVar13;
  long lVar14;
  undefined7 local_28;
  undefined1 uStack_21;
  
  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  if (param_5 != param_3) {
    lVar12 = param_5 * 0x20;
    puVar11 = param_4 + param_5 * 4;
    do {
      bVar2 = *(byte *)(puVar11 + 2);
      if (bVar2 < *(byte *)(puVar11 + -2)) {
        uVar5 = *puVar11;
        uVar6 = puVar11[1];
        uVar3 = puVar11[3];
        local_28 = (undefined7)*(undefined8 *)((long)puVar11 + 0x11);
        uStack_21 = (undefined1)uVar3;
        lVar10 = lVar12;
        do {
          lVar14 = lVar10;
          puVar13 = (undefined8 *)((long)param_4 + lVar14 + -0x20);
          uVar7 = *puVar13;
          uVar8 = puVar13[1];
          puVar13 = (undefined8 *)((long)param_4 + lVar14 + -0x10);
          uVar9 = puVar13[1];
          puVar1 = (undefined8 *)((long)param_4 + lVar14 + 0x10);
          *puVar1 = *puVar13;
          puVar1[1] = uVar9;
          *(undefined8 *)((long)param_4 + lVar14) = uVar7;
          ((undefined8 *)((long)param_4 + lVar14))[1] = uVar8;
          puVar13 = param_4;
          if (lVar14 == 0x20) goto LAB_1454f4d33;
          lVar10 = lVar14 + -0x20;
        } while (bVar2 < *(byte *)((long)param_4 + lVar14 + -0x30));
        puVar13 = (undefined8 *)(lVar14 + -0x20 + (long)param_4);
LAB_1454f4d33:
        *puVar13 = uVar5;
        puVar13[1] = uVar6;
        *(byte *)((long)param_4 + lVar14 + -0x10) = bVar2;
        *(ulong *)((long)param_4 + lVar14 + -0xf) = CONCAT17(uStack_21,local_28);
        *(undefined8 *)((long)param_4 + lVar14 + -8) = uVar3;
      }
      puVar11 = puVar11 + 4;
      lVar12 = lVar12 + 0x20;
    } while (puVar11 != param_4 + param_3 * 4);
  }
  return;
}

