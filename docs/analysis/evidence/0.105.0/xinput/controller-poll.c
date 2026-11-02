/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  ulong uVar1;
  long *plVar2;
  byte bVar3;
  byte bVar4;
  ushort uVar5;
  ushort uVar6;
  ushort uVar7;
  undefined8 uVar8;
  ushort uVar9;
  int iVar10;
  uint uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  uint uVar16;
  ulong uVar17;
  ulong uVar18;
  long lVar19;
  uint *puVar20;
  long lVar21;
  undefined8 *in_R8;
  uint uVar22;
  long *in_R9;
  uint uVar23;
  undefined2 uVar24;
  undefined8 *puVar25;
  uint uVar26;
  uint uVar27;
  bool bVar28;
  short sVar30;
  short sVar31;
  short sVar32;
  undefined1 auVar29 [16];
  undefined4 in_XMM6_Da;
  float fVar33;
  undefined4 in_XMM7_Da;
  float fVar34;
  undefined4 uVar35;
  undefined4 uVar36;
  undefined4 uVar37;
  undefined4 uVar38;
  float fVar39;
  undefined4 uVar40;
  undefined8 uVar41;
  undefined1 auVar42 [16];
  undefined1 auVar43 [16];
  undefined4 uVar44;
  float fVar45;
  long *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long *in_stack_00000040;
  undefined4 uStack_2c4;
  long local_2a0;
  long lStack_298;
  undefined4 *local_290;
  undefined8 uStack_288;
  long local_280;
  long lStack_278;
  undefined4 *local_270;
  undefined8 uStack_268;
  long local_260;
  long lStack_258;
  undefined4 *local_250;
  undefined8 uStack_248;
  long local_240;
  long lStack_238;
  long local_230;
  long lStack_228;
  ulong *local_220;
  undefined8 local_218;
  ulong local_210;
  ulong local_208;
  undefined8 *local_200;
  undefined8 local_1f8;
  long *plStack_1f0;
  undefined8 *local_1e8;
  long *plStack_1e0;
  undefined8 *local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined4 *local_1a8;
  undefined8 *local_1a0;
  long local_198;
  long *local_190;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  uint local_174;
  uint local_170;
  uint local_16c;
  undefined4 *local_168;
  undefined4 *local_160;
  long local_158;
  undefined8 *local_150;
  undefined4 local_148;
  uint local_144;
  undefined8 local_140;
  undefined8 local_138;
  long *plStack_130;
  undefined8 *local_128;
  uint local_118;
  uint local_114;
  ushort local_110;
  byte local_10e;
  byte local_10d;
  undefined2 local_10c;
  ushort local_10a;
  ushort local_108;
  ushort local_106;
  uint local_104;
  undefined4 local_fc;
  undefined4 local_f8;
  uint local_f4;
  ulong local_f0;
  uint local_e8;
  bool local_e3;
  byte local_e2;
  byte local_e1;
  uint *local_e0;
  undefined2 local_d4;
  undefined1 local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_b8;

  local_d0 = 0xfffffffffffffffe;
  puVar25 = (undefined8 *)*in_R8;
  local_160 = (undefined4 *)in_R8[2];
  local_2a0 = *in_stack_00000028;
  lStack_298 = in_stack_00000028[1];
  local_290 = (undefined4 *)in_stack_00000028[2];
  uStack_288 = in_stack_00000028[3];
  local_280 = *in_stack_00000030;
  lStack_278 = in_stack_00000030[1];
  local_270 = (undefined4 *)in_stack_00000030[2];
  lVar21 = in_stack_00000030[3];
  local_260 = *in_stack_00000038;
  lStack_258 = in_stack_00000038[1];
  local_250 = (undefined4 *)in_stack_00000038[2];
  uStack_248 = in_stack_00000038[3];
  local_240 = *in_stack_00000040;
  lStack_238 = in_stack_00000040[1];
  local_230 = in_stack_00000040[2];
  lStack_228 = in_stack_00000040[3];
  fVar33 = *(float *)(*in_R9 + 0x8c);
  fVar34 = *(float *)(puVar25 + 0xd);
  uStack_2c4 = (undefined4)((ulong)in_R8[3] >> 0x20);
  local_f8 = uStack_2c4;
  if (fVar34 <= fVar33) {
    *local_160 = uStack_2c4;
    *(float *)(puVar25 + 0xd) = _DAT_145d6d42c + fVar33;
  }
  local_150 = puVar25 + 1;
  uStack_268._4_4_ = (undefined4)((ulong)lVar21 >> 0x20);
  local_148 = uStack_268._4_4_;
  local_198 = local_280 + 0x20;
  uVar35 = 0;
  uVar36 = 0;
  uVar37 = 0;
  uVar38 = 0;
  auVar42 = ZEXT416(_DAT_145d74044);
  local_f0 = 0;
  fVar39 = _DAT_145d74040;
  uVar40 = _DAT_145d6d36c;
  uStack_268 = lVar21;
  local_1a8 = local_270;
  local_1a0 = puVar25;
  local_158 = local_280;
  local_c8 = in_XMM6_Da;
  local_b8 = in_XMM7_Da;
