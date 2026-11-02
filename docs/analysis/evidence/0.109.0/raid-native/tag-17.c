
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145958025(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 *puVar1;
  float fVar2;
  float fVar3;
  undefined4 uVar4;
  uint uVar5;
  long lVar6;
  code *pcVar7;
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  undefined4 uVar10;
  undefined4 uVar11;
  ulong uVar12;
  long lVar13;
  long unaff_RBP;
  int iVar14;
  uint uVar15;
  long lVar16;
  uint uVar17;
  undefined4 uVar18;
  float fVar19;
  float fVar20;
  undefined4 extraout_XMM0_Da;
  undefined4 extraout_XMM0_Da_00;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  undefined4 in_XMM14_Da;
  
  *(undefined4 *)(unaff_RBP + 0x178) = in_XMM14_Da;
  uVar4 = *param_4;
  iVar14 = param_4[1];
  uVar5 = param_4[2];
  *(undefined4 *)(unaff_RBP + 0x150) = param_4[3];
  uVar18 = param_4[4];
  *(undefined4 *)(unaff_RBP + 0xb8) = param_4[5];
  fVar22 = (float)param_4[6];
  *(undefined4 *)(unaff_RBP + 0xf0) = uVar18;
  uVar18 = func_0x0001459577f0(iVar14,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2,uVar4);
  uVar18 = func_0x0001458f1080(uVar18,0,_DAT_145dcd140);
  fVar19 = (float)func_0x000145bfa11d();
  fVar20 = (float)func_0x000145bfa117(uVar18);
  *(int *)(unaff_RBP + 0xcc) = iVar14;
  if ((iVar14 != 0) && (uVar5 != 0)) {
    fVar21 = _DAT_145de2510 * *(float *)(unaff_RBP + 0x150);
    *(float *)(unaff_RBP + 0x50) = _DAT_145dd4ea4 * *(float *)(unaff_RBP + 0x150);
    fVar23 = _DAT_145d9d2a4;
    *(float *)(unaff_RBP + 0x60) =
         ((float)*(uint *)(unaff_RBP + 0xcc) + _DAT_145dcd0c4) * _DAT_145d9d2a4;
    fVar23 = (float)uVar5 * fVar23 * fVar21;
    *(float *)(unaff_RBP + 0x178) = *(float *)(unaff_RBP + 0x178) * fVar22;
    *(float *)(unaff_RBP + 0x10c) = fVar21;
    uVar11 = uRam0000000145dcd0ac;
    uVar10 = uRam0000000145dcd0a8;
    uVar18 = uRam0000000145dcd0a4;
    uVar17 = _DAT_145dcd0a0;
    fVar22 = fVar21 * 0.0 - fVar23;
    *(undefined1 (*) [16])(unaff_RBP + 0x90) = ZEXT416((uint)fVar22);
    *(uint *)(unaff_RBP + -0x30) = uVar17 ^ (uint)fVar22;
    *(undefined4 *)(unaff_RBP + -0x2c) = uVar18;
    *(undefined4 *)(unaff_RBP + -0x28) = uVar10;
    *(undefined4 *)(unaff_RBP + -0x24) = uVar11;
    fVar22 = *(float *)(unaff_RBP + 0xb8) * 0.0 + *(float *)(unaff_RBP + 0xf0);
    *(float *)(unaff_RBP + 0x40) = fVar22;
    uVar17 = 0;
    do {
      fVar21 = *(float *)(unaff_RBP + 0x90);
      if ((uVar17 & 1) != 0) {
        fVar21 = *(float *)(unaff_RBP + -0x30);
      }
      fVar24 = ((float)uVar17 - *(float *)(unaff_RBP + 0x60)) * *(float *)(unaff_RBP + 0x50);
      fVar25 = fVar20 * fVar24;
      fVar24 = fVar24 * fVar19;
      fVar27 = (fVar19 * fVar21 + *(float *)(unaff_RBP + 0xd0)) - fVar25;
      fVar26 = fVar21 * fVar20 + *(float *)(unaff_RBP + 0xe0) + fVar24;
      iVar14 = *(int *)(param_2 + 0xa38) + 1;
      *(int *)(param_2 + 0xa38) = iVar14;
      fVar21 = *(float *)(param_2 + 0xa34);
      lVar16 = *(long *)(param_2 + 0x998);
      uVar12 = func_0x0001458d6f90(fVar22,fVar27,fVar26);
      uVar18 = extraout_XMM0_Da;
      if ((uVar12 & 1) == 0) {
        if ((*(long *)(lVar16 + 0x68) == -1) ||
           (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
          uVar18 = *(undefined4 *)(lVar16 + 0xb8);
        }
        else {
          uVar18 = *(undefined4 *)(unaff_RBP + 0x11c);
        }
      }
      lVar16 = *(long *)(param_2 + 0x598);
      if (lVar16 == *(long *)(param_2 + 0x588)) {
        func_0x000145bfad30();
      }
      lVar13 = lVar16 * 0x80;
      fVar22 = *(float *)(unaff_RBP + 0x40);
      lVar6 = *(long *)(param_2 + 0x590);
      *(undefined8 *)(lVar6 + lVar13) = 0;
      *(undefined4 *)(lVar6 + 0x10 + lVar13) = 0;
      *(undefined8 *)(lVar6 + 0x20 + lVar13) = *(undefined8 *)(unaff_RBP + 0x180);
      *(undefined8 *)(lVar6 + 0x28 + lVar13) = 0;
      *(undefined4 *)(lVar6 + 0x30 + lVar13) = 0;
      *(undefined4 *)(lVar6 + 0x34 + lVar13) = *(undefined4 *)(unaff_RBP + 0x150);
      *(int *)(lVar6 + 0x3c + lVar13) = iVar14;
      *(float *)(lVar6 + 0x40 + lVar13) = fVar27;
      *(float *)(lVar6 + 0x44 + lVar13) = fVar26;
      *(undefined4 *)(lVar6 + 0x48 + lVar13) = uVar18;
      auVar8._4_4_ = fVar22 + fVar21;
      auVar8._0_4_ = fVar21;
      auVar8._8_8_ = 0;
      *(undefined1 (*) [16])(lVar6 + 0x4c + lVar13) = auVar8 << 0x20;
      *(undefined4 *)(lVar6 + 0x5c + lVar13) = uVar4;
      *(undefined4 *)(lVar6 + 0x60 + lVar13) = *(undefined4 *)(unaff_RBP + 0x178);
      *(undefined4 *)(lVar6 + 100 + lVar13) = 0x7f800000;
      puVar1 = (undefined8 *)(lVar6 + 0x68 + lVar13);
      *puVar1 = 0;
      puVar1[1] = 0;
      *(undefined8 *)(lVar6 + 0x77 + lVar13) = 0;
      *(long *)(param_2 + 0x598) = lVar16 + 1;
      if (uVar5 != 1) {
        uVar15 = 1;
        do {
          fVar21 = (float)uVar15;
          fVar22 = *(float *)(unaff_RBP + 0x10c) * fVar21 - fVar23;
          if ((uVar17 & 1) != 0) {
            fVar22 = (float)((uint)fVar22 ^ _DAT_145dcd0a0);
          }
          fVar27 = (fVar19 * fVar22 + *(float *)(unaff_RBP + 0xd0)) - fVar25;
          fVar26 = fVar22 * fVar20 + *(float *)(unaff_RBP + 0xe0) + fVar24;
          iVar14 = *(int *)(param_2 + 0xa38) + 1;
          *(int *)(param_2 + 0xa38) = iVar14;
          fVar22 = *(float *)(param_2 + 0xa34);
          lVar16 = *(long *)(param_2 + 0x998);
          uVar12 = func_0x0001458d6f90(0,fVar27,fVar26);
          if ((uVar12 & 1) == 0) {
            if ((*(long *)(lVar16 + 0x68) == -1) ||
               (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
              uVar18 = *(undefined4 *)(lVar16 + 0xb8);
              lVar16 = *(long *)(param_2 + 0x598);
              if (lVar16 == *(long *)(param_2 + 0x588)) {
LAB_1459583e5:
                func_0x000145bfad30();
              }
            }
            else {
              uVar18 = *(undefined4 *)(unaff_RBP + 0x11c);
              lVar16 = *(long *)(param_2 + 0x598);
              if (lVar16 == *(long *)(param_2 + 0x588)) goto LAB_1459583e5;
            }
          }
          else {
            lVar16 = *(long *)(param_2 + 0x598);
            uVar18 = extraout_XMM0_Da_00;
            if (lVar16 == *(long *)(param_2 + 0x588)) goto LAB_1459583e5;
          }
          fVar2 = *(float *)(unaff_RBP + 0xb8);
          fVar3 = *(float *)(unaff_RBP + 0xf0);
          lVar6 = *(long *)(param_2 + 0x590);
          lVar13 = lVar16 * 0x80;
          *(undefined8 *)(lVar6 + lVar13) = 0;
          *(undefined4 *)(lVar6 + 0x10 + lVar13) = 0;
          *(undefined8 *)(lVar6 + 0x20 + lVar13) = *(undefined8 *)(unaff_RBP + 0x180);
          *(undefined8 *)(lVar6 + 0x28 + lVar13) = 0;
          *(undefined4 *)(lVar6 + 0x30 + lVar13) = 0;
          *(undefined4 *)(lVar6 + 0x34 + lVar13) = *(undefined4 *)(unaff_RBP + 0x150);
          *(int *)(lVar6 + 0x3c + lVar13) = iVar14;
          *(float *)(lVar6 + 0x40 + lVar13) = fVar27;
          *(float *)(lVar6 + 0x44 + lVar13) = fVar26;
          *(undefined4 *)(lVar6 + 0x48 + lVar13) = uVar18;
          auVar9._4_4_ = fVar21 * fVar2 + fVar3 + fVar22;
          auVar9._0_4_ = fVar22;
          auVar9._8_8_ = 0;
          *(undefined1 (*) [16])(lVar6 + 0x4c + lVar13) = auVar9 << 0x20;
          *(undefined4 *)(lVar6 + 0x5c + lVar13) = uVar4;
          *(undefined4 *)(lVar6 + 0x60 + lVar13) = *(undefined4 *)(unaff_RBP + 0x178);
          *(undefined4 *)(lVar6 + 100 + lVar13) = 0x7f800000;
          puVar1 = (undefined8 *)(lVar6 + 0x68 + lVar13);
          *puVar1 = 0;
          puVar1[1] = 0;
          *(undefined8 *)(lVar6 + 0x77 + lVar13) = 0;
          *(long *)(param_2 + 0x598) = lVar16 + 1;
          if (lVar16 + 1 == 0) {
            func_0x000145d99653();
                    /* WARNING: Does not return */
            pcVar7 = (code *)invalidInstructionException();
            (*pcVar7)();
          }
          uVar15 = uVar15 + 1;
          *(undefined4 *)(*(long *)(param_2 + 0x590) + 100 + lVar13) = 0x3fb33333;
        } while (uVar5 != uVar15);
      }
      fVar22 = 0.0;
      uVar17 = uVar17 + 1;
    } while (uVar17 != *(uint *)(unaff_RBP + 0xcc));
  }
  return;
}

