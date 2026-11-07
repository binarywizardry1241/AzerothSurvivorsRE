
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
          undefined8 *param_5,long *param_6)

{
  long *plVar1;
  undefined4 *puVar2;
  code *pcVar3;
  uint uVar4;
  ulong uVar5;
  ulong uVar6;
  uint *puVar7;
  ulong uVar8;
  undefined8 *puVar9;
  uint *puVar10;
  long lVar11;
  long extraout_RDX;
  long lVar12;
  uint *puVar13;
  undefined4 uVar14;
  ulong *puVar15;
  long lVar16;
  undefined7 uVar19;
  long lVar17;
  long lVar18;
  long lVar20;
  long *plVar21;
  uint uVar22;
  float fVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  float fVar30;
  undefined4 in_XMM6_Da;
  float fVar31;
  undefined4 in_XMM7_Da;
  float fVar32;
  float fVar33;
  undefined4 uVar34;
  undefined4 uVar35;
  float fVar36;
  undefined4 uVar37;
  undefined4 uVar38;
  undefined4 uVar39;
  undefined4 uVar40;
  undefined4 uVar41;
  undefined4 uVar42;
  undefined4 uVar43;
  undefined4 uVar44;
  undefined4 uVar45;
  undefined4 uVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  float fVar49;
  long *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  undefined4 local_308;
  undefined4 uStack_304;
  undefined4 uStack_300;
  undefined4 uStack_2fc;
  undefined4 uStack_2f8;
  undefined4 local_2f4;
  undefined4 local_2f0;
  undefined4 uStack_2ec;
  undefined4 uStack_2e8;
  undefined4 uStack_2e4;
  undefined4 local_2e0;
  undefined4 local_2dc;
  undefined4 uStack_2d8;
  undefined4 uStack_2d4;
  undefined4 uStack_2d0;
  undefined4 local_2cc;
  undefined4 local_2c8;
  undefined4 uStack_2c4;
  undefined4 uStack_2c0;
  undefined4 uStack_2bc;
  undefined4 local_2b8;
  undefined4 uStack_2b4;
  undefined4 uStack_2b0;
  undefined4 uStack_2ac;
  undefined4 uStack_2a8;
  undefined4 auStack_2a4 [2];
  undefined4 local_29c;
  long local_298;
  long local_288;
  undefined4 local_27c;
  long local_278;
  long local_270;
  long local_260;
  undefined4 local_254;
  uint local_250;
  uint local_24c;
  byte local_248;
  uint *local_240;
  undefined8 local_238;
  undefined8 uStack_230;
  float fStack_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined4 uStack_218;
  undefined4 local_214;
  undefined4 *local_210;
  undefined4 *puStack_208;
  undefined4 local_200;
  undefined4 local_1fc;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 uStack_1f0;
  undefined4 local_1ec;
  long local_1e8;
  long local_1e0;
  long local_1d8;
  undefined4 local_1cc;
  undefined4 local_1c8;
  undefined4 local_1c4;
  undefined4 local_1c0;
  undefined4 local_1bc;
  long local_1b8;
  long local_1b0;
  long local_1a8;
  long local_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined4 *local_180;
  undefined4 *local_178;
  long local_170;
  long local_168;
  long local_160;
  long local_158;
  long local_150;
  long local_148;
  long local_140;
  long local_138;
  long *local_130;
  undefined4 local_128;
  uint local_124;
  undefined8 *local_120;
  int *local_118;
  undefined4 *local_110;
  long *local_108;
  long local_100;
  byte local_f1;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  local_f0 = 0xfffffffffffffffe;
  local_118 = (int *)*param_5;
  plVar21 = (long *)*param_6;
  lVar12 = param_6[1];
  local_1b0 = *in_stack_00000028;
  local_1e8 = in_stack_00000028[1];
  local_1bc = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  local_1a0 = *in_stack_00000030;
  local_1b8 = in_stack_00000030[1];
  local_128 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  fVar32 = *(float *)(*param_3 + 0x58);
  fVar31 = *(float *)(*param_3 + 0x5c);
  local_1a8 = *in_stack_00000038;
  local_1d8 = in_stack_00000038[1];
  local_124 = *(uint *)((long)in_stack_00000038 + 0x14);
  fVar36 = fVar31 - (float)local_118[0x11];
  uVar8 = (ulong)*(uint *)(param_6 + 2);
  local_130 = plVar21;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  func_0x000140392550(*(undefined4 *)((long)param_6 + 0x14),local_118,lVar12,&local_308);
  puVar10 = (uint *)CONCAT44(uStack_304,local_308);
  local_240 = (uint *)CONCAT44(uStack_2fc,uStack_300);
  local_1e0 = CONCAT44(uStack_2e4,uStack_2e8);
  local_170 = CONCAT44(uStack_2d4,uStack_2d8);
  local_168 = CONCAT44(uStack_2c4,local_2c8);
  local_1cc = uStack_2bc;
  local_160 = CONCAT44(uStack_2b4,local_2b8);
  local_158 = CONCAT44(auStack_2a4[0],uStack_2a8);
  local_1c8 = local_29c;
  local_150 = local_298;
  local_148 = local_288;
  local_1c4 = local_27c;
  fVar33 = fVar32 * _DAT_1458fcde4;
  if (_DAT_1458eb480 <= fVar32 * _DAT_1458fcde4) {
    fVar33 = _DAT_1458eb480;
  }
  local_100 = local_278;
  local_f1 = local_248;
  local_140 = local_270;
  local_138 = local_260;
  local_1c0 = local_254;
  uVar5 = (ulong)local_250;
  fVar32 = _DAT_1458f8f44;
  uVar24 = _DAT_1458fce20;
  uVar25 = uRam00000001458fce24;
  uVar34 = uRam00000001458fce28;
  uVar35 = uRam00000001458fce2c;
  fVar49 = _DAT_1458eb480;
  uVar37 = _DAT_1458fcae0;
  uVar38 = uRam00000001458fcae4;
  uVar39 = uRam00000001458fcae8;
  uVar40 = uRam00000001458fcaec;
  uVar41 = _DAT_1458fce10;
  uVar42 = uRam00000001458fce14;
  uVar43 = uRam00000001458fce18;
  uVar44 = uRam00000001458fce1c;
  uVar22 = local_24c;
  do {
    if ((local_f1 & 1) == 0) {
      if (uVar22 == (uint)uVar5) {
        do {
          if (puVar10 == local_240) goto LAB_1400d98a6;
          uVar22 = *puVar10;
          puVar10 = puVar10 + 1;
          uVar5 = *(ulong *)(*(long *)(lVar12 + 0x108) + 0x58 + (ulong)uVar22 * 0xa0);
        } while (uVar5 == 0);
        lVar16 = *(long *)(lVar12 + 0x108) + (ulong)uVar22 * 0xa0;
        uVar8 = (ulong)*(uint *)(lVar16 + 0x94);
        lVar11 = *(long *)(lVar12 + 0x1a8);
        lVar18 = *(long *)(lVar11 + 0x18 + uVar8 * 0x48);
        lVar20 = *(long *)(lVar11 + 0x38 + uVar8 * 0x48);
        lVar17 = ~*(ulong *)(lVar20 + local_130[0x22] * 8) * 0x30;
        if (((ulong)local_130[0x23] < *(ulong *)(lVar11 + 0x40 + uVar8 * 0x48)) &&
           (uVar8 = *(ulong *)(lVar20 + local_130[0x23] * 8), uVar8 != 0)) {
          local_100 = *(long *)(lVar18 + 0x10 + ~uVar8 * 0x30);
        }
        else {
          local_100 = 0;
        }
        local_170 = *(long *)(lVar18 + 0x10 + lVar17);
        local_168 = *(long *)(lVar18 + 0x28 + lVar17);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x24] * 8) * 0x30;
        local_160 = *(long *)(lVar18 + 0x10 + lVar11);
        local_158 = *(long *)(lVar18 + 0x28 + lVar11);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x25] * 8) * 0x30;
        local_150 = *(long *)(lVar18 + 0x10 + lVar11);
        local_148 = *(long *)(lVar18 + 0x28 + lVar11);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x26] * 8) * 0x30;
        local_140 = *(long *)(lVar18 + 0x10 + lVar11);
        local_138 = *(long *)(lVar18 + 0x28 + lVar11);
        local_1e0 = *(long *)(lVar16 + 0x50);
        uVar22 = 0;
      }
      uVar4 = ~*(uint *)(local_1e0 + 8 + (ulong)uVar22 * 0x10);
    }
    else {
      uVar4 = uVar22;
      if (uVar22 == (uint)uVar5) {
        do {
          if (puVar10 == local_240) goto LAB_1400d98a6;
          uVar22 = *puVar10;
          puVar10 = puVar10 + 1;
          uVar5 = *(ulong *)(*(long *)(lVar12 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48);
        } while (uVar5 == 0);
        lVar11 = *(long *)(lVar12 + 0x1a8) + (ulong)uVar22 * 0x48;
        lVar18 = *(long *)(lVar11 + 0x18);
        lVar20 = *(long *)(lVar11 + 0x38);
        if (((ulong)local_130[0x23] < *(ulong *)(lVar11 + 0x40)) &&
           (uVar8 = *(ulong *)(lVar20 + local_130[0x23] * 8), uVar8 != 0)) {
          local_100 = *(long *)(lVar18 + 0x10 + ~uVar8 * 0x30);
        }
        else {
          local_100 = 0;
        }
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x22] * 8) * 0x30;
        local_170 = *(long *)(lVar18 + 0x10 + lVar11);
        local_168 = *(long *)(lVar18 + 0x28 + lVar11);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x24] * 8) * 0x30;
        local_160 = *(long *)(lVar18 + 0x10 + lVar11);
        local_158 = *(long *)(lVar18 + 0x28 + lVar11);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x25] * 8) * 0x30;
        local_150 = *(long *)(lVar18 + 0x10 + lVar11);
        local_148 = *(long *)(lVar18 + 0x28 + lVar11);
        lVar11 = ~*(ulong *)(lVar20 + local_130[0x26] * 8) * 0x30;
        local_140 = *(long *)(lVar18 + 0x10 + lVar11);
        local_138 = *(long *)(lVar18 + 0x28 + lVar11);
        uVar22 = 0;
        uVar4 = uVar22;
      }
    }
    uVar6 = (ulong)uVar4;
    plVar21 = (long *)(uVar6 * 0x38 + local_170);
    local_110 = (undefined4 *)(local_148 + uVar6 * 4);
    local_178 = (undefined4 *)(local_138 + uVar6 * 4);
    puVar9 = (undefined8 *)(uVar6 * 0x20 + local_160);
    local_108 = (long *)(local_150 + uVar6 * 0x18);
    local_180 = (undefined4 *)(uVar6 * 0x50 + local_140);
    fVar23 = (fVar36 - *(float *)(plVar21 + 6)) / fVar32;
    fVar26 = 0.0;
    fVar29 = 0.0;
    if (0.0 <= fVar23) {
      fVar29 = fVar23;
    }
    fVar23 = fVar49;
    if (fVar29 <= fVar49) {
      fVar23 = fVar29;
    }
    if (0.0 < fVar23) {
      fVar29 = fVar23 + _DAT_1458eb4fc;
      fVar26 = fVar29 * fVar29 * _DAT_1458f8d40 + fVar29 * fVar29 * fVar29 * _DAT_1458fcde8 + fVar49
      ;
    }
    uVar19 = (undefined7)((ulong)local_108 >> 8);
    if (*local_118 == 1) {
      uVar8 = CONCAT71(uVar19,*(long *)(local_118 + 2) == *plVar21);
      fVar29 = 0.0;
    }
    else {
      uVar8 = CONCAT71(uVar19,2);
      fVar29 = 0.0;
      if ((fVar49 <= fVar23) && (*(char *)(local_100 + uVar6) != '\x02')) {
        fVar29 = fVar49;
      }
    }
    fVar23 = *(float *)((long)plVar21 + 0x34);
    *(undefined4 *)(local_168 + uVar6 * 4) = local_1cc;
    fVar23 = (fVar29 - fVar23) * fVar33 + *(float *)((long)plVar21 + 0x34);
    *(float *)((long)plVar21 + 0x34) = fVar23;
    fVar29 = 0.0;
    if (0.0 <= fVar26) {
      fVar29 = fVar26;
    }
    fVar28 = _DAT_1458fcdec;
    if (fVar29 <= _DAT_1458fcdec) {
      fVar28 = fVar29;
    }
    fVar27 = fVar23 * _DAT_1458fcdf8 + fVar49;
    fVar28 = fVar27 * fVar28;
    fVar27 = fVar27 * (fVar26 * _DAT_1458eb528 + _DAT_1458fcdf0);
    fVar29 = fVar23 * _DAT_1458fcdfc + (fVar49 - fVar26) * _DAT_1458fcdf4;
    if (((char)uVar8 != '\x02') && ((char)local_118[4] != '\0')) {
      fVar26 = (fVar31 - (float)local_118[5]) / _DAT_1458fcd80;
      fVar23 = 0.0;
      if (0.0 <= fVar26) {
        fVar23 = fVar26;
      }
      fVar26 = fVar49;
      if (fVar23 <= fVar49) {
        fVar26 = fVar23;
      }
      fVar23 = _DAT_1458f6680;
      fVar30 = _DAT_1458fce00;
      if ((uVar8 & 1) != 0) {
        fVar23 = _DAT_1458fce04;
        fVar30 = _DAT_1458f6620;
      }
      fVar30 = fVar26 * fVar30 + fVar49;
      fVar27 = fVar27 * fVar30;
      fVar28 = fVar28 * fVar30;
      fVar29 = fVar29 + fVar26 * fVar23;
    }
    puVar9[2] = CONCAT44(fVar27,fVar28);
    *(undefined4 *)(local_158 + uVar6 * 4) = local_1c8;
    *puVar9 = 1;
    *(undefined4 *)(puVar9 + 1) = 1;
    *(float *)((long)puVar9 + 0xc) = fVar29;
    fVar29 = *(float *)((long)plVar21 + 0x34);
    fVar23 = 0.0;
    if ((uVar8 & 1) != 0) {
      fVar23 = fVar49;
    }
    func_0x000140002200();
    puVar9 = (undefined8 *)func_0x0001400021c0();
    if (puVar9 == (undefined8 *)0x0) {
      func_0x0001458e7201();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    uStack_230 = (undefined4 *)CONCAT44(uRam00000001458fca38,uRam00000001458fca34);
    fStack_228 = (float)uRam00000001458fca3c;
    local_238 = (undefined4 *)((ulong)_DAT_1458fca30 << 0x20);
    local_120 = puVar9;
    func_0x000144c79aa0();
    if (fVar29 <= fVar23) {
      fVar29 = fVar23;
    }
    fStack_228 = fVar29 * fVar32;
    local_238 = (undefined4 *)plVar21[1];
    uStack_230 = (undefined4 *)plVar21[2];
    uVar45 = (undefined4)local_198;
    uVar46 = local_198._4_4_;
    uVar47 = (undefined4)uStack_190;
    uVar48 = uStack_190._4_4_;
    func_0x000144c79aa0();
    plVar1 = local_108;
    puVar9 = local_120;
    fVar29 = fVar29 * _DAT_1458fc8ac + _DAT_1458f8f90;
    *local_120 = 1;
    *(undefined4 *)(local_120 + 1) = 1;
    *(float *)((long)local_120 + 0xc) = fVar29;
    *(undefined4 *)(local_120 + 2) = uVar41;
    *(undefined4 *)((long)local_120 + 0x14) = uVar42;
    *(undefined4 *)(local_120 + 3) = uVar43;
    *(undefined4 *)((long)local_120 + 0x1c) = uVar44;
    *(undefined4 *)(local_120 + 4) = 1;
    *(undefined4 *)((long)local_120 + 0x24) = uVar45;
    *(undefined4 *)(local_120 + 5) = uVar46;
    *(undefined4 *)((long)local_120 + 0x2c) = uVar47;
    *(undefined4 *)(local_120 + 6) = uVar48;
    *(undefined4 *)((long)local_120 + 0x34) = uVar37;
    *(undefined4 *)(local_120 + 7) = uVar38;
    *(undefined4 *)((long)local_120 + 0x3c) = uVar39;
    *(undefined4 *)(local_120 + 8) = uVar40;
    *(undefined4 *)((long)local_120 + 0x44) = uVar24;
    *(undefined4 *)(local_120 + 9) = uVar25;
    *(undefined4 *)((long)local_120 + 0x4c) = uVar34;
    *(undefined4 *)(local_120 + 10) = uVar35;
    *(undefined4 *)((long)local_120 + 0x54) = 1;
    *(undefined4 *)(local_120 + 0xb) = (undefined4)local_198;
    *(undefined4 *)((long)local_120 + 0x5c) = local_198._4_4_;
    *(undefined4 *)(local_120 + 0xc) = (undefined4)uStack_190;
    *(undefined4 *)((long)local_120 + 100) = uStack_190._4_4_;
    *local_110 = local_1c4;
    if (*local_108 != 0) {
      func_0x0001400021d0();
    }
    uVar22 = uVar22 + 1;
    plVar21 = plVar21 + 1;
    *plVar1 = 2;
    plVar1[1] = (long)puVar9;
    plVar1[2] = 2;
    func_0x000144c80a50();
    fStack_228 = (float)(undefined4)local_188;
    local_238 = local_198;
    uStack_230 = uStack_190;
    local_214 = (undefined4)local_188;
    uStack_224 = SUB84(local_198,0);
    uStack_220 = (undefined4)((ulong)local_198 >> 0x20);
    uStack_21c = SUB84(uStack_190,0);
    uStack_218 = (undefined4)((ulong)uStack_190 >> 0x20);
    local_200 = (undefined4)local_188;
    local_210 = local_198;
    puStack_208 = uStack_190;
    local_1ec = (undefined4)local_188;
    *local_178 = local_1c0;
    *(ulong *)(local_180 + 0x10) = CONCAT44(uStack_21c,uStack_220);
    *(ulong *)(local_180 + 0x12) = CONCAT44((undefined4)local_188,uStack_218);
    *(undefined4 **)(local_180 + 0xc) = uStack_190;
    *(ulong *)(local_180 + 0xe) = CONCAT44(uStack_224,(undefined4)local_188);
    *(ulong *)(local_180 + 8) = CONCAT44((undefined4)local_188,uStack_218);
    *(undefined4 **)(local_180 + 10) = local_198;
    *(ulong *)(local_180 + 4) = CONCAT44(uStack_224,(undefined4)local_188);
    *(ulong *)(local_180 + 6) = CONCAT44(uStack_21c,uStack_220);
    *local_180 = uStack_224;
    local_180[1] = uStack_220;
    local_180[2] = uStack_21c;
    local_180[3] = uStack_218;
    local_1fc = uStack_224;
    uStack_1f8 = uStack_220;
    uStack_1f4 = uStack_21c;
    uStack_1f0 = uStack_218;
  } while( true );
