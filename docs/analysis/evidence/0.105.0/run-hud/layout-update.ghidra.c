/* WARNING: Removing unreachable block (ram,0x000140270e6d) */
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined4 *param_1,undefined8 param_2,undefined4 *param_3,long *param_4,long *param_5,
          undefined8 *param_6)

{
  byte bVar1;
  undefined8 uVar2;
  code *pcVar3;
  double dVar4;
  undefined8 *puVar5;
  int iVar6;
  uint *puVar7;
  char *pcVar8;
  ulong uVar9;
  uint *puVar10;
  undefined8 **ppuVar11;
  ulong *puVar12;
  long lVar13;
  undefined8 *extraout_RDX;
  undefined4 *puVar14;
  uint *puVar15;
  bool bVar16;
  long lVar17;
  undefined4 *puVar18;
  undefined8 **ppuVar19;
  long lVar20;
  uint *puVar21;
  undefined8 *puVar22;
  long *plVar23;
  long *plVar24;
  undefined4 *puVar25;
  long *plVar26;
  ulong uVar27;
  long lVar28;
  uint uVar29;
  int iVar30;
  long lVar31;
  ulong uVar32;
  char cVar33;
  ulong uVar34;
  undefined8 **unaff_R13;
  undefined4 *unaff_R14;
  long lVar35;
  long lVar36;
  uint *puVar37;
  bool bVar38;
  uint uVar39;
  float fVar40;
  undefined4 in_XMM6_Da;
  undefined4 uVar41;
  undefined4 uVar42;
  undefined4 uVar43;
  undefined4 uVar44;
  undefined4 in_XMM7_Da;
  undefined4 uVar45;
  undefined4 uVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  undefined4 uVar49;
  undefined4 uVar50;
  double dVar51;
  long in_stack_00000028;
  long in_stack_00000030;
  long *in_stack_00000038;
  undefined8 *in_stack_00000040;
  long *in_stack_00000048;
  long *in_stack_00000050;
  undefined8 *in_stack_00000058;
  long *in_stack_00000060;
  long *in_stack_00000068;
  undefined4 local_380;
  undefined4 uStack_37c;
  undefined4 uStack_378;
  undefined4 uStack_374;
  long local_370;
  undefined4 local_368;
  undefined4 uStack_364;
  undefined4 uStack_360;
  undefined4 uStack_35c;
  undefined4 local_358;
  undefined4 uStack_354;
  undefined4 uStack_350;
  undefined4 uStack_34c;
  ulong local_348;
  undefined8 *local_340;
  undefined8 **local_338;
  undefined8 uStack_330;
  undefined8 uStack_328;
  undefined8 local_320;
  undefined8 uStack_318;
  undefined4 *local_310;
  undefined8 *local_308;
  undefined8 uStack_300;
  undefined8 local_2f8;
  undefined8 local_2f0;
  undefined8 local_2e8;
  undefined8 uStack_2e0;
  undefined8 local_2d8;
  undefined8 uStack_2d0;
  undefined8 local_2c8;
  undefined8 uStack_2c0;
  undefined8 local_2b8;
  undefined4 local_2b0;
  undefined4 uStack_2ac;
  undefined4 uStack_2a8;
  undefined4 uStack_2a4;
  undefined8 local_2a0;
  undefined8 uStack_298;
  undefined8 local_290;
  undefined8 uStack_288;
  undefined8 local_280;
  undefined8 uStack_278;
  undefined8 local_270;
  undefined8 uStack_268;
  undefined8 local_260;
  undefined8 uStack_258;
  undefined8 local_250;
  undefined8 uStack_248;
  undefined8 local_240;
  undefined8 uStack_238;
  undefined8 local_230;
  undefined8 uStack_228;
  undefined8 local_220;
  undefined8 uStack_218;
  undefined8 local_210;
  undefined8 uStack_208;
  undefined4 local_200;
  undefined4 uStack_1fc;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 local_1f0;
  undefined8 local_1ec;
  undefined1 local_1e4;
  undefined8 local_1e0;
  undefined4 local_1d8;
  undefined2 local_1d4;
  undefined4 local_1d2;
  undefined2 local_1ce;
  undefined4 local_1cc;
  undefined2 local_1c8;
  undefined2 local_1c6;
  undefined8 local_1c4;
  undefined2 local_1bc;
  undefined4 local_1b8;
  undefined2 local_1b4;
  long *local_1b0;
  undefined4 local_1a4;
  undefined4 *local_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 *local_188;
  undefined8 *local_180;
  ulong *puStack_178;
  undefined8 *local_170;
  undefined8 local_168;
  undefined8 uStack_160;
  undefined8 local_158;
  undefined4 local_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  undefined8 local_140;
  undefined8 *local_138;
  undefined8 *local_130;
  undefined8 *local_128;
  undefined4 *local_120;
  undefined4 *local_118;
  undefined8 *local_110;
  long *local_108;
  long local_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 *local_e8;
  undefined4 local_d4;
  undefined8 **local_d0;
  ulong *local_c8;
  char local_b9;
  undefined4 *local_b8;
  long *local_b0;
  undefined4 *local_a8;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  local_a0 = 0xfffffffffffffffe;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  if (*(char *)(param_3 + 0x3a) == '\0') {
    lVar31 = *in_stack_00000038;
    lVar28 = in_stack_00000038[1];
    puVar7 = *(uint **)(lVar31 + 0xf8);
    puVar37 = puVar7 + *(long *)(lVar31 + 0x100);
    cVar33 = *(char *)(lVar31 + 0x108);
    local_b0 = (long *)param_4[4];
    uVar41 = (undefined4)*param_4;
    uVar42 = *(undefined4 *)((long)param_4 + 4);
    uVar43 = (undefined4)param_4[1];
    uVar44 = *(undefined4 *)((long)param_4 + 0xc);
    uVar45 = (undefined4)param_4[2];
    uVar46 = *(undefined4 *)((long)param_4 + 0x14);
    uVar47 = (undefined4)param_4[3];
    uVar48 = *(undefined4 *)((long)param_4 + 0x1c);
    local_b8 = (undefined4 *)param_4[2];
    lVar31 = 8;
    uVar9 = 0;
    lVar17 = 0;
    lVar35 = 8;
    if (cVar33 == '\0') goto LAB_14026fa30;
    do {
      do {
        if ((int)uVar9 == (int)lVar17) {
          do {
            if (puVar7 == puVar37) goto LAB_14026fabb;
            uVar29 = *puVar7;
            puVar7 = puVar7 + 1;
            lVar35 = *(long *)(lVar28 + 0x1a8);
            lVar17 = *(long *)(lVar35 + 0x10 + (ulong)uVar29 * 0x48);
          } while (lVar17 == 0);
          lVar35 = *(long *)(lVar35 + (ulong)uVar29 * 0x48 + 8);
          uVar9 = 0;
        }
        uVar32 = (ulong)((int)uVar9 + 1);
        local_338 = *(undefined8 ***)(lVar35 + uVar9 * 8);
        uVar9 = uVar32;
      } while ((int)local_338 == 0);
LAB_14026fab3:
      if ((int)local_338 == 0) {
LAB_14026fabb:
        in_stack_00000068[2] = 0;
        return;
      }
      local_310 = (undefined4 *)local_c8;
      if (local_b8 != (undefined4 *)0x0) {
        local_310 = (undefined4 *)local_b0;
      }
      uStack_330 = (undefined8 **)CONCAT44(uVar42,uVar41);
      uStack_328 = (ulong *)CONCAT44(uVar44,uVar43);
      local_320 = (long *)CONCAT44(uVar46,uVar45);
      uStack_318 = (long *)CONCAT44(uVar48,uVar47);
      local_a8 = (undefined4 *)CONCAT71(local_a8._1_7_,cVar33);
      local_c8 = (ulong *)local_310;
      func_0x000144e5ebd0();
      cVar33 = (char)local_a8;
    } while ((char)local_a8 != '\0');
LAB_14026fa30:
    do {
      if ((int)uVar9 == (int)lVar17) {
        do {
          if (puVar7 == puVar37) goto LAB_14026fabb;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          lVar31 = *(long *)(lVar28 + 0x108);
          lVar17 = *(long *)(lVar31 + 0x58 + (ulong)uVar29 * 0xa0);
        } while (lVar17 == 0);
        lVar31 = *(long *)(lVar31 + (ulong)uVar29 * 0xa0 + 0x50);
        uVar9 = 0;
      }
      lVar13 = uVar9 * 0x10;
      uVar9 = (ulong)((int)uVar9 + 1);
      local_338 = *(undefined8 ***)(lVar31 + lVar13);
    } while ((int)local_338 == 0);
    goto LAB_14026fab3;
  }
  if (*param_5 == 0) {
    return;
  }
  local_368 = (undefined4)*param_5;
  uStack_364 = *(undefined4 *)((long)param_5 + 4);
  ppuVar19 = (undefined8 **)*param_5;
  uStack_360 = (undefined4)param_5[1];
  uStack_35c = *(undefined4 *)((long)param_5 + 0xc);
  local_358 = (undefined4)param_5[2];
  uStack_354 = *(undefined4 *)((long)param_5 + 0x14);
  uStack_350 = (undefined4)param_5[3];
  uStack_34c = *(undefined4 *)((long)param_5 + 0x1c);
  lVar31 = *in_stack_00000038;
  if (*(char *)(lVar31 + 0x108) == '\0') {
    lVar28 = 0;
    do {
      if (*(long *)(lVar31 + 0x100) << 2 == lVar28) goto LAB_14026f742;
      puVar37 = (uint *)(*(long *)(lVar31 + 0xf8) + lVar28);
      lVar28 = lVar28 + 4;
    } while (*(long *)(*(long *)(in_stack_00000038[1] + 0x108) + 0x58 + (ulong)*puVar37 * 0xa0) == 0
            );
  }
  else {
    lVar28 = 0;
    do {
      if (*(long *)(lVar31 + 0x100) << 2 == lVar28) {
LAB_14026f742:
        uVar2 = *param_6;
        local_f8 = (undefined8 **)CONCAT71(local_f8._1_7_,*(undefined1 *)(in_stack_00000028 + 0x38))
        ;
        local_198 = _DAT_145dc0410;
        uStack_190 = (ulong *)uRam0000000145dc0418;
        local_188 = (undefined8 *)0x0;
        local_180 = (undefined8 *)_DAT_145dc0428;
        puStack_178 = (ulong *)uRam0000000145dc0430;
        local_170 = (undefined8 *)0x0;
        local_168 = _DAT_145dc0440;
        uStack_160 = uRam0000000145dc0448;
        local_158 = 0;
        local_150 = _DAT_145dc0458;
        uStack_14c = uRam0000000145dc045c;
        uStack_148 = uRam0000000145dc0460;
        uStack_144 = uRam0000000145dc0464;
        local_140 = 0;
        local_338 = _DAT_145dc0410;
        uStack_330 = (undefined8 **)uRam0000000145dc0418;
        local_308 = (undefined8 *)_DAT_145dc0440;
        uStack_300 = uRam0000000145dc0448;
        uStack_328 = (ulong *)0x0;
        local_320 = (long *)_DAT_145dc0428;
        uStack_318 = (long *)uRam0000000145dc0430;
        local_310 = (undefined4 *)0x0;
        local_2f8 = 0;
        local_2f0 = CONCAT44(uRam0000000145dc045c,_DAT_145dc0458);
        local_2e8 = CONCAT44(uRam0000000145dc0464,uRam0000000145dc0460);
        uStack_2e0 = 0;
        local_2c8 = 0;
        uStack_2c0 = 0;
        local_2d8 = 0;
        uStack_2d0 = 0;
        local_2b8 = 0;
        local_2b0 = _DAT_145d6d800;
        uStack_2ac = uRam0000000145d6d804;
        uStack_2a8 = uRam0000000145d6d808;
        uStack_2a4 = uRam0000000145d6d80c;
        local_290 = 0;
        uStack_288 = 0;
        local_2a0 = 0;
        uStack_298 = 0;
        local_270 = _DAT_145dc04d8;
        uStack_268 = uRam0000000145dc04e0;
        local_280 = _DAT_145dc04c8;
        uStack_278 = uRam0000000145dc04d0;
        local_250 = _DAT_145dc04f8;
        uStack_248 = uRam0000000145dc0500;
        local_260 = _DAT_145dc04e8;
        uStack_258 = uRam0000000145dc04f0;
        local_230 = _DAT_145dc0518;
        uStack_228 = uRam0000000145dc0520;
        local_240 = _DAT_145dc0508;
        uStack_238 = uRam0000000145dc0510;
        local_210 = _DAT_145dc0538;
        uStack_208 = uRam0000000145dc0540;
        local_220 = _DAT_145dc0528;
        uStack_218 = uRam0000000145dc0530;
        local_200 = _DAT_145d6d260;
        uStack_1fc = uRam0000000145d6d264;
        uStack_1f8 = uRam0000000145d6d268;
        uStack_1f4 = uRam0000000145d6d26c;
        local_1f0 = 1;
        local_1ec = 0;
        local_1e4 = 1;
        local_1e0 = 0;
        local_1d8 = 0x3f800000;
        local_1d4 = 0;
        local_1ce = 0;
        local_1d2 = 0x10000;
        local_1c8 = 0;
        local_1cc = 0x10000;
        local_1c6 = 0x100;
        local_1bc = 0;
        local_1c4 = 0;
        local_1b8 = 4000;
        local_1b4 = 0;
        func_0x00014019fe30(ppuVar19,&local_198,param_4,&local_198,&local_338,0x145dc0848);
        uStack_328 = &local_f8;
        local_338 = ppuVar19;
        uStack_330 = (undefined8 **)uVar2;
        func_0x0001401b8700();
        return;
      }
      puVar37 = (uint *)(*(long *)(lVar31 + 0xf8) + lVar28);
      lVar28 = lVar28 + 4;
    } while (*(long *)(*(long *)(in_stack_00000038[1] + 0x1a8) + 0x10 + (ulong)*puVar37 * 0x48) == 0
            );
  }
  if (*(char *)(param_3 + 0x18) == -1) {
    return;
  }
  plVar26 = (long *)*in_stack_00000040;
  local_a8 = (undefined4 *)in_stack_00000040[1];
  local_d4 = *(undefined4 *)(in_stack_00000040 + 3);
  local_340 = param_6;
  func_0x000140376e00();
  puVar37 = (uint *)plVar26[0x1f];
  lVar31 = plVar26[0x20] * 4;
  puVar7 = puVar37;
  if ((char)plVar26[0x21] == '\0') {
    do {
      if (lVar31 == 0) {
        iVar6 = 0;
        lVar28 = 0;
        plVar24 = (long *)0x0;
        goto LAB_14026fb16;
      }
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar28 = *(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0);
      lVar31 = lVar31 + -4;
    } while (lVar28 == 0);
    lVar35 = *(long *)(local_a8 + 0x42) + (ulong)uVar29 * 0xa0;
    uVar9 = (ulong)*(uint *)(lVar35 + 0x94);
    lVar31 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x18 + uVar9 * 0x48);
    lVar17 = ~*(ulong *)(*(long *)(*(long *)(local_a8 + 0x6a) + 0x38 + uVar9 * 0x48) +
                        plVar26[0x22] * 8) * 0x30;
    uVar9 = (ulong)~*(uint *)(*(long *)(lVar35 + 0x50) + 8);
    plVar24 = (long *)(uVar9 * 0x18 + *(long *)(lVar31 + 0x10 + lVar17));
    param_1 = (undefined4 *)(uVar9 * 4 + *(long *)(lVar31 + 0x28 + lVar17));
    iVar6 = 1;
  }
  else {
    do {
      if (lVar31 == 0) {
        iVar6 = 0;
        lVar28 = 0;
        plVar24 = (long *)0x0;
        goto LAB_14026fb16;
      }
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar28 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48);
      lVar31 = lVar31 + -4;
    } while (lVar28 == 0);
    lVar31 = *(long *)(local_a8 + 0x6a) + (ulong)uVar29 * 0x48;
    lVar17 = *(long *)(lVar31 + 0x18);
    lVar31 = ~*(ulong *)(*(long *)(lVar31 + 0x38) + plVar26[0x22] * 8) * 0x30;
    plVar24 = *(long **)(lVar17 + 0x10 + lVar31);
    param_1 = *(undefined4 **)(lVar17 + 0x28 + lVar31);
    iVar6 = 1;
  }
