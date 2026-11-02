/* WARNING: Removing unreachable block (ram,0x0001458a0608) */
/* WARNING: Removing unreachable block (ram,0x00014589ffc9) */
/* WARNING: Removing unreachable block (ram,0x0001458a0800) */
/* WARNING: Removing unreachable block (ram,0x0001458a080c) */
/* WARNING: Removing unreachable block (ram,0x0001458a0810) */
/* WARNING: Removing unreachable block (ram,0x0001458a1557) */
/* WARNING: Removing unreachable block (ram,0x0001458a0e77) */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 *param_4,ulong *param_5)

{
  char *pcVar1;
  long lVar2;
  undefined4 *puVar3;
  ulong *puVar4;
  undefined1 auVar5 [16];
  code *pcVar6;
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  char cVar12;
  byte bVar13;
  short sVar14;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  ulong uVar19;
  ulong uVar20;
  undefined8 *puVar21;
  ushort uVar15;
  ulong *puVar22;
  ulong uVar23;
  undefined1 uVar24;
  uint uVar25;
  byte *pbVar26;
  ulong *puVar27;
  char *pcVar28;
  uint *puVar29;
  undefined1 uVar30;
  ulong uVar31;
  undefined1 *puVar32;
  long lVar33;
  int *piVar34;
  ulong *puVar35;
  ulong uVar36;
  uint *puVar37;
  undefined8 uVar38;
  long lVar39;
  char *pcVar40;
  ulong uVar41;
  uint *puVar42;
  byte bVar43;
  ulong uVar44;
  uint uVar45;
  byte bVar46;
  ulong *puVar47;
  long lVar48;
  ulong *puVar49;
  ulong *puVar50;
  ulong *puVar51;
  bool bVar52;
  bool bVar53;
  undefined4 in_XMM6_Da;
  undefined4 uVar54;
  undefined4 uVar55;
  undefined4 uVar56;
  undefined4 uVar57;
  undefined1 auVar58 [16];
  undefined1 auVar59 [16];
  undefined1 auVar60 [16];
  ulong *local_430;
  ulong *local_428;
  long local_420;
  undefined8 *local_418 [4];
  ulong *local_3f8;
  undefined8 local_3f0;
  undefined8 uStack_3e8;
  ulong local_3e0;
  undefined8 local_3d8;
  undefined8 uStack_3d0;
  ulong local_3c8;
  ulong *local_3c0;
  undefined4 uStack_3b8;
  undefined4 uStack_3b4;
  undefined4 local_3b0;
  undefined4 uStack_3ac;
  ulong *puStack_3a8;
  undefined8 local_3a0;
  undefined8 uStack_398;
  undefined8 local_390;
  undefined8 uStack_388;
  undefined8 local_380;
  long lStack_378;
  long local_370;
  char local_368;
  undefined7 uStack_367;
  undefined8 uStack_360;
  ulong local_358;
  undefined8 local_350;
  uint *puStack_348;
  ulong local_340;
  undefined8 local_338;
  undefined8 uStack_330;
  ulong *local_328;
  undefined4 uStack_320;
  undefined4 uStack_31c;
  undefined4 local_318;
  undefined4 uStack_314;
  undefined4 uStack_310;
  undefined4 uStack_30c;
  undefined8 local_308;
  undefined1 local_2f8;
  undefined7 uStack_2f7;
  uint *puStack_2f0;
  ulong local_2e8;
  ulong *local_2e0;
  undefined8 local_2d8;
  char *pcStack_2d0;
  ulong local_2c8;
  long local_2c0;
  long lStack_2b8;
  long local_2b0;
  undefined8 local_2a8;
  ulong *local_2a0;
  ulong *local_298;
  ulong local_290;
  ulong *puStack_288;
  ulong local_280;
  ulong local_278;
  long lStack_270;
  ulong local_268;
  ulong local_260;
  ulong *local_258;
  ulong *puStack_250;
  ulong *local_248;
  ulong *local_240;
  undefined8 uStack_238;
  undefined8 local_230;
  undefined8 uStack_228;
  undefined1 local_220;
  undefined7 uStack_21f;
  undefined2 local_218;
  long local_210;
  long lStack_208;
  long local_200;
  ulong *local_1f8;
  ulong *puStack_1f0;
  ulong *local_1e8;
  ulong *local_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined1 auStack_1c8 [12];
  undefined4 uStack_1bc;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  undefined8 uStack_1a8;
  undefined8 local_1a0;
  byte bStack_198;
  byte bStack_197;
  undefined2 uStack_196;
  undefined4 uStack_194;
  undefined8 uStack_190;
  undefined4 local_15c;
  undefined4 local_114;
  ulong *local_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  ulong *local_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  char local_a9;
  ulong *local_a8;
  ulong *local_a0;
  ulong *local_98;
  ulong *local_90;
  undefined1 local_81;
  undefined8 local_80;
  undefined1 local_72;
  undefined1 local_71;
  ulong *local_70;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_1d8 = (ulong *)0x0;
  local_1b8 = (ulong *)0x0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_418[3] = param_4;
  uStack_1d0 = param_5;
  auStack_1c8._0_8_ = param_3;
  unique0x100052bc = param_5;
  uStack_1b0 = param_5;
  local_58 = in_XMM6_Da;
  func_0x0001459bb340(param_3,param_5,&local_1d8,local_418);
  local_f8 = (ulong *)0x0;
  local_d8 = (ulong *)0x0;
  uStack_c8._0_4_ = 10;
  uStack_c8._4_4_ = 10;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uStack_f0 = param_5;
  local_e8 = param_3;
  uStack_e0 = param_5;
  uStack_d0 = param_5;
  local_a8 = param_3;
  local_a0 = param_5;
  do {
    while( true ) {
      puVar22 = (ulong *)0xffffffffffffffff;
      FUN_1458aabb0(0xffffffffffffffff,local_e8,&local_e8,&local_1d8);
      puVar50 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_14589e492;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar50 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_14589e492;
      }
      local_f8 = puVar50;
      auVar58 = func_0x000140089200();
      uStack_1d0 = auVar58._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar58;
      func_0x0001459bd2c0();
      if (((2 < (long)local_1e8 - 6U) || (puStack_1f0[1] != 4)) ||
         (*(int *)*puStack_1f0 != 0x6b636970)) break;
      puVar22 = local_1e8;
      if (local_1e8 < 7) {
        puVar50 = (ulong *)0x1;
        puVar35 = (ulong *)0x0;
        puVar51 = (ulong *)0x0;
        uVar31 = puStack_1f0[3];
        puVar47 = puStack_1f0;
        if (uVar31 != 0) goto LAB_1458a1d8a;
LAB_1458a1e38:
        if (puVar35 != (ulong *)0x0) {
LAB_1458a1e3d:
          func_0x0001400021d0();
        }
        break;
      }
      auStack_1c8._0_8_ = puStack_1f0[0xc];
      local_70 = puStack_1f0;
      uStack_1d0 = (ulong *)puStack_1f0[0xd];
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x2c0000002c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      unique0x100052cc = uStack_1d0;
      uStack_1b0 = uStack_1d0;
      func_0x0001459c2230();
      uVar31 = local_70[3];
      puVar50 = puStack_250;
      puVar35 = local_258;
      puVar51 = local_248;
      puVar47 = local_70;
      if (uVar31 == 0) goto LAB_1458a1e38;
LAB_1458a1d8a:
      pcVar28 = (char *)puVar47[2];
      if (uVar31 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a1e38;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar36 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar36);
      if (2 < uVar31 - uVar36) {
        lVar39 = 0;
        bVar46 = 0;
        while( true ) {
          if (lVar39 == uVar31 - uVar36) {
            if (puVar22 != (ulong *)0x2) goto LAB_1458a1e9b;
            local_71 = 1;
            local_1e0 = puVar35;
            local_80 = puVar50;
            local_70 = puVar47;
            func_0x000145d99653();
            goto LAB_1458a2924;
          }
          if ((char)((ushort)((ushort)bVar46 * 10) >> 8) != '\0') break;
          bVar13 = (byte)(pbVar26[lVar39] - 0x30);
          bVar43 = (byte)((ushort)bVar46 * 10);
          bVar46 = bVar43 + bVar13;
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar43,bVar13))) break;
        }
        goto LAB_1458a1e38;
      }
      if (uVar31 == uVar36) {
        bVar46 = 0;
      }
      else {
        bVar46 = (byte)(*pbVar26 - 0x30);
        if (9 < *pbVar26 - 0x30) goto LAB_1458a1e38;
        if (uVar31 - uVar36 != 1) {
          if (9 < pbVar26[1] - 0x30) goto LAB_1458a1e38;
          bVar46 = (char)(pbVar26[1] - 0x30) + bVar46 * '\n';
        }
      }
LAB_1458a1e9b:
      uVar31 = puVar47[5];
      if (uVar31 == 0) {
LAB_1458a2077:
        local_80 = puVar50;
        if (puVar35 == (ulong *)0x0) break;
        goto LAB_1458a1e3d;
      }
      pcVar28 = (char *)puVar47[4];
      if (uVar31 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a2077;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar36 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar36);
      if (2 < uVar31 - uVar36) {
        lVar39 = 0;
        uVar45 = 0;
        while( true ) {
          if (lVar39 == uVar31 - uVar36) goto LAB_1458a1fb6;
          sVar14 = (ushort)(byte)uVar45 * 10;
          if ((char)((ushort)sVar14 >> 8) != '\0') break;
          bVar13 = (byte)sVar14;
          bVar43 = (byte)(pbVar26[lVar39] - 0x30);
          uVar45 = (uint)(byte)(bVar13 + bVar43);
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar13,bVar43))) break;
        }
        goto LAB_1458a2077;
      }
      if (uVar31 == uVar36) {
        uVar45 = 0;
      }
      else {
        uVar45 = *pbVar26 - 0x30;
        if (9 < uVar45) goto LAB_1458a2077;
        if (uVar31 - uVar36 != 1) {
          uVar16 = pbVar26[1] - 0x30;
          if (9 < uVar16) goto LAB_1458a2077;
          uVar45 = CONCAT31((int3)(uVar16 >> 8),(char)uVar16 + (char)uVar45 * '\n');
        }
      }
LAB_1458a1fb6:
      uVar31 = puVar47[7];
      if (uVar31 == 0) goto LAB_1458a2077;
      pcVar28 = (char *)puVar47[6];
      if (uVar31 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a2077;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar36 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar36);
      local_90 = (ulong *)CONCAT44(local_90._4_4_,uVar45);
      if (2 < uVar31 - uVar36) {
        lVar39 = 0;
        uVar45 = 0;
        while( true ) {
          if (lVar39 == uVar31 - uVar36) goto LAB_1458a208e;
          sVar14 = (ushort)(byte)uVar45 * 10;
          if ((char)((ushort)sVar14 >> 8) != '\0') break;
          bVar13 = (byte)sVar14;
          bVar43 = (byte)(pbVar26[lVar39] - 0x30);
          uVar45 = (uint)(byte)(bVar13 + bVar43);
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar13,bVar43))) break;
        }
        goto LAB_1458a2077;
      }
      if (uVar31 == uVar36) {
        uVar45 = 0;
      }
      else {
        uVar45 = *pbVar26 - 0x30;
        if (9 < uVar45) goto LAB_1458a2077;
        if (uVar31 - uVar36 != 1) {
          uVar16 = pbVar26[1] - 0x30;
          if (9 < uVar16) goto LAB_1458a2077;
          uVar45 = CONCAT31((int3)(uVar16 >> 8),(char)uVar16 + (char)uVar45 * '\n');
        }
      }
