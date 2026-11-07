
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float *param_3,long *param_4,ulong *param_5,
          undefined8 *param_6)

{
  float fVar1;
  float fVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  undefined1 auVar6 [12];
  undefined1 auVar7 [16];
  ulong uVar8;
  int iVar9;
  ulong uVar10;
  int iVar11;
  ulong uVar12;
  ulong uVar13;
  ulong uVar14;
  uint uVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  float fVar31;
  undefined1 auVar30 [16];
  float fVar32;
  float fVar33;
  float fVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  float fVar40;
  float fVar41;
  float fVar42;
  undefined4 uVar43;
  undefined8 *in_stack_00000028;
  float in_stack_00000030;

  fVar40 = *(float *)(param_6 + 1);
  fVar1 = *(float *)(param_5 + 1);
  fVar2 = *(float *)(in_stack_00000028 + 1);
  fVar29 = fVar2 - fVar1;
  fVar31 = fVar40 - fVar1;
  fVar16 = (float)*param_6;
  fVar38 = (float)((ulong)*param_6 >> 0x20);
  uVar8 = *param_5;
  fVar32 = (float)uVar8;
  fVar33 = (float)(uVar8 >> 0x20);
  fVar27 = fVar16 - fVar32;
  fVar28 = fVar38 - fVar33;
  fVar39 = (float)*in_stack_00000028;
  fVar17 = (float)((ulong)*in_stack_00000028 >> 0x20);
  fVar35 = fVar39 - fVar32;
  fVar37 = fVar17 - fVar33;
  fVar41 = fVar37 * fVar27 - fVar28 * fVar35;
  fVar42 = fVar29 * fVar28 - fVar31 * fVar37;
  uVar43 = 0;
  fVar26 = fVar31 * fVar35 - fVar27 * fVar29;
  fVar26 = SQRT(fVar42 * fVar42 + fVar26 * fVar26 + fVar41 * fVar41);
  if ((_DAT_1459e5010 <= fVar26) &&
     (_DAT_145947ed4 <= (float)(_DAT_145915780 & (uint)fVar41) / fVar26)) {
    fVar26 = fVar1;
    if (fVar40 <= fVar1) {
      fVar26 = fVar40;
    }
    fVar40 = (float)(-(uint)NAN(fVar26) & (uint)fVar1 | ~-(uint)NAN(fVar26) & (uint)fVar26);
    fVar26 = fVar40;
    if (fVar2 <= fVar40) {
      fVar26 = fVar2;
    }
    if ((float)(~-(uint)NAN(fVar26) & (uint)fVar26 | (uint)fVar40 & -(uint)NAN(fVar26)) <=
        in_stack_00000030) {
      fVar40 = *param_3;
      fVar2 = param_3[1];
      uVar3 = *(ulong *)(param_3 + 2);
      if (fVar32 <= fVar16) {
        auVar6._4_8_ = uVar8 >> 0x20;
        auVar6._0_4_ = fVar16;
        uVar8 = auVar6._0_8_;
      }
      uVar15 = -(uint)NAN((float)uVar8);
      auVar19._4_4_ = (uint)(uVar8 >> 0x20) & (uint)fVar33;
      fVar16 = (float)(uVar15 & (uint)fVar32 | ~uVar15 & (uint)(float)uVar8);
      fVar26 = fVar16;
      if (fVar16 <= fVar39) {
        fVar26 = fVar39;
      }
      auVar19._0_4_ = (uint)fVar16 & -(uint)NAN(fVar26);
      auVar19._8_8_ = 0;
      auVar19 = ZEXT416(~-(uint)NAN(fVar26) & (uint)fVar26) | auVar19;
      auVar20._4_12_ = auVar19._4_12_;
      fVar26 = auVar19._0_4_ - fVar40;
      auVar20._0_4_ = fVar26 + fVar26 + _DAT_145913354;
      fVar26 = (float)func_0x000145773265(auVar20._0_8_);
      fVar39 = 0.0;
      if (0.0 <= fVar26) {
        uVar8 = 0;
        if (0.0 <= fVar26) {
          uVar8 = (long)(fVar26 - _DAT_1459071e0) & (long)fVar26 >> 0x3f | (long)fVar26;
        }
        uVar10 = 0xffffffffffffffff;
        if (fVar26 <= _DAT_1459071e4) {
          uVar10 = uVar8;
        }
        uVar8 = uVar10 + 1;
        if (uVar3 < uVar10 + 1) {
          uVar8 = uVar3;
        }
      }
      else {
        uVar8 = 0;
      }
      fVar26 = _DAT_145913354;
      fVar16 = (float)func_0x00014577327d();
      if (fVar16 <= fVar39) {
        fVar16 = fVar39;
      }
      uVar10 = (long)(fVar16 - _DAT_1459071e0) & (long)fVar16 >> 0x3f | (long)fVar16;
      if (fVar16 < fVar39) {
        uVar10 = 0;
      }
      if (_DAT_1459071e4 < fVar16) {
        uVar10 = 0xffffffffffffffff;
      }
      fVar16 = fVar33;
      if (fVar33 <= fVar38) {
        fVar16 = fVar38;
      }
      fVar38 = (float)(-(uint)NAN(fVar16) & (uint)fVar33 | ~-(uint)NAN(fVar16) & (uint)fVar16);
      fVar16 = fVar38;
      if (fVar38 <= fVar17) {
        fVar16 = fVar17;
      }
      auVar21._0_4_ = (uint)fVar38 & -(uint)NAN(fVar16);
      auVar21._4_4_ = fVar33;
      auVar21._8_8_ = 0;
      auVar21 = ZEXT416(~-(uint)NAN(fVar16) & (uint)fVar16) | auVar21;
      auVar22._4_12_ = auVar21._4_12_;
      fVar17 = auVar21._0_4_ - fVar2;
      auVar22._0_4_ = fVar17 + fVar17 + fVar26;
      fVar26 = (float)func_0x000145773265(auVar22._0_8_);
      uVar14 = 0;
      if (fVar39 <= fVar26) {
        uVar13 = 0;
        if (0.0 <= fVar26) {
          uVar13 = (long)(fVar26 - _DAT_1459071e0) & (long)fVar26 >> 0x3f | (long)fVar26;
        }
        if (_DAT_1459071e4 < fVar26) {
          uVar13 = 0xffffffffffffffff;
        }
        uVar14 = uVar13 + 1;
        if (uVar3 < uVar13 + 1) {
          uVar14 = uVar3;
        }
      }
      auVar23._0_8_ = func_0x00014577327d();
      auVar23._8_8_ = extraout_XMM0_Qb;
      if ((float)auVar23._0_8_ <= 0.0) {
        auVar7._12_4_ = 0;
        auVar7._0_12_ = auVar23._4_12_;
        auVar23 = auVar7 << 0x20;
      }
      fVar26 = auVar23._0_4_;
      uVar13 = 0;
      if (0.0 <= fVar26) {
        uVar13 = (long)(fVar26 - _DAT_1459071e0) & (long)fVar26 >> 0x3f | (long)fVar26;
      }
      if (_DAT_1459071e4 < fVar26) {
        uVar13 = 0xffffffffffffffff;
      }
      if ((uVar13 < uVar14) && (uVar10 < uVar8)) {
        auVar30._4_4_ = fVar41;
        auVar30._0_4_ = fVar41;
        auVar30._8_4_ = uVar43;
        auVar30._12_4_ = uVar43;
        iVar9 = (int)uVar13 * (int)uVar3 + (int)uVar10;
        fVar26 = _DAT_145907498;
        fVar39 = _DAT_1459e501c;
        fVar17 = _DAT_145cdfe60;
        fVar16 = fVar37;
        do {
          fVar34 = 0.0;
          fVar42 = 0.0;
          fVar41 = (((float)uVar13 + fVar26) * fVar26 + fVar2) - fVar33;
          fVar36 = fVar35 * fVar41;
          fVar41 = fVar41 * fVar27;
          uVar12 = uVar10;
          fVar38 = fVar37;
          iVar11 = iVar9;
          do {
            fVar25 = (((float)uVar12 + fVar26) * fVar26 + fVar40) - fVar32;
            auVar24._0_4_ = fVar41 - fVar25 * fVar28;
            auVar24._4_4_ = fVar16 * fVar25 - fVar36;
            auVar24._8_4_ = fVar42 - 0.0;
            auVar24._12_4_ = fVar34 - fVar38;
            auVar19 = divps(auVar24,auVar30);
            fVar25 = auVar19._4_4_;
            if ((((fVar39 <= fVar25) && (fVar18 = auVar19._0_4_, fVar39 <= fVar18)) &&
                (fVar25 + fVar18 <= fVar17)) &&
               (fVar25 = fVar25 * fVar31 + fVar1 + fVar18 * fVar29, fVar25 <= in_stack_00000030)) {
              lVar5 = param_4[2];
              if (lVar5 == *param_4) {
                func_0x000145780180();
              }
              lVar4 = param_4[1];
              *(int *)(lVar4 + lVar5 * 8) = iVar11;
              *(float *)(lVar4 + 4 + lVar5 * 8) = fVar25;
              param_4[2] = lVar5 + 1;
            }
            uVar12 = uVar12 + 1;
            iVar11 = iVar11 + 1;
          } while (uVar8 != uVar12);
          uVar13 = uVar13 + 1;
          iVar9 = iVar9 + (int)uVar3;
        } while (uVar13 != uVar14);
      }
    }
  }
  return;
}
