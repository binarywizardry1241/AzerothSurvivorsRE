
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145959ceb(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  uint uVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  long lVar7;
  ulong uVar8;
  long unaff_RBP;
  int iVar9;
  uint uVar10;
  float fVar11;
  undefined4 uVar12;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar13;
  float fVar14;
  float fVar15;
  undefined4 uVar16;
  float fVar17;
  undefined4 uVar18;
  float fVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  float in_XMM14_Da;
  float fVar23;
  float in_XMM15_Da;
  float fVar24;
  
  uVar20 = *param_4;
  uVar3 = param_4[1];
  uVar13 = param_4[2];
  uVar16 = param_4[3];
  fVar23 = in_XMM14_Da * (float)param_4[5];
  fVar24 = in_XMM15_Da + _DAT_145d9d2a0 + (float)param_4[4];
  func_0x0001459577f0(param_1,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2,uVar20);
  fVar19 = ((float)uVar3 + _DAT_145dcd0c4) * _DAT_145d9d2a4;
  fVar17 = (0.0 - fVar19) * _DAT_145dd4e58 + *(float *)(unaff_RBP + 0x178);
  fVar11 = (float)func_0x000145bfa11d(fVar17);
  fVar17 = (float)func_0x000145bfa117(fVar17);
  fVar14 = fVar11 * _DAT_145fb4810 + *(float *)(unaff_RBP + 0x150);
  fVar15 = fVar17 * fRam0000000145fb4814 + *(float *)(unaff_RBP + 0x154);
  iVar9 = *(int *)(param_2 + 0xa38) + 1;
  *(int *)(param_2 + 0xa38) = iVar9;
  fVar11 = *(float *)(param_2 + 0xa34);
  uVar12 = func_0x0001458d3d80(fVar17,fVar14,fVar15);
  lVar4 = *(long *)(param_2 + 0x598);
  if (lVar4 == *(long *)(param_2 + 0x588)) {
    func_0x000145bfad30();
  }
  fVar17 = _DAT_145d9d2a0 + fVar11;
  lVar5 = *(long *)(param_2 + 0x590);
  lVar7 = lVar4 * 0x80;
  *(undefined8 *)(lVar5 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x10 + lVar7) = 3;
  *(float *)(lVar5 + 0x14 + lVar7) = fVar24;
  *(ulong *)(lVar5 + 0x18 + lVar7) = (ulong)(uint)_DAT_145d9d2a4;
  *(undefined8 *)(lVar5 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
  *(undefined8 *)(lVar5 + 0x28 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x30 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x34 + lVar7) = uVar13;
  *(int *)(lVar5 + 0x3c + lVar7) = iVar9;
  *(ulong *)(lVar5 + 0x40 + lVar7) = CONCAT44(fVar15,fVar14);
  *(undefined4 *)(lVar5 + 0x48 + lVar7) = uVar12;
  *(undefined4 *)(lVar5 + 0x4c + lVar7) = 0;
  *(float *)(lVar5 + 0x50 + lVar7) = fVar11;
  *(float *)(lVar5 + 0x54 + lVar7) = fVar17;
  *(undefined4 *)(lVar5 + 0x58 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x5c + lVar7) = uVar20;
  *(float *)(lVar5 + 0x60 + lVar7) = fVar23;
  *(undefined4 *)(lVar5 + 100 + lVar7) = 0x7f800000;
  puVar1 = (undefined8 *)(lVar5 + 0x68 + lVar7);
  *puVar1 = 0;
  puVar1[1] = 0;
  *(undefined8 *)(lVar5 + 0x77 + lVar7) = 0;
  *(long *)(param_2 + 0x598) = lVar4 + 1;
  if (lVar4 + 1 == 0) {
LAB_14595cb2c:
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  *(undefined4 *)(*(long *)(param_2 + 0x590) + 0x70 + lVar7) = uVar16;
  if (1 < uVar3) {
    uVar10 = 1;
    uVar20 = 0;
    uVar12 = 0;
    uVar21 = 0;
    uVar22 = 0;
    do {
      fVar17 = ((float)uVar10 - fVar19) * _DAT_145dd4e58 + *(float *)(unaff_RBP + 0x178);
      fVar11 = (float)func_0x000145bfa11d(fVar17);
      fVar17 = (float)func_0x000145bfa117(fVar17);
      fVar14 = fVar11 * _DAT_145fb4810 + *(float *)(unaff_RBP + 0x150);
      fVar15 = fVar17 * fRam0000000145fb4814 + *(float *)(unaff_RBP + 0x154);
      iVar9 = *(int *)(param_2 + 0xa38) + 1;
      *(int *)(param_2 + 0xa38) = iVar9;
      fVar11 = *(float *)(param_2 + 0xa34);
      lVar4 = *(long *)(param_2 + 0x998);
      uVar8 = func_0x0001458d6f90(fVar17,fVar14,fVar15);
      uVar18 = extraout_XMM0_Da;
      if ((uVar8 & 1) == 0) {
        if ((*(long *)(lVar4 + 0x68) == -1) ||
           (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
          uVar18 = *(undefined4 *)(lVar4 + 0xb8);
        }
        else {
          uVar18 = *(undefined4 *)(unaff_RBP + 0x11c);
        }
      }
      lVar4 = *(long *)(param_2 + 0x598);
      if (lVar4 == *(long *)(param_2 + 0x588)) {
        func_0x000145bfad30();
      }
      fVar17 = fVar11 + _DAT_145d9d2a0;
      lVar5 = *(long *)(param_2 + 0x590);
      lVar7 = lVar4 * 0x80;
      *(undefined8 *)(lVar5 + lVar7) = 0;
      *(undefined4 *)(lVar5 + 0x10 + lVar7) = 3;
      *(float *)(lVar5 + 0x14 + lVar7) = fVar24;
      *(ulong *)(lVar5 + 0x18 + lVar7) = (ulong)(uint)_DAT_145d9d2a4;
      *(undefined8 *)(lVar5 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
      *(undefined8 *)(lVar5 + 0x28 + lVar7) = 0;
      *(undefined4 *)(lVar5 + 0x30 + lVar7) = 0;
      *(undefined4 *)(lVar5 + 0x34 + lVar7) = uVar13;
      *(int *)(lVar5 + 0x3c + lVar7) = iVar9;
      *(ulong *)(lVar5 + 0x40 + lVar7) = CONCAT44(fVar15,fVar14);
      *(undefined4 *)(lVar5 + 0x48 + lVar7) = uVar18;
      *(undefined4 *)(lVar5 + 0x4c + lVar7) = 0;
      *(float *)(lVar5 + 0x50 + lVar7) = fVar11;
      *(float *)(lVar5 + 0x54 + lVar7) = fVar17;
      *(undefined8 *)(lVar5 + 0x58 + lVar7) = 0;
      *(float *)(lVar5 + 0x60 + lVar7) = fVar23;
      *(undefined4 *)(lVar5 + 100 + lVar7) = 0x7f800000;
      puVar2 = (undefined4 *)(lVar5 + 0x68 + lVar7);
      *puVar2 = uVar20;
      puVar2[1] = uVar12;
      puVar2[2] = uVar21;
      puVar2[3] = uVar22;
      *(undefined8 *)(lVar5 + 0x77 + lVar7) = 0;
      *(long *)(param_2 + 0x598) = lVar4 + 1;
      if (lVar4 + 1 == 0) goto LAB_14595cb2c;
      uVar10 = uVar10 + 1;
      *(undefined4 *)(*(long *)(param_2 + 0x590) + 0x70 + lVar7) = uVar16;
    } while (uVar3 != uVar10);
  }
  return;
}