LAB_1458a208e:
      local_100 = (ulong *)CONCAT44(local_100._4_4_,uVar45);
      if (puVar22 == (ulong *)0x4) {
        local_71 = 1;
        local_1e0 = puVar35;
        local_80 = puVar50;
        local_70 = puVar47;
        func_0x000145d99653();
        goto LAB_1458a2924;
      }
      local_260 = puVar47[8];
      puVar49 = (ulong *)puVar47[9];
      local_1e0 = puVar35;
      local_80 = puVar50;
      local_70 = puVar47;
      func_0x0001400539a0();
      local_2a8 = CONCAT44(uStack_3b4,uStack_3b8);
      if ((char)local_3c0 != '\0') {
        local_71 = 1;
        func_0x000145d992bb();
        goto LAB_1458a2924;
      }
      local_98 = (ulong *)CONCAT44(uStack_3ac,local_3b0);
      if (puVar49 != (ulong *)0x0) {
        func_0x000145bfa0e7();
      }
      local_298 = (ulong *)local_70[10];
      uVar31 = local_70[0xb];
      local_3f8 = puVar49;
      func_0x0001400539a0();
      local_2a0 = (ulong *)CONCAT44(uStack_3b4,uStack_3b8);
      local_a9 = (char)local_3c0;
      if ((char)local_3c0 != '\0') {
        func_0x000145d992bb();
        goto LAB_1458a2924;
      }
      puVar50 = (ulong *)CONCAT44(uStack_3ac,local_3b0);
      local_260 = uVar31;
      if (uVar31 != 0) {
        func_0x000145bfa0e7();
      }
      if (puVar51 == (ulong *)0x5) {
        puVar35 = (ulong *)((ulong)local_2e0 & 0xffffff0000000000 | (ulong)(uint5)*local_80);
        puVar51 = puVar35;
        if (local_1e0 != (ulong *)0x0) {
          func_0x0001400021d0();
          puVar51 = puVar35;
        }
      }
      else {
        if (local_1e0 == (ulong *)0x0) {
          local_2e0 = local_80;
        }
        else {
          puVar35 = local_80;
          puVar51 = local_80;
          if (local_1e0 == (ulong *)0xffffffffffffffff) goto LAB_1458a225d;
          func_0x0001400021d0();
          local_2e0 = puVar35;
        }
        puVar35 = (ulong *)0x0;
        puVar51 = local_2e0;
      }
LAB_1458a225d:
      local_2e0 = puVar51;
      puVar51 = local_3f8;
      uVar24 = SUB81(local_90,0);
      uVar30 = SUB81(local_100,0);
      puVar47 = (ulong *)0x64006400640064;
      uVar31 = local_260;
      if (7 < puVar22) {
        local_298 = puVar50;
        puVar47 = (ulong *)func_0x00014590e190();
        uVar24 = SUB81(local_90,0);
        uVar30 = SUB81(local_100,0);
        puVar50 = local_298;
      }
      local_1d8 = local_2a0;
      stack0xfffffffffffffe40 = (ulong *)local_2a8;
      local_1b8 = local_98;
      uStack_1b0 = puVar51;
      local_1a0 = CONCAT17((char)((ulong)puVar35 >> 0x20),
                           CONCAT43((int)puVar35,CONCAT12(uVar30,CONCAT11(uVar24,bVar46))));
      local_71 = 0;
      uStack_1d0 = puVar50;
      auStack_1c8._0_8_ = uVar31;
      uStack_1a8 = puVar47;
      FUN_1458a7fc0();
      uStack_320 = (undefined4)uStack_238;
      uStack_31c = uStack_238._4_4_;
      local_318 = (undefined4)local_230;
      uStack_314 = local_230._4_4_;
      uStack_310 = (undefined4)uStack_228;
      uStack_30c = uStack_228._4_4_;
      local_338 = puStack_250;
      uStack_330 = local_248;
      local_328 = local_240;
      local_308 = CONCAT71(uStack_21f,local_220);
      puVar22 = local_258;
      if (local_1f8 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
      if (puVar22 != (ulong *)0xffffffffffffffff) {
        uStack_388 = local_308;
        uStack_3b8 = (undefined4)local_338;
        uStack_3b4 = local_338._4_4_;
        local_3b0 = (undefined4)uStack_330;
        uStack_3ac = uStack_330._4_4_;
        puStack_3a8 = local_328;
        local_3a0 = CONCAT44(uStack_31c,uStack_320);
        uStack_398 = CONCAT44(uStack_314,local_318);
        local_390 = CONCAT44(uStack_30c,uStack_310);
        goto LAB_14589e492;
      }
LAB_1458a1b60:
      puVar22 = (ulong *)0xffffffffffffffff;
      if ((local_b8 & 0x100) != 0) goto LAB_14589e492;
    }
    if (local_1f8 == (ulong *)0x0) goto LAB_1458a1b60;
    func_0x0001400021d0();
    puVar22 = (ulong *)0xffffffffffffffff;
  } while ((local_b8 & 0x100) == 0);
LAB_14589e492:
  local_210 = 0;
  lStack_208 = 8;
  local_200 = 0;
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8 = 0xa0000000a;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uVar38 = 0x6f6c6e75;
  bVar46 = 0;
  local_3c0 = puVar22;
  while ((bVar46 & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_b8._1_1_ != '\0') break;
      local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
      puVar22 = local_f8;
      if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) break;
    }
    local_f8 = puVar22;
    auVar58 = func_0x000140089200();
    uStack_1d0 = auVar58._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0 = CONCAT71(local_1a0._1_7_,1);
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar58;
    func_0x0001459bd2c0();
    if (local_248 == (ulong *)0x3) {
      if (puStack_250[1] == 6) {
        if ((short)((int *)*puStack_250)[1] == 0x6b63 && *(int *)*puStack_250 == (int)uVar38) {
          uVar31 = puStack_250[3];
          bVar52 = true;
          if (uVar31 == 0) {
LAB_14589e7e7:
            uVar31 = puStack_250[5];
          }
          else {
            pcVar28 = (char *)puStack_250[2];
            if (uVar31 == 1) {
              cVar12 = *pcVar28;
              if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_14589e7e7;
            }
            else {
              cVar12 = *pcVar28;
            }
            uVar36 = (ulong)(cVar12 == '+');
            pbVar26 = (byte *)(pcVar28 + uVar36);
            if (uVar31 - uVar36 < 3) {
              if (uVar31 == uVar36) {
                bVar52 = false;
                uVar31 = puStack_250[5];
              }
              else {
                if (9 < *pbVar26 - 0x30) goto LAB_14589e7e7;
                if (uVar31 - uVar36 != 1) {
                  if (pbVar26[1] - 0x30 < 10) {
                    bVar52 = false;
                  }
                  goto LAB_14589e897;
                }
                bVar52 = false;
                uVar31 = puStack_250[5];
              }
            }
            else {
              lVar39 = 0;
              bVar46 = 0;
              do {
                bVar53 = lVar39 == uVar31 - uVar36;
                bVar52 = !bVar53;
                if (bVar53) break;
                if ((char)((ushort)((ushort)bVar46 * 10) >> 8) != '\0') goto LAB_14589e7e7;
                bVar13 = (byte)(pbVar26[lVar39] - 0x30);
                bVar43 = (byte)((ushort)bVar46 * 10);
                bVar46 = bVar43 + bVar13;
                if (9 < pbVar26[lVar39] - 0x30) goto LAB_14589e7e7;
                lVar39 = lVar39 + 1;
              } while (!CARRY1(bVar43,bVar13));
LAB_14589e897:
              uVar31 = puStack_250[5];
            }
          }
          if (uVar31 != 0) {
            pcVar28 = (char *)puStack_250[4];
            if (uVar31 == 1) {
              cVar12 = *pcVar28;
              if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_14589e560;
            }
            else {
              cVar12 = *pcVar28;
            }
            uVar36 = (ulong)(cVar12 == '+');
            if (uVar31 - uVar36 < 0x11) {
              if (uVar31 == uVar36) {
                uVar31 = 1;
              }
              else {
                lVar39 = 0;
                uVar20 = 0;
                do {
                  if (9 < (byte)pcVar28[lVar39 + uVar36] - 0x30) goto LAB_14589e560;
                  uVar20 = (ulong)((byte)pcVar28[lVar39 + uVar36] - 0x30) + uVar20 * 10;
                  lVar39 = lVar39 + 1;
                } while (lVar39 != uVar31 + -uVar36);
LAB_14589e929:
                uVar31 = 9;
                if (uVar20 < 9) {
                  uVar31 = uVar20;
                }
                if (uVar20 == 0) {
                  uVar31 = 1;
                }
              }
              if (!bVar52) {
                uVar31 = *(ulong *)(uVar31 * 0x10 + 0x146beb588);
                goto joined_r0x00014589e9f5;
              }
            }
            else {
              lVar39 = 0;
              uVar20 = 0;
              while( true ) {
                if (lVar39 == uVar31 + -uVar36) goto LAB_14589e929;
                auVar58._8_8_ = 0;
                auVar58._0_8_ = uVar20;
                uVar19 = SUB168(auVar58 * ZEXT816(10),0);
                if (SUB168(auVar58 * ZEXT816(10),8) != 0) break;
                uVar45 = (byte)pcVar28[lVar39 + uVar36] - 0x30;
                uVar20 = uVar19 + uVar45;
                if ((9 < uVar45) || (lVar39 = lVar39 + 1, CARRY8(uVar19,(ulong)uVar45))) break;
              }
            }
          }
        }
      }
      else if (((puStack_250[1] == 4) && (*(int *)*puStack_250 == 0x6e65706f)) &&
              (uVar31 = puStack_250[3], uVar31 != 0)) {
        pcVar28 = (char *)puStack_250[2];
        if (uVar31 == 1) {
          cVar12 = *pcVar28;
          if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_14589e560;
        }
        else {
          cVar12 = *pcVar28;
        }
        uVar36 = (ulong)(cVar12 == '+');
        pbVar26 = (byte *)(pcVar28 + uVar36);
        if (uVar31 - uVar36 < 3) {
          if ((uVar31 == uVar36) ||
             ((*pbVar26 - 0x30 < 10 && ((uVar31 - uVar36 == 1 || (pbVar26[1] - 0x30 < 10)))))) {
LAB_14589e998:
            uVar31 = puStack_250[5];
joined_r0x00014589e9f5:
            if (uVar31 - 2 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x00014589ea05 */
                    /* WARNING: Treating indirect jump as call */
              puVar21 = (undefined8 *)
                        (*(code *)((long)*(int *)((uVar31 - 2) * 4 + 0x146bebc40) + 0x146bebc40))();
              return puVar21;
            }
          }
        }
        else {
          lVar39 = 0;
          bVar46 = 0;
          while( true ) {
            if (lVar39 == uVar31 - uVar36) goto LAB_14589e998;
            if ((char)((ushort)((ushort)bVar46 * 10) >> 8) != '\0') break;
            bVar13 = (byte)(pbVar26[lVar39] - 0x30);
            bVar43 = (byte)((ushort)bVar46 * 10);
            bVar46 = bVar43 + bVar13;
            if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar43,bVar13))) break;
          }
        }
      }
    }