LAB_14026fb16:
  local_120 = param_3 + 0x18;
  local_b8 = param_3;
  local_b0 = plVar26;
  if ((char)plVar26[0x21] == '\0') {
    if (iVar6 == (int)lVar28) {
      do {
        if (puVar7 == puVar37 + plVar26[0x20]) goto LAB_14026fbae;
        uVar29 = *puVar7;
        puVar7 = puVar7 + 1;
      } while (*(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0) == 0);
    }
  }
  else if (iVar6 == (int)lVar28) {
    do {
      if (puVar7 == puVar37 + plVar26[0x20]) goto LAB_14026fbae;
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
    } while (*(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48) == 0);
  }
LAB_14026fd04:
  plVar26 = local_b0;
  func_0x000140376e00();
  puVar37 = (uint *)plVar26[0x43];
  lVar31 = plVar26[0x44] * 4;
  puVar7 = puVar37;
  if ((char)plVar26[0x45] == '\0') {
    do {
      if (lVar31 == 0) goto LAB_14026feae;
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar28 = *(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0);
      lVar31 = lVar31 + -4;
    } while (lVar28 == 0);
    lVar35 = *(long *)(local_a8 + 0x42) + (ulong)uVar29 * 0xa0;
    uVar9 = (ulong)*(uint *)(lVar35 + 0x94);
    lVar31 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x18 + uVar9 * 0x48);
    lVar17 = ~*(ulong *)(*(long *)(*(long *)(local_a8 + 0x6a) + 0x38 + uVar9 * 0x48) +
                        local_b0[0x46] * 8) * 0x30;
    uVar9 = (ulong)~*(uint *)(*(long *)(lVar35 + 0x50) + 8);
    plVar24 = (long *)(uVar9 * 0x18 + *(long *)(lVar31 + 0x10 + lVar17));
    unaff_R14 = (undefined4 *)(uVar9 * 4 + *(long *)(lVar31 + 0x28 + lVar17));
  }
  else {
    do {
      if (lVar31 == 0) goto LAB_14026feae;
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar28 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48);
      lVar31 = lVar31 + -4;
    } while (lVar28 == 0);
    lVar31 = *(long *)(local_a8 + 0x6a) + (ulong)uVar29 * 0x48;
    lVar17 = *(long *)(lVar31 + 0x18);
    lVar31 = ~*(ulong *)(*(long *)(lVar31 + 0x38) + local_b0[0x46] * 8) * 0x30;
    plVar24 = *(long **)(lVar17 + 0x10 + lVar31);
    unaff_R14 = *(undefined4 **)(lVar17 + 0x28 + lVar31);
  }
  iVar30 = (int)lVar28;
  iVar6 = 1;
