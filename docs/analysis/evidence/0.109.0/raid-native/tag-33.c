
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595a795(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 *puVar1;
  undefined4 uVar2;
  long lVar3;
  code *pcVar4;
  undefined1 auVar5 [16];
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
  uint uVar15;
  undefined4 uVar16;
  float fVar17;
  undefined4 extraout_XMM0_Da;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined4 extraout_XMM0_Dc;
  float fVar20;
  float fVar21;
  float fVar22;
  undefined1 auVar23 [16];
  float fVar24;
  float fVar25;
  float fVar26;
  undefined1 auVar27 [16];
  float fVar28;
  float fVar29;
  float fVar30;
  
  uVar2 = *param_4;
  iVar10 = param_4[1];
  *(undefined4 *)(unaff_RBP + 0xe0) = param_4[2];
  *(undefined4 *)(unaff_RBP + 0x150) = param_4[3];
  uVar16 = param_4[4];
  *(undefined4 *)(unaff_RBP + 0x10c) = param_4[5];
  *(undefined4 *)(unaff_RBP + 0x178) = uVar2;
  *(undefined4 *)(unaff_RBP + 0xb8) = uVar16;
  uVar16 = func_0x0001459577f0(param_1,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2);
  fVar17 = (float)func_0x0001458f1080(uVar16,0,_DAT_145dcd140);
  uVar15 = iVar10 + (uint)(iVar10 == 0);
  fVar30 = (float)uVar15;
  uVar14 = 0;
  fVar21 = _DAT_145de21f0;
  fVar24 = _DAT_145dcd0c4;
  fVar28 = _DAT_145de7a30;
  fVar29 = _DAT_145d9d2a0;
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
      fVar22 = ((float)((uint)((ulong)lVar12 >> 0x29) | 0x3f800000) + fVar24) * fVar21 + fVar28;
    } while (fVar29 <= fVar22);
    fVar25 = ((float)uVar14 / fVar30) * _DAT_145dcd140 + fVar17;
    *(ulong *)(param_2 + 0x9a0) = uVar9;
    *(ulong *)(param_2 + 0x9b8) = uVar11;
    *(ulong *)(param_2 + 0x9a8) = uVar6;
    *(ulong *)(param_2 + 0x9b0) = uVar8;
    fVar22 = fVar22 * *(float *)(unaff_RBP + 0x150);
    fVar20 = 0.0;
    uVar18 = func_0x000145bfa11d(fVar25);
    uVar19 = func_0x000145bfa117(fVar25);
    lVar12 = func_0x00014588d0d0();
    lVar12 = lVar12 * 0xf0;
    fVar25 = fVar22 * (float)uVar18 + *(float *)(unaff_RBP + 0xd0);
    fVar26 = fVar22 * (float)uVar19 + *(float *)(unaff_RBP + 0xd4);
    uVar9 = *(ulong *)(lVar12 + 0x146bde458);
    auVar23._8_8_ = 0;
    auVar23._0_8_ = uVar9;
    auVar27._0_4_ = fVar25 - (float)uVar9;
    auVar27._4_4_ = fVar26 - (float)(uVar9 >> 0x20);
    auVar27._8_4_ = (fVar20 * (float)((ulong)uVar18 >> 0x20) + *(float *)(unaff_RBP + 0xd8)) - 0.0;
    auVar27._12_4_ = (fVar20 * (float)((ulong)uVar19 >> 0x20) + *(float *)(unaff_RBP + 0xdc)) - 0.0;
    fVar22 = (float)func_0x000145bfa12f(auVar27._0_4_,auVar27._4_4_);
    fVar20 = *(float *)(lVar12 + 0x146bde468) + _DAT_1461ffc40;
    if ((_DAT_145de251c <= fVar22) && (fVar20 < fVar22)) {
      auVar5._4_4_ = fVar22;
      auVar5._0_4_ = fVar22;
      auVar5._8_4_ = extraout_XMM0_Dc;
      auVar5._12_4_ = extraout_XMM0_Dc;
      auVar27 = divps(auVar27,auVar5);
      fVar22 = fVar20 * auVar27._0_4_;
      fVar25 = auVar23._0_4_ + fVar22;
      fVar26 = auVar23._4_4_ + fVar20 * auVar27._4_4_;
    }
    iVar10 = *(int *)(param_2 + 0xa38) + 1;
    *(int *)(param_2 + 0xa38) = iVar10;
    fVar20 = *(float *)(param_2 + 0xa34);
    lVar12 = *(long *)(param_2 + 0x998);
    uVar9 = func_0x0001458d6f90(fVar22,fVar25,fVar26);
    if ((uVar9 & 1) == 0) {
      if ((*(long *)(lVar12 + 0x68) == -1) ||
         (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
        uVar16 = *(undefined4 *)(lVar12 + 0xb8);
        lVar12 = *(long *)(param_2 + 0x598);
        if (lVar12 == *(long *)(param_2 + 0x588)) goto LAB_14595a840;
      }
      else {
        uVar16 = *(undefined4 *)(unaff_RBP + 0x11c);
        lVar12 = *(long *)(param_2 + 0x598);
        if (lVar12 == *(long *)(param_2 + 0x588)) {
LAB_14595a840:
          func_0x000145bfad30();
        }
      }
    }
    else {
      lVar12 = *(long *)(param_2 + 0x598);
      uVar16 = extraout_XMM0_Da;
      if (lVar12 == *(long *)(param_2 + 0x588)) goto LAB_14595a840;
    }
    uVar14 = uVar14 + 1;
    fVar22 = *(float *)(unaff_RBP + 0xb8);
    lVar3 = *(long *)(param_2 + 0x590);
    lVar7 = lVar12 * 0x80;
    *(undefined8 *)(lVar3 + lVar7) = 0;
    *(undefined4 *)(lVar3 + 0x10 + lVar7) = 5;
    *(undefined4 *)(lVar3 + 0x14 + lVar7) = *(undefined4 *)(unaff_RBP + 0x10c);
    *(undefined8 *)(lVar3 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
    *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
    *(undefined4 *)(lVar3 + 0x30 + lVar7) = 0;
    *(undefined4 *)(lVar3 + 0x34 + lVar7) = *(undefined4 *)(unaff_RBP + 0xe0);
    *(int *)(lVar3 + 0x3c + lVar7) = iVar10;
    *(ulong *)(lVar3 + 0x40 + lVar7) = CONCAT44(fVar26,fVar25);
    *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar16;
    *(undefined4 *)(lVar3 + 0x4c + lVar7) = 0;
    *(float *)(lVar3 + 0x50 + lVar7) = fVar20;
    *(float *)(lVar3 + 0x54 + lVar7) = fVar22 + fVar20;
    *(undefined4 *)(lVar3 + 0x58 + lVar7) = 0;
    *(undefined4 *)(lVar3 + 0x5c + lVar7) = *(undefined4 *)(unaff_RBP + 0x178);
    *(undefined8 *)(lVar3 + 0x60 + lVar7) = _DAT_1461ebcf0;
    puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
    *puVar1 = 0;
    puVar1[1] = 0;
    *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
    *(long *)(param_2 + 0x598) = lVar12 + 1;
    if (uVar14 == uVar15) {
      if (*(ulong *)(param_2 + 0x568) <= *(ulong *)(unaff_RBP + 0xf0)) {
        func_0x000145d99653();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      uVar18 = func_0x00014590d9a0();
      func_0x0001458ec500(uVar18,param_2 + 0x618,0x20,0x14722af98);
      func_0x0001458c1260();
      func_0x000141196a70();
      return;
    }
  } while( true );
}