LAB_14589e560:
    if (local_258 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
    bVar46 = local_b8._1_1_;
  }
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_15c = 0xffffffff;
  local_114 = 0xffffffff;
  func_0x0001459c3640();
  uVar31 = local_340;
  if (1 < local_340) {
    puVar37 = puStack_348;
    if (local_340 < 0x15) {
      puVar29 = puStack_348 + 1;
      lVar39 = 4;
      do {
        uVar16 = puVar29[-1];
        uVar45 = *puVar29;
        lVar33 = lVar39;
        if (uVar45 < uVar16) {
          do {
            *(uint *)((long)puStack_348 + lVar33) = uVar16;
            puVar42 = puStack_348;
            if (lVar33 == 4) goto LAB_1458a23c1;
            uVar16 = *(uint *)((long)puStack_348 + lVar33 + -8);
            lVar33 = lVar33 + -4;
          } while (uVar45 < uVar16);
          puVar42 = (uint *)(lVar33 + (long)puStack_348);
LAB_1458a23c1:
          *puVar42 = uVar45;
        }
        puVar29 = puVar29 + 1;
        lVar39 = lVar39 + 4;
      } while (puVar29 != puStack_348 + local_340);
      if (local_340 < 2) goto LAB_14589ed77;
    }
    else {
      func_0x000145b199b0();
    }
    lVar39 = 0;
    do {
      if (puVar37[lVar39 + 1] == puVar37[lVar39]) {
        uVar36 = lVar39 + 2;
        local_340 = lVar39 + 1;
        if (uVar36 < uVar31) {
          if (((int)uVar31 - (int)lVar39 & 1U) != 0) {
            if (puVar37[lVar39 + 2] != puVar37[lVar39]) {
              puVar37[lVar39 + 1] = puVar37[lVar39 + 2];
              local_340 = lVar39 + 2;
            }
            uVar36 = lVar39 + 3;
          }
          uVar20 = local_340;
          if (uVar31 - 3 != lVar39) goto LAB_1458a26cc;
        }
        break;
      }
      lVar39 = lVar39 + 1;
    } while (uVar31 - 1 != lVar39);
  }
  goto LAB_14589ed77;
LAB_1458a26cc:
  do {
    if (puVar37[uVar36] == puVar37[uVar20 - 1]) {
      uVar45 = puVar37[uVar36 + 1];
      local_340 = uVar20;
      if (uVar45 != puVar37[uVar20 - 1]) {
LAB_1458a26f1:
        puVar37[uVar20] = uVar45;
        local_340 = uVar20 + 1;
      }
    }
    else {
      puVar37[uVar20] = puVar37[uVar36];
      local_340 = uVar20 + 1;
      uVar45 = puVar37[uVar36 + 1];
      puVar29 = puVar37 + uVar20;
      uVar20 = local_340;
      if (uVar45 != *puVar29) goto LAB_1458a26f1;
    }
    uVar36 = uVar36 + 2;
    uVar20 = local_340;
  } while (uVar31 != uVar36);
LAB_14589ed77:
  local_278 = 0;
  lStack_270 = 4;
  local_268 = 0;
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8._0_4_ = 10;
  uStack_c8._4_4_ = 10;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uVar54 = 0;
  uVar55 = 0;
  uVar56 = 0;
  uVar57 = 0;
  do {
    while( true ) {
      FUN_1458aabb0();
      puVar22 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_14589ee1e;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar22 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_14589ee1e;
      }
      local_f8 = puVar22;
      auVar58 = func_0x000140089200();
      uStack_1d0 = auVar58._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar58;
      func_0x0001459bd2c0();
      if (local_248 != (ulong *)0x3) break;
      uVar31 = puStack_250[1];
      if (uVar31 != 5) {
        if ((uVar31 == 4) && (piVar34 = (int *)*puStack_250, *piVar34 == 0x6b6f6f6c))
        goto LAB_14589f7c9;
        break;
      }
      piVar34 = (int *)*puStack_250;
      if ((char)piVar34[1] != 'p' || *piVar34 != 0x69757165) break;
LAB_14589f7c9:
      uVar36 = puStack_250[3];
      if (uVar36 == 0) break;
      pcVar28 = (char *)puStack_250[2];
      if (uVar36 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) break;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar20 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar20);
      if (2 < uVar36 - uVar20) {
        lVar39 = 0;
        uVar45 = 0;
        while( true ) {
          if (lVar39 == uVar36 - uVar20) goto LAB_14589f834;
          sVar14 = (ushort)(byte)uVar45 * 10;
          if ((char)((ushort)sVar14 >> 8) != '\0') break;
          bVar46 = (byte)sVar14;
          bVar13 = (byte)(pbVar26[lVar39] - 0x30);
          uVar45 = (uint)(byte)(bVar46 + bVar13);
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar46,bVar13))) break;
        }
        break;
      }
      if (uVar36 == uVar20) {
        local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
      }
      else {
        uVar45 = *pbVar26 - 0x30;
        if (9 < uVar45) break;
        if (uVar36 - uVar20 == 1) {
LAB_14589f834:
          local_80 = (ulong *)CONCAT44(local_80._4_4_,uVar45);
        }
        else {
          uVar16 = pbVar26[1] - 0x30;
          if (9 < uVar16) break;
          local_80 = (ulong *)CONCAT44(local_80._4_4_,
                                       CONCAT31((int3)(uVar16 >> 8),
                                                (char)uVar16 + (char)uVar45 * '\n'));
        }
      }
      auStack_1c8._0_8_ = puStack_250[4];
      local_98 = puStack_250;
      uStack_1d0 = (ulong *)puStack_250[5];
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x2c0000002c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      unique0x100052dc = uStack_1d0;
      uStack_1b0 = uStack_1d0;
      func_0x0001459c01c0();
      local_90 = local_430;
      local_70 = local_428;
      lVar33 = local_268 * 0xe8;
      cVar12 = (char)local_80;
      lVar39 = local_420;
      if (local_268 != 0) {
        lVar48 = 0;
        uVar36 = 0;
        do {
          if (*(char *)(lStack_270 + 0xe4 + lVar48) == cVar12) goto joined_r0x00014589fb03;
          uVar36 = uVar36 + 1;
          lVar48 = lVar48 + 0xe8;
        } while (lVar33 - lVar48 != 0);
      }
      uStack_190 = CONCAT44(uVar57,uVar56);
      local_1a0 = CONCAT44(uVar56,uVar55);
      bStack_198 = (byte)uVar57;
      bStack_197 = (byte)((uint)uVar57 >> 8);
      uStack_196 = (undefined2)((uint)uVar57 >> 0x10);
      uStack_1b0 = (ulong *)CONCAT44(uVar56,uVar55);
      uStack_1a8 = (ulong *)CONCAT44(uVar54,uVar57);
      stack0xfffffffffffffe40 = (ulong *)CONCAT44(uVar56,uVar55);
      local_1b8 = (ulong *)CONCAT44(uVar54,uVar57);
      local_1d8 = (ulong *)CONCAT44(uVar54,(int)local_1d8);
      uStack_1d0 = (ulong *)CONCAT44(uVar56,uVar55);
      auStack_1c8._4_4_ = uVar54;
      auStack_1c8._0_4_ = uVar57;
      uStack_194 = uVar55;
      if (local_268 == local_278) {
        local_81 = 1;
        func_0x000145d7e320();
        cVar12 = (char)local_80;
      }
      *(undefined4 *)(lStack_270 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 8 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x10 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x18 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x20 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x28 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x30 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x38 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x40 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x48 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x50 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x58 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x60 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x68 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x70 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x78 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x80 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x88 + lVar33) = 0;
      *(undefined4 *)(lStack_270 + 0x90 + lVar33) = 0;
      puVar21 = (undefined8 *)(lStack_270 + 0xd4 + lVar33);
      *puVar21 = CONCAT44(uStack_194,CONCAT22(uStack_196,CONCAT11(bStack_197,bStack_198)));
      puVar21[1] = uStack_190;
      puVar21 = (undefined8 *)(lStack_270 + 0xc4 + lVar33);
      *puVar21 = uStack_1a8;
      puVar21[1] = local_1a0;
      puVar21 = (undefined8 *)(lStack_270 + 0xb4 + lVar33);
      *puVar21 = local_1b8;
      puVar21[1] = uStack_1b0;
      puVar22 = (ulong *)(lStack_270 + 0xa4 + lVar33);
      *puVar22 = auStack_1c8._0_8_;
      puVar22[1] = (ulong)stack0xfffffffffffffe40;
      puVar3 = (undefined4 *)(lStack_270 + 0x94 + lVar33);
      *puVar3 = (int)local_1d8;
      puVar3[1] = local_1d8._4_4_;
      puVar3[2] = (undefined4)uStack_1d0;
      puVar3[3] = uStack_1d0._4_4_;
      *(char *)(lStack_270 + 0xe4 + lVar33) = cVar12;
      uVar36 = local_268;
      local_268 = local_268 + 1;
joined_r0x00014589fb03:
      if (lVar39 != 0) {
        puVar50 = local_70 + lVar39 * 2;
        puVar22 = local_70;
        if (uVar31 == 5) {
          do {
            while( true ) {
              uVar31 = *puVar22;
              uVar20 = puVar22[1];
              if ((char)piVar34[1] == 'p' && *piVar34 == 0x69757165) break;
              if (local_268 <= uVar36) goto LAB_1458a2788;
              if (0x12 < uVar31) goto LAB_1458a279d;
              lVar39 = uVar36 * 0xe8 + lStack_270;
              *(undefined4 *)(lVar39 + uVar31 * 8) = 1;
              *(int *)(lVar39 + 4 + uVar31 * 8) = (int)uVar20;
              puVar22 = puVar22 + 2;
              if (puVar22 == puVar50) goto LAB_14589fc14;
            }
            if (local_268 <= uVar36) {
              func_0x000145d99653();
              goto LAB_1458a2924;
            }
            if (0x12 < uVar31) {
              func_0x000145d99653();
              goto LAB_1458a2924;
            }
            *(int *)(uVar36 * 0xe8 + lStack_270 + 0x98 + uVar31 * 4) = (int)uVar20;
            puVar22 = puVar22 + 2;
          } while (puVar22 != puVar50);
        }
        else {
          do {
            if (local_268 <= uVar36) goto LAB_1458a2788;
            uVar31 = *puVar22;
            if (0x12 < uVar31) goto LAB_1458a279d;
            uVar20 = puVar22[1];
            lVar39 = uVar36 * 0xe8 + lStack_270;
            *(undefined4 *)(lVar39 + uVar31 * 8) = 1;
            *(int *)(lVar39 + 4 + uVar31 * 8) = (int)uVar20;
            puVar22 = puVar22 + 2;
          } while (puVar22 != puVar50);
        }
      }
