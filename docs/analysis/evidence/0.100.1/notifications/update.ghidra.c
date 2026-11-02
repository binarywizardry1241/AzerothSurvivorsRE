
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  char cVar3;
  long *plVar4;
  long *plVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  long lVar13;
  ulong uVar14;
  long lVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  uint uVar19;
  undefined8 uVar20;
  long lVar21;
  uint *puVar22;
  long lVar23;
  long *plVar24;
  uint uVar25;
  uint *puVar26;
  ulong uVar27;
  uint *puVar28;
  float fVar29;
  float fVar30;
  undefined4 in_XMM6_Da;
  float fVar31;
  undefined4 in_XMM7_Da;
  float fVar32;
  long *in_stack_00000028;
  long *in_stack_00000030;
  ulong *in_stack_00000038;
  long *in_stack_00000040;
  undefined8 *in_stack_00000048;
  undefined8 local_378;
  undefined8 local_358;
  undefined8 uStack_350;
  long local_348;
  undefined8 uStack_340;
  undefined8 local_338;
  long local_330;
  long lStack_328;
  undefined4 *local_320;
  undefined8 uStack_318;
  long local_310;
  long lStack_308;
  long local_300;
  long lStack_2f8;
  long local_2f0;
  long lStack_2e8;
  long local_2e0;
  ulong *local_2d8;
  long local_2d0;
  long lStack_2c8;
  undefined8 local_2c0;
  long local_2b8;
  long lStack_2b0;
  long local_2a8;
  long lStack_2a0;
  char *local_298;
  undefined8 uStack_290;
  undefined4 local_288;
  undefined4 uStack_284;
  undefined4 uStack_280;
  undefined4 uStack_27c;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined8 local_268;
  undefined8 local_260;
  undefined8 uStack_258;
  undefined8 local_250;
  undefined8 local_248;
  undefined8 uStack_240;
  undefined8 local_238;
  undefined4 local_230;
  undefined4 uStack_22c;
  undefined4 uStack_228;
  undefined4 uStack_224;
  undefined8 local_220;
  undefined4 local_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 uStack_20c;
  long local_208;
  long lStack_200;
  undefined8 local_1f8;
  undefined8 uStack_1f0;
  undefined8 local_1e8;
  long local_1e0;
  undefined8 local_1d8;
  undefined8 local_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined8 local_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined8 local_180;
  undefined8 uStack_178;
  undefined8 local_170;
  undefined8 local_168;
  undefined8 uStack_160;
  undefined8 local_158;
  undefined8 uStack_150;
  undefined8 local_148;
  undefined8 local_140;
  undefined8 uStack_138;
  undefined8 local_130;
  undefined8 uStack_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined8 local_110;
  undefined8 uStack_108;
  undefined8 local_100;
  undefined8 uStack_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 local_b0;
  undefined8 local_ac;
  undefined1 local_a4;
  undefined8 local_a0;
  undefined4 local_98;
  undefined2 local_94;
  undefined4 local_92;
  undefined2 local_8e;
  undefined4 local_8c;
  undefined2 local_88;
  undefined8 local_86;
  undefined4 local_7e;
  undefined4 local_78;
  undefined2 local_74;
  undefined4 local_68;
  undefined4 local_58;

  local_338 = param_3[4];
  local_358 = *param_3;
  uStack_350 = param_3[1];
  local_348 = param_3[2];
  uStack_340 = param_3[3];
  lVar13 = *param_5;
  lStack_328 = param_5[1];
  local_320 = (undefined4 *)param_5[2];
  lVar15 = param_5[3];
  local_2b8 = *param_6;
  lStack_2b0 = param_6[1];
  local_2a8 = param_6[2];
  lStack_2a0 = param_6[3];
  local_310 = *in_stack_00000028;
  lStack_308 = in_stack_00000028[1];
  local_300 = in_stack_00000028[2];
  lStack_2f8 = in_stack_00000028[3];
  local_2f0 = *in_stack_00000030;
  lStack_2e8 = in_stack_00000030[1];
  local_2e0 = in_stack_00000030[2];
  local_2d8 = in_stack_00000038;
  local_2c0 = in_stack_00000040[2];
  local_2d0 = *in_stack_00000040;
  lStack_2c8 = in_stack_00000040[1];
  local_298 = (char *)*in_stack_00000048;
  uStack_290 = in_stack_00000048[1];
  local_288 = *(undefined4 *)(in_stack_00000048 + 2);
  uStack_284 = *(undefined4 *)((long)in_stack_00000048 + 0x14);
  uStack_280 = *(undefined4 *)(in_stack_00000048 + 3);
  uStack_27c = *(undefined4 *)((long)in_stack_00000048 + 0x1c);
  fVar31 = *(float *)(local_310 + 0x5c);
  uStack_318._4_4_ = (undefined4)((ulong)lVar15 >> 0x20);
  if (*local_298 == '\0') {
    *local_320 = uStack_318._4_4_;
    uVar27 = *(ulong *)(lVar13 + 0x10);
    fVar29 = _DAT_1459132fc;
  }
  else {
    *local_320 = uStack_318._4_4_;
    if (*(long *)(lVar13 + 0x10) != 0) {
      lVar18 = *(long *)(lVar13 + 8);
      lVar21 = *(long *)(lVar13 + 0x10) * 0x20;
      uVar27 = lVar21 - 0x20;
      lVar23 = lVar18;
      if ((~(uint)uVar27 & 0xe0) != 0) {
        lVar16 = -(ulong)(((uint)(uVar27 >> 5) & 0x7ffffff) + 1 & 7);
        do {
          *(float *)(lVar23 + 0x1c) = fVar31;
          lVar23 = lVar23 + 0x20;
          lVar16 = lVar16 + 1;
        } while (lVar16 != 0);
      }
      if (0xdf < uVar27) {
        do {
          *(float *)(lVar23 + 0x1c) = fVar31;
          *(float *)(lVar23 + 0x3c) = fVar31;
          *(float *)(lVar23 + 0x5c) = fVar31;
          *(float *)(lVar23 + 0x7c) = fVar31;
          *(float *)(lVar23 + 0x9c) = fVar31;
          *(float *)(lVar23 + 0xbc) = fVar31;
          *(float *)(lVar23 + 0xdc) = fVar31;
          *(float *)(lVar23 + 0xfc) = fVar31;
          lVar23 = lVar23 + 0x100;
        } while (lVar23 != lVar18 + lVar21);
      }
    }
    *local_320 = uStack_318._4_4_;
    uVar27 = *(ulong *)(lVar13 + 0x10);
    fVar29 = _DAT_1459132fc;
  }
  _DAT_1459132fc = fVar29;
  local_330 = lVar13;
  uStack_318 = lVar15;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (uVar27 != 0) {
    plVar4 = *(long **)(lVar13 + 8);
    uVar17 = 0;
    plVar5 = plVar4;
LAB_1400927a0:
    plVar24 = plVar5 + 4;
    if (fVar31 - *(float *)((long)plVar5 + 0x1c) < fVar29) goto code_r0x0001400927b3;
    if (*plVar5 != 0) {
      func_0x0001400021d0();
    }
    if (uVar17 + 1 < uVar27) {
      lVar15 = ~uVar17 + uVar27;
      do {
        if (fVar31 - *(float *)((long)plVar24 + 0x1c) < fVar29) {
          lVar18 = *plVar24;
          lVar23 = plVar24[1];
          lVar21 = plVar24[3];
          plVar4[uVar17 * 4 + 2] = plVar24[2];
          (plVar4 + uVar17 * 4 + 2)[1] = lVar21;
          plVar4[uVar17 * 4] = lVar18;
          (plVar4 + uVar17 * 4)[1] = lVar23;
          uVar17 = uVar17 + 1;
        }
        else if (*plVar24 != 0) {
          func_0x0001400021d0();
        }
        plVar24 = plVar24 + 4;
        lVar15 = lVar15 + -1;
      } while (lVar15 != 0);
    }
    *(ulong *)(lVar13 + 0x10) = uVar17;
    uVar27 = uVar17;
joined_r0x0001400927c8:
    if (local_2b8 == 0) {
      return;
    }
    local_218 = (undefined4)*param_6;
    uStack_214 = *(undefined4 *)((long)param_6 + 4);
    uStack_210 = (undefined4)param_6[1];
    uStack_20c = *(undefined4 *)((long)param_6 + 0xc);
    local_208 = param_6[2];
    lStack_200 = param_6[3];
    if (uVar27 == 0) goto LAB_1400928d1;
    lVar13 = uVar27 * 0x20 + *(long *)(lVar13 + 8);
    if (lVar13 == 0x20) {
      if (uVar27 == *in_stack_00000038) goto LAB_1400928de;
      goto LAB_14009285e;
    }
    fVar29 = *(float *)(lVar13 + -4) * _DAT_145915918;
    uVar17 = 0;
    if (0.0 <= fVar29) {
      uVar17 = (long)(fVar29 - _DAT_1459071e0) & (long)fVar29 >> 0x3f | (long)fVar29;
    }
    uVar14 = 0xffffffffffffffff;
    if (fVar29 <= _DAT_1459071e4) {
      uVar14 = uVar17;
    }
    uVar27 = uVar27 + uVar14;
    if (uVar27 != *in_stack_00000038) goto LAB_14009285e;
    goto LAB_1400928de;
  }
  if (local_2b8 == 0) {
    return;
  }
  local_218 = (undefined4)*param_6;
  uStack_214 = *(undefined4 *)((long)param_6 + 4);
  uStack_210 = (undefined4)param_6[1];
  uStack_20c = *(undefined4 *)((long)param_6 + 0xc);
  local_208 = param_6[2];
  lStack_200 = param_6[3];
