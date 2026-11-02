
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  char cVar8;
  char *pcVar9;
  undefined1 extraout_DL;
  byte extraout_DL_00;
  undefined1 extraout_DL_01;
  ulong uVar10;
  long *plVar11;
  undefined8 *puVar12;
  undefined8 *puVar13;
  long *plVar14;
  long *in_R8;
  undefined8 *in_R9;
  long lVar15;
  undefined8 *puVar16;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  long local_390;
  undefined8 *puStack_388;
  long local_380;
  undefined8 local_2f8;
  long local_2f0;
  long local_2e8;
  long local_268;
  char *pcStack_260;
  long local_258;
  undefined8 *local_250;
  long local_248;
  long local_240;
  char *local_230;
  byte local_228;
  long local_220;
  long *local_218;
  undefined8 local_210;
  undefined8 local_208;
  long local_200;
  long local_1f0;
  long local_1e8;
  undefined8 local_1d8;
  long local_1d0;
  long local_1c8;
  long local_1b8;
  undefined4 local_1ac;
  long *local_1a8;
  long local_1a0;
  long local_198;
  char *pcStack_190;
  undefined8 local_188;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  long *local_168;
  undefined7 uStack_160;
  undefined1 uStack_159;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined8 uStack_150;
  long *local_148;
  long local_140;
  long local_138;
  char *local_130;
  long lStack_128;
  char **local_120;
  long local_118;
  char local_110;
  undefined7 uStack_10f;
  undefined1 uStack_108;
  undefined7 uStack_107;
  undefined4 local_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined1 local_e9;
  long *local_d0;
  undefined1 local_c1;
  undefined4 *local_c0;
  undefined1 local_b6;
  undefined1 local_b5;
  undefined1 local_b4;
  undefined1 local_b3;
  undefined1 local_b2;
  undefined1 local_b1;
  long local_b0;
  undefined1 local_a1;
  undefined4 local_94;
  long *local_90;
  undefined1 local_84;
  undefined1 local_83;
  undefined1 local_82;
  undefined1 local_81;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;

  local_80 = 0xfffffffffffffffe;
  lVar15 = *in_R8;
  puVar1 = (undefined4 *)in_R8[2];
  local_94 = *(undefined4 *)((long)in_R8 + 0x1c);
  local_210 = *in_R9;
  local_208 = in_R9[2];
  local_1ac = *(undefined4 *)((long)in_R9 + 0x1c);
  local_78 = in_XMM6_Da;
  local_68 = in_XMM7_Da;
  local_d0 = (long *)func_0x000145428620();
  local_1a8 = (long *)CONCAT71(local_1a8._1_7_,extraout_DL);
  local_148 = (long *)local_d0[4];
  local_d0[4] = 0;
  local_168 = local_d0 + 1;
  uStack_160 = SUB87(local_148,0);
  uStack_159 = (undefined1)((ulong)local_148 >> 0x38);
  local_158 = 0;
  uStack_154 = 0;
  uStack_150._0_4_ = 0;
  uStack_150._4_4_ = 0;
  func_0x0001401a97c0();
  local_1f0 = local_d0[8];
  local_218 = (long *)local_d0[9];
  lVar2 = local_d0[10];
  local_d0[8] = -1;
  lVar3 = local_d0[0xd];
  lVar5 = local_d0[0xb];
  lVar6 = local_d0[0xc];
  local_d0[0xb] = -1;
  local_220 = local_d0[0xe];
  plVar14 = (long *)local_d0[0xf];
  lVar4 = local_d0[0x10];
  local_d0[0xe] = -1;
  plVar11 = local_d0;
  if (((((ulong)local_1a8 & 1) == 0) && ((*_DAT_147a37dc8 & 0x7fffffffffffffff) != 0)) &&
     (cVar8 = func_0x000145902bd0(), cVar8 == '\0')) {
    *(char *)((long)plVar11 + 1) = '\x01';
  }
  LOCK();
  lVar7 = *plVar11;
  *(char *)plVar11 = '\0';
  UNLOCK();
  if ((char)lVar7 == '\x02') {
    func_0x000145901f00();
  }
  local_b0 = lVar15;
  if (lVar5 != -1) {
    local_a1 = 1;
    func_0x0001401b5b70();
    *puVar1 = local_94;
    local_90 = (long *)(lVar15 + 0x48);
    local_250 = *(undefined8 **)(lVar15 + 0x50);
    local_1a8 = *(long **)(lVar15 + 0x58);
    local_d0 = (long *)0x0;
    while (lVar15 = local_b0, local_1a8 != local_d0) {
      local_d0 = (long *)((long)local_d0 + 1);
      func_0x00014007b010();
    }
    plVar11 = local_90;
    if (*local_90 != 0) {
      func_0x0001400021d0();
    }
    plVar11[2] = CONCAT44(uStack_154,local_158);
    *plVar11 = (long)local_168;
    plVar11[1] = CONCAT17(uStack_159,uStack_160);
    uStack_150 = (char *)(lVar3 * 0xb0 + lVar6);
    uStack_160 = (undefined7)lVar6;
    uStack_159 = (undefined1)((ulong)lVar6 >> 0x38);
    local_158 = (undefined4)lVar5;
    uStack_154 = (undefined4)((ulong)lVar5 >> 0x20);
    local_a1 = 0;
    plVar11 = &local_268;
    local_168 = (long *)lVar6;
    func_0x00014007ff00();
    local_b1 = 1;
    local_230 = (char *)func_0x0001407b5940();
    local_228 = extraout_DL_00 & 1;
    local_138 = *(long *)(local_230 + 8);
    if (local_138 == 0) {
      local_130 = (char *)0x0;
      lStack_128 = 0;
    }
    else {
      local_130 = *(char **)(local_230 + 0x10);
      lStack_128 = *(long *)(local_230 + 0x18);
    }
    local_168 = (long *)(ulong)(local_138 != 0);
    uStack_160 = 0;
    uStack_159 = 0;
    local_158 = (undefined4)local_138;
    uStack_154 = (undefined4)((ulong)local_138 >> 0x20);
    uStack_150._0_4_ = SUB84(local_130,0);
    uStack_150._4_4_ = (undefined4)((ulong)local_130 >> 0x20);
    local_140 = 0;
    local_b2 = 1;
    local_148 = local_168;
    local_120 = (char **)plVar11;
    func_0x0001401a90c0();
    local_168 = (long *)(ulong)(local_268 != 0);
    lStack_128 = 0;
    if (local_268 != 0) {
      lStack_128 = local_258;
    }
    uStack_160 = 0;
    uStack_159 = 0;
    local_158 = (undefined4)local_268;
    uStack_154 = (undefined4)((ulong)local_268 >> 0x20);
    uStack_150._0_4_ = SUB84(pcStack_260,0);
    uStack_150._4_4_ = (undefined4)((ulong)pcStack_260 >> 0x20);
    local_140 = 0;
    local_138 = local_268;
    local_130 = pcStack_260;
    local_120 = &local_230;
    local_b3 = 1;
    local_b4 = 1;
    local_148 = local_168;
    func_0x0001401a8c90();
    uStack_150 = (char *)(local_1d0 + local_1c8 * 4);
    local_168 = (long *)local_1d0;
    local_158 = (undefined4)local_1d8;
    uStack_154 = (undefined4)((ulong)local_1d8 >> 0x20);
    uStack_160 = (undefined7)local_1d0;
    uStack_159 = (undefined1)((ulong)local_1d0 >> 0x38);
    local_b5 = 1;
    local_b6 = 1;
    func_0x0001401803a0();
    uStack_150 = (char *)(local_2f0 + local_2e8 * 4);
    local_158 = (undefined4)local_2f8;
    uStack_154 = (undefined4)((ulong)local_2f8 >> 0x20);
    uStack_160 = (undefined7)local_2f0;
    uStack_159 = (undefined1)((ulong)local_2f0 >> 0x38);
    local_b5 = 1;
    local_b6 = 0;
    func_0x0001401803a0();
    local_188 = local_258;
    local_198 = local_268;
    pcStack_190 = pcStack_260;
    lVar3 = *(long *)(local_230 + 8);
    if (lVar3 == 0) {
      lStack_128 = 0;
    }
    else {
      local_130 = *(char **)(local_230 + 0x10);
      lStack_128 = *(long *)(local_230 + 0x18);
      uStack_160 = 0;
      uStack_159 = 0;
      local_158 = (undefined4)lVar3;
      uStack_154 = (undefined4)((ulong)lVar3 >> 0x20);
      local_140 = 0;
      local_138 = lVar3;
      uStack_150 = local_130;
    }
    local_168 = (long *)(ulong)(lVar3 != 0);
    local_d0 = (long *)(local_230 + 8);
    local_148 = local_168;
    func_0x000140082960();
    lVar3 = CONCAT71(uStack_10f,local_110);
    pcVar9 = local_230;
    while (local_230 = pcVar9, lVar3 != 0) {
      func_0x00014007b010();
      func_0x000140082960();
      pcVar9 = local_230;
      lVar3 = CONCAT71(uStack_10f,local_110);
    }
    local_d0[2] = local_188;
    *local_d0 = local_198;
    local_d0[1] = (long)pcStack_190;
    if ((local_228 == 0) && ((*_DAT_147a37dc8 & 0x7fffffffffffffff) != 0)) {
      local_b1 = 0;
      cVar8 = func_0x000145902bd0();
      if (cVar8 == '\0') {
        pcVar9[1] = '\x01';
      }
    }
    LOCK();
    cVar8 = *pcVar9;
    *pcVar9 = '\0';
    UNLOCK();
    if (cVar8 == '\x02') {
      local_b1 = 0;
      func_0x000145901f00();
    }
  }
  local_c1 = local_220 == -1;
  if (!(bool)local_c1) {
    uStack_150 = (char *)((long)plVar14 + lVar4 * 0xc);
    uStack_160 = SUB87(plVar14,0);
    uStack_159 = (undefined1)((ulong)plVar14 >> 0x38);
    local_158 = (undefined4)local_220;
    uStack_154 = (undefined4)((ulong)local_220 >> 0x20);
    local_82 = 0;
    local_83 = 1;
    local_84 = 1;
    local_168 = plVar14;
    func_0x00014007fcc0();
    local_1a8 = (long *)func_0x0001407b5940();
    local_d0 = (long *)CONCAT71(local_d0._1_7_,extraout_DL_01);
    local_90 = local_1a8 + 7;
    func_0x0001400892f0();
    local_90[2] = CONCAT44(uStack_fc,local_100);
    *local_90 = CONCAT71(uStack_10f,local_110);
    local_90[1] = CONCAT71(uStack_107,uStack_108);
    plVar14 = local_1a8;
    if ((((ulong)local_d0 & 1) == 0) && ((*_DAT_147a37dc8 & 0x7fffffffffffffff) != 0)) {
      local_82 = 0;
      local_83 = 1;
      local_84 = 1;
      cVar8 = func_0x000145902bd0();
      if (cVar8 == '\0') {
        *(char *)((long)plVar14 + 1) = '\x01';
      }
    }
    LOCK();
    lVar3 = *plVar14;
    *(char *)plVar14 = '\0';
    UNLOCK();
    if ((char)lVar3 == '\x02') {
      local_82 = 0;
      local_83 = 1;
      local_84 = 1;
      func_0x000145901f00();
    }
  }
  local_e9 = local_1f0 == -1;
  pcVar9 = uStack_150;
  if (!(bool)local_e9) {
    local_168 = local_218;
    uStack_160 = (undefined7)lVar2;
    uStack_159 = (undefined1)((ulong)lVar2 >> 0x38);
    local_158 = 0;
    uStack_154 = 0;
    uStack_150._0_4_ = 0;
    uStack_150._4_4_ = 0;
    local_148 = local_218;
    local_140 = lVar2;
    func_0x000140196a90();
    local_d0 = (long *)CONCAT71(local_d0._1_7_,local_110);
    if (local_110 == -1) {
      func_0x000140040560();
    }
    else {
      local_168 = (long *)CONCAT17(uStack_108,uStack_10f);
      local_158 = (undefined4)(CONCAT44(uStack_fc,local_100) >> 8);
      uStack_154._3_1_ = (undefined1)uStack_f8;
      uStack_154 = CONCAT13(uStack_154._3_1_,(int3)((uint)uStack_fc >> 8));
      uStack_150._0_4_ = (undefined4)(CONCAT44(uStack_f4,uStack_f8) >> 8);
      uStack_150._4_3_ = (undefined3)((uint)uStack_f4 >> 8);
      uStack_160 = uStack_107;
      uStack_159 = (undefined1)local_100;
    }
    *puVar1 = local_94;
    if (*(char *)(lVar15 + 0x60) != -1) {
      func_0x000140041ef0();
    }
    lVar15 = local_b0;
    pcVar9 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
    *(undefined1 *)(local_b0 + 0x60) = local_d0._0_1_;
    *(long **)(local_b0 + 0x61) = local_168;
    *(ulong *)(local_b0 + 0x69) = CONCAT17(uStack_159,uStack_160);
    *(ulong *)(local_b0 + 0x70) = CONCAT35((undefined3)uStack_154,CONCAT41(local_158,uStack_159));
    *(ulong *)(local_b0 + 0x78) =
         CONCAT35(uStack_150._4_3_,CONCAT41((undefined4)uStack_150,uStack_154._3_1_));
    if (local_1f0 != 0) {
      func_0x0001400021d0();
      pcVar9 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
    }
  }
  puVar13 = puStack_388 + local_380 * 3;
  local_1e8 = lVar15 + 0x18;
  local_248 = lVar15 + 0x28;
  local_200 = lVar15 + 0x30;
  local_118 = lVar15 + 0x80;
  local_250 = puStack_388 + local_380 * 3 + -3;
  uVar17 = 0;
  uVar18 = 0;
  uVar19 = 0;
  uVar20 = 0;
  local_1a0 = lVar15 + 0xa0;
  local_1b8 = lVar15 + 0xc0;
  local_240 = lVar15 + 0x48;
  local_c0 = puVar1;