LAB_14589fc14:
      if (local_90 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
      if (local_258 != (ulong *)0x0) goto LAB_14589f890;
LAB_14589f640:
      if ((local_b8 & 0x100) != 0) goto LAB_14589ee1e;
    }
    if (local_258 == (ulong *)0x0) goto LAB_14589f640;
LAB_14589f890:
    func_0x0001400021d0();
  } while ((local_b8 & 0x100) == 0);
LAB_14589ee1e:
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  func_0x0001459bf610();
  local_2c0 = 0;
  lStack_2b8 = 8;
  local_2b0 = 0;
  local_258 = (ulong *)0x0;
  puStack_250 = local_a0;
  local_248 = local_a8;
  local_240 = local_a0;
  uStack_238 = 0;
  local_230 = local_a0;
  uStack_228 = 0xa0000000a;
  local_220 = 1;
  local_218 = 0;
  uVar54 = 0;
  uVar55 = 0;
  uVar56 = 0;
  uVar57 = 0;
  local_218._1_1_ = 0;
  while ((local_218._1_1_ & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_218._1_1_ != '\0') break;
      local_218 = CONCAT11(1,(byte)local_218);
      puVar22 = local_258;
      if ((puStack_250 != local_258 | (byte)local_218) != 1) break;
    }
    local_258 = puVar22;
    auVar58 = func_0x000140089200();
    uStack_1d0 = auVar58._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0 = CONCAT71(local_1a0._1_7_,1);
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar58;
    func_0x0001459bd2c0();
    local_70 = puStack_1f0;
    if (((2 < local_1e8) && (puStack_1f0[1] == 4)) && (*(int *)*puStack_1f0 == 0x63657073)) {
      uVar31 = puStack_1f0[3];
      if (uVar31 == 0) {
        uVar36 = 0;
        bVar52 = true;
      }
      else {
        pcVar28 = (char *)puStack_1f0[2];
        if (uVar31 == 1) {
          cVar12 = *pcVar28;
          uVar36 = 1;
          bVar52 = true;
          if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_14589f19f;
        }
        else {
          cVar12 = *pcVar28;
        }
        uVar20 = (ulong)(cVar12 == '+');
        pbVar26 = (byte *)(pcVar28 + uVar20);
        if (uVar31 - uVar20 < 3) {
          if (uVar31 == uVar20) {
            uVar36 = 0;
            bVar52 = false;
          }
          else {
            uVar45 = *pbVar26 - 0x30;
            uVar36 = 1;
            bVar52 = true;
            if (uVar45 < 10) {
              if (uVar31 - uVar20 == 1) {
                bVar52 = false;
                uVar36 = (ulong)uVar45;
              }
              else {
                uVar36 = 1;
                bVar52 = true;
                if (pbVar26[1] - 0x30 < 10) {
                  bVar52 = false;
                  uVar36 = (ulong)(byte)((char)(pbVar26[1] - 0x30) + (char)uVar45 * '\n');
                }
              }
            }
          }
        }
        else {
          lVar39 = 0;
          uVar36 = 0;
          do {
            bVar53 = lVar39 == uVar31 - uVar20;
            bVar52 = !bVar53;
            if (bVar53) goto LAB_14589f19f;
            sVar14 = (ushort)(byte)uVar36 * 10;
            if ((char)((ushort)sVar14 >> 8) != '\0') {
              uVar36 = (ulong)(byte)(((byte)(pbVar26[lVar39] - 0x30) < 10) + 1);
              bVar52 = true;
              goto LAB_14589f19f;
            }
            uVar45 = pbVar26[lVar39] - 0x30;
            if (9 < uVar45) {
              uVar36 = 1;
              goto LAB_14589f19f;
            }
            lVar39 = lVar39 + 1;
            bVar46 = (byte)uVar45;
            bVar13 = (byte)sVar14;
            uVar36 = (ulong)(byte)(bVar13 + bVar46);
          } while (!CARRY1(bVar13,bVar46));
          uVar36 = 2;
        }
      }
LAB_14589f19f:
      uVar31 = puStack_1f0[5];
      if (uVar31 != 0) {
        pcVar28 = (char *)puStack_1f0[4];
        if (uVar31 == 1) {
          cVar12 = *pcVar28;
          if ((cVar12 == '+') || (cVar12 == '-')) goto joined_r0x00014589ef4a;
        }
        else {
          cVar12 = *pcVar28;
        }
        uVar20 = (ulong)(cVar12 == '+');
        pbVar26 = (byte *)(pcVar28 + uVar20);
        cVar12 = (char)uVar36;
        if (uVar31 - uVar20 < 3) {
          if (uVar31 == uVar20) {
            if (!bVar52) {
              uVar45 = 0;
LAB_14589f2ad:
              lVar39 = 0;
              do {
                if (local_370 << 5 == lVar39) {
                  local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
                  goto LAB_14589f36f;
                }
                lVar33 = lVar39 + 0x20;
                pcVar28 = (char *)(lStack_378 + 4 + lVar39);
                lVar39 = lVar33;
              } while (*pcVar28 != cVar12);
              uVar16 = *(uint *)(lStack_378 + -0x20 + lVar33);
              local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
              uVar25 = 0x6e;
              do {
                uVar17 = uVar16 - (uVar25 - 0x1e);
                if (uVar16 < uVar25 - 0x1e) goto LAB_14589f36f;
                uVar18 = uVar17 - (uVar25 - 0xf);
                if (uVar17 < uVar25 - 0xf) {
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)local_80 + 1);
                  goto LAB_14589f36f;
                }
                uVar16 = uVar18 - uVar25;
                if (uVar18 < uVar25) {
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)local_80 + 2);
                  goto LAB_14589f36f;
                }
                local_80._0_4_ = (int)local_80 + 3;
                uVar25 = uVar25 + 0x2d;
              } while ((int)local_80 != 0x33);
              local_80 = (ulong *)CONCAT44(local_80._4_4_,0x33);
LAB_14589f36f:
              local_f8 = (ulong *)0x0;
              uStack_f0 = (ulong *)&DAT_00000008;
              local_e8 = (ulong *)CONCAT44(uVar55,uVar54);
              uStack_e0 = (ulong *)CONCAT44(uVar57,uVar56);
              local_d8 = (ulong *)&DAT_00000008;
              uStack_d0 = (ulong *)CONCAT44(uVar55,uVar54);
              uStack_c0 = 8;
              local_b8 = 0;
              puVar22 = puStack_1f0 + 6;
              puVar50 = puStack_1f0 + (long)local_1e8 * 2;
              lVar39 = 3;
              local_90 = (ulong *)CONCAT44(local_90._4_4_,uVar45);
              uVar31 = 0;
              local_368 = cVar12;
              uStack_c8._0_4_ = uVar56;
              uStack_c8._4_4_ = uVar57;
              while( true ) {
                uVar24 = (undefined1)uVar36;
                bVar52 = lVar39 == 0;
                lVar39 = lVar39 + -1;
                if ((bVar52) || (puVar22 == puVar50)) break;
                unique0x00023d00 = (ulong *)*puVar22;
                auStack_1c8._0_8_ = puVar22[1];
                local_1d8 = (ulong *)&local_2f8;
                uStack_1d0 = (ulong *)0x0;
                uStack_1b0 = (ulong *)0x0;
                local_1a0 = 0x2c0000002c;
                bStack_198 = 1;
                uStack_190 = CONCAT62(uStack_190._2_6_,1);
                local_72 = 1;
                local_2f8 = uVar24;
                local_1b8 = (ulong *)auStack_1c8._0_8_;
                uStack_1a8 = (ulong *)auStack_1c8._0_8_;
                func_0x0001459bde30();
                local_72 = 1;
                func_0x0001459106e0();
                if (2 < uVar31) {
                  func_0x000145d99653();
                  goto LAB_1458a2924;
                }
                if ((&local_f8)[uVar31 * 3] != 0) {
                  func_0x0001400021d0();
                }
                puVar22 = puVar22 + 2;
                (&local_e8)[uVar31 * 3] = auStack_1c8._0_8_;
                *(int *)(local_418 + uVar31 * 3 + 100) = (int)local_1d8;
                *(undefined4 *)((long)&local_f8 + uVar31 * 0x18 + 4) = local_1d8._4_4_;
                *(undefined4 *)(&uStack_f0 + uVar31 * 3) = (undefined4)uStack_1d0;
                *(undefined4 *)((long)&uStack_f0 + uVar31 * 0x18 + 4) = uStack_1d0._4_4_;
                uVar31 = uVar31 + 1;
              }
              local_72 = 1;
              func_0x0001459b5df0();
              uStack_190 = local_b8;
              local_1a0 = CONCAT44(uStack_c8._4_4_,(undefined4)uStack_c8);
              bStack_198 = (byte)uStack_c0;
              bStack_197 = (byte)((ulong)uStack_c0 >> 8);
              uStack_196 = (undefined2)((ulong)uStack_c0 >> 0x10);
              uStack_194 = uStack_c0._4_4_;
              uStack_1b0 = local_d8;
              uStack_1a8 = uStack_d0;
              unique0x1000298d = local_e8;
              local_1b8 = uStack_e0;
              uStack_1d0 = local_f8;
              auStack_1c8._0_8_ = uStack_f0;
              local_1d8._0_2_ = CONCAT11((char)local_90,uVar24);
              if (local_2b0 == local_2c0) {
                func_0x000145c26910();
              }
              lVar39 = local_2b0 * 0x50;
              puVar21 = (undefined8 *)(lStack_2b8 + 0x40 + lVar39);
              *puVar21 = CONCAT44(uStack_194,CONCAT22(uStack_196,CONCAT11(bStack_197,bStack_198)));
              puVar21[1] = uStack_190;
              puVar21 = (undefined8 *)(lStack_2b8 + 0x30 + lVar39);
              *puVar21 = uStack_1a8;
              puVar21[1] = local_1a0;
              puVar21 = (undefined8 *)(lStack_2b8 + 0x20 + lVar39);
              *puVar21 = local_1b8;
              puVar21[1] = uStack_1b0;
              puVar21 = (undefined8 *)(lStack_2b8 + 0x10 + lVar39);
              *puVar21 = auStack_1c8._0_8_;
              puVar21[1] = stack0xfffffffffffffe40;
              puVar3 = (undefined4 *)(lStack_2b8 + lVar39);
              *puVar3 = (int)local_1d8;
              puVar3[1] = local_1d8._4_4_;
              puVar3[2] = (undefined4)uStack_1d0;
              puVar3[3] = uStack_1d0._4_4_;
              local_2b0 = local_2b0 + 1;
            }
          }
          else {
            uVar45 = *pbVar26 - 0x30;
            if (uVar45 < 10) {
              if (uVar31 - uVar20 != 1) {
                uVar16 = pbVar26[1] - 0x30;
                if (9 < uVar16) goto joined_r0x00014589ef4a;
                uVar45 = CONCAT31((int3)(uVar16 >> 8),(char)uVar16 + (char)uVar45 * '\n');
              }
LAB_14589f235:
              if ((!bVar52) && (local_368 = cVar12, (byte)uVar45 < 3)) goto LAB_14589f2ad;
            }
          }
        }
        else {
          lVar39 = 0;
          uVar45 = 0;
          while( true ) {
            if (lVar39 == uVar31 - uVar20) goto LAB_14589f235;
            sVar14 = (ushort)(byte)uVar45 * 10;
            if ((char)((ushort)sVar14 >> 8) != '\0') break;
            bVar46 = (byte)(pbVar26[lVar39] - 0x30);
            bVar13 = (byte)sVar14;
            uVar45 = (uint)(byte)(bVar13 + bVar46);
            if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar13,bVar46))) break;
          }
        }
      }
    }