LAB_1400928d1:
  uVar27 = 0;
  if (*in_stack_00000038 == 0) {
LAB_1400928de:
    puVar26 = *(uint **)(local_2f0 + 0xf8);
    lVar13 = *(long *)(local_2f0 + 0x100);
    if (*(char *)(local_2f0 + 0x108) == '\0') {
      lVar15 = 0;
      do {
        if (lVar13 * 4 - lVar15 == 0) {
          *in_stack_00000038 = uVar27;
          puVar28 = puVar26 + lVar13;
          uVar20 = uStack_350;
          lVar13 = lStack_2e8;
          uVar6 = local_338;
          uVar7 = uStack_340;
          lVar15 = local_348;
          uVar8 = local_358;
          goto LAB_140092af0;
        }
        puVar28 = (uint *)((long)puVar26 + lVar15);
        lVar15 = lVar15 + 4;
      } while (*(long *)(*(long *)(lStack_2e8 + 0x108) + 0x58 + (ulong)*puVar28 * 0xa0) == 0);
    }
    else {
      lVar15 = 0;
      do {
        if (lVar13 * 4 - lVar15 == 0) {
          *in_stack_00000038 = uVar27;
          puVar28 = puVar26 + lVar13;
          uVar20 = uStack_350;
          lVar13 = lStack_2e8;
          uVar6 = local_338;
          uVar7 = uStack_340;
          lVar15 = local_348;
          uVar8 = local_358;
          goto LAB_1400929e0;
        }
        puVar28 = (uint *)((long)puVar26 + lVar15);
        lVar15 = lVar15 + 4;
      } while (*(long *)(*(long *)(lStack_2e8 + 0x1a8) + 0x10 + (ulong)*puVar28 * 0x48) == 0);
    }
  }
  else {
LAB_14009285e:
    puVar26 = *(uint **)(local_2f0 + 0xf8);
    lVar13 = *(long *)(local_2f0 + 0x100);
    cVar3 = *(char *)(local_2f0 + 0x108);
    *in_stack_00000038 = uVar27;
    puVar28 = puVar26 + lVar13;
    uVar20 = uStack_350;
    lVar13 = lStack_2e8;
    uVar6 = local_338;
    uVar7 = uStack_340;
    lVar15 = local_348;
    uVar8 = local_358;
    if (cVar3 == '\0') {
LAB_140092af0:
      if (puVar26 != puVar28) {
        uVar19 = *puVar26;
        puVar26 = puVar26 + 1;
        lVar18 = *(long *)(*(long *)(lVar13 + 0x108) + 0x58 + (ulong)uVar19 * 0xa0);
        if (lVar18 != 0) {
          lVar23 = *(long *)(*(long *)(lVar13 + 0x108) + (ulong)uVar19 * 0xa0 + 0x50);
          uVar27 = 0;
          do {
            while( true ) {
              uVar17 = uVar27 & 0xffffffff;
              uVar19 = (int)uVar27 + 1;
              uVar27 = (ulong)uVar19;
              local_1f8 = *(undefined8 *)(lVar23 + uVar17 * 0x10);
              uVar25 = (uint)lVar18;
              if ((int)local_1f8 == 0) break;
              if (lVar15 != 0) {
                local_378 = uVar6;
              }
              uStack_1f0 = uVar8;
              local_1e8 = uVar20;
              local_1e0 = lVar15;
              local_1d8 = uVar7;
              local_1d0 = local_378;
              func_0x000144e74f30();
              if ((uint)uVar27 == uVar25) goto LAB_140092af0;
            }
          } while (uVar19 != uVar25);
        }
        goto LAB_140092af0;
      }
    }
    else {
LAB_1400929e0:
      if (puVar26 != puVar28) {
        uVar19 = *puVar26;
        puVar26 = puVar26 + 1;
        lVar18 = *(long *)(*(long *)(lVar13 + 0x1a8) + 0x10 + (ulong)uVar19 * 0x48);
        if (lVar18 != 0) {
          lVar23 = *(long *)(*(long *)(lVar13 + 0x1a8) + (ulong)uVar19 * 0x48 + 8);
          uVar27 = 0;
          do {
            while( true ) {
              uVar17 = uVar27 & 0xffffffff;
              uVar19 = (int)uVar27 + 1;
              uVar27 = (ulong)uVar19;
              local_1f8 = *(undefined8 *)(lVar23 + uVar17 * 8);
              uVar25 = (uint)lVar18;
              if ((int)local_1f8 == 0) break;
              if (lVar15 != 0) {
                local_378 = uVar6;
              }
              uStack_1f0 = uVar8;
              local_1e8 = uVar20;
              local_1e0 = lVar15;
              local_1d8 = uVar7;
              local_1d0 = local_378;
              func_0x000144e74f30();
              if ((uint)uVar27 == uVar25) goto LAB_1400929e0;
            }
          } while (uVar19 != uVar25);
        }
        goto LAB_1400929e0;
      }
    }
    local_278 = _DAT_1459168b0;
    uStack_270 = uRam00000001459168b8;
    local_268 = 0;
    local_260 = _DAT_1459168c8;
    uStack_258 = uRam00000001459168d0;
    local_250 = 0;
    local_248 = _DAT_1459168e0;
    uStack_240 = uRam00000001459168e8;
    local_238 = 0;
    local_230 = _DAT_1459168f8;
    uStack_22c = uRam00000001459168fc;
    uStack_228 = uRam0000000145916900;
    uStack_224 = uRam0000000145916904;
    local_220 = 0;
    local_1f8 = _DAT_1459168b0;
    uStack_1f0 = uRam00000001459168b8;
    local_1c8 = _DAT_1459168e0;
    uStack_1c0 = uRam00000001459168e8;
    local_1e8 = 0;
    local_1e0 = _DAT_1459168c8;
    local_1d8 = uRam00000001459168d0;
    local_1d0 = 0;
    local_1b8 = 0;
    local_1b0 = CONCAT44(uRam00000001459168fc,_DAT_1459168f8);
    local_1a8 = CONCAT44(uRam0000000145916904,uRam0000000145916900);
    uStack_1a0 = 0;
    local_198 = 0;
    uStack_190 = 0;
    local_188 = 0;
    local_180 = _DAT_145915920;
    uStack_178 = 0;
    local_170 = 0x42c8000000000002;
    local_158 = 0;
    uStack_150 = 0;
    local_168 = 0;
    uStack_160 = 0;
    local_148 = 0;
    local_130 = _DAT_145916978;
    uStack_128 = uRam0000000145916980;
    local_140 = _DAT_145916968;
    uStack_138 = uRam0000000145916970;
    local_110 = _DAT_145916998;
    uStack_108 = uRam00000001459169a0;
    local_120 = _DAT_145916988;
    uStack_118 = uRam0000000145916990;
    local_f0 = _DAT_1459169b8;
    uStack_e8 = uRam00000001459169c0;
    local_100 = _DAT_1459169a8;
    uStack_f8 = uRam00000001459169b0;
    local_d0 = _DAT_1459169d8;
    uStack_c8 = uRam00000001459169e0;
    local_e0 = _DAT_1459169c8;
    uStack_d8 = uRam00000001459169d0;
    local_c0 = _DAT_145907310;
    uStack_bc = uRam0000000145907314;
    uStack_b8 = uRam0000000145907318;
    uStack_b4 = uRam000000014590731c;
    local_b0 = 1;
    local_ac = 0;
    local_a4 = 1;
    local_a0 = 0;
    local_98 = 0x3f800000;
    local_94 = 0;
    local_8e = 0;
    local_92 = 0x10000;
    local_88 = 0;
    local_8c = 0x10000;
    local_86 = 0x100000100;
    local_7e = 5;
    local_78 = 0x1004;
    local_74 = 0;
    func_0x0001400ec6a0(&local_278,&local_330,&local_358,&local_278,&local_1f8,0x145916c78);
    func_0x0001401034a0();
  }
  fVar12 = _DAT_145915930;
  fVar11 = _DAT_1459132fc;
  fVar10 = _DAT_1459132f0;
  fVar9 = _DAT_145907508;
  fVar29 = _DAT_145907490;
  puVar22 = *(uint **)(local_2d0 + 0xf8);
  puVar28 = puVar22 + *(long *)(local_2d0 + 0x100);
  cVar3 = *(char *)(local_2d0 + 0x108);
  lVar13 = 0;
  lVar23 = 8;
  lVar18 = 0;
  lVar15 = 0;
  uVar19 = 0;
  do {
    if (cVar3 == '\0') {
      if (uVar19 == (uint)lVar13) {
        do {
          if (puVar22 == puVar28) {
            return;
          }
          uVar19 = *puVar22;
          puVar22 = puVar22 + 1;
          lVar13 = *(long *)(*(long *)(lStack_2c8 + 0x108) + 0x58 + (ulong)uVar19 * 0xa0);
        } while (lVar13 == 0);
        lVar21 = *(long *)(lStack_2c8 + 0x108) + (ulong)uVar19 * 0xa0;
        uVar27 = (ulong)*(uint *)(lVar21 + 0x94);
        lVar15 = *(long *)(lStack_2c8 + 0x1a8);
        lVar23 = *(long *)(lVar15 + 0x18 + uVar27 * 0x48);
        lVar18 = *(long *)(lVar15 + 0x38 + uVar27 * 0x48);
        if ((*(ulong *)(local_2d0 + 0x118) < *(ulong *)(lVar15 + 0x40 + uVar27 * 0x48)) &&
           (uVar27 = *(ulong *)(lVar18 + *(ulong *)(local_2d0 + 0x118) * 8), uVar27 != 0)) {
          lVar15 = *(long *)(lVar23 + 0x10 + ~uVar27 * 0x30);
        }
        else {
          lVar15 = 0;
        }
        lVar16 = ~*(ulong *)(lVar18 + *(long *)(local_2d0 + 0x110) * 8) * 0x30;
        lVar18 = *(long *)(lVar23 + 0x10 + lVar16);
        puVar26 = *(uint **)(lVar23 + 0x28 + lVar16);
        lVar23 = *(long *)(lVar21 + 0x50);
        uVar19 = 0;
      }
      uVar25 = ~*(uint *)(lVar23 + 8 + (ulong)uVar19 * 0x10);
    }
    else {
      uVar25 = uVar19;
      if (uVar19 == (uint)lVar13) {
        do {
          if (puVar22 == puVar28) {
            return;
          }
          uVar19 = *puVar22;
          puVar22 = puVar22 + 1;
          lVar13 = *(long *)(*(long *)(lStack_2c8 + 0x1a8) + 0x10 + (ulong)uVar19 * 0x48);
        } while (lVar13 == 0);
        lVar18 = *(long *)(lStack_2c8 + 0x1a8) + (ulong)uVar19 * 0x48;
        lVar21 = *(long *)(lVar18 + 0x18);
        if ((*(ulong *)(local_2d0 + 0x118) < *(ulong *)(lVar18 + 0x40)) &&
           (uVar27 = *(ulong *)(*(long *)(lVar18 + 0x38) + *(ulong *)(local_2d0 + 0x118) * 8),
           uVar27 != 0)) {
          lVar15 = *(long *)(lVar21 + 0x10 + ~uVar27 * 0x30);
        }
        else {
          lVar15 = 0;
        }
        lVar16 = ~*(ulong *)(*(long *)(lVar18 + 0x38) + *(long *)(local_2d0 + 0x110) * 8) * 0x30;
        lVar18 = *(long *)(lVar21 + 0x10 + lVar16);
        puVar26 = *(uint **)(lVar21 + 0x28 + lVar16);
        uVar19 = 0;
        uVar25 = uVar19;
      }
    }
    uVar27 = (ulong)uVar25;
    puVar1 = (undefined8 *)(lVar18 + uVar27 * 0x14);
    puVar2 = (undefined8 *)(lVar15 + uVar27 * 0x18);
    fVar30 = (fVar31 - *(float *)((long)puVar2 + 0x14)) / fVar11;
    if (fVar30 < fVar10) {
      fVar32 = fVar30 / fVar10;
    }
    else {
      fVar32 = fVar29;
      if (fVar12 < fVar30) {
        fVar32 = (fVar29 - fVar30) * fVar9;
      }
    }
    fVar30 = 0.0;
    if (0.0 <= fVar32) {
      fVar30 = fVar32;
    }
    uVar19 = uVar19 + 1;
    fVar32 = fVar29;
    if (fVar30 <= fVar29) {
      fVar32 = fVar30;
    }
    uVar6 = *puVar2;
    uVar7 = puVar2[1];
    puVar26[uVar27] = local_2c0._4_4_;
    *puVar1 = uVar6;
    puVar1[1] = uVar7;
    *(float *)(puVar1 + 2) = fVar32;
  } while( true );
code_r0x0001400927b3:
  uVar17 = uVar17 + 1;
  plVar5 = plVar24;
  if (uVar27 == uVar17) goto joined_r0x0001400927c8;
  goto LAB_1400927a0;
}
