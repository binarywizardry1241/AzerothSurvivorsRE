
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145950ff8(undefined8 param_1,long param_2,undefined8 param_3,int *param_4)

{
  undefined8 *puVar1;
  uint uVar2;
  long lVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  long unaff_RBP;
  int iVar10;
  ulong uVar11;
  long lVar12;
  ulong uVar13;
  uint uVar14;
  float fVar15;
  undefined4 uVar16;
  float fVar17;
  float fVar18;
  undefined4 extraout_XMM0_Da;
  float fVar19;
  undefined4 extraout_XMM0_Da_00;
  undefined8 uVar20;
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  float fVar23;
  float fVar24;
  float fVar25;
  undefined4 in_XMM10_Da;
  float fVar26;
  undefined4 in_XMM10_Db;
  float fVar27;
  float fVar28;
  undefined4 in_XMM10_Dc;
  undefined4 in_XMM10_Dd;
  float in_XMM14_Da;

  iVar10 = *param_4;
  uVar2 = param_4[1];
  *(undefined4 *)(unaff_RBP + 0xe0) = _DAT_145d97680;
  uVar16 = _DAT_145d97590;
  if (iVar10 < 0x13fc) {
    if (iVar10 < 0x5e6) {
      if (iVar10 < 0x85) {
        uVar16 = _DAT_145d97a74;
        if ((iVar10 != 0x4b) && (uVar16 = _DAT_145d978f0, iVar10 != 0x74)) goto LAB_145955786;
      }
      else {
        uVar16 = _DAT_145decca4;
        if (((iVar10 != 0x85) && (uVar16 = _DAT_145d97590, iVar10 != 0x193)) && (iVar10 != 0x2ae))
        goto LAB_145955786;
      }
    }
    else if (iVar10 < 0xafc) {
      uVar16 = _DAT_145da2404;
      if (((iVar10 != 0x5e6) && (uVar16 = _DAT_145d97a74, iVar10 != 0x7ba)) &&
         (uVar16 = _DAT_145da2404, iVar10 != 0xa53)) goto LAB_145955786;
    }
    else if (((iVar10 != 0xafc) && (uVar16 = _DAT_145d97a74, iVar10 != 0xbe4)) &&
            (uVar16 = _DAT_1471ef5d0, iVar10 != 0xe16)) goto LAB_145955786;
  }
  else if (iVar10 < 0x1c65) {
    if (iVar10 < 0x1a85) {
      uVar16 = _DAT_145d97a74;
      if (((iVar10 != 0x13fc) && (uVar16 = _DAT_145d97590, iVar10 != 0x1438)) &&
         (uVar16 = _DAT_145decca4, iVar10 != 0x18d1)) goto LAB_145955786;
    }
    else {
      uVar16 = _DAT_145decca4;
      if (((iVar10 != 0x1a85) && (uVar16 = _DAT_145d97a74, iVar10 != 0x1b05)) &&
         (uVar16 = _DAT_145da2404, iVar10 != 0x1b54)) goto LAB_145955786;
    }
  }
  else if (iVar10 < 0x4bea) {
    if (((iVar10 != 0x1c65) && (uVar16 = _DAT_145d978f0, iVar10 != 0x27c5)) &&
       (uVar16 = _DAT_145decca4, iVar10 != 0x2c66)) goto LAB_145955786;
  }
  else {
    uVar16 = _DAT_145d97a74;
    if (((iVar10 != 0x4bea) && (uVar16 = _DAT_1471ef530, iVar10 != 0x5ed3)) &&
       (uVar16 = _DAT_145d97590, iVar10 != 0x6af7)) goto LAB_145955786;
  }
  *(undefined4 *)(unaff_RBP + 0xe0) = uVar16;
LAB_145955786:
  *(undefined4 *)(unaff_RBP + 0xf0) = in_XMM10_Da;
  *(undefined4 *)(unaff_RBP + 0xf4) = in_XMM10_Db;
  *(undefined4 *)(unaff_RBP + 0xf8) = in_XMM10_Dc;
  *(undefined4 *)(unaff_RBP + 0xfc) = in_XMM10_Dd;
  if (uVar2 != 0) {
    *(float *)(unaff_RBP + 0xb8) = (float)uVar2;
    fVar25 = _DAT_145d97610;
    func_0x0001458ea390((float)uVar2,0,_DAT_145d97610);
    fVar15 = (float)func_0x000145bf297d();
    uVar20 = func_0x000145bf2977();
    fVar26 = fVar15 * 0.0 + *(float *)(unaff_RBP + 0xd0);
    fVar27 = (float)uVar20 * 0.0 + *(float *)(unaff_RBP + 0xd4);
    fVar15 = fVar27;
    uVar16 = func_0x0001458cd010(uVar20,fVar26,fVar27);
    *(ulong *)(unaff_RBP + 0x164) = CONCAT44(fVar27,fVar26);
    *(undefined4 *)(unaff_RBP + 0x16c) = uVar16;
    *(undefined4 *)(unaff_RBP + 0x160) = 1;
    *(undefined4 *)(unaff_RBP + 0xc0) = 0;
    func_0x0001458c6a00();
    lVar12 = *(long *)(param_2 + 0x628);
    if (lVar12 == *(long *)(param_2 + 0x618)) {
      func_0x000145bf4ee0();
    }
    in_XMM14_Da = in_XMM14_Da * _DAT_145da61b0;
    lVar3 = *(long *)(param_2 + 0x620);
    uVar20 = *(undefined8 *)(unaff_RBP + 0x110);
    uVar4 = *(undefined8 *)(unaff_RBP + 0x118);
    uVar5 = *(undefined8 *)(unaff_RBP + 0x128);
    puVar1 = (undefined8 *)(lVar3 + 0x10 + lVar12 * 0x20);
    *puVar1 = *(undefined8 *)(unaff_RBP + 0x120);
    puVar1[1] = uVar5;
    puVar1 = (undefined8 *)(lVar3 + lVar12 * 0x20);
    *puVar1 = uVar20;
    puVar1[1] = uVar4;
    *(long *)(param_2 + 0x628) = lVar12 + 1;
    auVar21._4_12_ = SUB1612(*(undefined1 (*) [16])(unaff_RBP + 0xf0),4);
    fVar17 = SUB164(*(undefined1 (*) [16])(unaff_RBP + 0xf0),0) - fVar15;
    fVar23 = *(float *)(unaff_RBP + 0x150) - fVar26;
    auVar21._0_4_ = fVar17 * fVar17 + fVar23 * fVar23;
    fVar17 = SQRT(auVar21._0_4_) / *(float *)(unaff_RBP + 0xe0);
    if (fVar17 <= _DAT_145da61f8) {
      fVar17 = _DAT_145da61f8;
    }
    iVar10 = *(int *)(param_2 + 0xa38) + 1;
    *(int *)(param_2 + 0xa38) = iVar10;
    fVar23 = *(float *)(param_2 + 0xa34);
    uVar16 = func_0x0001458cd010(auVar21._0_8_,fVar26,fVar15);
    lVar12 = *(long *)(param_2 + 0x598);
    if (lVar12 == *(long *)(param_2 + 0x588)) {
      func_0x000145bf4e00();
    }
    lVar3 = *(long *)(param_2 + 0x590);
    lVar7 = lVar12 * 0x80;
    *(undefined8 *)(lVar3 + lVar7) = 0;
    *(undefined4 *)(lVar3 + 0x10 + lVar7) = 0;
    *(undefined8 *)(lVar3 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
    *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
    *(undefined8 *)(lVar3 + 0x30 + lVar7) = 0x4020000000000000;
    *(int *)(lVar3 + 0x3c + lVar7) = iVar10;
    *(ulong *)(lVar3 + 0x40 + lVar7) = CONCAT44(fVar27,fVar26);
    *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar16;
    *(undefined4 *)(lVar3 + 0x4c + lVar7) = 0;
    *(float *)(lVar3 + 0x50 + lVar7) = fVar23;
    *(float *)(lVar3 + 0x54 + lVar7) = fVar17 + fVar23;
    *(undefined8 *)(lVar3 + 0x58 + lVar7) = 0;
    *(float *)(unaff_RBP + 0x178) = in_XMM14_Da;
    *(float *)(lVar3 + 0x60 + lVar7) = in_XMM14_Da;
    *(undefined4 *)(lVar3 + 100 + lVar7) = 0x7f800000;
    puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
    *puVar1 = 0;
    puVar1[1] = 0;
    *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
    *(long *)(param_2 + 0x598) = lVar12 + 1;
    if (uVar2 != 1) {
      uVar14 = 1;
      fVar15 = _DAT_145da61bc;
      fVar26 = _DAT_145dcd048;
      fVar27 = _DAT_145d97838;
      fVar17 = _DAT_145da2290;
      do {
        uVar9 = *(ulong *)(param_2 + 0x9a0);
        uVar6 = *(ulong *)(param_2 + 0x9a8);
        uVar11 = *(ulong *)(param_2 + 0x9b8);
        uVar8 = *(ulong *)(param_2 + 0x9b0);
        do {
          lVar12 = ((uVar9 + uVar11) * 0x800000 | uVar9 + uVar11 >> 0x29) + uVar9;
          uVar13 = uVar6 << 0x11;
          uVar8 = uVar8 ^ uVar9;
          uVar11 = uVar11 ^ uVar6;
          uVar6 = uVar6 ^ uVar8;
          uVar9 = uVar9 ^ uVar11;
          uVar8 = uVar8 ^ uVar13;
          uVar11 = uVar11 << 0x2d | uVar11 >> 0x13;
        } while (fVar25 <= (float)((uint)((ulong)lVar12 >> 0x29) | 0x3f800000) + fVar15);
        *(ulong *)(param_2 + 0x9a0) = uVar9;
        *(ulong *)(param_2 + 0x9b8) = uVar11;
        *(ulong *)(param_2 + 0x9a8) = uVar6;
        *(ulong *)(param_2 + 0x9b0) = uVar8;
        do {
          lVar12 = ((uVar9 + uVar11) * 0x800000 | uVar9 + uVar11 >> 0x29) + uVar9;
          uVar13 = uVar6 << 0x11;
          uVar8 = uVar8 ^ uVar9;
          uVar11 = uVar11 ^ uVar6;
          uVar6 = uVar6 ^ uVar8;
          uVar9 = uVar9 ^ uVar11;
          uVar8 = uVar8 ^ uVar13;
          uVar11 = uVar11 << 0x2d | uVar11 >> 0x13;
          fVar23 = ((float)((uint)((ulong)lVar12 >> 0x29) | 0x3f800000) + fVar15) * fVar27 + fVar17;
        } while (fVar26 <= fVar23);
        *(ulong *)(param_2 + 0x9a0) = uVar9;
        *(ulong *)(param_2 + 0x9b8) = uVar11;
        *(ulong *)(param_2 + 0x9a8) = uVar6;
        *(ulong *)(param_2 + 0x9b0) = uVar8;
        fVar18 = (float)func_0x000145bf297d();
        uVar20 = func_0x000145bf2977();
        fVar18 = fVar23 * fVar18 + *(float *)(unaff_RBP + 0xd0);
        fVar28 = fVar23 * (float)uVar20 + *(float *)(unaff_RBP + 0xd4);
        lVar12 = *(long *)(param_2 + 0x998);
        fVar23 = fVar28;
        uVar9 = func_0x0001458d0220(uVar20,fVar18,fVar28);
        uVar16 = extraout_XMM0_Da;
        if ((uVar9 & 1) == 0) {
          if ((*(long *)(lVar12 + 0x68) == -1) ||
             (func_0x0001458d5410(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar16 = *(undefined4 *)(lVar12 + 0xb8);
          }
          else {
            uVar16 = *(undefined4 *)(unaff_RBP + 0x11c);
          }
        }
        *(ulong *)(unaff_RBP + 0x164) = CONCAT44(fVar28,fVar18);
        *(undefined4 *)(unaff_RBP + 0x16c) = uVar16;
        *(undefined4 *)(unaff_RBP + 0x160) = 1;
        *(undefined4 *)(unaff_RBP + 0xc0) = 0;
        func_0x0001458c6a00();
        lVar12 = *(long *)(param_2 + 0x628);
        if (lVar12 == *(long *)(param_2 + 0x618)) {
          func_0x000145bf4ee0();
        }
        lVar3 = *(long *)(param_2 + 0x620);
        uVar20 = *(undefined8 *)(unaff_RBP + 0x110);
        uVar4 = *(undefined8 *)(unaff_RBP + 0x118);
        uVar5 = *(undefined8 *)(unaff_RBP + 0x128);
        puVar1 = (undefined8 *)(lVar3 + 0x10 + lVar12 * 0x20);
        *puVar1 = *(undefined8 *)(unaff_RBP + 0x120);
        puVar1[1] = uVar5;
        puVar1 = (undefined8 *)(lVar3 + lVar12 * 0x20);
        *puVar1 = uVar20;
        puVar1[1] = uVar4;
        *(long *)(param_2 + 0x628) = lVar12 + 1;
        auVar22._4_12_ = SUB1612(*(undefined1 (*) [16])(unaff_RBP + 0xf0),4);
        fVar19 = SUB164(*(undefined1 (*) [16])(unaff_RBP + 0xf0),0) - fVar23;
        fVar24 = *(float *)(unaff_RBP + 0x150) - fVar18;
        auVar22._0_4_ = fVar19 * fVar19 + fVar24 * fVar24;
        fVar19 = SQRT(auVar22._0_4_) / *(float *)(unaff_RBP + 0xe0);
        if (fVar19 <= _DAT_145da61f8) {
          fVar19 = _DAT_145da61f8;
        }
        iVar10 = *(int *)(param_2 + 0xa38) + 1;
        *(int *)(param_2 + 0xa38) = iVar10;
        fVar24 = *(float *)(param_2 + 0xa34);
        lVar12 = *(long *)(param_2 + 0x998);
        uVar9 = func_0x0001458d0220(auVar22._0_8_,fVar18,fVar23);
        uVar16 = extraout_XMM0_Da_00;
        if ((uVar9 & 1) == 0) {
          if ((*(long *)(lVar12 + 0x68) == -1) ||
             (func_0x0001458d5410(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar16 = *(undefined4 *)(lVar12 + 0xb8);
          }
          else {
            uVar16 = *(undefined4 *)(unaff_RBP + 0x11c);
          }
        }
        lVar12 = *(long *)(param_2 + 0x598);
        if (lVar12 == *(long *)(param_2 + 0x588)) {
          func_0x000145bf4e00();
        }
        uVar14 = uVar14 + 1;
        lVar3 = *(long *)(param_2 + 0x590);
        lVar7 = lVar12 * 0x80;
        *(undefined8 *)(lVar3 + lVar7) = 0;
        *(undefined4 *)(lVar3 + 0x10 + lVar7) = 0;
        *(undefined8 *)(lVar3 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
        *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
        *(undefined8 *)(lVar3 + 0x30 + lVar7) = 0x4020000000000000;
        *(int *)(lVar3 + 0x3c + lVar7) = iVar10;
        *(ulong *)(lVar3 + 0x40 + lVar7) = CONCAT44(fVar28,fVar18);
        *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar16;
        *(undefined4 *)(lVar3 + 0x4c + lVar7) = 0;
        *(float *)(lVar3 + 0x50 + lVar7) = fVar24;
        *(float *)(lVar3 + 0x54 + lVar7) = fVar19 + fVar24;
        *(undefined8 *)(lVar3 + 0x58 + lVar7) = 0;
        *(undefined4 *)(lVar3 + 0x60 + lVar7) = *(undefined4 *)(unaff_RBP + 0x178);
        *(undefined4 *)(lVar3 + 100 + lVar7) = 0x7f800000;
        puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
        *puVar1 = 0;
        puVar1[1] = 0;
        *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
        *(long *)(param_2 + 0x598) = lVar12 + 1;
      } while (uVar14 != uVar2);
    }
  }
  return;
}
