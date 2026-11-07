
/* WARNING: Removing unreachable block (ram,0x0001454329c8) */
/* WARNING: Removing unreachable block (ram,0x000145432389) */
/* WARNING: Removing unreachable block (ram,0x000145432bc0) */
/* WARNING: Removing unreachable block (ram,0x000145432bcc) */
/* WARNING: Removing unreachable block (ram,0x000145432bd0) */
/* WARNING: Removing unreachable block (ram,0x000145433847) */
/* WARNING: Removing unreachable block (ram,0x000145433167) */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 *param_4,ulong *param_5)

{
  undefined4 *puVar1;
  ulong *puVar2;
  undefined1 auVar3 [16];
  code *pcVar4;
  undefined1 auVar5 [16];
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  char cVar10;
  byte bVar11;
  short sVar12;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  ulong uVar17;
  ulong uVar18;
  undefined8 *puVar19;
  ushort uVar13;
  ulong *puVar20;
  ulong uVar21;
  undefined1 uVar22;
  uint uVar23;
  byte *pbVar24;
  ulong *puVar25;
  char *pcVar26;
  uint *puVar27;
  undefined1 uVar28;
  ulong uVar29;
  undefined1 *puVar30;
  long lVar31;
  int *piVar32;
  ulong *puVar33;
  ulong uVar34;
  uint *puVar35;
  undefined8 uVar36;
  long lVar37;
  long lVar38;
  ulong uVar39;
  undefined4 *puVar40;
  uint *puVar41;
  byte bVar42;
  ulong uVar43;
  uint uVar44;
  byte bVar45;
  ulong *puVar46;
  ulong *puVar47;
  ulong *puVar48;
  ulong *puVar49;
  bool bVar50;
  bool bVar51;
  undefined4 in_XMM6_Da;
  undefined4 uVar52;
  undefined4 uVar53;
  undefined4 uVar54;
  undefined4 uVar55;
  undefined1 auVar56 [16];
  undefined1 auVar57 [16];
  undefined1 auVar58 [16];
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
  long lStack_2d0;
  ulong local_2c8;
  undefined8 local_2c0;
  undefined8 uStack_2b8;
  undefined8 local_2b0;
  long local_2a8;
  long lStack_2a0;
  long local_298;
  undefined8 local_290;
  ulong *local_288;
  ulong *local_280;
  ulong local_278;
  ulong *puStack_270;
  ulong local_268;
  ulong local_260;
  long lStack_258;
  ulong local_250;
  ulong local_248;
  ulong *local_240;
  ulong *puStack_238;
  ulong *local_230;
  ulong *local_228;
  undefined8 uStack_220;
  undefined8 local_218;
  undefined8 uStack_210;
  undefined1 local_208;
  undefined7 uStack_207;
  undefined2 local_200;
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
  unique0x10004e70 = param_5;
  uStack_1b0 = param_5;
  local_58 = in_XMM6_Da;
  func_0x000145537680(param_3,param_5,&local_1d8,local_418);
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
      puVar20 = (ulong *)0xffffffffffffffff;
      func_0x00014543cad0(0xffffffffffffffff,local_e8,&local_e8,&local_1d8);
      puVar48 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_145430852;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar48 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_145430852;
      }
      local_f8 = puVar48;
      auVar56 = func_0x0001400a4890();
      uStack_1d0 = auVar56._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar56;
      func_0x0001455393f0();
      if (((2 < (long)local_1e8 - 6U) || (puStack_1f0[1] != 4)) ||
         (*(int *)*puStack_1f0 != 0x6b636970)) break;
      puVar20 = local_1e8;
      if (local_1e8 < 7) {
        puVar48 = (ulong *)0x1;
        puVar33 = (ulong *)0x0;
        puVar49 = (ulong *)0x0;
        uVar29 = puStack_1f0[3];
        puVar46 = puStack_1f0;
        if (uVar29 != 0) goto LAB_14543407a;
LAB_145434128:
        if (puVar33 != (ulong *)0x0) {
LAB_14543412d:
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
      unique0x10004e80 = uStack_1d0;
      uStack_1b0 = uStack_1d0;
      func_0x00014553d930();
      uVar29 = local_70[3];
      puVar48 = puStack_238;
      puVar33 = local_240;
      puVar49 = local_230;
      puVar46 = local_70;
      if (uVar29 == 0) goto LAB_145434128;
LAB_14543407a:
      pcVar26 = (char *)puVar46[2];
      if (uVar29 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145434128;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar34 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar34);
      if (2 < uVar29 - uVar34) {
        lVar37 = 0;
        bVar45 = 0;
        while( true ) {
          if (lVar37 == uVar29 - uVar34) {
            if (puVar20 != (ulong *)0x2) goto LAB_14543418b;
            local_71 = 1;
            local_1e0 = puVar33;
            local_80 = puVar48;
            local_70 = puVar46;
            func_0x000145903b33();
            goto LAB_145434c0b;
          }
          if ((char)((ushort)((ushort)bVar45 * 10) >> 8) != '\0') break;
          bVar11 = (byte)(pbVar24[lVar37] - 0x30);
          bVar42 = (byte)((ushort)bVar45 * 10);
          bVar45 = bVar42 + bVar11;
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar42,bVar11))) break;
        }
        goto LAB_145434128;
      }
      if (uVar29 == uVar34) {
        bVar45 = 0;
      }
      else {
        bVar45 = (byte)(*pbVar24 - 0x30);
        if (9 < *pbVar24 - 0x30) goto LAB_145434128;
        if (uVar29 - uVar34 != 1) {
          if (9 < pbVar24[1] - 0x30) goto LAB_145434128;
          bVar45 = (char)(pbVar24[1] - 0x30) + bVar45 * '\n';
        }
      }
LAB_14543418b:
      uVar29 = puVar46[5];
      if (uVar29 == 0) {
LAB_145434367:
        local_80 = puVar48;
        if (puVar33 == (ulong *)0x0) break;
        goto LAB_14543412d;
      }
      pcVar26 = (char *)puVar46[4];
      if (uVar29 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145434367;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar34 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar34);
      if (2 < uVar29 - uVar34) {
        lVar37 = 0;
        uVar44 = 0;
        while( true ) {
          if (lVar37 == uVar29 - uVar34) goto LAB_1454342a6;
          sVar12 = (ushort)(byte)uVar44 * 10;
          if ((char)((ushort)sVar12 >> 8) != '\0') break;
          bVar11 = (byte)sVar12;
          bVar42 = (byte)(pbVar24[lVar37] - 0x30);
          uVar44 = (uint)(byte)(bVar11 + bVar42);
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar11,bVar42))) break;
        }
        goto LAB_145434367;
      }
      if (uVar29 == uVar34) {
        uVar44 = 0;
      }
      else {
        uVar44 = *pbVar24 - 0x30;
        if (9 < uVar44) goto LAB_145434367;
        if (uVar29 - uVar34 != 1) {
          uVar14 = pbVar24[1] - 0x30;
          if (9 < uVar14) goto LAB_145434367;
          uVar44 = CONCAT31((int3)(uVar14 >> 8),(char)uVar14 + (char)uVar44 * '\n');
        }
      }
LAB_1454342a6:
      uVar29 = puVar46[7];
      if (uVar29 == 0) goto LAB_145434367;
      pcVar26 = (char *)puVar46[6];
      if (uVar29 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145434367;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar34 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar34);
      local_90 = (ulong *)CONCAT44(local_90._4_4_,uVar44);
      if (2 < uVar29 - uVar34) {
        lVar37 = 0;
        uVar44 = 0;
        while( true ) {
          if (lVar37 == uVar29 - uVar34) goto LAB_14543437e;
          sVar12 = (ushort)(byte)uVar44 * 10;
          if ((char)((ushort)sVar12 >> 8) != '\0') break;
          bVar11 = (byte)sVar12;
          bVar42 = (byte)(pbVar24[lVar37] - 0x30);
          uVar44 = (uint)(byte)(bVar11 + bVar42);
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar11,bVar42))) break;
        }
        goto LAB_145434367;
      }
      if (uVar29 == uVar34) {
        uVar44 = 0;
      }
      else {
        uVar44 = *pbVar24 - 0x30;
        if (9 < uVar44) goto LAB_145434367;
        if (uVar29 - uVar34 != 1) {
          uVar14 = pbVar24[1] - 0x30;
          if (9 < uVar14) goto LAB_145434367;
          uVar44 = CONCAT31((int3)(uVar14 >> 8),(char)uVar14 + (char)uVar44 * '\n');
        }
      }
LAB_14543437e:
      local_100 = (ulong *)CONCAT44(local_100._4_4_,uVar44);
      if (puVar20 == (ulong *)0x4) {
        local_71 = 1;
        local_1e0 = puVar33;
        local_80 = puVar48;
        local_70 = puVar46;
        func_0x000145903b33();
        goto LAB_145434c0b;
      }
      local_248 = puVar46[8];
      puVar47 = (ulong *)puVar46[9];
      local_1e0 = puVar33;
      local_80 = puVar48;
      local_70 = puVar46;
      func_0x000140188f20();
      local_290 = CONCAT44(uStack_3b4,uStack_3b8);
      if ((char)local_3c0 != '\0') {
        local_71 = 1;
        func_0x00014590379b();
        goto LAB_145434c0b;
      }
      local_98 = (ulong *)CONCAT44(uStack_3ac,local_3b0);
      if (puVar47 != (ulong *)0x0) {
        func_0x0001457731ed();
      }
      local_280 = (ulong *)local_70[10];
      uVar29 = local_70[0xb];
      local_3f8 = puVar47;
      func_0x000140188f20();
      local_288 = (ulong *)CONCAT44(uStack_3b4,uStack_3b8);
      local_a9 = (char)local_3c0;
      if ((char)local_3c0 != '\0') {
        func_0x00014590379b();
        goto LAB_145434c0b;
      }
      puVar48 = (ulong *)CONCAT44(uStack_3ac,local_3b0);
      local_248 = uVar29;
      if (uVar29 != 0) {
        func_0x0001457731ed();
      }
      if (puVar49 == (ulong *)0x5) {
        puVar33 = (ulong *)((ulong)local_2e0 & 0xffffff0000000000 | (ulong)(uint5)*local_80);
        puVar49 = puVar33;
        if (local_1e0 != (ulong *)0x0) {
          func_0x0001400021d0();
          puVar49 = puVar33;
        }
      }
      else {
        if (local_1e0 == (ulong *)0x0) {
          local_2e0 = local_80;
        }
        else {
          puVar33 = local_80;
          puVar49 = local_80;
          if (local_1e0 == (ulong *)0xffffffffffffffff) goto LAB_14543454d;
          func_0x0001400021d0();
          local_2e0 = puVar33;
        }
        puVar33 = (ulong *)0x0;
        puVar49 = local_2e0;
      }