joined_r0x00014026fec4:
  local_1b0 = param_4;
  if ((char)plVar26[0x45] == '\0') {
    if (iVar6 == iVar30) {
      do {
        if (puVar7 == puVar37 + plVar26[0x44]) goto LAB_14026fefa;
        uVar29 = *puVar7;
        puVar7 = puVar7 + 1;
      } while (*(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0) == 0);
    }
  }
  else if (iVar6 == iVar30) {
    do {
      if (puVar7 == puVar37 + plVar26[0x44]) goto LAB_14026fefa;
      uVar29 = *puVar7;
      puVar7 = puVar7 + 1;
    } while (*(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48) == 0);
  }
LAB_1402700e8:
  pcVar8 = (char *)func_0x000142ad39e0();
  if (pcVar8 == (char *)0x0) {
    pcVar8 = _DAT_147fda290;
  }
  if (*pcVar8 == '\x04') {
    local_338 = *(undefined8 ***)(pcVar8 + 0x10);
    uStack_330 = local_338 + *(long *)(pcVar8 + 0x18) * 4;
    uStack_328 = (ulong *)0x4;
    func_0x000140263da0();
  }
  else {
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    if (*pcVar8 == '\x05') {
      pcVar8 = (char *)func_0x000142ad39e0();
      func_0x000140002200();
      local_130 = (undefined8 *)func_0x0001400021c0();
      if (local_130 == (undefined8 *)0x0) {
        func_0x000145d6944b();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      if (pcVar8 == (char *)0x0) {
        pcVar8 = _DAT_147fda290;
      }
      *local_130 = pcVar8;
      local_138 = (undefined8 *)0x1;
      local_128 = local_138;
    }
    else {
      local_130 = (undefined8 *)0x8;
      local_138 = (undefined8 *)0x0;
      local_128 = local_138;
    }
  }
  lVar31 = *in_stack_00000048;
  lVar28 = in_stack_00000048[1];
  puVar7 = *(uint **)(lVar31 + 0xf8);
  puVar37 = puVar7 + *(long *)(lVar31 + 0x100);
  bVar1 = *(byte *)(lVar31 + 0x108);
  local_c8 = (ulong *)CONCAT71(local_c8._1_7_,bVar1);
  if (bVar1 == 0) {
    lVar17 = 8;
    lVar35 = 0;
    bVar16 = false;
    uVar9 = 0;
    uVar32 = 0;
LAB_1402702e9:
    uVar29 = (uint)uVar32;
    if (uVar29 == (uint)uVar9) {
LAB_140270300:
      if (puVar7 != puVar37) goto code_r0x000140270309;
      lVar35 = 8;
LAB_140270412:
      uVar27 = 0;
      puVar7 = puVar37;
      uVar34 = (ulong)bVar1;
      uVar32 = uVar9;
      goto LAB_140270418;
    }
    goto LAB_14027039e;
  }
  lVar35 = 8;
  lVar17 = 0;
  bVar16 = false;
  uVar9 = 0;
  uVar32 = 0;
  do {
    uVar29 = (uint)uVar32;
    if (uVar29 == (uint)uVar9) {
      do {
        if (puVar7 == puVar37) {
          lVar17 = 8;
          goto LAB_140270412;
        }
        uVar29 = *puVar7;
        puVar7 = puVar7 + 1;
        uVar32 = *(ulong *)(*(long *)(lVar28 + 0x1a8) + 0x10 + (ulong)uVar29 * 0x48);
      } while (uVar32 == 0);
      lVar35 = *(long *)(lVar28 + 0x1a8) + (ulong)uVar29 * 0x48;
      uVar29 = 0;
      if ((*(ulong *)(lVar31 + 0x110) < *(ulong *)(lVar35 + 0x40)) &&
         (uVar9 = *(ulong *)(*(long *)(lVar35 + 0x38) + *(ulong *)(lVar31 + 0x110) * 8), uVar9 != 0)
         ) {
        lVar17 = *(long *)(*(long *)(lVar35 + 0x18) + 0x10 + ~uVar9 * 0x30);
        bVar16 = true;
      }
      else {
        bVar16 = false;
      }
      lVar35 = *(long *)(lVar35 + 8);
      uVar9 = uVar32 & 0xffffffff;
    }
    uVar32 = (ulong)(uVar29 + 1);
    uVar27 = *(ulong *)(lVar35 + (ulong)uVar29 * 8);
    uVar34 = lVar17 + (ulong)uVar29 * 0x18;
    if (!bVar16) {
      uVar34 = 0;
    }
    bVar38 = (int)uVar27 == 0;
    ppuVar19 = (undefined8 **)(uVar27 >> 0x20);
    if (bVar38) {
      ppuVar19 = unaff_R13;
    }
    unaff_R13 = (undefined8 **)((ulong)ppuVar19 & 0xffffffff);
  } while (bVar38);
  lVar17 = 8;
LAB_140270418:
  if (bVar1 == 0) {
    do {
      uVar29 = (uint)uVar32;
      if (uVar29 == (uint)uVar9) {
        do {
          if (puVar7 == puVar37) goto LAB_1402704d7;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          uVar9 = *(ulong *)(*(long *)(lVar28 + 0x108) + 0x58 + (ulong)uVar29 * 0xa0);
        } while (uVar9 == 0);
        lVar17 = *(long *)(*(long *)(lVar28 + 0x108) + (ulong)uVar29 * 0xa0 + 0x50);
        uVar29 = 0;
      }
      uVar32 = (ulong)(uVar29 + 1);
      iVar6 = *(int *)(lVar17 + (ulong)uVar29 * 0x10);
    } while (iVar6 == 0);
  }
  else {
    do {
      if ((int)uVar32 == (int)uVar9) {
        do {
          if (puVar7 == puVar37) goto LAB_1402704d7;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          uVar9 = *(ulong *)(*(long *)(lVar28 + 0x1a8) + 0x10 + (ulong)uVar29 * 0x48);
        } while (uVar9 == 0);
        lVar35 = *(long *)(*(long *)(lVar28 + 0x1a8) + (ulong)uVar29 * 0x48 + 8);
        uVar32 = 0;
      }
      iVar6 = *(int *)(lVar35 + uVar32 * 8);
      uVar32 = (ulong)((int)uVar32 + 1);
    } while (iVar6 == 0);
  }
LAB_1402704da:
  if (((int)uVar27 != 0) && (iVar6 == 0)) {
    if (uVar34 == 0) {
      if (local_128 == (undefined8 *)0x0) goto LAB_1402705d9;
    }
    else if (*(undefined8 **)(uVar34 + 0x10) == local_128) goto LAB_1402705d9;
    plVar26 = (long *)local_1b0[2];
    puVar25 = (undefined4 *)local_1b0[4];
    plVar24 = (long *)local_1b0[3];
    uVar41 = (undefined4)*local_1b0;
    uVar42 = *(undefined4 *)((long)local_1b0 + 4);
    uVar43 = (undefined4)local_1b0[1];
    uVar44 = *(undefined4 *)((long)local_1b0 + 0xc);
    plVar23 = plVar26;
    if (plVar26 == (long *)0x0) {
      plVar23 = plVar24;
    }
    lVar31 = plVar23[2];
    if ((ulong)(*plVar23 - lVar31) < 0x10) {
      func_0x000145bcb2d0(uVar27,plVar23,lVar31,plVar23);
    }
    local_338 = (undefined8 **)((long)unaff_R13 << 0x20 | uVar27 & 0xffffffff);
    lVar28 = plVar23[1];
    *(undefined8 *)(lVar28 + lVar31) = 0x14022b3d0;
    *(undefined8 ***)(lVar28 + 8 + lVar31) = local_338;
    plVar23[2] = lVar31 + 0x10;
    local_f8 = (undefined8 **)
               CONCAT44(local_f8._4_4_,
                        *(undefined4 *)((ulong)((undefined8 *)0x1 < local_128) * 4 + 0x145dbf4e8));
    uStack_330 = (undefined8 **)CONCAT44(uVar42,uVar41);
    uStack_328 = (ulong *)CONCAT44(uVar44,uVar43);
    local_198 = &local_138;
    uStack_190 = (ulong *)&local_368;
    local_188 = &local_f8;
    local_320 = plVar26;
    uStack_318 = plVar24;
    local_310 = puVar25;
    func_0x0001401b5730();
  }
LAB_1402705d9:
  func_0x000140376e00();
  puVar7 = (uint *)local_b0[0x67];
  puVar37 = puVar7 + local_b0[0x68];
  local_118 = (undefined4 *)0x8;
  uVar9 = 0;
  lVar31 = 0;
  lVar28 = 0;
  lVar17 = 0;
  local_100 = CONCAT71(local_100._1_7_,(char)local_b0[0x69]);
  cVar33 = (char)local_b0[0x69];
LAB_140270632:
  do {
    do {
      if (cVar33 == '\0') {
        if ((int)uVar9 == (int)lVar31) {
          do {
            if (puVar7 == puVar37) goto LAB_14027096c;
            uVar29 = *puVar7;
            puVar7 = puVar7 + 1;
            lVar31 = *(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0);
          } while (lVar31 == 0);
          lVar13 = *(long *)(local_a8 + 0x42) + (ulong)uVar29 * 0xa0;
          uVar9 = (ulong)*(uint *)(lVar13 + 0x94);
          lVar28 = *(long *)(local_a8 + 0x6a);
          lVar35 = *(long *)(lVar28 + 0x18 + uVar9 * 0x48);
          lVar17 = *(long *)(lVar28 + 0x38 + uVar9 * 0x48);
          if (((ulong)local_b0[0x6b] < *(ulong *)(lVar28 + 0x40 + uVar9 * 0x48)) &&
             (uVar9 = *(ulong *)(lVar17 + local_b0[0x6b] * 8), uVar9 != 0)) {
            lVar28 = *(long *)(lVar35 + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar28 = 0;
          }
          lVar20 = ~*(ulong *)(lVar17 + local_b0[0x6a] * 8) * 0x30;
          lVar17 = *(long *)(lVar35 + 0x10 + lVar20);
          local_c8 = *(ulong **)(lVar35 + 0x28 + lVar20);
          local_118 = *(undefined4 **)(lVar13 + 0x50);
          uVar9 = 0;
        }
        iVar6 = (int)uVar9;
        uVar9 = (ulong)(uint)~local_118[uVar9 * 4 + 2];
      }
      else {
        if ((int)uVar9 == (int)lVar31) {
          do {
            if (puVar7 == puVar37) goto LAB_14027096c;
            uVar29 = *puVar7;
            puVar7 = puVar7 + 1;
            lVar31 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48);
          } while (lVar31 == 0);
          lVar17 = *(long *)(local_a8 + 0x6a) + (ulong)uVar29 * 0x48;
          lVar35 = *(long *)(lVar17 + 0x18);
          if (((ulong)local_b0[0x6b] < *(ulong *)(lVar17 + 0x40)) &&
             (uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + local_b0[0x6b] * 8), uVar9 != 0)) {
            lVar28 = *(long *)(lVar35 + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar28 = 0;
          }
          lVar13 = ~*(ulong *)(*(long *)(lVar17 + 0x38) + local_b0[0x6a] * 8) * 0x30;
          lVar17 = *(long *)(lVar35 + 0x10 + lVar13);
          local_c8 = *(ulong **)(lVar35 + 0x28 + lVar13);
          uVar9 = 0;
        }
        iVar6 = (int)uVar9;
      }
      lVar35 = uVar9 * 0x18;
      local_1a0 = (undefined4 *)((long)local_c8 + uVar9 * 4);
      lVar13 = uVar9 * 8;
      uVar9 = (ulong)(iVar6 + 1U);
    } while (local_128 <= *(undefined8 **)(lVar28 + lVar13));
    local_108 = (long *)CONCAT44(local_108._4_4_,iVar6 + 1U);
    local_d0 = (undefined8 **)(lVar17 + lVar35);
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    uVar9 = (ulong)local_108 & 0xffffffff;
    cVar33 = (char)local_100;
  } while (*pcVar8 != '\x03');
  puVar22 = *(undefined8 **)(pcVar8 + 0x18);
  if (local_d0[2] == puVar22) goto code_r0x00014027086c;
  goto LAB_1402708aa;
LAB_14026fbae:
  if (plVar24 != (long *)0x0) {
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    dVar51 = 0.0;
    if (*pcVar8 == '\x02') {
      if (*(long *)(pcVar8 + 8) == 0) {
        dVar51 = ((double)CONCAT44(uRam0000000145d74074,
                                   (int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                 (double)CONCAT44(uRam0000000145d7408c,uRam0000000145d74088)) +
                 ((double)CONCAT44(_DAT_145d74070,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                 (double)CONCAT44(uRam0000000145d74084,_DAT_145d74080));
      }
      else if ((int)*(long *)(pcVar8 + 8) == 1) {
        dVar51 = (double)*(long *)(pcVar8 + 0x10);
      }
      else {
        dVar51 = *(double *)(pcVar8 + 0x10);
      }
    }
    if (dVar51 <= 0.0) {
      dVar51 = 0.0;
    }
    uVar9 = 0;
    if (0.0 <= dVar51) {
      uVar9 = (long)(dVar51 - _DAT_145d6d278) & (long)dVar51 >> 0x3f | (long)dVar51;
    }
    uVar32 = 0xffffffffffffffff;
    if (dVar51 <= _DAT_145d6d280) {
      uVar32 = uVar9;
    }
    local_138 = (undefined8 *)(uVar32 / 0x3c);
    local_f8 = (undefined8 **)(uVar32 % 0x3c);
    local_338 = &local_138;
    uStack_330 = (undefined8 **)0x145baee70;
    uStack_328 = &local_f8;
    local_320 = (long *)0x145baee70;
    func_0x000145b9c4d0();
    *param_1 = local_d4;
    if (*plVar24 != 0) {
      func_0x0001400021d0();
    }
    plVar24[2] = (long)local_188;
    *(undefined4 *)plVar24 = (undefined4)local_198;
    *(undefined4 *)((long)plVar24 + 4) = local_198._4_4_;
    *(undefined4 *)(plVar24 + 1) = (undefined4)uStack_190;
    *(undefined4 *)((long)plVar24 + 0xc) = uStack_190._4_4_;
  }
  goto LAB_14026fd04;
LAB_14026feae:
  iVar30 = 0;
  iVar6 = 0;
  plVar24 = (long *)0x0;
  goto joined_r0x00014026fec4;
LAB_14026fefa:
  if (plVar24 != (long *)0x0) {
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    if (*pcVar8 == '\x02') {
      puVar12 = &local_198;
      func_0x000140012ba0();
      local_338 = (undefined8 **)0x145dc0360;
      uStack_330 = (undefined8 **)0x4;
      local_320 = (long *)0x145dc0760;
      uStack_328 = puVar12;
      func_0x0001458da540();
      if (local_198 != (undefined8 **)0x0) {
        func_0x0001400021d0();
      }
    }
    else {
      pcVar8 = (char *)func_0x000142ad39e0();
      if (pcVar8 == (char *)0x0) {
        pcVar8 = _DAT_147fda290;
      }
      if ((*pcVar8 == '\x01') && (pcVar8[1] != '\0')) {
        func_0x0001458da4e0();
        puVar22 = extraout_RDX;
        func_0x00014023ff50();
        puVar12 = uStack_328;
        unaff_R13 = uStack_330;
        if ((int)local_338 == 1) {
          func_0x000145d6944b();
                    /* WARNING: Does not return */
          pcVar3 = (code *)invalidInstructionException();
          (*pcVar3)();
        }
        if (puVar22 != (undefined8 *)0x0) {
          func_0x000145bc977b();
        }
        local_f8 = unaff_R13;
        uStack_f0 = puVar12;
        local_e8 = puVar22;
      }
      else {
        local_f8 = (undefined8 **)0x0;
        uStack_f0 = (ulong *)0x1;
        local_e8 = (undefined8 *)0x0;
      }
    }
    *unaff_R14 = local_d4;
    if (*plVar24 != 0) {
      func_0x0001400021d0();
    }
    plVar24[2] = (long)local_e8;
    *(undefined4 *)plVar24 = (undefined4)local_f8;
    *(undefined4 *)((long)plVar24 + 4) = local_f8._4_4_;
    *(undefined4 *)(plVar24 + 1) = (undefined4)uStack_f0;
    *(undefined4 *)((long)plVar24 + 0xc) = uStack_f0._4_4_;
  }
  goto LAB_1402700e8;
code_r0x000140270309:
  uVar29 = *puVar7;
  puVar7 = puVar7 + 1;
  uVar32 = *(ulong *)(*(long *)(lVar28 + 0x108) + 0x58 + (ulong)uVar29 * 0xa0);
  if (uVar32 != 0) goto code_r0x000140270329;
  goto LAB_140270300;
code_r0x000140270329:
  lVar17 = *(long *)(lVar28 + 0x108) + (ulong)uVar29 * 0xa0;
  uVar9 = *(ulong *)(lVar31 + 0x110);
  uVar29 = 0;
  if ((uVar9 < *(ulong *)(lVar17 + 0x88)) && (*(long *)(*(long *)(lVar17 + 0x80) + uVar9 * 8) != 0))
  {
    bVar16 = true;
    if (uVar9 < *(ulong *)(*(long *)(lVar28 + 0x1a8) + 0x40 + (ulong)*(uint *)(lVar17 + 0x94) * 0x48
                          )) {
      lVar35 = *(long *)(lVar28 + 0x1a8) + (ulong)*(uint *)(lVar17 + 0x94) * 0x48;
      uVar9 = *(ulong *)(*(long *)(lVar35 + 0x38) + uVar9 * 8);
      if (uVar9 != 0) {
        lVar35 = *(long *)(*(long *)(lVar35 + 0x18) + 0x10 + ~uVar9 * 0x30);
        goto LAB_140270398;
      }
    }
    lVar35 = 0;
  }
  else {
    bVar16 = false;
  }
LAB_140270398:
  lVar17 = *(long *)(lVar17 + 0x50);
  uVar9 = uVar32 & 0xffffffff;
LAB_14027039e:
  uVar32 = (ulong)(uVar29 + 1);
  uVar27 = *(ulong *)(lVar17 + (ulong)uVar29 * 0x10);
  uVar34 = lVar35 + (ulong)~*(uint *)(lVar17 + 8 + (ulong)uVar29 * 0x10) * 0x18;
  if (!bVar16) {
    uVar34 = 0;
  }
  bVar38 = (int)uVar27 == 0;
  ppuVar19 = (undefined8 **)(uVar27 >> 0x20);
  if (bVar38) {
    ppuVar19 = unaff_R13;
  }
  unaff_R13 = (undefined8 **)((ulong)ppuVar19 & 0xffffffff);
  if (!bVar38) goto code_r0x0001402703f3;
  goto LAB_1402702e9;
code_r0x0001402703f3:
  lVar35 = 8;
  goto LAB_140270418;
LAB_1402704d7:
  iVar6 = 0;
  goto LAB_1402704da;
LAB_14027096c:
  local_110 = (undefined8 *)*in_stack_00000050;
  lVar31 = in_stack_00000050[1];
  local_1a4 = *(undefined4 *)((long)in_stack_00000050 + 0x14);
  puVar7 = (uint *)local_110[0x1f];
  puVar37 = puVar7 + local_110[0x20];
  local_b9 = *(char *)(local_110 + 0x21);
  uVar47 = (undefined4)_DAT_145d9ddb0;
  uVar48 = (undefined4)((ulong)_DAT_145d9ddb0 >> 0x20);
  uVar49 = (undefined4)_DAT_145d9ddb8;
  uVar50 = (undefined4)((ulong)_DAT_145d9ddb8 >> 0x20);
  puVar25 = (undefined4 *)0x0;
  puVar14 = (undefined4 *)0x0;
  puVar18 = (undefined4 *)0x0;
  plVar26 = (long *)0x8;
  lVar28 = 0;
  puVar22 = local_110;
  uVar41 = _DAT_145d74070;
  uVar42 = uRam0000000145d74074;
  uVar43 = _DAT_145d74080;
  uVar44 = uRam0000000145d74084;
  uVar45 = uRam0000000145d74088;
  uVar46 = uRam0000000145d7408c;
  cVar33 = local_b9;
  do {
    if (cVar33 == '\0') {
      if ((int)puVar14 == (int)puVar25) {
        do {
          if (puVar7 == puVar37) goto LAB_140270cec;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          puVar25 = *(undefined4 **)(*(long *)(lVar31 + 0x108) + 0x58 + (ulong)uVar29 * 0xa0);
        } while (puVar25 == (undefined4 *)0x0);
        lVar13 = *(long *)(lVar31 + 0x108) + (ulong)uVar29 * 0xa0;
        uVar9 = (ulong)*(uint *)(lVar13 + 0x94);
        lVar28 = *(long *)(lVar31 + 0x1a8);
        lVar17 = *(long *)(lVar28 + 0x18 + uVar9 * 0x48);
        lVar35 = *(long *)(lVar28 + 0x38 + uVar9 * 0x48);
        if (((ulong)puVar22[0x23] < *(ulong *)(lVar28 + 0x40 + uVar9 * 0x48)) &&
           (uVar9 = *(ulong *)(lVar35 + puVar22[0x23] * 8), uVar9 != 0)) {
          lVar28 = *(long *)(lVar17 + 0x10 + ~uVar9 * 0x30);
        }
        else {
          lVar28 = 0;
        }
        lVar35 = ~*(ulong *)(lVar35 + puVar22[0x22] * 8) * 0x30;
        puVar18 = *(undefined4 **)(lVar17 + 0x10 + lVar35);
        local_c8 = *(ulong **)(lVar17 + 0x28 + lVar35);
        plVar26 = *(long **)(lVar13 + 0x50);
        puVar14 = (undefined4 *)0x0;
      }
      iVar6 = (int)puVar14;
      uVar9 = (ulong)~*(uint *)(plVar26 + ((ulong)puVar14 & 0xffffffff) * 2 + 1);
    }
    else {
      if ((int)puVar14 == (int)puVar25) {
        do {
          if (puVar7 == puVar37) goto LAB_140270cec;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          puVar25 = *(undefined4 **)(*(long *)(lVar31 + 0x1a8) + 0x10 + (ulong)uVar29 * 0x48);
        } while (puVar25 == (undefined4 *)0x0);
        lVar17 = *(long *)(lVar31 + 0x1a8) + (ulong)uVar29 * 0x48;
        lVar35 = *(long *)(lVar17 + 0x18);
        if (((ulong)puVar22[0x23] < *(ulong *)(lVar17 + 0x40)) &&
           (uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + puVar22[0x23] * 8), uVar9 != 0)) {
          lVar28 = *(long *)(lVar35 + 0x10 + ~uVar9 * 0x30);
        }
        else {
          lVar28 = 0;
        }
        lVar17 = ~*(ulong *)(*(long *)(lVar17 + 0x38) + puVar22[0x22] * 8) * 0x30;
        puVar18 = *(undefined4 **)(lVar35 + 0x10 + lVar17);
        local_c8 = *(ulong **)(lVar35 + 0x28 + lVar17);
        puVar14 = (undefined4 *)0x0;
      }
      iVar6 = (int)puVar14;
      uVar9 = (ulong)puVar14 & 0xffffffff;
    }
    puVar14 = (undefined4 *)(ulong)(iVar6 + 1);
    if (*(undefined8 **)(lVar28 + uVar9 * 8) < local_128) {
      local_1a0 = puVar18;
      local_118 = (undefined4 *)(ulong)(iVar6 + 1);
      local_108 = plVar26;
      local_100 = lVar28;
      local_d0 = (undefined8 **)((long)local_c8 + uVar9 * 4);
      pcVar8 = (char *)func_0x000142ad39e0();
      if (pcVar8 == (char *)0x0) {
        pcVar8 = _DAT_147fda290;
      }
      dVar51 = 0.0;
      if (*pcVar8 == '\x02') {
        if (*(long *)(pcVar8 + 8) == 2) {
          dVar51 = *(double *)(pcVar8 + 0x10);
        }
        else if ((int)*(long *)(pcVar8 + 8) == 1) {
          dVar51 = (double)*(long *)(pcVar8 + 0x10);
        }
        else {
          dVar51 = ((double)CONCAT44(uVar42,(int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                   (double)CONCAT44(uVar46,uVar45)) +
                   ((double)CONCAT44(uVar41,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                   (double)CONCAT44(uVar44,uVar43));
        }
      }
      pcVar8 = (char *)func_0x000142ad39e0();
      dVar4 = (double)CONCAT44(uVar48,uVar47);
      if (pcVar8 == (char *)0x0) {
        pcVar8 = _DAT_147fda290;
      }
      if (*pcVar8 == '\x02') {
        if (*(long *)(pcVar8 + 8) == 2) {
          dVar4 = *(double *)(pcVar8 + 0x10);
        }
        else if ((int)*(long *)(pcVar8 + 8) == 1) {
          dVar4 = (double)*(long *)(pcVar8 + 0x10);
        }
        else {
          dVar4 = ((double)CONCAT44(uVar42,(int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                  (double)CONCAT44(uVar46,uVar45)) +
                  ((double)CONCAT44(uVar41,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                  (double)CONCAT44(uVar44,uVar43));
        }
        if (dVar4 <= (double)CONCAT44(uVar48,uVar47)) {
          dVar4 = (double)CONCAT44(uVar48,uVar47);
        }
      }
      dVar51 = (dVar51 / dVar4) * (double)CONCAT44(uVar50,uVar49);
      dVar4 = 0.0;
      if (0.0 <= dVar51) {
        dVar4 = dVar51;
      }
      dVar51 = (double)CONCAT44(uVar50,uVar49);
      if (dVar4 <= (double)CONCAT44(uVar50,uVar49)) {
        dVar51 = dVar4;
      }
      *(undefined4 *)local_d0 = local_1a4;
      puVar18[uVar9 * 0x60 + 0x22] = 2;
      puVar18[uVar9 * 0x60 + 0x23] = (float)dVar51;
      puVar14 = local_118;
      puVar18 = local_1a0;
      plVar26 = local_108;
      lVar28 = local_100;
      puVar22 = local_110;
      cVar33 = local_b9;
    }
  } while( true );
LAB_140270cec:
  func_0x000140376e00();
  puVar18 = local_b8;
  puVar7 = (uint *)local_b0[0x8b];
  lVar28 = local_b0[0x8c];
  lVar31 = lVar28 * 4;
  puVar10 = puVar7;
  if ((char)local_b0[0x8d] == '\0') {
    do {
      if (lVar31 == 0) {
        lVar17 = 0;
        iVar6 = 0;
        plVar26 = (long *)0x0;
        goto LAB_140270e80;
      }
      uVar29 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar17 = *(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0);
      lVar31 = lVar31 + -4;
    } while (lVar17 == 0);
    lVar13 = *(long *)(local_a8 + 0x42) + (ulong)uVar29 * 0xa0;
    uVar9 = (ulong)*(uint *)(lVar13 + 0x94);
    lVar31 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x18 + uVar9 * 0x48);
    lVar35 = ~*(ulong *)(*(long *)(*(long *)(local_a8 + 0x6a) + 0x38 + uVar9 * 0x48) +
                        local_b0[0x8e] * 8) * 0x30;
    uVar9 = (ulong)~*(uint *)(*(long *)(lVar13 + 0x50) + 8);
    plVar26 = (long *)(uVar9 * 0x18 + *(long *)(lVar31 + 0x10 + lVar35));
    puVar25 = (undefined4 *)(uVar9 * 4 + *(long *)(lVar31 + 0x28 + lVar35));
    iVar6 = 1;
  }
  else {
    do {
      if (lVar31 == 0) {
        lVar17 = 0;
        iVar6 = 0;
        plVar26 = (long *)0x0;
        goto joined_r0x000140270e7e;
      }
      uVar29 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar17 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48);
      lVar31 = lVar31 + -4;
    } while (lVar17 == 0);
    lVar31 = *(long *)(local_a8 + 0x6a) + (ulong)uVar29 * 0x48;
    lVar35 = *(long *)(lVar31 + 0x18);
    lVar31 = ~*(ulong *)(*(long *)(lVar31 + 0x38) + local_b0[0x8e] * 8) * 0x30;
    plVar26 = *(long **)(lVar35 + 0x10 + lVar31);
    puVar25 = *(undefined4 **)(lVar35 + 0x28 + lVar31);
    iVar6 = 1;
joined_r0x000140270e7e:
    if ((char)local_b0[0x8d] != '\0') {
      if (iVar6 == (int)lVar17) {
        do {
          if (puVar10 == puVar7 + lVar28) goto LAB_140270f0a;
          uVar29 = *puVar10;
          puVar10 = puVar10 + 1;
        } while (*(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48) == 0);
      }
      goto LAB_140271025;
    }
  }
LAB_140270e80:
  if (iVar6 == (int)lVar17) {
    do {
      if (puVar10 == puVar7 + lVar28) goto LAB_140270f0a;
      uVar29 = *puVar10;
      puVar10 = puVar10 + 1;
    } while (*(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0) == 0);
  }
  goto LAB_140271025;
LAB_140270f0a:
  if (plVar26 != (long *)0x0) {
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    dVar51 = 0.0;
    if (*pcVar8 == '\x02') {
      if (*(long *)(pcVar8 + 8) == 2) {
        dVar51 = *(double *)(pcVar8 + 0x10);
      }
      else if ((int)*(long *)(pcVar8 + 8) == 1) {
        dVar51 = (double)*(long *)(pcVar8 + 0x10);
      }
      else {
        dVar51 = ((double)CONCAT44(uRam0000000145d74074,
                                   (int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                 (double)CONCAT44(uRam0000000145d7408c,uRam0000000145d74088)) +
                 ((double)CONCAT44(_DAT_145d74070,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                 (double)CONCAT44(uRam0000000145d74084,_DAT_145d74080));
      }
    }
    ppuVar19 = (undefined8 **)0x0;
    if (0.0 <= dVar51) {
      ppuVar19 = (undefined8 **)
                 ((long)(dVar51 - _DAT_145d6d278) & (long)dVar51 >> 0x3f | (long)dVar51);
    }
    local_198 = (undefined8 **)0xffffffffffffffff;
    if (dVar51 <= _DAT_145d6d280) {
      local_198 = ppuVar19;
    }
    local_338 = (undefined8 **)&local_198;
    uStack_330 = (undefined8 **)0x145baee70;
    func_0x000145b9c4d0();
    *puVar25 = local_d4;
    if (*plVar26 != 0) {
      func_0x0001400021d0();
    }
    plVar26[2] = local_370;
    *(undefined4 *)plVar26 = local_380;
    *(undefined4 *)((long)plVar26 + 4) = uStack_37c;
    *(undefined4 *)(plVar26 + 1) = uStack_378;
    *(undefined4 *)((long)plVar26 + 0xc) = uStack_374;
  }
LAB_140271025:
  func_0x000140376e00();
  puVar7 = (uint *)local_b0[0xaf];
  lVar28 = local_b0[0xb0];
  lVar31 = lVar28 * 4;
  puVar10 = puVar7;
  if ((char)local_b0[0xb1] == '\0') {
    do {
      if (lVar31 == 0) goto LAB_1402711de;
      uVar29 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar17 = *(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0);
      lVar31 = lVar31 + -4;
    } while (lVar17 == 0);
    lVar31 = *(long *)(local_a8 + 0x42) + (ulong)uVar29 * 0xa0;
    uVar9 = (ulong)*(uint *)(lVar31 + 0x94);
    puVar37 = *(uint **)(*(long *)(local_a8 + 0x6a) + 0x18 + uVar9 * 0x48);
    uVar32 = ~*(ulong *)(*(long *)(*(long *)(local_a8 + 0x6a) + 0x38 + uVar9 * 0x48) +
                        local_b0[0xb2] * 8);
    uVar9 = (ulong)~*(uint *)(*(long *)(lVar31 + 0x50) + 8);
    plVar26 = (long *)(uVar9 * 0x18 + *(long *)(puVar37 + uVar32 * 0xc + 4));
    puVar18 = (undefined4 *)(uVar9 * 4 + *(long *)(puVar37 + uVar32 * 0xc + 10));
    iVar6 = 1;
LAB_1402711a6:
    if (iVar6 == (int)lVar17) {
      do {
        if (puVar10 == puVar7 + lVar28) goto LAB_14027122a;
        uVar29 = *puVar10;
        puVar10 = puVar10 + 1;
      } while (*(long *)(*(long *)(local_a8 + 0x42) + 0x58 + (ulong)uVar29 * 0xa0) == 0);
    }
  }
  else {
    do {
      if (lVar31 == 0) goto LAB_1402711de;
      uVar29 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar17 = *(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48);
      lVar31 = lVar31 + -4;
    } while (lVar17 == 0);
    lVar31 = *(long *)(local_a8 + 0x6a) + (ulong)uVar29 * 0x48;
    lVar35 = *(long *)(lVar31 + 0x18);
    lVar31 = ~*(ulong *)(*(long *)(lVar31 + 0x38) + local_b0[0xb2] * 8) * 0x30;
    plVar26 = *(long **)(lVar35 + 0x10 + lVar31);
    puVar18 = *(undefined4 **)(lVar35 + 0x28 + lVar31);
    iVar30 = 1;
    iVar6 = 1;
joined_r0x0001402711ed:
    if ((char)local_b0[0xb1] == '\0') goto LAB_1402711a6;
    if (iVar30 == (int)lVar17) {
      do {
        if (puVar10 == puVar7 + lVar28) goto LAB_14027122a;
        uVar29 = *puVar10;
        puVar10 = puVar10 + 1;
      } while (*(long *)(*(long *)(local_a8 + 0x6a) + 0x10 + (ulong)uVar29 * 0x48) == 0);
    }
  }
LAB_14027144d:
  cVar33 = '\x03';
  if (*(char *)((long)local_b8 + 0xe9) == '\0') {
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    if ((*pcVar8 == '\x03') && (*(long *)(pcVar8 + 0x18) == 7)) {
      cVar33 = (*(int *)((long)*(int **)(pcVar8 + 0x10) + 3) == 0x676e6979 &&
               **(int **)(pcVar8 + 0x10) == 0x79616c70) * '\x03';
    }
    else {
      cVar33 = '\0';
    }
  }
  puVar21 = (uint *)*in_stack_00000058;
  lVar31 = in_stack_00000058[1];
  puVar10 = *(uint **)(puVar21 + 0x3e);
  lVar28 = *(long *)(puVar21 + 0x40);
  puVar7 = puVar21 + 0x42;
  puVar15 = puVar10;
  if ((char)*puVar7 == '\0') {
    lVar17 = lVar28 * 4;
    do {
      if (lVar17 == 0) goto LAB_140271637;
      uVar9 = (ulong)*puVar15;
      puVar15 = puVar15 + 1;
      plVar26 = *(long **)(lVar31 + 0x108);
      puVar37 = (uint *)(uVar9 * 0xa0);
      lVar35 = (plVar26 + 0xb)[uVar9 * 0x14];
      lVar17 = lVar17 + -4;
    } while (lVar35 == 0);
    uVar32 = (ulong)*(uint *)((long)(plVar26 + uVar9 * 0x14) + 0x94);
    lVar13 = *(long *)(*(long *)(lVar31 + 0x1a8) + 0x18 + uVar32 * 0x48);
    lVar17 = *(long *)(*(long *)(lVar31 + 0x1a8) + 0x38 + uVar32 * 0x48);
    lVar36 = ~*(ulong *)(lVar17 + *(long *)(puVar21 + 0x44) * 8) * 0x30;
    lVar20 = ~*(ulong *)(lVar17 + *(long *)(puVar21 + 0x46) * 8) * 0x30;
    uVar9 = (ulong)~*(uint *)((plVar26 + uVar9 * 0x14)[10] + 8);
    lVar17 = uVar9 * 0x180 + *(long *)(lVar13 + 0x10 + lVar36);
    plVar26 = (long *)(uVar9 * 0x14 + *(long *)(lVar13 + 0x10 + lVar20));
    puVar37 = (uint *)(*(long *)(lVar13 + 0x28 + lVar36) + uVar9 * 4);
    puVar21 = (uint *)(uVar9 * 4 + *(long *)(lVar13 + 0x28 + lVar20));
  }
  else {
    lVar17 = lVar28 * 4;
    do {
      plVar26 = (long *)0x0;
      if (lVar17 == 0) goto LAB_140271637;
      uVar9 = (ulong)*puVar15;
      puVar15 = puVar15 + 1;
      puVar37 = (uint *)(uVar9 * 9);
      lVar35 = *(long *)(*(long *)(lVar31 + 0x1a8) + 0x10 + uVar9 * 0x48);
      lVar17 = lVar17 + -4;
    } while (lVar35 == 0);
    lVar17 = *(long *)(lVar31 + 0x1a8) + uVar9 * 0x48;
    lVar13 = *(long *)(lVar17 + 0x18);
    lVar20 = *(long *)(lVar17 + 0x38);
    lVar36 = ~*(ulong *)(lVar20 + *(long *)(puVar21 + 0x44) * 8) * 0x30;
    lVar17 = *(long *)(lVar13 + 0x10 + lVar36);
    puVar37 = *(uint **)(lVar13 + 0x28 + lVar36);
    lVar20 = ~*(ulong *)(lVar20 + *(long *)(puVar21 + 0x46) * 8) * 0x30;
    plVar26 = *(long **)(lVar13 + 0x10 + lVar20);
    puVar21 = *(uint **)(lVar13 + 0x28 + lVar20);
  }
  iVar6 = (int)lVar35;
  iVar30 = 1;
LAB_14027163f:
  uVar29 = *(uint *)((long)in_stack_00000058 + 0x14);
  if ((char)*puVar7 == '\0') {
    if (iVar30 == iVar6) {
      do {
        if (puVar15 == puVar10 + lVar28) goto LAB_1402716b5;
        uVar39 = *puVar15;
        puVar15 = puVar15 + 1;
      } while (*(long *)(*(long *)(lVar31 + 0x108) + 0x58 + (ulong)uVar39 * 0xa0) == 0);
    }
  }
  else if (iVar30 == iVar6) {
    do {
      if (puVar15 == puVar10 + lVar28) goto LAB_1402716b5;
      uVar39 = *puVar15;
      puVar15 = puVar15 + 1;
    } while (*(long *)(*(long *)(lVar31 + 0x1a8) + 0x10 + (ulong)uVar39 * 0x48) == 0);
  }
LAB_140271707:
  pcVar8 = (char *)func_0x000142ad39e0();
  plVar26 = local_1b0;
  if (pcVar8 == (char *)0x0) {
    pcVar8 = _DAT_147fda290;
  }
  if (*pcVar8 == '\x04') {
    ppuVar19 = *(undefined8 ***)(pcVar8 + 0x18);
    if (ppuVar19 == (undefined8 **)0x0) {
      puVar12 = (ulong *)0x8;
    }
    else {
      func_0x000140002200();
      puVar12 = (ulong *)func_0x0001400021c0();
      if (puVar12 == (ulong *)0x0) {
        func_0x000145d6944b();
        goto LAB_140271ce2;
      }
    }
    local_338 = &local_188;
    local_188 = (undefined8 *)0x0;
    uStack_330 = (undefined8 **)0x0;
    uStack_328 = puVar12;
    local_198 = ppuVar19;
    uStack_190 = puVar12;
    func_0x00014014acf0();
    local_f8 = local_198;
    uStack_f0 = uStack_190;
    local_e8 = local_188;
  }
  else {
    local_f8 = (undefined8 **)0x0;
    uStack_f0 = (ulong *)0x8;
    local_e8 = (undefined8 *)0x0;
  }
  pcVar8 = (char *)func_0x000142ad39e0();
  if (pcVar8 == (char *)0x0) {
    pcVar8 = _DAT_147fda290;
  }
  if (*pcVar8 == '\x04') {
    puVar22 = *(undefined8 **)(pcVar8 + 0x18);
    if (puVar22 == (undefined8 *)0x0) {
      puVar12 = (ulong *)0x8;
    }
    else {
      func_0x000140002200();
      puVar12 = (ulong *)func_0x0001400021c0();
      if (puVar12 == (ulong *)0x0) {
        func_0x000145d6944b();
LAB_140271ce2:
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
    }
    local_338 = &local_188;
    local_188 = (undefined8 *)0x0;
    uStack_330 = (undefined8 **)0x0;
    uStack_328 = puVar12;
    local_198 = (undefined8 **)puVar22;
    uStack_190 = puVar12;
    func_0x00014014acf0();
    local_170 = local_188;
  }
  else {
    uStack_190 = (ulong *)0x8;
    local_170 = (undefined8 *)0x0;
    local_198 = (undefined8 **)0x0;
  }
  local_188 = local_e8;
  ppuVar19 = local_f8;
  puVar12 = uStack_f0;
  local_f8 = (undefined8 **)&local_198;
  uStack_f0 = (ulong *)0x140268210;
  local_180 = local_198;
  local_198 = ppuVar19;
  puStack_178 = uStack_190;
  uStack_190 = puVar12;
  func_0x000145b9c4d0();
  puVar12 = uStack_328;
  ppuVar19 = uStack_330;
  ppuVar11 = local_338;
  if (((ulong *)in_stack_00000068[2] == uStack_328) && (iVar6 = func_0x000145bc9787(), iVar6 == 0))
  {
    if (ppuVar11 != (undefined8 **)0x0) {
      func_0x0001400021d0();
    }
LAB_140271bce:
    if (local_188 != (undefined8 *)0x0) {
      puVar12 = uStack_190 + 1;
      puVar22 = local_188;
      do {
        if (puVar12[-1] != 0) {
          func_0x0001400021d0();
        }
        puVar12 = puVar12 + 3;
        puVar22 = (undefined8 *)((long)puVar22 + -1);
      } while (puVar22 != (undefined8 *)0x0);
    }
    if (local_198 != (undefined8 **)0x0) {
      func_0x0001400021d0();
    }
    if (local_170 != (undefined8 *)0x0) {
      puVar12 = puStack_178 + 1;
      puVar22 = local_170;
      do {
        if (puVar12[-1] != 0) {
          func_0x0001400021d0();
        }
        puVar12 = puVar12 + 3;
        puVar22 = (undefined8 *)((long)puVar22 + -1);
      } while (puVar22 != (undefined8 *)0x0);
    }
    if (local_180 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    if (local_138 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    return;
  }
  if (*in_stack_00000068 != 0) {
    func_0x0001400021d0();
  }
  *in_stack_00000068 = (long)ppuVar11;
  in_stack_00000068[1] = (long)ppuVar19;
  in_stack_00000068[2] = (long)puVar12;
  lVar31 = *in_stack_00000060;
  lVar28 = in_stack_00000060[1];
  puVar7 = *(uint **)(lVar31 + 0xf8);
  puVar37 = puVar7 + *(long *)(lVar31 + 0x100);
  cVar33 = *(char *)(lVar31 + 0x108);
  local_a8 = (undefined4 *)plVar26[4];
  local_b0 = (long *)plVar26[3];
  lVar17 = 0;
  lVar31 = 8;
  uVar32 = 0;
  puVar25 = (undefined4 *)0x8;
  plVar24 = (long *)plVar26[2];
  puVar12 = (ulong *)plVar26[1];
  ppuVar19 = (undefined8 **)*plVar26;
  uVar9 = uVar32;
  if (cVar33 != '\0') goto LAB_140271a84;
  do {
    do {
      local_b8 = puVar25;
      if ((int)uVar32 == (int)lVar17) {
        do {
          if (puVar7 == puVar37) goto LAB_140271bce;
          uVar29 = *puVar7;
          puVar7 = puVar7 + 1;
          lVar31 = *(long *)(lVar28 + 0x108);
          lVar17 = *(long *)(lVar31 + 0x58 + (ulong)uVar29 * 0xa0);
        } while (lVar17 == 0);
        lVar31 = *(long *)(lVar31 + (ulong)uVar29 * 0xa0 + 0x50);
        uVar32 = 0;
      }
      lVar35 = uVar32 * 0x10;
      uVar32 = (ulong)((int)uVar32 + 1);
      ppuVar11 = *(undefined8 ***)(lVar31 + lVar35);
      puVar25 = local_b8;
    } while ((int)ppuVar11 == 0);
    while( true ) {
      local_b8 = puVar25;
      if ((int)ppuVar11 == 0) goto LAB_140271bce;
      local_100 = CONCAT71(local_100._1_7_,cVar33);
      if (plVar24 != (long *)0x0) {
        local_120 = local_a8;
      }
      uStack_318 = local_b0;
      local_338 = ppuVar11;
      uStack_330 = ppuVar19;
      uStack_328 = puVar12;
      local_320 = plVar24;
      local_310 = local_120;
      local_108 = plVar24;
      local_d0 = ppuVar19;
      local_c8 = puVar12;
      func_0x0001401a3a10();
      if (local_108 != (long *)0x0) {
        local_118 = local_a8;
      }
      uStack_330 = local_d0;
      uStack_328 = local_c8;
      local_320 = local_108;
      uStack_318 = local_b0;
      local_338 = ppuVar11;
      local_310 = local_118;
      func_0x0001401b5a90();
      puVar25 = local_b8;
      plVar24 = local_108;
      puVar12 = local_c8;
      ppuVar19 = local_d0;
      uVar9 = uVar32;
      cVar33 = (char)local_100;
      if ((char)local_100 == '\0') break;
LAB_140271a84:
      do {
        if ((int)uVar9 == (int)lVar17) {
          do {
            if (puVar7 == puVar37) goto LAB_140271bce;
            uVar29 = *puVar7;
            puVar7 = puVar7 + 1;
            lVar35 = *(long *)(lVar28 + 0x1a8);
            lVar17 = *(long *)(lVar35 + 0x10 + (ulong)uVar29 * 0x48);
          } while (lVar17 == 0);
          puVar25 = *(undefined4 **)(lVar35 + (ulong)uVar29 * 0x48 + 8);
          uVar9 = 0;
        }
        uVar32 = (ulong)((int)uVar9 + 1);
        ppuVar11 = *(undefined8 ***)(puVar25 + uVar9 * 2);
        uVar9 = uVar32;
      } while ((int)ppuVar11 == 0);
    }
  } while( true );
LAB_1402711de:
  lVar17 = 0;
  iVar30 = 0;
  iVar6 = 0;
  plVar26 = (long *)0x0;
  goto joined_r0x0001402711ed;
LAB_14027122a:
  if (plVar26 != (long *)0x0) {
    ppuVar19 = (undefined8 **)0x145dc03f2;
    pcVar8 = (char *)func_0x000142ad39e0(plVar26,0x145dc03f2,4,0x145dc03f2,local_b8 + 0x18);
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    dVar51 = 0.0;
    if (*pcVar8 == '\x02') {
      if (*(long *)(pcVar8 + 8) == 2) {
        dVar51 = *(double *)(pcVar8 + 0x10);
      }
      else if ((int)*(long *)(pcVar8 + 8) == 1) {
        dVar51 = (double)*(long *)(pcVar8 + 0x10);
      }
      else {
        dVar51 = ((double)CONCAT44(uRam0000000145d74074,
                                   (int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                 (double)CONCAT44(uRam0000000145d7408c,uRam0000000145d74088)) +
                 ((double)CONCAT44(_DAT_145d74070,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                 (double)CONCAT44(uRam0000000145d74084,_DAT_145d74080));
      }
    }
    uVar9 = 0;
    if (0.0 <= dVar51) {
      uVar9 = (long)(dVar51 - _DAT_145d6d278) & (long)dVar51 >> 0x3f | (long)dVar51;
    }
    local_348 = 0xffffffffffffffff;
    if (dVar51 <= _DAT_145d6d280) {
      local_348 = uVar9;
    }
    pcVar8 = (char *)func_0x000142ad39e0();
    if (pcVar8 == (char *)0x0) {
      pcVar8 = _DAT_147fda290;
    }
    dVar51 = 0.0;
    if (*pcVar8 == '\x02') {
      if (*(long *)(pcVar8 + 8) == 2) {
        dVar51 = *(double *)(pcVar8 + 0x10);
      }
      else if ((int)*(long *)(pcVar8 + 8) == 1) {
        dVar51 = (double)*(long *)(pcVar8 + 0x10);
      }
      else {
        dVar51 = ((double)CONCAT44(uRam0000000145d74074,
                                   (int)((ulong)*(undefined8 *)(pcVar8 + 0x10) >> 0x20)) -
                 (double)CONCAT44(uRam0000000145d7408c,uRam0000000145d74088)) +
                 ((double)CONCAT44(_DAT_145d74070,(int)*(undefined8 *)(pcVar8 + 0x10)) -
                 (double)CONCAT44(uRam0000000145d74084,_DAT_145d74080));
      }
    }
    ppuVar11 = (undefined8 **)0x0;
    if (0.0 <= dVar51) {
      ppuVar11 = (undefined8 **)
                 ((long)(dVar51 - _DAT_145d6d278) & (long)dVar51 >> 0x3f | (long)dVar51);
    }
    local_f8 = (undefined8 **)0xffffffffffffffff;
    if (dVar51 <= _DAT_145d6d280) {
      local_f8 = ppuVar11;
    }
    uStack_330 = (undefined8 **)0x4;
    uStack_328 = &local_348;
    local_320 = (long *)0x145dc06f8;
    uStack_318 = (long *)0x145dc07a8;
    local_310 = (undefined4 *)0x4;
    local_308 = &local_f8;
    uStack_300 = 0x145dc06f8;
    local_338 = ppuVar19;
    func_0x0001458da540();
    *puVar18 = local_d4;
    if (*plVar26 != 0) {
      func_0x0001400021d0();
    }
    plVar26[2] = (long)local_188;
    *(undefined4 *)plVar26 = (undefined4)local_198;
    *(undefined4 *)((long)plVar26 + 4) = local_198._4_4_;
    *(undefined4 *)(plVar26 + 1) = (undefined4)uStack_190;
    *(undefined4 *)((long)plVar26 + 0xc) = uStack_190._4_4_;
  }
  goto LAB_14027144d;
LAB_140271637:
  iVar6 = 0;
  iVar30 = 0;
  lVar17 = 0;
  goto LAB_14027163f;
LAB_1402716b5:
  if (lVar17 != 0) {
    *puVar37 = uVar29;
    *(char *)(lVar17 + 0x175) = cVar33;
    uVar39 = func_0x000145bc97bd(*(float *)(in_stack_00000030 + 0x5c) * _DAT_145dbf4f0);
    fVar40 = (float)(uVar39 & _DAT_145d9af40) * _DAT_145d6d7a4 + _DAT_145d73fc4;
    *puVar21 = uVar29;
    lVar31 = lRam0000000145dc06dc;
    *plVar26 = _DAT_145dc06d4;
    plVar26[1] = lVar31;
    *(float *)(plVar26 + 2) = fVar40;
  }
  goto LAB_140271707;
code_r0x00014027086c:
  iVar6 = func_0x000145bc9787();
  uVar9 = (ulong)local_108 & 0xffffffff;
  cVar33 = (char)local_100;
  if (iVar6 == 0) goto LAB_140270632;
LAB_1402708aa:
  puVar5 = local_110;
  if (-1 < (long)puVar22) {
    if (puVar22 == (undefined8 *)0x0) {
      local_110 = (undefined8 *)0x1;
    }
    else {
      func_0x000140002200();
      local_110 = (undefined8 *)func_0x0001400021c0();
      puVar5 = puVar22;
      if (local_110 == (undefined8 *)0x0) goto LAB_140271cd5;
      func_0x000145bc977b();
      cVar33 = (char)local_100;
    }
    *local_1a0 = local_d4;
    if (*local_d0 != (undefined8 *)0x0) {
      func_0x0001400021d0();
      cVar33 = (char)local_100;
    }
    *local_d0 = puVar22;
    local_d0[1] = local_110;
    local_d0[2] = puVar22;
    uVar9 = (ulong)local_108 & 0xffffffff;
    goto LAB_140270632;
  }
LAB_140271cd5:
  local_110 = puVar5;
  func_0x000145d6944b();
  goto LAB_140271ce2;
}