joined_r0x00014589ef4a:
    if (local_1f8 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
  }
  local_290 = 0;
  puStack_288 = (ulong *)&DAT_00000008;
  local_280 = 0;
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
LAB_14589fd17:
  if ((bStack_197 & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = local_e8;
    if (((int)local_f8 == 1) ||
       ((bStack_197 == 0 &&
        (bStack_197 = 1, puVar22 = local_1d8, (uStack_1d0 != local_1d8 | bStack_198) == 1)))) {
      local_1d8 = puVar22;
      auVar58 = func_0x000140089200();
      piVar34 = auVar58._0_8_;
      if ((4 < auVar58._8_8_) && ((char)piVar34[1] == '|' && *piVar34 == 0x6e656573)) {
        puVar51 = (ulong *)(auVar58._8_8_ - 5);
        lVar39 = (long)piVar34 + 5;
        local_90 = (ulong *)((long)piVar34 + 6);
        local_70 = (ulong *)0x0;
        puVar35 = (ulong *)0x0;
        puVar22 = (ulong *)0x0;
        puVar50 = local_90;
LAB_14589fe40:
        local_80 = puVar22;
        if (((ulong)local_70 & 1) == 0) {
          local_70 = (ulong *)CONCAT71((int7)((ulong)puVar50 >> 8),1);
          puVar50 = puVar35;
          do {
            puVar35 = puVar50;
            puVar47 = puVar51;
            local_80 = puVar22;
            if (puVar51 < puVar50) goto LAB_14589ff26;
            puVar35 = puVar51;
            if ((ulong)((long)puVar51 - (long)puVar50) < 0x10) {
              uVar31 = 0;
              if (puVar51 == puVar50) goto LAB_14589ff26;
              while (*(char *)((long)puVar50 + uVar31 + lVar39) != ',') {
                uVar31 = uVar31 + 1;
                if ((long)puVar51 - (long)puVar50 == uVar31) goto LAB_14589ff26;
              }
            }
            else {
              auVar58 = func_0x000145bd5860();
              uVar31 = auVar58._8_8_;
              puVar22 = local_80;
              if (auVar58._0_8_ != 1) goto LAB_14589ff26;
            }
            puVar35 = (ulong *)((long)puVar50 + uVar31 + 1);
            puVar47 = (ulong *)(uVar31 + (long)puVar50);
            puVar22 = local_80;
            puVar50 = puVar35;
          } while ((puVar51 <= puVar47) || (*(char *)(lVar39 + (long)puVar47) != ','));
          local_70 = (ulong *)0x0;
          puVar22 = puVar35;
LAB_14589ff26:
          puVar47 = (ulong *)((long)puVar47 - (long)local_80);
          puVar32 = (undefined1 *)(lVar39 + (long)local_80);
          puVar49 = (ulong *)0x0;
          do {
            if ((ulong)((long)puVar47 - (long)puVar49) < 0x10) {
              uVar31 = 0;
              if (puVar47 == puVar49) {
LAB_14589ff81:
                puVar50 = (ulong *)0x0;
                break;
              }
              while (*(char *)((long)puVar49 + (long)(puVar32 + uVar31)) != '=') {
                uVar31 = uVar31 + 1;
                if ((long)puVar47 - (long)puVar49 == uVar31) goto LAB_14589ff81;
              }
              auVar59._8_8_ = 0;
              auVar59._0_8_ = uVar31;
              auVar59 = auVar59 << 0x40;
            }
            else {
              auVar59 = func_0x000145bd5860();
              puVar50 = auVar59._0_8_;
              if (puVar50 != (ulong *)0x1) break;
            }
            lVar33 = auVar59._8_8_;
            puVar50 = auVar59._0_8_;
            puVar27 = (ulong *)((long)puVar49 + lVar33 + 1);
            puVar4 = (ulong *)(lVar33 + (long)puVar49);
            if ((puVar4 < puVar47) && (puVar32[(long)puVar4] == '=')) {
              uVar31 = (long)puVar47 - (long)puVar27;
              if (uVar31 == 0) break;
              pcVar28 = (char *)((long)puVar27 + (long)puVar32);
              if (uVar31 == 1) {
                cVar12 = *pcVar28;
                puVar50 = (ulong *)0x0;
                if ((cVar12 == '+') || (cVar12 == '-')) break;
              }
              else {
                cVar12 = *pcVar28;
              }
              uVar36 = (ulong)(cVar12 == '+');
              if (2 < uVar31 - uVar36) {
                puVar32 = (undefined1 *)(lVar33 + (long)puVar49);
                puVar50 = (ulong *)0x0;
                goto LAB_1458a006f;
              }
              if (uVar31 == uVar36) {
                puVar50 = (ulong *)0x0;
                goto LAB_1458a00a9;
              }
              uVar45 = (byte)pcVar28[uVar36] - 0x30;
              puVar50 = (ulong *)(ulong)uVar45;
              if (uVar45 < 10) {
                if (uVar31 - uVar36 == 1) goto LAB_1458a00a9;
                uVar16 = (byte)pcVar28[uVar36 + 1] - 0x30;
                if (uVar16 < 10) {
                  puVar50 = (ulong *)(ulong)CONCAT31((int3)(uVar16 >> 8),
                                                     (char)uVar16 + (char)uVar45 * '\n');
                  goto LAB_1458a00a9;
                }
              }
              break;
            }
            puVar49 = puVar27;
          } while (puVar27 <= puVar47);
          goto LAB_14589fe40;
        }
      }
      goto LAB_14589fd17;
    }
  }
  if (1 < local_280) {
    if (local_280 < 0x15) {
      lVar39 = local_280 << 5;
      lVar33 = 0x20;
      do {
        func_0x0001459a98d0();
        lVar33 = lVar33 + 0x20;
      } while (lVar39 != lVar33);
    }
    else {
      func_0x0001459de1d0();
    }
  }
  func_0x0001459b5800();
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_15c = 0xffffffff;
  local_114 = 0xffffffff;
  func_0x0001459b9850();
  if (1 < local_3c8) {
    if (local_3c8 < 0x15) {
      func_0x0001400f2c00();
    }
    else {
      func_0x000145ae0500();
    }
  }
  func_0x0001459b4d20();
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_15c = 0xffffffff;
  local_114 = 0xffffffff;
  func_0x0001459bdb90();
  if (1 < local_3e0) {
    if (local_3e0 < 0x15) {
      lVar39 = local_3e0 << 5;
      lVar33 = 0x20;
      do {
        func_0x0001459a99e0();
        lVar33 = lVar33 + 0x20;
      } while (lVar39 != lVar33);
    }
    else {
      func_0x0001459de370();
    }
  }
  func_0x0001459b5940();
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
LAB_1458a0357:
  if ((bStack_197 & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = local_e8;
    if (((int)local_f8 == 1) ||
       ((bStack_197 == 0 &&
        (bStack_197 = 1, puVar22 = local_1d8, (uStack_1d0 != local_1d8 | bStack_198) == 1)))) {
      local_1d8 = puVar22;
      auVar58 = func_0x000140089200();
      piVar34 = auVar58._0_8_;
      if ((4 < auVar58._8_8_) && ((char)piVar34[1] == '|' && *piVar34 == 0x74617473)) {
        puVar50 = (ulong *)(auVar58._8_8_ - 5);
        lVar39 = (long)piVar34 + 5;
        local_90 = (ulong *)((long)piVar34 + 6);
        auVar60._8_8_ = 0;
        auVar60._0_8_ = local_90;
        local_80 = (ulong *)0x0;
        puVar22 = (ulong *)0x0;
        local_70 = (ulong *)((ulong)local_70 & 0xffffffff00000000);
LAB_1458a0480:
        puVar35 = local_80;
        if (((ulong)local_70 & 1) == 0) {
          local_70 = (ulong *)CONCAT44(local_70._4_4_,(int)CONCAT71(auVar60._1_7_,1));
          lVar33 = lVar39;
          puVar51 = puVar22;
          do {
            puVar47 = puVar50;
            puVar22 = puVar51;
            puVar49 = puVar35;
            if (puVar50 < puVar51) goto LAB_1458a0568;
            puVar22 = puVar50;
            if ((ulong)((long)puVar50 - (long)puVar51) < 0x10) {
              uVar31 = 0;
              if (puVar50 == puVar51) goto LAB_1458a0568;
              while (*(char *)((long)puVar51 + uVar31 + lVar33) != ',') {
                uVar31 = uVar31 + 1;
                if ((long)puVar50 - (long)puVar51 == uVar31) goto LAB_1458a0568;
              }
            }
            else {
              auVar58 = func_0x000145bd5860();
              uVar31 = auVar58._8_8_;
              if (auVar58._0_8_ != 1) goto LAB_1458a0568;
            }
            puVar22 = (ulong *)((long)puVar51 + uVar31 + 1);
            puVar47 = (ulong *)(uVar31 + (long)puVar51);
            puVar51 = puVar22;
          } while ((puVar50 <= puVar47) || (*(char *)(lVar33 + (long)puVar47) != ','));
          local_70 = (ulong *)((ulong)local_70 & 0xffffffff00000000);
          puVar49 = puVar22;
LAB_1458a0568:
          local_80 = puVar49;
          uVar36 = (long)puVar47 - (long)puVar35;
          lVar39 = lVar33;
          uVar31 = 0;
          do {
            uVar20 = uVar36 - uVar31;
            if (uVar20 < 0x10) {
              uVar19 = 0;
              uVar23 = uVar19;
              if (uVar20 == 0) {
LAB_1458a05c1:
                auVar11._8_8_ = 0;
                auVar11._0_8_ = uVar23;
                auVar60 = auVar11 << 0x40;
                break;
              }
              while (*(char *)((long)puVar35 + uVar19 + uVar31 + lVar33) != '=') {
                uVar19 = uVar19 + 1;
                uVar23 = uVar20;
                if (uVar20 == uVar19) goto LAB_1458a05c1;
              }
            }
            else {
              auVar60 = func_0x000145bd5860();
              uVar19 = auVar60._8_8_;
              if (auVar60._0_8_ != 1) break;
            }
            uVar23 = uVar19 + uVar31 + 1;
            auVar10._8_8_ = uVar19;
            auVar10._0_8_ = uVar23;
            auVar8._8_8_ = uVar19;
            auVar8._0_8_ = uVar23;
            auVar7._8_8_ = uVar19;
            auVar7._0_8_ = uVar23;
            auVar60._8_8_ = uVar19;
            auVar60._0_8_ = uVar23;
            uVar20 = uVar19 + uVar31;
            if ((uVar20 < uVar36) && (*(char *)((long)puVar35 + uVar20 + lVar33) == '=')) {
              if (uVar20 - 4 < 6) {
                    /* WARNING: Could not emulate address calculation at 0x0001458a0625 */
                    /* WARNING: Treating indirect jump as call */
                puVar21 = (undefined8 *)
                          (*(code *)((long)*(int *)((uVar20 - 4) * 4 + 0x146bebc5c) + 0x146bebc5c))
                                    ();
                return puVar21;
              }
              uVar41 = uVar36 - uVar23;
              if (uVar41 == 0) break;
              if (uVar41 == 1) {
                cVar12 = *(char *)((long)puVar35 + uVar23 + lVar33);
                auVar60 = auVar7;
                if ((cVar12 == '+') || (auVar60 = auVar8, cVar12 == '-')) break;
              }
              else {
                cVar12 = *(char *)((long)puVar35 + uVar23 + lVar33);
              }
              uVar23 = (ulong)(cVar12 == '+');
              if (0x10 < uVar41 - uVar23) {
                uVar31 = 0;
                goto LAB_1458a07bc;
              }
              if (uVar41 == uVar23) {
                uVar31 = 0;
                goto LAB_1458a07f7;
              }
              uVar19 = uVar19 + uVar31;
              uVar31 = 0;
              goto LAB_1458a0780;
            }
            uVar31 = uVar23;
            auVar60 = auVar10;
          } while (uVar23 <= uVar36);
          goto LAB_1458a0480;
        }
      }
      goto LAB_1458a0357;
    }
  }
  local_2d8 = 0;
  pcStack_2d0 = &DAT_00000008;
  local_2c8 = 0;
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8 = 0xa0000000a;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  do {
    while( true ) {
      FUN_1458aabb0();
      puVar22 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_1458a08c4;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar22 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_1458a08c4;
      }
      local_f8 = puVar22;
      auVar58 = func_0x000140089200();
      uStack_1d0 = auVar58._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar58;
      func_0x0001459bd2c0();
      if ((((local_248 != (ulong *)0x3) || (puStack_250[1] != 4)) ||
          (*(int *)*puStack_250 != 0x74616562)) || (uVar31 = puStack_250[3], uVar31 == 0)) break;
      pcVar28 = (char *)puStack_250[2];
      if (uVar31 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) break;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar36 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar36);
      if (2 < uVar31 - uVar36) {
        lVar39 = 0;
        uVar45 = 0;
        while( true ) {
          if (lVar39 == uVar31 - uVar36) goto LAB_1458a0db5;
          sVar14 = (ushort)(byte)uVar45 * 10;
          if ((char)((ushort)sVar14 >> 8) != '\0') break;
          bVar46 = (byte)sVar14;
          bVar13 = (byte)(pbVar26[lVar39] - 0x30);
          uVar45 = (uint)(byte)(bVar46 + bVar13);
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar46,bVar13))) break;
        }
        break;
      }
      if (uVar31 == uVar36) {
        uVar45 = 0;
      }
      else {
        uVar45 = *pbVar26 - 0x30;
        if (9 < uVar45) break;
        if (uVar31 - uVar36 != 1) {
          if (9 < pbVar26[1] - 0x30) break;
          uVar45 = (uint)(byte)((char)(pbVar26[1] - 0x30) + (char)uVar45 * '\n');
        }
      }
