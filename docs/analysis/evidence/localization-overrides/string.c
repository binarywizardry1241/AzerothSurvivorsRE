/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  byte bVar1;
  undefined2 uVar2;
  long lVar3;
  ulong uVar4;
  uint uVar5;
  ulong uVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  char cVar21;
  char cVar22;
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  long local_c8;
  long lStack_c0;
  undefined8 local_b8;
  undefined8 local_b0;
  undefined8 local_a8;
  long local_a0;
  long local_98;
  long local_90;
  long *local_88;
  long lStack_80;
  undefined8 *local_78;
  undefined8 local_70;
  long local_68;
  long local_60;
  long local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  func_0x0001458e2760();
  if (local_88 == (long *)0xffffffffffffffff) {
    local_68 = 0;
    local_60 = 1;
    local_58 = 0;
    uVar6 = param_3[1];
    uVar4 = param_3[2];
    if (uVar4 < uVar6) {
LAB_1458e2a5c:
      lVar8 = local_58;
      lVar3 = *param_3;
      cVar21 = *(char *)(lVar3 + uVar4);
      uVar7 = uVar4 + 1;
      param_3[2] = uVar7;
      if (cVar21 != '\\') {
        if (cVar21 != '\"') goto code_r0x0001458e2a7b;
        local_90 = local_68;
        local_98 = local_60;
        func_0x000145bcdeb0();
        lVar9 = local_90;
        lVar10 = local_98;
        if (((char)local_88 == '\0') ||
           (lVar9 = local_98, lVar10 = lVar8, lVar8 = lStack_80, local_90 == -1)) {
          param_4[1] = lVar9;
          param_4[2] = lVar10;
          param_4[3] = lVar8;
          *param_4 = 0;
          return;
        }
        local_b0 = 0x146bead9d;
        local_a8 = 9;
        if (3 < uVar7) {
          uVar6 = uVar7 & 0xfffffffffffffffc;
          lVar8 = 0;
          lVar9 = 0;
          uVar4 = 0;
          lVar10 = 0;
          lVar11 = 0;
          do {
            uVar2 = *(undefined2 *)(lVar3 + 2 + uVar4);
            auVar13[0] = -((char)*(undefined2 *)(lVar3 + uVar4) == DAT_14605b690);
            cVar21 = -((char)((ushort)*(undefined2 *)(lVar3 + uVar4) >> 8) == cRam000000014605b691);
            cVar22 = -(cRam000000014605b697 == '\0');
            auVar13._8_8_ =
                 (undefined8)
                 (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                        -(cRam000000014605b696 ==
                                                                         '\0')),
                                                               -(cRam000000014605b696 == '\0')),
                                                      -(cRam000000014605b695 == '\0')),
                                             -(cRam000000014605b695 == '\0')),
                                    -(cRam000000014605b694 == '\0')),
                           CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
            auVar13[7] = -(cRam000000014605b693 == '\0');
            auVar13[6] = -(cRam000000014605b693 == '\0');
            auVar13[5] = -(cRam000000014605b692 == '\0');
            auVar13[4] = -(cRam000000014605b692 == '\0');
            auVar13[3] = cVar21;
            auVar13[2] = cVar21;
            auVar13[1] = auVar13[0];
            auVar13 = pshuflw(auVar13,auVar13,0xd4);
            auVar16._12_4_ = auVar13._12_4_;
            auVar16._0_8_ = auVar13._0_8_;
            auVar16._8_4_ = auVar13._4_4_;
            auVar16 = auVar16 & _DAT_145d977d0;
            lVar10 = lVar10 + auVar16._0_8_;
            lVar11 = lVar11 + auVar16._8_8_;
            auVar24[0] = -((char)uVar2 == DAT_14605b690);
            cVar21 = -((char)((ushort)uVar2 >> 8) == cRam000000014605b691);
            cVar22 = -(cRam000000014605b697 == '\0');
            auVar24._8_8_ =
                 (undefined8)
                 (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                        -(cRam000000014605b696 ==
                                                                         '\0')),
                                                               -(cRam000000014605b696 == '\0')),
                                                      -(cRam000000014605b695 == '\0')),
                                             -(cRam000000014605b695 == '\0')),
                                    -(cRam000000014605b694 == '\0')),
                           CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
            auVar24[7] = -(cRam000000014605b693 == '\0');
            auVar24[6] = -(cRam000000014605b693 == '\0');
            auVar24[5] = -(cRam000000014605b692 == '\0');
            auVar24[4] = -(cRam000000014605b692 == '\0');
            auVar24[3] = cVar21;
            auVar24[2] = cVar21;
            auVar24[1] = auVar24[0];
            auVar13 = pshuflw(auVar16,auVar24,0xd4);
            auVar17._12_4_ = auVar13._12_4_;
            auVar17._0_8_ = auVar13._0_8_;
            auVar17._8_4_ = auVar13._4_4_;
            lVar8 = lVar8 + SUB168(auVar17 & _DAT_145d977d0,0);
            lVar9 = lVar9 + SUB168(auVar17 & _DAT_145d977d0,8);
            uVar4 = uVar4 + 4;
          } while (uVar6 != uVar4);
          local_a0 = lVar9 + lVar11 + lVar8 + lVar10;
          goto LAB_1458e30da;
        }
        uVar6 = 0;
        local_a0 = 0;
        do {
          local_a0 = local_a0 + (ulong)(*(char *)(lVar3 + uVar6) == '\n');
          uVar6 = uVar6 + 1;
LAB_1458e30da:
        } while (uVar7 != uVar6);
        local_a0 = local_a0 + 1;
        local_88 = &local_a0;
        lStack_80 = 0x145bd8030;
        local_78 = &local_b0;
        local_70 = 0x1400020c0;
        func_0x000145bc5690();
        if (local_90 != 0) {
          func_0x0001400021d0();
        }
        param_4[3] = local_b8;
        local_88 = (long *)local_c8;
        lStack_80 = lStack_c0;
        goto LAB_1458e29b9;
      }
      if (uVar7 < uVar6) {
        bVar1 = *(byte *)(lVar3 + 1 + uVar4);
        uVar6 = uVar4 + 2;
        param_3[2] = uVar6;
        uVar5 = bVar1 - 0x22;
        if (uVar5 < 0x54) {
                    /* WARNING: Could not emulate address calculation at 0x0001458e2ac4 */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((ulong)uVar5 * 4 + 0x146e989d0) + 0x146e989d0))();
          return;
        }
      }
      else {
        uVar4 = uVar4 + 2;
        param_3[2] = uVar4;
        if (uVar4 <= uVar6) {
          uVar6 = uVar4;
        }
        if (uVar4 == 0) {
          local_a0 = 1;
          goto LAB_1458e3166;
        }
      }
      if (uVar6 < 4) {
        uVar4 = 0;
        local_a0 = 0;
        goto LAB_1458e314b;
      }
      uVar4 = uVar6 & 0xfffffffffffffffc;
      lVar8 = 0;
      lVar9 = 0;
      uVar7 = 0;
      lVar10 = 0;
      lVar11 = 0;
      do {
        uVar2 = *(undefined2 *)(lVar3 + 2 + uVar7);
        auVar18[0] = -((char)*(undefined2 *)(lVar3 + uVar7) == DAT_14605b690);
        cVar21 = -((char)((ushort)*(undefined2 *)(lVar3 + uVar7) >> 8) == cRam000000014605b691);
        cVar22 = -(cRam000000014605b697 == '\0');
        auVar18._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                    -(cRam000000014605b696 == '\0'))
                                                           ,-(cRam000000014605b696 == '\0')),
                                                  -(cRam000000014605b695 == '\0')),
                                         -(cRam000000014605b695 == '\0')),
                                -(cRam000000014605b694 == '\0')),
                       CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
        auVar18[7] = -(cRam000000014605b693 == '\0');
        auVar18[6] = -(cRam000000014605b693 == '\0');
        auVar18[5] = -(cRam000000014605b692 == '\0');
        auVar18[4] = -(cRam000000014605b692 == '\0');
        auVar18[3] = cVar21;
        auVar18[2] = cVar21;
        auVar18[1] = auVar18[0];
        auVar13 = pshuflw(auVar18,auVar18,0xd4);
        auVar19._12_4_ = auVar13._12_4_;
        auVar19._0_8_ = auVar13._0_8_;
        auVar19._8_4_ = auVar13._4_4_;
        auVar19 = auVar19 & _DAT_145d977d0;
        lVar10 = lVar10 + auVar19._0_8_;
        lVar11 = lVar11 + auVar19._8_8_;
        auVar25[0] = -((char)uVar2 == DAT_14605b690);
        cVar21 = -((char)((ushort)uVar2 >> 8) == cRam000000014605b691);
        cVar22 = -(cRam000000014605b697 == '\0');
        auVar25._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                    -(cRam000000014605b696 == '\0'))
                                                           ,-(cRam000000014605b696 == '\0')),
                                                  -(cRam000000014605b695 == '\0')),
                                         -(cRam000000014605b695 == '\0')),
                                -(cRam000000014605b694 == '\0')),
                       CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
        auVar25[7] = -(cRam000000014605b693 == '\0');
        auVar25[6] = -(cRam000000014605b693 == '\0');
        auVar25[5] = -(cRam000000014605b692 == '\0');
        auVar25[4] = -(cRam000000014605b692 == '\0');
        auVar25[3] = cVar21;
        auVar25[2] = cVar21;
        auVar25[1] = auVar25[0];
        auVar13 = pshuflw(auVar19,auVar25,0xd4);
        auVar20._12_4_ = auVar13._12_4_;
        auVar20._0_8_ = auVar13._0_8_;
        auVar20._8_4_ = auVar13._4_4_;
        lVar8 = lVar8 + SUB168(auVar20 & _DAT_145d977d0,0);
        lVar9 = lVar9 + SUB168(auVar20 & _DAT_145d977d0,8);
        uVar7 = uVar7 + 4;
      } while (uVar4 != uVar7);
      local_a0 = lVar9 + lVar11 + lVar8 + lVar10;
      for (; uVar6 != uVar4; uVar4 = uVar4 + 1) {
LAB_1458e314b:
        local_a0 = local_a0 + (ulong)(*(char *)(lVar3 + uVar4) == '\n');
      }
      local_a0 = local_a0 + 1;
