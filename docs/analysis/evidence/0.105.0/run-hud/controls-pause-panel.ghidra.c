/* WARNING: Removing unreachable block (ram,0x00014027a8ed) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  uint *puVar1;
  char cVar2;
  code *pcVar3;
  long lVar4;
  ulong uVar5;
  byte bVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  uint *puVar12;
  undefined1 auVar13 [16];
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  undefined8 *in_stack_00000040;
  undefined4 local_3a8;
  undefined4 uStack_3a4;
  undefined4 uStack_3a0;
  undefined4 uStack_39c;
  undefined4 local_398;
  undefined4 uStack_394;
  undefined4 uStack_390;
  undefined4 uStack_38c;
  undefined8 local_388;
  undefined8 uStack_380;
  long local_378;
  undefined8 uStack_370;
  undefined8 local_368;
  long local_360;
  long lStack_358;
  long local_350;
  long lStack_348;
  long local_340;
  long lStack_338;
  long local_330;
  long lStack_328;
  char *local_320;
  undefined8 uStack_318;
  undefined8 local_310;
  undefined8 uStack_308;
  long local_300;
  long lStack_2f8;
  long local_2f0;
  long local_2e8;
  long lStack_2e0;
  long local_2d8;
  long lStack_2d0;
  undefined4 local_2c8;
  undefined4 uStack_2c4;
  undefined4 uStack_2c0;
  undefined4 uStack_2bc;
  undefined8 local_2b8;
  undefined8 uStack_2b0;
  long local_2a8;
  undefined1 *puStack_2a0;
  long local_298;
  undefined4 *local_290;
  undefined4 *local_288;
  byte *local_280;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined8 local_268;
  undefined8 local_260;
  undefined8 local_258;
  undefined8 uStack_250;
  undefined8 local_248;
  undefined8 uStack_240;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined8 local_228;
  undefined8 local_220;
  undefined8 uStack_218;
  undefined8 local_210;
  undefined8 uStack_208;
  undefined8 local_200;
  undefined8 uStack_1f8;
  undefined8 local_1f0;
  undefined8 uStack_1e8;
  undefined8 local_1e0;
  undefined8 uStack_1d8;
  undefined8 local_1d0;
  undefined8 uStack_1c8;
  undefined8 local_1c0;
  undefined8 uStack_1b8;
  undefined8 local_1b0;
  undefined8 uStack_1a8;
  undefined8 local_1a0;
  undefined8 uStack_198;
  undefined8 local_190;
  undefined8 uStack_188;
  undefined8 local_180;
  undefined8 uStack_178;
  undefined4 local_170;
  undefined4 uStack_16c;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined4 local_160;
  undefined8 local_15c;
  undefined1 local_154;
  undefined8 local_150;
  undefined4 local_148;
  undefined2 local_144;
  undefined4 local_142;
  undefined2 local_13e;
  undefined4 local_13c;
  undefined2 local_138;
  undefined2 local_136;
  undefined8 local_134;
  undefined2 local_12c;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined2 local_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  undefined8 local_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined8 local_b0;
  undefined4 local_a0;
  float local_9c;
  undefined8 local_98;
  undefined8 local_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 local_78;
  undefined1 *local_70;
  long local_68;
  undefined1 *puStack_60;
  long local_58;
  byte local_4a [10];

  local_4a[2] = 0xfe;
  local_4a[3] = 0xff;
  local_4a[4] = 0xff;
  local_4a[5] = 0xff;
  local_4a[6] = 0xff;
  local_4a[7] = 0xff;
  local_4a[8] = 0xff;
  local_4a[9] = 0xff;
  local_98 = param_3[4];
  local_88 = *param_3;
  local_80 = param_3[1];
  local_378 = param_3[2];
  local_90 = param_3[3];
  lVar7 = *param_5;
  lStack_358 = param_5[1];
  local_350 = param_5[2];
  lStack_348 = param_5[3];
  lVar8 = *param_6;
  lStack_338 = param_6[1];
  local_330 = param_6[2];
  lStack_328 = param_6[3];
  local_320 = (char *)*in_stack_00000028;
  uStack_318 = in_stack_00000028[1];
  local_310 = in_stack_00000028[2];
  uStack_308 = in_stack_00000028[3];
  local_2e8 = *in_stack_00000030;
  lStack_2e0 = in_stack_00000030[1];
  local_2d8 = in_stack_00000030[2];
  lStack_2d0 = in_stack_00000030[3];
  local_300 = *in_stack_00000038;
  lVar4 = in_stack_00000038[1];
  local_2f0 = in_stack_00000038[2];
  local_2c8 = *(undefined4 *)in_stack_00000040;
  uStack_2c4 = *(undefined4 *)((long)in_stack_00000040 + 4);
  uStack_2c0 = *(undefined4 *)(in_stack_00000040 + 1);
  uStack_2bc = *(undefined4 *)((long)in_stack_00000040 + 0xc);
  local_2b8 = in_stack_00000040[2];
  uStack_2b0 = in_stack_00000040[3];
  local_388 = local_88;
  uStack_380 = local_80;
  uStack_370 = local_90;
  local_368 = local_98;
  local_360 = lVar7;
  local_340 = lVar8;
  lStack_2f8 = lVar4;
  if (((*(char *)(lVar7 + 0xea) == '\x01') && (*(char *)(lVar7 + 0xe8) == '\x01')) &&
     (*(char *)(lVar7 + 0xa0) == -1)) {
    local_4a[0] = *(byte *)*in_stack_00000040 ^ 1;
    if (*(byte *)*in_stack_00000040 == 0) {
      if (*(char *)(local_300 + 0x108) == '\0') {
        lVar9 = 0;
        while (*(long *)(local_300 + 0x100) << 2 != lVar9) {
          puVar12 = (uint *)(*(long *)(local_300 + 0xf8) + lVar9);
          lVar9 = lVar9 + 4;
          if (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)*puVar12 * 0xa0) != 0) {
            return;
          }
        }
      }
      else {
        lVar9 = 0;
        while (*(long *)(local_300 + 0x100) << 2 != lVar9) {
          puVar12 = (uint *)(*(long *)(local_300 + 0xf8) + lVar9);
          lVar9 = lVar9 + 4;
          if (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)*puVar12 * 0x48) != 0) {
            return;
          }
        }
      }
      goto LAB_14027a8fa;
    }
  }
  else {
    local_4a[0] = 0;
  }
  puVar12 = *(uint **)(local_300 + 0xf8);
  lVar9 = *(long *)(local_300 + 0x100) * 4;
  lVar10 = 0;
  if (*(char *)(local_300 + 0x108) == '\0') {
    do {
      if (lVar9 - lVar10 == 0) goto LAB_14027a8f2;
      puVar1 = (uint *)((long)puVar12 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)*puVar1 * 0xa0) == 0);
  }
  else {
    do {
      if (lVar9 - lVar10 == 0) goto LAB_14027a8f2;
      puVar1 = (uint *)((long)puVar12 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) == 0);
  }
  if (*local_320 != '\0') {
    return;
  }
  puVar1 = puVar12 + *(long *)(local_300 + 0x100);
  local_70 = (undefined1 *)local_378;
  if (*(char *)(local_300 + 0x108) != '\0') {
LAB_14027aa90:
    do {
      do {
        if (puVar12 == puVar1) {
          return;
        }
        uVar11 = *puVar12;
        puVar12 = puVar12 + 1;
        lVar7 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
      } while (lVar7 == 0);
      lVar8 = *(long *)(*(long *)(lVar4 + 0x1a8) + (ulong)uVar11 * 0x48 + 8);
      uVar11 = 0;
      do {
        while( true ) {
          uVar5 = (ulong)uVar11;
          uVar11 = uVar11 + 1;
          local_2a8 = *(undefined8 *)(lVar8 + uVar5 * 8);
          if ((int)local_2a8 == 0) break;
          local_280 = (byte *)local_78;
          if (local_70 != (undefined1 *)0x0) {
            local_280 = (byte *)local_98;
          }
          local_290 = (undefined4 *)local_70;
          puStack_2a0 = (undefined1 *)local_88;
          local_298 = local_80;
          local_288 = (undefined4 *)local_90;
          local_78 = local_280;
          func_0x000144e5ebd0();
          if (uVar11 == (uint)lVar7) goto LAB_14027aa90;
        }
      } while (uVar11 != (uint)lVar7);
    } while( true );
  }
LAB_14027ab80:
  do {
    do {
      if (puVar12 == puVar1) {
        return;
      }
      uVar11 = *puVar12;
      puVar12 = puVar12 + 1;
      lVar7 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
    } while (lVar7 == 0);
    lVar8 = *(long *)(*(long *)(lVar4 + 0x108) + (ulong)uVar11 * 0xa0 + 0x50);
    uVar11 = 0;
    do {
      while( true ) {
        uVar5 = (ulong)uVar11;
        uVar11 = uVar11 + 1;
        local_2a8 = *(undefined8 *)(lVar8 + uVar5 * 0x10);
        if ((int)local_2a8 == 0) break;
        local_280 = (byte *)local_78;
        if (local_70 != (undefined1 *)0x0) {
          local_280 = (byte *)local_98;
        }
        local_290 = (undefined4 *)local_70;
        puStack_2a0 = (undefined1 *)local_88;
        local_298 = local_80;
        local_288 = (undefined4 *)local_90;
        local_78 = local_280;
        func_0x000144e5ebd0();
        if (uVar11 == (uint)lVar7) goto LAB_14027ab80;
      }
    } while (uVar11 != (uint)lVar7);
  } while( true );
LAB_14027a8f2:
  if (*local_320 == '\0') {
    return;
  }
LAB_14027a8fa:
  if (local_2e8 != 0) {
    local_3a8 = (undefined4)*in_stack_00000030;
    uStack_3a4 = *(undefined4 *)((long)in_stack_00000030 + 4);
    uStack_3a0 = (undefined4)in_stack_00000030[1];
    uStack_39c = *(undefined4 *)((long)in_stack_00000030 + 0xc);
    local_398 = (undefined4)in_stack_00000030[2];
    uStack_394 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
    uStack_390 = (undefined4)in_stack_00000030[3];
    uStack_38c = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
    bVar6 = local_4a[0];
    func_0x000140002200();
    local_70 = (undefined1 *)func_0x0001400021c0();
    if (local_70 == (undefined1 *)0x0) {
      func_0x000145d69431();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (bVar6 == 0) {
      auVar13 = func_0x0001458da4e0();
    }
    else {
      auVar13 = func_0x0001458da4e0();
    }
    *local_70 = 0;
    *(undefined1 (*) [16])(local_70 + 8) = auVar13;
    local_68 = 1;
    puStack_60 = local_70;
    local_58 = 1;
    cVar2 = *(char *)(lVar8 + 0xd);
    if ((cVar2 != '\0') || (*(char *)(lVar7 + 0xe8) == '\x01')) {
      local_4a[1] = 1;
      auVar13 = func_0x0001458da4e0();
      lVar4 = local_58;
      if (local_58 == local_68) {
        local_4a[1] = 1;
        func_0x000145bcb3e0();
      }
      puStack_60[lVar4 * 0x18] = 1;
      *(long *)(puStack_60 + lVar4 * 0x18 + 8) = auVar13._0_8_;
      *(long *)(puStack_60 + lVar4 * 0x18 + 0x10) = auVar13._8_8_;
      local_58 = lVar4 + 1;
      if ((cVar2 == '\0') && (*(char *)(lVar7 + 0xe8) != '\0')) {
        if (*(char *)(lVar8 + 0xc) == '\0') {
          local_4a[1] = 1;
          auVar13 = func_0x0001458da4e0();
        }
        else {
          local_4a[1] = 1;
          auVar13 = func_0x0001458da4e0();
        }
        lVar7 = local_58;
        if (local_58 == local_68) {
          local_4a[1] = 1;
          func_0x000145bcb3e0();
        }
        puStack_60[lVar7 * 0x18] = 2;
        *(long *)(puStack_60 + lVar7 * 0x18 + 8) = auVar13._0_8_;
        *(long *)(puStack_60 + lVar7 * 0x18 + 0x10) = auVar13._8_8_;
        local_58 = lVar7 + 1;
      }
    }
    local_4a[1] = 1;
    auVar13 = func_0x0001458da4e0();
    lVar7 = local_58;
    if (local_58 == local_68) {
      local_4a[1] = 1;
      func_0x000145bcb3e0();
    }
    puStack_60[lVar7 * 0x18] = 3;
    *(long *)(puStack_60 + lVar7 * 0x18 + 8) = auVar13._0_8_;
    local_58 = lVar7 + 1;
    *(long *)(puStack_60 + lVar7 * 0x18 + 0x10) = auVar13._8_8_;
    local_9c = (float)local_58 * _DAT_145dbf588 + _DAT_145dbf58c;
    local_a0 = 0x43d20000;
    local_108 = _DAT_145dc0410;
    uStack_100 = uRam0000000145dc0418;
    local_f8 = 0;
    local_f0 = _DAT_145dc0428;
    uStack_e8 = uRam0000000145dc0430;
    local_e0 = 0;
    local_d8 = _DAT_145dc0440;
    uStack_d0 = uRam0000000145dc0448;
    local_c8 = 0;
    local_c0 = _DAT_145dc0458;
    uStack_bc = uRam0000000145dc045c;
    uStack_b8 = uRam0000000145dc0460;
    uStack_b4 = uRam0000000145dc0464;
    local_b0 = 0;
    local_2a8 = _DAT_145dc0410;
    puStack_2a0 = (undefined1 *)uRam0000000145dc0418;
    local_298 = 0;
    local_290 = (undefined4 *)_DAT_145dc0428;
    local_288 = (undefined4 *)uRam0000000145dc0430;
    local_280 = (byte *)0x0;
    local_278 = _DAT_145dc0440;
    uStack_270 = uRam0000000145dc0448;
    local_268 = 0;
    local_260 = CONCAT44(uRam0000000145dc045c,_DAT_145dc0458);
    local_258 = CONCAT44(uRam0000000145dc0464,uRam0000000145dc0460);
    uStack_250 = 0;
    local_238 = 0;
    uStack_230 = 0;
    local_248 = 0;
    uStack_240 = 0;
    local_228 = 0;
    local_220 = _DAT_145d6d800;
    uStack_218 = uRam0000000145d6d808;
    local_200 = 0;
    uStack_1f8 = 0;
    local_210 = 0;
    uStack_208 = 0;
    local_1e0 = _DAT_145dc04d8;
    uStack_1d8 = uRam0000000145dc04e0;
    local_1f0 = _DAT_145dc04c8;
    uStack_1e8 = uRam0000000145dc04d0;
    local_1c0 = _DAT_145dc04f8;
    uStack_1b8 = uRam0000000145dc0500;
    local_1d0 = _DAT_145dc04e8;
    uStack_1c8 = uRam0000000145dc04f0;
    local_1a0 = _DAT_145dc0518;
    uStack_198 = uRam0000000145dc0520;
    local_1b0 = _DAT_145dc0508;
    uStack_1a8 = uRam0000000145dc0510;
    local_180 = _DAT_145dc0538;
    uStack_178 = uRam0000000145dc0540;
    local_190 = _DAT_145dc0528;
    uStack_188 = uRam0000000145dc0530;
    local_170 = _DAT_145d6d260;
    uStack_16c = uRam0000000145d6d264;
    uStack_168 = uRam0000000145d6d268;
    uStack_164 = uRam0000000145d6d26c;
    local_160 = 1;
    local_15c = 0;
    local_154 = 1;
    local_150 = 0;
    local_148 = 0x3f800000;
    local_144 = 0;
    local_13e = 0;
    local_142 = 0x10000;
    local_138 = 0;
    local_13c = 0x10000;
    local_136 = 0x100;
    local_12c = 0;
    local_134 = 0;
    local_128 = 0;
    uStack_120 = 0;
    local_118 = 0x19003f0ccccd;
    local_110 = 2;
    local_4a[1] = 1;
    func_0x0001401a0390();
    local_290 = &local_a0;
    local_288 = &local_3a8;
    local_280 = local_4a;
    local_2a8 = local_68;
    puStack_2a0 = puStack_60;
    local_298 = local_58;
    local_4a[1] = 0;
    func_0x0001401b3d20();
  }
  return;
}
