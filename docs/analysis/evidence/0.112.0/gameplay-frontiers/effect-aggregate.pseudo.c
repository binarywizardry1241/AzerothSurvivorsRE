/* WARNING: Removing unreachable block (ram,0x000145bb4074) */

void FUN_1458975c0(longlong *param_1,byte *param_2,longlong *param_3)

{
  undefined4 *puVar1;
  byte *pbVar2;
  longlong *plVar3;
  undefined4 uVar4;
  float fVar5;
  byte bVar6;
  longlong lVar7;
  longlong lVar8;
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
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  char cVar23;
  longlong lVar24;
  HANDLE pvVar25;
  longlong lVar26;

  cVar23 = '\x02';
  if (0x23 < *param_2) {
    cVar23 = *param_2 - 0x24;
  }
  if (cVar23 == '\0') {
    bVar6 = param_2[8];
    fVar5 = *(float *)(param_2 + 4);
    lVar24 = param_1[1];
    lVar7 = param_1[2];
    lVar26 = 0;
    do {
      if (lVar7 * 8 - lVar26 == 0) {
        if (lVar7 == *param_1) {
          FUN_145c16470(param_1);
          lVar24 = param_1[1];
        }
        *(byte *)(lVar24 + lVar7 * 8) = bVar6;
        *(float *)(lVar24 + 4 + lVar7 * 8) = fVar5;
        param_1[2] = lVar7 + 1;
        lVar24 = *param_3;
        if (lVar24 == -1) {
          return;
        }
        goto LAB_1458977af;
      }
      lVar8 = lVar26 + 8;
      pbVar2 = (byte *)(lVar24 + lVar26);
      lVar26 = lVar8;
    } while (*pbVar2 != bVar6);
    *(float *)(lVar24 + -4 + lVar8) = fVar5 + *(float *)(lVar24 + -4 + lVar8);
    lVar24 = *param_3;
  }
  else {
    if (cVar23 != '\x01') {
      lVar24 = param_1[8];
      if (lVar24 == param_1[6]) {
        FUN_145c165c0(param_1 + 6);
      }
      lVar7 = param_1[7];
      lVar26 = lVar24 * 0x40;
      uVar4 = *(undefined4 *)param_2;
      uVar9 = *(undefined4 *)(param_2 + 4);
      uVar10 = *(undefined4 *)(param_2 + 8);
      uVar11 = *(undefined4 *)(param_2 + 0xc);
      uVar12 = *(undefined4 *)(param_2 + 0x10);
      uVar13 = *(undefined4 *)(param_2 + 0x14);
      uVar14 = *(undefined4 *)(param_2 + 0x18);
      uVar15 = *(undefined4 *)(param_2 + 0x1c);
      uVar16 = *(undefined4 *)(param_2 + 0x20);
      uVar17 = *(undefined4 *)(param_2 + 0x24);
      uVar18 = *(undefined4 *)(param_2 + 0x28);
      uVar19 = *(undefined4 *)(param_2 + 0x2c);
      uVar20 = *(undefined4 *)(param_2 + 0x34);
      uVar21 = *(undefined4 *)(param_2 + 0x38);
      uVar22 = *(undefined4 *)(param_2 + 0x3c);
      puVar1 = (undefined4 *)(lVar7 + 0x30 + lVar26);
      *puVar1 = *(undefined4 *)(param_2 + 0x30);
      puVar1[1] = uVar20;
      puVar1[2] = uVar21;
      puVar1[3] = uVar22;
      puVar1 = (undefined4 *)(lVar7 + 0x20 + lVar26);
      *puVar1 = uVar16;
      puVar1[1] = uVar17;
      puVar1[2] = uVar18;
      puVar1[3] = uVar19;
      puVar1 = (undefined4 *)(lVar7 + 0x10 + lVar26);
      *puVar1 = uVar12;
      puVar1[1] = uVar13;
      puVar1[2] = uVar14;
      puVar1[3] = uVar15;
      puVar1 = (undefined4 *)(lVar7 + lVar26);
      *puVar1 = uVar4;
      puVar1[1] = uVar9;
      puVar1[2] = uVar10;
      puVar1[3] = uVar11;
      param_1[8] = lVar24 + 1;
      lVar24 = *param_3;
      lVar7 = param_3[1];
      lVar26 = param_1[0xb];
      if (lVar26 == param_1[9]) {
        FUN_145c0dc40(param_1 + 9);
      }
      lVar8 = param_1[10];
      *(longlong *)(lVar8 + lVar26 * 0x28) = lVar24;
      *(longlong *)(lVar8 + 8 + lVar26 * 0x28) = lVar7;
      lVar24 = param_3[3];
      plVar3 = (longlong *)(lVar8 + 0x10 + lVar26 * 0x28);
      *plVar3 = param_3[2];
      plVar3[1] = lVar24;
      *(longlong *)(lVar8 + 0x20 + lVar26 * 0x28) = param_3[4];
      param_1[0xb] = lVar26 + 1;
      return;
    }
    bVar6 = param_2[0x24];
    uVar4 = *(undefined4 *)(param_2 + 0x20);
    lVar24 = param_1[5];
    if (lVar24 == param_1[3]) {
      FUN_145c0dbd0(param_1 + 3);
    }
    lVar7 = param_1[4];
    lVar26 = lVar24 * 0x20;
    *(undefined8 *)(lVar7 + 0x10 + lVar26) = *(undefined8 *)(param_2 + 0x18);
    uVar9 = *(undefined4 *)(param_2 + 0xc);
    uVar10 = *(undefined4 *)(param_2 + 0x10);
    uVar11 = *(undefined4 *)(param_2 + 0x14);
    puVar1 = (undefined4 *)(lVar7 + lVar26);
    *puVar1 = *(undefined4 *)(param_2 + 8);
    puVar1[1] = uVar9;
    puVar1[2] = uVar10;
    puVar1[3] = uVar11;
    *(byte *)(lVar7 + 0x18 + lVar26) = bVar6;
    *(undefined4 *)(lVar7 + 0x1c + lVar26) = uVar4;
    param_1[5] = lVar24 + 1;
    lVar24 = *param_3;
  }
  if (lVar24 != -1) {
LAB_1458977af:
    if (lVar24 != 0) {
      lVar24 = param_3[1];
      pvVar25 = GetProcessHeap();
                    /* WARNING: Could not recover jumptable at 0x000145bb408c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      HeapFree(pvVar25,0,lVar24);
      return;
    }
  }
  return;
}