LAB_1400d98a6:
  puVar7 = *(uint **)(local_1b0 + 0xf8);
  puVar10 = puVar7 + *(long *)(local_1b0 + 0x100);
  local_178 = (undefined4 *)CONCAT71(local_178._1_7_,*(undefined1 *)(local_1b0 + 0x108));
  fVar32 = _DAT_1458fce30 * fVar31;
  lVar12 = 0;
  local_120 = (undefined8 *)0x8;
  local_108 = (long *)0x0;
  uVar5 = 0;
  uVar24 = _DAT_1458fca50;
  uVar25 = uRam00000001458fca54;
  uVar34 = uRam00000001458fca58;
  uVar35 = uRam00000001458fca5c;
  uVar37 = _DAT_1458fca60;
  uVar38 = uRam00000001458fca64;
  uVar39 = uRam00000001458fca68;
  uVar40 = uRam00000001458fca6c;
  uVar41 = _DAT_1458fca70;
  uVar42 = uRam00000001458fca74;
  uVar43 = uRam00000001458fca78;
  uVar44 = uRam00000001458fca7c;
  uVar45 = _DAT_1458fca80;
  uVar46 = uRam00000001458fca84;
  uVar47 = uRam00000001458fca88;
  uVar48 = uRam00000001458fca8c;
  do {
    uVar6 = uVar5;
    if ((char)local_178 == '\0') {
      if ((int)uVar5 == (int)lVar12) {
        do {
          if (puVar7 == puVar10) goto LAB_1400d9c49;
          uVar22 = *puVar7;
          puVar7 = puVar7 + 1;
          lVar12 = *(long *)(*(long *)(local_1e8 + 0x108) + 0x58 + (ulong)uVar22 * 0xa0);
        } while (lVar12 == 0);
        lVar11 = *(long *)(local_1e8 + 0x108) + (ulong)uVar22 * 0xa0;
        uVar5 = (ulong)*(uint *)(lVar11 + 0x94);
        plVar21 = *(long **)(local_1b0 + 0x110);
        uVar8 = *(ulong *)(*(long *)(local_1e8 + 0x1a8) + 0x18 + uVar5 * 0x48);
        lVar18 = ~*(ulong *)(*(long *)(*(long *)(local_1e8 + 0x1a8) + 0x38 + uVar5 * 0x48) +
                            (long)plVar21 * 8) * 0x30;
        local_108 = *(long **)(uVar8 + 0x10 + lVar18);
        local_110 = *(undefined4 **)(uVar8 + 0x28 + lVar18);
        local_120 = *(undefined8 **)(lVar11 + 0x50);
        uVar6 = 0;
      }
      uVar5 = (ulong)~*(uint *)((long)local_120 + 8 + uVar6 * 0x10);
    }
    else if ((int)uVar5 == (int)lVar12) {
      do {
        if (puVar7 == puVar10) goto LAB_1400d9c49;
        uVar22 = *puVar7;
        puVar7 = puVar7 + 1;
        lVar12 = *(long *)(*(long *)(local_1e8 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48);
      } while (lVar12 == 0);
      lVar11 = *(long *)(local_1e8 + 0x1a8) + (ulong)uVar22 * 0x48;
      lVar18 = *(long *)(lVar11 + 0x18);
      lVar11 = ~*(ulong *)(*(long *)(lVar11 + 0x38) + *(long *)(local_1b0 + 0x110) * 8) * 0x30;
      local_108 = *(long **)(lVar18 + 0x10 + lVar11);
      local_110 = *(undefined4 **)(lVar18 + 0x28 + lVar11);
      uVar5 = 0;
      uVar6 = uVar5;
    }
    uVar14 = (undefined4)uVar6;
    plVar1 = (long *)((long)local_108 + uVar5 * 0x18);
    puVar2 = local_110 + uVar5;
    local_308 = 0;
    local_2f4 = 0;
    local_2e0 = 0;
    local_2cc = 0;
    local_2b8 = 0;
    local_198 = &local_308;
    uStack_190 = auStack_2a4;
    local_188 = 0;
    uStack_304 = uVar24;
    uStack_300 = uVar25;
    uStack_2fc = uVar34;
    uStack_2f8 = uVar35;
    local_2f0 = uVar37;
    uStack_2ec = uVar38;
    uStack_2e8 = uVar39;
    uStack_2e4 = uVar40;
    local_2dc = uVar41;
    uStack_2d8 = uVar42;
    uStack_2d4 = uVar43;
    uStack_2d0 = uVar44;
    local_2c8 = uVar45;
    uStack_2c4 = uVar46;
    uStack_2c0 = uVar47;
    uStack_2bc = uVar48;
    uStack_2b4 = uVar24;
    uStack_2b0 = uVar25;
    uStack_2ac = uVar34;
    uStack_2a8 = uVar35;
    func_0x00014010a9f0();
    uStack_220 = _DAT_1458fdff4;
    uStack_21c = uRam00000001458fdff8;
    uStack_218 = uRam00000001458fdffc;
    local_214 = uRam00000001458fe000;
    local_210 = (undefined4 *)0x0;
    puStack_208 = (undefined4 *)
                  (CONCAT44((int)((ulong)puStack_208 >> 0x20),fVar32) & 0xffffff00ffffffff);
    func_0x000140002200();
    puVar9 = (undefined8 *)func_0x0001400021c0();
    if (puVar9 == (undefined8 *)0x0) {
      func_0x0001458e7201();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    local_180 = (undefined4 *)CONCAT44(local_180._4_4_,uVar14);
    puVar9[7] = puStack_208;
    puVar9[5] = CONCAT44(local_214,uStack_218);
    puVar9[6] = local_210;
    puVar9[3] = CONCAT44(uStack_224,fStack_228);
    puVar9[4] = CONCAT44(uStack_21c,uStack_220);
    *(undefined4 *)(puVar9 + 1) = (undefined4)local_238;
    *(undefined4 *)((long)puVar9 + 0xc) = local_238._4_4_;
    *(undefined4 *)(puVar9 + 2) = (undefined4)uStack_230;
    *(undefined4 *)((long)puVar9 + 0x14) = uStack_230._4_4_;
    *puVar9 = 0x8000000000000002;
    *puVar2 = local_1bc;
    lVar11 = plVar1[2];
    if (lVar11 != 0) {
      puVar15 = (ulong *)(plVar1[1] + 8);
      do {
        uVar5 = puVar15[-1];
        uVar6 = uVar5 ^ 0x8000000000000000;
        if (-1 < (long)uVar5) {
          uVar6 = 1;
        }
        if ((uVar6 == 0) || (uVar6 != 1)) {
          uVar5 = *puVar15;
        }
        if (uVar5 != 0) {
          plVar21 = (long *)0x4;
          func_0x0001400021d0();
        }
        puVar15 = puVar15 + 9;
        lVar11 = lVar11 + -1;
      } while (lVar11 != 0);
    }
    if (*plVar1 != 0) {
      plVar21 = (long *)0x8;
      func_0x0001400021d0();
    }
    uVar5 = (ulong)((int)local_180 + 1);
    *plVar1 = 1;
    plVar1[1] = (long)puVar9;
    plVar1[2] = 1;
  } while( true );
LAB_1400d9c49:
  fVar32 = (float)func_0x000145756e2b(_DAT_1458fce34 * fVar31);
  lVar12 = local_1a8;
  fVar32 = fVar32 * _DAT_1458fce38 + _DAT_1458eb480;
  puVar7 = *(uint **)(local_1a0 + 0xf8);
  puVar10 = puVar7 + *(long *)(local_1a0 + 0x100);
  if (*(char *)(local_1a0 + 0x108) == '\0') {
    lVar20 = 0;
    lVar18 = 8;
    lVar11 = 0;
    uVar5 = 0;
    do {
      if ((int)uVar5 == (int)lVar20) {
        do {
          if (puVar7 == puVar10) goto LAB_1400d9e09;
          uVar22 = *puVar7;
          puVar7 = puVar7 + 1;
          lVar20 = *(long *)(*(long *)(local_1b8 + 0x108) + 0x58 + (ulong)uVar22 * 0xa0);
        } while (lVar20 == 0);
        lVar16 = *(long *)(local_1b8 + 0x108) + (ulong)uVar22 * 0xa0;
        uVar8 = (ulong)*(uint *)(lVar16 + 0x94);
        lVar18 = *(long *)(*(long *)(local_1b8 + 0x1a8) + 0x18 + uVar8 * 0x48);
        lVar17 = ~*(ulong *)(*(long *)(*(long *)(local_1b8 + 0x1a8) + 0x38 + uVar8 * 0x48) +
                            *(long *)(local_1a0 + 0x110) * 8) * 0x30;
        lVar11 = *(long *)(lVar18 + 0x10 + lVar17);
        uVar8 = *(ulong *)(lVar18 + 0x28 + lVar17);
        lVar18 = *(long *)(lVar16 + 0x50);
        uVar5 = 0;
      }
      lVar16 = uVar5 * 0x10;
      uVar5 = (ulong)((int)uVar5 + 1);
      uVar6 = (ulong)~*(uint *)(lVar18 + 8 + lVar16);
      *(undefined4 *)(uVar8 + uVar6 * 4) = local_128;
      lVar16 = uVar6 * 0x20;
      *(float *)(lVar11 + 0x10 + lVar16) = fVar32;
      *(float *)(lVar11 + 0x14 + lVar16) = fVar32;
    } while( true );
  }
  lVar18 = 0;
  lVar11 = 0;
  uVar22 = 0;
  do {
    if (uVar22 == (uint)lVar18) {
      do {
        if (puVar7 == puVar10) {
LAB_1400d9e09:
          puVar13 = *(uint **)(local_1a8 + 0xf8);
          puVar7 = puVar13 + *(long *)(local_1a8 + 0x100);
          fVar31 = fVar31 * _DAT_1458f6620;
          uVar24 = func_0x000145756e2b(fVar31);
          uVar25 = func_0x000145756e31(fVar31);
          if (*(char *)(lVar12 + 0x108) == '\0') {
            lVar20 = 0;
            lVar18 = 8;
            lVar12 = 0;
            uVar22 = 0;
            lVar11 = extraout_RDX;
            do {
              if (uVar22 == (uint)lVar20) {
                do {
                  if (puVar13 == puVar7) {
                    return;
                  }
                  uVar22 = *puVar13;
                  puVar13 = puVar13 + 1;
                  lVar20 = *(long *)(*(long *)(local_1d8 + 0x108) + 0x58 + (ulong)uVar22 * 0xa0);
                } while (lVar20 == 0);
                lVar18 = *(long *)(local_1d8 + 0x108) + (ulong)uVar22 * 0xa0;
                uVar8 = (ulong)*(uint *)(lVar18 + 0x94);
                lVar11 = *(long *)(*(long *)(local_1d8 + 0x1a8) + 0x18 + uVar8 * 0x48);
                lVar16 = ~*(ulong *)(*(long *)(*(long *)(local_1d8 + 0x1a8) + 0x38 + uVar8 * 0x48) +
                                    *(long *)(local_1a8 + 0x110) * 8) * 0x30;
                lVar12 = *(long *)(lVar11 + 0x10 + lVar16);
                lVar11 = *(long *)(lVar11 + 0x28 + lVar16);
                lVar18 = *(long *)(lVar18 + 0x50);
                uVar22 = 0;
              }
              uVar8 = (ulong)uVar22;
              uVar22 = uVar22 + 1;
              uVar8 = (ulong)~*(uint *)(lVar18 + 8 + uVar8 * 0x10);
              *(uint *)(lVar11 + uVar8 * 4) = local_124;
              lVar16 = uVar8 * 0x20;
              *(undefined4 *)(lVar12 + 0x18 + lVar16) = uVar25;
              *(undefined4 *)(lVar12 + 0x1c + lVar16) = uVar24;
            } while( true );
          }
          lVar11 = 0;
          lVar12 = 0;
          uVar22 = 0;
          do {
            if (uVar22 == (uint)lVar11) {
              do {
                if (puVar13 == puVar7) {
                  return;
                }
                uVar22 = *puVar13;
                puVar13 = puVar13 + 1;
                lVar11 = *(long *)(*(long *)(local_1d8 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48);
              } while (lVar11 == 0);
              lVar12 = *(long *)(local_1d8 + 0x1a8) + (ulong)uVar22 * 0x48;
              lVar18 = *(long *)(lVar12 + 0x18);
              lVar20 = ~*(ulong *)(*(long *)(lVar12 + 0x38) + *(long *)(local_1a8 + 0x110) * 8) *
                       0x30;
              lVar12 = *(long *)(lVar18 + 0x10 + lVar20);
              puVar10 = *(uint **)(lVar18 + 0x28 + lVar20);
              uVar22 = 0;
            }
            uVar8 = (ulong)uVar22;
            uVar22 = uVar22 + 1;
            puVar10[uVar8] = local_124;
            lVar18 = uVar8 * 0x20;
            *(undefined4 *)(lVar12 + 0x18 + lVar18) = uVar25;
            *(undefined4 *)(lVar12 + 0x1c + lVar18) = uVar24;
          } while( true );
        }
        uVar22 = *puVar7;
        puVar7 = puVar7 + 1;
        lVar18 = *(long *)(*(long *)(local_1b8 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48);
      } while (lVar18 == 0);
      lVar11 = *(long *)(local_1b8 + 0x1a8) + (ulong)uVar22 * 0x48;
      lVar20 = *(long *)(lVar11 + 0x18);
      lVar16 = ~*(ulong *)(*(long *)(lVar11 + 0x38) + *(long *)(local_1a0 + 0x110) * 8) * 0x30;
      lVar11 = *(long *)(lVar20 + 0x10 + lVar16);
      plVar21 = *(long **)(lVar20 + 0x28 + lVar16);
      uVar22 = 0;
    }
    uVar8 = (ulong)uVar22;
    uVar22 = uVar22 + 1;
    *(undefined4 *)((long)plVar21 + uVar8 * 4) = local_128;
    lVar20 = uVar8 * 0x20;
    *(float *)(lVar11 + 0x10 + lVar20) = fVar32;
    *(float *)(lVar11 + 0x14 + lVar20) = fVar32;
  } while( true );
}