LAB_14543454d:
      local_2e0 = puVar49;
      puVar49 = local_3f8;
      uVar22 = SUB81(local_90,0);
      uVar28 = SUB81(local_100,0);
      puVar46 = (ulong *)0x64006400640064;
      uVar29 = local_248;
      if (7 < puVar20) {
        local_280 = puVar48;
        puVar46 = (ulong *)func_0x0001454512d0();
        uVar22 = SUB81(local_90,0);
        uVar28 = SUB81(local_100,0);
        puVar48 = local_280;
      }
      local_1d8 = local_288;
      stack0xfffffffffffffe40 = (ulong *)local_290;
      local_1b8 = local_98;
      uStack_1b0 = puVar49;
      local_1a0 = CONCAT17((char)((ulong)puVar33 >> 0x20),
                           CONCAT43((int)puVar33,CONCAT12(uVar28,CONCAT11(uVar22,bVar45))));
      local_71 = 0;
      uStack_1d0 = puVar48;
      auStack_1c8._0_8_ = uVar29;
      uStack_1a8 = puVar46;
      FUN_14543a2a0();
      uStack_320 = (undefined4)uStack_220;
      uStack_31c = uStack_220._4_4_;
      local_318 = (undefined4)local_218;
      uStack_314 = local_218._4_4_;
      uStack_310 = (undefined4)uStack_210;
      uStack_30c = uStack_210._4_4_;
      local_338 = puStack_238;
      uStack_330 = local_230;
      local_328 = local_228;
      local_308 = CONCAT71(uStack_207,local_208);
      puVar20 = local_240;
      if (local_1f8 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
      if (puVar20 != (ulong *)0xffffffffffffffff) {
        uStack_388 = local_308;
        uStack_3b8 = (undefined4)local_338;
        uStack_3b4 = local_338._4_4_;
        local_3b0 = (undefined4)uStack_330;
        uStack_3ac = uStack_330._4_4_;
        puStack_3a8 = local_328;
        local_3a0 = CONCAT44(uStack_31c,uStack_320);
        uStack_398 = CONCAT44(uStack_314,local_318);
        local_390 = CONCAT44(uStack_30c,uStack_310);
        goto LAB_145430852;
      }
LAB_145433e50:
      puVar20 = (ulong *)0xffffffffffffffff;
      if ((local_b8 & 0x100) != 0) goto LAB_145430852;
    }
    if (local_1f8 == (ulong *)0x0) goto LAB_145433e50;
    func_0x0001400021d0();
    puVar20 = (ulong *)0xffffffffffffffff;
  } while ((local_b8 & 0x100) == 0);
LAB_145430852:
  local_2c0 = 0;
  uStack_2b8 = 8;
  local_2b0 = 0;
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8 = 0xa0000000a;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uVar36 = 0x6f6c6e75;
  bVar45 = 0;
  local_3c0 = puVar20;
  while ((bVar45 & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_b8._1_1_ != '\0') break;
      local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
      puVar20 = local_f8;
      if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) break;
    }
    local_f8 = puVar20;
    auVar56 = func_0x0001400a4890();
    uStack_1d0 = auVar56._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0 = CONCAT71(local_1a0._1_7_,1);
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar56;
    func_0x0001455393f0();
    if (local_230 == (ulong *)0x3) {
      if (puStack_238[1] == 6) {
        if ((short)((int *)*puStack_238)[1] == 0x6b63 && *(int *)*puStack_238 == (int)uVar36) {
          uVar29 = puStack_238[3];
          bVar50 = true;
          if (uVar29 == 0) {
LAB_145430ba7:
            uVar29 = puStack_238[5];
          }
          else {
            pcVar26 = (char *)puStack_238[2];
            if (uVar29 == 1) {
              cVar10 = *pcVar26;
              if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145430ba7;
            }
            else {
              cVar10 = *pcVar26;
            }
            uVar34 = (ulong)(cVar10 == '+');
            pbVar24 = (byte *)(pcVar26 + uVar34);
            if (uVar29 - uVar34 < 3) {
              if (uVar29 == uVar34) {
                bVar50 = false;
                uVar29 = puStack_238[5];
              }
              else {
                if (9 < *pbVar24 - 0x30) goto LAB_145430ba7;
                if (uVar29 - uVar34 != 1) {
                  if (pbVar24[1] - 0x30 < 10) {
                    bVar50 = false;
                  }
                  goto LAB_145430c57;
                }
                bVar50 = false;
                uVar29 = puStack_238[5];
              }
            }
            else {
              lVar37 = 0;
              bVar45 = 0;
              do {
                bVar51 = lVar37 == uVar29 - uVar34;
                bVar50 = !bVar51;
                if (bVar51) break;
                if ((char)((ushort)((ushort)bVar45 * 10) >> 8) != '\0') goto LAB_145430ba7;
                bVar11 = (byte)(pbVar24[lVar37] - 0x30);
                bVar42 = (byte)((ushort)bVar45 * 10);
                bVar45 = bVar42 + bVar11;
                if (9 < pbVar24[lVar37] - 0x30) goto LAB_145430ba7;
                lVar37 = lVar37 + 1;
              } while (!CARRY1(bVar42,bVar11));
LAB_145430c57:
              uVar29 = puStack_238[5];
            }
          }
          if (uVar29 != 0) {
            pcVar26 = (char *)puStack_238[4];
            if (uVar29 == 1) {
              cVar10 = *pcVar26;
              if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145430920;
            }
            else {
              cVar10 = *pcVar26;
            }
            uVar34 = (ulong)(cVar10 == '+');
            if (uVar29 - uVar34 < 0x11) {
              if (uVar29 == uVar34) {
                uVar29 = 1;
              }
              else {
                lVar37 = 0;
                uVar18 = 0;
                do {
                  if (9 < (byte)pcVar26[lVar37 + uVar34] - 0x30) goto LAB_145430920;
                  uVar18 = (ulong)((byte)pcVar26[lVar37 + uVar34] - 0x30) + uVar18 * 10;
                  lVar37 = lVar37 + 1;
                } while (lVar37 != uVar29 + -uVar34);
LAB_145430ce9:
                uVar29 = 9;
                if (uVar18 < 9) {
                  uVar29 = uVar18;
                }
                if (uVar18 == 0) {
                  uVar29 = 1;
                }
              }
              if (!bVar50) {
                uVar29 = *(ulong *)(uVar29 * 0x10 + 0x14673d740);
                goto joined_r0x000145430db5;
              }
            }
            else {
              lVar37 = 0;
              uVar18 = 0;
              while( true ) {
                if (lVar37 == uVar29 + -uVar34) goto LAB_145430ce9;
                auVar56._8_8_ = 0;
                auVar56._0_8_ = uVar18;
                uVar17 = SUB168(auVar56 * ZEXT816(10),0);
                if (SUB168(auVar56 * ZEXT816(10),8) != 0) break;
                uVar44 = (byte)pcVar26[lVar37 + uVar34] - 0x30;
                uVar18 = uVar17 + uVar44;
                if ((9 < uVar44) || (lVar37 = lVar37 + 1, CARRY8(uVar17,(ulong)uVar44))) break;
              }
            }
          }
        }
      }
      else if (((puStack_238[1] == 4) && (*(int *)*puStack_238 == 0x6e65706f)) &&
              (uVar29 = puStack_238[3], uVar29 != 0)) {
        pcVar26 = (char *)puStack_238[2];
        if (uVar29 == 1) {
          cVar10 = *pcVar26;
          if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145430920;
        }
        else {
          cVar10 = *pcVar26;
        }
        uVar34 = (ulong)(cVar10 == '+');
        pbVar24 = (byte *)(pcVar26 + uVar34);
        if (uVar29 - uVar34 < 3) {
          if ((uVar29 == uVar34) ||
             ((*pbVar24 - 0x30 < 10 && ((uVar29 - uVar34 == 1 || (pbVar24[1] - 0x30 < 10)))))) {
LAB_145430d58:
            uVar29 = puStack_238[5];
joined_r0x000145430db5:
            if (uVar29 - 2 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x000145430dc5 */
                    /* WARNING: Treating indirect jump as call */
              puVar19 = (undefined8 *)
                        (*(code *)((long)*(int *)((uVar29 - 2) * 4 + 0x14673de80) + 0x14673de80))();
              return puVar19;
            }
          }
        }
        else {
          lVar37 = 0;
          bVar45 = 0;
          while( true ) {
            if (lVar37 == uVar29 - uVar34) goto LAB_145430d58;
            if ((char)((ushort)((ushort)bVar45 * 10) >> 8) != '\0') break;
            bVar11 = (byte)(pbVar24[lVar37] - 0x30);
            bVar42 = (byte)((ushort)bVar45 * 10);
            bVar45 = bVar42 + bVar11;
            if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar42,bVar11))) break;
          }
        }
      }
    }
