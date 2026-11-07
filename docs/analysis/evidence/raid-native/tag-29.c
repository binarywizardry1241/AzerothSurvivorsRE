
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595b8f7(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 *puVar1;
  uint uVar2;
  long lVar3;
  code *pcVar4;
  uint uVar5;
  ulong uVar6;
  long lVar7;
  uint uVar8;
  long unaff_RBP;
  uint uVar9;
  long lVar10;
  int iVar11;
  uint uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 extraout_XMM0_Da;
  undefined4 extraout_XMM0_Da_00;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined4 extraout_XMM0_Dc;
  undefined4 extraout_XMM0_Dc_00;
  undefined4 extraout_XMM0_Dd;
  undefined4 extraout_XMM0_Dd_00;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  undefined4 uVar24;
  float fVar25;
  float fVar26;
  float in_XMM14_Da;
  float fVar27;
  float fVar28;
  
  uVar24 = *param_4;
  uVar2 = param_4[1];
  fVar26 = (float)param_4[2];
  uVar13 = param_4[3];
  fVar17 = (float)param_4[4];
  iVar11 = param_4[5];
  *(float *)(unaff_RBP + 0x178) = in_XMM14_Da * (float)param_4[6];
  *(undefined4 *)(unaff_RBP + 0xb8) = uVar24;
  *(undefined4 *)(unaff_RBP + 0x10c) = uVar13;
  uVar13 = func_0x0001459577f0(iVar11,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2);
  uVar14 = func_0x0001458f1080(uVar13,0,_DAT_145dcd140);
  uVar15 = func_0x000145bfa11d();
  *(undefined4 *)(unaff_RBP + 0xe0) = uVar14;
  uVar13 = extraout_XMM0_Dc;
  uVar24 = extraout_XMM0_Dd;
  uVar16 = func_0x000145bfa117(uVar14);
  fVar22 = (float)uVar15;
  fVar23 = (float)uVar16;
  fVar28 = ((float)uVar2 + _DAT_145dcd0c4) * _DAT_145d9d2a4;
  *(undefined8 *)(unaff_RBP + 0x40) = uVar15;
  *(undefined4 *)(unaff_RBP + 0x48) = uVar13;
  *(undefined4 *)(unaff_RBP + 0x4c) = uVar24;
  *(undefined8 *)(unaff_RBP + 0x50) = uVar16;
  *(undefined4 *)(unaff_RBP + 0x58) = extraout_XMM0_Dc_00;
  *(undefined4 *)(unaff_RBP + 0x5c) = extraout_XMM0_Dd_00;
  fVar19 = _DAT_147229970 * fVar22 * _DAT_145de2260 + *(float *)(unaff_RBP + 0xd0);
  fVar20 = fRam0000000147229974 * fVar23 * fRam0000000145de2264 + *(float *)(unaff_RBP + 0xd4);
  fVar21 = fRam000000014722997c * (float)((ulong)uVar16 >> 0x20) * fRam0000000145de226c +
           *(float *)(unaff_RBP + 0xdc);
  *(float *)(unaff_RBP + 0x60) = fVar20;
  *(float *)(unaff_RBP + 100) = fVar20;
  *(float *)(unaff_RBP + 0x68) = fVar21;
  *(float *)(unaff_RBP + 0x6c) = fVar21;
  fVar21 = _DAT_145dcd0dc;
  *(float *)(unaff_RBP + 0xcc) = fVar17;
  fVar18 = fVar21 * fVar17;
  if (_DAT_145dcce80 <= fVar21 * fVar17) {
    fVar18 = _DAT_145dcce80;
  }
  *(float *)(unaff_RBP + 0xd0) = fVar18;
  *(uint *)(unaff_RBP + 0xf0) = iVar11 + (uint)(iVar11 == 0);
  *(uint *)(unaff_RBP + 0x150) = uVar2 + (uVar2 == 0);
  uVar8 = 0;
  do {
    uVar9 = uVar8 & 1;
    if (uVar9 < *(uint *)(unaff_RBP + 0x150)) {
      fVar17 = ((float)uVar9 - fVar28) * fVar26;
      fVar21 = *(float *)(unaff_RBP + 0x50) * fVar17;
      fVar25 = fVar19 - fVar21;
      fVar18 = fVar17 * *(float *)(unaff_RBP + 0x40) + *(float *)(unaff_RBP + 0x60);
      iVar11 = *(int *)(param_2 + 0xa38) + 1;
      *(int *)(param_2 + 0xa38) = iVar11;
      fVar17 = *(float *)(param_2 + 0xa34);
      lVar10 = *(long *)(param_2 + 0x998);
      uVar6 = func_0x0001458d6f90(fVar21,fVar25,fVar18);
      if ((uVar6 & 1) == 0) {
        uVar13 = *(undefined4 *)(unaff_RBP + 0x178);
        if ((*(long *)(lVar10 + 0x68) == -1) ||
           (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
          uVar24 = *(undefined4 *)(lVar10 + 0xb8);
        }
        else {
          uVar24 = *(undefined4 *)(unaff_RBP + 0x11c);
        }
      }
      else {
        uVar13 = *(undefined4 *)(unaff_RBP + 0x178);
        uVar24 = extraout_XMM0_Da;
      }
      lVar10 = *(long *)(param_2 + 0x598);
      if (lVar10 == *(long *)(param_2 + 0x588)) {
        func_0x000145bfad30();
      }
      fVar21 = (float)uVar8 * *(float *)(unaff_RBP + 0xcc) + *(float *)(unaff_RBP + 0x10c);
      lVar7 = lVar10 * 0x80;
      lVar3 = *(long *)(param_2 + 0x590);
      *(undefined8 *)(lVar3 + lVar7) = 0;
      *(undefined4 *)(lVar3 + 0x10 + lVar7) = 0;
      *(undefined8 *)(lVar3 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
      *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
      *(undefined8 *)(lVar3 + 0x30 + lVar7) = 0x4270000000000002;
      *(float *)(lVar3 + 0x38 + lVar7) = fVar26;
      *(int *)(lVar3 + 0x3c + lVar7) = iVar11;
      *(float *)(lVar3 + 0x40 + lVar7) = fVar25;
      *(float *)(lVar3 + 0x44 + lVar7) = fVar18;
      *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar24;
      *(undefined4 *)(lVar3 + 0x4c + lVar7) = *(undefined4 *)(unaff_RBP + 0xe0);
      *(float *)(lVar3 + 0x50 + lVar7) = fVar17;
      *(float *)(lVar3 + 0x54 + lVar7) = fVar21 + fVar17;
      *(undefined4 *)(lVar3 + 0x58 + lVar7) = 0;
      *(undefined4 *)(lVar3 + 0x5c + lVar7) = *(undefined4 *)(unaff_RBP + 0xb8);
      *(undefined4 *)(lVar3 + 0x60 + lVar7) = uVar13;
      *(undefined4 *)(lVar3 + 100 + lVar7) = 0x7f800000;
      puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
      *puVar1 = 0;
      puVar1[1] = 0;
      *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
      *(long *)(param_2 + 0x598) = lVar10 + 1;
      if (uVar8 != 0) {
        if (lVar10 == -1) {
LAB_14595cb15:
          func_0x000145d99653();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        *(undefined4 *)(*(long *)(param_2 + 0x590) + 100 + lVar7) =
             *(undefined4 *)(unaff_RBP + 0xd0);
      }
      uVar9 = uVar9 + 1;
      uVar5 = uVar2 - uVar9;
      if (uVar2 < uVar9) {
        uVar5 = 0;
      }
      for (; uVar12 = (uVar9 ^ uVar8) & 1, uVar12 < uVar5; uVar5 = (uVar5 + (uVar5 == 0)) - uVar9) {
        fVar18 = ((float)(uVar12 + uVar9) - fVar28) * fVar26;
        fVar25 = fVar19 - fVar18 * fVar23;
        fVar27 = fVar18 * fVar22 + fVar20;
        iVar11 = *(int *)(param_2 + 0xa38) + 1;
        *(int *)(param_2 + 0xa38) = iVar11;
        fVar17 = *(float *)(param_2 + 0xa34);
        lVar10 = *(long *)(param_2 + 0x998);
        uVar6 = func_0x0001458d6f90(fVar18,fVar25,fVar27);
        if ((uVar6 & 1) == 0) {
          if ((*(long *)(lVar10 + 0x68) == -1) ||
             (func_0x0001458dc180(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar13 = *(undefined4 *)(lVar10 + 0xb8);
            lVar10 = *(long *)(param_2 + 0x598);
            if (lVar10 == *(long *)(param_2 + 0x588)) {
LAB_14595bcba:
              func_0x000145bfad30();
            }
          }
          else {
            uVar13 = *(undefined4 *)(unaff_RBP + 0x11c);
            lVar10 = *(long *)(param_2 + 0x598);
            if (lVar10 == *(long *)(param_2 + 0x588)) goto LAB_14595bcba;
          }
        }
        else {
          lVar10 = *(long *)(param_2 + 0x598);
          uVar13 = extraout_XMM0_Da_00;
          if (lVar10 == *(long *)(param_2 + 0x588)) goto LAB_14595bcba;
        }
        lVar7 = lVar10 * 0x80;
        lVar3 = *(long *)(param_2 + 0x590);
        *(undefined8 *)(lVar3 + lVar7) = 0;
        *(undefined4 *)(lVar3 + 0x10 + lVar7) = 0;
        *(undefined8 *)(lVar3 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
        *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
        *(undefined8 *)(lVar3 + 0x30 + lVar7) = 0x4270000000000002;
        *(float *)(lVar3 + 0x38 + lVar7) = fVar26;
        *(int *)(lVar3 + 0x3c + lVar7) = iVar11;
        *(ulong *)(lVar3 + 0x40 + lVar7) = CONCAT44(fVar27,fVar25);
        *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar13;
        *(undefined4 *)(lVar3 + 0x4c + lVar7) = *(undefined4 *)(unaff_RBP + 0xe0);
        *(float *)(lVar3 + 0x50 + lVar7) = fVar17;
        *(float *)(lVar3 + 0x54 + lVar7) = fVar21 + fVar17;
        *(undefined8 *)(lVar3 + 0x58 + lVar7) = 0;
        *(undefined4 *)(lVar3 + 0x60 + lVar7) = *(undefined4 *)(unaff_RBP + 0x178);
        *(undefined4 *)(lVar3 + 100 + lVar7) = 0x7f800000;
        puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
        *puVar1 = 0;
        puVar1[1] = 0;
        *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
        *(long *)(param_2 + 0x598) = lVar10 + 1;
        if (uVar8 != 0) {
          if (lVar10 == -1) goto LAB_14595cb15;
          *(undefined4 *)(*(long *)(param_2 + 0x590) + 100 + lVar7) =
               *(undefined4 *)(unaff_RBP + 0xd0);
        }
        uVar9 = uVar9 + uVar12 + 1;
        uVar5 = uVar2;
        if (uVar2 < uVar9) {
          uVar5 = uVar9;
        }
      }
    }
    uVar8 = uVar8 + 1;
    if (uVar8 == *(uint *)(unaff_RBP + 0xf0)) {
      return;
    }
  } while( true );
}

