
/* WARNING: Removing unreachable block (ram,0x00014021b1f2) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          undefined8 *param_6)

{
  uint *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  code *pcVar5;
  undefined8 *puVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  char *pcVar10;
  char *pcVar11;
  long lVar12;
  undefined8 uVar13;
  undefined8 **ppuVar14;
  undefined8 *extraout_RDX;
  long extraout_RDX_00;
  undefined8 *extraout_RDX_01;
  long extraout_RDX_02;
  long extraout_RDX_03;
  uint uVar15;
  long lVar16;
  uint *puVar17;
  long lVar18;
  uint uVar19;
  long lVar20;
  long *plVar21;
  undefined4 in_XMM6_Da;
  float fVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  long *in_stack_00000028;
  long *in_stack_00000030;
  undefined8 *in_stack_00000038;
  undefined8 *in_stack_00000040;
  long *in_stack_00000048;
  undefined4 local_588;
  undefined4 uStack_584;
  undefined4 uStack_580;
  undefined4 uStack_57c;
  long local_578;
  long lStack_570;
  undefined8 *local_568;
  long lStack_560;
  undefined8 *local_558;
  undefined8 local_550;
  undefined8 uStack_548;
  undefined8 local_540;
  undefined8 local_538;
  undefined8 uStack_530;
  undefined8 local_528;
  undefined4 local_520;
  undefined4 uStack_51c;
  undefined4 uStack_518;
  undefined4 uStack_514;
  undefined8 local_510;
  undefined8 local_508;
  undefined8 local_500;
  undefined8 uStack_4f8;
  undefined8 local_4f0;
  undefined8 uStack_4e8;
  undefined4 local_4e0;
  undefined4 uStack_4dc;
  undefined4 uStack_4d8;
  undefined4 uStack_4d4;
  undefined8 local_4d0;
  undefined8 uStack_4c8;
  undefined8 local_4c0;
  undefined8 uStack_4b8;
  undefined8 local_4b0;
  undefined8 uStack_4a8;
  undefined8 local_4a0;
  undefined8 uStack_498;
  undefined8 local_490;
  undefined8 uStack_488;
  undefined8 local_480;
  undefined8 uStack_478;
  undefined8 local_470;
  undefined8 uStack_468;
  undefined8 local_460;
  undefined8 uStack_458;
  undefined8 local_450;
  undefined8 uStack_448;
  undefined8 local_440;
  undefined8 uStack_438;
  undefined8 local_430;
  undefined8 uStack_428;
  undefined4 local_420;
  undefined8 local_41c;
  undefined1 local_414;
  undefined8 local_410;
  undefined4 local_408;
  undefined2 local_404;
  undefined4 local_402;
  undefined2 local_3fe;
  undefined4 local_3fc;
  undefined2 local_3f8;
  undefined4 local_3f6;
  undefined1 local_3f2;
  undefined1 local_3f1;
  undefined4 local_3f0;
  undefined2 local_3ec;
  long local_3e8;
  undefined8 uStack_3e0;
  undefined8 **local_3d8;
  undefined8 *local_3d0;
  undefined4 *local_3c8;
  undefined8 **local_3c0;
  undefined4 *local_3b8;
  undefined1 *local_3b0;
  long *local_3a8;
  undefined8 *local_3a0;
  long *local_398;
  undefined1 *local_390;
  undefined8 **local_388;
  long *local_380;
  long local_378;
  undefined8 *local_370;
  undefined8 local_268;
  undefined8 *local_260;
  undefined8 local_258;
  undefined4 local_250;
  undefined2 local_24c;
  long local_248;
  undefined8 **ppuStack_240;
  long local_238;
  long lStack_230;
  long local_228;
  long local_220;
  long lStack_218;
  long local_210;
  long lStack_208;
  undefined8 *local_200;
  undefined8 uStack_1f8;
  undefined8 *local_1f0;
  undefined8 uStack_1e8;
  long local_1e0;
  long lStack_1d8;
  long local_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  long local_188;
  long lStack_180;
  long local_178;
  long lStack_170;
  long local_168;
  long lStack_160;
  long local_158;
  long lStack_150;
  undefined1 local_140 [16];
  undefined8 local_130;
  undefined8 local_128;
  long local_120;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined8 *local_100;
  long local_f8;
  undefined8 *local_f0;
  long local_e8;
  long local_e0;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined4 local_c8;
  long local_b8;
  long lStack_b0;
  undefined8 **local_a8;
  undefined8 **local_a0;
  long local_98;
  long local_90;
  undefined1 local_81;
  long local_80;
  undefined8 **local_78;
  undefined8 **local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  lVar12 = param_3[4];
  lVar20 = *param_3;
  ppuVar14 = (undefined8 **)param_3[1];
  lVar16 = param_3[2];
  lVar18 = param_3[3];
  local_220 = *param_5;
  lStack_218 = param_5[1];
  local_210 = param_5[2];
  lStack_208 = param_5[3];
  puVar6 = (undefined8 *)*param_6;
  uStack_1f8 = param_6[1];
  local_1f0 = (undefined8 *)param_6[2];
  uVar13 = param_6[3];
  local_1d0 = in_stack_00000028[2];
  local_1e0 = *in_stack_00000028;
  lVar7 = in_stack_00000028[1];
  local_188 = *in_stack_00000030;
  lStack_180 = in_stack_00000030[1];
  local_178 = in_stack_00000030[2];
  lStack_170 = in_stack_00000030[3];
  local_1c8 = *in_stack_00000038;
  uStack_1c0 = in_stack_00000038[1];
  local_1b8 = in_stack_00000038[2];
  uStack_1b0 = in_stack_00000038[3];
  local_1a8 = *in_stack_00000040;
  uStack_1a0 = in_stack_00000040[1];
  local_198 = in_stack_00000040[2];
  uStack_190 = in_stack_00000040[3];
  local_168 = *in_stack_00000048;
  lStack_160 = in_stack_00000048[1];
  local_158 = in_stack_00000048[2];
  lStack_150 = in_stack_00000048[3];
  if (*(int *)(local_220 + 0xe0) == *(int *)(puVar6 + 8)) {
    return;
  }
  fVar22 = *(float *)(local_168 + 0x5c);
  if ((*(int *)(puVar6 + 2) == 1) && (fVar22 - *(float *)((long)puVar6 + 0x14) < _DAT_14593ff60)) {
    return;
  }
  if (local_188 == 0) {
    return;
  }
  local_588 = (undefined4)*in_stack_00000030;
  uStack_584 = *(undefined4 *)((long)in_stack_00000030 + 4);
  uStack_580 = (undefined4)in_stack_00000030[1];
  uStack_57c = *(undefined4 *)((long)in_stack_00000030 + 0xc);
  local_578 = in_stack_00000030[2];
  lStack_570 = in_stack_00000030[3];
  uStack_1e8._4_4_ = (undefined4)((ulong)uVar13 >> 0x20);
  *(int *)(puVar6 + 8) = *(int *)(local_220 + 0xe0);
  *(undefined4 *)(puVar6 + 2) = 0;
  local_70 = (undefined8 **)CONCAT44(local_70._4_4_,uStack_1e8._4_4_);
  *(undefined4 *)local_1f0 = uStack_1e8._4_4_;
  *puVar6 = 0;
  puVar17 = *(uint **)(local_1e0 + 0xf8);
  puVar1 = puVar17 + *(long *)(local_1e0 + 0x100);
  local_248 = lVar20;
  ppuStack_240 = ppuVar14;
  local_238 = lVar16;
  lStack_230 = lVar18;
  local_228 = lVar12;
  local_200 = puVar6;
  uStack_1e8 = uVar13;
  lStack_1d8 = lVar7;
  local_98 = local_220;
  local_78 = (undefined8 **)local_1f0;
  local_58 = in_XMM6_Da;
  if (*(char *)(local_1e0 + 0x108) == '\x01') {
LAB_14021b100:
    if (puVar17 != puVar1) {
      uVar15 = *puVar17;
      puVar17 = puVar17 + 1;
      lVar3 = *(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + (ulong)uVar15 * 0x48);
      if (lVar3 != 0) {
        lVar4 = *(long *)(*(long *)(lVar7 + 0x1a8) + (ulong)uVar15 * 0x48 + 8);
        uVar9 = 0;
        do {
          while( true ) {
            uVar8 = uVar9 & 0xffffffff;
            uVar15 = (int)uVar9 + 1;
            uVar9 = (ulong)uVar15;
            lVar2 = *(long *)(lVar4 + uVar8 * 8);
            uVar19 = (uint)lVar3;
            if ((int)lVar2 == 0) break;
            local_3c0 = (undefined8 **)local_120;
            if (lVar16 != 0) {
              local_3c0 = (undefined8 **)lVar12;
            }
            local_3e8 = lVar2;
            uStack_3e0 = lVar20;
            local_3d8 = ppuVar14;
            local_3d0 = (undefined8 *)lVar16;
            local_3c8 = (undefined4 *)lVar18;
            local_120 = (long)local_3c0;
            local_e8 = lVar16;
            local_e0 = lVar12;
            local_a0 = ppuVar14;
            local_90 = lVar20;
            local_80 = lVar18;
            func_0x000144e74f30();
            ppuVar14 = local_a0;
            lVar18 = local_80;
            lVar20 = local_90;
            lVar16 = local_e8;
            lVar12 = local_e0;
            if ((uint)uVar9 == uVar19) goto LAB_14021b100;
          }
        } while (uVar15 != uVar19);
      }
      goto LAB_14021b100;
    }
  }
  else if (lVar16 == 0) {
LAB_14021b320:
    if (puVar17 != puVar1) {
      uVar15 = *puVar17;
      puVar17 = puVar17 + 1;
      lVar12 = *(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar15 * 0xa0);
      if (lVar12 != 0) {
        lVar16 = *(long *)(*(long *)(lVar7 + 0x108) + (ulong)uVar15 * 0xa0 + 0x50);
        uVar15 = 0;
        do {
          while( true ) {
            uVar9 = (ulong)uVar15;
            uVar15 = uVar15 + 1;
            lVar3 = *(long *)(lVar16 + uVar9 * 0x10);
            uVar19 = (uint)lVar12;
            if ((int)lVar3 == 0) break;
            local_3d0 = (undefined8 *)0x0;
            local_3e8 = lVar3;
            uStack_3e0 = lVar20;
            local_3d8 = ppuVar14;
            local_3c8 = (undefined4 *)lVar18;
            local_a0 = ppuVar14;
            local_90 = lVar20;
            local_80 = lVar18;
            func_0x000144e74f30();
            ppuVar14 = local_a0;
            lVar18 = local_80;
            lVar20 = local_90;
            if (uVar15 == uVar19) goto LAB_14021b320;
          }
        } while (uVar15 != uVar19);
      }
      goto LAB_14021b320;
    }
  }
  else {
LAB_14021b220:
    if (puVar17 != puVar1) {
      uVar15 = *puVar17;
      puVar17 = puVar17 + 1;
      lVar3 = *(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar15 * 0xa0);
      if (lVar3 != 0) {
        lVar4 = *(long *)(*(long *)(lVar7 + 0x108) + (ulong)uVar15 * 0xa0 + 0x50);
        uVar9 = 0;
        do {
          while( true ) {
            uVar8 = uVar9 & 0xffffffff;
            uVar15 = (int)uVar9 + 1;
            uVar9 = (ulong)uVar15;
            lVar2 = *(long *)(lVar4 + uVar8 * 0x10);
            uVar19 = (uint)lVar3;
            if ((int)lVar2 == 0) break;
            local_3e8 = lVar2;
            uStack_3e0 = lVar20;
            local_3d8 = ppuVar14;
            local_3d0 = (undefined8 *)lVar16;
            local_3c8 = (undefined4 *)lVar18;
            local_3c0 = (undefined8 **)lVar12;
            local_e8 = lVar16;
            local_e0 = lVar12;
            local_a0 = ppuVar14;
            local_90 = lVar20;
            local_80 = lVar18;
            func_0x000144e74f30();
            ppuVar14 = local_a0;
            lVar18 = local_80;
            lVar20 = local_90;
            lVar16 = local_e8;
            lVar12 = local_e0;
            if ((uint)uVar9 == uVar19) goto LAB_14021b220;
          }
        } while (uVar15 != uVar19);
      }
      goto LAB_14021b220;
    }
  }
  if (*(char *)(local_98 + 0x80) == -1) {
    *(undefined4 *)local_78 = local_70._0_4_;
    puVar6[3] = 0;
    return;
  }
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if (*pcVar10 == '\x04') {
    func_0x0001401b4d40();
    local_a8 = local_3d8;
    local_b8 = local_3e8;
    lStack_b0 = uStack_3e0;
  }
  else {
    local_b8 = 0;
    lStack_b0 = 8;
    local_a8 = (undefined8 **)0x0;
  }
  pcVar10 = (char *)func_0x000142affbe0();
  ppuVar14 = local_a8;
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if (*pcVar10 == '\x03') {
    plVar21 = *(long **)(pcVar10 + 0x10);
    local_98 = *(long *)(pcVar10 + 0x18);
  }
  else {
    plVar21 = (long *)0x14594c992;
    local_98 = 7;
  }
  *(undefined4 *)local_78 = local_70._0_4_;
  puVar6[3] = local_a8;
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
    uVar13 = *(undefined8 *)(pcVar10 + 0x10);
  }
  else {
    uVar13 = 0;
  }
  puVar6[4] = uVar13;
  *(undefined4 *)local_78 = local_70._0_4_;
  *(undefined1 *)(puVar6 + 9) = 1;
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  uVar13 = 0xffffffffffffffff;
  if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
    uVar13 = *(undefined8 *)(pcVar10 + 0x10);
  }
  *(undefined4 *)local_78 = local_70._0_4_;
  puVar6[5] = uVar13;
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
    uVar13 = *(undefined8 *)(pcVar10 + 0x10);
  }
  else {
    uVar13 = 0;
  }
  *(undefined4 *)local_78 = local_70._0_4_;
  puVar6[6] = uVar13;
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
    uVar13 = *(undefined8 *)(pcVar10 + 0x10);
  }
  else {
    uVar13 = 0;
  }
  *(undefined4 *)local_78 = local_70._0_4_;
  puVar6[7] = uVar13;
  pcVar10 = (char *)func_0x000142affbe0();
  if (pcVar10 == (char *)0x0) {
    pcVar10 = _DAT_147a0d7b8;
  }
  if ((*pcVar10 == '\x01') && (pcVar10[1] == '\x01')) {
    pcVar10 = (char *)func_0x000142affbe0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_147a0d7b8;
    }
    if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
      local_128 = *(undefined8 *)(pcVar10 + 0x10);
    }
    else {
      local_128 = 0;
    }
    local_130 = 1;
    pcVar10 = _DAT_147a0d7b8;
    lVar12 = lStack_b0;
  }
  else {
    local_130 = 0;
    pcVar10 = _DAT_147a0d7b8;
    lVar12 = lStack_b0;
  }
  _DAT_147a0d7b8 = pcVar10;
  lStack_b0 = lVar12;
  if (ppuVar14 != (undefined8 **)0x0) {
    lVar20 = (long)ppuVar14 * 0x20 + lVar12;
    do {
      pcVar11 = (char *)func_0x000142affbe0();
      if (pcVar11 == (char *)0x0) {
        pcVar11 = pcVar10;
      }
      if ((*pcVar11 == '\x01') && (pcVar11[1] != '\0')) {
        local_81 = 1;
        goto LAB_14021b6e3;
      }
      lVar12 = lVar12 + 0x20;
    } while (lVar12 != lVar20);
  }
  local_81 = 0;
LAB_14021b6e3:
  *(undefined4 *)local_78 = local_70._0_4_;
  *(float *)((long)puVar6 + 0x44) = fVar22;
  if (local_98 == 8) {
    if (*plVar21 == 0x6e61696472617567) {
      local_d8 = 0;
      lVar12 = *plVar21;
      uStack_d4 = _DAT_14594b4a0;
      uStack_d0 = uRam000000014594b4a4;
      uStack_cc = uRam000000014594b4a8;
      local_c8 = uRam000000014594b4ac;
    }
    else {
      local_c8 = 0x3f800000;
      lVar12 = *plVar21;
      uStack_d4 = uRam000000014594c6f4;
      uStack_d0 = uRam000000014594c6f8;
      uStack_cc = uRam000000014594c6fc;
      local_d8 = _DAT_14594c6f0;
    }
    if (lVar12 != 0x6e61696472617567) goto LAB_14021b840;
    func_0x000145457c00();
    local_78 = (undefined8 **)extraout_RDX_01;
    if ((long)extraout_RDX_01 < 0) {
LAB_14021be6c:
      func_0x00014590379b();
      goto LAB_14021c07e;
    }
    if (extraout_RDX_01 == (undefined8 *)0x0) {
      local_90 = 1;
    }
    else {
      func_0x000140002200();
      lVar12 = func_0x0001400021c0(1);
      if (lVar12 == 0) goto LAB_14021be6c;
      local_90 = lVar12;
      func_0x0001457731ed();
    }
    func_0x000145457c00();
    if (extraout_RDX_03 < 0) {
LAB_14021bfb5:
      func_0x00014590379b();
      goto LAB_14021c07e;
    }
    local_70 = (undefined8 **)extraout_RDX_03;
    if (extraout_RDX_03 == 0) {
      local_80 = 1;
    }
    else {
      func_0x000140002200();
      lVar12 = func_0x0001400021c0(1);
      if (lVar12 == 0) goto LAB_14021bfb5;
      local_80 = lVar12;
      func_0x0001457731ed();
    }
    local_140 = func_0x000145457c00();
    local_f0 = local_78;
    local_100 = local_78;
    local_f8 = local_90;
  }
  else {
    if (local_98 == 5) {
      if (*(char *)((long)plVar21 + 4) == 'e' && (int)*plVar21 == 0x68636163) {
        uStack_d4 = _DAT_14594b4b0;
        uStack_d0 = uRam000000014594b4b4;
        uStack_cc = uRam000000014594b4b8;
        local_c8 = uRam000000014594b4bc;
        local_d8 = 0;
      }
      else {
        local_d8 = _DAT_14594c6f0;
        uStack_d4 = uRam000000014594c6f4;
        uStack_d0 = uRam000000014594c6f8;
        uStack_cc = uRam000000014594c6fc;
        local_c8 = 0x3f800000;
      }
      if (*(char *)((long)plVar21 + 4) == 'e' && (int)*plVar21 == 0x68636163) {
        func_0x000145457c00();
        local_78 = (undefined8 **)extraout_RDX;
        if ((long)extraout_RDX < 0) {
LAB_14021b80e:
          func_0x00014590379b();
          goto LAB_14021c07e;
        }
        if (extraout_RDX == (undefined8 *)0x0) {
          local_90 = 1;
        }
        else {
          func_0x000140002200();
          lVar12 = func_0x0001400021c0(1);
          if (lVar12 == 0) goto LAB_14021b80e;
          local_90 = lVar12;
          func_0x0001457731ed();
        }
        func_0x000145457c00();
        if (extraout_RDX_02 < 0) {
LAB_14021bf33:
          func_0x00014590379b();
          goto LAB_14021c07e;
        }
        local_70 = (undefined8 **)extraout_RDX_02;
        if (extraout_RDX_02 == 0) {
          local_80 = 1;
        }
        else {
          func_0x000140002200();
          lVar12 = func_0x0001400021c0(1);
          if (lVar12 == 0) goto LAB_14021bf33;
          local_80 = lVar12;
          func_0x0001457731ed();
        }
        local_140 = func_0x000145457c00();
        local_f0 = local_78;
        local_100 = local_78;
        local_f8 = local_90;
        goto LAB_14021b983;
      }
    }
    else {
      local_d8 = _DAT_14594c6f0;
      uStack_d4 = uRam000000014594c6f4;
      uStack_d0 = uRam000000014594c6f8;
      uStack_cc = uRam000000014594c6fc;
      local_c8 = 0x3f800000;
    }
LAB_14021b840:
    uVar13 = func_0x000145457c00();
    pcVar10 = (char *)func_0x000142affbe0(uVar13);
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_147a0d7b8;
    }
    local_100 = (undefined8 *)0x1;
    if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
      local_100 = *(undefined8 **)(pcVar10 + 0x10);
    }
    local_3e8 = 0x14594c6d8;
    uStack_3e0 = 1;
    local_3d8 = &local_100;
    local_3d0 = (undefined8 *)0x14594c6b8;
    func_0x000145458060();
    func_0x000145457c00();
    if (extraout_RDX_00 < 0) {
LAB_14021b906:
      func_0x00014590379b();
      goto LAB_14021c07e;
    }
    local_70 = (undefined8 **)extraout_RDX_00;
    if (extraout_RDX_00 == 0) {
      local_80 = 1;
    }
    else {
      func_0x000140002200();
      lVar12 = func_0x0001400021c0(1);
      if (lVar12 == 0) goto LAB_14021b906;
      local_80 = lVar12;
      func_0x0001457731ed();
    }
    local_140 = func_0x000145457c00();
    local_f0 = local_558;
    local_100 = local_568;
    local_f8 = lStack_560;
  }
LAB_14021b983:
  local_404 = 0;
  local_414 = 1;
  local_500 = 0;
  uStack_4f8 = 0;
  local_4f0 = 0;
  uStack_4e8 = 0;
  local_4e0 = _DAT_145913130;
  uStack_4dc = uRam0000000145913134;
  uStack_4d8 = uRam0000000145913138;
  uStack_4d4 = uRam000000014591313c;
  local_508 = 0;
  local_4d0 = 0;
  uStack_4c8 = 0;
  local_4c0 = 0;
  uStack_4b8 = 0;
  local_3f0 = 0;
  local_3ec = 0;
  local_4b0 = _DAT_14594c058;
  uStack_4a8 = uRam000000014594c060;
  local_4a0 = _DAT_14594c068;
  uStack_498 = uRam000000014594c070;
  local_490 = _DAT_14594c078;
  uStack_488 = uRam000000014594c080;
  local_480 = _DAT_14594c088;
  uStack_478 = uRam000000014594c090;
  local_460 = _DAT_14594c0a8;
  uStack_458 = uRam000000014594c0b0;
  local_470 = _DAT_14594c098;
  uStack_468 = uRam000000014594c0a0;
  local_440 = _DAT_14594c0c8;
  uStack_438 = uRam000000014594c0d0;
  local_450 = _DAT_14594c0b8;
  uStack_448 = uRam000000014594c0c0;
  local_3f2 = 0;
  local_3f6 = 0x100;
  local_410 = 0;
  local_408 = 0x3f800000;
  local_430 = _DAT_1459074c0;
  uStack_428 = uRam00000001459074c8;
  local_420 = 1;
  local_41c = 0;
  local_3f1 = 0;
  local_568 = _DAT_14594bfa0;
  lStack_560 = lRam000000014594bfa8;
  local_558 = (undefined8 *)0x0;
  local_550 = _DAT_14594bfb8;
  uStack_548 = uRam000000014594bfc0;
  local_540 = 0;
  local_538 = _DAT_14594bfd0;
  uStack_530 = uRam000000014594bfd8;
  local_528 = 0;
  local_520 = _DAT_14594bfe8;
  uStack_51c = uRam000000014594bfec;
  uStack_518 = uRam000000014594bff0;
  uStack_514 = uRam000000014594bff4;
  local_510 = 0;
  local_3fe = 0;
  local_402 = 0x10000;
  local_3f8 = 0;
  local_3fc = 0x10000;
  func_0x000140002200();
  local_78 = (undefined8 **)func_0x0001400021c0();
  if (local_78 == (undefined8 **)0x0) {
    func_0x000145903781();
  }
  else {
    uStack_3e0 = CONCAT44(uRam000000014594b4c8,uRam000000014594b4c4);
    local_3d8._0_4_ = uRam000000014594b4cc;
    local_3e8 = (ulong)_DAT_14594b4c0 << 0x20;
    func_0x000144c8c290();
    uStack_3e0 = CONCAT44(uRam0000000145940298,uRam0000000145940294);
    local_3d8 = (undefined8 **)CONCAT44(local_3d8._4_4_,uRam000000014594029c);
    local_3e8 = (ulong)_DAT_145940290 << 0x20;
    uVar23 = local_118;
    uVar24 = uStack_114;
    uVar25 = uStack_110;
    uVar26 = uStack_10c;
    func_0x000144c8c290();
    *local_78 = (undefined8 *)0x2;
    *(undefined4 *)(local_78 + 1) = 1;
    *(undefined4 *)((long)local_78 + 0xc) = uVar23;
    *(undefined4 *)(local_78 + 2) = uVar24;
    *(undefined4 *)((long)local_78 + 0x14) = uVar25;
    *(undefined4 *)(local_78 + 3) = uVar26;
    uVar25 = uRam000000014594b4dc;
    uVar24 = uRam000000014594b4d8;
    uVar23 = uRam000000014594b4d4;
    *(undefined4 *)((long)local_78 + 0x1c) = _DAT_14594b4d0;
    *(undefined4 *)(local_78 + 4) = uVar23;
    *(undefined4 *)((long)local_78 + 0x24) = uVar24;
    *(undefined4 *)(local_78 + 5) = uVar25;
    *(undefined4 *)((long)local_78 + 0x2c) = local_118;
    *(undefined4 *)(local_78 + 6) = uStack_114;
    *(undefined4 *)((long)local_78 + 0x34) = uStack_110;
    *(undefined4 *)(local_78 + 7) = uStack_10c;
    *(undefined4 *)((long)local_78 + 0x3c) = 0x3f000000;
    ppuVar14 = local_78;
    func_0x000140002200();
    local_260 = (undefined8 *)func_0x0001400021c0();
    if (local_260 != (undefined8 *)0x0) {
      *local_260 = 2;
      local_260[1] = ppuVar14;
      local_260[2] = 2;
      local_260[3] = 1;
      *(undefined4 *)(local_260 + 4) = 2;
      *(ulong *)((long)local_260 + 0x24) = (ulong)_DAT_14593fc20;
      *(undefined8 *)((long)local_260 + 0x2c) = 0xa00000000;
      *(undefined1 *)(local_260 + 8) = 0;
      func_0x0001457731ed(&local_3e8,local_260,&local_568,&local_3e8,0x180);
      local_268 = 1;
      local_258 = 1;
      local_250 = 6000;
      local_24c = 2;
      local_61 = 0;
      func_0x0001400ed6c0();
      local_398 = &local_220;
      local_388 = &local_200;
      local_3a0 = &local_1c8;
      local_3d0 = &local_1a8;
      local_3c8 = &local_d8;
      local_3c0 = &local_100;
      local_3b8 = &local_588;
      local_3e8 = (long)local_70;
      uStack_3e0 = local_80;
      local_3d8 = local_70;
      local_3b0 = local_140;
      local_3a8 = &local_b8;
      local_390 = &local_81;
      local_378 = local_98;
      local_370 = &local_130;
      local_61 = 1;
      local_380 = plVar21;
      func_0x00014010cdf0();
      if (local_100 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
      local_78 = local_a8;
      local_70 = (undefined8 **)0x0;
      local_98 = lStack_b0;
      while (local_78 != local_70) {
        local_70 = (undefined8 **)((long)local_70 + 1);
        func_0x000140198520();
      }
      if (local_b8 != 0) {
        func_0x0001400021d0();
      }
      return;
    }
    func_0x000145903781();
  }
LAB_14021c07e:
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