LAB_145430920:
    if (local_240 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
    bVar45 = local_b8._1_1_;
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
  func_0x00014553eb30();
  uVar29 = local_340;
  if (1 < local_340) {
    puVar35 = puStack_348;
    if (local_340 < 0x15) {
      puVar27 = puStack_348 + 1;
      lVar37 = 4;
      do {
        uVar14 = puVar27[-1];
        uVar44 = *puVar27;
        lVar31 = lVar37;
        if (uVar44 < uVar14) {
          do {
            *(uint *)((long)puStack_348 + lVar31) = uVar14;
            puVar41 = puStack_348;
            if (lVar31 == 4) goto LAB_1454346b1;
            uVar14 = *(uint *)((long)puStack_348 + lVar31 + -8);
            lVar31 = lVar31 + -4;
          } while (uVar44 < uVar14);
          puVar41 = (uint *)(lVar31 + (long)puStack_348);
LAB_1454346b1:
          *puVar41 = uVar44;
        }
        puVar27 = puVar27 + 1;
        lVar37 = lVar37 + 4;
      } while (puVar27 != puStack_348 + local_340);
      if (local_340 < 2) goto LAB_145431137;
    }
    else {
      func_0x00014506f770();
    }
    lVar37 = 0;
    do {
      if (puVar35[lVar37 + 1] == puVar35[lVar37]) {
        uVar34 = lVar37 + 2;
        local_340 = lVar37 + 1;
        if (uVar34 < uVar29) {
          if (((int)uVar29 - (int)lVar37 & 1U) != 0) {
            if (puVar35[lVar37 + 2] != puVar35[lVar37]) {
              puVar35[lVar37 + 1] = puVar35[lVar37 + 2];
              local_340 = lVar37 + 2;
            }
            uVar34 = lVar37 + 3;
          }
          uVar18 = local_340;
          if (uVar29 - 3 != lVar37) goto LAB_1454349c0;
        }
        break;
      }
      lVar37 = lVar37 + 1;
    } while (uVar29 - 1 != lVar37);
  }
  goto LAB_145431137;
LAB_1454349c0:
  do {
    if (puVar35[uVar34] == puVar35[uVar18 - 1]) {
      uVar44 = puVar35[uVar34 + 1];
      local_340 = uVar18;
      if (uVar44 != puVar35[uVar18 - 1]) {
LAB_1454349e5:
        puVar35[uVar18] = uVar44;
        local_340 = uVar18 + 1;
      }
    }
    else {
      puVar35[uVar18] = puVar35[uVar34];
      local_340 = uVar18 + 1;
      uVar44 = puVar35[uVar34 + 1];
      puVar27 = puVar35 + uVar18;
      uVar18 = local_340;
      if (uVar44 != *puVar27) goto LAB_1454349e5;
    }
    uVar34 = uVar34 + 2;
    uVar18 = local_340;
  } while (uVar29 != uVar34);
LAB_145431137:
  local_260 = 0;
  lStack_258 = 4;
  local_250 = 0;
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
  uVar52 = 0;
  uVar53 = 0;
  uVar54 = 0;
  uVar55 = 0;
  do {
    while( true ) {
      func_0x00014543cad0();
      puVar20 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_1454311de;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar20 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_1454311de;
      }
      local_f8 = puVar20;
      auVar56 = func_0x0001400a4890();
      uStack_1d0 = auVar56._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar56;
      func_0x0001455393f0();
      if (local_230 != (ulong *)0x3) break;
      uVar29 = puStack_238[1];
      if (uVar29 != 5) {
        if ((uVar29 == 4) && (piVar32 = (int *)*puStack_238, *piVar32 == 0x6b6f6f6c))
        goto LAB_145431b89;
        break;
      }
      piVar32 = (int *)*puStack_238;
      if ((char)piVar32[1] != 'p' || *piVar32 != 0x69757165) break;
LAB_145431b89:
      uVar34 = puStack_238[3];
      if (uVar34 == 0) break;
      pcVar26 = (char *)puStack_238[2];
      if (uVar34 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) break;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar18 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar18);
      if (2 < uVar34 - uVar18) {
        lVar37 = 0;
        uVar44 = 0;
        while( true ) {
          if (lVar37 == uVar34 - uVar18) goto LAB_145431bf4;
          sVar12 = (ushort)(byte)uVar44 * 10;
          if ((char)((ushort)sVar12 >> 8) != '\0') break;
          bVar45 = (byte)sVar12;
          bVar11 = (byte)(pbVar24[lVar37] - 0x30);
          uVar44 = (uint)(byte)(bVar45 + bVar11);
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar45,bVar11))) break;
        }
        break;
      }
      if (uVar34 == uVar18) {
        local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
      }
      else {
        uVar44 = *pbVar24 - 0x30;
        if (9 < uVar44) break;
        if (uVar34 - uVar18 == 1) {
LAB_145431bf4:
          local_80 = (ulong *)CONCAT44(local_80._4_4_,uVar44);
        }
        else {
          uVar14 = pbVar24[1] - 0x30;
          if (9 < uVar14) break;
          local_80 = (ulong *)CONCAT44(local_80._4_4_,
                                       CONCAT31((int3)(uVar14 >> 8),
                                                (char)uVar14 + (char)uVar44 * '\n'));
        }
      }
      auStack_1c8._0_8_ = puStack_238[4];
      local_98 = puStack_238;
      uStack_1d0 = (ulong *)puStack_238[5];
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x2c0000002c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      unique0x10004e90 = uStack_1d0;
      uStack_1b0 = uStack_1d0;
      func_0x00014553bf60();
      local_90 = local_430;
      local_70 = local_428;
      lVar31 = local_250 * 0xe8;
      cVar10 = (char)local_80;
      lVar37 = local_420;
      if (local_250 != 0) {
        lVar38 = 0;
        uVar34 = 0;
        do {
          if (*(char *)(lStack_258 + 0xe4 + lVar38) == cVar10) goto joined_r0x000145431ec3;
          uVar34 = uVar34 + 1;
          lVar38 = lVar38 + 0xe8;
        } while (lVar31 - lVar38 != 0);
      }
      uStack_190 = CONCAT44(uVar55,uVar54);
      local_1a0 = CONCAT44(uVar54,uVar53);
      bStack_198 = (byte)uVar55;
      bStack_197 = (byte)((uint)uVar55 >> 8);
      uStack_196 = (undefined2)((uint)uVar55 >> 0x10);
      uStack_1b0 = (ulong *)CONCAT44(uVar54,uVar53);
      uStack_1a8 = (ulong *)CONCAT44(uVar52,uVar55);
      stack0xfffffffffffffe40 = (ulong *)CONCAT44(uVar54,uVar53);
      local_1b8 = (ulong *)CONCAT44(uVar52,uVar55);
      local_1d8 = (ulong *)CONCAT44(uVar52,(int)local_1d8);
      uStack_1d0 = (ulong *)CONCAT44(uVar54,uVar53);
      auStack_1c8._4_4_ = uVar52;
      auStack_1c8._0_4_ = uVar55;
      uStack_194 = uVar53;
      if (local_250 == local_260) {
        local_81 = 1;
        func_0x0001458e9b70();
        cVar10 = (char)local_80;
      }
      *(undefined4 *)(lStack_258 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 8 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x10 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x18 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x20 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x28 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x30 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x38 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x40 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x48 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x50 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x58 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x60 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x68 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x70 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x78 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x80 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x88 + lVar31) = 0;
      *(undefined4 *)(lStack_258 + 0x90 + lVar31) = 0;
      puVar19 = (undefined8 *)(lStack_258 + 0xd4 + lVar31);
      *puVar19 = CONCAT44(uStack_194,CONCAT22(uStack_196,CONCAT11(bStack_197,bStack_198)));
      puVar19[1] = uStack_190;
      puVar19 = (undefined8 *)(lStack_258 + 0xc4 + lVar31);
      *puVar19 = uStack_1a8;
      puVar19[1] = local_1a0;
      puVar19 = (undefined8 *)(lStack_258 + 0xb4 + lVar31);
      *puVar19 = local_1b8;
      puVar19[1] = uStack_1b0;
      puVar20 = (ulong *)(lStack_258 + 0xa4 + lVar31);
      *puVar20 = auStack_1c8._0_8_;
      puVar20[1] = (ulong)stack0xfffffffffffffe40;
      puVar1 = (undefined4 *)(lStack_258 + 0x94 + lVar31);
      *puVar1 = (int)local_1d8;
      puVar1[1] = local_1d8._4_4_;
      puVar1[2] = (undefined4)uStack_1d0;
      puVar1[3] = uStack_1d0._4_4_;
      *(char *)(lStack_258 + 0xe4 + lVar31) = cVar10;
      uVar34 = local_250;
      local_250 = local_250 + 1;
joined_r0x000145431ec3:
      if (lVar37 != 0) {
        puVar48 = local_70 + lVar37 * 2;
        puVar20 = local_70;
        if (uVar29 == 5) {
          do {
            while( true ) {
              uVar29 = *puVar20;
              uVar18 = puVar20[1];
              if ((char)piVar32[1] == 'p' && *piVar32 == 0x69757165) break;
              if (local_250 <= uVar34) goto LAB_145434a72;
              if (0x12 < uVar29) goto LAB_145434a87;
              lVar37 = uVar34 * 0xe8 + lStack_258;
              *(undefined4 *)(lVar37 + uVar29 * 8) = 1;
              *(int *)(lVar37 + 4 + uVar29 * 8) = (int)uVar18;
              puVar20 = puVar20 + 2;
              if (puVar20 == puVar48) goto LAB_145431fd4;
            }
            if (local_250 <= uVar34) {
              func_0x000145903b33();
              goto LAB_145434c0b;
            }
            if (0x12 < uVar29) {
              func_0x000145903b33();
              goto LAB_145434c0b;
            }
            *(int *)(uVar34 * 0xe8 + lStack_258 + 0x98 + uVar29 * 4) = (int)uVar18;
            puVar20 = puVar20 + 2;
          } while (puVar20 != puVar48);
        }
        else {
          do {
            if (local_250 <= uVar34) goto LAB_145434a72;
            uVar29 = *puVar20;
            if (0x12 < uVar29) goto LAB_145434a87;
            uVar18 = puVar20[1];
            lVar37 = uVar34 * 0xe8 + lStack_258;
            *(undefined4 *)(lVar37 + uVar29 * 8) = 1;
            *(int *)(lVar37 + 4 + uVar29 * 8) = (int)uVar18;
            puVar20 = puVar20 + 2;
          } while (puVar20 != puVar48);
        }
      }
LAB_145431fd4:
      if (local_90 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
      if (local_240 != (ulong *)0x0) goto LAB_145431c50;
LAB_145431a00:
      if ((local_b8 & 0x100) != 0) goto LAB_1454311de;
    }
    if (local_240 == (ulong *)0x0) goto LAB_145431a00;
LAB_145431c50:
    func_0x0001400021d0();
  } while ((local_b8 & 0x100) == 0);
