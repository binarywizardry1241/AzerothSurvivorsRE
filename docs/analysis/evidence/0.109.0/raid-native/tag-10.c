
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595950f(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 *puVar1;
  float *pfVar2;
  undefined4 uVar3;
  uint uVar4;
  long lVar5;
  code *pcVar6;
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  long unaff_RBP;
  ulong uVar13;
  long lVar14;
  ulong uVar15;
  int iVar16;
  uint uVar17;
  undefined4 uVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  undefined4 extraout_XMM0_Da;
  float fVar22;
  float fVar23;
  float fVar24;
  uint uVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float in_XMM14_Da;
  
  uVar3 = *param_4;
  uVar4 = param_4[1];
  fVar23 = (float)param_4[2];
  fVar22 = (float)param_4[3];
  fVar26 = (float)param_4[5];
  *(undefined4 *)(unaff_RBP + 0x150) = param_4[4];
  uVar18 = func_0x0001459577f0(param_1,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2,uVar3);
  if (uVar4 != 0) {
    fVar24 = *(float *)(param_2 + 0xa34);
    lVar14 = *(long *)(param_2 + 0x598);
    iVar16 = *(int *)(param_2 + 0xa38) + 1;
    *(int *)(param_2 + 0xa38) = iVar16;
    lVar5 = *(long *)(param_2 + 0x588);
    uVar18 = func_0x0001458d3d80(uVar18,*(undefined4 *)(unaff_RBP + 0xd0));
    in_XMM14_Da = in_XMM14_Da * fVar26;
    fVar26 = *(float *)(unaff_RBP + 0x150) + 0.0;
    if (lVar14 == lVar5) {
      func_0x000145bfad30();
    }
    lVar5 = *(long *)(param_2 + 0x590);
    lVar10 = lVar14 * 0x80;
    *(undefined8 *)(lVar5 + lVar10) = 0;
    *(undefined4 *)(lVar5 + 0x10 + lVar10) = 0;
    *(undefined8 *)(lVar5 + 0x20 + lVar10) = *(undefined8 *)(unaff_RBP + 0x180);
    *(undefined8 *)(lVar5 + 0x28 + lVar10) = 0;
    *(undefined4 *)(lVar5 + 0x30 + lVar10) = 0;
    *(float *)(lVar5 + 0x34 + lVar10) = fVar23;
    *(int *)(lVar5 + 0x3c + lVar10) = iVar16;
    *(undefined8 *)(lVar5 + 0x40 + lVar10) = *(undefined8 *)(unaff_RBP + 0xd0);
    *(undefined4 *)(lVar5 + 0x48 + lVar10) = uVar18;
    auVar7._4_4_ = fVar26 + fVar24;
    auVar7._0_4_ = fVar24;
    auVar7._8_8_ = 0;
    *(undefined1 (*) [16])(lVar5 + 0x4c + lVar10) = auVar7 << 0x20;
    *(undefined4 *)(lVar5 + 0x5c + lVar10) = uVar3;
    *(float *)(unaff_RBP + 0x178) = in_XMM14_Da;
    *(float *)(lVar5 + 0x60 + lVar10) = in_XMM14_Da;
    *(undefined4 *)(lVar5 + 100 + lVar10) = 0x7f800000;
    puVar1 = (undefined8 *)(lVar5 + 0x68 + lVar10);
    *puVar1 = 0;
    puVar1[1] = 0;
    *(undefined8 *)(lVar5 + 0x77 + lVar10) = 0;
    *(long *)(param_2 + 0x598) = lVar14 + 1;
    if (uVar4 != 1) {
      fVar26 = fVar22;
      if (fVar22 <= _DAT_145d9d2a0 + fVar23) {
        fVar26 = _DAT_145d9d2a0 + fVar23;
      }
      uVar25 = -(uint)NAN(fVar26) & (uint)fVar22 | ~-(uint)NAN(fVar26) & (uint)fVar26;
      fVar22 = *(float *)(unaff_RBP + 0x150);
      if (*(float *)(unaff_RBP + 0x150) <= _DAT_145dcce80) {
        fVar22 = _DAT_145dcce80;
      }
      uVar17 = 1;
      fVar26 = _DAT_145dcd0c4;
      fVar24 = _DAT_145dcd140;
      do {
        uVar12 = *(ulong *)(param_2 + 0x9a0);
        uVar9 = *(ulong *)(param_2 + 0x9a8);
        uVar13 = *(ulong *)(param_2 + 0x9b8);
        uVar11 = *(ulong *)(param_2 + 0x9b0);
        do {
          lVar14 = ((uVar12 + uVar13) * 0x800000 | uVar12 + uVar13 >> 0x29) + uVar12;
          uVar15 = uVar9 << 0x11;
          uVar11 = uVar11 ^ uVar12;
          uVar13 = uVar13 ^ uVar9;
          uVar9 = uVar9 ^ uVar11;
          uVar12 = uVar12 ^ uVar13;
          uVar13 = uVar13 << 0x2d | uVar13 >> 0x13;
          uVar11 = uVar11 ^ uVar15;
          fVar27 = ((float)((uint)((ulong)lVar14 >> 0x29) | 0x3f800000) + fVar26) * fVar24;
        } while (fVar24 <= fVar27);
        fVar27 = fVar27 + 0.0;
        *(ulong *)(param_2 + 0x9a0) = uVar12;
        *(ulong *)(param_2 + 0x9b8) = uVar13;
        *(ulong *)(param_2 + 0x9a8) = uVar9;
        *(ulong *)(param_2 + 0x9b0) = uVar11;
        fVar19 = (float)func_0x0001458f1080(0,fVar23,uVar25);
        fVar20 = (float)func_0x000145bfa11d(fVar27);
        fVar21 = (float)func_0x000145bfa117(fVar27);
        fVar20 = fVar19 * fVar20 + *(float *)(unaff_RBP + 0xd0);
        fVar28 = fVar19 * fVar21 + *(float *)(unaff_RBP + 0xd4);
        fVar19 = (float)uVar17 * _DAT_145dd2e38;
        iVar16 = *(int *)(param_2 + 0xa38) + 1;
        *(int *)(param_2 + 0xa38) = iVar16;
        fVar27 = *(float *)(param_2 + 0xa34);
        lVar14 = *(long *)(param_2 + 0x998);
        uVar12 = func_0x0001458d6f90(fVar21,fVar20,fVar28);
        uVar18 = extraout_XMM0_Da;
        if ((uVar12 & 1) == 0) {
          if ((*(long *)(lVar14 + 0x68) == -1) ||
             (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar18 = *(undefined4 *)(lVar14 + 0xb8);
          }
          else {
            uVar18 = *(undefined4 *)(unaff_RBP + 0x11c);
          }
        }
        lVar14 = *(long *)(param_2 + 0x598);
        if (lVar14 == *(long *)(param_2 + 0x588)) {
          func_0x000145bfad30();
        }
        fVar21 = *(float *)(unaff_RBP + 0x150);
        lVar5 = *(long *)(param_2 + 0x590);
        lVar10 = lVar14 * 0x80;
        *(undefined8 *)(lVar5 + lVar10) = 0;
        *(undefined4 *)(lVar5 + 0x10 + lVar10) = 0;
        *(undefined8 *)(lVar5 + 0x20 + lVar10) = *(undefined8 *)(unaff_RBP + 0x180);
        *(undefined8 *)(lVar5 + 0x28 + lVar10) = 0;
        *(undefined4 *)(lVar5 + 0x30 + lVar10) = 0;
        *(float *)(lVar5 + 0x34 + lVar10) = fVar23;
        *(int *)(lVar5 + 0x3c + lVar10) = iVar16;
        pfVar2 = (float *)(lVar5 + 0x40 + lVar10);
        *pfVar2 = fVar20;
        pfVar2[1] = fVar28;
        *(undefined4 *)(lVar5 + 0x48 + lVar10) = uVar18;
        auVar8._4_4_ = fVar19 + fVar21 + fVar27;
        auVar8._0_4_ = fVar27;
        auVar8._8_8_ = 0;
        *(undefined1 (*) [16])(lVar5 + 0x4c + lVar10) = auVar8 << 0x20;
        *(undefined4 *)(lVar5 + 0x5c + lVar10) = uVar3;
        *(undefined4 *)(lVar5 + 0x60 + lVar10) = *(undefined4 *)(unaff_RBP + 0x178);
        *(undefined4 *)(lVar5 + 100 + lVar10) = 0x7f800000;
        puVar1 = (undefined8 *)(lVar5 + 0x68 + lVar10);
        *puVar1 = 0;
        puVar1[1] = 0;
        *(undefined8 *)(lVar5 + 0x77 + lVar10) = 0;
        *(long *)(param_2 + 0x598) = lVar14 + 1;
        if (lVar14 + 1 == 0) {
          func_0x000145d99653();
                    /* WARNING: Does not return */
          pcVar6 = (code *)invalidInstructionException();
          (*pcVar6)();
        }
        uVar17 = uVar17 + 1;
        *(float *)(*(long *)(param_2 + 0x590) + 100 + lVar10) = fVar22;
      } while (uVar17 != uVar4);
    }
  }
  return;
}

