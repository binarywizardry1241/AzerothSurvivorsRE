/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  undefined8 *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  char cVar7;
  char *pcVar8;
  undefined1 extraout_DL;
  byte extraout_DL_00;
  undefined1 extraout_DL_01;
  long *plVar9;
  undefined8 *puVar10;
  ulong uVar11;
  long lVar12;
  undefined8 *puVar13;
  bool bVar14;
  bool bVar15;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined8 *in_stack_00000028;
  long local_320;
  undefined8 *puStack_318;
  long local_310;
  long local_2f0;
  long local_2e0;
  long local_280;
  long lStack_278;
  long local_270;
  long local_268;
  long lStack_260;
  long local_258;
  long local_250;
  undefined8 *local_248;
  long local_240;
  undefined8 *local_238;
  undefined8 local_230;
  long *local_228;
  long local_220;
  long local_218;
  long local_208;
  char *local_1f8;
  byte local_1f0;
  long local_1e8;
  long *local_1e0;
  undefined8 local_1d8;
  undefined8 local_1d0;
  long local_1c8;
  char local_1c0;
  undefined7 uStack_1bf;
  undefined1 uStack_1b8;
  undefined7 uStack_1b7;
  undefined4 local_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined4 local_19c;
  long local_198;
  long local_190;
  long local_178;
  undefined4 local_16c;
  long *local_168;
  undefined7 uStack_160;
  undefined1 uStack_159;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined8 uStack_150;
  long *local_148;
  long local_140;
  long local_138;
  long local_130;
  long lStack_128;
  char **local_120;
  undefined8 *local_118;
  long local_110;
  long local_108;
  long lStack_100;
  undefined8 local_f8;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  long local_d8;
  undefined1 local_c9;
  long *local_c8;
  long *local_c0;
  long *local_b8;
  undefined1 local_a9;
  undefined4 *local_a8;
  undefined1 local_9b;
  undefined1 local_9a;
  undefined1 local_99;
  long local_98;
  undefined1 local_8a;
  undefined1 local_89;
  undefined4 local_88;
  undefined1 local_84;
  undefined1 local_83;
  undefined1 local_82;
  undefined1 local_81;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;

  local_80 = 0xfffffffffffffffe;
  local_98 = *param_5;
  local_a8 = (undefined4 *)param_5[2];
  local_88 = *(undefined4 *)((long)param_5 + 0x1c);
  local_1d8 = *param_6;
  local_1d0 = param_6[2];
  local_16c = *(undefined4 *)((long)param_6 + 0x1c);
  local_230 = in_stack_00000028[2];
  local_19c = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  local_78 = in_XMM6_Da;
  local_68 = in_XMM7_Da;
  local_c8 = (long *)func_0x000140b8edb0(param_1,*in_stack_00000028,local_19c,*param_3);
  local_b8 = (long *)CONCAT71(local_b8._1_7_,extraout_DL);
  local_148 = (long *)local_c8[4];
  local_c8[4] = 0;
  local_168 = local_c8 + 1;
  uStack_160 = SUB87(local_148,0);
  uStack_159 = (undefined1)((ulong)local_148 >> 0x38);
  local_158 = 0;
  uStack_154 = 0;
  uStack_150._0_4_ = 0;
  uStack_150._4_4_ = 0;
  func_0x0001400a1100();
  plVar9 = local_c8;
  local_198 = local_c8[8];
  local_1e0 = (long *)local_c8[9];
  lVar2 = local_c8[10];
  local_c8[8] = -1;
  lVar12 = local_c8[0xd];
  lVar4 = local_c8[0xb];
  lVar5 = local_c8[0xc];
  local_c8[0xb] = -1;
  local_1e8 = local_c8[0xe];
  local_228 = (long *)local_c8[0xf];
  lVar3 = local_c8[0x10];
  local_c8[0xe] = -1;
  if (((((ulong)local_b8 & 1) == 0) && ((*_DAT_14808a9e8 & 0x7fffffffffffffff) != 0)) &&
     (cVar7 = func_0x000145d986f0(), cVar7 == '\0')) {
    *(char *)((long)plVar9 + 1) = '\x01';
  }
  LOCK();
  lVar6 = *plVar9;
  *(char *)plVar9 = '\0';
  UNLOCK();
  if ((char)lVar6 == '\x02') {
    func_0x000145d97a20();
  }
  if (lVar4 != -1) {
    local_89 = 1;
    local_268 = lVar4;
    lStack_260 = lVar5;
    local_258 = lVar12;
    func_0x0001400aeba0();
    *local_a8 = local_88;
    local_c0 = (long *)(local_98 + 0x48);
    lVar12 = *(long *)(local_98 + 0x50);
    local_b8 = *(long **)(local_98 + 0x58);
    local_c8 = (long *)0x0;
    local_118 = (undefined8 *)lVar12;
    while (local_b8 != local_c8) {
      local_c8 = (long *)((long)local_c8 + 1);
      lVar12 = lVar12 + 0xb0;
      func_0x00014005eb60(lVar12);
    }
    plVar9 = local_c0;
    if (*local_c0 != 0) {
      func_0x0001400021d0();
    }
    plVar9[2] = CONCAT44(uStack_154,local_158);
    *plVar9 = (long)local_168;
    plVar9[1] = CONCAT17(uStack_159,uStack_160);
    uStack_150 = (char *)(local_258 * 0xb0 + lStack_260);
    local_168 = (long *)lStack_260;
    uStack_160 = (undefined7)lStack_260;
    uStack_159 = (undefined1)((ulong)lStack_260 >> 0x38);
    local_158 = (undefined4)local_268;
    uStack_154 = (undefined4)((ulong)local_268 >> 0x20);
    local_89 = 0;
    plVar9 = &local_280;
    func_0x0001400615c0();
    local_8a = 1;
    local_1f8 = (char *)func_0x000140a28620();
    local_1f0 = extraout_DL_00 & 1;
    local_138 = *(long *)(local_1f8 + 8);
    if (local_138 == 0) {
      local_130 = 0;
      lStack_128 = 0;
    }
    else {
      local_130 = *(long *)(local_1f8 + 0x10);
      lStack_128 = *(long *)(local_1f8 + 0x18);
    }
    local_168 = (long *)(ulong)(local_138 != 0);
    uStack_160 = 0;
    uStack_159 = 0;
    local_158 = (undefined4)local_138;
    uStack_154 = (undefined4)((ulong)local_138 >> 0x20);
    uStack_150._0_4_ = (undefined4)local_130;
    uStack_150._4_4_ = (undefined4)((ulong)local_130 >> 0x20);
    local_140 = 0;
    local_99 = 1;
    local_148 = local_168;
    local_120 = (char **)plVar9;
    func_0x0001400a0a00();
    local_168 = (long *)(ulong)(local_280 != 0);
    lStack_128 = 0;
    if (local_280 != 0) {
      lStack_128 = local_270;
    }
    uStack_160 = 0;
    uStack_159 = 0;
    local_158 = (undefined4)local_280;
    uStack_154 = (undefined4)((ulong)local_280 >> 0x20);
    uStack_150._0_4_ = (undefined4)lStack_278;
    uStack_150._4_4_ = (undefined4)((ulong)lStack_278 >> 0x20);
    local_140 = 0;
    local_138 = local_280;
    local_130 = lStack_278;
    local_120 = &local_1f8;
    local_9a = 1;
    local_9b = 1;
    local_148 = local_168;
    func_0x0001400a05d0();
    local_118 = (undefined8 *)local_2f0;
    local_c8 = (long *)(local_2e0 << 2);
    for (plVar9 = (long *)0x0; local_c0 = plVar9, local_c8 != plVar9;
        plVar9 = (long *)((long)plVar9 + 4)) {
      func_0x000140062eb0();
    }
    if (local_118 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    local_118 = (undefined8 *)local_250;
    local_b8 = local_248;
    for (lVar12 = 0; local_240 << 2 != lVar12; lVar12 = lVar12 + 4) {
      func_0x000140062eb0();
    }
    if (local_118 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    local_f8 = local_270;
    local_108 = local_280;
    lStack_100 = lStack_278;
    lVar12 = *(long *)(local_1f8 + 8);
    if (lVar12 == 0) {
      lStack_128 = 0;
    }
    else {
      local_130 = *(long *)(local_1f8 + 0x10);
      lStack_128 = *(long *)(local_1f8 + 0x18);
      uStack_160 = 0;
      uStack_159 = 0;
      local_158 = (undefined4)lVar12;
      uStack_154 = (undefined4)((ulong)lVar12 >> 0x20);
      uStack_150._0_4_ = (undefined4)local_130;
      uStack_150._4_4_ = (undefined4)((ulong)local_130 >> 0x20);
      local_140 = 0;
      local_138 = lVar12;
    }
    local_168 = (long *)(ulong)(lVar12 != 0);
    local_b8 = (long *)(local_1f8 + 8);
    local_148 = local_168;
    func_0x0001400637c0();
    lVar12 = CONCAT71(uStack_1bf,local_1c0);
    pcVar8 = local_1f8;
    while (local_1f8 = pcVar8, lVar12 != 0) {
      func_0x00014005eb60();
      func_0x0001400637c0();
      pcVar8 = local_1f8;
      lVar12 = CONCAT71(uStack_1bf,local_1c0);
    }
    local_b8[2] = local_f8;
    *local_b8 = local_108;
    local_b8[1] = lStack_100;
    if ((local_1f0 == 0) && ((*_DAT_14808a9e8 & 0x7fffffffffffffff) != 0)) {
      local_8a = 0;
      cVar7 = func_0x000145d986f0();
      if (cVar7 == '\0') {
        pcVar8[1] = '\x01';
      }
    }
    LOCK();
    cVar7 = *pcVar8;
    *pcVar8 = '\0';
    UNLOCK();
    if (cVar7 == '\x02') {
      local_8a = 0;
      func_0x000145d97a20();
    }
  }
  bVar14 = local_1e8 == -1;
  lVar12 = local_98;
  if (!bVar14) {
    uStack_150 = (char *)((long)local_228 + lVar3 * 0xc);
    local_168 = local_228;
    uStack_160 = SUB87(local_228,0);
    uStack_159 = (undefined1)((ulong)local_228 >> 0x38);
    local_158 = (undefined4)local_1e8;
    uStack_154 = (undefined4)((ulong)local_1e8 >> 0x20);
    local_82 = 0;
    local_83 = 1;
    local_84 = 1;
    func_0x000140060c50();
    local_b8 = (long *)func_0x000140a28620();
    local_c8 = (long *)CONCAT71(local_c8._1_7_,extraout_DL_01);
    local_c0 = local_b8 + 7;
    func_0x000140072c50();
    plVar9 = local_b8;
    local_c0[2] = CONCAT44(uStack_1ac,local_1b0);
    *local_c0 = CONCAT71(uStack_1bf,local_1c0);
    local_c0[1] = CONCAT71(uStack_1b7,uStack_1b8);
    if ((((ulong)local_c8 & 1) == 0) && ((*_DAT_14808a9e8 & 0x7fffffffffffffff) != 0)) {
      local_82 = 0;
      local_83 = 1;
      local_84 = 1;
      cVar7 = func_0x000145d986f0();
      if (cVar7 == '\0') {
        *(char *)((long)plVar9 + 1) = '\x01';
      }
    }
    LOCK();
    lVar3 = *plVar9;
    *(char *)plVar9 = '\0';
    UNLOCK();
    if ((char)lVar3 == '\x02') {
      local_82 = 0;
      local_83 = 1;
      local_84 = 1;
      func_0x000145d97a20();
    }
  }
  bVar15 = local_198 == -1;
  local_a9 = bVar14;
  pcVar8 = uStack_150;
  if (!bVar15) {
    local_168 = local_1e0;
    uStack_160 = (undefined7)lVar2;
    uStack_159 = (undefined1)((ulong)lVar2 >> 0x38);
    local_158 = 0;
    uStack_154 = 0;
    uStack_150._0_4_ = 0;
    uStack_150._4_4_ = 0;
    local_148 = local_1e0;
    local_140 = lVar2;
    func_0x0001401798c0();
    local_c8 = (long *)CONCAT71(local_c8._1_7_,local_1c0);
    if (local_1c0 == -1) {
      func_0x00014005e350();
    }
    else {
      local_168 = (long *)CONCAT17(uStack_1b8,uStack_1bf);
      local_158 = (undefined4)(CONCAT44(uStack_1ac,local_1b0) >> 8);
      uStack_154._3_1_ = (undefined1)uStack_1a8;
      uStack_154 = CONCAT13(uStack_154._3_1_,(int3)((uint)uStack_1ac >> 8));
      uStack_150._0_4_ = (undefined4)(CONCAT44(uStack_1a4,uStack_1a8) >> 8);
      uStack_150._4_3_ = (undefined3)((uint)uStack_1a4 >> 8);
      uStack_160 = uStack_1b7;
      uStack_159 = (undefined1)local_1b0;
    }
    *local_a8 = local_88;
    if (*(char *)(lVar12 + 0x60) != -1) {
      func_0x000140137ee0();
    }
    pcVar8 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
    *(undefined1 *)(local_98 + 0x60) = local_c8._0_1_;
    *(long **)(local_98 + 0x61) = local_168;
    *(ulong *)(local_98 + 0x69) = CONCAT17(uStack_159,uStack_160);
    *(ulong *)(local_98 + 0x70) = CONCAT35((undefined3)uStack_154,CONCAT41(local_158,uStack_159));
    *(ulong *)(local_98 + 0x78) =
         CONCAT35(uStack_150._4_3_,CONCAT41((undefined4)uStack_150,uStack_154._3_1_));
    lVar12 = local_98;
    if (local_198 != 0) {
      func_0x0001400021d0();
      pcVar8 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
    }
  }
  puVar1 = puStack_318 + local_310 * 3;
  local_c0 = (long *)(lVar12 + 0x18);
  local_208 = lVar12 + 0x28;
  local_190 = lVar12 + 0x30;
  local_220 = lVar12 + 0x40;
  local_d8 = lVar12 + 0x80;
  local_110 = lVar12 + 0xa0;
  local_118 = puStack_318 + local_310 * 3 + -3;
  uVar16 = 0;
  uVar17 = 0;
  uVar18 = 0;
  uVar19 = 0;
  local_178 = lVar12 + 0xc0;
  local_1c8 = lVar12 + 0x48;
  local_218 = lVar12 + 0x10;
  local_238 = puVar1;
  local_c9 = bVar15;
LAB_14019212c:
  do {
    uVar11 = (long)local_118 - (long)puStack_318;
    puVar13 = puStack_318 + 4;
    do {
      if (puStack_318 == puVar1) {
LAB_140193233:
        if (local_320 != 0) {
          uStack_150 = pcVar8;
          func_0x0001400021d0();
        }
        return;
      }
      puVar10 = puStack_318 + 3;
      local_248 = puVar10;
      if ((long *)*puStack_318 == (long *)0xffffffffffffffff) {
        if (puVar1 != puVar10) {
          uVar11 = uVar11 / 0x18;
          do {
            if (puVar13[-1] != 0) {
              uStack_150 = pcVar8;
              func_0x0001400021d0();
              pcVar8 = uStack_150;
            }
            puVar13 = puVar13 + 3;
            uVar11 = uVar11 - 1;
          } while (uVar11 != 0);
        }
        goto LAB_140193233;
      }
      local_168 = (long *)puStack_318[1];
      local_140 = puStack_318[2];
      uStack_160 = (undefined7)local_140;
      uStack_159 = (undefined1)((ulong)local_140 >> 0x38);
      local_158 = uVar16;
      uStack_154 = uVar17;
      uStack_150._0_4_ = uVar18;
      uStack_150._4_4_ = uVar19;
      local_148 = local_168;
      local_c8 = (long *)*puStack_318;
      local_b8 = local_168;
      func_0x0001401798c0();
      if (local_1c0 != -1) {
        local_108 = CONCAT71(uStack_1bf,local_1c0);
        lStack_100 = CONCAT71(uStack_1b7,uStack_1b8);
        local_f8 = CONCAT44(uStack_1ac,local_1b0);
        uStack_f0 = uStack_1a8;
        uStack_ec = uStack_1a4;
        local_81 = 1;
        pcVar8 = (char *)func_0x000142aeace0();
        if (pcVar8 == (char *)0x0) {
          pcVar8 = _DAT_148060290;
        }
        if ((*pcVar8 == '\x03') && (*(long *)(pcVar8 + 0x18) - 2U < 6)) {
                    /* WARNING: Could not emulate address calculation at 0x000140192274 */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((*(long *)(pcVar8 + 0x18) - 2U) * 4 + 0x145de7854) + 0x145de7854
                    ))();
          return;
        }
        local_81 = 1;
        pcVar8 = (char *)func_0x000142aeace0();
        if (pcVar8 == (char *)0x0) {
          pcVar8 = _DAT_148060290;
        }
        if ((*pcVar8 == '\x03') && (*(long *)(pcVar8 + 0x18) - 4U < 5)) {
                    /* WARNING: Could not emulate address calculation at 0x0001401924f2 */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((*(long *)(pcVar8 + 0x18) - 4U) * 4 + 0x145de7884) + 0x145de7884
                    ))();
          return;
        }
        func_0x000140137ee0();
        pcVar8 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
        puStack_318 = puVar10;
        if (local_c8 == (long *)0x0) goto LAB_14019212c;
        break;
      }
      puStack_318 = puVar10;
      func_0x00014005e350();
      pcVar8 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
      uVar11 = uVar11 - 0x18;
      puVar13 = puVar13 + 3;
    } while (local_c8 == (long *)0x0);
    func_0x0001400021d0();
    pcVar8 = (char *)CONCAT44(uStack_150._4_4_,(undefined4)uStack_150);
  } while( true );
}