LAB_1454311de:
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
  func_0x00014553b3b0();
  local_2a8 = 0;
  lStack_2a0 = 8;
  local_298 = 0;
  local_240 = (ulong *)0x0;
  puStack_238 = local_a0;
  local_230 = local_a8;
  local_228 = local_a0;
  uStack_220 = 0;
  local_218 = local_a0;
  uStack_210 = 0xa0000000a;
  local_208 = 1;
  local_200 = 0;
  uVar52 = 0;
  uVar53 = 0;
  uVar54 = 0;
  uVar55 = 0;
  local_200._1_1_ = 0;
  while ((local_200._1_1_ & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_200._1_1_ != '\0') break;
      local_200 = CONCAT11(1,(byte)local_200);
      puVar20 = local_240;
      if ((puStack_238 != local_240 | (byte)local_200) != 1) break;
    }
    local_240 = puVar20;
    auVar56 = func_0x0001400a4890();
    uStack_1d0 = auVar56._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0 = CONCAT71(local_1a0._1_7_,1);
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar56;
    func_0x0001455393f0();
    local_70 = puStack_1f0;
    if (((2 < local_1e8) && (puStack_1f0[1] == 4)) && (*(int *)*puStack_1f0 == 0x63657073)) {
      uVar29 = puStack_1f0[3];
      if (uVar29 == 0) {
        uVar34 = 0;
        bVar50 = true;
      }
      else {
        pcVar26 = (char *)puStack_1f0[2];
        if (uVar29 == 1) {
          cVar10 = *pcVar26;
          uVar34 = 1;
          bVar50 = true;
          if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_14543155f;
        }
        else {
          cVar10 = *pcVar26;
        }
        uVar18 = (ulong)(cVar10 == '+');
        pbVar24 = (byte *)(pcVar26 + uVar18);
        if (uVar29 - uVar18 < 3) {
          if (uVar29 == uVar18) {
            uVar34 = 0;
            bVar50 = false;
          }
          else {
            uVar44 = *pbVar24 - 0x30;
            uVar34 = 1;
            bVar50 = true;
            if (uVar44 < 10) {
              if (uVar29 - uVar18 == 1) {
                bVar50 = false;
                uVar34 = (ulong)uVar44;
              }
              else {
                uVar34 = 1;
                bVar50 = true;
                if (pbVar24[1] - 0x30 < 10) {
                  bVar50 = false;
                  uVar34 = (ulong)(byte)((char)(pbVar24[1] - 0x30) + (char)uVar44 * '\n');
                }
              }
            }
          }
        }
        else {
          lVar37 = 0;
          uVar34 = 0;
          do {
            bVar51 = lVar37 == uVar29 - uVar18;
            bVar50 = !bVar51;
            if (bVar51) goto LAB_14543155f;
            sVar12 = (ushort)(byte)uVar34 * 10;
            if ((char)((ushort)sVar12 >> 8) != '\0') {
              uVar34 = (ulong)(byte)(((byte)(pbVar24[lVar37] - 0x30) < 10) + 1);
              bVar50 = true;
              goto LAB_14543155f;
            }
            uVar44 = pbVar24[lVar37] - 0x30;
            if (9 < uVar44) {
              uVar34 = 1;
              goto LAB_14543155f;
            }
            lVar37 = lVar37 + 1;
            bVar45 = (byte)uVar44;
            bVar11 = (byte)sVar12;
            uVar34 = (ulong)(byte)(bVar11 + bVar45);
          } while (!CARRY1(bVar11,bVar45));
          uVar34 = 2;
        }
      }
LAB_14543155f:
      uVar29 = puStack_1f0[5];
      if (uVar29 != 0) {
        pcVar26 = (char *)puStack_1f0[4];
        if (uVar29 == 1) {
          cVar10 = *pcVar26;
          if ((cVar10 == '+') || (cVar10 == '-')) goto joined_r0x00014543130a;
        }
        else {
          cVar10 = *pcVar26;
        }
        uVar18 = (ulong)(cVar10 == '+');
        pbVar24 = (byte *)(pcVar26 + uVar18);
        cVar10 = (char)uVar34;
        if (uVar29 - uVar18 < 3) {
          if (uVar29 == uVar18) {
            if (!bVar50) {
              uVar44 = 0;
LAB_14543166d:
              lVar37 = 0;
              do {
                if (local_370 << 5 == lVar37) {
                  local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
                  goto LAB_14543172f;
                }
                lVar31 = lVar37 + 0x20;
                pcVar26 = (char *)(lStack_378 + 4 + lVar37);
                lVar37 = lVar31;
              } while (*pcVar26 != cVar10);
              uVar14 = *(uint *)(lStack_378 + -0x20 + lVar31);
              local_80 = (ulong *)((ulong)local_80._4_4_ << 0x20);
              uVar23 = 0x6e;
              do {
                uVar15 = uVar14 - (uVar23 - 0x1e);
                if (uVar14 < uVar23 - 0x1e) goto LAB_14543172f;
                uVar16 = uVar15 - (uVar23 - 0xf);
                if (uVar15 < uVar23 - 0xf) {
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)local_80 + 1);
                  goto LAB_14543172f;
                }
                uVar14 = uVar16 - uVar23;
                if (uVar16 < uVar23) {
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)local_80 + 2);
                  goto LAB_14543172f;
                }
                local_80._0_4_ = (int)local_80 + 3;
                uVar23 = uVar23 + 0x2d;
              } while ((int)local_80 != 0x33);
              local_80 = (ulong *)CONCAT44(local_80._4_4_,0x33);
LAB_14543172f:
              local_f8 = (ulong *)0x0;
              uStack_f0 = (ulong *)&DAT_00000008;
              local_e8 = (ulong *)CONCAT44(uVar53,uVar52);
              uStack_e0 = (ulong *)CONCAT44(uVar55,uVar54);
              local_d8 = (ulong *)&DAT_00000008;
              uStack_d0 = (ulong *)CONCAT44(uVar53,uVar52);
              uStack_c0 = 8;
              local_b8 = 0;
              puVar20 = puStack_1f0 + 6;
              puVar48 = puStack_1f0 + (long)local_1e8 * 2;
              lVar37 = 3;
              local_90 = (ulong *)CONCAT44(local_90._4_4_,uVar44);
              uVar29 = 0;
              local_368 = cVar10;
              uStack_c8._0_4_ = uVar54;
              uStack_c8._4_4_ = uVar55;
              while( true ) {
                uVar22 = (undefined1)uVar34;
                bVar50 = lVar37 == 0;
                lVar37 = lVar37 + -1;
                if ((bVar50) || (puVar20 == puVar48)) break;
                unique0x00023d00 = (ulong *)*puVar20;
                auStack_1c8._0_8_ = puVar20[1];
                local_1d8 = (ulong *)&local_2f8;
                uStack_1d0 = (ulong *)0x0;
                uStack_1b0 = (ulong *)0x0;
                local_1a0 = 0x2c0000002c;
                bStack_198 = 1;
                uStack_190 = CONCAT62(uStack_190._2_6_,1);
                local_72 = 1;
                local_2f8 = uVar22;
                local_1b8 = (ulong *)auStack_1c8._0_8_;
                uStack_1a8 = (ulong *)auStack_1c8._0_8_;
                func_0x000145539f60();
                local_72 = 1;
                func_0x000145483fc0();
                if (2 < uVar29) {
                  func_0x000145903b33();
                  goto LAB_145434c0b;
                }
                if ((&local_f8)[uVar29 * 3] != 0) {
                  func_0x0001400021d0();
                }
                puVar20 = puVar20 + 2;
                (&local_e8)[uVar29 * 3] = auStack_1c8._0_8_;
                *(int *)(local_418 + uVar29 * 3 + 100) = (int)local_1d8;
                *(undefined4 *)((long)&local_f8 + uVar29 * 0x18 + 4) = local_1d8._4_4_;
                *(undefined4 *)(&uStack_f0 + uVar29 * 3) = (undefined4)uStack_1d0;
                *(undefined4 *)((long)&uStack_f0 + uVar29 * 0x18 + 4) = uStack_1d0._4_4_;
                uVar29 = uVar29 + 1;
              }
              local_72 = 1;
              func_0x000145532510();
              uStack_190 = local_b8;
              local_1a0 = CONCAT44(uStack_c8._4_4_,(undefined4)uStack_c8);
              bStack_198 = (byte)uStack_c0;
              bStack_197 = (byte)((ulong)uStack_c0 >> 8);
              uStack_196 = (undefined2)((ulong)uStack_c0 >> 0x10);
              uStack_194 = uStack_c0._4_4_;
              uStack_1b0 = local_d8;
              uStack_1a8 = uStack_d0;
              unique0x1000293b = local_e8;
              local_1b8 = uStack_e0;
              uStack_1d0 = local_f8;
              auStack_1c8._0_8_ = uStack_f0;
              local_1d8._0_2_ = CONCAT11((char)local_90,uVar22);
              if (local_298 == local_2a8) {
                func_0x000145780650();
              }
              lVar37 = local_298 * 0x50;
              puVar19 = (undefined8 *)(lStack_2a0 + 0x40 + lVar37);
              *puVar19 = CONCAT44(uStack_194,CONCAT22(uStack_196,CONCAT11(bStack_197,bStack_198)));
              puVar19[1] = uStack_190;
              puVar19 = (undefined8 *)(lStack_2a0 + 0x30 + lVar37);
              *puVar19 = uStack_1a8;
              puVar19[1] = local_1a0;
              puVar19 = (undefined8 *)(lStack_2a0 + 0x20 + lVar37);
              *puVar19 = local_1b8;
              puVar19[1] = uStack_1b0;
              puVar19 = (undefined8 *)(lStack_2a0 + 0x10 + lVar37);
              *puVar19 = auStack_1c8._0_8_;
              puVar19[1] = stack0xfffffffffffffe40;
              puVar1 = (undefined4 *)(lStack_2a0 + lVar37);
              *puVar1 = (int)local_1d8;
              puVar1[1] = local_1d8._4_4_;
              puVar1[2] = (undefined4)uStack_1d0;
              puVar1[3] = uStack_1d0._4_4_;
              local_298 = local_298 + 1;
            }
          }
          else {
            uVar44 = *pbVar24 - 0x30;
            if (uVar44 < 10) {
              if (uVar29 - uVar18 != 1) {
                uVar14 = pbVar24[1] - 0x30;
                if (9 < uVar14) goto joined_r0x00014543130a;
                uVar44 = CONCAT31((int3)(uVar14 >> 8),(char)uVar14 + (char)uVar44 * '\n');
              }
LAB_1454315f5:
              if ((!bVar50) && (local_368 = cVar10, (byte)uVar44 < 3)) goto LAB_14543166d;
            }
          }
        }
        else {
          lVar37 = 0;
          uVar44 = 0;
          while( true ) {
            if (lVar37 == uVar29 - uVar18) goto LAB_1454315f5;
            sVar12 = (ushort)(byte)uVar44 * 10;
            if ((char)((ushort)sVar12 >> 8) != '\0') break;
            bVar45 = (byte)(pbVar24[lVar37] - 0x30);
            bVar11 = (byte)sVar12;
            uVar44 = (uint)(byte)(bVar11 + bVar45);
            if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar11,bVar45))) break;
          }
        }
      }
    }