LAB_140092ca7:
  while( true ) {
    if (3 < local_f0) {
      return;
    }
    uVar18 = local_f0 + 1;
    puVar20 = (uint *)(local_150 + local_f0 * 3);
    uVar17 = uVar18;
    if ((fVar33 < fVar34) && (*(int *)(local_150 + local_f0 * 3) == 0)) {
      if (local_f0 == 3) {
        return;
      }
      uVar1 = local_f0 + 2;
      puVar20 = (uint *)(local_150 + uVar18 * 3);
      uVar17 = uVar1;
      if ((fVar33 < fVar34) && (*(int *)(local_150 + uVar18 * 3) == 0)) {
        if (1 < local_f0) {
          return;
        }
        puVar20 = (uint *)(local_150 + uVar1 * 3);
        uVar17 = local_f0 + 3;
        if ((fVar33 < fVar34) && (*(int *)(local_150 + uVar1 * 3) == 0)) {
          if (local_f0 != 0) {
            return;
          }
          puVar20 = (uint *)(local_150 + 9);
          local_f0 = 4;
          uVar17 = local_f0;
          if ((fVar33 < fVar34) && (*(int *)(local_150 + 9) == 0)) {
            return;
          }
        }
      }
    }
    local_f0 = uVar17;
    local_188 = uVar35;
    uStack_184 = uVar36;
    uStack_180 = uVar37;
    uStack_17c = uVar38;
    iVar10 = (*(code *)*puVar25)();
    uVar27 = *puVar20;
    uVar18 = (ulong)uVar27;
    uVar16 = puVar20[1];
    uVar17 = (ulong)uVar16;
    uVar9 = (ushort)puVar20[2];
    uVar23 = (uint)uVar9;
    bVar3 = *(byte *)((long)puVar20 + 10);
    uVar11 = (uint)bVar3;
    bVar4 = *(byte *)((long)puVar20 + 0xb);
    local_e8 = (uint)bVar4;
    uVar5 = *(ushort *)((long)puVar20 + 0xe);
    local_f4 = (uint)uVar5;
    local_d4 = (undefined2)puVar20[3];
    uVar6 = (ushort)puVar20[4];
    uVar7 = *(ushort *)((long)puVar20 + 0x12);
    uVar22 = (uint)uVar7;
    if (uVar18 == 0) goto LAB_140092e90;
    if (iVar10 == 0) break;
    *local_160 = local_f8;
    *puVar20 = 0;
    *local_290 = uStack_288._4_4_;
    lVar21 = *(long *)(local_2a0 + 0x30);
    uVar8 = *(undefined8 *)(local_2a0 + 0x40);
    lVar19 = local_2a0;
    if (lVar21 == *(long *)(local_2a0 + 0x20)) {
      func_0x000145bcb610();
    }
    uVar18 = uVar17 << 0x20 | uVar18;
    lVar12 = *(long *)(lVar19 + 0x28);
    lVar13 = lVar21 * 0x30;
    *(undefined8 *)(lVar12 + lVar13) = 0xffffffffffffffff;
    *(ulong *)(lVar12 + 0x20 + lVar13) = uVar18;
    *(undefined8 *)(lVar12 + 0x28 + lVar13) = uVar8;
    *(long *)(lVar19 + 0x30) = lVar21 + 1;
    *(long *)(lVar19 + 0x40) = *(long *)(lVar19 + 0x40) + 1;
    *local_1a8 = local_148;
    lVar21 = *(long *)(local_158 + 0x30);
    uVar8 = *(undefined8 *)(local_158 + 0x40);
    if (lVar21 == *(long *)(local_158 + 0x20)) {
      func_0x000145bcb610();
    }
    lVar19 = *(long *)(local_158 + 0x28);
    lVar12 = lVar21 * 0x30;
    *(undefined8 *)(lVar19 + lVar12) = 0xffffffffffffffff;
    *(ulong *)(lVar19 + 0x20 + lVar12) = uVar18;
    *(undefined8 *)(lVar19 + 0x28 + lVar12) = uVar8;
    *(long *)(local_158 + 0x30) = lVar21 + 1;
    *(long *)(local_158 + 0x40) = *(long *)(local_158 + 0x40) + 1;
  }
  local_118 = uVar27;
  local_114 = uVar16;
  local_110 = uVar9;
  local_10e = bVar3;
  local_10d = bVar4;
  local_10c = local_d4;
  local_10a = uVar5;
  local_108 = uVar6;
  local_106 = uVar7;
  local_144 = (uint)uVar6;
  local_104 = puVar20[5];
  uVar41 = CONCAT26(uVar9,CONCAT24(uVar6,puVar20[3]));
  uVar26 = uVar27;
  goto LAB_1400931fe;
