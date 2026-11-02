
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,long *param_4,long param_5,
          long param_6)

{
  byte bVar1;
  char cVar2;
  code *pcVar3;
  long lVar4;
  char *pcVar5;
  long *plVar6;
  char *pcVar7;
  byte bVar8;
  char *pcVar9;
  long *plVar10;
  ulong uVar11;
  char *pcVar12;
  ulong uVar13;
  long extraout_RDX;
  long extraout_RDX_00;
  long extraout_RDX_01;
  long extraout_RDX_02;
  long lVar14;
  long lVar15;
  undefined1 uVar16;
  ulong uVar17;
  bool bVar18;
  undefined4 in_XMM6_Da;
  undefined4 uVar19;
  undefined4 in_XMM7_Da;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  uint uVar25;
  undefined4 uVar26;
  long local_3c0;
  ulong local_3b8;
  ulong local_3b0;
  long *local_3a8;
  undefined8 *local_3a0;
  ulong local_398;
  long *local_390;
  long *local_388;
  long local_380;
  char *pcStack_378;
  long local_370;
  ulong *puStack_368;
  undefined8 local_360;
  long lStack_358;
  undefined8 local_350;
  long *plStack_348;
  char *local_340;
  undefined4 uStack_338;
  undefined2 uStack_334;
  undefined1 uStack_332;
  undefined1 uStack_331;
  undefined7 local_330;
  undefined1 uStack_329;
  undefined4 uStack_328;
  undefined4 uStack_324;
  undefined4 uStack_320;
  undefined4 uStack_31c;
  undefined4 uStack_318;
  undefined4 uStack_314;
  undefined4 local_310;
  undefined4 uStack_30c;
  undefined8 uStack_308;
  undefined8 local_300;
  undefined8 uStack_2f8;
  undefined8 local_2f0;
  undefined8 uStack_2e8;
  undefined8 local_2e0;
  undefined8 uStack_2d8;
  undefined8 local_2d0;
  undefined8 local_2c8;
  undefined8 uStack_2c0;
  undefined8 local_2b8;
  undefined8 uStack_2b0;
  undefined8 local_2a8;
  undefined8 uStack_2a0;
  undefined8 local_298;
  undefined8 uStack_290;
  undefined8 local_288;
  undefined8 uStack_280;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined8 local_268;
  undefined8 uStack_260;
  undefined8 local_258;
  undefined8 uStack_250;
  undefined8 local_248;
  undefined8 uStack_240;
  undefined4 local_238;
  ulong local_234;
  undefined1 local_22c;
  undefined8 local_228;
  undefined4 local_220;
  undefined2 local_21c;
  undefined4 local_21a;
  undefined2 local_216;
  undefined4 local_214;
  undefined2 local_210;
  undefined8 local_20e;
  undefined4 local_206;
  undefined8 local_200;
  undefined8 uStack_1f8;
  undefined4 local_1f0;
  undefined8 local_1ec;
  undefined8 uStack_1e4;
  undefined4 local_1dc;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined4 local_1c8;
  undefined4 local_1c4;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  undefined4 uStack_1b8;
  undefined4 local_1b4;
  undefined8 local_1b0;
  undefined8 uStack_1a8;
  undefined4 local_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined4 local_188;
  undefined1 local_178;
  undefined7 uStack_177;
  undefined1 uStack_170;
  undefined4 uStack_16f;
  undefined4 uStack_16b;
  undefined4 uStack_167;
  undefined3 uStack_163;
  long local_148;
  char *pcStack_140;
  long *local_138;
  ulong *puStack_130;
  undefined8 uStack_128;
  undefined8 uStack_120;
  char *local_118;
  long *plStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  long local_e0;
  char *local_d8;
  long local_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined4 uStack_b0;
  undefined3 uStack_ac;
  undefined4 uStack_a8;
  undefined3 uStack_a4;
  undefined4 local_a0;
  undefined2 local_9c;
  undefined4 local_98;
  undefined2 local_94;
  undefined8 local_90;
  undefined4 local_88;
  undefined4 local_78;
  
  local_90 = 0xfffffffffffffffe;
  local_e0 = param_5;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  if (*(long *)(param_6 + 0x68) != 0) {
    local_148 = _DAT_1461c4110;
    pcStack_140 = pcRam00000001461c4118;
    local_138 = (long *)0x0;
    puStack_130 = _DAT_1461c4128;
    uStack_128 = uRam00000001461c4130;
    uStack_120 = 0;
    local_118 = _DAT_1461c4140;
    plStack_110 = plRam00000001461c4148;
    local_108 = 0;
    uStack_100 = CONCAT44(uRam00000001461c415c,_DAT_1461c4158);
    uStack_f8 = CONCAT44(uRam00000001461c4164,uRam00000001461c4160);
    uStack_f0 = 0;
    local_388 = (long *)*param_4;
    local_330 = (undefined7)uStack_f8;
    uStack_329 = (undefined1)((uint)uRam00000001461c4164 >> 0x18);
    uStack_328 = 0;
    uStack_324 = 0;
    local_340 = (char *)0x0;
    uStack_338 = _DAT_1461c4158;
    uStack_334 = (undefined2)uRam00000001461c415c;
    uStack_332 = (undefined1)((uint)uRam00000001461c415c >> 0x10);
    uStack_331 = (undefined1)((uint)uRam00000001461c415c >> 0x18);
    local_350 = _DAT_1461c4140;
    plStack_348 = plRam00000001461c4148;
    local_360 = uRam00000001461c4130;
    lStack_358 = 0;
    local_370 = 0;
    puStack_368 = _DAT_1461c4128;
    local_380 = _DAT_1461c4110;
    pcStack_378 = pcRam00000001461c4118;
    uStack_320 = 0;
    uStack_31c = 0;
    uStack_318 = 0;
    uStack_314 = 0;
    local_310 = 0;
    uStack_30c = 0;
    uStack_308 = 0;
    local_300 = 0;
    uStack_2f8 = 0;
    local_2f0 = 0;
    uStack_2e8 = 0;
    local_2e0 = 0;
    uStack_2d8 = 0;
    local_2d0 = 0;
    local_2b8 = _DAT_1461c41d8;
    uStack_2b0 = uRam00000001461c41e0;
    local_2c8 = _DAT_1461c41c8;
    uStack_2c0 = uRam00000001461c41d0;
    local_298 = _DAT_1461c41f8;
    uStack_290 = uRam00000001461c4200;
    local_2a8 = _DAT_1461c41e8;
    uStack_2a0 = uRam00000001461c41f0;
    local_278 = _DAT_1461c4218;
    uStack_270 = uRam00000001461c4220;
    local_288 = _DAT_1461c4208;
    uStack_280 = uRam00000001461c4210;
    local_258 = _DAT_1461c4238;
    uStack_250 = uRam00000001461c4240;
    local_268 = _DAT_1461c4228;
    uStack_260 = uRam00000001461c4230;
    local_248 = _DAT_1461b21f0;
    uStack_240 = uRam00000001461b21f8;
    local_238 = 1;
    local_234 = (ulong)_DAT_1461b2414;
    local_22c = 1;
    local_228 = 0;
    local_220 = 0x3f800000;
    local_21c = 0;
    local_216 = 0;
    local_21a = 0x10000;
    local_210 = 0;
    local_214 = 0x10000;
    local_20e = 0;
    local_206 = 0x5000005;
    func_0x0001402441d0(param_4,&local_178,param_4 + 1,&local_178,&local_388,0x1461c3d28);
    func_0x0001402854c0();
  }
  if (*(long *)(param_6 + 0xb0) != 0) {
    func_0x000145bbfea0();
    func_0x000145fd8260();
    uVar16 = *(undefined1 *)(param_6 + 0x173);
    func_0x000145fd8260();
    if (*(long *)(param_6 + 0x50) == 4) {
      bVar18 = **(int **)(param_6 + 0x48) == 0x74736f68;
    }
    else {
      bVar18 = false;
    }
    local_388 = (long *)0x0;
    local_380 = 1;
    pcStack_378 = (char *)0x0;
    local_370 = CONCAT71(uStack_177,local_178);
    puStack_368 = (ulong *)CONCAT35((undefined3)uStack_16b,CONCAT41(uStack_16f,uStack_170));
    local_360 = CONCAT35(uStack_163,CONCAT41(uStack_167,uStack_16b._3_1_));
    lStack_358 = local_148;
    local_350 = pcStack_140;
    plStack_348 = local_138;
    local_340 = (char *)(CONCAT53(CONCAT41((int)((ulong)local_340 >> 0x20),uVar16),
                                  CONCAT12(bVar18,(short)local_340)) & 0xffffffffffffff00);
    func_0x00014014ba40();
  }
  bVar1 = *(byte *)(param_6 + 0x175);
  if (bVar1 == 0) {
    bVar8 = 1;
LAB_140147ff9:
    local_3b0 = (ulong)bVar8;
    lVar14 = *(long *)(param_6 + 0x90);
    local_398 = *(ulong *)(param_6 + 0x98);
    local_3a8 = param_4 + 1;
    local_3a0 = (undefined8 *)*param_4;
    uVar21 = 0;
    uVar22 = 0;
    uVar23 = 0;
    uVar24 = 0;
    uVar26 = 0;
    lVar15 = lVar14;
    uVar13 = 0;
    uVar19 = _DAT_1461b2200;
    uVar20 = _DAT_1461bdfc4;
    uVar25 = _DAT_1461b2414;
    local_390 = param_4;
    local_d8 = param_3;
    local_d0 = param_6;
    do {
      local_3c0 = 0;
      local_1f0 = uVar19;
      if (uVar13 < local_398) {
        if (*(char *)(lVar15 + 0x6e) == '\0') {
          local_c8 = _DAT_1461c4b78;
          uStack_c0 = uRam00000001461c4b80;
          local_1f0 = uVar20;
        }
        else {
          local_c8 = _DAT_1461c4af8;
          uStack_c0 = uRam00000001461c4b00;
        }
        local_198 = _DAT_1461c4d78;
        uStack_190 = uRam00000001461c4d80;
        local_188 = 0x3ea3d70a;
        local_3c0 = lVar15;
      }
      else {
        local_c8 = _DAT_1461c4d64;
        uStack_c0 = uRam00000001461c4d6c;
        local_198 = _DAT_1461c4d8c;
        uStack_190 = uRam00000001461c4d94;
        local_188 = 0;
      }
      uStack_f8 = CONCAT44(uRam00000001461c4164,uRam00000001461c4160);
      uStack_100 = CONCAT44(uRam00000001461c415c,_DAT_1461c4158);
      plStack_110 = plRam00000001461c4148;
      local_118 = _DAT_1461c4140;
      uStack_128 = uRam00000001461c4130;
      puStack_130 = _DAT_1461c4128;
      pcStack_140 = pcRam00000001461c4118;
      local_148 = _DAT_1461c4110;
      local_94 = 0;
      local_98 = 0x10000;
      local_9c = 0;
      local_a0 = 0x10000;
      uStack_f0 = 0;
      local_108 = 0;
      uStack_120 = 0;
      local_138 = (long *)0x0;
      uVar17 = uVar13 + 1;
      local_1a0 = local_188;
      local_1b0 = local_198;
      uStack_1a8 = uStack_190;
      local_330 = (undefined7)uStack_f8;
      uStack_329 = (undefined1)((uint)uRam00000001461c4164 >> 0x18);
      uStack_328 = 0;
      uStack_324 = 0;
      local_340 = (char *)0x0;
      uStack_338 = _DAT_1461c4158;
      uStack_334 = (undefined2)uRam00000001461c415c;
      uStack_332 = (undefined1)((uint)uRam00000001461c415c >> 0x10);
      uStack_331 = (undefined1)((uint)uRam00000001461c415c >> 0x18);
      local_350 = _DAT_1461c4140;
      plStack_348 = plRam00000001461c4148;
      local_360 = uRam00000001461c4130;
      lStack_358 = 0;
      local_370 = 0;
      puStack_368 = _DAT_1461c4128;
      local_380 = _DAT_1461c4110;
      pcStack_378 = pcRam00000001461c4118;
      local_2b8 = _DAT_1461c41d8;
      uStack_2b0 = uRam00000001461c41e0;
      local_2c8 = _DAT_1461c41c8;
      uStack_2c0 = uRam00000001461c41d0;
      local_216 = 0;
      local_21a = 0x10000;
      local_210 = 0;
      local_214 = 0x10000;
      local_200 = local_c8;
      uStack_1f8 = uStack_c0;
      local_1ec = local_c8;
      uStack_1e4 = uStack_c0;
      local_1d8 = local_c8;
      uStack_1d0 = uStack_c0;
      local_1c4 = (undefined4)local_c8;
      uStack_1c0 = local_c8._4_4_;
      uStack_1bc = (undefined4)uStack_c0;
      uStack_1b8 = uStack_c0._4_4_;
      local_300 = CONCAT44(uVar22,uVar21);
      uStack_2f8 = CONCAT44(uVar24,uVar23);
      uStack_308 = CONCAT44(uVar24,uVar23);
      local_2f0 = 0x4238000000000001;
      uStack_2d8 = CONCAT44(uVar22,uVar21);
      local_2d0 = CONCAT44(uVar24,uVar23);
      uStack_2e8 = CONCAT44(uVar22,uVar21);
      local_2e0 = CONCAT44(uVar24,uVar23);
      local_2a8 = 0x4140000000000001;
      uStack_2a0 = 0x4140000000000001;
      local_298 = 0x40a0000000000001;
      uStack_290 = 0x40a0000000000001;
      local_288 = 0x3f80000000000001;
      uStack_280 = 0x3f80000000000001;
      local_278 = 0x3f80000000000001;
      uStack_270 = 0x3f80000000000001;
      local_268 = 0x40a0000000000001;
      uStack_260 = 0x40a0000000000001;
      local_258 = 0x40a0000000000001;
      uStack_250 = 0x40a0000000000001;
      local_248 = 0;
      uStack_240 = 1;
      local_238 = 1;
      local_234 = CONCAT44(uVar26,uVar25);
      local_22c = 1;
      local_228 = 0;
      local_220 = 0x3f800000;
      local_21c = 0;
      local_20e = 0;
      local_206 = 5;
      local_388 = local_3a0;
      local_3b8 = uVar13;
      uStack_320 = uVar21;
      uStack_31c = uVar22;
      uStack_318 = uVar23;
      uStack_314 = uVar24;
      local_310 = uVar21;
      uStack_30c = uVar22;
      local_1dc = local_1f0;
      local_1c8 = local_1f0;
      local_1b4 = local_1f0;
      func_0x000140244f40();
      local_388 = &local_3c0;
      local_380 = local_e0;
      pcStack_378 = local_d8;
      local_370 = local_d0;
      puStack_368 = &local_3b8;
      func_0x000140285800();
      lVar15 = lVar15 + 0x70;
      uVar11 = local_398;
      param_4 = local_390;
      param_3 = local_d8;
      param_6 = local_d0;
      uVar13 = uVar17;
    } while (local_3b0 != uVar17);
  }
  else {
    bVar8 = 5;
    if (bVar1 < 5) {
      bVar8 = bVar1;
    }
    if (bVar8 != 0) goto LAB_140147ff9;
    lVar14 = *(long *)(param_6 + 0x90);
    uVar11 = *(ulong *)(param_6 + 0x98);
  }
  lVar15 = uVar11 * 0x70;
  do {
    if (lVar15 == 0) goto LAB_140148688;
    lVar15 = lVar15 + -0x70;
    pcVar12 = (char *)(lVar14 + 0x6e);
    lVar14 = lVar14 + 0x70;
  } while (*pcVar12 != '\0');
  if ((*(long *)(param_6 + 0x50) == 4) && (**(int **)(param_6 + 0x48) == 0x74736f68)) {
    pcVar12 = (char *)0x1461c4c26;
    func_0x000145bbfea0();
    lVar14 = extraout_RDX_00;
  }
  else {
    pcVar12 = (char *)0x1461c4bb2;
    func_0x000145bbfea0();
    lVar14 = extraout_RDX;
  }
  if (lVar14 < 0) {
LAB_140148516:
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (lVar14 == 0) {
    pcVar9 = (char *)0x1;
    if (*param_3 == '\x01') goto LAB_140148579;
LAB_1401485a8:
    plVar10 = *(long **)(param_3 + 8);
    LOCK();
    lVar15 = *plVar10;
    *plVar10 = *plVar10 + 1;
    UNLOCK();
    lVar4 = local_380;
    pcVar5 = pcStack_378;
    plVar6 = plStack_348;
    pcVar7 = local_340;
    if (*plVar10 == 0 || SCARRY8(lVar15,1) != *plVar10 < 0) goto LAB_140148856;
    uVar16 = 0;
  }
  else {
    func_0x000140002200();
    pcVar9 = (char *)func_0x0001400021c0();
    if (pcVar9 == (char *)0x0) goto LAB_140148516;
    pcVar12 = pcVar9;
    func_0x00014600504b();
    if (*param_3 != '\x01') goto LAB_1401485a8;
LAB_140148579:
    uStack_a8 = *(undefined4 *)(param_3 + 1);
    uStack_a4 = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
    plVar10 = *(long **)(param_3 + 8);
    pcVar12 = (char *)(ulong)(byte)param_3[0x10];
    uVar16 = 1;
  }
  uStack_177 = (undefined7)_DAT_1461c4b78;
  uStack_170 = (undefined1)((ulong)_DAT_1461c4b78 >> 0x38);
  uStack_16f = (undefined4)uRam00000001461c4b80;
  uStack_16b = (undefined4)((ulong)uRam00000001461c4b80 >> 0x20);
  uStack_167 = 0x3f800000;
  local_388 = (long *)*param_4;
  puStack_368 = (ulong *)0x0;
  local_360 = 4;
  lStack_358 = 0;
  local_350._0_5_ = CONCAT41(uStack_a8,uVar16);
  local_350 = (char *)CONCAT44(CONCAT31(uStack_a4,uStack_a8._3_1_),(undefined4)local_350);
  uStack_338 = 0x41500000;
  uStack_334 = 400;
  uStack_332 = 1;
  uStack_331 = local_178;
  local_330 = uStack_177;
  uStack_329 = uStack_170;
  uStack_328 = uStack_16f;
  uStack_324 = uStack_16b;
  uStack_320 = 0x3f800000;
  uStack_31c = (undefined4)_DAT_1461c4290;
  uStack_318 = (undefined4)((ulong)_DAT_1461c4290 >> 0x20);
  uStack_314 = (undefined4)uRam00000001461c4298;
  local_310 = (undefined4)((ulong)uRam00000001461c4298 >> 0x20);
  uStack_30c = 0x3f59999a;
  uStack_308 = _DAT_1461b24f0;
  local_380 = lVar14;
  pcStack_378 = pcVar9;
  local_370 = lVar14;
  plStack_348 = plVar10;
  local_340 = pcVar12;
  func_0x00014025a890();
LAB_140148688:
  if ((*(long *)(param_6 + 0x50) == 4) && (**(int **)(param_6 + 0x48) == 0x74736f68)) {
    uVar13 = 0x1461c4d07;
    func_0x000145bbfea0();
    lVar14 = extraout_RDX_02;
  }
  else {
    uVar13 = 0x1461c4cbb;
    func_0x000145bbfea0();
    lVar14 = extraout_RDX_01;
  }
  if (lVar14 < 0) {
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (lVar14 == 0) {
    cVar2 = *param_3;
    uVar11 = 1;
    lVar4 = local_380;
    pcVar5 = pcStack_378;
    plVar6 = plStack_348;
    pcVar7 = local_340;
  }
  else {
    func_0x000140002200();
    uVar11 = func_0x0001400021c0();
    if (uVar11 == 0) {
      func_0x0001461add5b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    uVar13 = uVar11;
    func_0x00014600504b();
    cVar2 = *param_3;
    lVar4 = local_380;
    pcVar5 = pcStack_378;
    plVar6 = plStack_348;
    pcVar7 = local_340;
  }
  local_380 = lVar14;
  local_340 = (char *)uVar13;
  pcStack_378 = (char *)uVar11;
  if (cVar2 == '\x01') {
    uStack_b0 = *(undefined4 *)(param_3 + 1);
    uStack_ac = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
    plStack_348 = *(long **)(param_3 + 8);
    local_340 = (char *)(ulong)(byte)param_3[0x10];
    uVar16 = 1;
  }
  else {
    plStack_348 = *(long **)(param_3 + 8);
    LOCK();
    lVar14 = *plStack_348;
    *plStack_348 = *plStack_348 + 1;
    UNLOCK();
    if (*plStack_348 == 0 || SCARRY8(lVar14,1) != *plStack_348 < 0) {
LAB_140148856:
      local_340 = pcVar7;
      plStack_348 = plVar6;
      pcStack_378 = pcVar5;
      local_380 = lVar4;
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    uVar16 = 0;
  }
  uStack_177 = (undefined7)_DAT_1461c4d50;
  uStack_170 = (undefined1)((ulong)_DAT_1461c4d50 >> 0x38);
  uStack_16f = (undefined4)uRam00000001461c4d58;
  uStack_16b = (undefined4)((ulong)uRam00000001461c4d58 >> 0x20);
  uStack_167 = 0x3f800000;
  local_388 = (long *)*param_4;
  puStack_368 = (ulong *)0x0;
  local_360 = 4;
  lStack_358 = 0;
  local_350._0_5_ = CONCAT41(uStack_b0,uVar16);
  local_350 = (char *)CONCAT44(CONCAT31(uStack_ac,uStack_b0._3_1_),(undefined4)local_350);
  uStack_338 = 0x41600000;
  uStack_334 = 400;
  uStack_332 = 1;
  local_330 = uStack_177;
  uStack_329 = uStack_170;
  uStack_328 = uStack_16f;
  uStack_324 = uStack_16b;
  uStack_320 = 0x3f800000;
  uStack_31c = (undefined4)_DAT_1461c4290;
  uStack_318 = (undefined4)((ulong)_DAT_1461c4290 >> 0x20);
  uStack_314 = (undefined4)uRam00000001461c4298;
  local_310 = (undefined4)((ulong)uRam00000001461c4298 >> 0x20);
  uStack_30c = 0x3f59999a;
  uStack_308 = _DAT_1461b24f0;
  local_370 = local_380;
  func_0x00014025a890();
  return;
}