joined_r0x00014543130a:
    if (local_1f8 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
  }
  local_278 = 0;
  puStack_270 = (ulong *)&DAT_00000008;
  local_268 = 0;
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
LAB_1454320d7:
  if ((bStack_197 & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = local_e8;
    if (((int)local_f8 == 1) ||
       ((bStack_197 == 0 &&
        (bStack_197 = 1, puVar20 = local_1d8, (uStack_1d0 != local_1d8 | bStack_198) == 1)))) {
      local_1d8 = puVar20;
      auVar56 = func_0x0001400a4890();
      piVar32 = auVar56._0_8_;
      if ((4 < auVar56._8_8_) && ((char)piVar32[1] == '|' && *piVar32 == 0x6e656573)) {
        puVar49 = (ulong *)(auVar56._8_8_ - 5);
        lVar37 = (long)piVar32 + 5;
        local_90 = (ulong *)((long)piVar32 + 6);
        local_70 = (ulong *)0x0;
        puVar33 = (ulong *)0x0;
        puVar20 = (ulong *)0x0;
        puVar48 = local_90;
LAB_145432200:
        local_80 = puVar20;
        if (((ulong)local_70 & 1) == 0) {
          local_70 = (ulong *)CONCAT71((int7)((ulong)puVar48 >> 8),1);
          puVar48 = puVar33;
          do {
            puVar33 = puVar48;
            puVar46 = puVar49;
            local_80 = puVar20;
            if (puVar49 < puVar48) goto LAB_1454322e6;
            puVar33 = puVar49;
            if ((ulong)((long)puVar49 - (long)puVar48) < 0x10) {
              uVar29 = 0;
              if (puVar49 == puVar48) goto LAB_1454322e6;
              while (*(char *)((long)puVar48 + uVar29 + lVar37) != ',') {
                uVar29 = uVar29 + 1;
                if ((long)puVar49 - (long)puVar48 == uVar29) goto LAB_1454322e6;
              }
            }
            else {
              auVar56 = func_0x0001457311c0();
              uVar29 = auVar56._8_8_;
              puVar20 = local_80;
              if (auVar56._0_8_ != 1) goto LAB_1454322e6;
            }
            puVar33 = (ulong *)((long)puVar48 + uVar29 + 1);
            puVar46 = (ulong *)(uVar29 + (long)puVar48);
            puVar20 = local_80;
            puVar48 = puVar33;
          } while ((puVar49 <= puVar46) || (*(char *)(lVar37 + (long)puVar46) != ','));
          local_70 = (ulong *)0x0;
          puVar20 = puVar33;
LAB_1454322e6:
          puVar46 = (ulong *)((long)puVar46 - (long)local_80);
          puVar30 = (undefined1 *)(lVar37 + (long)local_80);
          puVar47 = (ulong *)0x0;
          do {
            if ((ulong)((long)puVar46 - (long)puVar47) < 0x10) {
              uVar29 = 0;
              if (puVar46 == puVar47) {
LAB_145432341:
                puVar48 = (ulong *)0x0;
                break;
              }
              while (*(char *)((long)puVar47 + (long)(puVar30 + uVar29)) != '=') {
                uVar29 = uVar29 + 1;
                if ((long)puVar46 - (long)puVar47 == uVar29) goto LAB_145432341;
              }
              auVar57._8_8_ = 0;
              auVar57._0_8_ = uVar29;
              auVar57 = auVar57 << 0x40;
            }
            else {
              auVar57 = func_0x0001457311c0();
              puVar48 = auVar57._0_8_;
              if (puVar48 != (ulong *)0x1) break;
            }
            lVar31 = auVar57._8_8_;
            puVar48 = auVar57._0_8_;
            puVar25 = (ulong *)((long)puVar47 + lVar31 + 1);
            puVar2 = (ulong *)(lVar31 + (long)puVar47);
            if ((puVar2 < puVar46) && (puVar30[(long)puVar2] == '=')) {
              uVar29 = (long)puVar46 - (long)puVar25;
              if (uVar29 == 0) break;
              pcVar26 = (char *)((long)puVar25 + (long)puVar30);
              if (uVar29 == 1) {
                cVar10 = *pcVar26;
                puVar48 = (ulong *)0x0;
                if ((cVar10 == '+') || (cVar10 == '-')) break;
              }
              else {
                cVar10 = *pcVar26;
              }
              uVar34 = (ulong)(cVar10 == '+');
              if (2 < uVar29 - uVar34) {
                puVar30 = (undefined1 *)(lVar31 + (long)puVar47);
                puVar48 = (ulong *)0x0;
                goto LAB_14543242f;
              }
              if (uVar29 == uVar34) {
                puVar48 = (ulong *)0x0;
                goto LAB_145432469;
              }
              uVar44 = (byte)pcVar26[uVar34] - 0x30;
              puVar48 = (ulong *)(ulong)uVar44;
              if (uVar44 < 10) {
                if (uVar29 - uVar34 == 1) goto LAB_145432469;
                uVar14 = (byte)pcVar26[uVar34 + 1] - 0x30;
                if (uVar14 < 10) {
                  puVar48 = (ulong *)(ulong)CONCAT31((int3)(uVar14 >> 8),
                                                     (char)uVar14 + (char)uVar44 * '\n');
                  goto LAB_145432469;
                }
              }
              break;
            }
            puVar47 = puVar25;
          } while (puVar25 <= puVar46);
          goto LAB_145432200;
        }
      }
      goto LAB_1454320d7;
    }
  }
  if (1 < local_268) {
    if (local_268 < 0x15) {
      lVar37 = local_268 << 5;
      lVar31 = 0x20;
      do {
        func_0x0001455032b0();
        lVar31 = lVar31 + 0x20;
      } while (lVar37 != lVar31);
    }
    else {
      func_0x0001454811a0();
    }
  }
  func_0x000145532000();
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
  func_0x000145535b90();
  if (1 < local_3c8) {
    if (local_3c8 < 0x15) {
      func_0x000140ad0670();
    }
    else {
      func_0x000145637520();
    }
  }
  func_0x000145531250();
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
  func_0x000145539cc0();
  if (1 < local_3e0) {
    if (local_3e0 < 0x15) {
      lVar37 = local_3e0 << 5;
      lVar31 = 0x20;
      do {
        func_0x0001455033c0();
        lVar31 = lVar31 + 0x20;
      } while (lVar37 != lVar31);
    }
    else {
      func_0x000145481340();
    }
  }
  func_0x000145532140();
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
LAB_145432717:
  if ((bStack_197 & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = local_e8;
    if (((int)local_f8 == 1) ||
       ((bStack_197 == 0 &&
        (bStack_197 = 1, puVar20 = local_1d8, (uStack_1d0 != local_1d8 | bStack_198) == 1)))) {
      local_1d8 = puVar20;
      auVar56 = func_0x0001400a4890();
      piVar32 = auVar56._0_8_;
      if ((4 < auVar56._8_8_) && ((char)piVar32[1] == '|' && *piVar32 == 0x74617473)) {
        puVar48 = (ulong *)(auVar56._8_8_ - 5);
        lVar37 = (long)piVar32 + 5;
        local_90 = (ulong *)((long)piVar32 + 6);
        auVar58._8_8_ = 0;
        auVar58._0_8_ = local_90;
        local_80 = (ulong *)0x0;
        puVar20 = (ulong *)0x0;
        local_70 = (ulong *)((ulong)local_70 & 0xffffffff00000000);
LAB_145432840:
        puVar33 = local_80;
        if (((ulong)local_70 & 1) == 0) {
          local_70 = (ulong *)CONCAT44(local_70._4_4_,(int)CONCAT71(auVar58._1_7_,1));
          lVar31 = lVar37;
          puVar49 = puVar20;
          do {
            puVar46 = puVar48;
            puVar20 = puVar49;
            puVar47 = puVar33;
            if (puVar48 < puVar49) goto LAB_145432928;
            puVar20 = puVar48;
            if ((ulong)((long)puVar48 - (long)puVar49) < 0x10) {
              uVar29 = 0;
              if (puVar48 == puVar49) goto LAB_145432928;
              while (*(char *)((long)puVar49 + uVar29 + lVar31) != ',') {
                uVar29 = uVar29 + 1;
                if ((long)puVar48 - (long)puVar49 == uVar29) goto LAB_145432928;
              }
            }
            else {
              auVar56 = func_0x0001457311c0();
              uVar29 = auVar56._8_8_;
              if (auVar56._0_8_ != 1) goto LAB_145432928;
            }
            puVar20 = (ulong *)((long)puVar49 + uVar29 + 1);
            puVar46 = (ulong *)(uVar29 + (long)puVar49);
            puVar49 = puVar20;
          } while ((puVar48 <= puVar46) || (*(char *)(lVar31 + (long)puVar46) != ','));
          local_70 = (ulong *)((ulong)local_70 & 0xffffffff00000000);
          puVar47 = puVar20;
LAB_145432928:
          local_80 = puVar47;
          uVar34 = (long)puVar46 - (long)puVar33;
          lVar37 = lVar31;
          uVar29 = 0;
          do {
            uVar18 = uVar34 - uVar29;
            if (uVar18 < 0x10) {
              uVar17 = 0;
              uVar21 = uVar17;
              if (uVar18 == 0) {
LAB_145432981:
                auVar9._8_8_ = 0;
                auVar9._0_8_ = uVar21;
                auVar58 = auVar9 << 0x40;
                break;
              }
              while (*(char *)((long)puVar33 + uVar17 + uVar29 + lVar31) != '=') {
                uVar17 = uVar17 + 1;
                uVar21 = uVar18;
                if (uVar18 == uVar17) goto LAB_145432981;
              }
            }
            else {
              auVar58 = func_0x0001457311c0();
              uVar17 = auVar58._8_8_;
              if (auVar58._0_8_ != 1) break;
            }
            uVar21 = uVar17 + uVar29 + 1;
            auVar8._8_8_ = uVar17;
            auVar8._0_8_ = uVar21;
            auVar6._8_8_ = uVar17;
            auVar6._0_8_ = uVar21;
            auVar5._8_8_ = uVar17;
            auVar5._0_8_ = uVar21;
            auVar58._8_8_ = uVar17;
            auVar58._0_8_ = uVar21;
            uVar18 = uVar17 + uVar29;
            if ((uVar18 < uVar34) && (*(char *)((long)puVar33 + uVar18 + lVar31) == '=')) {
              if (uVar18 - 4 < 6) {
                    /* WARNING: Could not emulate address calculation at 0x0001454329e5 */
                    /* WARNING: Treating indirect jump as call */
                puVar19 = (undefined8 *)
                          (*(code *)((long)*(int *)((uVar18 - 4) * 4 + 0x14673de9c) + 0x14673de9c))
                                    ();
                return puVar19;
              }
              uVar39 = uVar34 - uVar21;
              if (uVar39 == 0) break;
              if (uVar39 == 1) {
                cVar10 = *(char *)((long)puVar33 + uVar21 + lVar31);
                auVar58 = auVar5;
                if ((cVar10 == '+') || (auVar58 = auVar6, cVar10 == '-')) break;
              }
              else {
                cVar10 = *(char *)((long)puVar33 + uVar21 + lVar31);
              }
              uVar21 = (ulong)(cVar10 == '+');
              if (0x10 < uVar39 - uVar21) {
                uVar29 = 0;
                goto LAB_145432b7c;
              }
              if (uVar39 == uVar21) {
                uVar29 = 0;
                goto LAB_145432bb7;
              }
              uVar17 = uVar17 + uVar29;
              uVar29 = 0;
              goto LAB_145432b40;
            }
            uVar29 = uVar21;
            auVar58 = auVar8;
          } while (uVar21 <= uVar34);
          goto LAB_145432840;
        }
      }
      goto LAB_145432717;
    }
  }
  local_2d8 = 0;
  lStack_2d0 = 8;
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
      func_0x00014543cad0();
      puVar20 = (ulong *)auStack_1c8._0_8_;
      if ((int)local_1d8 != 1) {
        if (local_b8._1_1_ != '\0') goto LAB_145432c84;
        local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
        puVar20 = local_f8;
        if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) goto LAB_145432c84;
      }
      local_f8 = puVar20;
      auVar56 = func_0x0001400a4890();
      uStack_1d0 = auVar56._8_8_;
      local_1d8 = (ulong *)0x0;
      local_1b8 = (ulong *)0x0;
      uStack_1a8 = (ulong *)0x7c0000007c;
      local_1a0 = CONCAT71(local_1a0._1_7_,1);
      bStack_198 = 1;
      bStack_197 = 0;
      uStack_1b0 = uStack_1d0;
      _auStack_1c8 = auVar56;
      func_0x0001455393f0();
      if ((((local_230 != (ulong *)0x3) || (puStack_238[1] != 4)) ||
          (*(int *)*puStack_238 != 0x74616562)) || (uVar29 = puStack_238[3], uVar29 == 0)) break;
      pcVar26 = (char *)puStack_238[2];
      if (uVar29 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) break;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar34 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar34);
      if (2 < uVar29 - uVar34) {
        lVar37 = 0;
        uVar44 = 0;
        while( true ) {
          if (lVar37 == uVar29 - uVar34) goto LAB_1454330a5;
          sVar12 = (ushort)(byte)uVar44 * 10;
          if ((char)((ushort)sVar12 >> 8) != '\0') break;
          bVar45 = (byte)sVar12;
          bVar11 = (byte)(pbVar24[lVar37] - 0x30);
          uVar44 = (uint)(byte)(bVar45 + bVar11);
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar45,bVar11))) break;
        }
        break;
      }
      if (uVar29 == uVar34) {
        uVar44 = 0;
      }
      else {
        uVar44 = *pbVar24 - 0x30;
        if (9 < uVar44) break;
        if (uVar29 - uVar34 != 1) {
          if (9 < pbVar24[1] - 0x30) break;
          uVar44 = (uint)(byte)((char)(pbVar24[1] - 0x30) + (char)uVar44 * '\n');
        }
      }
