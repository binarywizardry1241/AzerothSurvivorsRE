
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,uint *param_4,ulong param_5)

{
  uint *puVar1;
  byte bVar2;
  byte bVar3;
  uint uVar4;
  undefined8 uVar5;
  code *pcVar6;
  uint *puVar7;
  long lVar8;
  uint *puVar9;
  long lVar10;
  uint uVar11;
  uint *puVar12;
  uint *puVar13;
  uint uStack_39;
  
  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  if (param_5 != param_3) {
    puVar7 = param_4 + param_5 * 4;
    lVar10 = param_5 * 0x10 + -0x10;
    do {
      bVar2 = (byte)puVar7[1];
      if (bVar2 == (byte)puVar7[-3]) {
        uVar11 = *puVar7;
        if ((int)((uint)((int)puVar7[-4] >> 0x1f) >> 1 ^ puVar7[-4]) <
            (int)((uint)((int)uVar11 >> 0x1f) >> 1 ^ uVar11)) {
LAB_1454f4e75:
          puVar12 = puVar7 + -4;
          uVar5 = *(undefined8 *)((long)puVar7 + 5);
          uStack_39._1_3_ = (undefined3)(puVar7[3] >> 8);
          uStack_39._0_1_ = (undefined1)((ulong)uVar5 >> 0x38);
          *(undefined8 *)puVar7 = *(undefined8 *)puVar12;
          *(undefined8 *)(puVar7 + 2) = *(undefined8 *)(puVar7 + -2);
          puVar9 = param_4;
          if (puVar12 != param_4) {
            lVar8 = lVar10;
            do {
              puVar1 = (uint *)((long)param_4 + lVar8);
              puVar13 = (uint *)((long)param_4 + lVar8 + -0x10);
              bVar3 = *(byte *)((long)param_4 + lVar8 + -0xc);
              if (bVar2 == bVar3) {
                uVar4 = *puVar13;
                puVar9 = puVar12;
                if ((int)((uint)((int)uVar11 >> 0x1f) >> 1 ^ uVar11) <=
                    (int)((uint)((int)uVar4 >> 0x1f) >> 1 ^ uVar4)) break;
              }
              else {
                puVar9 = puVar1;
                if (bVar3 <= bVar2) break;
              }
              puVar12 = puVar12 + -4;
              *(undefined8 *)puVar1 = *(undefined8 *)puVar13;
              *(undefined8 *)(puVar1 + 2) = *(undefined8 *)((long)param_4 + lVar8 + -8);
              lVar8 = lVar8 + -0x10;
              puVar9 = param_4;
            } while (lVar8 != 0);
          }
          *puVar9 = uVar11;
          *(byte *)(puVar9 + 1) = bVar2;
          *(undefined8 *)((long)puVar9 + 5) = uVar5;
          puVar9[3] = uStack_39;
        }
      }
      else if (bVar2 < (byte)puVar7[-3]) {
        uVar11 = *puVar7;
        goto LAB_1454f4e75;
      }
      puVar7 = puVar7 + 4;
      lVar10 = lVar10 + 0x10;
    } while (puVar7 != param_4 + param_3 * 4);
  }
  return;
}

