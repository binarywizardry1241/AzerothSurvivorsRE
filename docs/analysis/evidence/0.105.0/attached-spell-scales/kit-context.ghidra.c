void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  uint uVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  undefined4 in_XMM6_Da;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined8 *in_stack_00000028;
  undefined8 *in_stack_00000030;
  long *in_stack_00000038;
  undefined8 *in_stack_00000040;
  undefined8 *in_stack_00000048;
  undefined8 *in_stack_00000050;
  undefined8 *in_stack_00000058;
  undefined8 *in_stack_00000060;
  undefined8 *in_stack_00000068;
  undefined8 *in_stack_00000070;
  undefined8 *in_stack_00000078;
  undefined1 local_409;
  long local_408;
  long local_400;
  uint local_3f8;
  uint local_3f4;
  long local_3f0;
  long local_3e8;
  long local_3e0;
  long local_3d8;
  long local_3d0;
  undefined4 local_3c8;
  undefined4 local_3c4;
  long local_3c0;
  long local_3b8;
  long local_3b0;
  long local_3a8;
  long local_3a0;
  long local_398;
  undefined8 local_390;
  long local_388;
  long local_380;
  long local_378;
  long local_370;
  undefined8 local_368;
  undefined4 *local_360;
  undefined8 *local_358;
  undefined8 *local_350;
  undefined8 *local_348;
  long *local_340;
  undefined8 *local_338;
  undefined1 *local_330;
  undefined8 *local_328;
  long local_320;
  long *local_318;
  long *local_310;
  undefined8 *local_308;
  undefined8 *local_300;
  undefined8 *local_2f8;
  undefined8 *local_2f0;
  undefined8 *local_2e8;
  undefined8 *local_2e0;
  undefined8 *local_2d8;
  uint *local_2d0;
  uint *local_2c8;
  long local_2c0;
  long local_2b0;
  long local_2a0;
  byte local_298;
  long local_290;
  long local_288;
  long local_280;
  undefined8 local_278;
  byte local_270;
  long local_268;
  long local_258;
  undefined4 local_24c;
  long local_248;
  undefined1 local_240;
  uint local_238;
  uint local_234;
  byte local_230;
  undefined8 local_228;
  undefined8 uStack_220;
  undefined8 local_218;
  undefined8 uStack_210;
  undefined8 local_208;
  long local_200;
  long lStack_1f8;
  ulong local_1f0;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  long local_1c8;
  long lStack_1c0;
  long local_1b8;
  long lStack_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined8 uStack_180;
  undefined8 local_178;
  undefined8 uStack_170;
  undefined8 local_168;
  undefined8 uStack_160;
  undefined8 local_158;
  undefined8 uStack_150;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  long local_d0;
  long lStack_c8;
  long local_c0;
  long lStack_b8;
  undefined8 local_b0;
  undefined8 uStack_a8;
  undefined8 local_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  long local_78;
  long lStack_70;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 local_58;

  local_208 = param_3[4];
  local_228 = *param_3;
  uStack_220 = param_3[1];
  local_218 = param_3[2];
  uStack_210 = param_3[3];
  local_1f0 = param_5[2];
  lVar9 = *param_5;
  lVar10 = param_5[1];
  local_d0 = *param_6;
  lStack_c8 = param_6[1];
  local_c0 = param_6[2];
  lStack_b8 = param_6[3];
  local_1e8 = *in_stack_00000028;
  uStack_1e0 = in_stack_00000028[1];
  local_1d8 = in_stack_00000028[2];
  uStack_1d0 = in_stack_00000028[3];
  local_b0 = *in_stack_00000030;
  uStack_a8 = in_stack_00000030[1];
  local_a0 = in_stack_00000030[2];
  uStack_98 = in_stack_00000030[3];
  local_1c8 = *in_stack_00000038;
  lStack_1c0 = in_stack_00000038[1];
  local_1b8 = in_stack_00000038[2];
  lStack_1b0 = in_stack_00000038[3];
  local_1a8 = *in_stack_00000040;
  uStack_1a0 = in_stack_00000040[1];
  local_198 = in_stack_00000040[2];
  uStack_190 = in_stack_00000040[3];
  local_188 = *in_stack_00000048;
  uStack_180 = in_stack_00000048[1];
  local_178 = in_stack_00000048[2];
  uStack_170 = in_stack_00000048[3];
  local_168 = *in_stack_00000050;
  uStack_160 = in_stack_00000050[1];
  local_158 = in_stack_00000050[2];
  uStack_150 = in_stack_00000050[3];
  local_148 = *in_stack_00000058;
  uStack_140 = in_stack_00000058[1];
  local_138 = in_stack_00000058[2];
  uStack_130 = in_stack_00000058[3];
  local_128 = *in_stack_00000060;
  uStack_120 = in_stack_00000060[1];
  local_118 = in_stack_00000060[2];
  uStack_110 = in_stack_00000060[3];
  local_108 = *in_stack_00000068;
  uStack_100 = in_stack_00000068[1];
  local_f8 = in_stack_00000068[2];
  uStack_f0 = in_stack_00000068[3];
  local_d8 = in_stack_00000070[2];
  local_e8 = *in_stack_00000070;
  uStack_e0 = in_stack_00000070[1];
  local_90 = *in_stack_00000078;
  uStack_88 = in_stack_00000078[1];
  local_80 = in_stack_00000078[2];
  if (local_d0 == 0) {
    return;
  }
  local_78 = *param_6;
  lStack_70 = param_6[1];
  local_68 = (undefined4)param_6[2];
  uStack_64 = *(undefined4 *)((long)param_6 + 0x14);
  uStack_60 = (undefined4)param_6[3];
  uStack_5c = *(undefined4 *)((long)param_6 + 0x1c);
  local_3c4 = *(undefined4 *)(local_1c8 + 0x5c);
  local_200 = lVar9;
  lStack_1f8 = lVar10;
  local_58 = in_XMM6_Da;
  func_0x000140717be0(lVar10,lVar9,lVar10,&local_2d0,lVar9,local_1f0 & 0xffffffff);
  local_3b8 = local_2c0;
  local_400 = local_2a0;
  uVar4 = (ulong)local_298;
  local_3d0 = local_290;
  local_3d8 = local_288;
  local_3e0 = local_280;
  uVar15 = (undefined4)local_278;
  uVar16 = (undefined4)((ulong)local_278 >> 0x20);
  uVar11 = (ulong)local_270;
  local_3c8 = local_24c;
  local_408 = local_248;
  uVar8 = (ulong)local_238;
  if ((local_230 & 1) == 0) goto LAB_14059fd89;
  do {
    if (local_234 == (uint)uVar8) {
      do {
        if (local_2d0 == local_2c8) {
          return;
        }
        uVar1 = *local_2d0;
        local_2d0 = local_2d0 + 1;
        uVar8 = *(ulong *)(*(long *)(lVar10 + 0x1a8) + 0x10 + (ulong)uVar1 * 0x48);
      } while (uVar8 == 0);
      lVar6 = *(long *)(lVar10 + 0x1a8) + (ulong)uVar1 * 0x48;
      uVar3 = *(ulong *)(lVar6 + 0x40);
      lVar2 = *(long *)(lVar6 + 0x18);
      lVar7 = *(long *)(lVar6 + 0x38);
      if ((*(ulong *)(lVar9 + 0x118) < uVar3) &&
         (uVar11 = *(ulong *)(lVar7 + *(ulong *)(lVar9 + 0x118) * 8), uVar11 != 0)) {
        local_400 = *(long *)(lVar2 + 0x10 + ~uVar11 * 0x30);
        uVar4 = CONCAT71((int7)(uVar4 >> 8),1);
        uVar11 = *(ulong *)(lVar9 + 0x120);
        if (uVar3 <= uVar11) goto LAB_1405a0100;
LAB_1405a00af:
        uVar11 = *(ulong *)(lVar7 + uVar11 * 8);
        if (uVar11 == 0) goto LAB_1405a0100;
        lVar13 = ~uVar11 * 0x30;
        local_3d0 = *(long *)(lVar2 + 0x10 + lVar13);
        local_3d8 = *(long *)(lVar2 + 0x20 + lVar13);
        local_3e0 = *(long *)(lVar2 + 0x28 + lVar13);
        uVar11 = CONCAT71((int7)((ulong)local_3d8 >> 8),1);
        uVar12 = *(ulong *)(lVar9 + 0x128);
        if (uVar12 < uVar3) goto LAB_1405a010f;
LAB_1405a0130:
        local_408 = 0;
      }
      else {
        uVar4 = 0;
        uVar11 = *(ulong *)(lVar9 + 0x120);
        if (uVar11 < uVar3) goto LAB_1405a00af;
LAB_1405a0100:
        uVar11 = 0;
        uVar12 = *(ulong *)(lVar9 + 0x128);
        if (uVar3 <= uVar12) goto LAB_1405a0130;
LAB_1405a010f:
        uVar12 = *(ulong *)(lVar7 + uVar12 * 8);
        if (uVar12 == 0) goto LAB_1405a0130;
        local_408 = *(long *)(lVar2 + 0x10 + ~uVar12 * 0x30);
      }
      local_234 = 0;
      local_240 = false;
      if (*(ulong *)(lVar9 + 0x130) < uVar3) {
        local_240 = *(long *)(lVar7 + *(ulong *)(lVar9 + 0x130) * 8) != 0;
      }
      lVar7 = ~*(ulong *)(lVar7 + *(long *)(lVar9 + 0x110) * 8) * 0x30;
      local_268 = *(long *)(lVar2 + 0x10 + lVar7);
      local_258 = *(long *)(lVar2 + 0x28 + lVar7);
      local_2c0 = *(long *)(lVar6 + 8);
    }
    uVar3 = (ulong)local_234;
    local_234 = local_234 + 1;
    local_390 = *(undefined8 *)(local_2c0 + uVar3 * 8);
    if ((int)local_390 != 0) {
      local_388 = uVar3 * 0x60 + local_400;
      local_3f4 = (uint)uVar4;
      if ((uVar4 & 1) == 0) {
        local_388 = 0;
      }
      local_380 = 0;
      local_3f8 = (uint)uVar11;
      if ((char)uVar11 == '\x01') {
        local_380 = uVar3 * 0xb8 + local_3d0;
        local_3a8 = local_3d8 + uVar3 * 4;
        local_3b0 = local_3e0 + uVar3 * 4;
      }
      local_3c0 = local_268 + uVar3 * 0x18;
      puVar5 = (undefined4 *)(local_258 + uVar3 * 4);
      local_320 = uVar3 * 0x40 + local_408;
      local_370 = local_3b0;
      local_378 = local_3a8;
      local_3f0 = local_258;
      local_3e8 = local_268;
      local_3b8 = local_2c0;
      while( true ) {
        local_368 = CONCAT44(uVar16,uVar15);
        *puVar5 = local_3c8;
        local_360 = &local_3c4;
        local_358 = &local_e8;
        local_350 = &local_228;
        local_348 = &local_390;
        local_340 = &local_78;
        local_338 = &local_1e8;
        local_330 = &local_409;
        local_328 = &local_b0;
        local_318 = &local_388;
        local_310 = &local_380;
        local_308 = &local_90;
        local_300 = &local_1a8;
        local_2f8 = &local_188;
        local_2f0 = &local_168;
        local_2e8 = &local_148;
        local_2e0 = &local_128;
        local_2d8 = &local_108;
        local_409 = local_240;
        func_0x0001408ab740();
        uVar4 = (ulong)local_3f4;
        uVar11 = (ulong)local_3f8;
        local_2c0 = local_3b8;
        local_268 = local_3e8;
        local_258 = local_3f0;
        if ((local_230 & 1) != 0) break;
LAB_14059fd89:
        do {
          if (local_234 == (uint)uVar8) {
            do {
              if (local_2d0 == local_2c8) {
                return;
              }
              uVar1 = *local_2d0;
              local_2d0 = local_2d0 + 1;
              uVar8 = *(ulong *)(*(long *)(lVar10 + 0x108) + 0x58 + (ulong)uVar1 * 0xa0);
            } while (uVar8 == 0);
            lVar7 = *(long *)(lVar10 + 0x108) + (ulong)uVar1 * 0xa0;
            uVar4 = (ulong)*(uint *)(lVar7 + 0x94);
            lVar6 = *(long *)(lVar10 + 0x1a8);
            uVar3 = *(ulong *)(lVar6 + 0x40 + uVar4 * 0x48);
            lVar2 = *(long *)(lVar6 + 0x18 + uVar4 * 0x48);
            lVar6 = *(long *)(lVar6 + 0x38 + uVar4 * 0x48);
            uVar11 = *(ulong *)(lVar9 + 0x118);
            uVar12 = *(ulong *)(lVar7 + 0x88);
            if ((uVar11 < uVar12) && (*(long *)(*(long *)(lVar7 + 0x80) + uVar11 * 8) != 0)) {
              uVar4 = CONCAT71((int7)((ulong)*(long *)(lVar7 + 0x80) >> 8),1);
              if ((uVar3 <= uVar11) || (uVar11 = *(ulong *)(lVar6 + uVar11 * 8), uVar11 == 0)) {
                local_400 = 0;
                uVar11 = *(ulong *)(lVar9 + 0x120);
                goto joined_r0x00014059fe4d;
              }
              local_400 = *(long *)(lVar2 + 0x10 + ~uVar11 * 0x30);
              uVar11 = *(ulong *)(lVar9 + 0x120);
              if (uVar12 <= uVar11) goto LAB_14059feb6;
LAB_14059fe4f:
              if (*(long *)(*(long *)(lVar7 + 0x80) + uVar11 * 8) != 0) {
                lVar13 = ~*(ulong *)(lVar6 + uVar11 * 8) * 0x30;
                local_3d0 = *(long *)(lVar2 + 0x10 + lVar13);
                local_3d8 = *(long *)(lVar2 + 0x20 + lVar13);
                local_3e0 = *(long *)(lVar2 + 0x28 + lVar13);
                uVar11 = 1;
                uVar4 = uVar4 & 0xffffffff;
                uVar14 = *(ulong *)(lVar9 + 0x128);
                goto joined_r0x00014059fec3;
              }
              uVar11 = 0;
              uVar4 = uVar4 & 0xffffffff;
              uVar14 = *(ulong *)(lVar9 + 0x128);
              if (uVar14 < uVar3) goto LAB_14059fed9;
LAB_14059ff00:
              local_408 = 0;
            }
            else {
              uVar4 = 0;
              uVar11 = *(ulong *)(lVar9 + 0x120);
joined_r0x00014059fe4d:
              if (uVar11 < uVar12) goto LAB_14059fe4f;
LAB_14059feb6:
              uVar11 = 0;
              uVar14 = *(ulong *)(lVar9 + 0x128);
joined_r0x00014059fec3:
              if (uVar3 <= uVar14) goto LAB_14059ff00;
LAB_14059fed9:
              uVar3 = *(ulong *)(lVar6 + uVar14 * 8);
              if (uVar3 == 0) goto LAB_14059ff00;
              local_408 = *(long *)(lVar2 + 0x10 + ~uVar3 * 0x30);
            }
            local_234 = 0;
            local_240 = false;
            if (*(ulong *)(lVar9 + 0x130) < uVar12) {
              local_240 = *(long *)(*(long *)(lVar7 + 0x80) + *(ulong *)(lVar9 + 0x130) * 8) != 0;
            }
            lVar6 = ~*(ulong *)(lVar6 + *(long *)(lVar9 + 0x110) * 8) * 0x30;
            local_268 = *(long *)(lVar2 + 0x10 + lVar6);
            local_258 = *(long *)(lVar2 + 0x28 + lVar6);
            local_2b0 = *(long *)(lVar7 + 0x50);
          }
          uVar3 = (ulong)local_234;
          local_234 = local_234 + 1;
          local_390 = *(undefined8 *)(local_2b0 + uVar3 * 0x10);
        } while ((int)local_390 == 0);
        uVar3 = (ulong)~*(uint *)(local_2b0 + uVar3 * 0x10 + 8);
        local_388 = uVar3 * 0x60 + local_400;
        local_3f4 = (uint)uVar4;
        if ((uVar4 & 1) == 0) {
          local_388 = 0;
        }
        local_380 = 0;
        local_3f8 = (uint)uVar11;
        if ((char)uVar11 == '\x01') {
          local_380 = uVar3 * 0xb8 + local_3d0;
          local_398 = local_3d8 + uVar3 * 4;
          local_3a0 = local_3e0 + uVar3 * 4;
        }
        local_3c0 = local_268 + uVar3 * 0x18;
        puVar5 = (undefined4 *)(local_258 + uVar3 * 4);
        local_320 = uVar3 * 0x40 + local_408;
        local_370 = local_3a0;
        local_378 = local_398;
        local_3f0 = local_258;
        local_3e8 = local_268;
      }
    }
  } while( true );
}