LAB_140063416:
  do {
    uVar10 = (long)local_250 - (long)puStack_388;
    puVar16 = puStack_388 + 4;
    do {
      if (puStack_388 == puVar13) {
LAB_140064ff2:
        if (local_390 != 0) {
          uStack_150 = pcVar9;
          func_0x0001400021d0();
        }
        return;
      }
      puVar12 = puStack_388 + 3;
      if ((long *)*puStack_388 == (long *)0xffffffffffffffff) {
        if (puVar13 != puVar12) {
          uVar10 = uVar10 / 0x18;
          do {
            if (puVar16[-1] != 0) {
              uStack_150 = pcVar9;
              func_0x0001400021d0();
              pcVar9 = uStack_150;
            }
            puVar16 = puVar16 + 3;
            uVar10 = uVar10 - 1;
          } while (uVar10 != 0);
        }
        goto LAB_140064ff2;
      }
      local_1a8 = (long *)puStack_388[1];
      local_140 = puStack_388[2];
      uStack_160 = (undefined7)local_140;
      uStack_159 = (undefined1)((ulong)local_140 >> 0x38);
      local_168 = local_1a8;
      local_158 = uVar17;
      uStack_154 = uVar18;
      uStack_150._0_4_ = uVar19;
      uStack_150._4_4_ = uVar20;
      local_148 = local_1a8;
      local_d0 = (long *)*puStack_388;
      func_0x000140196a90();
      if (local_110 != -1) {
        local_198 = CONCAT71(uStack_10f,local_110);
        pcStack_190 = (char *)CONCAT71(uStack_107,uStack_108);
        local_188 = CONCAT44(uStack_fc,local_100);
        uStack_180 = uStack_f8;
        uStack_17c = uStack_f4;
        local_81 = 1;
        pcVar9 = (char *)func_0x000142affbe0();
        if (pcVar9 == (char *)0x0) {
          pcVar9 = _DAT_147a0d7b8;
        }
        if ((*pcVar9 == '\x03') && (*(long *)(pcVar9 + 0x18) - 4U < 8)) {
                    /* WARNING: Could not emulate address calculation at 0x000140063540 */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((*(long *)(pcVar9 + 0x18) - 4U) * 4 + 0x145915644) + 0x145915644
                    ))();
          return;
        }
        func_0x000140041ef0();
        pcVar9 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
        puStack_388 = puVar12;
        if (local_d0 == (long *)0x0) goto LAB_140063416;
        break;
      }
      puStack_388 = puVar12;
      func_0x000140040560();
      pcVar9 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
      uVar10 = uVar10 - 0x18;
      puVar16 = puVar16 + 3;
    } while (local_d0 == (long *)0x0);
    func_0x0001400021d0();
    pcVar9 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
  } while( true );
}
