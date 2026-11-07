
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long *plVar1;
  undefined8 *puVar2;
  ulong *puVar3;
  undefined8 uVar4;
  code *pcVar5;
  int iVar6;
  ulong uVar7;
  long *plVar8;
  undefined4 *puVar9;
  long lVar10;
  long *plVar11;
  ulong uVar12;
  char *pcVar13;
  long lVar14;
  char *pcVar15;
  long lVar16;
  long lVar17;
  ulong *puVar18;
  ulong *puVar19;
  long *plVar20;
  ulong uVar21;
  ulong uVar22;
  ulong uVar23;
  float fVar24;
  undefined4 in_XMM6_Da;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 in_XMM7_Da;
  undefined4 uVar29;
  undefined4 uVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  undefined4 uVar33;
  undefined4 uVar34;
  undefined4 uVar35;
  undefined4 uVar36;
  undefined4 uVar37;
  undefined8 local_288;
  undefined8 uStack_280;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined4 local_268;
  undefined4 uStack_264;
  undefined4 uStack_260;
  undefined4 uStack_25c;
  undefined4 local_258;
  undefined4 uStack_254;
  undefined4 uStack_250;
  undefined4 uStack_24c;
  ulong local_248;
  undefined8 uStack_240;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined8 local_228;
  undefined8 uStack_220;
  undefined8 local_218;
  undefined8 uStack_210;
  undefined4 local_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined4 local_1f8;
  undefined4 uStack_1f4;
  undefined4 uStack_1f0;
  undefined4 uStack_1ec;
  ulong local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  undefined4 uStack_1b8;
  undefined4 uStack_1b4;
  undefined4 uStack_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  undefined4 uStack_198;
  undefined4 local_194;
  undefined8 local_190;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  undefined4 uStack_174;
  float local_170;
  undefined4 uStack_16c;
  char *pcStack_168;
  long local_160;
  long local_158;
  char *pcStack_150;
  long local_148;
  undefined4 local_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 uStack_118;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  ulong local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  long local_c8;
  long *local_c0;
  char *local_b8;
  long *local_b0;
  undefined1 local_a2;
  undefined1 local_a1;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  local_a0 = 0xfffffffffffffffe;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  func_0x000145415d10(param_1,param_4,param_4 + 0x130,&local_288);
  plVar8 = (long *)local_248;
  local_a2 = 1;
  func_0x00014552b5a0();
  plVar20 = (long *)CONCAT44(uStack_118._4_4_,(undefined4)uStack_118);
  if (CONCAT44(local_128._4_4_,(undefined4)local_128) != 0) {
    func_0x0001400021d0();
  }
  local_1d8 = local_238;
  uStack_1d0 = uStack_230;
  local_1e8 = local_248;
  uStack_1e0 = uStack_240;
  local_1f8 = local_258;
  uStack_1f4 = uStack_254;
  uStack_1f0 = uStack_250;
  uStack_1ec = uStack_24c;
  local_208 = local_268;
  uStack_204 = uStack_264;
  uStack_200 = uStack_260;
  uStack_1fc = uStack_25c;
  local_218 = local_278;
  uStack_210 = uStack_270;
  local_228 = local_288;
  uStack_220 = uStack_280;
  local_b0 = plVar8;
  local_c0 = plVar20;
  if (*(long *)(param_4 + 0x308) != -1) {
    uVar7 = 4;
    if (*(ulong *)(param_4 + 0x368) < 4) {
      uVar7 = *(ulong *)(param_4 + 0x368);
    }
    fVar24 = (float)func_0x000145756e73(*(float *)((uVar7 & 0xffffffff) * 4 + 0x14672044c) *
                                        _DAT_1458f6684 + _DAT_1458eb480,
                                        (float)(int)(*(int *)(param_4 + 0x370) + -1 +
                                                    (uint)(*(int *)(param_4 + 0x370) == 0)));
    local_170 = _DAT_1458f662c - (fVar24 + fVar24);
    lVar17 = *(long *)(param_4 + 0x340);
    uStack_120 = *(long *)(param_4 + 0x348) * 0x40 + lVar17;
    local_128._0_4_ = (undefined4)lVar17;
    local_128._4_4_ = (undefined4)((ulong)lVar17 >> 0x20);
    uStack_118 = &local_170;
    local_a1 = 1;
    func_0x000145535e10();
    local_c8 = local_158;
    local_b8 = pcStack_150;
    if (local_148 != 0) {
      pcVar15 = pcStack_150 + local_148 * 0x40;
      pcVar13 = pcStack_150;
      do {
        if (*pcVar13 == -1) break;
        uStack_f4 = *(undefined4 *)(pcVar13 + 0x34);
        uStack_f0 = *(undefined4 *)(pcVar13 + 0x38);
        uStack_ec = *(undefined4 *)(pcVar13 + 0x3c);
        uStack_104._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x25);
        uStack_104 = CONCAT31(uStack_104._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x21) >> 0x18)
                             );
        uStack_100._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x29);
        uStack_100 = CONCAT31(uStack_100._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x25) >> 0x18)
                             );
        uStack_fc._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x2d);
        uStack_fc = CONCAT31(uStack_fc._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x29) >> 0x18));
        local_f8._1_3_ = (undefined3)((uint)*(undefined4 *)(pcVar13 + 0x30) >> 8);
        local_f8._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar13 + 0x2d) >> 0x18);
        uStack_118._5_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x15);
        uStack_118._4_4_ =
             CONCAT31(uStack_118._5_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x11) >> 0x18));
        uStack_110._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x19);
        uStack_110 = CONCAT31(uStack_110._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x15) >> 0x18)
                             );
        uStack_10c._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0x1d);
        uStack_10c = CONCAT31(uStack_10c._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 0x19) >> 0x18)
                             );
        uStack_108._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar13 + 0x1d) >> 0x18);
        uStack_108 = CONCAT31((int3)*(undefined4 *)(pcVar13 + 0x21),(undefined1)uStack_108);
        local_128._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar13 + 1),*pcVar13);
        local_128._5_3_ = (undefined3)*(undefined4 *)(pcVar13 + 5);
        local_128._4_4_ =
             CONCAT31(local_128._5_3_,(char)((uint)*(undefined4 *)(pcVar13 + 1) >> 0x18));
        uStack_120._1_3_ = (undefined3)*(undefined4 *)(pcVar13 + 9);
        uStack_120._0_4_ =
             CONCAT31(uStack_120._1_3_,(char)((uint)*(undefined4 *)(pcVar13 + 5) >> 0x18));
        uStack_120._5_3_ = (undefined3)*(undefined4 *)(pcVar13 + 0xd);
        uStack_120._4_4_ =
             CONCAT31(uStack_120._5_3_,(char)((uint)*(undefined4 *)(pcVar13 + 9) >> 0x18));
        uStack_118._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar13 + 0xd) >> 0x18);
        uStack_118._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar13 + 0x11),(undefined1)uStack_118);
        func_0x00014570c440();
        local_148 = local_160;
        local_158 = CONCAT44(uStack_16c,local_170);
        pcStack_150 = pcStack_168;
        local_140 = *(undefined4 *)(param_4 + 0x350);
        uStack_13c = *(undefined4 *)(param_4 + 0x354);
        uStack_138 = *(undefined4 *)(param_4 + 0x358);
        uStack_134 = *(undefined4 *)(param_4 + 0x35c);
        func_0x000145415a50();
        pcVar13 = pcVar13 + 0x40;
      } while (pcVar13 != pcVar15);
    }
    plVar8 = local_b0;
    plVar20 = local_c0;
    if (local_c8 != 0) {
      func_0x0001400021d0();
    }
  }
  local_d8 = local_1d8;
  uStack_d0 = uStack_1d0;
  local_e8 = local_1e8;
  uStack_e0 = uStack_1e0;
  local_f8 = local_1f8;
  uStack_f4 = uStack_1f4;
  uStack_f0 = uStack_1f0;
  uStack_ec = uStack_1ec;
  uStack_108 = local_208;
  uStack_104 = uStack_204;
  uStack_100 = uStack_200;
  uStack_fc = uStack_1fc;
  uStack_118._0_4_ = (undefined4)local_218;
  uStack_118._4_4_ = local_218._4_4_;
  uStack_110 = (undefined4)uStack_210;
  uStack_10c = uStack_210._4_4_;
  local_128._0_4_ = (undefined4)local_228;
  local_128._4_4_ = local_228._4_4_;
  uStack_120._0_4_ = (undefined4)uStack_220;
  uStack_120._4_4_ = uStack_220._4_4_;
  lVar17 = param_4 + 0x6c0;
  func_0x000145411430();
  *(undefined8 *)(param_4 + 0x710) = local_d8;
  *(undefined8 *)(param_4 + 0x718) = uStack_d0;
  *(ulong *)(param_4 + 0x700) = local_e8;
  *(undefined8 *)(param_4 + 0x708) = uStack_e0;
  *(undefined4 *)(param_4 + 0x6f0) = local_f8;
  *(undefined4 *)(param_4 + 0x6f4) = uStack_f4;
  *(undefined4 *)(param_4 + 0x6f8) = uStack_f0;
  *(undefined4 *)(param_4 + 0x6fc) = uStack_ec;
  *(undefined4 *)(param_4 + 0x6e0) = uStack_108;
  *(undefined4 *)(param_4 + 0x6e4) = uStack_104;
  *(undefined4 *)(param_4 + 0x6e8) = uStack_100;
  *(undefined4 *)(param_4 + 0x6ec) = uStack_fc;
  *(undefined4 *)(param_4 + 0x6d0) = (undefined4)uStack_118;
  *(undefined4 *)(param_4 + 0x6d4) = uStack_118._4_4_;
  *(undefined4 *)(param_4 + 0x6d8) = uStack_110;
  *(undefined4 *)(param_4 + 0x6dc) = uStack_10c;
  *(undefined4 *)(param_4 + 0x6c0) = (undefined4)local_128;
  *(undefined4 *)(param_4 + 0x6c4) = local_128._4_4_;
  *(undefined4 *)(param_4 + 0x6c8) = (undefined4)uStack_120;
  *(undefined4 *)(param_4 + 0x6cc) = uStack_120._4_4_;
  uVar7 = *(ulong *)(param_4 + 0x78);
  if (plVar8 <= *(ulong *)(param_4 + 0x78)) {
    *(long **)(param_4 + 0x78) = plVar8;
    uVar7 = (ulong)plVar8;
  }
  uVar23 = *(ulong *)(param_4 + 0x700);
  uVar21 = uVar23 - uVar7;
  if (uVar7 <= uVar23 && uVar21 != 0) {
    if (*(long *)(param_4 + 0x68) - uVar7 < uVar21) {
      local_a1 = 0;
      func_0x000145757d40();
      lVar14 = *(long *)(param_4 + 0x70);
      puVar9 = (undefined4 *)(lVar14 + *(ulong *)(param_4 + 0x78) * 4);
      uVar22 = *(ulong *)(param_4 + 0x78);
    }
    else {
      lVar14 = *(long *)(param_4 + 0x70);
      puVar9 = (undefined4 *)(lVar14 + uVar7 * 4);
      uVar22 = uVar7;
    }
    if (1 < uVar21) {
      func_0x000145756dcb();
      puVar9 = (undefined4 *)(lVar14 + (uVar23 + uVar22) * 4 + uVar7 * -4 + -4);
      uVar22 = (uVar22 + uVar21) - 1;
    }
    *puVar9 = 0;
    uVar23 = uVar22 + 1;
    plVar20 = local_c0;
    plVar8 = local_b0;
  }
  *(ulong *)(param_4 + 0x78) = uVar23;
  uVar7 = *(ulong *)(param_4 + 0x90);
  if (plVar8 <= *(ulong *)(param_4 + 0x90)) {
    *(long **)(param_4 + 0x90) = plVar8;
    uVar7 = (ulong)plVar8;
  }
  uVar23 = *(ulong *)(param_4 + 0x700);
  uVar21 = uVar23 - uVar7;
  if (uVar7 <= uVar23 && uVar21 != 0) {
    if (*(long *)(param_4 + 0x80) - uVar7 < uVar21) {
      local_a1 = 0;
      func_0x000145757d40();
      lVar14 = *(long *)(param_4 + 0x88);
      puVar9 = (undefined4 *)(lVar14 + *(ulong *)(param_4 + 0x90) * 4);
      uVar22 = *(ulong *)(param_4 + 0x90);
    }
    else {
      lVar14 = *(long *)(param_4 + 0x88);
      puVar9 = (undefined4 *)(lVar14 + uVar7 * 4);
      uVar22 = uVar7;
    }
    if (1 < uVar21) {
      func_0x000145756dcb();
      puVar9 = (undefined4 *)(lVar14 + (uVar23 + uVar22) * 4 + uVar7 * -4 + -4);
      uVar22 = (uVar22 + uVar21) - 1;
    }
    *puVar9 = 0;
    uVar23 = uVar22 + 1;
    plVar20 = local_c0;
    plVar8 = local_b0;
  }
  *(ulong *)(param_4 + 0x90) = uVar23;
  uVar7 = *(ulong *)(param_4 + 0xa8);
  lVar14 = uVar7 - (long)plVar8;
  if (plVar8 <= uVar7) {
    *(long **)(param_4 + 0xa8) = plVar8;
    uVar7 = (ulong)plVar8;
    if (lVar14 != 0) {
      lVar16 = *(long *)(param_4 + 0xa0) + (long)plVar8 * 0x18 + 8;
      do {
        if (*(long *)(lVar16 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar16 = lVar16 + 0x18;
        lVar14 = lVar14 + -1;
      } while (lVar14 != 0);
      uVar7 = *(ulong *)(param_4 + 0xa8);
    }
  }
  uVar23 = *(ulong *)(param_4 + 0x700);
  if (uVar7 < uVar23) {
    local_128._0_4_ = 0;
    local_128._4_4_ = 0;
    uStack_120._0_4_ = 4;
    uStack_120._4_4_ = 0;
    uStack_118._0_4_ = 0;
    uStack_118._4_4_ = 0;
    local_a1 = 0;
    func_0x0001455255e0();
  }
  else {
    *(ulong *)(param_4 + 0xa8) = uVar23;
    lVar14 = uVar7 - uVar23;
    if (lVar14 != 0) {
      lVar16 = *(long *)(param_4 + 0xa0) + uVar23 * 0x18 + 8;
      do {
        if (*(long *)(lVar16 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar16 = lVar16 + 0x18;
        lVar14 = lVar14 + -1;
      } while (lVar14 != 0);
    }
  }
  uVar7 = *(ulong *)(param_4 + 0x60);
  if (uVar7 != 0) {
    puVar3 = *(ulong **)(param_4 + 0x58);
    uVar23 = 0;
    puVar19 = puVar3;
    do {
      puVar18 = puVar19 + 2;
      if (plVar8 <= *puVar19) {
        uVar21 = uVar23 + 1;
        if (uVar21 < uVar7) {
          uVar12 = uVar23 - uVar7;
          uVar22 = uVar12;
          if ((uVar12 & 1) == 0) {
            uVar22 = uVar23;
            if (*puVar18 < plVar8) {
              *(int *)puVar19 = (int)*puVar18;
              *(undefined4 *)((long)puVar19 + 4) = *(undefined4 *)((long)puVar19 + 0x14);
              *(int *)(puVar19 + 1) = (int)puVar19[3];
              *(undefined4 *)((long)puVar19 + 0xc) = *(undefined4 *)((long)puVar19 + 0x1c);
              uVar22 = uVar23 + 1;
            }
            uVar21 = uVar23 + 2;
            uVar23 = uVar22;
          }
          if (uVar12 != 0xfffffffffffffffe) {
            lVar14 = uVar7 - uVar21;
            puVar19 = puVar3 + uVar21 * 2 + 2;
            uVar22 = uVar23;
            do {
              if (puVar19[-2] < plVar8) {
                uVar33 = *(undefined4 *)((long)puVar19 + -0xc);
                uVar7 = puVar19[-1];
                uVar34 = *(undefined4 *)((long)puVar19 + -4);
                puVar18 = puVar3 + uVar22 * 2;
                *(int *)puVar18 = (int)puVar19[-2];
                *(undefined4 *)((long)puVar18 + 4) = uVar33;
                *(int *)(puVar18 + 1) = (int)uVar7;
                *(undefined4 *)((long)puVar18 + 0xc) = uVar34;
                uVar22 = uVar22 + 1;
                uVar7 = *puVar19;
              }
              else {
                uVar7 = *puVar19;
              }
              if (uVar7 < plVar8) {
                uVar33 = *(undefined4 *)((long)puVar19 + 4);
                uVar7 = puVar19[1];
                uVar34 = *(undefined4 *)((long)puVar19 + 0xc);
                puVar18 = puVar3 + uVar22 * 2;
                *(int *)puVar18 = (int)*puVar19;
                *(undefined4 *)((long)puVar18 + 4) = uVar33;
                *(int *)(puVar18 + 1) = (int)uVar7;
                *(undefined4 *)((long)puVar18 + 0xc) = uVar34;
                uVar22 = uVar22 + 1;
              }
              puVar19 = puVar19 + 4;
              lVar14 = lVar14 + -2;
            } while (lVar14 != 0);
          }
          *(ulong *)(param_4 + 0x60) = uVar22;
        }
        else {
          *(ulong *)(param_4 + 0x60) = uVar23;
        }
        break;
      }
      uVar23 = uVar23 + 1;
      puVar19 = puVar18;
    } while (uVar23 != uVar7);
  }
  if (plVar20 <= *(long **)(param_4 + 0xc0)) {
    *(long **)(param_4 + 0xc0) = plVar20;
  }
  local_a1 = 0;
  func_0x00014552b5a0();
  local_b8 = (char *)CONCAT44(local_128._4_4_,(undefined4)local_128);
  plVar8 = (long *)CONCAT44(uStack_120._4_4_,(undefined4)uStack_120);
  plVar11 = (long *)CONCAT44(uStack_118._4_4_,(undefined4)uStack_118);
  uVar7 = 0;
  if (plVar20 <= plVar11) {
    uVar7 = (long)plVar11 - (long)plVar20;
  }
  local_b0 = plVar8;
  if (plVar11 <= plVar20) goto LAB_1454b8441;
  uVar23 = (ulong)((uint)uVar7 & 3);
  if ((ulong)((long)plVar20 - (long)plVar11) < 0xfffffffffffffffd) {
    uVar21 = 0;
    plVar11 = plVar8;
    do {
      lVar14 = plVar11[(long)plVar20 * 3];
      lVar16 = (plVar11 + (long)plVar20 * 3)[1];
      plVar11[2] = plVar11[(long)plVar20 * 3 + 2];
      *plVar11 = lVar14;
      plVar11[1] = lVar16;
      lVar14 = plVar11[(long)plVar20 * 3 + 3];
      lVar16 = (plVar11 + (long)plVar20 * 3 + 3)[1];
      plVar11[5] = plVar11[(long)plVar20 * 3 + 5];
      plVar11[3] = lVar14;
      plVar11[4] = lVar16;
      lVar14 = plVar11[(long)plVar20 * 3 + 6];
      lVar16 = (plVar11 + (long)plVar20 * 3 + 6)[1];
      plVar11[8] = plVar11[(long)plVar20 * 3 + 8];
      plVar11[6] = lVar14;
      plVar11[7] = lVar16;
      uVar21 = uVar21 + 4;
      plVar1 = plVar11 + (long)plVar20 * 3 + 9;
      lVar14 = *plVar1;
      uVar33 = *(undefined4 *)((long)plVar1 + 4);
      lVar16 = plVar1[1];
      uVar34 = *(undefined4 *)((long)plVar1 + 0xc);
      plVar11[0xb] = plVar11[(long)plVar20 * 3 + 0xb];
      *(int *)(plVar11 + 9) = (int)lVar14;
      *(undefined4 *)((long)plVar11 + 0x4c) = uVar33;
      *(int *)(plVar11 + 10) = (int)lVar16;
      *(undefined4 *)((long)plVar11 + 0x54) = uVar34;
      plVar11 = plVar11 + 0xc;
    } while ((uVar7 & 0x7fffffffffffffc) != uVar21);
    if (uVar23 != 0) goto LAB_1454b8260;
  }
  else {
    uVar21 = 0;
LAB_1454b8260:
    plVar11 = plVar8 + uVar21 * 3;
    do {
      plVar1 = plVar11 + (long)plVar20 * 3;
      lVar14 = *plVar1;
      uVar33 = *(undefined4 *)((long)plVar1 + 4);
      lVar16 = plVar1[1];
      uVar34 = *(undefined4 *)((long)plVar1 + 0xc);
      plVar11[2] = plVar11[(long)plVar20 * 3 + 2];
      *(int *)plVar11 = (int)lVar14;
      *(undefined4 *)((long)plVar11 + 4) = uVar33;
      *(int *)(plVar11 + 1) = (int)lVar16;
      *(undefined4 *)((long)plVar11 + 0xc) = uVar34;
      plVar11 = plVar11 + 3;
      uVar23 = uVar23 - 1;
    } while (uVar23 != 0);
  }
  local_c0 = plVar8 + uVar7 * 3;
  uVar25 = 0;
  uVar26 = 0;
  uVar27 = 0;
  uVar28 = 0;
  uVar29 = (undefined4)_DAT_1458f8d20;
  uVar30 = (undefined4)((ulong)_DAT_1458f8d20 >> 0x20);
  uVar31 = (undefined4)_DAT_1458eb540;
  uVar32 = (undefined4)((ulong)_DAT_1458eb540 >> 0x20);
  uVar33 = _DAT_1458f8d30;
  uVar34 = uRam00000001458f8d34;
  uVar35 = uRam00000001458f8d38;
  uVar36 = uRam00000001458f8d3c;
  do {
    lVar14 = *plVar8;
    if (lVar14 == 0) break;
    uVar37 = (undefined4)plVar8[2];
    pcVar13 = (char *)plVar8[1];
    lVar16 = 0;
    plVar8 = plVar8 + 3;
    local_158 = lVar14;
    pcStack_150 = pcVar13;
    while ((*(char **)(lVar16 + 0x146719a70) != pcVar13 ||
           (iVar6 = func_0x000145756dd7(), iVar6 != 0))) {
      lVar16 = lVar16 + 0x78;
      if (lVar16 == 0x3480) {
        local_128 = &local_158;
        uStack_120._0_4_ = 0x400020c0;
        uStack_120._4_4_ = 1;
        func_0x0001458e7790();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
    }
    local_194 = 0;
    local_1c8 = lVar16 + 0x146719a68;
    uStack_1c0 = 1;
    uStack_1b4 = 0x3f800000;
    uStack_1b0 = 0;
    local_190 = CONCAT44(uVar32,uVar31);
    local_188 = 0;
    uStack_1bc = uVar29;
    uStack_1b8 = uVar30;
    uStack_1ac = uVar31;
    uStack_1a8 = uVar32;
    uStack_1a4 = uVar25;
    uStack_1a0 = uVar26;
    uStack_19c = uVar27;
    uStack_198 = uVar28;
    uStack_184 = uVar33;
    uStack_180 = uVar34;
    uStack_17c = uVar35;
    uStack_178 = uVar36;
    func_0x000145415f40();
    uStack_1bc = 0x3f800000;
    lVar14 = *(long *)(param_4 + 0xc0);
    if (lVar14 == *(long *)(param_4 + 0xb0)) {
      func_0x000145763d70();
    }
    lVar16 = *(long *)(param_4 + 0xb8);
    lVar10 = lVar14 * 0x60;
    *(ulong *)(lVar16 + 0x50 + lVar10) = CONCAT44(uStack_174,uStack_178);
    puVar2 = (undefined8 *)(lVar16 + 0x40 + lVar10);
    *puVar2 = CONCAT44(uStack_184,local_188);
    puVar2[1] = CONCAT44(uStack_17c,uStack_180);
    puVar2 = (undefined8 *)(lVar16 + 0x30 + lVar10);
    *puVar2 = CONCAT44(local_194,uStack_198);
    puVar2[1] = local_190;
    puVar2 = (undefined8 *)(lVar16 + 0x20 + lVar10);
    *puVar2 = CONCAT44(uStack_1a4,uStack_1a8);
    puVar2[1] = CONCAT44(uStack_19c,uStack_1a0);
    puVar2 = (undefined8 *)(lVar16 + 0x10 + lVar10);
    *puVar2 = CONCAT44(uStack_1b4,uStack_1b8);
    puVar2[1] = CONCAT44(uStack_1ac,uStack_1b0);
    puVar9 = (undefined4 *)(lVar16 + lVar10);
    *puVar9 = (undefined4)local_1c8;
    puVar9[1] = local_1c8._4_4_;
    puVar9[2] = uStack_1c0;
    puVar9[3] = uStack_1bc;
    *(undefined4 *)(lVar16 + 0x58 + lVar10) = uVar37;
    *(long *)(param_4 + 0xc0) = lVar14 + 1;
  } while (plVar8 != local_c0);
LAB_1454b8441:
  if (local_b8 != (char *)0x0) {
    func_0x0001400021d0();
  }
  lVar14 = *(long *)(param_4 + 0x298);
  uStack_120 = *(long *)(param_4 + 0x2a0) * 0x58 + lVar14;
  local_128._0_4_ = (undefined4)lVar14;
  local_128._4_4_ = (undefined4)((ulong)lVar14 >> 0x20);
  local_a1 = 0;
  uStack_118 = (float *)lVar17;
  func_0x000145535f20();
  lVar17 = *(long *)(param_4 + 0x2a0);
  if (lVar17 != 0) {
    lVar14 = *(long *)(param_4 + 0x298);
    lVar16 = 0;
    lVar10 = 0;
    do {
      if (local_148 * 0x1c == lVar16) break;
      pcVar13 = pcStack_150 + lVar16;
      uVar33 = *(undefined4 *)pcVar13;
      uVar34 = *(undefined4 *)(pcVar13 + 4);
      uVar35 = *(undefined4 *)(pcVar13 + 8);
      uVar36 = *(undefined4 *)(pcVar13 + 0xc);
      uVar4 = *(undefined8 *)(pcVar13 + 0x10);
      *(undefined4 *)(lVar14 + 0x50 + lVar10) = *(undefined4 *)(pcVar13 + 0x18);
      *(undefined8 *)(lVar14 + 0x48 + lVar10) = uVar4;
      puVar9 = (undefined4 *)(lVar14 + 0x38 + lVar10);
      *puVar9 = uVar33;
      puVar9[1] = uVar34;
      puVar9[2] = uVar35;
      puVar9[3] = uVar36;
      lVar10 = lVar10 + 0x58;
      lVar16 = lVar16 + 0x1c;
    } while (lVar17 * 0x58 - lVar10 != 0);
  }
  if (local_158 != 0) {
    func_0x0001400021d0();
  }
  lVar17 = *(long *)(param_4 + 0xb8);
  lVar14 = *(long *)(param_4 + 0xc0) * 0x60 + lVar17;
  for (; lVar17 != lVar14; lVar17 = lVar17 + 0x60) {
    local_a1 = 0;
    func_0x000145415f40();
    *(ulong *)(lVar17 + 0x44) = CONCAT44((undefined4)uStack_118,uStack_120._4_4_);
    *(ulong *)(lVar17 + 0x4c) = CONCAT44(uStack_110,uStack_118._4_4_);
    *(undefined4 *)(lVar17 + 0x38) = (undefined4)local_128;
    *(undefined4 *)(lVar17 + 0x3c) = local_128._4_4_;
    *(long *)(lVar17 + 0x40) = uStack_120;
  }
  local_a1 = 0;
  func_0x0001454950d0();
  return;
}