LAB_1454330a5:
      local_338 = (ulong *)CONCAT71(local_338._1_7_,(char)uVar44);
      unique0x00023d00 = (ulong *)puStack_238[4];
      local_70 = puStack_238;
      auStack_1c8._0_8_ = puStack_238[5];
      uStack_1d0 = (ulong *)0x0;
      uStack_1b0 = (ulong *)0x0;
      local_1a0 = 0x2c0000002c;
      bStack_198 = 1;
      uStack_190 = CONCAT62(uStack_190._2_6_,1);
      local_1d8 = &local_338;
      local_1b8 = (ulong *)auStack_1c8._0_8_;
      uStack_1a8 = (ulong *)auStack_1c8._0_8_;
      func_0x000145532960();
      if (local_240 == (ulong *)0x0) goto LAB_145432e60;
LAB_145432fc0:
      func_0x0001400021d0();
      if ((local_b8 & 0x100) != 0) goto LAB_145432c84;
    }
    if (local_240 != (ulong *)0x0) goto LAB_145432fc0;
LAB_145432e60:
  } while ((local_b8 & 0x100) == 0);
LAB_145432c84:
  uVar29 = local_2c8;
  if (1 < local_2c8) {
    if (local_2c8 < 0x15) {
      func_0x0001455075b0();
    }
    else {
      func_0x000145502d30();
    }
    uVar29 = local_2c8;
    if (1 < local_2c8) {
      uVar34 = 1;
      lVar37 = 0x20;
      do {
        if ((*(char *)(lStack_2d0 + -0x10 + lVar37) == *(char *)(lStack_2d0 + -0x20 + lVar37)) &&
           (*(long *)(lStack_2d0 + -8 + lVar37) == *(long *)(lStack_2d0 + -0x18 + lVar37))) {
          uVar29 = uVar34;
          if (uVar34 + 1 < local_2c8) {
            do {
              lVar31 = uVar34 * 0x10;
              if ((*(char *)(lStack_2d0 + lVar37) != *(char *)(lStack_2d0 + -0x10 + lVar31)) ||
                 (*(long *)(lStack_2d0 + 8 + lVar37) != *(long *)(lStack_2d0 + -8 + lVar31))) {
                puVar1 = (undefined4 *)(lStack_2d0 + lVar37);
                puVar40 = (undefined4 *)(lVar31 + lStack_2d0);
                uVar52 = puVar1[1];
                uVar53 = puVar1[2];
                uVar54 = puVar1[3];
                *puVar40 = *puVar1;
                puVar40[1] = uVar52;
                puVar40[2] = uVar53;
                puVar40[3] = uVar54;
                uVar34 = uVar34 + 1;
              }
              lVar37 = lVar37 + 0x10;
              uVar29 = uVar34;
            } while (local_2c8 << 4 != lVar37);
          }
          break;
        }
        uVar34 = uVar34 + 1;
        lVar37 = lVar37 + 0x10;
      } while (local_2c8 != uVar34);
    }
  }
  local_2c8 = uVar29;
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
  func_0x000145539a20();
  if (1 < local_358) {
    if (local_358 < 0x15) {
      lVar37 = local_358 << 5;
      lVar31 = 0x20;
      do {
        func_0x0001455032b0();
        lVar31 = lVar31 + 0x20;
      } while (lVar37 != lVar31);
    }
    else {
      func_0x0001454811a0();
    }
  }
  func_0x000145532140();
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
  func_0x00014553e990();
  uVar29 = local_2e8;
  if (1 < local_2e8) {
    puVar35 = puStack_2f0;
    if (local_2e8 < 0x15) {
      puVar27 = puStack_2f0 + 1;
      lVar37 = 4;
      do {
        uVar14 = puVar27[-1];
        uVar44 = *puVar27;
        lVar31 = lVar37;
        if (uVar44 < uVar14) {
          do {
            *(uint *)((long)puStack_2f0 + lVar31) = uVar14;
            puVar41 = puStack_2f0;
            if (lVar31 == 4) goto LAB_1454348c9;
            uVar14 = *(uint *)((long)puStack_2f0 + lVar31 + -8);
            lVar31 = lVar31 + -4;
          } while (uVar44 < uVar14);
          puVar41 = (uint *)(lVar31 + (long)puStack_2f0);
LAB_1454348c9:
          *puVar41 = uVar44;
        }
        puVar27 = puVar27 + 1;
        lVar37 = lVar37 + 4;
      } while (puVar27 != puStack_2f0 + local_2e8);
      if (local_2e8 < 2) goto LAB_145432dd6;
    }
    else {
      func_0x00014506f770();
    }
    lVar37 = 0;
    do {
      if (puVar35[lVar37 + 1] == puVar35[lVar37]) {
        uVar34 = lVar37 + 2;
        local_2e8 = lVar37 + 1;
        if (uVar34 < uVar29) {
          if (((int)uVar29 - (int)lVar37 & 1U) != 0) {
            if (puVar35[lVar37 + 2] != puVar35[lVar37]) {
              puVar35[lVar37 + 1] = puVar35[lVar37 + 2];
              local_2e8 = lVar37 + 2;
            }
            uVar34 = lVar37 + 3;
          }
          uVar18 = local_2e8;
          if (uVar29 - 3 != lVar37) goto LAB_145434a39;
        }
        break;
      }
      lVar37 = lVar37 + 1;
    } while (uVar29 - 1 != lVar37);
  }
LAB_145432dd6:
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
  uVar36 = 0x65736572;