LAB_1458a0db5:
      local_338 = (ulong *)CONCAT71(local_338._1_7_,(char)uVar45);
      unique0x00023d00 = (ulong *)puStack_250[4];
      local_70 = puStack_250;
      auStack_1c8._0_8_ = puStack_250[5];
      uStack_1d0 = (ulong *)0x0;
      uStack_1b0 = (ulong *)0x0;
      local_1a0 = 0x2c0000002c;
      bStack_198 = 1;
      uStack_190 = CONCAT62(uStack_190._2_6_,1);
      local_1d8 = &local_338;
      local_1b8 = (ulong *)auStack_1c8._0_8_;
      uStack_1a8 = (ulong *)auStack_1c8._0_8_;
      func_0x0001459b6310();
      if (local_258 == (ulong *)0x0) goto LAB_1458a0b70;
LAB_1458a0cd0:
      func_0x0001400021d0();
      if ((local_b8 & 0x100) != 0) goto LAB_1458a08c4;
    }
    if (local_258 != (ulong *)0x0) goto LAB_1458a0cd0;
LAB_1458a0b70:
  } while ((local_b8 & 0x100) == 0);
LAB_1458a08c4:
  uVar31 = local_2c8;
  if (1 < local_2c8) {
    if (local_2c8 < 0x15) {
      func_0x0001459af240();
    }
    else {
      func_0x0001459a91e0();
    }
    uVar31 = local_2c8;
    if (1 < local_2c8) {
      uVar36 = 1;
      lVar39 = 0x20;
      do {
        if ((pcStack_2d0[lVar39 + -0x10] == pcStack_2d0[lVar39 + -0x20]) &&
           (*(long *)(pcStack_2d0 + lVar39 + -8) == *(long *)(pcStack_2d0 + lVar39 + -0x18))) {
          uVar31 = uVar36;
          if (uVar36 + 1 < local_2c8) {
            do {
              lVar33 = uVar36 * 0x10;
              if ((pcStack_2d0[lVar39] != pcStack_2d0[lVar33 + -0x10]) ||
                 (*(long *)(pcStack_2d0 + lVar39 + 8) != *(long *)(pcStack_2d0 + lVar33 + -8))) {
                pcVar28 = pcStack_2d0 + lVar39;
                pcVar40 = pcStack_2d0 + lVar33;
                uVar54 = *(undefined4 *)(pcVar28 + 4);
                uVar55 = *(undefined4 *)(pcVar28 + 8);
                uVar56 = *(undefined4 *)(pcVar28 + 0xc);
                *(undefined4 *)pcVar40 = *(undefined4 *)pcVar28;
                *(undefined4 *)(pcVar40 + 4) = uVar54;
                *(undefined4 *)(pcVar40 + 8) = uVar55;
                *(undefined4 *)(pcVar40 + 0xc) = uVar56;
                uVar36 = uVar36 + 1;
              }
              lVar39 = lVar39 + 0x10;
              uVar31 = uVar36;
            } while (local_2c8 << 4 != lVar39);
          }
          break;
        }
        uVar36 = uVar36 + 1;
        lVar39 = lVar39 + 0x10;
      } while (local_2c8 != uVar36);
    }
  }
  local_2c8 = uVar31;
  pcVar28 = pcStack_2d0 + local_2c8 * 0x10;
  uVar31 = 0xc;
  pcVar40 = pcStack_2d0;
  if (pcStack_2d0 != pcVar28) {
    do {
      lVar39 = local_200;
      pcVar1 = pcVar40 + 0x10;
      cVar12 = *pcVar40;
      uVar36 = *(long *)(pcVar40 + 8) + 2U;
      if (0xb < *(long *)(pcVar40 + 8) + 2U) {
        uVar36 = uVar31;
      }
      lVar48 = local_200 * 0x10;
      lVar33 = 0;
      do {
        if (lVar48 == lVar33) {
          if (local_200 == local_210) {
            func_0x000145bfaef0();
          }
          *(char *)(lStack_208 + lVar48) = cVar12;
          *(ulong *)(lStack_208 + 8 + lVar48) = uVar36;
          local_200 = lVar39 + 1;
          goto joined_r0x0001458a0ae0;
        }
        lVar2 = lVar33 + 0x10;
        pcVar40 = (char *)(lStack_208 + lVar33);
        lVar33 = lVar2;
      } while (*pcVar40 != cVar12);
      uVar20 = *(ulong *)(lStack_208 + -8 + lVar2);
      if (uVar20 < uVar36) {
        uVar20 = uVar36;
      }
      *(ulong *)(lStack_208 + -8 + lVar2) = uVar20;
joined_r0x0001458a0ae0:
      pcVar40 = pcVar1;
    } while (pcVar1 != pcVar28);
  }
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_15c = 0xffffffff;
  local_114 = 0xffffffff;
  func_0x0001459bd8f0();
  if (1 < local_358) {
    if (local_358 < 0x15) {
      lVar39 = local_358 << 5;
      lVar33 = 0x20;
      do {
        func_0x0001459a98d0();
        lVar33 = lVar33 + 0x20;
      } while (lVar39 != lVar33);
    }
    else {
      func_0x0001459de1d0();
    }
  }
  func_0x0001459b5940();
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0 = CONCAT71(local_1a0._1_7_,1);
  bStack_198 = 0;
  bStack_197 = 0;
  local_15c = 0xffffffff;
  local_114 = 0xffffffff;
  func_0x0001459c34a0();
  uVar31 = local_2e8;
  if (1 < local_2e8) {
    puVar37 = puStack_2f0;
    if (local_2e8 < 0x15) {
      puVar29 = puStack_2f0 + 1;
      lVar39 = 4;
      do {
        uVar16 = puVar29[-1];
        uVar45 = *puVar29;
        lVar33 = lVar39;
        if (uVar45 < uVar16) {
          do {
            *(uint *)((long)puStack_2f0 + lVar33) = uVar16;
            puVar42 = puStack_2f0;
            if (lVar33 == 4) goto LAB_1458a25d5;
            uVar16 = *(uint *)((long)puStack_2f0 + lVar33 + -8);
            lVar33 = lVar33 + -4;
          } while (uVar45 < uVar16);
          puVar42 = (uint *)(lVar33 + (long)puStack_2f0);
LAB_1458a25d5:
          *puVar42 = uVar45;
        }
        puVar29 = puVar29 + 1;
        lVar39 = lVar39 + 4;
      } while (puVar29 != puStack_2f0 + local_2e8);
      if (local_2e8 < 2) goto LAB_1458a0a32;
    }
    else {
      func_0x000145b199b0();
    }
    lVar39 = 0;
    do {
      if (puVar37[lVar39 + 1] == puVar37[lVar39]) {
        uVar36 = lVar39 + 2;
        local_2e8 = lVar39 + 1;
        if (uVar36 < uVar31) {
          if (((int)uVar31 - (int)lVar39 & 1U) != 0) {
            if (puVar37[lVar39 + 2] != puVar37[lVar39]) {
              puVar37[lVar39 + 1] = puVar37[lVar39 + 2];
              local_2e8 = lVar39 + 2;
            }
            uVar36 = lVar39 + 3;
          }
          uVar20 = local_2e8;
          if (uVar31 - 3 != lVar39) goto LAB_1458a2745;
        }
        break;
      }
      lVar39 = lVar39 + 1;
    } while (uVar31 - 1 != lVar39);
  }
