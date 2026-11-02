/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  code *pcVar1;
  undefined1 auVar2 [16];
  undefined4 uVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  int iVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  int iVar12;
  int iVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  undefined8 uVar19;
  float fVar20;
  undefined8 extraout_XMM0_Qa;
  ulong extraout_XMM0_Qa_00;
  ulong extraout_XMM0_Qa_01;
  float extraout_XMM0_Dc;
  undefined8 extraout_XMM1_Qa;
  undefined1 auVar21 [16];
  undefined1 auVar23 [16];
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  int local_e8;
  uint local_dc;
  undefined1 auVar22 [16];

  lVar4 = func_0x000145898dc0(param_3,param_4,*(undefined8 *)(param_3 + 0x2b0),
                              *(undefined8 *)(param_3 + 0x2a8));
  fVar29 = 0.0;
  iVar8 = 0;
  fVar17 = _DAT_145db1368;
  fVar18 = _DAT_145db17a0;
  fVar28 = _DAT_145db6944;
  do {
    fVar25 = (float)*(undefined8 *)(param_3 + 0x4d0);
    fVar26 = (float)((ulong)*(undefined8 *)(param_3 + 0x4d0) >> 0x20);
    fVar16 = 0.0;
    fVar24 = 0.0;
    uVar9 = *(ulong *)(param_3 + 0x9b8);
    uVar7 = *(ulong *)(param_3 + 0x9d0);
    uVar6 = *(ulong *)(param_3 + 0x9c0);
    uVar5 = *(ulong *)(param_3 + 0x9c8);
    do {
      lVar10 = ((uVar9 + uVar7) * 0x800000 | uVar9 + uVar7 >> 0x29) + uVar9;
      uVar11 = uVar6 << 0x11;
      uVar5 = uVar5 ^ uVar9;
      uVar7 = uVar7 ^ uVar6;
      uVar6 = uVar6 ^ uVar5;
      uVar9 = uVar9 ^ uVar7;
      uVar7 = uVar7 << 0x2d | uVar7 >> 0x13;
      uVar5 = uVar5 ^ uVar11;
      fVar27 = ((float)((uint)((ulong)lVar10 >> 0x29) | 0x3f800000) + fVar17) * fVar18;
    } while (fVar18 <= fVar27);
    auVar21 = ZEXT416((uint)(fVar27 + fVar29));
    *(ulong *)(param_3 + 0x9b8) = uVar9;
    *(ulong *)(param_3 + 0x9d0) = uVar7;
    *(ulong *)(param_3 + 0x9c0) = uVar6;
    *(ulong *)(param_3 + 0x9c8) = uVar5;
    fVar14 = (float)func_0x0001459c2d90();
    fVar27 = extraout_XMM0_Dc;
    uVar19 = func_0x000145c0a417(auVar21._0_8_);
    fVar15 = (float)uVar19;
    fVar20 = (float)((ulong)uVar19 >> 0x20);
    uVar3 = func_0x000145c0a411(auVar21._0_8_);
    fVar25 = fVar25 + fVar14 * fVar15;
    fVar26 = fVar26 + fVar14 * (float)extraout_XMM0_Qa;
    uVar19 = *(undefined8 *)(lVar4 * 0xf0 + 0x146bf26f8);
    fVar14 = (float)uVar19;
    auVar21._0_4_ = fVar25 - fVar14;
    fVar15 = (float)((ulong)uVar19 >> 0x20);
    auVar21._4_4_ = fVar26 - fVar15;
    auVar21._8_4_ = (fVar16 + fVar27 * fVar20) - 0.0;
    auVar21._12_4_ = (fVar24 + fVar27 * (float)((ulong)extraout_XMM0_Qa >> 0x20)) - 0.0;
    fVar24 = SQRT(auVar21._4_4_ * auVar21._4_4_ + auVar21._0_4_ * auVar21._0_4_);
    fVar16 = *(float *)(lVar4 * 0xf0 + 0x146bf2708);
    if (fVar16 < fVar24) {
      auVar2._4_4_ = fVar24;
      auVar2._0_4_ = fVar24;
      auVar2._8_4_ = auVar21._12_4_ * auVar21._12_4_;
      auVar2._12_4_ = auVar21._12_4_ * auVar21._12_4_;
      auVar21 = divps(auVar21,auVar2);
      fVar25 = fVar14 + fVar16 * auVar21._0_4_;
      fVar26 = fVar15 + fVar16 * auVar21._4_4_;
    }
    lVar10 = *(long *)(param_3 + 0x9b0);
    if (*(long *)(lVar10 + 0x40) == -1) {
LAB_14593eab0:
      uVar9 = func_0x0001458a0b40();
      if (((uVar9 & 1) != 0) &&
         (uVar9 = extraout_XMM0_Qa_00,
         (float)((uint)((float)extraout_XMM0_Qa_00 - *(float *)(param_3 + 0x4d8)) & _DAT_145db8870)
         < _DAT_145e8ef50)) goto LAB_14593ec10;
    }
    else {
      fVar16 = fVar25 - (float)*(undefined8 *)(lVar10 + 0x60);
      fVar24 = fVar26 - (float)((ulong)*(undefined8 *)(lVar10 + 0x60) >> 0x20);
      iVar12 = -(uint)(fVar16 < 0.0);
      iVar13 = -(uint)(fVar24 < 0.0);
      auVar23._4_4_ = iVar13;
      auVar23._0_4_ = iVar12;
      auVar23._8_4_ = iVar13;
      auVar23._12_4_ = iVar13;
      auVar22._8_8_ = auVar23._8_8_;
      auVar22._4_4_ = iVar12;
      auVar22._0_4_ = iVar12;
      iVar12 = movmskpd(uVar3,auVar22);
      if (iVar12 != 0) goto LAB_14593eab0;
      uVar9 = (long)fVar16 >> 0x3f & (long)(fVar16 - _DAT_145db6940) | (long)fVar16;
      if (fVar16 < fVar29) {
        uVar9 = 0;
      }
      if (fVar28 < fVar16) {
        uVar9 = 0xffffffffffffffff;
      }
      uVar7 = (long)fVar24 >> 0x3f & (long)(fVar24 - _DAT_145db6940) | (long)fVar24;
      if (fVar24 < fVar29) {
        uVar7 = 0;
      }
      if (fVar28 < fVar24) {
        uVar7 = 0xffffffffffffffff;
      }
      uVar6 = *(ulong *)(lVar10 + 0x58);
      if (uVar6 <= uVar7 || uVar6 <= uVar9) goto LAB_14593eab0;
      uVar9 = uVar6 * uVar7 + uVar9;
      if (*(ulong *)(lVar10 + 0x50) <= uVar9) {
        func_0x000145da9883();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      if (*(char *)(*(long *)(lVar10 + 0x48) + uVar9) == '\0') goto LAB_14593eab0;
    }
    iVar8 = iVar8 + 1;
  } while (iVar8 != 0xc);
  fVar25 = (float)*(undefined8 *)(param_3 + 0x4d0);
  fVar26 = (float)((ulong)*(undefined8 *)(param_3 + 0x4d0) >> 0x20);
  uVar9 = *(ulong *)(param_3 + 0x9b8);
  uVar7 = *(ulong *)(param_3 + 0x9d0);
  uVar6 = *(ulong *)(param_3 + 0x9c0);
  uVar5 = *(ulong *)(param_3 + 0x9c8);
  do {
    lVar4 = ((uVar9 + uVar7) * 0x800000 | uVar9 + uVar7 >> 0x29) + uVar9;
    uVar11 = uVar6 << 0x11;
    uVar5 = uVar5 ^ uVar9;
    uVar7 = uVar7 ^ uVar6;
    uVar6 = uVar6 ^ uVar5;
    uVar9 = uVar9 ^ uVar7;
    uVar7 = uVar7 << 0x2d | uVar7 >> 0x13;
    uVar5 = uVar5 ^ uVar11;
    fVar28 = ((float)((uint)((ulong)lVar4 >> 0x29) | 0x3f800000) + fVar17) * fVar18;
  } while (fVar18 <= fVar28);
  auVar21 = ZEXT416((uint)(fVar28 + 0.0));
  *(ulong *)(param_3 + 0x9b8) = uVar9;
  *(ulong *)(param_3 + 0x9d0) = uVar7;
  *(ulong *)(param_3 + 0x9c0) = uVar6;
  *(ulong *)(param_3 + 0x9c8) = uVar5;
  fVar17 = (float)func_0x0001459c2d90(0);
  fVar18 = (float)func_0x000145c0a417(auVar21._0_8_);
  fVar28 = (float)func_0x000145c0a411(auVar21._0_8_);
  fVar25 = fVar25 + fVar17 * fVar18;
  fVar26 = fVar26 + fVar17 * fVar28;
  lVar4 = *(long *)(param_3 + 0x9b0);
  fVar17 = fVar26;
  uVar7 = func_0x0001458a0b40();
  uVar9 = extraout_XMM0_Qa_01;
  if ((uVar7 & 1) == 0) {
    if ((*(long *)(lVar4 + 0x68) == -1) ||
       (func_0x0001458a4d60(extraout_XMM0_Qa_01,extraout_XMM1_Qa,fVar25,fVar17), local_e8 != 1)) {
      uVar9 = (ulong)*(uint *)(lVar4 + 0xb8);
    }
    else {
      uVar9 = (ulong)local_dc;
    }
  }
LAB_14593ec10:
  *param_4 = CONCAT44(fVar26,fVar25);
  *(int *)(param_4 + 1) = (int)uVar9;
  return;
}
