/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  long lVar1;
  bool bVar2;
  int iVar3;
  ulong uVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  uint *puVar12;
  char cVar13;
  undefined4 *puVar14;
  long *plVar15;
  char cVar16;
  char cVar17;
  undefined8 uVar18;
  ulong uVar19;
  uint *puVar20;
  long lVar21;
  int *piVar22;
  long lVar23;
  uint uVar24;
  long lVar25;
  long lVar26;
  long lVar27;
  undefined4 uVar28;
  undefined4 in_XMM6_Da;
  undefined4 uVar29;
  undefined4 uVar30;
  undefined4 uVar31;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  undefined8 *in_stack_00000038;
  long *in_stack_00000040;
  long *in_stack_00000048;
  long *in_stack_00000050;
  undefined8 *in_stack_00000058;
  long *in_stack_00000060;
  long *in_stack_00000068;
  undefined4 local_308;
  undefined4 uStack_304;
  undefined4 uStack_300;
  undefined4 uStack_2fc;
  undefined4 local_2f8;
  undefined4 uStack_2f4;
  undefined4 uStack_2f0;
  undefined4 uStack_2ec;
  undefined8 local_2e8;
  undefined8 uStack_2e0;
  undefined8 local_2d8;
  undefined8 uStack_2d0;
  long local_2c8;
  long local_2c0;
  long lStack_2b8;
  long local_2b0;
  long lStack_2a8;
  undefined8 local_2a0;
  undefined8 uStack_298;
  int *local_290;
  undefined8 uStack_288;
  undefined1 *local_280;
  undefined8 uStack_278;
  undefined8 local_270;
  undefined8 uStack_268;
  undefined8 local_260;
  undefined8 uStack_258;
  undefined8 local_250;
  undefined8 uStack_248;
  long local_240;
  long lStack_238;
  long local_230;
  long local_228;
  long lStack_220;
  undefined8 local_218;
  long *local_210;
  undefined1 *local_208;
  undefined8 uStack_200;
  undefined4 *local_1f8;
  undefined8 uStack_1f0;
  long local_1e8;
  long lStack_1e0;
  undefined8 local_1d8;
  long local_1d0;
  long lStack_1c8;
  long local_1c0;
  long lStack_1b8;
  long local_1b0;
  long lStack_1a8;
  undefined8 local_1a0;
  long local_198;
  long local_190;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  long local_178;
  long lStack_170;
  undefined1 *local_168;
  long lStack_160;
  long local_158;
  char cStack_150;
  char cStack_14f;
  char cStack_14e;
  undefined4 uStack_14d;
  undefined1 uStack_149;
  char local_148;
  undefined7 uStack_147;
  undefined8 local_140;
  undefined8 uStack_138;
  undefined8 *local_130;
  undefined8 *local_128;
  undefined1 *local_120;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined4 local_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  long local_f0;
  long local_e8;
  long local_e0;
  undefined8 local_d8;
  undefined4 local_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  long local_c0;
  long local_b8;
  undefined8 local_b0;
  undefined4 *local_a8;
  long local_a0;
  long local_98;
  uint *local_90;
  long local_88;
  long local_80;
  undefined1 local_71;
  long *local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_2c8 = param_3[4];
  local_2e8 = *param_3;
  uStack_2e0 = param_3[1];
  local_2d8 = (long *)param_3[2];
  uStack_2d0 = (long *)param_3[3];
  lVar10 = *param_5;
  lStack_2b8 = param_5[1];
  local_2b0 = param_5[2];
  lStack_2a8 = param_5[3];
  local_2a0 = *param_6;
  uStack_298 = param_6[1];
  local_290 = (int *)param_6[2];
  uStack_288 = param_6[3];
  local_280 = (undefined1 *)*in_stack_00000028;
  uStack_278 = in_stack_00000028[1];
  local_270 = in_stack_00000028[2];
  uStack_268 = in_stack_00000028[3];
  local_1d0 = *in_stack_00000030;
  lStack_1c8 = in_stack_00000030[1];
  local_1c0 = in_stack_00000030[2];
  lStack_1b8 = in_stack_00000030[3];
  local_260 = *in_stack_00000038;
  uStack_258 = in_stack_00000038[1];
  local_250 = in_stack_00000038[2];
  uStack_248 = in_stack_00000038[3];
  local_240 = *in_stack_00000040;
  lStack_238 = in_stack_00000040[1];
  local_230 = in_stack_00000040[2];
  local_218 = in_stack_00000048[2];
  local_228 = *in_stack_00000048;
  lStack_220 = in_stack_00000048[1];
  local_210 = in_stack_00000050;
  local_208 = (undefined1 *)*in_stack_00000058;
  uStack_200 = in_stack_00000058[1];
  local_1f8 = (undefined4 *)in_stack_00000058[2];
  uStack_1f0 = in_stack_00000058[3];
  local_1e8 = *in_stack_00000060;
  lStack_1e0 = in_stack_00000060[1];
  local_1d8 = in_stack_00000060[2];
  local_1b0 = *in_stack_00000068;
  lStack_1a8 = in_stack_00000068[1];
  local_1a0 = in_stack_00000068[2];
  if (local_1d0 == 0) {
    return;
  }
  local_308 = (undefined4)*in_stack_00000030;
  uStack_304 = *(undefined4 *)((long)in_stack_00000030 + 4);
  uStack_300 = (undefined4)in_stack_00000030[1];
  uStack_2fc = *(undefined4 *)((long)in_stack_00000030 + 0xc);
  local_2f8 = (undefined4)in_stack_00000030[2];
  uStack_2f4 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  uStack_2f0 = (undefined4)in_stack_00000030[3];
  uStack_2ec = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  puVar20 = *(uint **)(local_240 + 0xf8);
  puVar12 = puVar20 + *(long *)(local_240 + 0x100);
  cVar17 = *(char *)(local_240 + 0x108);
  local_a0 = CONCAT71(local_a0._1_7_,cVar17);
  if (cVar17 == '\0') {
    lVar6 = 8;
    lVar25 = 0;
    bVar2 = false;
    uVar8 = 0;
    local_70 = in_stack_00000048;
    uVar11 = 0;
    do {
      uVar24 = (uint)uVar8;
      if (uVar11 == uVar24) {
        do {
          if (puVar20 == puVar12) {
            local_a8 = (undefined4 *)0x0;
            puVar20 = puVar12;
            plVar15 = local_70;
            lVar27 = local_2c8;
            goto LAB_1400790fb;
          }
          uVar4 = (ulong)*puVar20;
          puVar20 = puVar20 + 1;
          lVar27 = *(long *)(lStack_238 + 0x108);
          uVar19 = *(ulong *)(lVar27 + (uVar4 * 0x14 + 0xb) * 8);
        } while (uVar19 == 0);
        uVar8 = *(ulong *)(local_240 + 0x110);
        uVar11 = 0;
        if ((uVar8 < *(ulong *)(lVar27 + (uVar4 * 0x14 + 0x11) * 8)) &&
           (*(long *)(*(long *)(lVar27 + (uVar4 * 0x14 + 0x10) * 8) + uVar8 * 8) != 0)) {
          uVar5 = (ulong)*(uint *)(lVar27 + uVar4 * 0xa0 + 0x94);
          bVar2 = true;
          if (uVar8 < *(ulong *)(*(long *)(lStack_238 + 0x1a8) + 0x40 + uVar5 * 0x48)) {
            lVar25 = *(long *)(lStack_238 + 0x1a8) + uVar5 * 0x48;
            uVar8 = *(ulong *)(*(long *)(lVar25 + 0x38) + uVar8 * 8);
            if (uVar8 != 0) {
              lVar25 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar8 * 0x30);
              goto LAB_140078f93;
            }
          }
          lVar25 = 0;
        }
        else {
          bVar2 = false;
        }
LAB_140078f93:
        lVar6 = *(long *)(lVar27 + (uVar4 * 0x14 + 10) * 8);
        uVar8 = uVar19 & 0xffffffff;
      }
      uVar24 = uVar11 + 1;
      local_a8 = *(undefined4 **)(lVar6 + (ulong)uVar11 * 0x10);
      lVar27 = (ulong)~*(uint *)(lVar6 + 8 + (ulong)uVar11 * 0x10) * 0x18 + lVar25;
      if (!bVar2) {
        lVar27 = 0;
      }
      plVar15 = (long *)((ulong)local_a8 >> 0x20);
      if ((int)local_a8 != 0) goto LAB_1400790fb;
      local_70 = (long *)((ulong)local_70 & 0xffffffff);
      uVar11 = uVar24;
    } while( true );
  }
  lVar26 = 8;
  lVar25 = 0;
  bVar2 = false;
  uVar8 = 0;
  uVar24 = 0;
  local_70 = in_stack_00000048;
  while( true ) {
    if (uVar24 == (uint)uVar8) {
      do {
        if (puVar20 == puVar12) {
          local_a8 = (undefined4 *)0x0;
          lVar27 = local_2c8;
          puVar20 = puVar12;
          uVar24 = (uint)uVar8;
          plVar15 = local_70;
          goto joined_r0x000140079041;
        }
        uVar11 = *puVar20;
        puVar20 = puVar20 + 1;
        uVar19 = *(ulong *)(*(long *)(lStack_238 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
      } while (uVar19 == 0);
      lVar6 = *(long *)(lStack_238 + 0x1a8) + (ulong)uVar11 * 0x48;
      uVar24 = 0;
      if ((*(ulong *)(local_240 + 0x110) < *(ulong *)(lVar6 + 0x40)) &&
         (uVar8 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(local_240 + 0x110) * 8),
         uVar8 != 0)) {
        lVar25 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar8 * 0x30);
        bVar2 = true;
      }
      else {
        bVar2 = false;
      }
      lVar26 = *(long *)(lVar6 + 8);
      uVar8 = uVar19 & 0xffffffff;
    }
    uVar19 = (ulong)uVar24;
    uVar24 = uVar24 + 1;
    local_a8 = *(undefined4 **)(lVar26 + uVar19 * 8);
    lVar27 = lVar25 + uVar19 * 0x18;
    if (!bVar2) {
      lVar27 = 0;
    }
    plVar15 = (long *)((ulong)local_a8 >> 0x20);
    if ((int)local_a8 != 0) break;
    local_70 = (long *)((ulong)local_70 & 0xffffffff);
  }