LAB_1458a0a32:
  local_1d8 = (ulong *)0x0;
  uStack_1d0 = local_a0;
  auStack_1c8._0_8_ = local_a8;
  stack0xfffffffffffffe40 = local_a0;
  local_1b8 = (ulong *)0x0;
  uStack_1b0 = local_a0;
  uStack_1a8 = (ulong *)0xa0000000a;
  local_1a0._0_1_ = 1;
  bStack_198 = 0;
  bStack_197 = 0;
  uVar38 = 0x65736572;
LAB_1458a0e87:
  uVar31 = 0;
  if ((bStack_197 & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = local_e8;
    if (((int)local_f8 != 1) &&
       ((bStack_197 != 0 ||
        (bStack_197 = 1, uVar31 = 0, puVar22 = local_1d8,
        (uStack_1d0 != local_1d8 | bStack_198) != 1)))) goto LAB_1458a1045;
    local_1d8 = puVar22;
    auVar58 = func_0x000140089200();
    uVar31 = auVar58._8_8_;
    piVar34 = auVar58._0_8_;
    if ((6 < uVar31) &&
       ((*(int *)((long)piVar34 + 3) == 0x7c737465 && *piVar34 == (int)uVar38 &&
        (uVar36 = uVar31 - 7, uVar36 != 0)))) {
      pcVar28 = (char *)((long)piVar34 + 7);
      if (uVar31 == 8) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a0e87;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar19 = (ulong)(cVar12 == '+');
      uVar20 = uVar36 - uVar19;
      uVar31 = 0;
      if (uVar20 < 9) {
        if (uVar36 == uVar19) goto LAB_1458a1045;
        uVar36 = 0;
        while ((byte)pcVar28[uVar36 + uVar19] - 0x30 < 10) {
          uVar31 = (ulong)(((byte)pcVar28[uVar36 + uVar19] - 0x30) + (int)uVar31 * 10);
          uVar36 = uVar36 + 1;
          if (uVar20 == uVar36) goto LAB_1458a1045;
        }
      }
      else {
        uVar36 = 0;
        while( true ) {
          if (uVar20 == uVar36) goto LAB_1458a1045;
          uVar45 = (uint)(uVar31 * 10);
          if ((int)(uVar31 * 10 >> 0x20) != 0) break;
          uVar16 = (byte)pcVar28[uVar36 + uVar19] - 0x30;
          uVar31 = (ulong)(uVar45 + uVar16);
          if ((9 < uVar16) || (uVar36 = uVar36 + 1, CARRY4(uVar45,uVar16))) break;
        }
      }
    }
    goto LAB_1458a0e87;
  }
LAB_1458a1045:
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8 = 0xa0000000a;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uVar38 = 0x73746570;
  bVar46 = 0;
  local_70 = (ulong *)uVar31;
  while ((bVar46 & 1) == 0) {
    FUN_1458aabb0();
    puVar22 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_b8._1_1_ != '\0') break;
      local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
      puVar22 = local_f8;
      if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) break;
    }
    local_f8 = puVar22;
    auVar58 = func_0x000140089200();
    piVar34 = auVar58._0_8_;
    if ((4 < auVar58._8_8_) && ((char)piVar34[1] == '|' && *piVar34 == (int)uVar38)) {
      register0x00000000 = (ulong *)((long)piVar34 + 5);
      auStack_1c8._0_8_ = auVar58._8_8_ - 5;
      local_1d8 = (ulong *)0x2;
      uStack_1d0 = (ulong *)0x0;
      uStack_1b0 = (ulong *)0x0;
      local_1a0._0_1_ = 0x2c;
      local_1a0._1_7_ = 0x2c000000;
      bStack_198 = 1;
      uStack_190 = CONCAT62(uStack_190._2_6_,1);
      local_1b8 = (ulong *)auStack_1c8._0_8_;
      uStack_1a8 = (ulong *)auStack_1c8._0_8_;
      func_0x0001459b95e0();
      local_1f8 = local_258;
      puStack_1f0 = puStack_250;
      local_1e8 = local_248;
      goto LAB_1458a1272;
    }
    bVar46 = local_b8._1_1_;
  }
  local_1f8 = (ulong *)0x0;
  puStack_1f0 = (ulong *)&DAT_00000008;
  local_1e8 = (ulong *)0x0;
LAB_1458a1272:
  local_338 = (ulong *)0x0;
  uStack_330 = (ulong *)0x1;
  local_328 = (ulong *)0x0;
  puVar22 = (ulong *)0x0;
  puVar50 = (ulong *)0x0;
LAB_1458a149d:
  puVar35 = puVar50;
  if (puVar50 <= local_a0) {
    do {
      puVar32 = (undefined1 *)((long)local_a8 + (long)puVar35);
      if ((ulong)((long)local_a0 - (long)puVar35) < 0x10) {
        uVar31 = 0;
        puVar50 = local_a0;
        if (local_a0 == puVar35) break;
        while (puVar32[uVar31] != '\n') {
          uVar31 = uVar31 + 1;
          if ((long)local_a0 - (long)puVar35 == uVar31) goto LAB_1458a156a;
        }
      }
      else {
        auVar58 = func_0x000145bd5860();
        uVar31 = auVar58._8_8_;
        puVar50 = local_a0;
        if (auVar58._0_8_ != 1) break;
      }
      puVar51 = (ulong *)((long)puVar35 + uVar31 + 1);
      puVar50 = puVar51;
      if (((ulong *)((long)puVar35 + uVar31) < local_a0) && (puVar32[uVar31] == '\n')) {
        uVar31 = 0;
        puVar35 = puVar51;
        goto LAB_1458a157f;
      }
      puVar35 = puVar51;
    } while (puVar51 <= local_a0);
  }
LAB_1458a156a:
  uVar31 = 1;
  puVar51 = local_a0;
  puVar35 = puVar22;
  if (local_a0 != puVar22) {
LAB_1458a157f:
    lVar33 = (long)puVar51 - (long)puVar22;
    lVar39 = lVar33;
    if ((lVar33 != 0) && (((undefined1 *)((long)local_a8 + -1))[(long)puVar51] == '\n')) {
      lVar39 = lVar33 + -1;
      if (lVar39 == 0) {
        lVar39 = 0;
      }
      else if (((undefined1 *)((long)local_a8 + -2))[(long)puVar51] == '\r') {
        lVar39 = lVar33 + -2;
      }
    }
    auVar58 = func_0x000140089200(puVar35,uVar31,lVar39,
                                  (undefined1 *)((long)local_a8 + (long)puVar22));
    uStack_1d0 = auVar58._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0._0_1_ = 1;
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar58;
    func_0x0001459bd2c0();
    if ((((local_248 == (ulong *)0x5) && (puStack_250[1] == 4)) &&
        (*(int *)*puStack_250 == 0x6f726568)) && (uVar36 = puStack_250[3], uVar36 != 0)) {
      pcVar28 = (char *)puStack_250[2];
      if (uVar36 == 1) {
        cVar12 = *pcVar28;
        if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a1660;
      }
      else {
        cVar12 = *pcVar28;
      }
      uVar20 = (ulong)(cVar12 == '+');
      pbVar26 = (byte *)(pcVar28 + uVar20);
      if (uVar36 - uVar20 < 3) {
        if (uVar36 == uVar20) {
          uVar19 = 0;
        }
        else {
          uVar45 = *pbVar26 - 0x30;
          uVar19 = (ulong)uVar45;
          if (9 < uVar45) goto LAB_1458a1660;
          if (uVar36 - uVar20 != 1) {
            if (9 < pbVar26[1] - 0x30) goto LAB_1458a1660;
            uVar19 = (ulong)(byte)((char)(pbVar26[1] - 0x30) + (char)uVar45 * '\n');
          }
        }
LAB_1458a1752:
        uVar36 = puStack_250[5];
        if (uVar36 != 0) {
          pcVar28 = (char *)puStack_250[4];
          if (uVar36 == 1) {
            cVar12 = *pcVar28;
            if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a1660;
          }
          else {
            cVar12 = *pcVar28;
          }
          uVar20 = (ulong)(cVar12 == '+');
          pbVar26 = (byte *)(pcVar28 + uVar20);
          if (uVar36 - uVar20 < 3) {
            if (uVar36 == uVar20) {
              uVar45 = 0;
            }
            else {
              uVar45 = *pbVar26 - 0x30;
              if (9 < uVar45) goto LAB_1458a1660;
              if (uVar36 - uVar20 != 1) {
                uVar16 = pbVar26[1] - 0x30;
                if (9 < uVar16) goto LAB_1458a1660;
                uVar45 = CONCAT31((int3)(uVar16 >> 8),(char)uVar16 + (char)uVar45 * '\n');
              }
            }
LAB_1458a1822:
            uVar16 = (int)uVar19 - 1;
            if (((byte)uVar16 < 0xb) && ((0x5dfU >> (uVar16 & 0x1f) & 1) != 0)) {
              uVar36 = (ulong)((uVar16 & 0xff) << 3);
              lVar39 = 0;
              do {
                if (*(char *)(*(long *)(uVar36 + 0x146beba90) + lVar39) == (char)uVar45) {
                  uVar36 = puStack_250[7];
                  if (uVar36 == 0) break;
                  pcVar28 = (char *)puStack_250[6];
                  if (uVar36 == 1) {
                    cVar12 = *pcVar28;
                    if ((cVar12 == '+') || (cVar12 == '-')) break;
                  }
                  else {
                    cVar12 = *pcVar28;
                  }
                  uVar20 = (ulong)(cVar12 == '+');
                  pbVar26 = (byte *)(pcVar28 + uVar20);
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,uVar45);
                  if (2 < uVar36 - uVar20) {
                    lVar39 = 0;
                    uVar45 = 0;
                    goto LAB_1458a190b;
                  }
                  if (uVar36 == uVar20) {
                    uVar45 = 0;
                    goto LAB_1458a1948;
                  }
                  uVar45 = *pbVar26 - 0x30;
                  if (uVar45 < 10) {
                    if (uVar36 - uVar20 == 1) goto LAB_1458a1948;
                    uVar16 = pbVar26[1] - 0x30;
                    if (uVar16 < 10) {
                      uVar45 = CONCAT31((int3)(uVar16 >> 8),(char)uVar16 + (char)uVar45 * '\n');
                      goto LAB_1458a1948;
                    }
                  }
                  break;
                }
                lVar39 = lVar39 + 1;
              } while (*(long *)(uVar36 + 0x146bebae8) != lVar39);
            }
          }
          else {
            lVar39 = 0;
            uVar45 = 0;
            while( true ) {
              if (lVar39 == uVar36 - uVar20) goto LAB_1458a1822;
              sVar14 = (ushort)(byte)uVar45 * 10;
              if ((char)((ushort)sVar14 >> 8) != '\0') break;
              bVar46 = (byte)sVar14;
              bVar13 = (byte)(pbVar26[lVar39] - 0x30);
              uVar45 = (uint)(byte)(bVar46 + bVar13);
              if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar46,bVar13)))
              break;
            }
          }
        }
      }
      else {
        lVar39 = 0;
        uVar19 = 0;
        while( true ) {
          if (lVar39 == uVar36 - uVar20) goto LAB_1458a1752;
          sVar14 = (ushort)(byte)uVar19 * 10;
          if ((char)((ushort)sVar14 >> 8) != '\0') break;
          bVar46 = (byte)(pbVar26[lVar39] - 0x30);
          bVar13 = (byte)sVar14;
          uVar19 = (ulong)(byte)(bVar13 + bVar46);
          if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar13,bVar46))) break;
        }
      }
    }
    goto LAB_1458a1660;
  }
  goto LAB_1458a12b2;
