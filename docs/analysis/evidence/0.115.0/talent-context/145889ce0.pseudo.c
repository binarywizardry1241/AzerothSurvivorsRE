/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined4 *param_4)

{
  long *plVar1;
  char *pcVar2;
  int *piVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  code *pcVar7;
  long lVar8;
  ulong ******ppppppuVar9;
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 uVar13;
  ulong *******pppppppuVar14;
  ulong *******pppppppuVar15;
  undefined4 uVar16;
  uint uVar17;
  uint uVar18;
  long lVar19;
  undefined4 *puVar20;
  undefined1 *puVar21;
  uint uVar22;
  ulong uVar23;
  ulong *******pppppppuVar24;
  uint extraout_EDX;
  uint uVar25;
  ulong uVar26;
  long lVar27;
  long lVar28;
  ulong ******ppppppuVar29;
  undefined8 uVar30;
  char cVar31;
  uint uVar32;
  ulong ******ppppppuVar33;
  long lVar34;
  int iVar35;
  ulong ******ppppppuVar36;
  ulong *******pppppppuVar37;
  ulong ******ppppppuVar38;
  undefined4 *puVar39;
  ulong *******pppppppuVar40;
  bool bVar41;
  float fVar42;
  undefined4 in_XMM6_Da;
  float fVar43;
  undefined4 in_XMM7_Da;
  float fVar44;
  float fVar45;
  float fVar46;
  float fVar47;
  ulong *******local_328;
  undefined4 *local_320;
  ulong *******local_318;
  undefined1 local_310;
  undefined4 local_30f;
  undefined3 uStack_30b;
  long local_308;
  long local_2f0;
  long local_2d8;
  long local_2c0;
  float local_2a8;
  uint local_2a4;
  uint local_2a0;
  uint local_294;
  float local_28c;
  float local_288;
  byte local_283;
  char local_281;
  byte local_280;
  undefined8 local_250;
  undefined8 uStack_248;
  undefined8 local_240;
  undefined8 uStack_238;
  long local_230;
  ulong ******ppppppuStack_228;
  ulong ******local_220;
  undefined1 local_218 [16];
  undefined4 *local_208;
  long local_200;
  ulong *******local_1f8;
  ulong local_1f0;
  ulong *******local_1e8;
  undefined4 *local_1e0;
  ulong *******local_1d8;
  undefined1 local_1d0;
  long local_1c8;
  ulong local_1c0;
  ulong *******local_1b8;
  undefined4 *puStack_1b0;
  ulong *******local_1a8;
  undefined8 local_1a0;
  undefined8 local_198;
  undefined8 local_190;
  int *local_188;
  undefined8 local_180;
  undefined8 local_178;
  undefined8 local_170;
  ulong *******local_168;
  undefined8 local_160;
  uint local_124;
  long local_120;
  ulong *******local_118;
  undefined4 *puStack_110;
  long local_108;
  undefined4 local_f0;
  undefined3 uStack_ec;
  undefined4 *local_e8;
  uint local_dc;
  ulong *******local_d8;
  int local_cc;
  undefined4 *local_c8;
  ulong *******local_c0;
  byte local_b1;
  ulong *******local_b0;
  undefined1 local_a8;
  undefined1 local_a7;
  undefined1 local_a6;
  undefined1 local_a5;
  undefined1 local_a4;
  undefined1 local_a3;
  char local_a2;
  undefined1 local_a1;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  local_a0 = 0xfffffffffffffffe;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  func_0x00014588f240(param_1,param_4,param_4,&local_1b8);
  if (local_1b8 == (ulong *******)0xffffffffffffffff) {
    return;
  }
  func_0x000145d145fb();
  if ((byte)(local_281 - 6U) < 0xfb) goto LAB_14588af05;
  local_124 = local_2a4;
  ppppppuVar33 = (ulong ******)0x0;
  fVar46 = 0.0;
  ppppppuVar36 = (ulong ******)((long)local_2a8 & 0xffffffff);
  if (local_2a8 < 0.0) {
    ppppppuVar36 = ppppppuVar33;
  }
  uVar18 = (uint)ppppppuVar36;
  if (_DAT_145f00bb4 < local_2a8) {
    uVar18 = 0xffffffff;
  }
  local_1c8 = *(long *)(param_4 + 0x5c0);
  local_1c0 = (ulong)local_280;
  fVar47 = _DAT_145f00bb4;
  local_c8 = param_4;
  lVar19 = func_0x0001458095e0();
  uVar4 = *(undefined8 *)(lVar19 * 0xf0 + 0x146cc0d10);
  uVar5 = *(undefined8 *)(lVar19 * 0xf0 + 0x146cc0d18);
  fVar44 = (float)local_2a0 / local_28c;
  local_c0 = (ulong *******)func_0x0001458095e0();
  ppppppuVar36 = (ulong ******)(long)fVar44;
  if (fVar44 < fVar46) {
    ppppppuVar36 = ppppppuVar33;
  }
  uVar23 = (ulong)ppppppuVar36 & 0xffffffff;
  if (fVar47 < fVar44) {
    uVar23 = 0xffffffff;
  }
  lVar19 = (ulong)local_294 * 8;
  fVar45 = (float)uVar23 * _DAT_145ee05c0;
  fVar44 = (float)func_0x000145d1463d(fVar45);
  ppppppuVar36 = (ulong ******)(long)fVar44;
  if (_DAT_145f6d3c0 < fVar44) {
    ppppppuVar36 = (ulong ******)0x7fffffffffffffff;
  }
  if (NAN(fVar44)) {
    ppppppuVar36 = ppppppuVar33;
  }
  fVar43 = (local_2a8 / _DAT_145ef41f8) * _DAT_145edff10;
  fVar44 = _DAT_145f6d3c0;
  fVar42 = (float)func_0x000145d1463d(fVar43);
  local_250 = (ulong ******)(long)fVar42;
  if (fVar44 < fVar42) {
    local_250 = (ulong ******)0x7fffffffffffffff;
  }
  if (NAN(fVar42)) {
    local_250 = ppppppuVar33;
  }
  local_b1 = local_283;
  ppppppuVar29 = (ulong ******)0xffffffffffffff38;
  if (local_283 == 0) {
    ppppppuVar29 = ppppppuVar33;
  }
  ppppppuVar38 = (ulong ******)0xc8;
  fVar42 = _DAT_145f043e0;
  if (local_283 == 0) {
    fVar42 = 0.0;
    ppppppuVar38 = ppppppuVar33;
  }
  fVar45 = (float)func_0x000145d1463d((((float)(int)local_c0 * _DAT_145ef0780) / _DAT_14605cb50 +
                                      _DAT_145edfeb0) *
                                      ((float)local_294 * _DAT_145ee05bc + fVar43 + fVar45 + fVar42)
                                     );
  ppppppuVar9 = (ulong ******)(long)fVar45;
  if (fVar45 < fVar46) {
    ppppppuVar9 = ppppppuVar33;
  }
  uVar23 = (ulong)ppppppuVar9 & 0xffffffff;
  if (fVar47 < fVar45) {
    uVar23 = 0xffffffff;
  }
  lVar34 = (long)local_250 + lVar19 * 5 + (long)ppppppuVar36;
  local_230 = (long)ppppppuVar29 + (uVar23 - lVar34);
  lVar34 = (long)ppppppuVar38 + local_230 + lVar34;
  uStack_248 = ppppppuVar36;
  local_240 = lVar19 * 5;
  uStack_238 = ppppppuVar38;
  fVar46 = (float)func_0x000145d1463d((local_288 + _DAT_145edff18) * (float)lVar34);
  puVar39 = local_c8;
  ppppppuStack_228 = (ulong ******)(long)fVar46;
  ppppppuVar36 = (ulong ******)0x7fffffffffffffff;
  if (fVar44 < fVar46) {
    ppppppuStack_228 = (ulong ******)0x7fffffffffffffff;
  }
  if (NAN(fVar46)) {
    ppppppuStack_228 = ppppppuVar33;
  }
  fVar46 = (float)func_0x000145d1463d((float)((long)ppppppuStack_228 + lVar34) *
                                      (float)local_c8[0x5f2]);
  local_220 = (ulong ******)(long)fVar46;
  if (fVar44 < fVar46) {
    local_220 = ppppppuVar36;
  }
  if (NAN(fVar46)) {
    local_220 = ppppppuVar33;
  }
  puVar20 = puVar39 + 0x5c2;
  local_1a8 = (ulong *******)0x0;
  local_1a0 = 7;
  local_1b8 = (ulong *******)&local_250;
  puStack_1b0 = puVar20;
  func_0x0001459d6030();
  auVar12._8_8_ = local_218._8_8_;
  auVar12._0_8_ = local_218._0_8_;
  auVar11._8_8_ = local_218._8_8_;
  auVar11._0_8_ = local_218._0_8_;
  lVar19 = local_1c8;
  if (local_1f0 == 0) {
    local_cc = 0;
    *(ulong *******)(puVar20 + 0xc) = local_220;
    *(long *)(puVar20 + 8) = local_230;
    *(ulong *******)(puVar20 + 10) = ppppppuStack_228;
    *(long *)(puVar20 + 4) = local_240;
    *(ulong *******)(puVar20 + 6) = uStack_238;
    *puVar20 = (undefined4)local_250;
    puVar20[1] = local_250._4_4_;
    puVar20[2] = (undefined4)uStack_248;
    puVar20[3] = uStack_248._4_4_;
    bVar41 = local_1c8 != 0xffffff;
    local_a2 = '\x01';
  }
  else {
    if (local_1f0 < 5) {
      uVar23 = 0;
      lVar34 = 0;
    }
    else {
      uVar23 = 4;
      if ((local_1f0 & 3) != 0) {
        uVar23 = (ulong)((uint)local_1f0 & 3);
      }
      uVar23 = local_1f0 - uVar23;
      pppppppuVar24 = local_1f8 + 5;
      lVar34 = 0;
      lVar28 = 0;
      lVar27 = 0;
      lVar8 = 0;
      uVar26 = uVar23;
      do {
        lVar27 = lVar27 + (long)pppppppuVar24[-4];
        lVar8 = lVar8 + (long)pppppppuVar24[-2];
        lVar34 = lVar34 + (long)*pppppppuVar24;
        lVar28 = lVar28 + (long)pppppppuVar24[2];
        pppppppuVar24 = pppppppuVar24 + 8;
        uVar26 = uVar26 - 4;
      } while (uVar26 != 0);
      lVar34 = lVar28 + lVar8 + lVar34 + lVar27;
    }
    pppppppuVar24 = local_1f8 + uVar23 * 2 + 1;
    do {
      lVar34 = lVar34 + (long)*pppppppuVar24;
      uVar23 = uVar23 + 1;
      pppppppuVar24 = pppppppuVar24 + 2;
    } while (local_1f0 != uVar23);
    lVar28 = 0;
    if (0 < lVar34) {
      lVar28 = lVar34;
    }
    local_cc = (int)lVar28;
    *(ulong *******)(puVar20 + 0xc) = local_220;
    *(long *)(puVar20 + 8) = local_230;
    *(ulong *******)(puVar20 + 10) = ppppppuStack_228;
    puVar20[4] = (undefined4)local_240;
    puVar20[5] = local_240._4_4_;
    puVar20[6] = (undefined4)uStack_238;
    puVar20[7] = uStack_238._4_4_;
    *puVar20 = (undefined4)local_250;
    puVar20[1] = local_250._4_4_;
    puVar20[2] = (undefined4)uStack_248;
    puVar20[3] = uStack_248._4_4_;
    local_a2 = '\x01';
    bVar41 = local_1c8 != 0xffffff;
    local_218 = auVar11;
    if ((bVar41) && (local_218 = auVar12, local_cc != 0)) {
      lVar19 = 0;
      do {
        if (*(long *)(puVar39 + 0x402) << 5 == lVar19) break;
        pcVar2 = (char *)(*(long *)(puVar39 + 0x400) + 4 + lVar19);
        lVar19 = lVar19 + 0x20;
      } while (*pcVar2 != (char)local_1c0);
      local_a2 = 1;
      uVar16 = func_0x00014582b910();
      local_e8 = (undefined4 *)CONCAT44(local_e8._4_4_,uVar16);
      local_a2 = 1;
      local_dc = extraout_EDX;
      func_0x000145831e10();
      uVar32 = 0;
      lVar19 = 0;
      do {
        if (*(long *)(puVar39 + 0x402) << 5 == lVar19) goto LAB_14588a228;
        lVar34 = lVar19 + 0x20;
        pcVar2 = (char *)(*(long *)(puVar39 + 0x400) + 4 + lVar19);
        lVar19 = lVar34;
      } while (*pcVar2 != (char)local_1c0);
      uVar32 = *(uint *)(*(long *)(puVar39 + 0x400) + -0x20 + lVar34);
LAB_14588a228:
      uVar17 = 0x6e;
      do {
        uVar22 = uVar32 - (uVar17 - 0x1e);
        if (((uVar32 < uVar17 - 0x1e) || (uVar25 = uVar22 - (uVar17 - 0xf), uVar22 < uVar17 - 0xf))
           || (uVar32 = uVar25 - uVar17, uVar25 < uVar17)) break;
        uVar17 = uVar17 + 0x2d;
      } while (uVar17 != 0x36b);
      uVar32 = (int)local_1c0 - 2;
      if ((byte)uVar32 < 10) {
        lVar19 = *(long *)((ulong)(uVar32 & 0xff) * 8 + 0x14702e2b8);
      }
      else {
        lVar19 = 0x146cc3058;
      }
      local_118 = (ulong *******)(lVar19 + 0x10);
      puStack_110 = (undefined4 *)0x1400020c0;
      local_a2 = 1;
      func_0x000145ce7350();
      uVar30 = *(undefined8 *)(lVar19 + 0x20);
      uVar6 = *(undefined8 *)(lVar19 + 0x28);
      local_c0 = (ulong *******)puStack_1b0;
      local_d8 = local_1f8;
      local_218 = func_0x0001458dff90();
      if (local_1b8 != (ulong *******)0x0) {
        func_0x0001400021d0();
      }
      auVar10._8_8_ = uVar6;
      auVar10._0_8_ = uVar30;
      if (local_218._0_8_ == 0) {
        local_218 = auVar10;
      }
      func_0x000140002200();
      local_c0 = (ulong *******)0x1;
      puVar20 = (undefined4 *)func_0x0001400021c0();
      puVar39 = local_c8;
      if (puVar20 == (undefined4 *)0x0) {
        local_a2 = 1;
        func_0x000145eb6fcb();
LAB_14588b0a2:
                    /* WARNING: Does not return */
        pcVar7 = (code *)invalidInstructionException();
        (*pcVar7)();
      }
      *(undefined1 *)puVar20 = 0x5b;
      pppppppuVar37 = local_d8 + local_1f0 * 2;
      local_b0 = (ulong *******)0x1;
      local_208 = puVar20;
      pppppppuVar15 = local_b0;
      lVar19 = local_200;
      pppppppuVar24 = local_1e8;
      pppppppuVar14 = local_1d8;
      uVar13 = local_1d0;
      local_1e8 = local_c0;
      local_1d0 = 1;
      for (pppppppuVar40 = local_d8; local_1d8 = pppppppuVar15, local_c0 = local_1e8,
          local_b0 = local_1d8, pppppppuVar40 != pppppppuVar37; pppppppuVar40 = pppppppuVar40 + 2) {
        while ((long)pppppppuVar40[1] < 1) {
          pppppppuVar40 = pppppppuVar40 + 2;
          if (pppppppuVar40 == pppppppuVar37) goto LAB_14588a63c;
        }
        ppppppuVar36 = *pppppppuVar40;
        local_1e0 = local_208;
        local_120 = lVar19;
        func_0x000140002200();
        puVar20 = (undefined4 *)func_0x0001400021c0();
        if (puVar20 == (undefined4 *)0x0) {
          local_a4 = 1;
          func_0x000145eb6fcb();
          goto LAB_14588b0a2;
        }
        *(undefined1 *)puVar20 = 0x7b;
        local_1b8 = (ulong *******)0x1;
        local_1a8 = (ulong *******)0x1;
        local_1a0 = CONCAT71(local_1a0._1_7_,1);
        puStack_1b0 = puVar20;
        if (ppppppuVar36 == (ulong ******)0x5) {
          local_a6 = 1;
          func_0x0001458dff90();
        }
        else {
          local_a6 = 1;
          func_0x0001458dff90();
          if (ppppppuVar36 < (ulong ******)0x5) {
            local_b0 = *(ulong ********)((long)ppppppuVar36 * 0x10 + 0x14702cb80);
            local_a6 = 1;
            func_0x0001458dff90();
          }
        }
        local_a6 = 0;
        func_0x000145858350();
        local_a4 = 1;
        func_0x00014584ec40();
        pppppppuVar24 = local_1a8;
        if (local_1b8 == local_1a8) {
          func_0x000145d14a10();
        }
        *(undefined1 *)((long)puStack_1b0 + (long)pppppppuVar24) = 0x7d;
        local_108 = (long)pppppppuVar24 + 1;
        local_118 = local_1b8;
        puStack_110 = puStack_1b0;
        local_a4 = 0;
        func_0x000145855000();
        local_208 = local_320;
        pppppppuVar15 = local_318;
        lVar19 = local_120;
        pppppppuVar24 = local_1e8;
        pppppppuVar14 = local_1d8;
        uVar13 = local_1d0;
        local_f0 = local_30f;
        uStack_ec = uStack_30b;
        local_1e8 = local_328;
        local_1d0 = local_310;
      }
LAB_14588a63c:
      uVar23 = (ulong)local_120 >> 8;
      local_120 = CONCAT71((int7)uVar23,local_1d0);
      local_1d0 = uVar13;
      if (lVar19 != 0) {
        local_1e8 = pppppppuVar24;
        local_1d8 = pppppppuVar14;
        func_0x0001400021d0();
        pppppppuVar24 = local_1e8;
        pppppppuVar14 = local_1d8;
      }
      local_1d8 = pppppppuVar14;
      local_1e8 = pppppppuVar24;
      func_0x000140002200();
      puVar21 = (undefined1 *)func_0x0001400021c0();
      uVar32 = local_dc;
      if (puVar21 == (undefined1 *)0x0) {
        local_a1 = 1;
        func_0x000145eb6fcb();
        goto LAB_14588b0a2;
      }
      *puVar21 = 0x7b;
      local_1b8 = (ulong *******)0x1;
      local_1a8 = (ulong *******)0x1;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      local_a1 = 1;
      uVar17 = (uint)local_e8;
      puStack_1b0 = (undefined4 *)puVar21;
      func_0x000145858350();
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x00014584f0c0();
      iVar35 = uVar32 - uVar17;
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x00014584f0c0();
      local_a1 = 1;
      func_0x000145858350();
      local_1b8 = local_c0;
      puStack_1b0 = local_208;
      local_1a8 = local_b0;
      local_1a0 = CONCAT44(CONCAT31(uStack_ec,local_f0._3_1_),
                           (int)CONCAT41(local_f0,(char)local_120));
      if (local_c0 == local_b0) {
        func_0x000145d14a10();
        puVar39 = local_c8;
        uVar32 = local_dc;
        uVar17 = (uint)local_e8;
      }
      *(undefined1 *)((long)puStack_1b0 + (long)local_b0) = 0x5d;
      local_1d8 = (ulong *******)((long)local_b0 + 1);
      local_1e8 = local_1b8;
      local_1e0 = puStack_1b0;
      local_a7 = 0;
      pppppppuVar24 = (ulong *******)&local_118;
      func_0x000145858210();
      pppppppuVar14 = local_1a8;
      if (local_1b8 == local_1a8) {
        func_0x000145d14a10();
        *(undefined1 *)((long)puStack_1b0 + (long)pppppppuVar14) = 0x7d;
        puVar39 = local_c8;
        uVar32 = local_dc;
        uVar17 = (uint)local_e8;
        if (local_c8[4] == 2) goto LAB_14588a957;
LAB_14588a973:
        local_b0 = local_1b8;
        local_c8 = puStack_1b0;
        if (iVar35 == 1) {
          local_a3 = 1;
          func_0x0001458dff90();
          local_1b8 = (ulong *******)0x14702c774;
          puStack_1b0 = (undefined4 *)0x5;
          local_1a8 = (ulong *******)local_218;
          local_1a0 = 0x14702c750;
          local_198 = 0x14702ca16;
          local_190 = 2;
          local_188 = &local_cc;
          local_180 = 0x14702ca98;
          local_a3 = 1;
          func_0x0001458e0370();
        }
        else if (uVar17 < uVar32) {
          local_a3 = 1;
          func_0x0001458dff90();
          local_1e8 = (ulong *******)CONCAT44(local_1e8._4_4_,iVar35);
          local_1b8 = (ulong *******)0x14702c774;
          puStack_1b0 = (undefined4 *)0x5;
          local_1a8 = (ulong *******)local_218;
          local_1a0 = 0x14702c750;
          local_198 = 0x14702ca16;
          local_190 = 2;
          local_188 = &local_cc;
          local_180 = 0x14702ca98;
          local_178 = 0x14702cb3d;
          local_170 = 1;
          local_168 = (ulong *******)&local_1e8;
          local_160 = 0x14702ca98;
          local_a3 = 1;
          func_0x0001458e0370();
        }
        else {
          local_a3 = 1;
          func_0x0001458dff90();
          local_1b8 = (ulong *******)0x14702c774;
          puStack_1b0 = (undefined4 *)0x5;
          local_1a8 = (ulong *******)local_218;
          local_1a0 = 0x14702c750;
          local_198 = 0x14702ca16;
          local_190 = 2;
          local_188 = &local_cc;
          local_180 = 0x14702ca98;
          local_a3 = 1;
          func_0x0001458e0370();
        }
        local_1e0 = (undefined4 *)0x1400020e0;
        local_a8 = 1;
        local_1e8 = pppppppuVar24;
        func_0x000145ce7350();
        lVar19 = local_1c8;
        local_d8 = local_1b8;
        local_a5 = 1;
        local_e8 = puStack_1b0;
        func_0x0001459ae7c0();
        local_a5 = 1;
        func_0x0001458776b0();
        if (puVar39[4] == 2) {
          (**(code **)(*(long *)(puVar39 + 0x5be) + 0x18))();
          if (local_b0 != (ulong *******)0x0) {
            func_0x0001400021d0();
          }
        }
        else {
          lVar34 = *(long *)(puVar39 + 0x19a);
          if (lVar34 == *(long *)(puVar39 + 0x196)) {
            func_0x000145d14e50();
          }
          lVar28 = *(long *)(puVar39 + 0x198);
          *(ulong ********)(lVar28 + lVar34 * 0x18) = local_b0;
          *(undefined4 **)(lVar28 + 8 + lVar34 * 0x18) = local_c8;
          *(long *)(lVar28 + 0x10 + lVar34 * 0x18) = (long)pppppppuVar14 + 1;
          *(long *)(puVar39 + 0x19a) = lVar34 + 1;
        }
        pppppppuVar40 = local_118;
        if (local_d8 != (ulong *******)0x0) {
          func_0x0001400021d0();
          pppppppuVar40 = local_118;
        }
      }
      else {
        *(undefined1 *)((long)puStack_1b0 + (long)local_1a8) = 0x7d;
        if (puVar39[4] != 2) goto LAB_14588a973;
LAB_14588a957:
        lVar19 = local_1c8;
        pppppppuVar40 = local_1b8;
        if (((uint)puVar39[0x316] < 2) && ((*(byte *)((long)puVar39 + 0xf49) & 1) != 0))
        goto LAB_14588a973;
      }
      if (pppppppuVar40 != (ulong *******)0x0) {
        func_0x0001400021d0();
      }
      bVar41 = true;
      local_a2 = '\0';
    }
  }
  lVar28 = *(long *)(puVar39 + 1000);
  lVar27 = 0;
  lVar34 = lVar28;
  do {
    if (*(long *)(puVar39 + 0x3ea) * 0x38 - lVar27 == 0) {
      if ((*(long *)(puVar39 + 0x4f4) != -1) && (*(long *)(puVar39 + 0x4fa) == lVar19)) {
        uVar18 = puVar39[0x4fc];
        if ((uint)puVar39[0x4fc] < local_124) {
          uVar18 = local_124;
        }
        puVar39[0x4fc] = uVar18;
      }
      goto LAB_14588ae0e;
    }
    lVar27 = lVar27 + 0x38;
    plVar1 = (long *)(lVar34 + 0x18);
    lVar34 = lVar34 + 0x38;
  } while (*plVar1 != lVar19);
  uVar32 = *(uint *)(lVar28 + -0x18 + lVar27);
  if (uVar32 < local_124) {
    uVar32 = local_124;
  }
  uVar17 = *(uint *)(lVar28 + -0x14 + lVar27);
  *(uint *)(lVar28 + -0x18 + lVar27) = uVar32;
  if (uVar17 < uVar18) {
    uVar17 = uVar18;
  }
  *(uint *)(lVar28 + -0x14 + lVar27) = uVar17;
LAB_14588ae0e:
  cVar31 = local_a2;
  if (*(char *)((long)puVar39 + 0x180a) == '\0') {
    *(undefined1 *)((long)puVar39 + 0x180a) = 1;
    if (local_b1 != 0) {
      func_0x0001458901a0(local_a2,puVar39 + 0x3e6,local_1c0,puVar39,uVar4,uVar5);
    }
    lVar34 = *(long *)(puVar39 + 1000);
    lVar28 = 0;
    lVar19 = lVar34;
    do {
      if (*(long *)(puVar39 + 0x3ea) * 0x38 - lVar28 == 0) goto LAB_14588ae9c;
      lVar28 = lVar28 + 0x38;
      plVar1 = (long *)(lVar19 + 0x18);
      lVar19 = lVar19 + 0x38;
    } while (*plVar1 != local_1c8);
    piVar3 = (int *)(lVar34 + -0x10 + lVar28);
    *piVar3 = *piVar3 + 1;
    piVar3 = (int *)(lVar34 + -0xc + lVar28);
    *piVar3 = *piVar3 + (uint)local_b1;
LAB_14588ae9c:
    if (bVar41) {
      lVar19 = *(long *)(puVar39 + 0x452) + 1;
      if (lVar19 == 0) {
        lVar19 = -1;
      }
      *(long *)(puVar39 + 0x452) = lVar19;
      lVar19 = *(ulong *)(puVar39 + 0x454) + (ulong)local_b1;
      if (CARRY8(*(ulong *)(puVar39 + 0x454),(ulong)local_b1)) {
        lVar19 = -1;
      }
      *(long *)(puVar39 + 0x454) = lVar19;
    }
    local_a2 = cVar31;
    func_0x000145831e10();
  }
  else {
    func_0x000145831e10();
  }
  if ((cVar31 != '\0') && (local_200 != 0)) {
    func_0x0001400021d0();
  }
LAB_14588af05:
  if (local_308 != 0) {
    func_0x0001400021d0();
  }
  if (local_2f0 != 0) {
    func_0x0001400021d0();
  }
  if (local_2d8 != 0) {
    func_0x0001400021d0();
  }
  if (local_2c0 != 0) {
    func_0x0001400021d0();
  }
  return;
}