LAB_145433177:
  uVar29 = 0;
  if ((bStack_197 & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = local_e8;
    if (((int)local_f8 != 1) &&
       ((bStack_197 != 0 ||
        (bStack_197 = 1, uVar29 = 0, puVar20 = local_1d8,
        (uStack_1d0 != local_1d8 | bStack_198) != 1)))) goto LAB_145433335;
    local_1d8 = puVar20;
    auVar56 = func_0x0001400a4890();
    uVar29 = auVar56._8_8_;
    piVar32 = auVar56._0_8_;
    if ((6 < uVar29) &&
       ((*(int *)((long)piVar32 + 3) == 0x7c737465 && *piVar32 == (int)uVar36 &&
        (uVar34 = uVar29 - 7, uVar34 != 0)))) {
      pcVar26 = (char *)((long)piVar32 + 7);
      if (uVar29 == 8) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145433177;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar17 = (ulong)(cVar10 == '+');
      uVar18 = uVar34 - uVar17;
      uVar29 = 0;
      if (uVar18 < 9) {
        if (uVar34 == uVar17) goto LAB_145433335;
        uVar34 = 0;
        while ((byte)pcVar26[uVar34 + uVar17] - 0x30 < 10) {
          uVar29 = (ulong)(((byte)pcVar26[uVar34 + uVar17] - 0x30) + (int)uVar29 * 10);
          uVar34 = uVar34 + 1;
          if (uVar18 == uVar34) goto LAB_145433335;
        }
      }
      else {
        uVar34 = 0;
        while( true ) {
          if (uVar18 == uVar34) goto LAB_145433335;
          uVar44 = (uint)(uVar29 * 10);
          if ((int)(uVar29 * 10 >> 0x20) != 0) break;
          uVar14 = (byte)pcVar26[uVar34 + uVar17] - 0x30;
          uVar29 = (ulong)(uVar44 + uVar14);
          if ((9 < uVar14) || (uVar34 = uVar34 + 1, CARRY4(uVar44,uVar14))) break;
        }
      }
    }
    goto LAB_145433177;
  }
LAB_145433335:
  local_f8 = (ulong *)0x0;
  uStack_f0 = local_a0;
  local_e8 = local_a8;
  uStack_e0 = local_a0;
  local_d8 = (ulong *)0x0;
  uStack_d0 = local_a0;
  uStack_c8 = 0xa0000000a;
  uStack_c0 = CONCAT71(uStack_c0._1_7_,1);
  local_b8 = local_b8 & 0xffffffffffff0000;
  uVar36 = 0x73746570;
  bVar45 = 0;
  local_70 = (ulong *)uVar29;
  while ((bVar45 & 1) == 0) {
    func_0x00014543cad0();
    puVar20 = (ulong *)auStack_1c8._0_8_;
    if ((int)local_1d8 != 1) {
      if (local_b8._1_1_ != '\0') break;
      local_b8._0_2_ = CONCAT11(1,(byte)local_b8);
      puVar20 = local_f8;
      if ((uStack_f0 != local_f8 | (byte)local_b8) != 1) break;
    }
    local_f8 = puVar20;
    auVar56 = func_0x0001400a4890();
    piVar32 = auVar56._0_8_;
    if ((4 < auVar56._8_8_) && ((char)piVar32[1] == '|' && *piVar32 == (int)uVar36)) {
      register0x00000000 = (ulong *)((long)piVar32 + 5);
      auStack_1c8._0_8_ = auVar56._8_8_ - 5;
      local_1d8 = (ulong *)0x2;
      uStack_1d0 = (ulong *)0x0;
      uStack_1b0 = (ulong *)0x0;
      local_1a0._0_1_ = 0x2c;
      local_1a0._1_7_ = 0x2c000000;
      bStack_198 = 1;
      uStack_190 = CONCAT62(uStack_190._2_6_,1);
      local_1b8 = (ulong *)auStack_1c8._0_8_;
      uStack_1a8 = (ulong *)auStack_1c8._0_8_;
      func_0x000145535920();
      local_1f8 = local_240;
      puStack_1f0 = puStack_238;
      local_1e8 = local_230;
      goto LAB_145433562;
    }
    bVar45 = local_b8._1_1_;
  }
  local_1f8 = (ulong *)0x0;
  puStack_1f0 = (ulong *)&DAT_00000008;
  local_1e8 = (ulong *)0x0;
LAB_145433562:
  local_338 = (ulong *)0x0;
  uStack_330 = (ulong *)0x1;
  local_328 = (ulong *)0x0;
  puVar20 = (ulong *)0x0;
  puVar48 = (ulong *)0x0;
LAB_14543378d:
  puVar33 = puVar48;
  if (puVar48 <= local_a0) {
    do {
      puVar30 = (undefined1 *)((long)local_a8 + (long)puVar33);
      if ((ulong)((long)local_a0 - (long)puVar33) < 0x10) {
        uVar29 = 0;
        puVar48 = local_a0;
        if (local_a0 == puVar33) break;
        while (puVar30[uVar29] != '\n') {
          uVar29 = uVar29 + 1;
          if ((long)local_a0 - (long)puVar33 == uVar29) goto LAB_14543385a;
        }
      }
      else {
        auVar56 = func_0x0001457311c0();
        uVar29 = auVar56._8_8_;
        puVar48 = local_a0;
        if (auVar56._0_8_ != 1) break;
      }
      puVar49 = (ulong *)((long)puVar33 + uVar29 + 1);
      puVar48 = puVar49;
      if (((ulong *)((long)puVar33 + uVar29) < local_a0) && (puVar30[uVar29] == '\n')) {
        uVar29 = 0;
        puVar33 = puVar49;
        goto LAB_14543386f;
      }
      puVar33 = puVar49;
    } while (puVar49 <= local_a0);
  }
LAB_14543385a:
  uVar29 = 1;
  puVar49 = local_a0;
  puVar33 = puVar20;
  if (local_a0 != puVar20) {
LAB_14543386f:
    lVar31 = (long)puVar49 - (long)puVar20;
    lVar37 = lVar31;
    if ((lVar31 != 0) && (((undefined1 *)((long)local_a8 + -1))[(long)puVar49] == '\n')) {
      lVar37 = lVar31 + -1;
      if (lVar37 == 0) {
        lVar37 = 0;
      }
      else if (((undefined1 *)((long)local_a8 + -2))[(long)puVar49] == '\r') {
        lVar37 = lVar31 + -2;
      }
    }
    auVar56 = func_0x0001400a4890(puVar33,uVar29,lVar37,
                                  (undefined1 *)((long)local_a8 + (long)puVar20));
    uStack_1d0 = auVar56._8_8_;
    local_1d8 = (ulong *)0x0;
    local_1b8 = (ulong *)0x0;
    uStack_1a8 = (ulong *)0x7c0000007c;
    local_1a0._0_1_ = 1;
    bStack_198 = 1;
    bStack_197 = 0;
    uStack_1b0 = uStack_1d0;
    _auStack_1c8 = auVar56;
    func_0x0001455393f0();
    if ((((local_230 == (ulong *)0x5) && (puStack_238[1] == 4)) &&
        (*(int *)*puStack_238 == 0x6f726568)) && (uVar34 = puStack_238[3], uVar34 != 0)) {
      pcVar26 = (char *)puStack_238[2];
      if (uVar34 == 1) {
        cVar10 = *pcVar26;
        if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145433950;
      }
      else {
        cVar10 = *pcVar26;
      }
      uVar18 = (ulong)(cVar10 == '+');
      pbVar24 = (byte *)(pcVar26 + uVar18);
      if (uVar34 - uVar18 < 3) {
        if (uVar34 == uVar18) {
          uVar17 = 0;
        }
        else {
          uVar44 = *pbVar24 - 0x30;
          uVar17 = (ulong)uVar44;
          if (9 < uVar44) goto LAB_145433950;
          if (uVar34 - uVar18 != 1) {
            if (9 < pbVar24[1] - 0x30) goto LAB_145433950;
            uVar17 = (ulong)(byte)((char)(pbVar24[1] - 0x30) + (char)uVar44 * '\n');
          }
        }
LAB_145433a42:
        uVar34 = puStack_238[5];
        if (uVar34 != 0) {
          pcVar26 = (char *)puStack_238[4];
          if (uVar34 == 1) {
            cVar10 = *pcVar26;
            if ((cVar10 == '+') || (cVar10 == '-')) goto LAB_145433950;
          }
          else {
            cVar10 = *pcVar26;
          }
          uVar18 = (ulong)(cVar10 == '+');
          pbVar24 = (byte *)(pcVar26 + uVar18);
          if (uVar34 - uVar18 < 3) {
            if (uVar34 == uVar18) {
              uVar44 = 0;
            }
            else {
              uVar44 = *pbVar24 - 0x30;
              if (9 < uVar44) goto LAB_145433950;
              if (uVar34 - uVar18 != 1) {
                uVar14 = pbVar24[1] - 0x30;
                if (9 < uVar14) goto LAB_145433950;
                uVar44 = CONCAT31((int3)(uVar14 >> 8),(char)uVar14 + (char)uVar44 * '\n');
              }
            }
LAB_145433b12:
            uVar14 = (int)uVar17 - 1;
            if (((byte)uVar14 < 0xb) && ((0x5dfU >> (uVar14 & 0x1f) & 1) != 0)) {
              uVar34 = (ulong)((uVar14 & 0xff) << 3);
              lVar37 = 0;
              do {
                if (*(char *)(*(long *)(uVar34 + 0x14673dcd0) + lVar37) == (char)uVar44) {
                  uVar34 = puStack_238[7];
                  if (uVar34 == 0) break;
                  pcVar26 = (char *)puStack_238[6];
                  if (uVar34 == 1) {
                    cVar10 = *pcVar26;
                    if ((cVar10 == '+') || (cVar10 == '-')) break;
                  }
                  else {
                    cVar10 = *pcVar26;
                  }
                  uVar18 = (ulong)(cVar10 == '+');
                  pbVar24 = (byte *)(pcVar26 + uVar18);
                  local_80 = (ulong *)CONCAT44(local_80._4_4_,uVar44);
                  if (2 < uVar34 - uVar18) {
                    lVar37 = 0;
                    uVar44 = 0;
                    goto LAB_145433bfb;
                  }
                  if (uVar34 == uVar18) {
                    uVar44 = 0;
                    goto LAB_145433c38;
                  }
                  uVar44 = *pbVar24 - 0x30;
                  if (uVar44 < 10) {
                    if (uVar34 - uVar18 == 1) goto LAB_145433c38;
                    uVar14 = pbVar24[1] - 0x30;
                    if (uVar14 < 10) {
                      uVar44 = CONCAT31((int3)(uVar14 >> 8),(char)uVar14 + (char)uVar44 * '\n');
                      goto LAB_145433c38;
                    }
                  }
                  break;
                }
                lVar37 = lVar37 + 1;
              } while (*(long *)(uVar34 + 0x14673dd28) != lVar37);
            }
          }
          else {
            lVar37 = 0;
            uVar44 = 0;
            while( true ) {
              if (lVar37 == uVar34 - uVar18) goto LAB_145433b12;
              sVar12 = (ushort)(byte)uVar44 * 10;
              if ((char)((ushort)sVar12 >> 8) != '\0') break;
              bVar45 = (byte)sVar12;
              bVar11 = (byte)(pbVar24[lVar37] - 0x30);
              uVar44 = (uint)(byte)(bVar45 + bVar11);
              if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar45,bVar11)))
              break;
            }
          }
        }
      }
      else {
        lVar37 = 0;
        uVar17 = 0;
        while( true ) {
          if (lVar37 == uVar34 - uVar18) goto LAB_145433a42;
          sVar12 = (ushort)(byte)uVar17 * 10;
          if ((char)((ushort)sVar12 >> 8) != '\0') break;
          bVar45 = (byte)(pbVar24[lVar37] - 0x30);
          bVar11 = (byte)sVar12;
          uVar17 = (ulong)(byte)(bVar11 + bVar45);
          if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar11,bVar45))) break;
        }
      }
    }
    goto LAB_145433950;
  }
  goto LAB_1454335a2;