LAB_1458a279d:
  func_0x000145d99653();
  goto LAB_1458a2924;
LAB_1458a006f:
  if ((undefined1 *)((long)puVar47 + (-1 - uVar36)) == puVar32) goto LAB_1458a00a9;
  uVar15 = (ushort)(byte)puVar50 * 10;
  puVar50 = (ulong *)(ulong)uVar15;
  if ((char)(uVar15 >> 8) != '\0') goto LAB_14589fe40;
  uVar45 = *(byte *)((long)local_90 + (long)((long)local_80 + (long)(puVar32 + uVar36))) - 0x30;
  bVar46 = (byte)uVar45;
  puVar50 = (ulong *)(ulong)(byte)((byte)uVar15 + bVar46);
  if ((9 < uVar45) || (puVar32 = puVar32 + 1, CARRY1((byte)uVar15,bVar46))) goto LAB_14589fe40;
  goto LAB_1458a006f;
LAB_1458a00a9:
  if (puVar4 != (ulong *)0x0) {
    puVar47 = local_98;
    if (-1 < (long)puVar4) {
      local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)puVar50);
      func_0x000140002200();
      local_98 = (ulong *)func_0x0001400021c0();
      puVar47 = puVar4;
      if (local_98 != (ulong *)0x0) {
        local_100 = puVar4;
        func_0x000145bfa0e7();
        uVar31 = local_280;
        bVar46 = (byte)local_80;
        if (3 < (byte)local_80) {
          bVar46 = 4;
        }
        if (local_280 == local_290) {
          func_0x000145bfae10();
        }
        puStack_288[uVar31 * 4] = (ulong)local_100;
        puStack_288[uVar31 * 4 + 1] = (ulong)local_98;
        puStack_288[uVar31 * 4 + 2] = (ulong)local_100;
        *(byte *)(puStack_288 + uVar31 * 4 + 3) = bVar46;
        local_280 = uVar31 + 1;
        puVar50 = puStack_288;
        goto LAB_14589fe40;
      }
    }
    local_98 = puVar47;
    func_0x000145d992bb();
    goto LAB_1458a2924;
  }
  goto LAB_14589fe40;
LAB_1458a07bc:
  if ((uVar36 + -uVar23) - 1 == uVar20) goto LAB_1458a07f7;
  auVar5._8_8_ = 0;
  auVar5._0_8_ = uVar31;
  auVar60 = auVar5 * ZEXT816(10);
  uVar41 = auVar60._0_8_;
  if (auVar60._8_8_ != 0) goto LAB_1458a0480;
  uVar45 = *(byte *)((long)local_90 + (long)((long)puVar35 + uVar20 + uVar23)) - 0x30;
  uVar44 = (ulong)uVar45;
  uVar31 = uVar41 + uVar44;
  uVar19 = CONCAT71(auVar60._9_7_,CARRY8(uVar41,uVar44));
  auVar9._8_8_ = uVar19;
  auVar9._0_8_ = uVar31;
  auVar60._8_8_ = uVar19;
  auVar60._0_8_ = uVar31;
  if ((9 < uVar45) || (uVar20 = uVar20 + 1, auVar60 = auVar9, CARRY8(uVar41,uVar44)))
  goto LAB_1458a0480;
  goto LAB_1458a07bc;
  while( true ) {
    uVar31 = (ulong)uVar45 + uVar31 * 10;
    uVar19 = uVar19 + 1;
    if ((uVar36 + -uVar23) - 1 == uVar19) break;
LAB_1458a0780:
    auVar60._8_8_ = uVar19;
    auVar60._0_8_ = uVar31;
    uVar45 = *(byte *)((long)local_90 + (long)((long)puVar35 + uVar19 + uVar23)) - 0x30;
    if (9 < uVar45) goto LAB_1458a0480;
  }
LAB_1458a07f7:
  auVar60._8_8_ = uVar19;
  auVar60._0_8_ = uVar31;
  goto LAB_1458a0480;
LAB_1458a2745:
  do {
    if (puVar37[uVar36] == puVar37[uVar20 - 1]) {
      uVar45 = puVar37[uVar36 + 1];
      local_2e8 = uVar20;
      if (uVar45 != puVar37[uVar20 - 1]) {
LAB_1458a276a:
        puVar37[uVar20] = uVar45;
        local_2e8 = uVar20 + 1;
      }
    }
    else {
      puVar37[uVar20] = puVar37[uVar36];
      local_2e8 = uVar20 + 1;
      uVar45 = puVar37[uVar36 + 1];
      puVar29 = puVar37 + uVar20;
      uVar20 = local_2e8;
      if (uVar45 != *puVar29) goto LAB_1458a276a;
    }
    uVar36 = uVar36 + 2;
    uVar20 = local_2e8;
  } while (uVar31 != uVar36);
  goto LAB_1458a0a32;
LAB_1458a190b:
  if (lVar39 == uVar36 - uVar20) goto LAB_1458a1948;
  sVar14 = (ushort)(byte)uVar45 * 10;
  if ((char)((ushort)sVar14 >> 8) != '\0') goto LAB_1458a1660;
  bVar46 = (byte)sVar14;
  bVar13 = (byte)(pbVar26[lVar39] - 0x30);
  uVar45 = (uint)(byte)(bVar46 + bVar13);
  if ((9 < pbVar26[lVar39] - 0x30) || (lVar39 = lVar39 + 1, CARRY1(bVar46,bVar13)))
  goto LAB_1458a1660;
  goto LAB_1458a190b;
LAB_1458a1948:
  local_100 = (ulong *)CONCAT44(local_100._4_4_,uVar45);
  local_98 = (ulong *)CONCAT71(local_98._1_7_,(char)uVar45 != '\0');
  auStack_1c8._0_8_ = puStack_250[8];
  local_90 = puStack_250;
  uStack_1d0 = (ulong *)puStack_250[9];
  local_1d8 = (ulong *)0x0;
  local_1b8 = (ulong *)0x0;
  uStack_1a8 = (ulong *)0x2c0000002c;
  local_1a0._0_1_ = 1;
  bStack_198 = 1;
  bStack_197 = 0;
  unique0x100052ec = uStack_1d0;
  uStack_1b0 = uStack_1d0;
  func_0x0001459c2230();
  if (local_e8 == (ulong *)0x5) {
    puVar22 = (ulong *)((ulong)local_1e0 & 0xffffff0000000000 | (ulong)(uint5)*uStack_f0);
    if (local_f8 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_1e0 = uStack_f0;
    puVar22 = uStack_f0;
    if (local_f8 != (ulong *)0xffffffffffffffff) {
      if (local_f8 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
LAB_1458a1660:
      puVar22 = puVar35;
      if (local_258 != (ulong *)0x0) {
        func_0x0001400021d0();
        puVar22 = puVar35;
      }
      goto joined_r0x0001458a1b3c;
    }
  }
  local_1e0 = puVar22;
  local_98 = (ulong *)func_0x0001459a2280();
  uVar45 = (uint)((char)local_100 != '\0');
  if (local_258 != (ulong *)0x0) {
    local_100 = (ulong *)CONCAT71(local_100._1_7_,(char)local_100 != '\0');
    func_0x0001400021d0();
    uVar45 = (uint)local_100 & 0xff;
  }
  puVar51 = (ulong *)((long)local_98 << 0x18 |
                     (ulong)(uVar45 << 0x10) | ((ulong)local_80 & 0xff) << 8 | uVar19 & 0xff);
  local_1d8 = puVar51;
  func_0x0001459b4f30();
  puVar22 = local_328;
  if (local_328 == local_338) {
    func_0x000145d7e390();
  }
  *(ulong **)((long)uStack_330 + (long)puVar22 * 8) = puVar51;
  local_328 = (ulong *)((long)puVar22 + 1);
  puVar22 = puVar35;
joined_r0x0001458a1b3c:
  if ((uVar31 & 1) != 0) {
LAB_1458a12b2:
    local_418[3][2] = local_418[2];
    *local_418[3] = local_418[0];
    local_418[3][1] = local_418[1];
    local_418[3][0x30] = local_390;
    local_418[3][0x31] = uStack_388;
    local_418[3][0x2e] = local_3a0;
    local_418[3][0x2f] = uStack_398;
    local_418[3][0x2c] = CONCAT44(uStack_3ac,local_3b0);
    local_418[3][0x2d] = puStack_3a8;
    local_418[3][0x2a] = local_3c0;
    local_418[3][0x2b] = CONCAT44(uStack_3b4,uStack_3b8);
    local_418[3][5] = local_200;
    local_418[3][3] = local_210;
    local_418[3][4] = lStack_208;
    local_418[3][8] = local_340;
    local_418[3][6] = local_350;
    local_418[3][7] = puStack_348;
    local_418[3][9] = local_278;
    local_418[3][10] = lStack_270;
    local_418[3][0xb] = local_268;
    local_418[3][0xc] = local_380;
    local_418[3][0xd] = lStack_378;
    local_418[3][0xe] = local_370;
    local_418[3][0xf] = local_2c0;
    local_418[3][0x10] = lStack_2b8;
    local_418[3][0x11] = local_2b0;
    local_418[3][0x12] = local_290;
    local_418[3][0x13] = puStack_288;
    local_418[3][0x14] = local_280;
    local_418[3][0x15] = local_3d8;
    local_418[3][0x16] = uStack_3d0;
    local_418[3][0x17] = local_3c8;
    local_418[3][0x1a] = local_3e0;
    local_418[3][0x18] = local_3f0;
    local_418[3][0x19] = uStack_3e8;
    local_418[3][0x1d] = local_2c8;
    local_418[3][0x1b] = local_2d8;
    local_418[3][0x1c] = pcStack_2d0;
    local_418[3][0x1e] = CONCAT71(uStack_367,local_368);
    local_418[3][0x1f] = uStack_360;
    local_418[3][0x20] = local_358;
    local_418[3][0x21] = CONCAT71(uStack_2f7,local_2f8);
    local_418[3][0x22] = puStack_2f0;
    local_418[3][0x23] = local_2e8;
    local_418[3][0x24] = local_1f8;
    local_418[3][0x25] = puStack_1f0;
    local_418[3][0x26] = local_1e8;
    local_418[3][0x29] = local_328;
    local_418[3][0x27] = local_338;
    local_418[3][0x28] = uStack_330;
    local_418[3][0x32] = 0;
    local_418[3][0x33] = 0;
    local_418[3][0x34] = 0;
    local_418[3][0x35] = 0;
    local_418[3][0x36] = 0;
    local_418[3][0x37] = 0;
    local_418[3][0x38] = 0;
    *(int *)(local_418[3] + 0x39) = (int)local_70;
    return local_418[3];
  }
  goto LAB_1458a149d;
LAB_1458a2788:
  func_0x000145d99653();
LAB_1458a2924:
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}