joined_r0x000140079041:
  local_70 = plVar15;
  lVar6 = 8;
  plVar15 = local_70;
  if (cVar17 == '\0') {
LAB_1400790fb:
    do {
      local_70 = plVar15;
      if (uVar24 == (uint)uVar8) {
        do {
          if (puVar20 == puVar12) goto LAB_140079127;
          uVar11 = *puVar20;
          puVar20 = puVar20 + 1;
          uVar8 = *(ulong *)(*(long *)(lStack_238 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
        } while (uVar8 == 0);
        lVar6 = *(long *)(*(long *)(lStack_238 + 0x108) + (ulong)uVar11 * 0xa0 + 0x50);
        uVar24 = 0;
      }
      uVar19 = (ulong)uVar24;
      uVar24 = uVar24 + 1;
      iVar3 = *(int *)(lVar6 + uVar19 * 0x10);
      plVar15 = local_70;
    } while (iVar3 == 0);
  }
  else {
    do {
      if (uVar24 == (uint)uVar8) {
        do {
          if (puVar20 == puVar12) goto LAB_140079127;
          uVar11 = *puVar20;
          puVar20 = puVar20 + 1;
          uVar8 = *(ulong *)(*(long *)(lStack_238 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
        } while (uVar8 == 0);
        lVar26 = *(long *)(*(long *)(lStack_238 + 0x1a8) + (ulong)uVar11 * 0x48 + 8);
        uVar24 = 0;
      }
      uVar19 = (ulong)uVar24;
      uVar24 = uVar24 + 1;
      iVar3 = *(int *)(lVar26 + uVar19 * 8);
    } while (iVar3 == 0);
  }
LAB_140079129:
  local_2c0 = lVar10;
  local_90 = (uint *)local_280;
  local_58 = in_XMM6_Da;
  if (((int)local_a8 == 0) || (iVar3 != 0)) {
    if (*in_stack_00000050 != -1) {
      local_a8 = (undefined4 *)local_240;
      if (*in_stack_00000050 != 0) {
        func_0x0001400021d0();
      }
      if (in_stack_00000050[3] != 0) {
        func_0x0001400021d0();
      }
    }
    *in_stack_00000050 = -1;
    return;
  }
  local_71 = *local_280;
  uVar18 = CONCAT71((int7)(uVar8 >> 8),local_71);
  cVar17 = *(char *)(lVar10 + 0x38);
  cVar13 = *(char *)(lVar10 + 0x39);
  cStack_14e = *(char *)(lVar10 + 0x3a);
  func_0x000145bcd2f0(uVar18,cStack_14e,lVar10,&local_d0);
  local_148 = (char)uVar18;
  func_0x000145bcd2f0();
  lVar25 = *(long *)(lVar10 + 0x30);
  local_108 = local_c0;
  local_118 = CONCAT44(uStack_cc,local_d0);
  uStack_110 = CONCAT44(uStack_c4,uStack_c8);
  local_f0 = (long)local_130;
  local_100 = (undefined4)local_140;
  uStack_fc = local_140._4_4_;
  uStack_f8 = (undefined4)uStack_138;
  uStack_f4 = uStack_138._4_4_;
  local_188 = local_d0;
  uStack_184 = uStack_cc;
  uStack_180 = uStack_c8;
  uStack_17c = uStack_c4;
  local_168 = (undefined1 *)uStack_138;
  lStack_160 = (long)local_130;
  local_178 = local_c0;
  lStack_170 = (long)local_140;
  uStack_149 = *(undefined1 *)(lVar10 + 0x3f);
  uStack_14d = *(undefined4 *)(lVar10 + 0x3b);
  local_158 = lVar25;
  cStack_150 = cVar17;
  cStack_14f = cVar13;
  local_b8 = lVar10;
  if ((lVar27 != 0) && (*(long *)(lVar27 + 0x10) != 0)) {
    lVar10 = *in_stack_00000050;
    cVar16 = local_148;
    if ((((lVar10 != -1) &&
         (((((char)in_stack_00000050[7] == cVar17 &&
            (*(char *)((long)in_stack_00000050 + 0x39) == cVar13)) &&
           (*(char *)((long)in_stack_00000050 + 0x3a) == cStack_14e)) &&
          ((in_stack_00000050[2] == local_c0 && (iVar3 = func_0x000145bfa0e1(), iVar3 == 0)))))) &&
        (in_stack_00000050[5] == lStack_160)) &&
       (((iVar3 = func_0x000145bfa0e1(), iVar3 == 0 &&
         ((ulong)*(uint5 *)((long)in_stack_00000050 + 0x3b) ==
          (ulong)CONCAT14(uStack_149,uStack_14d))) &&
        ((in_stack_00000050[6] == lVar25 && ((char)in_stack_00000050[8] == cVar16)))))) {
      uVar11 = 0xc233b000;
      if ((uint)(uStack_288._4_4_ - (int)uStack_288) < 0xc233b000) {
        uVar11 = uStack_288._4_4_ - (int)uStack_288;
      }
      if (uVar11 <= (uint)(uStack_288._4_4_ - *local_290)) {
        func_0x0001400092c0();
        return;
      }
    }
    lVar6 = lStack_1e0;
    lVar25 = local_1e8;
    uVar11 = 0xc233b000;
    if ((uint)(uStack_288._4_4_ - (int)uStack_288) < 0xc233b000) {
      uVar11 = uStack_288._4_4_ - (int)uStack_288;
    }
    if (uVar11 <= (uint)(uStack_288._4_4_ - *local_290)) {
      if (*(char *)(local_1e8 + 0x108) == '\0') {
        lVar27 = 0;
        do {
          if (*(long *)(local_1e8 + 0x100) << 2 == lVar27) goto LAB_1400792dc;
          puVar12 = (uint *)(*(long *)(local_1e8 + 0xf8) + lVar27);
          lVar27 = lVar27 + 4;
        } while (*(long *)(*(long *)(lStack_1e0 + 0x108) + 0x58 + (ulong)*puVar12 * 0xa0) == 0);
      }
      else {
        lVar27 = 0;
        do {
          if (*(long *)(local_1e8 + 0x100) << 2 == lVar27) goto LAB_1400792dc;
          puVar12 = (uint *)(*(long *)(local_1e8 + 0xf8) + lVar27);
          lVar27 = lVar27 + 4;
        } while (*(long *)(*(long *)(lStack_1e0 + 0x1a8) + 0x10 + (ulong)*puVar12 * 0x48) == 0);
      }
      if ((lVar10 != -1) && ((char)in_stack_00000050[8] == cVar16)) {
        local_d8 = CONCAT44(local_d8._4_4_,local_1d8._4_4_);
        local_61 = 1;
        func_0x000145bcd2f0();
        cVar17 = (char)in_stack_00000050[7];
        cVar13 = *(char *)((long)in_stack_00000050 + 0x39);
        cVar16 = *(char *)((long)in_stack_00000050 + 0x3a);
        func_0x000145bcd2f0(cVar17,cVar13,in_stack_00000050,&local_140);
        func_0x000145bcd2f0();
        lVar27 = local_b8;
        local_a0 = (long)local_140;
        local_90 = (uint *)uStack_138;
        lVar10 = CONCAT44(uStack_cc,local_d0);
        if ((cVar17 == *(char *)(local_b8 + 0x38)) &&
           (((cVar13 == *(char *)(local_b8 + 0x39) && (cVar16 == *(char *)(local_b8 + 0x3a))) &&
            (local_c0 == *(long *)(local_b8 + 0x10))))) {
          local_80 = in_stack_00000050[6];
          local_98 = local_108;
          uVar11 = *(uint *)((long)in_stack_00000050 + 0x3b);
          uVar8 = (ulong)*(byte *)((long)in_stack_00000050 + 0x3f);
          local_b0 = CONCAT44(uStack_c4,uStack_c8);
          local_88 = lVar10;
          iVar3 = func_0x000145bfa0e1(uStack_110,uVar8,*(undefined8 *)(local_b8 + 8),
                                      CONCAT44(uStack_c4,uStack_c8));
          lVar10 = local_88;
          if ((((iVar3 == 0) && (local_98 == *(long *)(lVar27 + 0x28))) &&
              (iVar3 = func_0x000145bfa0e1(), lVar10 = local_88, iVar3 == 0)) &&
             (((uVar8 & 0xff) << 0x20 | (ulong)uVar11) == (ulong)*(uint5 *)(lVar27 + 0x3b))) {
            lVar10 = *(long *)(lVar27 + 0x30);
            if (local_88 != 0) {
              func_0x0001400021d0();
            }
            if (local_118 != 0) {
              func_0x0001400021d0();
            }
            if (local_a0 != 0) {
              func_0x0001400021d0();
            }
            if (local_80 == lVar10) {
              local_61 = 1;
              uVar28 = func_0x000140067b70(_DAT_145dcd0f0);
              lVar27 = lStack_1a8;
              puVar12 = *(uint **)(lVar25 + 0xf8);
              local_90 = puVar12 + *(long *)(lVar25 + 0x100);
              local_b0 = CONCAT71(local_b0._1_7_,*(undefined1 *)(lVar25 + 0x108));
              local_198 = local_1b0;
              local_190 = 8;
              local_70 = (long *)0x0;
              local_a8 = (undefined4 *)CONCAT44(local_a8._4_4_,local_1a0._4_4_);
              lVar10 = 0;
              local_80 = 0;
              local_98 = 0;
              local_88 = 0;
              do {
                if ((char)local_b0 == '\0') {
                  if ((uint)local_70 == (int)lVar10) {
                    do {
                      if (puVar12 == local_90) goto LAB_140079f5c;
                      uVar11 = *puVar12;
                      puVar12 = puVar12 + 1;
                      lVar10 = *(long *)(*(long *)(lVar6 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
                    } while (lVar10 == 0);
                    lVar7 = *(long *)(lVar6 + 0x108) + (ulong)uVar11 * 0xa0;
                    uVar8 = (ulong)*(uint *)(lVar7 + 0x94);
                    lVar26 = *(long *)(lVar6 + 0x1a8);
                    lVar21 = *(long *)(lVar26 + 0x18 + uVar8 * 0x48);
                    lVar9 = *(long *)(lVar26 + 0x38 + uVar8 * 0x48);
                    if ((*(ulong *)(lVar25 + 0x120) < *(ulong *)(lVar26 + 0x40 + uVar8 * 0x48)) &&
                       (uVar8 = *(ulong *)(lVar9 + *(ulong *)(lVar25 + 0x120) * 8), uVar8 != 0)) {
                      local_80 = *(long *)(lVar21 + 0x10 + ~uVar8 * 0x30);
                    }
                    else {
                      local_80 = 0;
                    }
                    lVar26 = ~*(ulong *)(lVar9 + *(long *)(lVar25 + 0x110) * 8) * 0x30;
                    local_88 = *(long *)(lVar21 + 0x10 + lVar26);
                    local_e8 = *(long *)(lVar21 + 0x28 + lVar26);
                    lVar26 = ~*(ulong *)(lVar9 + *(long *)(lVar25 + 0x118) * 8) * 0x30;
                    local_98 = *(long *)(lVar21 + 0x10 + lVar26);
                    local_e0 = *(long *)(lVar21 + 0x28 + lVar26);
                    local_190 = *(long *)(lVar7 + 0x50);
                    local_70 = (long *)0x0;
                  }
                  uVar11 = ~*(uint *)(local_190 + 8 + (long)local_70 * 0x10);
                }
                else {
                  if ((uint)local_70 == (int)lVar10) {
                    do {
                      if (puVar12 == local_90) {
LAB_140079f5c:
                        func_0x000140007bc0();
                        in_stack_00000050[8] = CONCAT71(uStack_147,local_148);
                        in_stack_00000050[6] = local_158;
                        in_stack_00000050[7] =
                             CONCAT17(uStack_149,
                                      CONCAT43(uStack_14d,
                                               CONCAT12(cStack_14e,CONCAT11(cStack_14f,cStack_150)))
                                     );
                        in_stack_00000050[4] = (long)local_168;
                        in_stack_00000050[5] = lStack_160;
                        in_stack_00000050[2] = local_178;
                        in_stack_00000050[3] = lStack_170;
                        *in_stack_00000050 = CONCAT44(uStack_184,local_188);
                        in_stack_00000050[1] = CONCAT44(uStack_17c,uStack_180);
                        return;
                      }
                      uVar11 = *puVar12;
                      puVar12 = puVar12 + 1;
                      lVar10 = *(long *)(*(long *)(lVar6 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
                    } while (lVar10 == 0);
                    lVar26 = *(long *)(lVar6 + 0x1a8) + (ulong)uVar11 * 0x48;
                    lVar21 = *(long *)(lVar26 + 0x18);
                    lVar9 = *(long *)(lVar26 + 0x38);
                    if ((*(ulong *)(lVar25 + 0x120) < *(ulong *)(lVar26 + 0x40)) &&
                       (uVar8 = *(ulong *)(lVar9 + *(ulong *)(lVar25 + 0x120) * 8), uVar8 != 0)) {
                      local_80 = *(long *)(lVar21 + 0x10 + ~uVar8 * 0x30);
                    }
                    else {
                      local_80 = 0;
                    }
                    lVar26 = ~*(ulong *)(lVar9 + *(long *)(lVar25 + 0x110) * 8) * 0x30;
                    local_88 = *(long *)(lVar21 + 0x10 + lVar26);
                    local_e8 = *(long *)(lVar21 + 0x28 + lVar26);
                    lVar26 = ~*(ulong *)(lVar9 + *(long *)(lVar25 + 0x118) * 8) * 0x30;
                    local_98 = *(long *)(lVar21 + 0x10 + lVar26);
                    local_e0 = *(long *)(lVar21 + 0x28 + lVar26);
                    local_70 = (long *)0x0;
                  }
                  uVar11 = (uint)local_70;
                }
                uVar8 = (ulong)uVar11;
                local_a0 = uVar8 * 0x38 + local_98;
                puVar14 = (undefined4 *)(local_e0 + uVar8 * 4);
                lVar21 = uVar8 * 0x18 + local_80;
                *(undefined4 *)(local_e8 + uVar8 * 4) = (undefined4)local_d8;
                local_61 = 1;
                func_0x000145bcd280(lVar21,puVar14,local_b8,local_88 + uVar8 * 0x18);
                local_70 = (long *)(ulong)((int)local_70 + 1);
                *puVar14 = (undefined4)local_d8;
                *(undefined4 *)(local_a0 + 0x30) = uVar28;
                lVar26 = *(long *)(lVar21 + 0x10);
                if (lVar26 != 0) {
                  lVar21 = *(long *)(lVar21 + 8);
                  lVar9 = 0;
                  do {
                    uVar18 = *(undefined8 *)(lVar21 + lVar9);
                    uVar8 = (ulong)~(uint)uVar18;
                    piVar22 = (int *)(uVar8 * 0x18 + *(long *)(lVar27 + 8));
                    if (*(ulong *)(lVar27 + 0x10) <= uVar8) {
                      piVar22 = (int *)&DAT_145dce694;
                    }
                    if ((piVar22[4] == (int)((ulong)uVar18 >> 0x20)) && (*piVar22 != 0)) {
                      uVar8 = *(ulong *)(piVar22 + 1);
                      if ((uVar8 >> 0x20 < *(ulong *)(local_198 + 0x38)) &&
                         ((*(ulong *)(*(long *)(local_198 + 0x28) + (uVar8 >> 0x26) * 8) >>
                           (uVar8 >> 0x20 & 0x3f) & 1) != 0)) {
                        lVar7 = *(long *)(*(long *)(lVar27 + 0x1a8) + 0x18 +
                                         (ulong)(uint)piVar22[3] * 0x48);
                        lVar23 = ~*(ulong *)(*(long *)(*(long *)(lVar27 + 0x1a8) + 0x38 +
                                                      (ulong)(uint)piVar22[3] * 0x48) +
                                            *(long *)(local_198 + 0x110) * 8) * 0x30;
                        lVar1 = *(long *)(lVar7 + 0x10 + lVar23);
                        *(undefined4 *)(*(long *)(lVar7 + 0x28 + lVar23) + (ulong)~(uint)uVar8 * 4)
                             = local_a8._0_4_;
                        *(undefined4 *)(lVar1 + 0x30 + (ulong)~(uint)uVar8 * 0x38) = uVar28;
                      }
                    }
                    lVar9 = lVar9 + 8;
                  } while (lVar26 << 3 != lVar9);
                }
              } while( true );
            }
            goto LAB_1400792dc;
          }
        }
        if (lVar10 != 0) {
          func_0x0001400021d0();
        }
        if (local_118 != 0) {
          func_0x0001400021d0();
        }
        if (local_a0 != 0) {
          func_0x0001400021d0();
        }
      }
    }
  }
LAB_1400792dc:
  uVar8 = (ulong)local_a8 & 0xffffffff;
  uVar19 = (long)local_70 << 0x20;
  if (*in_stack_00000050 != -1) {
    if (*in_stack_00000050 != 0) {
      func_0x0001400021d0();
    }
    if (in_stack_00000050[3] != 0) {
      func_0x0001400021d0();
    }
  }
  lVar25 = lStack_220;
  local_70 = (long *)(uVar19 | uVar8);
  in_stack_00000050[8] = CONCAT71(uStack_147,local_148);
  in_stack_00000050[6] = local_158;
  in_stack_00000050[7] =
       CONCAT17(uStack_149,CONCAT43(uStack_14d,CONCAT12(cStack_14e,CONCAT11(cStack_14f,cStack_150)))
               );
  in_stack_00000050[4] = (long)local_168;
  in_stack_00000050[5] = lStack_160;
  in_stack_00000050[2] = local_178;
  in_stack_00000050[3] = lStack_170;
  *(undefined4 *)in_stack_00000050 = local_188;
  *(undefined4 *)((long)in_stack_00000050 + 4) = uStack_184;
  *(undefined4 *)(in_stack_00000050 + 1) = uStack_180;
  *(undefined4 *)((long)in_stack_00000050 + 0xc) = uStack_17c;
  *local_1f8 = uStack_1f0._4_4_;
  *local_208 = 1;
  local_d8 = local_260;
  local_b0 = CONCAT44(local_b0._4_4_,local_218._4_4_);
  puVar20 = *(uint **)(local_228 + 0xf8);
  puVar12 = puVar20 + *(long *)(local_228 + 0x100);
  local_80 = local_228;
  local_a0 = CONCAT71(local_a0._1_7_,*(undefined1 *)(local_228 + 0x108));
  lVar10 = 0;
  local_98 = 8;
  local_90 = (uint *)0x0;
  uVar11 = 0;
  do {
    if ((char)local_a0 == '\0') {
      if (uVar11 == (uint)lVar10) {
        do {
          if (puVar20 == puVar12) goto LAB_140079680;
          uVar11 = *puVar20;
          puVar20 = puVar20 + 1;
          lVar10 = *(long *)(*(long *)(lVar25 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
        } while (lVar10 == 0);
        lVar27 = *(long *)(lVar25 + 0x108) + (ulong)uVar11 * 0xa0;
        uVar8 = (ulong)*(uint *)(lVar27 + 0x94);
        lVar6 = *(long *)(*(long *)(lVar25 + 0x1a8) + 0x18 + uVar8 * 0x48);
        lVar26 = ~*(ulong *)(*(long *)(*(long *)(lVar25 + 0x1a8) + 0x38 + uVar8 * 0x48) +
                            *(long *)(local_80 + 0x110) * 8) * 0x30;
        local_90 = *(uint **)(lVar6 + 0x10 + lVar26);
        local_88 = *(long *)(lVar6 + 0x28 + lVar26);
        local_98 = *(long *)(lVar27 + 0x50);
        uVar11 = 0;
      }
      uVar24 = ~*(uint *)(local_98 + 8 + (ulong)uVar11 * 0x10);
    }
    else {
      uVar24 = uVar11;
      if (uVar11 == (uint)lVar10) {
        do {
          if (puVar20 == puVar12) {
LAB_140079680:
            plVar15 = local_2d8;
            if (local_2d8 == (long *)0x0) {
              plVar15 = uStack_2d0;
            }
            lVar10 = plVar15[2];
            uVar28 = (undefined4)local_2e8;
            uVar29 = local_2e8._4_4_;
            uVar30 = (undefined4)uStack_2e0;
            uVar31 = uStack_2e0._4_4_;
            if ((ulong)(*plVar15 - lVar10) < 0x10) {
              local_61 = 0;
              func_0x000145bfa970(lVar10,plVar15,lVar10,plVar15,0x10,1);
            }
            lVar25 = plVar15[1];
            *(undefined8 *)(lVar25 + lVar10) = 0x14027fd00;
            *(long **)(lVar25 + 8 + lVar10) = local_70;
            plVar15[2] = lVar10 + 0x10;
            local_f0 = local_2c8;
            local_100 = (undefined4)local_2d8;
            uStack_fc = local_2d8._4_4_;
            uStack_f8 = (undefined4)uStack_2d0;
            uStack_f4 = uStack_2d0._4_4_;
            local_118 = (ulong)local_70;
            uStack_110 = CONCAT44(uVar29,uVar28);
            local_108 = CONCAT44(uVar31,uVar30);
            local_140 = &local_308;
            uStack_138 = &local_2c0;
            local_130 = &local_2a0;
            local_128 = &local_260;
            local_120 = &local_71;
            local_61 = 0;
            func_0x00014024b090();
            return;
          }
          uVar11 = *puVar20;
          puVar20 = puVar20 + 1;
          lVar10 = *(long *)(*(long *)(lVar25 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
        } while (lVar10 == 0);
        lVar6 = *(long *)(lVar25 + 0x1a8) + (ulong)uVar11 * 0x48;
        lVar27 = *(long *)(lVar6 + 0x18);
        lVar6 = ~*(ulong *)(*(long *)(lVar6 + 0x38) + *(long *)(local_80 + 0x110) * 8) * 0x30;
        local_90 = *(uint **)(lVar27 + 0x10 + lVar6);
        local_88 = *(long *)(lVar27 + 0x28 + lVar6);
        uVar11 = 0;
        uVar24 = uVar11;
      }
    }
    lVar27 = (ulong)uVar24 * 0x88 + (long)local_90;
    puVar14 = (undefined4 *)(local_88 + (ulong)uVar24 * 4);
    local_61 = 0;
    lVar6 = func_0x00014588d200();
    local_118 = lVar6 + 0x98;
    uStack_110 = 0x1400020c0;
    local_61 = 0;
    func_0x000145bcce30();
    local_108 = (long)local_130;
    local_61 = 0;
    func_0x000140125ff0();
    *puVar14 = (undefined4)local_b0;
    local_a8 = (undefined4 *)(lVar27 + 0x20);
    if (*(char *)(lVar27 + 0x20) == '\0') {
      plVar15 = *(long **)(lVar27 + 0x28);
      LOCK();
      *plVar15 = *plVar15 + -1;
      UNLOCK();
      if (*plVar15 == 0) {
        func_0x000144985170();
      }
    }
    uVar11 = uVar11 + 1;
    *(long *)(local_a8 + 4) = local_c0;
    *local_a8 = local_d0;
    local_a8[1] = uStack_cc;
    local_a8[2] = uStack_c8;
    local_a8[3] = uStack_c4;
  } while( true );
LAB_140079127:
  iVar3 = 0;
  goto LAB_140079129;
}
