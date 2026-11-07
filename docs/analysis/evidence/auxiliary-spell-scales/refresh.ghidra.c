/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long *plVar1;
  undefined8 *puVar2;
  ulong *puVar3;
  code *pcVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  int iVar7;
  ulong uVar8;
  long *plVar9;
  undefined4 *puVar10;
  long lVar11;
  ulong uVar12;
  long *plVar13;
  ulong uVar14;
  ulong uVar15;
  long lVar16;
  char *pcVar17;
  long lVar18;
  ulong *puVar19;
  ulong *puVar20;
  long lVar21;
  char *pcVar22;
  ulong uVar23;
  ulong uVar24;
  ulong uVar25;
  undefined4 in_XMM6_Da;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 uVar29;
  undefined4 in_XMM7_Da;
  undefined4 uVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  undefined4 uVar33;
  undefined4 uVar34;
  undefined4 uVar35;
  undefined4 uVar36;
  undefined4 uVar37;
  undefined4 uVar38;
  undefined4 uVar39;
  undefined4 uVar40;
  undefined4 uVar41;
  undefined4 uVar42;
  undefined4 local_2b0;
  undefined4 uStack_2ac;
  undefined4 uStack_2a8;
  undefined4 uStack_2a4;
  undefined4 local_2a0;
  undefined4 uStack_29c;
  undefined4 uStack_298;
  undefined4 uStack_294;
  undefined4 local_290;
  undefined4 uStack_28c;
  undefined4 uStack_288;
  undefined4 uStack_284;
  undefined4 local_280;
  undefined4 uStack_27c;
  undefined4 uStack_278;
  undefined4 uStack_274;
  ulong local_270;
  undefined8 uStack_268;
  undefined8 local_260;
  undefined8 uStack_258;
  long local_250;
  long lStack_248;
  long local_240;
  undefined4 local_238;
  undefined4 uStack_234;
  undefined4 uStack_230;
  undefined4 uStack_22c;
  undefined4 local_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined4 local_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 uStack_20c;
  undefined4 local_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  ulong local_1f8;
  undefined8 uStack_1f0;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d0;
  undefined4 uStack_1c8;
  undefined4 uStack_1c4;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  undefined8 uStack_1b8;
  undefined4 local_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  undefined4 uStack_198;
  undefined4 uStack_194;
  undefined4 uStack_190;
  undefined4 local_18c;
  undefined4 uStack_188;
  undefined4 local_184;
  undefined4 local_180;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  undefined4 uStack_174;
  undefined8 local_170;
  long local_168;
  long lStack_160;
  long local_158;
  undefined4 local_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 uStack_128;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  ulong local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  ulong local_d0;
  long local_c8;
  long *local_c0;
  undefined1 local_b2;
  undefined1 local_b1;
  undefined8 local_b0;
  undefined4 local_a8;
  undefined4 local_98;

  local_b0 = 0xfffffffffffffffe;
  local_a8 = in_XMM6_Da;
  local_98 = in_XMM7_Da;
  func_0x0001458e3800(param_1,param_4,param_4 + 0x1b0,&local_2b0);
  uVar12 = local_270;
  local_b2 = 1;
  func_0x00014599e640();
  uVar24 = CONCAT44(uStack_128._4_4_,(undefined4)uStack_128);
  if (CONCAT44(local_138._4_4_,(undefined4)local_138) != 0) {
    func_0x0001400021d0();
  }
  local_1e8 = local_260;
  uStack_1e0 = uStack_258;
  local_1f8 = local_270;
  uStack_1f0 = uStack_268;
  local_208 = local_280;
  uStack_204 = uStack_27c;
  uStack_200 = uStack_278;
  uStack_1fc = uStack_274;
  local_218 = local_290;
  uStack_214 = uStack_28c;
  uStack_210 = uStack_288;
  uStack_20c = uStack_284;
  local_228 = local_2a0;
  uStack_224 = uStack_29c;
  uStack_220 = uStack_298;
  uStack_21c = uStack_294;
  local_238 = local_2b0;
  uStack_234 = uStack_2ac;
  uStack_230 = uStack_2a8;
  uStack_22c = uStack_2a4;
  local_d0 = uVar24;
  if (*(long *)(param_4 + 0x388) != -1) {
    local_b1 = 1;
    func_0x00014587af80();
    local_c8 = CONCAT44(local_138._4_4_,(undefined4)local_138);
    pcVar22 = (char *)CONCAT44(uStack_130._4_4_,(undefined4)uStack_130);
    if (CONCAT44(uStack_128._4_4_,(undefined4)uStack_128) != 0) {
      pcVar17 = pcVar22 + CONCAT44(uStack_128._4_4_,(undefined4)uStack_128) * 0x40;
      do {
        if (*pcVar22 == -1) break;
        uStack_104 = *(undefined4 *)(pcVar22 + 0x34);
        uStack_100 = *(undefined4 *)(pcVar22 + 0x38);
        uStack_fc = *(undefined4 *)(pcVar22 + 0x3c);
        uStack_114._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x25);
        uStack_114 = CONCAT31(uStack_114._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x21) >> 0x18)
                             );
        uStack_110._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x29);
        uStack_110 = CONCAT31(uStack_110._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x25) >> 0x18)
                             );
        uStack_10c._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x2d);
        uStack_10c = CONCAT31(uStack_10c._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x29) >> 0x18)
                             );
        local_108._1_3_ = (undefined3)((uint)*(undefined4 *)(pcVar22 + 0x30) >> 8);
        local_108._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar22 + 0x2d) >> 0x18);
        uStack_128._5_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x15);
        uStack_128._4_4_ =
             CONCAT31(uStack_128._5_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x11) >> 0x18));
        uStack_120._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x19);
        uStack_120 = CONCAT31(uStack_120._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x15) >> 0x18)
                             );
        uStack_11c._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0x1d);
        uStack_11c = CONCAT31(uStack_11c._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 0x19) >> 0x18)
                             );
        uStack_118._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar22 + 0x1d) >> 0x18);
        uStack_118 = CONCAT31((int3)*(undefined4 *)(pcVar22 + 0x21),(undefined1)uStack_118);
        local_138._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar22 + 1),*pcVar22);
        local_138._5_3_ = (undefined3)*(undefined4 *)(pcVar22 + 5);
        local_138._4_4_ =
             CONCAT31(local_138._5_3_,(char)((uint)*(undefined4 *)(pcVar22 + 1) >> 0x18));
        uStack_130._1_3_ = (undefined3)*(undefined4 *)(pcVar22 + 9);
        uStack_130._0_4_ =
             CONCAT31(uStack_130._1_3_,(char)((uint)*(undefined4 *)(pcVar22 + 5) >> 0x18));
        uStack_130._5_3_ = (undefined3)*(undefined4 *)(pcVar22 + 0xd);
        uStack_130._4_4_ =
             CONCAT31(uStack_130._5_3_,(char)((uint)*(undefined4 *)(pcVar22 + 9) >> 0x18));
        uStack_128._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar22 + 0xd) >> 0x18);
        uStack_128._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar22 + 0x11),(undefined1)uStack_128);
        func_0x000145b9c990();
        local_158 = local_240;
        local_168 = local_250;
        lStack_160 = lStack_248;
        local_150 = *(undefined4 *)(param_4 + 0x3d0);
        uStack_14c = *(undefined4 *)(param_4 + 0x3d4);
        uStack_148 = *(undefined4 *)(param_4 + 0x3d8);
        uStack_144 = *(undefined4 *)(param_4 + 0x3dc);
        func_0x0001458e3540();
        pcVar22 = pcVar22 + 0x40;
      } while (pcVar22 != pcVar17);
    }
    uVar24 = local_d0;
    if (local_c8 != 0) {
      func_0x0001400021d0();
    }
  }
  local_e8 = local_1e8;
  uStack_e0 = uStack_1e0;
  local_f8 = local_1f8;
  uStack_f0 = uStack_1f0;
  local_108 = local_208;
  uStack_104 = uStack_204;
  uStack_100 = uStack_200;
  uStack_fc = uStack_1fc;
  uStack_118 = local_218;
  uStack_114 = uStack_214;
  uStack_110 = uStack_210;
  uStack_10c = uStack_20c;
  uStack_128._0_4_ = local_228;
  uStack_128._4_4_ = uStack_224;
  uStack_120 = uStack_220;
  uStack_11c = uStack_21c;
  local_138._0_4_ = local_238;
  local_138._4_4_ = uStack_234;
  uStack_130._0_4_ = uStack_230;
  uStack_130._4_4_ = uStack_22c;
  func_0x0001458784e0();
  *(undefined8 *)(param_4 + 0x7c0) = local_e8;
  *(undefined8 *)(param_4 + 0x7c8) = uStack_e0;
  *(ulong *)(param_4 + 0x7b0) = local_f8;
  *(undefined8 *)(param_4 + 0x7b8) = uStack_f0;
  *(undefined4 *)(param_4 + 0x7a0) = local_108;
  *(undefined4 *)(param_4 + 0x7a4) = uStack_104;
  *(undefined4 *)(param_4 + 0x7a8) = uStack_100;
  *(undefined4 *)(param_4 + 0x7ac) = uStack_fc;
  *(undefined4 *)(param_4 + 0x790) = uStack_118;
  *(undefined4 *)(param_4 + 0x794) = uStack_114;
  *(undefined4 *)(param_4 + 0x798) = uStack_110;
  *(undefined4 *)(param_4 + 0x79c) = uStack_10c;
  *(undefined4 *)(param_4 + 0x780) = (undefined4)uStack_128;
  *(undefined4 *)(param_4 + 0x784) = uStack_128._4_4_;
  *(undefined4 *)(param_4 + 0x788) = uStack_120;
  *(undefined4 *)(param_4 + 0x78c) = uStack_11c;
  *(undefined4 *)(param_4 + 0x770) = (undefined4)local_138;
  *(undefined4 *)(param_4 + 0x774) = local_138._4_4_;
  *(undefined4 *)(param_4 + 0x778) = (undefined4)uStack_130;
  *(undefined4 *)(param_4 + 0x77c) = uStack_130._4_4_;
  uVar8 = *(ulong *)(param_4 + 0x78);
  if (uVar12 <= *(ulong *)(param_4 + 0x78)) {
    *(ulong *)(param_4 + 0x78) = uVar12;
    uVar8 = uVar12;
  }
  uVar25 = *(ulong *)(param_4 + 0x7b0);
  uVar23 = uVar25 - uVar8;
  if (uVar8 <= uVar25 && uVar23 != 0) {
    if (*(long *)(param_4 + 0x68) - uVar8 < uVar23) {
      local_b1 = 0;
      func_0x000145bcb2d0();
      lVar16 = *(long *)(param_4 + 0x70);
      puVar10 = (undefined4 *)(lVar16 + *(ulong *)(param_4 + 0x78) * 4);
      uVar24 = *(ulong *)(param_4 + 0x78);
    }
    else {
      lVar16 = *(long *)(param_4 + 0x70);
      puVar10 = (undefined4 *)(lVar16 + uVar8 * 4);
      uVar24 = uVar8;
    }
    if (1 < uVar23) {
      func_0x000145bc9781();
      puVar10 = (undefined4 *)(lVar16 + (uVar25 + uVar24) * 4 + uVar8 * -4 + -4);
      uVar24 = (uVar24 + uVar23) - 1;
    }
    *puVar10 = 0;
    uVar25 = uVar24 + 1;
    uVar24 = local_d0;
  }
  *(ulong *)(param_4 + 0x78) = uVar25;
  uVar8 = *(ulong *)(param_4 + 0x90);
  if (uVar12 <= *(ulong *)(param_4 + 0x90)) {
    *(ulong *)(param_4 + 0x90) = uVar12;
    uVar8 = uVar12;
  }
  uVar25 = *(ulong *)(param_4 + 0x7b0);
  uVar23 = uVar25 - uVar8;
  if (uVar8 <= uVar25 && uVar23 != 0) {
    if (*(long *)(param_4 + 0x80) - uVar8 < uVar23) {
      local_b1 = 0;
      func_0x000145bcb2d0();
      lVar16 = *(long *)(param_4 + 0x88);
      puVar10 = (undefined4 *)(lVar16 + *(ulong *)(param_4 + 0x90) * 4);
      uVar24 = *(ulong *)(param_4 + 0x90);
    }
    else {
      lVar16 = *(long *)(param_4 + 0x88);
      puVar10 = (undefined4 *)(lVar16 + uVar8 * 4);
      uVar24 = uVar8;
    }
    if (1 < uVar23) {
      func_0x000145bc9781();
      puVar10 = (undefined4 *)(lVar16 + (uVar25 + uVar24) * 4 + uVar8 * -4 + -4);
      uVar24 = (uVar24 + uVar23) - 1;
    }
    *puVar10 = 0;
    uVar25 = uVar24 + 1;
    uVar24 = local_d0;
  }
  *(ulong *)(param_4 + 0x90) = uVar25;
  uVar8 = *(ulong *)(param_4 + 0xa8);
  lVar16 = uVar8 - uVar12;
  if (uVar12 <= uVar8) {
    *(ulong *)(param_4 + 0xa8) = uVar12;
    uVar8 = uVar12;
    if (lVar16 != 0) {
      lVar18 = *(long *)(param_4 + 0xa0) + uVar12 * 0x18 + 8;
      do {
        if (*(long *)(lVar18 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar18 = lVar18 + 0x18;
        lVar16 = lVar16 + -1;
      } while (lVar16 != 0);
      uVar8 = *(ulong *)(param_4 + 0xa8);
    }
  }
  uVar25 = *(ulong *)(param_4 + 0x7b0);
  if (uVar8 < uVar25) {
    local_138._0_4_ = 0;
    local_138._4_4_ = 0;
    uStack_130._0_4_ = 4;
    uStack_130._4_4_ = 0;
    uStack_128._0_4_ = 0;
    uStack_128._4_4_ = 0;
    local_b1 = 0;
    func_0x000145997a50();
  }
  else {
    *(ulong *)(param_4 + 0xa8) = uVar25;
    lVar16 = uVar8 - uVar25;
    if (lVar16 != 0) {
      lVar18 = *(long *)(param_4 + 0xa0) + uVar25 * 0x18 + 8;
      do {
        if (*(long *)(lVar18 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar18 = lVar18 + 0x18;
        lVar16 = lVar16 + -1;
      } while (lVar16 != 0);
    }
  }
  uVar8 = *(ulong *)(param_4 + 0x60);
  if (uVar8 != 0) {
    puVar3 = *(ulong **)(param_4 + 0x58);
    uVar25 = 0;
    puVar20 = puVar3;
    do {
      puVar19 = puVar20 + 2;
      if (uVar12 <= *puVar20) {
        uVar23 = uVar25 + 1;
        if (uVar23 < uVar8) {
          uVar14 = uVar25 - uVar8;
          uVar15 = uVar14;
          if ((uVar14 & 1) == 0) {
            uVar15 = uVar25;
            if (*puVar19 < uVar12) {
              *(int *)puVar20 = (int)*puVar19;
              *(undefined4 *)((long)puVar20 + 4) = *(undefined4 *)((long)puVar20 + 0x14);
              *(int *)(puVar20 + 1) = (int)puVar20[3];
              *(undefined4 *)((long)puVar20 + 0xc) = *(undefined4 *)((long)puVar20 + 0x1c);
              uVar15 = uVar25 + 1;
            }
            uVar23 = uVar25 + 2;
            uVar25 = uVar15;
          }
          if (uVar14 != 0xfffffffffffffffe) {
            lVar16 = uVar8 - uVar23;
            puVar20 = puVar3 + uVar23 * 2 + 2;
            uVar15 = uVar25;
            do {
              if (puVar20[-2] < uVar12) {
                uVar36 = *(undefined4 *)((long)puVar20 + -0xc);
                uVar8 = puVar20[-1];
                uVar37 = *(undefined4 *)((long)puVar20 + -4);
                puVar19 = puVar3 + uVar15 * 2;
                *(int *)puVar19 = (int)puVar20[-2];
                *(undefined4 *)((long)puVar19 + 4) = uVar36;
                *(int *)(puVar19 + 1) = (int)uVar8;
                *(undefined4 *)((long)puVar19 + 0xc) = uVar37;
                uVar15 = uVar15 + 1;
                uVar8 = *puVar20;
              }
              else {
                uVar8 = *puVar20;
              }
              if (uVar8 < uVar12) {
                uVar36 = *(undefined4 *)((long)puVar20 + 4);
                uVar8 = puVar20[1];
                uVar37 = *(undefined4 *)((long)puVar20 + 0xc);
                puVar19 = puVar3 + uVar15 * 2;
                *(int *)puVar19 = (int)*puVar20;
                *(undefined4 *)((long)puVar19 + 4) = uVar36;
                *(int *)(puVar19 + 1) = (int)uVar8;
                *(undefined4 *)((long)puVar19 + 0xc) = uVar37;
                uVar15 = uVar15 + 1;
              }
              puVar20 = puVar20 + 4;
              lVar16 = lVar16 + -2;
            } while (lVar16 != 0);
          }
          *(ulong *)(param_4 + 0x60) = uVar15;
        }
        else {
          *(ulong *)(param_4 + 0x60) = uVar25;
        }
        break;
      }
      uVar25 = uVar25 + 1;
      puVar20 = puVar19;
    } while (uVar25 != uVar8);
  }
  if (uVar24 <= *(ulong *)(param_4 + 0xc0)) {
    *(ulong *)(param_4 + 0xc0) = uVar24;
  }
  local_b1 = 0;
  func_0x00014599e640();
  local_c8 = CONCAT44(local_138._4_4_,(undefined4)local_138);
  plVar9 = (long *)CONCAT44(uStack_130._4_4_,(undefined4)uStack_130);
  uVar12 = CONCAT44(uStack_128._4_4_,(undefined4)uStack_128);
  uVar8 = 0;
  if (uVar24 <= uVar12) {
    uVar8 = uVar12 - uVar24;
  }
  local_c0 = plVar9;
  if (uVar12 <= uVar24) goto LAB_1459285e7;
  uVar25 = (ulong)((uint)uVar8 & 3);
  if (uVar24 - uVar12 < 0xfffffffffffffffd) {
    uVar12 = 0;
    plVar13 = plVar9;
    do {
      lVar16 = plVar13[uVar24 * 3];
      lVar18 = (plVar13 + uVar24 * 3)[1];
      plVar13[2] = plVar13[uVar24 * 3 + 2];
      *plVar13 = lVar16;
      plVar13[1] = lVar18;
      lVar16 = plVar13[uVar24 * 3 + 3];
      lVar18 = (plVar13 + uVar24 * 3 + 3)[1];
      plVar13[5] = plVar13[uVar24 * 3 + 5];
      plVar13[3] = lVar16;
      plVar13[4] = lVar18;
      lVar16 = plVar13[uVar24 * 3 + 6];
      lVar18 = (plVar13 + uVar24 * 3 + 6)[1];
      plVar13[8] = plVar13[uVar24 * 3 + 8];
      plVar13[6] = lVar16;
      plVar13[7] = lVar18;
      uVar12 = uVar12 + 4;
      plVar1 = plVar13 + uVar24 * 3 + 9;
      lVar16 = *plVar1;
      uVar36 = *(undefined4 *)((long)plVar1 + 4);
      lVar18 = plVar1[1];
      uVar37 = *(undefined4 *)((long)plVar1 + 0xc);
      plVar13[0xb] = plVar13[uVar24 * 3 + 0xb];
      *(int *)(plVar13 + 9) = (int)lVar16;
      *(undefined4 *)((long)plVar13 + 0x4c) = uVar36;
      *(int *)(plVar13 + 10) = (int)lVar18;
      *(undefined4 *)((long)plVar13 + 0x54) = uVar37;
      plVar13 = plVar13 + 0xc;
    } while ((uVar8 & 0x7fffffffffffffc) != uVar12);
    if (uVar25 != 0) goto LAB_1459283f0;
  }
  else {
    uVar12 = 0;
LAB_1459283f0:
    plVar13 = plVar9 + uVar12 * 3;
    do {
      plVar1 = plVar13 + uVar24 * 3;
      lVar16 = *plVar1;
      uVar36 = *(undefined4 *)((long)plVar1 + 4);
      lVar18 = plVar1[1];
      uVar37 = *(undefined4 *)((long)plVar1 + 0xc);
      plVar13[2] = plVar13[uVar24 * 3 + 2];
      *(int *)plVar13 = (int)lVar16;
      *(undefined4 *)((long)plVar13 + 4) = uVar36;
      *(int *)(plVar13 + 1) = (int)lVar18;
      *(undefined4 *)((long)plVar13 + 0xc) = uVar37;
      plVar13 = plVar13 + 3;
      uVar25 = uVar25 - 1;
    } while (uVar25 != 0);
  }
  plVar13 = plVar9 + uVar8 * 3;
  uVar26 = 0;
  uVar27 = 0;
  uVar28 = 0;
  uVar29 = 0;
  uVar30 = (undefined4)_DAT_145d73d20;
  uVar31 = (undefined4)((ulong)_DAT_145d73d20 >> 0x20);
  uVar32 = (undefined4)_DAT_145d70ca0;
  uVar33 = (undefined4)((ulong)_DAT_145d70ca0 >> 0x20);
  uVar34 = 0;
  uVar35 = 0;
  uVar36 = uVar32;
  uVar37 = uVar33;
  uVar38 = _DAT_145d73d30;
  uVar39 = uRam0000000145d73d34;
  uVar40 = uRam0000000145d73d38;
  uVar41 = uRam0000000145d73d3c;
  do {
    lVar16 = *plVar9;
    if (lVar16 == 0) break;
    uVar42 = (undefined4)plVar9[2];
    lVar18 = plVar9[1];
    lVar11 = 0;
    plVar9 = plVar9 + 3;
    local_168 = lVar16;
    lStack_160 = lVar18;
    while ((*(long *)(lVar11 + 0x146bacae0) != lVar18 || (iVar7 = func_0x000145bc9787(), iVar7 != 0)
           )) {
      lVar11 = lVar11 + 0x78;
      if (lVar11 == 0x34f8) {
        local_138 = &local_168;
        uStack_130._0_4_ = 0x400020c0;
        uStack_130._4_4_ = 1;
        func_0x000145d699c0();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
    }
    uStack_1b8 = 0;
    local_1d0 = lVar11 + 0x146bacad8;
    local_1b0 = 1;
    uStack_1a4 = 0x3f800000;
    uStack_1a0 = 0;
    local_184 = 0;
    local_170 = CONCAT44(uVar37,uVar36);
    uStack_1c8 = uVar26;
    uStack_1c4 = uVar27;
    uStack_1c0 = uVar28;
    uStack_1bc = uVar29;
    uStack_1ac = uVar30;
    uStack_1a8 = uVar31;
    uStack_19c = uVar32;
    uStack_198 = uVar33;
    uStack_194 = uVar34;
    uStack_190 = uVar35;
    local_18c = uVar36;
    uStack_188 = uVar37;
    local_180 = uVar38;
    uStack_17c = uVar39;
    uStack_178 = uVar40;
    uStack_174 = uVar41;
    func_0x0001458e3a30();
    uStack_1ac = 0x3f800000;
    lVar16 = *(long *)(param_4 + 0xc0);
    if (lVar16 == *(long *)(param_4 + 0xb0)) {
      func_0x000145bce8c0();
    }
    lVar18 = *(long *)(param_4 + 0xb8);
    lVar11 = lVar16 * 0x70;
    *(undefined8 *)(lVar18 + 0x60 + lVar11) = local_170;
    puVar2 = (undefined8 *)(lVar18 + 0x50 + lVar11);
    *puVar2 = CONCAT44(uStack_17c,local_180);
    puVar2[1] = CONCAT44(uStack_174,uStack_178);
    puVar2 = (undefined8 *)(lVar18 + 0x40 + lVar11);
    *puVar2 = CONCAT44(local_18c,uStack_190);
    puVar2[1] = CONCAT44(local_184,uStack_188);
    puVar2 = (undefined8 *)(lVar18 + 0x30 + lVar11);
    *puVar2 = CONCAT44(uStack_19c,uStack_1a0);
    puVar2[1] = CONCAT44(uStack_194,uStack_198);
    puVar2 = (undefined8 *)(lVar18 + 0x20 + lVar11);
    *puVar2 = CONCAT44(uStack_1ac,local_1b0);
    puVar2[1] = CONCAT44(uStack_1a4,uStack_1a8);
    puVar2 = (undefined8 *)(lVar18 + 0x10 + lVar11);
    *puVar2 = CONCAT44(uStack_1bc,uStack_1c0);
    puVar2[1] = uStack_1b8;
    puVar10 = (undefined4 *)(lVar18 + lVar11);
    *puVar10 = (undefined4)local_1d0;
    puVar10[1] = local_1d0._4_4_;
    puVar10[2] = uStack_1c8;
    puVar10[3] = uStack_1c4;
    *(undefined4 *)(lVar18 + 0x68 + lVar11) = uVar42;
    *(long *)(param_4 + 0xc0) = lVar16 + 1;
  } while (plVar9 != plVar13);
LAB_1459285e7:
  if (local_c8 != 0) {
    func_0x0001400021d0();
  }
  lVar16 = *(long *)(param_4 + 0x318);
  uStack_130 = *(long *)(param_4 + 800) * 0x68 + lVar16;
  local_138._0_4_ = (undefined4)lVar16;
  local_138._4_4_ = (undefined4)((ulong)lVar16 >> 0x20);
  uStack_128 = param_4 + 0x770;
  local_b1 = 0;
  func_0x0001459a91b0();
  lVar16 = *(long *)(param_4 + 800);
  if (lVar16 != 0) {
    lVar18 = *(long *)(param_4 + 0x318);
    lVar11 = 0;
    lVar21 = 0;
    do {
      if (local_158 * 0x24 == lVar11) break;
      puVar10 = (undefined4 *)(lStack_160 + lVar11);
      uVar36 = *puVar10;
      uVar37 = puVar10[1];
      uVar38 = puVar10[2];
      uVar39 = puVar10[3];
      uVar5 = *(undefined8 *)(puVar10 + 4);
      uVar6 = *(undefined8 *)(puVar10 + 6);
      *(undefined4 *)(lVar18 + 100 + lVar21) = puVar10[8];
      puVar2 = (undefined8 *)(lVar18 + 0x54 + lVar21);
      *puVar2 = uVar5;
      puVar2[1] = uVar6;
      puVar10 = (undefined4 *)(lVar18 + 0x44 + lVar21);
      *puVar10 = uVar36;
      puVar10[1] = uVar37;
      puVar10[2] = uVar38;
      puVar10[3] = uVar39;
      lVar21 = lVar21 + 0x68;
      lVar11 = lVar11 + 0x24;
    } while (lVar16 * 0x68 - lVar21 != 0);
  }
  if (local_168 != 0) {
    func_0x0001400021d0();
  }
  lVar16 = *(long *)(param_4 + 0xb8);
  lVar18 = *(long *)(param_4 + 0xc0) * 0x70 + lVar16;
  if (lVar16 != lVar18) {
    do {
      local_b1 = 0;
      func_0x0001458e3a30();
      *(undefined4 *)(lVar16 + 100) = uStack_118;
      *(long *)(lVar16 + 0x54) = uStack_128;
      *(ulong *)(lVar16 + 0x5c) = CONCAT44(uStack_11c,uStack_120);
      *(undefined4 *)(lVar16 + 0x44) = (undefined4)local_138;
      *(undefined4 *)(lVar16 + 0x48) = local_138._4_4_;
      *(long *)(lVar16 + 0x4c) = uStack_130;
      lVar16 = lVar16 + 0x70;
    } while (lVar16 != lVar18);
  }
  local_b1 = 0;
  func_0x0001458f96f0();
  return;
}
