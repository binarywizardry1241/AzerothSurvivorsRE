
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,byte *param_3,long *param_4,long *param_5)

{
  byte *pbVar1;
  undefined4 *puVar2;
  long *plVar3;
  byte bVar4;
  long lVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined8 uVar20;
  char cVar21;
  long lVar22;
  long lVar23;
  long lVar24;
  undefined4 uVar25;
  float fVar26;

  cVar21 = '\x02';
  if (0x1d < *param_3) {
    cVar21 = *param_3 - 0x1e;
  }
  if (cVar21 == '\0') {
    bVar4 = param_3[8];
    fVar26 = *(float *)(param_3 + 4);
    lVar22 = param_4[1];
    lVar24 = param_4[2];
    lVar23 = 0;
    do {
      if (lVar24 * 8 - lVar23 == 0) {
        if (lVar24 == *param_4) {
          func_0x000145763de0();
          lVar22 = param_4[1];
        }
        *(byte *)(lVar22 + lVar24 * 8) = bVar4;
        *(float *)(lVar22 + 4 + lVar24 * 8) = fVar26;
        param_4[2] = lVar24 + 1;
        lVar22 = *param_5;
        goto joined_r0x000145415c3d;
      }
      lVar5 = lVar23 + 8;
      pbVar1 = (byte *)(lVar22 + lVar23);
      lVar23 = lVar5;
    } while (*pbVar1 != bVar4);
    *(float *)(lVar22 + -4 + lVar5) = fVar26 + *(float *)(lVar22 + -4 + lVar5);
    lVar22 = *param_5;
  }
  else {
    if (cVar21 != '\x01') {
      lVar22 = param_4[8];
      if (lVar22 == param_4[6]) {
        func_0x000145764080();
      }
      lVar24 = param_4[7];
      lVar23 = lVar22 * 0x40;
      uVar25 = *(undefined4 *)param_3;
      uVar6 = *(undefined4 *)(param_3 + 4);
      uVar7 = *(undefined4 *)(param_3 + 8);
      uVar8 = *(undefined4 *)(param_3 + 0xc);
      uVar9 = *(undefined4 *)(param_3 + 0x10);
      uVar10 = *(undefined4 *)(param_3 + 0x14);
      uVar11 = *(undefined4 *)(param_3 + 0x18);
      uVar12 = *(undefined4 *)(param_3 + 0x1c);
      uVar13 = *(undefined4 *)(param_3 + 0x20);
      uVar14 = *(undefined4 *)(param_3 + 0x24);
      uVar15 = *(undefined4 *)(param_3 + 0x28);
      uVar16 = *(undefined4 *)(param_3 + 0x2c);
      uVar17 = *(undefined4 *)(param_3 + 0x34);
      uVar18 = *(undefined4 *)(param_3 + 0x38);
      uVar19 = *(undefined4 *)(param_3 + 0x3c);
      puVar2 = (undefined4 *)(lVar24 + 0x30 + lVar23);
      *puVar2 = *(undefined4 *)(param_3 + 0x30);
      puVar2[1] = uVar17;
      puVar2[2] = uVar18;
      puVar2[3] = uVar19;
      puVar2 = (undefined4 *)(lVar24 + 0x20 + lVar23);
      *puVar2 = uVar13;
      puVar2[1] = uVar14;
      puVar2[2] = uVar15;
      puVar2[3] = uVar16;
      puVar2 = (undefined4 *)(lVar24 + 0x10 + lVar23);
      *puVar2 = uVar9;
      puVar2[1] = uVar10;
      puVar2[2] = uVar11;
      puVar2[3] = uVar12;
      puVar2 = (undefined4 *)(lVar24 + lVar23);
      *puVar2 = uVar25;
      puVar2[1] = uVar6;
      puVar2[2] = uVar7;
      puVar2[3] = uVar8;
      param_4[8] = lVar22 + 1;
      lVar22 = *param_5;
      lVar24 = param_5[1];
      lVar23 = param_4[0xb];
      if (lVar23 == param_4[9]) {
        func_0x000145758120();
      }
      lVar5 = param_4[10];
      *(long *)(lVar5 + lVar23 * 0x28) = lVar22;
      *(long *)(lVar5 + 8 + lVar23 * 0x28) = lVar24;
      lVar22 = param_5[3];
      plVar3 = (long *)(lVar5 + 0x10 + lVar23 * 0x28);
      *plVar3 = param_5[2];
      plVar3[1] = lVar22;
      *(long *)(lVar5 + 0x20 + lVar23 * 0x28) = param_5[4];
      param_4[0xb] = lVar23 + 1;
      return;
    }
    bVar4 = param_3[0x24];
    uVar25 = *(undefined4 *)(param_3 + 0x20);
    lVar22 = param_4[5];
    if (lVar22 == param_4[3]) {
      func_0x0001457580b0();
    }
    lVar24 = param_4[4];
    lVar23 = lVar22 * 0x20;
    *(undefined8 *)(lVar24 + 0x10 + lVar23) = *(undefined8 *)(param_3 + 0x18);
    uVar20 = *(undefined8 *)(param_3 + 0x10);
    *(undefined8 *)(lVar24 + lVar23) = *(undefined8 *)(param_3 + 8);
    ((undefined8 *)(lVar24 + lVar23))[1] = uVar20;
    *(byte *)(lVar24 + 0x18 + lVar23) = bVar4;
    *(undefined4 *)(lVar24 + 0x1c + lVar23) = uVar25;
    param_4[5] = lVar22 + 1;
    lVar22 = *param_5;
  }
joined_r0x000145415c3d:
  if ((lVar22 != -1) && (lVar22 != 0)) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  return;
}