LAB_145434a87:
  func_0x000145903b33();
  goto LAB_145434c0b;
LAB_14543242f:
  if ((undefined1 *)((long)puVar46 + (-1 - uVar34)) == puVar30) goto LAB_145432469;
  uVar13 = (ushort)(byte)puVar48 * 10;
  puVar48 = (ulong *)(ulong)uVar13;
  if ((char)(uVar13 >> 8) != '\0') goto LAB_145432200;
  uVar44 = *(byte *)((long)local_90 + (long)((long)local_80 + (long)(puVar30 + uVar34))) - 0x30;
  bVar45 = (byte)uVar44;
  puVar48 = (ulong *)(ulong)(byte)((byte)uVar13 + bVar45);
  if ((9 < uVar44) || (puVar30 = puVar30 + 1, CARRY1((byte)uVar13,bVar45))) goto LAB_145432200;
  goto LAB_14543242f;
LAB_145432469:
  if (puVar2 != (ulong *)0x0) {
    puVar46 = local_98;
    if (-1 < (long)puVar2) {
      local_80 = (ulong *)CONCAT44(local_80._4_4_,(int)puVar48);
      func_0x000140002200();
      local_98 = (ulong *)func_0x0001400021c0();
      puVar46 = puVar2;
      if (local_98 != (ulong *)0x0) {
        local_100 = puVar2;
        func_0x0001457731ed();
        uVar29 = local_268;
        bVar45 = (byte)local_80;
        if (3 < (byte)local_80) {
          bVar45 = 4;
        }
        if (local_268 == local_278) {
          func_0x000145774710();
        }
        puStack_270[uVar29 * 4] = (ulong)local_100;
        puStack_270[uVar29 * 4 + 1] = (ulong)local_98;
        puStack_270[uVar29 * 4 + 2] = (ulong)local_100;
        *(byte *)(puStack_270 + uVar29 * 4 + 3) = bVar45;
        local_268 = uVar29 + 1;
        puVar48 = puStack_270;
        goto LAB_145432200;
      }
    }
    local_98 = puVar46;
    func_0x00014590379b();
    goto LAB_145434c0b;
  }
  goto LAB_145432200;
LAB_145432b7c:
  if ((uVar34 + -uVar21) - 1 == uVar18) goto LAB_145432bb7;
  auVar3._8_8_ = 0;
  auVar3._0_8_ = uVar29;
  auVar58 = auVar3 * ZEXT816(10);
  uVar39 = auVar58._0_8_;
  if (auVar58._8_8_ != 0) goto LAB_145432840;
  uVar44 = *(byte *)((long)local_90 + (long)((long)puVar33 + uVar18 + uVar21)) - 0x30;
  uVar43 = (ulong)uVar44;
  uVar29 = uVar39 + uVar43;
  uVar17 = CONCAT71(auVar58._9_7_,CARRY8(uVar39,uVar43));
  auVar7._8_8_ = uVar17;
  auVar7._0_8_ = uVar29;
  auVar58._8_8_ = uVar17;
  auVar58._0_8_ = uVar29;
  if ((9 < uVar44) || (uVar18 = uVar18 + 1, auVar58 = auVar7, CARRY8(uVar39,uVar43)))
  goto LAB_145432840;
  goto LAB_145432b7c;
  while( true ) {
    uVar29 = (ulong)uVar44 + uVar29 * 10;
    uVar17 = uVar17 + 1;
    if ((uVar34 + -uVar21) - 1 == uVar17) break;
LAB_145432b40:
    auVar58._8_8_ = uVar17;
    auVar58._0_8_ = uVar29;
    uVar44 = *(byte *)((long)local_90 + (long)((long)puVar33 + uVar17 + uVar21)) - 0x30;
    if (9 < uVar44) goto LAB_145432840;
  }
LAB_145432bb7:
  auVar58._8_8_ = uVar17;
  auVar58._0_8_ = uVar29;
  goto LAB_145432840;
LAB_145434a39:
  do {
    if (puVar35[uVar34] == puVar35[uVar18 - 1]) {
      uVar44 = puVar35[uVar34 + 1];
      local_2e8 = uVar18;
      if (uVar44 != puVar35[uVar18 - 1]) {
LAB_145434a5e:
        puVar35[uVar18] = uVar44;
        local_2e8 = uVar18 + 1;
      }
    }
    else {
      puVar35[uVar18] = puVar35[uVar34];
      local_2e8 = uVar18 + 1;
      uVar44 = puVar35[uVar34 + 1];
      puVar27 = puVar35 + uVar18;
      uVar18 = local_2e8;
      if (uVar44 != *puVar27) goto LAB_145434a5e;
    }
    uVar34 = uVar34 + 2;
    uVar18 = local_2e8;
  } while (uVar29 != uVar34);
  goto LAB_145432dd6;
LAB_145433bfb:
  if (lVar37 == uVar34 - uVar18) goto LAB_145433c38;
  sVar12 = (ushort)(byte)uVar44 * 10;
  if ((char)((ushort)sVar12 >> 8) != '\0') goto LAB_145433950;
  bVar45 = (byte)sVar12;
  bVar11 = (byte)(pbVar24[lVar37] - 0x30);
  uVar44 = (uint)(byte)(bVar45 + bVar11);
  if ((9 < pbVar24[lVar37] - 0x30) || (lVar37 = lVar37 + 1, CARRY1(bVar45,bVar11)))
  goto LAB_145433950;
  goto LAB_145433bfb;
LAB_145433c38:
  local_100 = (ulong *)CONCAT44(local_100._4_4_,uVar44);
  local_98 = (ulong *)CONCAT71(local_98._1_7_,(char)uVar44 != '\0');
  auStack_1c8._0_8_ = puStack_238[8];
  local_90 = puStack_238;
  uStack_1d0 = (ulong *)puStack_238[9];
  local_1d8 = (ulong *)0x0;
  local_1b8 = (ulong *)0x0;
  uStack_1a8 = (ulong *)0x2c0000002c;
  local_1a0._0_1_ = 1;
  bStack_198 = 1;
  bStack_197 = 0;
  unique0x10004ea0 = uStack_1d0;
  uStack_1b0 = uStack_1d0;
  func_0x00014553d930();
  if (local_e8 == (ulong *)0x5) {
    puVar20 = (ulong *)((ulong)local_1e0 & 0xffffff0000000000 | (ulong)(uint5)*uStack_f0);
    if (local_f8 != (ulong *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_1e0 = uStack_f0;
    puVar20 = uStack_f0;
    if (local_f8 != (ulong *)0xffffffffffffffff) {
      if (local_f8 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
LAB_145433950:
      puVar20 = puVar33;
      if (local_240 != (ulong *)0x0) {
        func_0x0001400021d0();
        puVar20 = puVar33;
      }
      goto joined_r0x000145433e2c;
    }
  }
  local_1e0 = puVar20;
  local_98 = (ulong *)func_0x000145514150();
  uVar44 = (uint)((char)local_100 != '\0');
  if (local_240 != (ulong *)0x0) {
    local_100 = (ulong *)CONCAT71(local_100._1_7_,(char)local_100 != '\0');
    func_0x0001400021d0();
    uVar44 = (uint)local_100 & 0xff;
  }
  puVar49 = (ulong *)((long)local_98 << 0x18 |
                     (ulong)(uVar44 << 0x10) | ((ulong)local_80 & 0xff) << 8 | uVar17 & 0xff);
  local_1d8 = puVar49;
  func_0x000145531460();
  puVar20 = local_328;
  if (local_328 == local_338) {
    func_0x0001458e9be0();
  }
  *(ulong **)((long)uStack_330 + (long)puVar20 * 8) = puVar49;
  local_328 = (ulong *)((long)puVar20 + 1);
  puVar20 = puVar33;
joined_r0x000145433e2c:
  if ((uVar29 & 1) != 0) {
LAB_1454335a2:
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
    local_418[3][5] = local_2b0;
    local_418[3][3] = local_2c0;
    local_418[3][4] = uStack_2b8;
    local_418[3][8] = local_340;
    local_418[3][6] = local_350;
    local_418[3][7] = puStack_348;
    local_418[3][9] = local_260;
    local_418[3][10] = lStack_258;
    local_418[3][0xb] = local_250;
    local_418[3][0xc] = local_380;
    local_418[3][0xd] = lStack_378;
    local_418[3][0xe] = local_370;
    local_418[3][0xf] = local_2a8;
    local_418[3][0x10] = lStack_2a0;
    local_418[3][0x11] = local_298;
    local_418[3][0x12] = local_278;
    local_418[3][0x13] = puStack_270;
    local_418[3][0x14] = local_268;
    local_418[3][0x15] = local_3d8;
    local_418[3][0x16] = uStack_3d0;
    local_418[3][0x17] = local_3c8;
    local_418[3][0x1a] = local_3e0;
    local_418[3][0x18] = local_3f0;
    local_418[3][0x19] = uStack_3e8;
    local_418[3][0x1d] = local_2c8;
    local_418[3][0x1b] = local_2d8;
    local_418[3][0x1c] = lStack_2d0;
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
  goto LAB_14543378d;
LAB_145434a72:
  func_0x000145903b33();
LAB_145434c0b:
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