LAB_1458e3166:
      local_a8 = 10;
      local_b0 = 0x146beaefa;
      local_88 = &local_a0;
      lStack_80 = 0x145bd8030;
      local_78 = &local_b0;
      local_70 = 0x1400020c0;
      local_49 = 1;
      func_0x000145bc5690();
      goto LAB_1458e308f;
    }
LAB_1458e29f9:
    uVar4 = uVar4 + 1;
    param_3[2] = uVar4;
    local_b0 = 0x146beaee7;
    local_a8 = 0x13;
    if (uVar6 < uVar4) {
      uVar4 = uVar6;
    }
    if (uVar4 == 0) {
      local_a0 = 0;
    }
    else {
      lVar3 = *param_3;
      if (3 < uVar4) {
        uVar6 = uVar4 & 0xfffffffffffffffc;
        lVar8 = 0;
        lVar9 = 0;
        uVar7 = 0;
        lVar10 = 0;
        lVar11 = 0;
        do {
          uVar2 = *(undefined2 *)(lVar3 + 2 + uVar7);
          auVar12[0] = -((char)*(undefined2 *)(lVar3 + uVar7) == DAT_14605b690);
          cVar21 = -((char)((ushort)*(undefined2 *)(lVar3 + uVar7) >> 8) == cRam000000014605b691);
          cVar22 = -(cRam000000014605b697 == '\0');
          auVar12._8_8_ =
               (undefined8)
               (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                      -(cRam000000014605b696 == '\0'
                                                                       )),
                                                             -(cRam000000014605b696 == '\0')),
                                                    -(cRam000000014605b695 == '\0')),
                                           -(cRam000000014605b695 == '\0')),
                                  -(cRam000000014605b694 == '\0')),
                         CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
          auVar12[7] = -(cRam000000014605b693 == '\0');
          auVar12[6] = -(cRam000000014605b693 == '\0');
          auVar12[5] = -(cRam000000014605b692 == '\0');
          auVar12[4] = -(cRam000000014605b692 == '\0');
          auVar12[3] = cVar21;
          auVar12[2] = cVar21;
          auVar12[1] = auVar12[0];
          auVar13 = pshuflw(auVar12,auVar12,0xd4);
          auVar14._12_4_ = auVar13._12_4_;
          auVar14._0_8_ = auVar13._0_8_;
          auVar14._8_4_ = auVar13._4_4_;
          auVar14 = auVar14 & _DAT_145d977d0;
          lVar10 = lVar10 + auVar14._0_8_;
          lVar11 = lVar11 + auVar14._8_8_;
          auVar23[0] = -((char)uVar2 == DAT_14605b690);
          cVar21 = -((char)((ushort)uVar2 >> 8) == cRam000000014605b691);
          cVar22 = -(cRam000000014605b697 == '\0');
          auVar23._8_8_ =
               (undefined8)
               (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar22,cVar22),
                                                                      -(cRam000000014605b696 == '\0'
                                                                       )),
                                                             -(cRam000000014605b696 == '\0')),
                                                    -(cRam000000014605b695 == '\0')),
                                           -(cRam000000014605b695 == '\0')),
                                  -(cRam000000014605b694 == '\0')),
                         CONCAT11(-(cRam000000014605b694 == '\0'),cVar22)) >> 8);
          auVar23[7] = -(cRam000000014605b693 == '\0');
          auVar23[6] = -(cRam000000014605b693 == '\0');
          auVar23[5] = -(cRam000000014605b692 == '\0');
          auVar23[4] = -(cRam000000014605b692 == '\0');
          auVar23[3] = cVar21;
          auVar23[2] = cVar21;
          auVar23[1] = auVar23[0];
          auVar13 = pshuflw(auVar14,auVar23,0xd4);
          auVar15._12_4_ = auVar13._12_4_;
          auVar15._0_8_ = auVar13._0_8_;
          auVar15._8_4_ = auVar13._4_4_;
          lVar8 = lVar8 + SUB168(auVar15 & _DAT_145d977d0,0);
          lVar9 = lVar9 + SUB168(auVar15 & _DAT_145d977d0,8);
          uVar7 = uVar7 + 4;
        } while (uVar6 != uVar7);
        local_a0 = lVar9 + lVar11 + lVar8 + lVar10;
        goto LAB_1458e3044;
      }
      uVar6 = 0;
      local_a0 = 0;
      do {
        local_a0 = local_a0 + (ulong)(*(char *)(lVar3 + uVar6) == '\n');
        uVar6 = uVar6 + 1;
LAB_1458e3044:
      } while (uVar4 != uVar6);
    }
    local_a0 = local_a0 + 1;
    local_88 = &local_a0;
    lStack_80 = 0x145bd8030;
    local_78 = &local_b0;
    local_70 = 0x1400020c0;
    local_49 = 1;
    func_0x000145bc5690();
LAB_1458e308f:
    param_4[3] = local_b8;
    param_4[1] = local_c8;
    param_4[2] = lStack_c0;
    *param_4 = 1;
    if (local_68 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    param_4[3] = local_78;
LAB_1458e29b9:
    param_4[1] = local_88;
    param_4[2] = lStack_80;
    *param_4 = 1;
  }
  return;
code_r0x0001458e2a7b:
  if (local_58 == local_68) {
    local_49 = 1;
    func_0x000145d933f0();
  }
  *(char *)(local_60 + lVar8) = cVar21;
  local_58 = lVar8 + 1;
  uVar6 = param_3[1];
  uVar4 = param_3[2];
  if (uVar6 <= uVar4) goto LAB_1458e29f9;
  goto LAB_1458e2a5c;
}
