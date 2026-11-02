
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,int param_3,long param_4,long **param_5,
          long **param_6)

{
  undefined4 *puVar1;
  ushort uVar2;
  uint uVar3;
  int iVar4;
  undefined1 auVar5 [16];
  uint uVar6;
  long lVar7;
  long lVar8;
  long **extraout_RDX;
  long **pplVar9;
  long **pplVar10;
  long **extraout_RDX_00;
  long **extraout_RDX_01;
  uint uVar11;
  ulong uVar12;
  byte bVar13;
  long *plVar14;
  bool bVar15;
  undefined1 auVar16 [16];
  float fVar17;
  float fVar18;
  float fVar19;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 uVar29;
  undefined1 auVar30 [16];
  long local_1f0;
  undefined8 local_1e8;
  long *local_1d8;
  undefined1 auStack_1d0 [16];
  long *local_1b8;
  undefined1 auStack_1b0 [16];
  uint local_19c;
  long **local_198;
  long lStack_190;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  long *local_178;
  undefined1 auStack_170 [8];
  undefined8 local_168;
  long **local_160;
  undefined8 local_158;
  ulong local_150;
  long **local_148;
  undefined8 local_140;
  undefined8 local_138;
  undefined8 local_130;
  long **local_128;
  undefined8 local_120;
  long *local_118;
  undefined1 auStack_110 [16];
  undefined8 local_f8;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  auVar5._8_8_ = local_168;
  auVar5._0_8_ = auStack_170;
  local_f0 = 0xfffffffffffffffe;
  uVar11 = param_3 + *(int *)(param_4 + 0x414);
  *(uint *)(param_4 + 0x414) = uVar11;
  plVar14 = (long *)(param_4 + 0x8d8);
  fVar22 = 0.0;
  fVar19 = _DAT_145907508;
  fVar20 = _DAT_145918840;
  fVar21 = _DAT_145907518;
  fVar23 = _DAT_14590752c;
  fVar24 = _DAT_14590753c;
  fVar25 = _DAT_14590751c;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
LAB_1454c6aba:
  do {
    uVar3 = *(uint *)(param_4 + 0x410);
    fVar17 = (float)((uVar3 - 1) + (uint)(uVar3 == 0));
    _auStack_170 = auVar5;
    fVar17 = (float)func_0x00014577322f(fVar17 * fVar21 * fVar17 + fVar17 * fVar19 + fVar20);
    uVar6 = (uint)(long)fVar17;
    if (fVar17 < fVar22) {
      uVar6 = 0;
    }
    if (fVar23 < fVar17) {
      uVar6 = 0xffffffff;
    }
    if ((0x62 < uVar3) || (uVar11 < uVar6)) break;
    *(uint *)(param_4 + 0x414) = uVar11 - uVar6;
    *(uint *)(param_4 + 0x410) = uVar3 + 1;
    *(int *)(param_4 + 0x93c) = *(int *)(param_4 + 0x93c) + 1;
    lVar7 = *(long *)(param_4 + 0x8d8);
    if (lVar7 != 0) {
      lVar8 = *(long *)(param_4 + 0x8e0);
      do {
        uVar12 = (ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
        pplVar9 = (long **)0xffffffffffffffff;
        do {
          pplVar10 = (long **)(ulong)*(ushort *)(lVar7 + 0x36);
          if (uVar12 == 0) goto joined_r0x0001454c6bb7;
          uVar2 = *(ushort *)(lVar7 + 0x3a + (long)pplVar9 * 2);
          pplVar9 = (long **)((long)pplVar9 + 1);
          uVar12 = uVar12 - 2;
        } while ((char)((uVar2 < 0x22) - (0x22 < uVar2)) == '\x01');
        pplVar10 = pplVar9;
        if (uVar2 < 0x22 == 0x22 < uVar2) {
          *(uint *)(lVar7 + 8 + (long)pplVar9 * 4) = uVar3 + 1;
          goto LAB_1454c6bfc;
        }
joined_r0x0001454c6bb7:
        if (lVar8 == 0) goto LAB_1454c6bd2;
        lVar8 = lVar8 + -1;
        lVar7 = *(long *)(lVar7 + 0x50 + (long)pplVar10 * 8);
      } while( true );
    }
    lVar7 = 0;
    pplVar10 = extraout_RDX;
LAB_1454c6bd2:
    local_168 = (long **)0x0;
    local_158 = 0x22;
    local_178 = plVar14;
    auStack_170 = (undefined1  [8])lVar7;
    local_160 = pplVar10;
    func_0x00014552a730();
LAB_1454c6bfc:
    fVar17 = *(float *)(param_4 + 0x470);
    fVar18 = *(float *)(param_4 + 0x474);
    fVar26 = *(float *)(param_4 + 0x494);
    local_19c = *(uint *)(param_4 + 0x4b4);
    func_0x0001454a6a40();
    lVar7 = func_0x000145457cb0();
    if (lVar7 == 0) {
      lVar7 = 0x1469f6beb;
    }
    local_198 = &local_118;
    lStack_190 = 0x1457396f0;
    local_118._0_4_ = (*(float *)(param_4 + 0x474) - fVar18) * fVar24;
    func_0x000145728390(lVar7);
    local_1d8 = local_178;
    local_118._0_4_ = *(float *)(param_4 + 0x470) - fVar17;
    local_198 = &local_118;
    lStack_190 = 0x1457396f0;
    auStack_1d0 = _auStack_170;
    func_0x000145728390();
    local_1b8 = local_178;
    local_118 = (long *)CONCAT44(local_118._4_4_,*(float *)(param_4 + 0x494) - fVar26);
    pplVar9 = &local_118;
    lStack_190 = 0x1457396f0;
    local_198 = pplVar9;
    auStack_1b0 = _auStack_170;
    func_0x000145728390();
    auVar5 = _auStack_170;
    local_118 = local_178;
    local_178 = (long *)0x1469f6b34;
    auStack_170 = (undefined1  [8])0x6;
    local_168 = &local_1d8;
    local_160 = (long **)0x1469f6c50;
    local_158 = 0x1469f6c70;
    local_150 = 6;
    local_148 = &local_1b8;
    local_140 = 0x1469f6c50;
    local_138 = 0x1469f6b50;
    local_130 = 5;
    local_120 = 0x1469f6c50;
    param_6 = &local_178;
    local_128 = pplVar9;
    auStack_110 = auVar5;
    func_0x000145458060();
    local_f8 = local_1e8;
    func_0x00014545dc90();
    lVar7 = *(long *)(param_4 + 0x560);
    if (lVar7 == *(long *)(param_4 + 0x550)) {
      func_0x000145774710();
    }
    lVar8 = *(long *)(param_4 + 0x558);
    puVar1 = (undefined4 *)(lVar8 + 0x10 + lVar7 * 0x20);
    *puVar1 = local_188;
    puVar1[1] = uStack_184;
    puVar1[2] = uStack_180;
    puVar1[3] = uStack_17c;
    plVar14 = (long *)(lVar8 + lVar7 * 0x20);
    *plVar14 = (long)local_198;
    plVar14[1] = lStack_190;
    *(long *)(param_4 + 0x560) = lVar7 + 1;
    if (local_1f0 != 0) {
      func_0x0001400021d0();
    }
    if (local_118 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (local_1b8 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (local_1d8 != (long *)0x0) {
      func_0x0001400021d0();
    }
    lVar7 = 0;
    do {
      if (*(long *)(param_4 + 0x2b8) * 0x58 - lVar7 == 0) goto LAB_1454c6fd0;
      plVar14 = (long *)(*(long *)(param_4 + 0x2b0) + lVar7);
      lVar7 = lVar7 + 0x58;
    } while (*(char *)(*plVar14 + 0x75) != '\x06');
    if (local_19c < *(uint *)(param_4 + 0x4b4)) {
      func_0x000145457cb0();
      uVar11 = *(uint *)(param_4 + 0x4b4);
      if (2 < uVar11) {
        uVar11 = 3;
      }
      local_1b8 = (long *)(ulong)(uVar11 + 1);
      local_178 = (long *)0x1469f6470;
      auStack_170 = (undefined1  [8])0x1;
      local_168 = &local_1b8;
      local_160 = (long **)0x1469f6cc0;
      param_6 = &local_178;
      func_0x000145458060();
      local_f8 = auStack_110._0_8_;
      func_0x00014545dc90();
      lVar7 = *(long *)(param_4 + 0x560);
      if (lVar7 == *(long *)(param_4 + 0x550)) {
        func_0x000145774710();
      }
      lVar8 = *(long *)(param_4 + 0x558);
      puVar1 = (undefined4 *)(lVar8 + 0x10 + lVar7 * 0x20);
      *puVar1 = local_188;
      puVar1[1] = uStack_184;
      puVar1[2] = uStack_180;
      puVar1[3] = uStack_17c;
      plVar14 = (long *)(lVar8 + lVar7 * 0x20);
      *plVar14 = (long)local_198;
      plVar14[1] = lStack_190;
      *(long *)(param_4 + 0x560) = lVar7 + 1;
      if (local_118 != (long *)0x0) {
        func_0x0001400021d0();
      }
    }
LAB_1454c6fd0:
    uVar27 = 0;
    uVar28 = 0;
    uVar29 = 0;
    fVar26 = *(float *)(param_4 + 0x470) * fVar25;
    auVar30 = func_0x000145457cb0();
    fVar17 = *(float *)(param_4 + 0x418);
    fVar26 = fVar26 + fVar17;
    fVar18 = fVar26;
    if (*(float *)(param_4 + 0x470) <= fVar26) {
      fVar18 = *(float *)(param_4 + 0x470);
    }
    auVar16._4_4_ = uVar27;
    auVar16._0_4_ = (uint)fVar26 & -(uint)NAN(fVar18);
    auVar16._8_4_ = uVar28;
    auVar16._12_4_ = uVar29;
    auVar16 = ZEXT416(~-(uint)NAN(fVar18) & (uint)fVar18) | auVar16;
    fVar18 = auVar16._0_4_;
    *(float *)(param_4 + 0x418) = fVar18;
    fVar18 = fVar18 - fVar17;
    if (fVar22 < fVar18) {
      if (auVar30._0_8_ == 0) {
        auVar30._8_8_ = 8;
        auVar30._0_8_ = 0x1469f6ce0;
      }
      local_178 = (long *)0xffffffffffffffff;
      local_160 = (long **)0x1469f6ce8;
      local_158 = 0x13;
      local_150 = local_150 & 0xffffffffffffff00;
      _auStack_170 = auVar30;
      func_0x0001455021b0(auVar16._0_8_,fVar18,(double)fVar18);
    }
    fVar17 = (float)func_0x00014577327d();
    uVar27 = (undefined4)(long)fVar17;
    if (fVar17 < fVar22) {
      uVar27 = 0;
    }
    if (fVar23 < fVar17) {
      uVar27 = 0xffffffff;
    }
    fVar17 = (float)func_0x00014577327d();
    uVar11 = (uint)(long)fVar17;
    if (fVar17 < fVar22) {
      uVar11 = 0;
    }
    if (fVar23 < fVar17) {
      uVar11 = 0xffffffff;
    }
    plVar14 = (long *)(param_4 + 0x8d8);
    lVar7 = *plVar14;
    if (lVar7 != 0) {
      lVar8 = *(long *)(param_4 + 0x8e0);
      do {
        param_6 = (long **)(ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
        pplVar9 = (long **)0xffffffffffffffff;
        do {
          if (param_6 == (long **)0x0) {
            param_6 = (long **)0x0;
            pplVar9 = (long **)(ulong)*(ushort *)(lVar7 + 0x36);
            goto joined_r0x0001454c7167;
          }
          uVar2 = *(ushort *)(lVar7 + 0x3a + (long)pplVar9 * 2);
          pplVar9 = (long **)((long)pplVar9 + 1);
          param_6 = (long **)((long)param_6 + -2);
        } while ((char)((uVar2 < 0x16) - (0x16 < uVar2)) == '\x01');
        if (uVar2 < 0x16 == 0x16 < uVar2) {
          *(undefined4 *)(lVar7 + 8 + (long)pplVar9 * 4) = uVar27;
          lVar7 = *plVar14;
          pplVar10 = local_160;
          auVar5 = _auStack_170;
          goto joined_r0x0001454c718b;
        }
joined_r0x0001454c7167:
        if (lVar8 == 0) goto LAB_1454c7209;
        lVar8 = lVar8 + -1;
        lVar7 = *(long *)(lVar7 + 0x50 + (long)pplVar9 * 8);
      } while( true );
    }
    lVar7 = 0;
    pplVar9 = extraout_RDX_00;
LAB_1454c7209:
    local_168 = (long **)0x0;
    local_158 = 0x16;
    local_178 = plVar14;
    auStack_170 = (undefined1  [8])lVar7;
    local_160 = pplVar9;
    func_0x00014552a730();
    auVar5._8_8_ = local_168;
    auVar5._0_8_ = auStack_170;
    pplVar9 = extraout_RDX_01;
    lVar7 = *plVar14;
    pplVar10 = local_160;
joined_r0x0001454c718b:
    auStack_170 = (undefined1  [8])lVar7;
    local_160 = pplVar9;
    if (auStack_170 != (undefined1  [8])0x0) {
      lVar7 = *(long *)(param_4 + 0x8e0);
      do {
        param_6 = (long **)(ulong)((uint)*(ushort *)((long)auStack_170 + 0x36) * 2);
        local_160 = (long **)0xffffffffffffffff;
        do {
          if (param_6 == (long **)0x0) {
            param_6 = (long **)0x0;
            local_160 = (long **)(ulong)*(ushort *)((long)auStack_170 + 0x36);
            goto joined_r0x0001454c71f7;
          }
          uVar2 = *(ushort *)((long)auStack_170 + 0x3a + (long)local_160 * 2);
          local_160 = (long **)((long)local_160 + 1);
          param_6 = (long **)((long)param_6 + -2);
        } while ((char)((uVar2 < 0x1c) - (0x1c < uVar2)) == '\x01');
        if (uVar2 < 0x1c == 0x1c < uVar2) {
          *(uint *)((long)auStack_170 + 8 + (long)local_160 * 4) = uVar11;
          uVar11 = *(uint *)(param_4 + 0x414);
          param_5 = (long **)0x0;
          local_160 = pplVar10;
          goto LAB_1454c6aba;
        }
joined_r0x0001454c71f7:
        if (lVar7 == 0) goto LAB_1454c7241;
        lVar7 = lVar7 + -1;
        auStack_170 = *(undefined1 (*) [8])((long)auStack_170 + 0x50 + (long)local_160 * 8);
      } while( true );
    }
    auStack_170 = (undefined1  [8])0x0;
LAB_1454c7241:
    local_168 = (long **)0x0;
    local_158 = 0x1c;
    param_5 = (long **)(ulong)uVar11;
    local_178 = plVar14;
    func_0x00014552a730();
    auVar5._8_8_ = local_168;
    auVar5._0_8_ = auStack_170;
    uVar11 = *(uint *)(param_4 + 0x414);
  } while( true );
  lVar7 = *plVar14;
  if (lVar7 != 0) {
    lVar8 = *(long *)(param_4 + 0x8e0);
    do {
      param_6 = (long **)(ulong)*(ushort *)(lVar7 + 0x36);
      uVar12 = (ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
      pplVar9 = (long **)0xffffffffffffffff;
      do {
        param_5 = param_6;
        if (uVar12 == 0) goto LAB_1454c72e3;
        uVar2 = *(ushort *)(lVar7 + 0x3a + (long)pplVar9 * 2);
        bVar13 = (uVar2 < 0x2cc) - (0x2cc < uVar2);
        param_5 = (long **)((long)pplVar9 + 1);
        uVar12 = uVar12 - 2;
        pplVar9 = param_5;
      } while (bVar13 == 1);
      param_6 = (long **)(ulong)bVar13;
      if (bVar13 == 0) {
        *(uint *)(lVar7 + 8 + (long)param_5 * 4) = uVar11;
        goto LAB_1454c7324;
      }
LAB_1454c72e3:
      bVar15 = lVar8 == 0;
      lVar8 = lVar8 + -1;
      if (bVar15) goto LAB_1454c72f9;
      lVar7 = *(long *)(lVar7 + 0x50 + (long)param_5 * 8);
    } while( true );
  }
  lVar7 = 0;
LAB_1454c72f9:
  local_168 = (long **)0x0;
  local_158 = 0x2cc;
  local_178 = plVar14;
  auStack_170 = (undefined1  [8])lVar7;
  local_160 = param_5;
  func_0x00014552a730();
LAB_1454c7324:
  fVar19 = (float)(*(int *)(param_4 + 0x410) + -1 + (uint)(*(int *)(param_4 + 0x410) == 0));
  fVar19 = (float)func_0x00014577322f(_DAT_145907518 * fVar19 * fVar19 +
                                      _DAT_145907508 * fVar19 + _DAT_145918840);
  uVar27 = (int)(long)fVar19;
  if (fVar19 < 0.0) {
    uVar27 = 0;
  }
  uVar28 = 0xffffffff;
  if (fVar19 <= _DAT_14590752c) {
    uVar28 = uVar27;
  }
  lVar7 = *(long *)(param_4 + 0x8d8);
  if (lVar7 != 0) {
    lVar8 = *(long *)(param_4 + 0x8e0);
    do {
      uVar12 = (ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
      pplVar9 = (long **)0xffffffffffffffff;
      do {
        param_6 = (long **)(ulong)*(ushort *)(lVar7 + 0x36);
        if (uVar12 == 0) goto LAB_1454c73e3;
        uVar2 = *(ushort *)(lVar7 + 0x3a + (long)pplVar9 * 2);
        param_6 = (long **)((long)pplVar9 + 1);
        uVar12 = uVar12 - 2;
        pplVar9 = param_6;
      } while ((char)((uVar2 < 0x2cd) - (0x2cd < uVar2)) == '\x01');
      if (uVar2 < 0x2cd == 0x2cd < uVar2) {
        *(undefined4 *)(lVar7 + 8 + (long)param_6 * 4) = uVar28;
        iVar4 = *(int *)(param_4 + 0x93c);
        goto joined_r0x0001454c73fc;
      }
LAB_1454c73e3:
      bVar15 = lVar8 == 0;
      lVar8 = lVar8 + -1;
      if (bVar15) goto LAB_1454c7402;
      lVar7 = *(long *)(lVar7 + 0x50 + (long)param_6 * 8);
    } while( true );
  }
  lVar7 = 0;
LAB_1454c7402:
  local_168 = (long **)0x0;
  local_158 = 0x2cd;
  local_178 = plVar14;
  auStack_170 = (undefined1  [8])lVar7;
  local_160 = param_6;
  func_0x00014552a730();
  iVar4 = *(int *)(param_4 + 0x93c);
joined_r0x0001454c73fc:
  if ((((iVar4 != 0) && (*(char *)(param_4 + 0x9b9) == '\x01')) &&
      (*(char *)(param_4 + 0x9b2) == '\0')) &&
     ((*(char *)(param_4 + 0x9ae) != '\x01' || (*(char *)(param_4 + 0x9af) != '\0')))) {
    func_0x0001454ec7a0();
  }
  return;
}