LAB_140092e90:
  if (iVar10 == 0) {
    local_118 = 0;
    local_114 = uVar16;
    local_110 = uVar9;
    local_10e = bVar3;
    local_10d = bVar4;
    local_10c = local_d4;
    local_10a = uVar5;
    local_108 = uVar6;
    local_106 = uVar7;
    local_104 = puVar20[5];
    func_0x000144e5e920();
    uVar27 = (uint)local_1f8;
    local_210 = local_f0;
    local_220 = &local_210;
    local_218 = 0x145baee70;
    uVar16 = local_1f8._4_4_;
    func_0x000145b9c4d0();
    puVar25 = (undefined8 *)CONCAT44(uVar16,uVar27);
    local_1f8 = local_138;
    plStack_1f0 = plStack_130;
    local_1e8 = local_128;
    uVar17 = (ulong)plStack_1e0 >> 0x30;
    uVar23 = (uint)plStack_1e0;
    plStack_1e0._0_6_ = (uint6)(uVar23 & 0xffff0000);
    plStack_1e0 = (long *)CONCAT26((short)uVar17,(uint6)plStack_1e0);
    local_208 = uVar18;
    local_1d8 = puVar25;
    if (local_138 == (uint *)0xffffffffffffffff) {
      local_e0 = (uint *)0xffffffffffffffff;
    }
    else {
      local_d1 = 1;
      func_0x000145b9c990();
      local_e0 = local_138;
      local_190 = plStack_130;
      local_200 = local_128;
    }
    lVar19 = local_2a0;
    *local_290 = uStack_288._4_4_;
    lVar21 = *(long *)(local_2a0 + 0x30);
    uVar8 = *(undefined8 *)(local_2a0 + 0x40);
    if (lVar21 == *(long *)(local_2a0 + 0x20)) {
      func_0x000145bcb610();
    }
    lVar12 = *(long *)(lVar19 + 0x28);
    lVar13 = lVar21 * 0x30;
    *(uint **)(lVar12 + lVar13) = local_e0;
    *(long **)(lVar12 + 8 + lVar13) = local_190;
    *(undefined8 **)(lVar12 + 0x10 + lVar13) = local_200;
    *(undefined2 *)(lVar12 + 0x18 + lVar13) = 0;
    *(undefined2 *)(lVar12 + 0x1c + lVar13) = 0;
    *(undefined8 **)(lVar12 + 0x20 + lVar13) = puVar25;
    *(undefined8 *)(lVar12 + 0x28 + lVar13) = uVar8;
    *(long *)(lVar19 + 0x30) = lVar21 + 1;
    *(long *)(lVar19 + 0x40) = *(long *)(lVar19 + 0x40) + 1;
    local_e0 = local_1f8;
    local_140 = plStack_1f0;
    local_138 = (uint *)local_1e8;
    plStack_130 = plStack_1e0;
    local_128 = local_1d8;
    *local_1a8 = local_148;
    lVar21 = *(long *)(local_158 + 0x30);
    uVar8 = *(undefined8 *)(local_158 + 0x40);
    if (lVar21 == *(long *)(local_158 + 0x20)) {
      func_0x000145bcb610();
    }
    uVar41 = auVar42._0_8_;
    lVar19 = *(long *)(local_158 + 0x28);
    lVar12 = lVar21 * 0x30;
    *(uint **)(lVar19 + lVar12) = local_e0;
    *(long **)(lVar19 + 8 + lVar12) = local_140;
    plVar2 = (long *)(lVar19 + 0x10 + lVar12);
    *plVar2 = (long)local_138;
    plVar2[1] = (long)plStack_130;
    *(undefined8 **)(lVar19 + 0x20 + lVar12) = local_128;
    *(undefined8 *)(lVar19 + 0x28 + lVar12) = uVar8;
    *(long *)(local_158 + 0x30) = lVar21 + 1;
    *(long *)(local_158 + 0x40) = *(long *)(local_158 + 0x40) + 1;
    local_d4 = 0x8000;
    uVar23 = 0;
    uVar11 = 0;
    local_e8 = 0;
    local_f4 = 0;
    local_144 = 0;
    uVar22 = 0;
    uVar26 = (uint)local_208;
    puVar25 = local_1a0;
LAB_1400931fe:
    local_138 = (uint *)CONCAT44(uVar16,uVar27);
    uVar18 = CONCAT44(uStack_17c,uStack_180);
    auVar43._8_8_ = 0;
    auVar43._0_8_ = uVar18;
    uVar9 = (ushort)((uint)uStack_17c >> 0x10);
    *local_160 = local_f8;
    *(uint **)puVar20 = local_138;
    *(short *)(puVar20 + 2) = (short)uStack_184;
    *(byte *)((long)puVar20 + 10) = uStack_184._2_1_;
    *(byte *)((long)puVar20 + 0xb) = uStack_184._3_1_;
    *(ulong *)(puVar20 + 3) = uVar18;
    bVar28 = uStack_184._2_1_ == (byte)uVar11;
    local_140 = (long *)(CONCAT44(local_140._4_4_,uStack_184) & 0xffffffff0000ffff);
    uVar18 = uVar18 & 0xffffffffffff;
    auVar29._0_2_ = -(ushort)((short)uVar18 == (short)uVar41);
    sVar30 = -(ushort)((short)(uVar18 >> 0x10) == (short)((ulong)uVar41 >> 0x10));
    sVar31 = -(ushort)((short)(uVar18 >> 0x20) == (short)((ulong)uVar41 >> 0x20));
    sVar32 = -(ushort)((short)uStack_184 == (short)((ulong)uVar41 >> 0x30));
    auVar29._8_8_ =
         (undefined8)
         (CONCAT64(CONCAT42(CONCAT22(sVar32,sVar32),sVar31),CONCAT22(sVar31,sVar32)) >> 0x10);
    auVar29._6_2_ = sVar30;
    auVar29._4_2_ = sVar30;
    auVar29._2_2_ = auVar29._0_2_;
    iVar10 = movmskps(uVar11,auVar29);
    if ((((iVar10 != 0xf) || (uVar9 != (ushort)uVar22)) || (!bVar28)) ||
       (uStack_184._3_1_ != (byte)local_e8)) {
      local_e3 = bVar28;
      local_e1 = uStack_184._2_1_;
      local_e2 = uStack_184._3_1_;
      local_16c = (uint)uVar9;
      local_170 = uVar22;
      plStack_1f0 = (long *)0xe;
      local_1c8 = _DAT_145d99420;
      uStack_1c0 = uRam0000000145d99428;
      local_1d8 = _DAT_145d99410;
      uStack_1d0 = uRam0000000145d99418;
      local_1e8 = _DAT_145d99400;
      plStack_1e0 = (long *)uRam0000000145d99408;
      local_1b8 = 0x2800000034000;
      uVar23 = uVar23 ^ (uint)local_140;
      local_fc = uStack_248._4_4_;
      local_168 = local_250;
      lVar21 = 0;
      local_174 = uVar23;
      lVar19 = local_260;
      do {
        lVar12 = local_2a0;
        uVar27 = *(uint *)((long)&local_1e8 + lVar21 * 4);
        if ((~uVar27 & 0xff0000) == 0) break;
        if ((uVar26 == 0) || ((ushort)((ushort)uVar23 & (ushort)uVar27) != 0)) {
          uVar44 = 0;
          if (((ushort)local_140 & (ushort)uVar27) != 0) {
            uVar44 = uVar40;
          }
          local_e0 = local_138;
          *local_290 = uStack_288._4_4_;
          lVar13 = *(long *)(local_2a0 + 0x30);
          uVar8 = *(undefined8 *)(local_2a0 + 0x40);
          if (lVar13 == *(long *)(local_2a0 + 0x20)) {
            func_0x000145bcb610();
          }
          puVar20 = local_138;
          lVar15 = *(long *)(lVar12 + 0x28);
          lVar14 = lVar13 * 0x30;
          *(undefined8 *)(lVar15 + lVar14) = 0x8000000000000000;
          *(uint **)(lVar15 + 8 + lVar14) = local_e0;
          *(undefined4 *)(lVar15 + 0x10 + lVar14) = uVar44;
          uVar24 = (undefined2)(uVar27 >> 0x10);
          *(undefined2 *)(lVar15 + 0x14 + lVar14) = uVar24;
          *(undefined8 *)(lVar15 + 0x28 + lVar14) = uVar8;
          *(long *)(lVar12 + 0x30) = lVar13 + 1;
          *(long *)(lVar12 + 0x40) = *(long *)(lVar12 + 0x40) + 1;
          *local_168 = local_fc;
          lVar12 = *(long *)(lVar19 + 0x30);
          uVar8 = *(undefined8 *)(lVar19 + 0x40);
          if (lVar12 == *(long *)(lVar19 + 0x20)) {
            func_0x000145bcb3e0();
          }
          lVar13 = *(long *)(lVar19 + 0x28);
          *(undefined8 *)(lVar13 + lVar12 * 0x18) = uVar8;
          *(uint **)(lVar13 + 8 + lVar12 * 0x18) = puVar20;
          *(undefined4 *)(lVar13 + 0x10 + lVar12 * 0x18) = uVar44;
          *(undefined2 *)(lVar13 + 0x14 + lVar12 * 0x18) = uVar24;
          *(long *)(lVar19 + 0x30) = lVar12 + 1;
          *(long *)(lVar19 + 0x40) = *(long *)(lVar19 + 0x40) + 1;
          uVar23 = local_174;
        }
        lVar21 = lVar21 + 1;
      } while (lVar21 != 0xe);
      puVar25 = local_1a0;
      if (local_e3 != true || uVar26 == 0) {
        fVar45 = (float)local_e1 / fVar39;
        local_e0 = local_138;
        *local_290 = uStack_288._4_4_;
        lVar21 = *(long *)(local_2a0 + 0x30);
        uVar8 = *(undefined8 *)(local_2a0 + 0x40);
        lVar12 = local_2a0;
        if (lVar21 == *(long *)(local_2a0 + 0x20)) {
          func_0x000145bcb610();
        }
        puVar20 = local_138;
        lVar13 = *(long *)(lVar12 + 0x28);
        lVar15 = lVar21 * 0x30;
        *(undefined8 *)(lVar13 + lVar15) = 0x8000000000000000;
        *(uint **)(lVar13 + 8 + lVar15) = local_e0;
        *(float *)(lVar13 + 0x10 + lVar15) = fVar45;
        *(undefined1 *)(lVar13 + 0x14 + lVar15) = 7;
        *(undefined8 *)(lVar13 + 0x28 + lVar15) = uVar8;
        *(long *)(lVar12 + 0x30) = lVar21 + 1;
        *(long *)(lVar12 + 0x40) = *(long *)(lVar12 + 0x40) + 1;
        *local_168 = local_fc;
        lVar21 = *(long *)(lVar19 + 0x30);
        uVar8 = *(undefined8 *)(lVar19 + 0x40);
        if (lVar21 == *(long *)(lVar19 + 0x20)) {
          func_0x000145bcb3e0();
        }
        lVar12 = *(long *)(lVar19 + 0x28);
        *(undefined8 *)(lVar12 + lVar21 * 0x18) = uVar8;
        *(uint **)(lVar12 + 8 + lVar21 * 0x18) = puVar20;
        *(float *)(lVar12 + 0x10 + lVar21 * 0x18) = fVar45;
        *(undefined1 *)(lVar12 + 0x14 + lVar21 * 0x18) = 7;
        lVar21 = lVar21 + 1;
        *(long *)(lVar19 + 0x30) = lVar21;
        *(long *)(lVar19 + 0x40) = *(long *)(lVar19 + 0x40) + 1;
      }
      uVar44 = auVar43._0_4_;
      if (uVar26 == 0 || local_e2 != (byte)local_e8) {
        fVar45 = (float)local_e2 / fVar39;
        local_e0 = local_138;
        *local_290 = uStack_288._4_4_;
        lVar21 = *(long *)(local_2a0 + 0x30);
        uVar8 = *(undefined8 *)(local_2a0 + 0x40);
        lVar12 = local_2a0;
        if (lVar21 == *(long *)(local_2a0 + 0x20)) {
          func_0x000145bcb610();
        }
        puVar20 = local_138;
        uVar44 = auVar43._0_4_;
        lVar13 = *(long *)(lVar12 + 0x28);
        lVar15 = lVar21 * 0x30;
        *(undefined8 *)(lVar13 + lVar15) = 0x8000000000000000;
        *(uint **)(lVar13 + 8 + lVar15) = local_e0;
        *(float *)(lVar13 + 0x10 + lVar15) = fVar45;
        *(undefined1 *)(lVar13 + 0x14 + lVar15) = 9;
        *(undefined8 *)(lVar13 + 0x28 + lVar15) = uVar8;
        *(long *)(lVar12 + 0x30) = lVar21 + 1;
        *(long *)(lVar12 + 0x40) = *(long *)(lVar12 + 0x40) + 1;
        *local_168 = local_fc;
        lVar21 = *(long *)(lVar19 + 0x30);
        uVar8 = *(undefined8 *)(lVar19 + 0x40);
        if (lVar21 == *(long *)(lVar19 + 0x20)) {
          func_0x000145bcb3e0();
          uVar44 = auVar43._0_4_;
        }
        lVar12 = *(long *)(lVar19 + 0x28);
        *(undefined8 *)(lVar12 + lVar21 * 0x18) = uVar8;
        *(uint **)(lVar12 + 8 + lVar21 * 0x18) = puVar20;
        *(float *)(lVar12 + 0x10 + lVar21 * 0x18) = fVar45;
        *(undefined1 *)(lVar12 + 0x14 + lVar21 * 0x18) = 9;
        lVar21 = lVar21 + 1;
        *(long *)(lVar19 + 0x30) = lVar21;
        *(long *)(lVar19 + 0x40) = *(long *)(lVar19 + 0x40) + 1;
      }
      local_1f8 = &local_118;
      plStack_1f0 = &local_2a0;
      local_1e8 = &local_138;
      plStack_1e0 = &local_240;
      func_0x000140078230(lVar21,&local_1f8,0,&local_1f8,uVar44,local_d4);
      func_0x000140078230();
      func_0x000140078230();
      func_0x000140078230();
    }
  }
  goto LAB_140092ca7;
}
