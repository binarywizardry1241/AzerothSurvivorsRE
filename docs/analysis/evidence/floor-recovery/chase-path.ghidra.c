
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4,long param_5,
     ulong *param_6)

{
  ulong uVar1;
  code *pcVar2;
  undefined4 uVar3;
  int iVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  bool bVar10;
  float extraout_XMM0_Da;
  float fVar11;
  float fVar12;
  float fVar13;
  undefined1 auVar14 [16];
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  undefined4 uVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  undefined1 auVar24 [16];
  undefined8 *in_stack_00000028;
  float in_stack_00000030;

  auVar14._8_8_ = 0;
  auVar14._0_8_ = *param_6;
  uVar3 = func_0x0001455246f0(param_5,param_4,*param_6,param_5,*in_stack_00000028);
  uVar6 = 0;
  if (_DAT_145907490 <= extraout_XMM0_Da) goto LAB_14552b471;
  fVar15 = (float)*(undefined8 *)(param_5 + 0x20);
  fVar16 = (float)((ulong)*(undefined8 *)(param_5 + 0x20) >> 0x20);
  fVar11 = auVar14._0_4_ - fVar15;
  fVar13 = auVar14._4_4_ - fVar16;
  auVar24._4_4_ = -(uint)(fVar11 < 0.0);
  auVar24._0_4_ = -(uint)(fVar11 < 0.0);
  auVar24._8_4_ = -(uint)(fVar13 < 0.0);
  auVar24._12_4_ = -(uint)(fVar13 < 0.0);
  iVar4 = movmskpd(uVar3,auVar24);
  if (iVar4 != 0) goto LAB_14552b471;
  uVar6 = 0;
  uVar5 = (long)fVar11 >> 0x3f & (long)(fVar11 - _DAT_1459071e0) | (long)fVar11;
  if (fVar11 < 0.0) {
    uVar5 = uVar6;
  }
  if (_DAT_1459071e4 < fVar11) {
    uVar5 = 0xffffffffffffffff;
  }
  uVar8 = (long)fVar13 >> 0x3f & (long)(fVar13 - _DAT_1459071e0) | (long)fVar13;
  if (fVar13 < 0.0) {
    uVar8 = uVar6;
  }
  if (_DAT_1459071e4 < fVar13) {
    uVar8 = 0xffffffffffffffff;
  }
  uVar1 = *(ulong *)(param_5 + 0x18);
  if (uVar1 <= uVar8 || uVar1 <= uVar5) goto LAB_14552b471;
  uVar5 = uVar8 * uVar1 + uVar5;
  if (*(ulong *)(param_3 + 0x10) <= uVar5) {
    func_0x000145903b33();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  if (*(short *)(*(long *)(param_3 + 8) + uVar5 * 2) == -1) {
    auVar24 = func_0x00014552a810();
    uVar5 = auVar24._8_8_;
    uVar6 = 0;
    if (auVar24._0_8_ != 1) goto LAB_14552b471;
    if ((uVar5 | uVar1) >> 0x20 == 0) goto LAB_14552b2b2;
LAB_14552b257:
    uVar6 = uVar5 / uVar1;
    uVar8 = uVar5 % uVar1;
    if (-1 < (long)uVar6) goto LAB_14552b264;
    fVar11 = (float)uVar6;
    if ((long)uVar8 < 0) goto LAB_14552b271;
LAB_14552b2dc:
    fVar13 = (float)(long)uVar8;
  }
  else {
    if ((uVar5 | uVar1) >> 0x20 != 0) goto LAB_14552b257;
LAB_14552b2b2:
    uVar6 = (uVar5 & 0xffffffff) / (uVar1 & 0xffffffff);
    uVar8 = (uVar5 & 0xffffffff) % (uVar1 & 0xffffffff);
LAB_14552b264:
    fVar11 = (float)(long)uVar6;
    if (-1 < (long)uVar8) goto LAB_14552b2dc;
LAB_14552b271:
    fVar13 = (float)uVar8;
  }
  fVar13 = fVar13 + _DAT_14594e600 + fVar15;
  fVar11 = fVar11 + fRam000000014594e604 + fVar16;
  uVar3 = 0;
  uVar6 = *(ulong *)(param_3 + 0x18);
  if (uVar5 != uVar6) {
    auVar24 = func_0x00014552a810();
    uVar5 = auVar24._8_8_;
    if (auVar24._0_8_ == 1) {
      lVar9 = 0x27;
      uVar19 = 0;
      fVar17 = _DAT_14594e600;
      fVar18 = fRam000000014594e604;
      fVar20 = _DAT_145907490;
      do {
        if ((uVar5 | uVar1) >> 0x20 == 0) {
          uVar8 = (uVar5 & 0xffffffff) / (uVar1 & 0xffffffff);
          uVar7 = (uVar5 & 0xffffffff) % (uVar1 & 0xffffffff);
LAB_14552b369:
          fVar12 = (float)(long)uVar8;
          if ((long)uVar7 < 0) goto LAB_14552b376;
LAB_14552b3bc:
          fVar21 = (float)(long)uVar7;
        }
        else {
          uVar8 = uVar5 / uVar1;
          uVar7 = uVar5 % uVar1;
          if (-1 < (long)uVar8) goto LAB_14552b369;
          fVar12 = (float)uVar8;
          if (-1 < (long)uVar7) goto LAB_14552b3bc;
LAB_14552b376:
          fVar21 = (float)uVar7;
        }
        fVar22 = fVar21 + fVar17 + fVar15;
        fVar23 = fVar12 + fVar18 + fVar16;
        fVar12 = fVar22 - auVar14._0_4_;
        fVar21 = fVar23 - auVar14._4_4_;
        if ((((in_stack_00000030 < SQRT(fVar21 * fVar21 + fVar12 * fVar12)) ||
             (fVar12 = (float)func_0x0001455246f0(), fVar12 < fVar20)) ||
            (bVar10 = lVar9 == 0, lVar9 = lVar9 + -1, fVar13 = fVar22, uVar3 = uVar19,
            fVar11 = fVar23, bVar10)) || (uVar5 == uVar6)) break;
        auVar24 = func_0x00014552a810();
        uVar5 = auVar24._8_8_;
      } while (auVar24._0_8_ == 1);
    }
  }
  *(ulong *)(param_4 + 1) = CONCAT44(uVar3,fVar13) + ((ulong)(uint)fVar11 << 0x20);
  uVar6 = 1;
LAB_14552b471:
  *param_4 = (int)uVar6;
  return param_4;
}
