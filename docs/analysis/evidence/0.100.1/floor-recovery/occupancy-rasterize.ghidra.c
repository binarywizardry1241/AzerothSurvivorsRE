
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 param_5)

{
  ulong uVar1;
  code *pcVar2;
  undefined1 auVar3 [16];
  ulong uVar4;
  undefined4 uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  int iVar9;
  ulong uVar10;
  uint *puVar11;
  ulong uVar12;
  ulong uVar13;
  ulong uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  int iVar19;
  float fVar20;
  float fVar22;
  float fVar23;
  undefined1 auVar21 [16];
  float fVar24;
  float fVar27;
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  float fVar28;
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  float fVar31;
  float fVar35;
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  float fVar36;
  undefined1 auVar37 [16];
  undefined1 auVar39 [16];
  undefined4 in_XMM6_Da;
  float fVar40;
  float fVar41;
  undefined4 in_XMM7_Da;
  float fVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  float fVar46;
  float fVar47;
  float fVar48;
  float fVar49;
  float fVar50;
  float fVar51;
  float fVar52;
  float fVar53;
  long in_stack_00000030;
  ulong in_stack_00000038;
  long local_158;
  long local_150;
  ulong local_148;
  long local_140;
  ulong local_138;
  uint *local_130;
  undefined8 local_128;
  undefined8 uStack_120;
  ulong local_118;
  ulong local_110;
  float local_104;
  float local_100;
  float local_fc;
  long local_f8;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;
  undefined1 auVar38 [16];

  local_f0 = 0xfffffffffffffffe;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  func_0x000145530130(param_4,in_stack_00000038,*(undefined8 *)(param_3 + 8),&local_158,
                      *(undefined8 *)(param_3 + 0x10),param_5);
  uVar6 = (*(ulong *)(param_3 + 0x28) / 3) * 3;
  if (2 < uVar6) {
    fVar40 = (float)*(undefined8 *)(param_4 + 0x20);
    fVar41 = (float)((ulong)*(undefined8 *)(param_4 + 0x20) >> 0x20);
    uVar1 = *(ulong *)(param_4 + 0x18);
    puVar11 = *(uint **)(param_3 + 0x20);
    fVar20 = (float)uVar1 + fVar40;
    fVar22 = (float)uVar1 + fVar41;
    local_140 = *(long *)(param_4 + 8);
    local_118 = *(ulong *)(param_4 + 0x10);
    local_f8 = local_150;
    uVar14 = 0;
    fVar50 = 0.0;
    fVar52 = 0.0;
    fVar53 = 0.0;
    local_110 = local_148;
    fVar45 = _DAT_145947ef0;
    fVar48 = _DAT_145907518;
    fVar49 = _DAT_1459071e0;
    fVar51 = _DAT_1459071e4;
    do {
      uVar7 = (ulong)*puVar11;
      if (local_110 <= uVar7) {
        func_0x000145903b33();
LAB_1455256a9:
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      uVar4 = (ulong)puVar11[1];
      if (local_110 <= uVar4) {
        func_0x000145903b33();
        goto LAB_1455256a9;
      }
      uVar10 = (ulong)puVar11[2];
      local_138 = uVar6;
      local_130 = puVar11;
      if (local_110 <= uVar10) {
        func_0x000145903b33();
        goto LAB_1455256a9;
      }
      uVar6 = *(ulong *)(local_f8 + uVar7 * 0xc);
      fVar46 = (float)uVar6;
      fVar47 = (float)(uVar6 >> 0x20);
      uVar12 = *(ulong *)(local_f8 + uVar4 * 0xc);
      uVar13 = *(ulong *)(local_f8 + uVar10 * 0xc);
      auVar21._8_8_ = 0;
      auVar21._0_8_ = uVar13;
      auVar33._8_8_ = 0;
      auVar33._0_8_ = uVar6;
      auVar25._8_8_ = 0;
      auVar25._0_8_ = uVar12;
      auVar25 = maxps(auVar33,auVar25);
      uVar15 = -(uint)NAN(auVar25._0_4_);
      uVar16 = -(uint)NAN(auVar25._4_4_);
      auVar32._0_4_ = (uint)fVar46 & uVar15;
      auVar32._4_4_ = (uint)fVar47 & uVar16;
      auVar32._8_8_ = 0;
      auVar29._0_4_ = ~uVar15 & (uint)auVar25._0_4_;
      auVar29._4_4_ = ~uVar16 & (uint)auVar25._4_4_;
      auVar29._8_4_ = ~-(uint)NAN(auVar25._8_4_) & (uint)auVar25._8_4_;
      auVar29._12_4_ = ~-(uint)NAN(auVar25._12_4_) & (uint)auVar25._12_4_;
      auVar29 = auVar29 | auVar32;
      auVar33 = maxps(auVar29,auVar21);
      uVar15 = -(uint)NAN(auVar33._0_4_);
      uVar17 = -(uint)NAN(auVar33._4_4_);
      auVar30._8_8_ = 0;
      auVar30._0_8_ = uVar6;
      uStack_120 = 0;
      auVar3._8_8_ = 0;
      auVar3._0_8_ = uVar12;
      auVar25 = minps(auVar30,auVar3);
      uVar16 = -(uint)NAN(auVar25._0_4_);
      uVar18 = -(uint)NAN(auVar25._4_4_);
      auVar37._0_4_ = (uint)fVar46 & uVar16;
      auVar37._4_4_ = (uint)fVar47 & uVar18;
      auVar37._8_8_ = 0;
      auVar34._0_4_ = ~uVar16 & (uint)auVar25._0_4_;
      auVar34._4_4_ = ~uVar18 & (uint)auVar25._4_4_;
      auVar34._8_4_ = ~-(uint)NAN(auVar25._8_4_) & (uint)auVar25._8_4_;
      auVar34._12_4_ = ~-(uint)NAN(auVar25._12_4_) & (uint)auVar25._12_4_;
      auVar34 = auVar34 | auVar37;
      auVar25 = minps(auVar34,auVar21);
      uVar16 = -(uint)NAN(auVar25._0_4_);
      uVar18 = -(uint)NAN(auVar25._4_4_);
      iVar9 = -(uint)(fVar20 < (float)(~uVar16 & (uint)auVar25._0_4_ | auVar34._0_4_ & uVar16) ||
                     (float)(~uVar15 & (uint)auVar33._0_4_ | auVar29._0_4_ & uVar15) < fVar40);
      iVar19 = -(uint)(fVar22 < (float)(~uVar18 & (uint)auVar25._4_4_ | auVar34._4_4_ & uVar18) ||
                      (float)(~uVar17 & (uint)auVar33._4_4_ | auVar29._4_4_ & uVar17) < fVar41);
      auVar26._4_4_ = iVar9;
      auVar26._0_4_ = iVar9;
      auVar26._8_4_ = iVar19;
      auVar26._12_4_ = iVar19;
      iVar9 = movmskpd((int)local_f8,auVar26);
      if (iVar9 == 0) {
        local_104 = *(float *)(local_f8 + 8 + uVar7 * 0xc);
        local_fc = *(float *)(local_f8 + 8 + uVar4 * 0xc);
        local_100 = *(float *)(local_f8 + 8 + uVar10 * 0xc);
        local_128._0_4_ = (float)uVar12;
        local_128._4_4_ = (float)(uVar12 >> 0x20);
        fVar24 = (float)local_128 - fVar46;
        fVar27 = local_128._4_4_ - fVar47;
        fVar28 = local_fc - local_104;
        fVar23 = (float)(uVar13 >> 0x20);
        fVar43 = (float)uVar13 - fVar46;
        fVar44 = fVar23 - fVar47;
        fVar42 = local_100 - local_104;
        fVar36 = fVar28 * fVar43 - fVar24 * fVar42;
        fVar31 = fVar44 * fVar24 - fVar27 * fVar43;
        fVar35 = fVar42 * fVar27 - fVar28 * fVar44;
        fVar35 = SQRT(fVar35 * fVar35 + fVar36 * fVar36 + fVar31 * fVar31);
        if ((_DAT_1459e5010 <= fVar35) &&
           ((float)((uint)fVar31 & _DAT_145915780) / fVar35 <= _DAT_145947ed4)) {
          fVar35 = SQRT(fVar28 * fVar28 + fVar27 * fVar27 + fVar24 * fVar24);
          fVar36 = SQRT(fVar42 * fVar42 + fVar44 * fVar44 + fVar43 * fVar43);
          fVar31 = fVar35;
          if (fVar35 <= fVar36) {
            fVar31 = fVar36;
          }
          fVar35 = (float)(-(uint)NAN(fVar31) & (uint)fVar35 | ~-(uint)NAN(fVar31) & (uint)fVar31);
          local_128._0_4_ = (float)uVar13 - (float)local_128;
          fVar23 = fVar23 - local_128._4_4_;
          fVar31 = SQRT((local_100 - local_fc) * (local_100 - local_fc) +
                        fVar23 * fVar23 + (float)local_128 * (float)local_128);
          fVar23 = fVar35;
          if (fVar35 <= fVar31) {
            fVar23 = fVar31;
          }
          local_128 = uVar12;
          fVar23 = (float)func_0x00014577327d((float)(~-(uint)NAN(fVar23) & (uint)fVar23 |
                                                     (uint)fVar35 & -(uint)NAN(fVar23)) /
                                              _DAT_14593fc74);
          uVar6 = (long)fVar23 >> 0x3f;
          uVar7 = (long)(fVar23 - fVar49) & uVar6 | (long)fVar23;
          if (fVar23 < fVar50) {
            uVar7 = uVar14;
          }
          if (fVar51 < fVar23) {
            uVar7 = 0xffffffffffffffff;
          }
          local_128 = 400;
          if (uVar7 < 400) {
            local_128 = uVar7;
          }
          if (uVar7 == 0) {
            local_128 = 1;
          }
          uVar7 = 0;
          do {
            uVar12 = local_128 - uVar7;
            uVar6 = CONCAT71((int7)(uVar6 >> 8),uVar7 < local_128);
            uVar10 = (uVar7 < local_128) + uVar7;
            fVar23 = (float)uVar7 / (float)(long)local_128;
            uVar4 = 0;
            do {
              uVar5 = (undefined4)uVar6;
              uVar13 = uVar4 + (uVar4 < uVar12);
              if ((long)uVar4 < 0) {
                uVar5 = (undefined4)(uVar4 >> 1);
              }
              fVar31 = (float)uVar4 / (float)(long)local_128;
              fVar35 = (fVar31 * fVar43 + fVar23 * fVar24 + fVar46) - fVar40;
              fVar36 = (fVar31 * fVar44 + fVar23 * fVar27 + fVar47) - fVar41;
              iVar9 = -(uint)(fVar35 < fVar52);
              iVar19 = -(uint)(fVar36 < fVar53);
              auVar39._4_4_ = iVar19;
              auVar39._0_4_ = iVar9;
              auVar39._8_4_ = iVar19;
              auVar39._12_4_ = iVar19;
              auVar38._8_8_ = auVar39._8_8_;
              auVar38._4_4_ = iVar9;
              auVar38._0_4_ = iVar9;
              uVar15 = movmskpd(uVar5,auVar38);
              uVar6 = (ulong)uVar15;
              if (uVar15 == 0) {
                uVar8 = (long)fVar35 >> 0x3f & (long)(fVar35 - fVar49) | (long)fVar35;
                if (fVar35 < fVar50) {
                  uVar8 = uVar14;
                }
                if (fVar51 < fVar35) {
                  uVar8 = 0xffffffffffffffff;
                }
                uVar6 = (long)fVar36 >> 0x3f & (long)(fVar36 - fVar49) | (long)fVar36;
                if (fVar36 < fVar50) {
                  uVar6 = uVar14;
                }
                if (fVar51 < fVar36) {
                  uVar6 = 0xffffffffffffffff;
                }
                if (uVar6 < uVar1 && uVar8 < uVar1) {
                  uVar6 = uVar6 * uVar1 + uVar8;
                  if (in_stack_00000038 <= uVar6) {
                    func_0x000145903b33();
                    goto LAB_1455256a9;
                  }
                  fVar35 = *(float *)(in_stack_00000030 + uVar6 * 4);
                  if (!NAN(fVar35)) {
                    fVar31 = fVar31 * fVar42 + fVar23 * fVar28 + local_104;
                    if ((fVar35 + fVar48 < fVar31) && (fVar31 < fVar35 + fVar45)) {
                      if (local_118 <= uVar6) {
                        func_0x000145903b33();
                        goto LAB_1455256a9;
                      }
                      *(undefined1 *)(local_140 + uVar6) = 1;
                    }
                  }
                }
              }
            } while ((uVar4 < uVar12) && (uVar4 = uVar13, uVar13 <= uVar12));
            uVar12 = local_128;
          } while ((uVar7 < local_128) && (uVar7 = uVar10, uVar10 <= local_128));
        }
      }
      local_128 = uVar12;
      puVar11 = local_130 + 3;
      uVar6 = local_138 - 3;
    } while (2 < uVar6);
  }
  if (local_158 != 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  return;
}
