/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_49f45b7f7b3c4656a54f0fb90aa548d6ff069e634c6a95cbea056eb7d6b9ff42
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

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
  float extraout_XMM0_Da;
  float fVar17;
  float fVar18;
  float extraout_XMM0_Da_00;
  undefined8 uVar19;
  float fVar20;
  undefined8 extraout_XMM0_Qa;
  float extraout_XMM0_Dc;
  undefined1 auVar21 [16];
  undefined1 auVar23 [16];
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  undefined1 auVar22 [16];

  lVar4 = func_0x0001453e23e0(param_3,param_4,*(undefined8 *)(param_3 + 0x218),
                              *(undefined8 *)(param_3 + 0x210));
  fVar29 = 0.0;
  iVar8 = 0;
  fVar17 = _DAT_1458a8564;
  fVar18 = _DAT_1458bf680;
  fVar28 = _DAT_1458bd104;
  do {
    fVar25 = (float)*(undefined8 *)(param_3 + 1000);
    fVar26 = (float)((ulong)*(undefined8 *)(param_3 + 1000) >> 0x20);
    fVar16 = 0.0;
    fVar24 = 0.0;
    uVar9 = *(ulong *)(param_3 + 0x870);
    uVar7 = *(ulong *)(param_3 + 0x888);
    uVar6 = *(ulong *)(param_3 + 0x878);
    uVar5 = *(ulong *)(param_3 + 0x880);
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
    *(ulong *)(param_3 + 0x870) = uVar9;
    *(ulong *)(param_3 + 0x888) = uVar7;
    *(ulong *)(param_3 + 0x878) = uVar6;
    *(ulong *)(param_3 + 0x880) = uVar5;
    fVar14 = (float)func_0x0001454d71c0();
    fVar27 = extraout_XMM0_Dc;
    uVar19 = func_0x000145714a63(auVar21._0_8_);
    fVar15 = (float)uVar19;
    fVar20 = (float)((ulong)uVar19 >> 0x20);
    uVar3 = func_0x000145714a4b(auVar21._0_8_);
    fVar25 = fVar25 + fVar14 * fVar15;
    fVar26 = fVar26 + fVar14 * (float)extraout_XMM0_Qa;
    uVar19 = *(undefined8 *)(lVar4 * 0xb8 + 0x1466d2aa0);
    fVar14 = (float)uVar19;
    auVar21._0_4_ = fVar25 - fVar14;
    fVar15 = (float)((ulong)uVar19 >> 0x20);
    auVar21._4_4_ = fVar26 - fVar15;
    auVar21._8_4_ = (fVar16 + fVar27 * fVar20) - 0.0;
    auVar21._12_4_ = (fVar24 + fVar27 * (float)((ulong)extraout_XMM0_Qa >> 0x20)) - 0.0;
    fVar24 = SQRT(auVar21._4_4_ * auVar21._4_4_ + auVar21._0_4_ * auVar21._0_4_);
    fVar16 = *(float *)(lVar4 * 0xb8 + 0x1466d2ab0);
    if (fVar16 < fVar24) {
      auVar2._4_4_ = fVar24;
      auVar2._0_4_ = fVar24;
      auVar2._8_4_ = auVar21._12_4_ * auVar21._12_4_;
      auVar2._12_4_ = auVar21._12_4_ * auVar21._12_4_;
      auVar21 = divps(auVar21,auVar2);
      fVar25 = fVar14 + fVar16 * auVar21._0_4_;
      fVar26 = fVar15 + fVar16 * auVar21._4_4_;
    }
    lVar10 = *(long *)(param_3 + 0x868);
    if (*(long *)(lVar10 + 0x40) == -1) {
LAB_145497fb0:
      uVar9 = func_0x0001453f66f0();
      if (((uVar9 & 1) != 0) &&
         (fVar16 = extraout_XMM0_Da,
         (float)((uint)(extraout_XMM0_Da - *(float *)(param_3 + 0x3f0)) & _DAT_1458a85f0) <
         _DAT_1459d9f98)) goto LAB_1454980e0;
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
      if (iVar12 != 0) goto LAB_145497fb0;
      uVar9 = (long)fVar16 >> 0x3f & (long)(fVar16 - _DAT_1458bd100) | (long)fVar16;
      if (fVar16 < fVar29) {
        uVar9 = 0;
      }
      if (fVar28 < fVar16) {
        uVar9 = 0xffffffffffffffff;
      }
      uVar7 = (long)fVar24 >> 0x3f & (long)(fVar24 - _DAT_1458bd100) | (long)fVar24;
      if (fVar24 < fVar29) {
        uVar7 = 0;
      }
      if (fVar28 < fVar24) {
        uVar7 = 0xffffffffffffffff;
      }
      uVar6 = *(ulong *)(lVar10 + 0x58);
      if (uVar6 <= uVar7 || uVar6 <= uVar9) goto LAB_145497fb0;
      uVar9 = uVar6 * uVar7 + uVar9;
      if (*(ulong *)(lVar10 + 0x50) <= uVar9) {
        func_0x0001458a3f23();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      if (*(char *)(*(long *)(lVar10 + 0x48) + uVar9) == '\0') goto LAB_145497fb0;
    }
    iVar8 = iVar8 + 1;
  } while (iVar8 != 0xc);
  fVar25 = (float)*(undefined8 *)(param_3 + 1000);
  fVar26 = (float)((ulong)*(undefined8 *)(param_3 + 1000) >> 0x20);
  uVar9 = *(ulong *)(param_3 + 0x870);
  uVar7 = *(ulong *)(param_3 + 0x888);
  uVar6 = *(ulong *)(param_3 + 0x878);
  uVar5 = *(ulong *)(param_3 + 0x880);
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
  *(ulong *)(param_3 + 0x870) = uVar9;
  *(ulong *)(param_3 + 0x888) = uVar7;
  *(ulong *)(param_3 + 0x878) = uVar6;
  *(ulong *)(param_3 + 0x880) = uVar5;
  fVar17 = (float)func_0x0001454d71c0(0);
  fVar18 = (float)func_0x000145714a63(auVar21._0_8_);
  fVar28 = (float)func_0x000145714a4b(auVar21._0_8_);
  fVar25 = fVar25 + fVar17 * fVar18;
  fVar26 = fVar26 + fVar17 * fVar28;
  lVar4 = *(long *)(param_3 + 0x868);
  uVar9 = func_0x0001453f66f0();
  fVar16 = extraout_XMM0_Da_00;
  if ((uVar9 & 1) == 0) {
    fVar16 = *(float *)(lVar4 + 0x68);
  }
LAB_1454980e0:
  *param_4 = CONCAT44(fVar26,fVar25);
  *(float *)(param_4 + 1) = fVar16;
  return;
}
