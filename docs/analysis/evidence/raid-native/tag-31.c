
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595b1dd(undefined8 param_1,long param_2,undefined8 param_3,undefined8 *param_4)

{
  float *pfVar1;
  undefined8 *puVar2;
  undefined4 uVar3;
  uint uVar4;
  code *pcVar5;
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  long lVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  long unaff_RBP;
  int iVar16;
  ulong uVar17;
  ulong uVar18;
  uint uVar19;
  undefined4 uVar20;
  float fVar21;
  undefined4 extraout_XMM0_Da;
  undefined8 uVar22;
  undefined8 uVar23;
  undefined4 extraout_XMM0_Dc;
  float extraout_XMM0_Dc_00;
  undefined4 extraout_XMM0_Dc_01;
  float fVar24;
  float fVar25;
  float fVar26;
  undefined8 uVar27;
  float fVar28;
  float fVar29;
  uint uVar30;
  float fVar31;
  float fVar32;
  undefined1 auVar33 [16];
  float fVar34;
  undefined1 auVar35 [16];
  float in_XMM14_Da;
  
  uVar3 = *(undefined4 *)(param_4 + 1);
  uVar4 = *(uint *)((long)param_4 + 0xc);
  fVar26 = *(float *)(param_4 + 2);
  fVar25 = *(float *)((long)param_4 + 0x14);
  uVar20 = *(undefined4 *)(param_4 + 3);
  fVar32 = *(float *)((long)param_4 + 0x1c);
  *(undefined8 *)(unaff_RBP + 0x150) = *param_4;
  *(undefined4 *)(unaff_RBP + 0xe0) = uVar20;
  uVar20 = func_0x0001459577f0(param_1,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2,uVar3);
  if (uVar4 != 0) {
    fVar34 = 0.0;
    fVar28 = _DAT_145dcd140;
    uVar20 = func_0x0001458f1080(uVar20,0,_DAT_145dcd140);
    uVar22 = func_0x000145bfa11d();
    uVar23 = func_0x000145bfa117(uVar20);
    lVar10 = func_0x00014588d0d0();
    lVar10 = lVar10 * 0xf0;
    fVar29 = (float)uVar22 * 0.0 + *(float *)(unaff_RBP + 0xd0);
    fVar31 = (float)uVar23 * 0.0 + *(float *)(unaff_RBP + 0xd4);
    uVar27 = *(undefined8 *)(lVar10 + 0x146bde458);
    auVar33._0_4_ = fVar29 - (float)uVar27;
    auVar33._4_4_ = fVar31 - (float)((ulong)uVar27 >> 0x20);
    auVar33._8_4_ = ((float)((ulong)uVar22 >> 0x20) * 0.0 + *(float *)(unaff_RBP + 0xd8)) - 0.0;
    auVar33._12_4_ = ((float)((ulong)uVar23 >> 0x20) * 0.0 + *(float *)(unaff_RBP + 0xdc)) - 0.0;
    fVar21 = (float)func_0x000145bfa12f(auVar33._0_4_,auVar33._4_4_);
    if ((_DAT_145de251c <= fVar21) &&
       (fVar24 = *(float *)(lVar10 + 0x146bde468) + _DAT_1461ffc40, fVar24 < fVar21)) {
      auVar6._4_4_ = fVar21;
      auVar6._0_4_ = fVar21;
      auVar6._8_4_ = extraout_XMM0_Dc;
      auVar6._12_4_ = extraout_XMM0_Dc;
      auVar33 = divps(auVar33,auVar6);
      fVar21 = fVar24 * auVar33._0_4_;
      fVar29 = (float)uVar27 + fVar21;
      fVar31 = (float)((ulong)uVar27 >> 0x20) + fVar24 * auVar33._4_4_;
    }
    in_XMM14_Da = in_XMM14_Da * fVar32;
    fVar34 = fVar34 + *(float *)(unaff_RBP + 0xe0);
    iVar16 = *(int *)(param_2 + 0xa38) + 1;
    *(int *)(param_2 + 0xa38) = iVar16;
    fVar32 = *(float *)(param_2 + 0xa34);
    uVar20 = func_0x0001458d3d80(fVar21,fVar29,fVar31);
    lVar10 = *(long *)(param_2 + 0x598);
    if (lVar10 == *(long *)(param_2 + 0x588)) {
      func_0x000145bfad30();
    }
    lVar13 = *(long *)(param_2 + 0x590);
    lVar11 = lVar10 * 0x80;
    *(undefined8 *)(lVar13 + lVar11) = 0;
    *(undefined4 *)(lVar13 + 0x10 + lVar11) = 0;
    *(undefined8 *)(lVar13 + 0x20 + lVar11) = *(undefined8 *)(unaff_RBP + 0x180);
    *(undefined8 *)(lVar13 + 0x28 + lVar11) = 0;
    *(undefined4 *)(lVar13 + 0x30 + lVar11) = 0;
    *(float *)(lVar13 + 0x34 + lVar11) = fVar26;
    *(int *)(lVar13 + 0x3c + lVar11) = iVar16;
    pfVar1 = (float *)(lVar13 + 0x40 + lVar11);
    *pfVar1 = fVar29;
    pfVar1[1] = fVar31;
    *(undefined4 *)(lVar13 + 0x48 + lVar11) = uVar20;
    auVar8._4_4_ = fVar34 + fVar32;
    auVar8._0_4_ = fVar32;
    auVar8._8_8_ = 0;
    *(undefined1 (*) [16])(lVar13 + 0x4c + lVar11) = auVar8 << 0x20;
    *(undefined4 *)(lVar13 + 0x5c + lVar11) = uVar3;
    *(float *)(unaff_RBP + 0x178) = in_XMM14_Da;
    *(float *)(lVar13 + 0x60 + lVar11) = in_XMM14_Da;
    *(undefined4 *)(lVar13 + 100 + lVar11) = 0x7f800000;
    puVar2 = (undefined8 *)(lVar13 + 0x68 + lVar11);
    *puVar2 = 0;
    puVar2[1] = 0;
    *(undefined8 *)(lVar13 + 0x77 + lVar11) = 0;
    *(long *)(param_2 + 0x598) = lVar10 + 1;
    if (lVar10 + 1 == 0) {
LAB_14595cb5b:
      func_0x000145d99653();
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
    lVar10 = *(long *)(param_2 + 0x590);
    *(undefined8 *)(lVar10 + lVar11) = 1;
    *(undefined8 *)(lVar10 + 8 + lVar11) = *(undefined8 *)(unaff_RBP + 0x150);
    if (uVar4 != 1) {
      fVar32 = fVar25;
      if (fVar25 <= _DAT_145d9d2a0 + fVar26) {
        fVar32 = _DAT_145d9d2a0 + fVar26;
      }
      fVar21 = *(float *)(unaff_RBP + 0xe0);
      if (*(float *)(unaff_RBP + 0xe0) <= _DAT_145dcce80) {
        fVar21 = _DAT_145dcce80;
      }
      uVar30 = -(uint)NAN(fVar32) & (uint)fVar25 | ~-(uint)NAN(fVar32) & (uint)fVar32;
      uVar19 = 1;
      fVar25 = _DAT_145dcd0c4;
      do {
        uVar15 = *(ulong *)(param_2 + 0x9a0);
        uVar12 = *(ulong *)(param_2 + 0x9a8);
        uVar17 = *(ulong *)(param_2 + 0x9b8);
        uVar14 = *(ulong *)(param_2 + 0x9b0);
        do {
          lVar10 = ((uVar15 + uVar17) * 0x800000 | uVar15 + uVar17 >> 0x29) + uVar15;
          uVar18 = uVar12 << 0x11;
          uVar14 = uVar14 ^ uVar15;
          uVar17 = uVar17 ^ uVar12;
          uVar12 = uVar12 ^ uVar14;
          uVar15 = uVar15 ^ uVar17;
          uVar17 = uVar17 << 0x2d | uVar17 >> 0x13;
          uVar14 = uVar14 ^ uVar18;
          fVar32 = ((float)((uint)((ulong)lVar10 >> 0x29) | 0x3f800000) + fVar25) * fVar28;
        } while (fVar28 <= fVar32);
        fVar32 = fVar32 + 0.0;
        *(ulong *)(param_2 + 0x9a0) = uVar15;
        *(ulong *)(param_2 + 0x9b8) = uVar17;
        *(ulong *)(param_2 + 0x9a8) = uVar12;
        *(ulong *)(param_2 + 0x9b0) = uVar14;
        fVar31 = (float)func_0x0001458f1080(0,fVar26,uVar30);
        fVar29 = extraout_XMM0_Dc_00;
        uVar22 = func_0x000145bfa11d(fVar32);
        uVar23 = func_0x000145bfa117(fVar32);
        lVar10 = func_0x00014588d0d0();
        lVar10 = lVar10 * 0xf0;
        fVar34 = fVar31 * (float)uVar22 + *(float *)(unaff_RBP + 0xd0);
        fVar31 = fVar31 * (float)uVar23 + *(float *)(unaff_RBP + 0xd4);
        uVar27 = *(undefined8 *)(lVar10 + 0x146bde458);
        auVar35._0_4_ = fVar34 - (float)uVar27;
        auVar35._4_4_ = fVar31 - (float)((ulong)uVar27 >> 0x20);
        auVar35._8_4_ =
             (fVar29 * (float)((ulong)uVar22 >> 0x20) + *(float *)(unaff_RBP + 0xd8)) - 0.0;
        auVar35._12_4_ =
             (fVar29 * (float)((ulong)uVar23 >> 0x20) + *(float *)(unaff_RBP + 0xdc)) - 0.0;
        fVar32 = (float)func_0x000145bfa12f(auVar35._0_4_,auVar35._4_4_);
        fVar29 = *(float *)(lVar10 + 0x146bde468) + _DAT_1461ffc40;
        if ((_DAT_145de251c <= fVar32) && (fVar29 < fVar32)) {
          auVar7._4_4_ = fVar32;
          auVar7._0_4_ = fVar32;
          auVar7._8_4_ = extraout_XMM0_Dc_01;
          auVar7._12_4_ = extraout_XMM0_Dc_01;
          auVar33 = divps(auVar35,auVar7);
          fVar32 = fVar29 * auVar33._0_4_;
          fVar34 = (float)uVar27 + fVar32;
          fVar31 = (float)((ulong)uVar27 >> 0x20) + fVar29 * auVar33._4_4_;
        }
        fVar24 = (float)uVar19 * _DAT_145dcd0b8;
        iVar16 = *(int *)(param_2 + 0xa38) + 1;
        *(int *)(param_2 + 0xa38) = iVar16;
        fVar29 = *(float *)(param_2 + 0xa34);
        lVar10 = *(long *)(param_2 + 0x998);
        uVar15 = func_0x0001458d6f90(fVar32,fVar34,fVar31);
        uVar20 = extraout_XMM0_Da;
        if ((uVar15 & 1) == 0) {
          if ((*(long *)(lVar10 + 0x68) == -1) ||
             (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar20 = *(undefined4 *)(lVar10 + 0xb8);
          }
          else {
            uVar20 = *(undefined4 *)(unaff_RBP + 0x11c);
          }
        }
        uVar15 = *(ulong *)(param_2 + 0x598);
        if (uVar15 == *(ulong *)(param_2 + 0x588)) {
          func_0x000145bfad30();
        }
        fVar32 = *(float *)(unaff_RBP + 0xe0);
        lVar10 = *(long *)(param_2 + 0x590);
        lVar13 = uVar15 * 0x80;
        *(undefined8 *)(lVar10 + lVar13) = 0;
        *(undefined4 *)(lVar10 + 0x10 + lVar13) = 0;
        *(undefined8 *)(lVar10 + 0x20 + lVar13) = *(undefined8 *)(unaff_RBP + 0x180);
        *(undefined8 *)(lVar10 + 0x28 + lVar13) = 0;
        *(undefined4 *)(lVar10 + 0x30 + lVar13) = 0;
        *(float *)(lVar10 + 0x34 + lVar13) = fVar26;
        *(int *)(lVar10 + 0x3c + lVar13) = iVar16;
        pfVar1 = (float *)(lVar10 + 0x40 + lVar13);
        *pfVar1 = fVar34;
        pfVar1[1] = fVar31;
        *(undefined4 *)(lVar10 + 0x48 + lVar13) = uVar20;
        auVar9._4_4_ = fVar24 + fVar32 + fVar29;
        auVar9._0_4_ = fVar29;
        auVar9._8_8_ = 0;
        *(undefined1 (*) [16])(lVar10 + 0x4c + lVar13) = auVar9 << 0x20;
        *(undefined4 *)(lVar10 + 0x5c + lVar13) = uVar3;
        *(undefined4 *)(lVar10 + 0x60 + lVar13) = *(undefined4 *)(unaff_RBP + 0x178);
        *(undefined4 *)(lVar10 + 100 + lVar13) = 0x7f800000;
        puVar2 = (undefined8 *)(lVar10 + 0x68 + lVar13);
        *puVar2 = 0;
        puVar2[1] = 0;
        *(undefined8 *)(lVar10 + 0x77 + lVar13) = 0;
        *(ulong *)(param_2 + 0x598) = uVar15 + 1;
        if (uVar15 + 1 == 0) goto LAB_14595cb5b;
        lVar10 = *(long *)(param_2 + 0x590);
        *(undefined8 *)(lVar10 + lVar13) = 1;
        *(undefined8 *)(lVar10 + 8 + lVar13) = *(undefined8 *)(unaff_RBP + 0x150);
        if (*(ulong *)(param_2 + 0x598) <= uVar15) {
          func_0x000145d99653();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        uVar19 = uVar19 + 1;
        *(float *)(*(long *)(param_2 + 0x590) + 100 + lVar13) = fVar21;
      } while (uVar19 != uVar4);
    }
  }
  return;
}

