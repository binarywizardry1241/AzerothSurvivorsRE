
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,uint *param_3,undefined8 *param_4,byte *param_5)

{
  ushort *puVar1;
  code *pcVar2;
  short sVar3;
  undefined8 uVar4;
  undefined2 uVar5;
  uint uVar6;
  byte *pbVar7;
  long lVar8;
  long lVar9;
  undefined8 *puVar10;
  undefined2 *puVar11;
  uint uVar12;
  undefined4 uVar13;
  uint uVar14;
  ulong uVar15;
  undefined8 uVar16;
  ulong uVar17;
  byte *pbVar18;
  undefined8 uVar19;
  ushort *puVar20;
  byte *pbVar21;
  ushort uVar22;
  byte *pbVar23;
  long lVar24;
  byte *pbVar25;
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined1 *local_338 [2];
  byte *local_328;
  ulong local_320;
  ulong local_318;
  ulong local_310;
  ulong local_308;
  char local_2fc;
  ulong local_2fa;
  short local_2f2;
  ulong local_2f0;
  byte *local_2e8;
  byte *local_2e0;
  undefined8 local_2d8;
  ulong local_2c8;
  undefined8 local_2c0;
  undefined8 local_2b8;
  ulong local_2b0;
  ulong local_2a8;
  long local_2a0;
  uint *local_298;
  long local_290;
  ulong local_278;
  uint local_270;
  byte *local_268;
  byte *pbStack_260;
  ulong local_258;
  long local_248;
  byte *local_240;
  uint *local_238;
  ulong local_230;
  long local_228;
  ulong local_220;
  undefined1 local_218 [16];
  ulong local_208;
  byte *local_200;
  byte *pbStack_1f8;
  byte *pbStack_1f0;
  ulong local_1e8;
  byte *local_1e0;
  long local_1c0;
  byte *local_1b8;
  byte *local_1b0;
  undefined8 local_1a8;
  byte *pbStack_1a0;
  ulong local_198;
  ulong local_188;
  undefined2 *local_180;
  long local_178;
  ulong local_170;
  undefined1 local_161;
  byte *local_160;
  byte *local_158;
  ulong local_150;
  uint *local_148;
  ulong local_140;
  byte *local_138;
  undefined8 *local_130;
  char local_128;
  undefined1 uStack_127;
  short sStack_126;
  undefined4 uStack_124;
  ushort uStack_120;
  undefined2 uStack_11e;
  undefined4 uStack_11c;
  ushort uStack_118;
  undefined6 uStack_116;
  ulong local_110;
  ulong local_108;
  byte *local_100;
  undefined1 local_f1;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;
  undefined8 extraout_XMM0_Qb;

  local_f0 = 0xfffffffffffffffe;
  local_1a8._0_4_ = 0;
  local_1a8._4_4_ = 0;
  local_100 = param_5;
  local_130 = param_4;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  if (param_5 < (byte *)0x4) {
    local_200 = (byte *)&local_1a8;
    pbStack_1f8 = (byte *)0x14573b340;
    func_0x000145728390(param_1,param_3,0x1469f9348,&local_128,&local_200);
    pbVar23 = (byte *)CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    if (pbVar23 == (byte *)0xffffffffffffffff) {
      local_270 = CONCAT22(uStack_11e,uStack_120);
      goto joined_r0x0001455182cc;
    }
LAB_145518337:
    pbStack_1f8 = pbVar23;
    pbVar23 = (byte *)CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
    uVar15 = CONCAT62(uStack_116,uStack_118);
    goto LAB_145518705;
  }
  uVar14 = *param_3;
  local_270 = uVar14 >> 0x18 | (uVar14 & 0xff0000) >> 8 | (uVar14 & 0xff00) << 8 | uVar14 << 0x18;
joined_r0x0001455182cc:
  if ((local_270 != 0x74727565) && (local_270 != 0x10000)) {
    func_0x000140002200();
    pbVar23 = (byte *)func_0x0001400021c0();
    uVar16 = uRam00000001469f94da;
    if (pbVar23 == (byte *)0x0) {
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    *(undefined8 *)pbVar23 = _DAT_1469f94d2;
    *(undefined8 *)(pbVar23 + 8) = uVar16;
    pbVar23[0xf] = 0x66;
    pbVar23[0x10] = 0x6f;
    pbVar23[0x11] = 0x6e;
    pbVar23[0x12] = 0x74;
    uVar15 = 0x13;
    pbStack_1f8 = (byte *)0x13;
    goto LAB_145518705;
  }
  local_1a8._0_4_ = 4;
  local_1a8._4_4_ = 0;
  pbVar18 = (byte *)0x14573b340;
  if (local_100 < (byte *)0x6) {
    local_200 = (byte *)&local_1a8;
    pbStack_1f8 = (byte *)0x14573b340;
    func_0x000145728390();
    pbVar23 = (byte *)CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    if (pbVar23 != (byte *)0xffffffffffffffff) goto LAB_145518337;
    pbVar21 = (byte *)(ulong)uStack_120;
    local_148 = param_3;
    if (uStack_120 != 0) goto LAB_145518367;
LAB_1455183fc:
    pbVar7 = &DAT_00000008;
  }
  else {
    uVar22 = (ushort)param_3[1] << 8 | (ushort)param_3[1] >> 8;
    pbVar21 = (byte *)(ulong)uVar22;
    local_148 = param_3;
    if (uVar22 == 0) goto LAB_1455183fc;
LAB_145518367:
    func_0x000140002200();
    pbVar7 = (byte *)func_0x0001400021c0();
    if (pbVar7 == (byte *)0x0) {
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  }
  pbVar23 = (byte *)0x0;
  local_200 = pbVar21;
  pbStack_1f8 = pbVar7;
  for (pbVar25 = (byte *)0x0; pbStack_1f0 = pbVar23, pbVar25 < pbVar21; pbVar25 = pbVar25 + 1) {
    lVar24 = (long)pbVar25 * 0x10;
    if (local_100 < (byte *)(lVar24 + 0x10)) {
      func_0x000140002200();
      uVar15 = 0x15;
      pbVar23 = (byte *)func_0x0001400021c0();
      uVar16 = uRam00000001469f94c5;
      if (pbVar23 == (byte *)0x0) {
        func_0x00014590379b();
        goto LAB_14551ac36;
      }
      *(undefined8 *)pbVar23 = _DAT_1469f94bd;
      *(undefined8 *)(pbVar23 + 8) = uVar16;
      pbVar23[0xd] = 0x69;
      pbVar23[0xe] = 0x72;
      pbVar23[0xf] = 0x65;
      pbVar23[0x10] = 99;
      pbVar23[0x11] = 0x74;
      pbVar23[0x12] = 0x6f;
      pbVar23[0x13] = 0x72;
      pbVar23[0x14] = 0x79;
      pbVar7 = (byte *)0x15;
      pbVar18 = pbStack_1f8;
joined_r0x0001455186e3:
      pbStack_1f8 = pbVar7;
      if (local_200 != (byte *)0x0) {
        pbVar21 = pbStack_1f8;
        pbStack_1f8 = pbVar18;
        func_0x0001400021d0();
      }
      goto LAB_145518705;
    }
    uVar14 = local_148[(long)pbVar25 * 4 + 3];
    local_2e8 = (byte *)(lVar24 + 0x14);
    pbVar23 = (byte *)(lVar24 + 0x18);
    if (local_100 < pbVar23) {
      local_1a8 = &local_2e8;
      pbStack_1a0 = pbVar18;
      func_0x000145728390();
      pbVar7 = (byte *)CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
      uVar12 = CONCAT22(uStack_11e,uStack_120);
      if (pbVar7 == (byte *)0xffffffffffffffff) {
        if ((byte *)(lVar24 + 0x1c) <= local_100) goto LAB_1455184ec;
        goto LAB_145518512;
      }
      pbVar23 = (byte *)CONCAT44(uStack_11c,uVar12);
LAB_1455186d2:
      uVar15 = CONCAT62(uStack_116,uStack_118);
      pbVar18 = pbStack_1f8;
      goto joined_r0x0001455186e3;
    }
    uVar12 = local_148[(long)pbVar25 * 4 + 5];
    uVar12 = uVar12 >> 0x18 | (uVar12 & 0xff0000) >> 8 | (uVar12 & 0xff00) << 8 | uVar12 << 0x18;
    if (local_100 < (byte *)(lVar24 + 0x1c)) {
LAB_145518512:
      local_1a8 = &local_2e8;
      local_2e8 = pbVar23;
      pbStack_1a0 = pbVar18;
      func_0x000145728390();
      pbVar7 = (byte *)CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
      uVar6 = CONCAT22(uStack_11e,uStack_120);
      if (pbVar7 != (byte *)0xffffffffffffffff) {
        pbVar23 = (byte *)CONCAT44(uStack_11c,uVar6);
        goto LAB_1455186d2;
      }
    }
    else {
LAB_1455184ec:
      uVar6 = local_148[(long)pbVar25 * 4 + 6];
      uVar6 = uVar6 >> 0x18 | (uVar6 & 0xff0000) >> 8 | (uVar6 & 0xff00) << 8 | uVar6 << 0x18;
      local_2e8 = pbVar23;
    }
    pbVar23 = pbStack_1f0;
    uVar15 = (ulong)uVar12;
    if (local_100 < (byte *)(uVar6 + uVar15)) {
      func_0x000140002200();
      uVar15 = 0x1d;
      pbVar23 = (byte *)func_0x0001400021c0();
      uVar16 = uRam00000001469f94b5;
      if (pbVar23 != (byte *)0x0) {
        *(ulong *)(pbVar23 + 0xd) = CONCAT53(uRam00000001469f94b0,_DAT_1469f94ad);
        *(undefined8 *)(pbVar23 + 0x15) = uVar16;
        uVar16 = CONCAT35(_DAT_1469f94ad,uRam00000001469f94a8);
        *(undefined8 *)pbVar23 = _DAT_1469f94a0;
        *(undefined8 *)(pbVar23 + 8) = uVar16;
        pbVar7 = (byte *)0x1d;
        pbVar18 = pbStack_1f8;
        goto joined_r0x0001455186e3;
      }
      func_0x00014590379b();
      goto LAB_14551ac36;
    }
    if (pbStack_1f0 == local_200) {
      func_0x0001457745c0();
    }
    *(uint *)(pbStack_1f8 + (long)pbVar23 * 0x18) = uVar14;
    *(ulong *)(pbStack_1f8 + (long)pbVar23 * 0x18 + 8) = uVar15 + (long)local_148;
    *(ulong *)(pbStack_1f8 + (long)pbVar23 * 0x18 + 0x10) = (ulong)uVar6;
    pbVar23 = pbVar23 + 1;
  }
  if (local_200 == (byte *)0xffffffffffffffff) {
    uVar15 = (ulong)local_270;
LAB_145518705:
    local_130[1] = pbStack_1f8;
    local_130[2] = pbVar23;
    local_130[3] = uVar15;
    *local_130 = 1;
    return local_130;
  }
  local_1b0 = local_200;
  local_1b8 = pbStack_1f8;
  func_0x00014550da00();
  lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
  uVar15 = CONCAT62(uStack_116,uStack_118);
  if (lVar24 != -1) {
    local_130[1] = lVar24;
    local_130[2] = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
    local_130[3] = uVar15;
    goto LAB_14551881f;
  }
  func_0x00014550da00();
  lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
  lVar8 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
  pbVar18 = (byte *)CONCAT62(uStack_116,uStack_118);
  if (lVar24 == -1) {
    local_1c0 = lVar8;
    local_160 = pbVar18;
    func_0x00014550da00();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    lVar8 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
    pbVar18 = (byte *)CONCAT62(uStack_116,uStack_118);
    if (lVar24 != -1) goto LAB_14551880c;
    local_1e0 = pbVar18;
    func_0x00014550da00();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    uVar16 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
    uVar19 = CONCAT62(uStack_116,uStack_118);
    if (lVar24 != -1) {
      local_130[1] = lVar24;
      local_130[2] = uVar16;
      local_130[3] = uVar19;
      goto LAB_14551881f;
    }
    func_0x00014550da00(uVar19,uVar16,local_1b8,&local_128,pbVar23,0x1469fa02c);
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    pbVar18 = (byte *)CONCAT62(uStack_116,uStack_118);
    if (lVar24 != -1) {
      local_130[1] = lVar24;
      local_130[2] = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
      goto LAB_14551881b;
    }
    local_138 = pbVar18;
    func_0x00014550da00();
    uVar13 = uStack_11c;
    uVar5 = uStack_11e;
    uVar22 = uStack_120;
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    pbVar18 = (byte *)CONCAT62(uStack_116,uStack_118);
    if (lVar24 != -1) {
      local_130[1] = lVar24;
      local_130[2] = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
      goto LAB_14551881b;
    }
    local_158 = pbVar18;
    func_0x000145518150();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    if (lVar24 != -1) {
      local_130[3] = CONCAT62(uStack_116,uStack_118);
      *(ulong *)((long)local_130 + 0x12) = CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
      local_130[1] = lVar24;
      *(ushort *)(local_130 + 2) = uStack_120;
      *local_130 = 1;
      goto LAB_145518826;
    }
    local_150 = CONCAT62(local_150._2_6_,uStack_120);
    func_0x000145518150();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    if (lVar24 != -1) {
LAB_1455189fb:
      local_130[3] = CONCAT62(uStack_116,uStack_118);
      *(ulong *)((long)local_130 + 0x12) = CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
      local_130[1] = lVar24;
      *(ushort *)(local_130 + 2) = uStack_120;
      *local_130 = 1;
      goto LAB_145518826;
    }
    local_161 = uStack_120 != 0;
    func_0x000145518150();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    local_140 = CONCAT62(local_140._2_6_,uStack_120);
    if (lVar24 != -1) {
      local_130[3] = CONCAT62(uStack_116,uStack_118);
      *(ulong *)((long)local_130 + 0x12) = CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
      local_130[1] = lVar24;
      *(ushort *)(local_130 + 2) = uStack_120;
      *local_130 = 1;
      goto LAB_145518826;
    }
    func_0x000145518150();
    lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
    if (lVar24 != -1) goto LAB_1455189fb;
    local_320 = (ulong)uStack_120;
    func_0x00014550da00();
    if (local_200 == (byte *)0xffffffffffffffff) {
      func_0x00014551bd80();
      pbStack_1a0 = (byte *)CONCAT62(uStack_116,uStack_118);
      local_1a8 = (byte **)CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
      local_198 = local_110;
      if (CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)) != 1) {
        uVar17 = local_140 & 0xffff;
        local_278 = local_110;
        local_338[0] = &local_161;
        local_328 = local_138;
        local_110 = 0;
        local_128 = (char)local_338;
        uStack_127 = (undefined1)((ulong)local_338 >> 8);
        sStack_126 = (short)((ulong)local_338 >> 0x10);
        uStack_124 = (undefined4)((ulong)local_338 >> 0x20);
        uStack_118 = (ushort)local_158;
        uStack_116 = (undefined6)((ulong)local_158 >> 0x10);
        uStack_120 = uVar22;
        uStack_11e = uVar5;
        uStack_11c = uVar13;
        local_108 = uVar17;
        func_0x00014550d450();
        local_1a8._0_4_ = SUB84(pbStack_1f8,0);
        local_1a8._4_4_ = (undefined4)((ulong)pbStack_1f8 >> 0x20);
        pbStack_1a0 = pbStack_1f0;
        local_198 = local_1e8;
        if ((int)local_200 == 1) {
          local_130[3] = local_1e8;
          local_130[1] = pbStack_1f8;
          local_130[2] = pbStack_1f0;
          *local_130 = 1;
        }
        else {
          local_258 = local_1e8;
          local_268 = pbStack_1f8;
          pbStack_260 = pbStack_1f0;
          local_110 = 0;
          local_128 = (char)&local_320;
          uStack_127 = (undefined1)((ulong)&local_320 >> 8);
          sStack_126 = (short)((ulong)&local_320 >> 0x10);
          uStack_124 = (undefined4)((ulong)&local_320 >> 0x20);
          uStack_120 = (ushort)uVar16;
          uStack_11e = (undefined2)((ulong)uVar16 >> 0x10);
          uStack_11c = (undefined4)((ulong)uVar16 >> 0x20);
          uStack_118 = (ushort)uVar19;
          uStack_116 = (undefined6)((ulong)uVar19 >> 0x10);
          local_108 = uVar17;
          func_0x00014550d350();
          local_1a8._0_4_ = SUB84(pbStack_1f8,0);
          local_1a8._4_4_ = (undefined4)((ulong)pbStack_1f8 >> 0x20);
          pbStack_1a0 = pbStack_1f0;
          local_198 = local_1e8;
          if ((int)local_200 == 1) {
            local_130[3] = local_1e8;
            local_130[1] = pbStack_1f8;
            local_130[2] = pbStack_1f0;
            *local_130 = 1;
          }
          else {
            local_208 = local_1e8;
            local_218._8_8_ = pbStack_1f0;
            local_218._0_8_ = pbStack_1f8;
            local_150 = 0;
            lVar24 = 0;
            while (lVar24 != 0x290) {
              uVar13 = *(undefined4 *)(lVar24 + 0x1469fa038);
              local_1a8._0_4_ = *(undefined4 *)(lVar24 + 0x1469fa03c);
              local_158 = (byte *)CONCAT44(local_158._4_4_,(undefined4)local_1a8);
              local_200 = (byte *)CONCAT44(local_200._4_4_,*(undefined4 *)(lVar24 + 0x1469fa040));
              local_138 = (byte *)CONCAT71(local_138._1_7_,*(undefined1 *)(lVar24 + 0x1469fa044));
              lVar8 = func_0x000145502cb0();
              lVar24 = lVar24 + 0x10;
              if (lVar8 == 0) {
                local_128 = (char)uVar13;
                uStack_127 = (undefined1)((uint)uVar13 >> 8);
                sStack_126 = (short)((uint)uVar13 >> 0x10);
                lVar8 = func_0x000145502cb0();
                lVar9 = func_0x000145502cb0();
                if ((lVar8 != 0) && (lVar9 != 0)) {
                  func_0x00014550d8b0();
                  auVar26._0_8_ = func_0x00014550d8b0();
                  auVar26._8_8_ = extraout_XMM0_Qb;
                  if ((local_2f2 == 1) && (local_2fc != '\0')) {
                    local_2c8 = local_2f0 >> 0x20;
                    local_318 = local_2f0 >> 0x30;
                    local_2a8 = local_2fa >> 0x10 & 0xffff;
                    local_310 = local_2fa >> 0x20;
                    local_140 = local_2f0;
                    auVar27._4_12_ = auVar26._4_12_;
                    auVar27._0_4_ = (float)(int)(short)(local_2f0 >> 0x20);
                    local_308 = local_2fa >> 0x30;
                    /* WARNING: Could not emulate address calculation at 0x000145518f3d */
                    /* WARNING: Treating indirect jump as call */
                    puVar10 = (undefined8 *)
                              (*(code *)((long)*(int *)(((ulong)local_138 & 0xff) * 4 + 0x146d346b4)
                                        + 0x146d346b4))
                                        (auVar27._0_8_,(float)(int)(short)(local_2f0 >> 0x30));
                    return puVar10;
                  }
                }
              }
            }
            lVar24 = 0;
            while (lVar24 != 0x10) {
              uVar13 = *(undefined4 *)(lVar24 + 0x1469fa2e4);
              local_200 = (byte *)CONCAT44(local_200._4_4_,*(undefined4 *)(lVar24 + 0x1469fa2e0));
              lVar8 = func_0x000145502cb0();
              lVar24 = lVar24 + 8;
              if (lVar8 == 0) {
                local_128 = (char)uVar13;
                uStack_127 = (undefined1)((uint)uVar13 >> 8);
                sStack_126 = (short)((uint)uVar13 >> 0x10);
                puVar11 = (undefined2 *)func_0x000145502cb0();
                if (puVar11 != (undefined2 *)0x0) {
                  local_138 = (byte *)CONCAT62(local_138._2_6_,*puVar11);
                  func_0x00014550d8b0();
                  if (CONCAT11(uStack_127,local_128) == 1) {
                    local_158 = (byte *)CONCAT26(uStack_120,CONCAT42(uStack_124,sStack_126));
                    sVar3 = (short)((uint)uStack_124 >> 0x10);
                    uVar14 = CONCAT22(uStack_120,sVar3 + sStack_126);
                    if (SCARRY2(sVar3,sStack_126)) {
                      uVar14 = (int)(short)(sStack_126 + sVar3) >> 0xf ^ 0xffff8000;
                    }
                    local_170 = (ulong)uVar14;
                    func_0x000140002200();
                    puVar11 = (undefined2 *)func_0x0001400021c0();
                    if (puVar11 == (undefined2 *)0x0) {
                      func_0x00014590379b();
                      goto LAB_14551ac36;
                    }
                    local_140 = (ulong)local_138 & 0xffff;
                    local_188 = 0x18;
                    *puVar11 = 0xffff;
                    local_178 = 2;
                    uStack_120 = 4;
                    uStack_11e = 0;
                    uStack_11c = 0;
                    uStack_118 = (ushort)local_158;
                    uStack_116 = (undefined6)((ulong)local_158 >> 0x10);
                    lVar8 = 0;
                    local_180 = puVar11;
                    do {
                      lVar9 = lVar8 + 1;
                      local_128 = (char)lVar9;
                      uStack_127 = (undefined1)((ulong)lVar9 >> 8);
                      sStack_126 = (short)((ulong)lVar9 >> 0x10);
                      uStack_124 = (undefined4)((ulong)lVar9 >> 0x20);
                      uVar22 = (&uStack_118)[lVar8];
                      if (local_188 - local_178 < 2) {
                        local_f1 = 1;
                        func_0x0001457744b0();
                        puVar11 = local_180;
                      }
                      *(ushort *)((long)puVar11 + local_178) = uVar22 << 8 | uVar22 >> 8;
                      local_178 = local_178 + 2;
                      lVar8 = lVar9;
                    } while (lVar9 != 4);
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(undefined2 *)((long)local_180 + local_178) = 0x4712;
                    local_178 = local_178 + 2;
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(ushort *)((long)local_180 + local_178) =
                         (ushort)local_138 << 8 | (ushort)local_138 >> 8;
                    local_178 = local_178 + 2;
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(ushort *)((long)local_180 + local_178) =
                         (ushort)local_170 << 8 | (ushort)local_170 >> 8;
                    local_178 = local_178 + 2;
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(undefined2 *)((long)local_180 + local_178) = 0;
                    local_178 = local_178 + 2;
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(undefined2 *)((long)local_180 + local_178) = 0xc0;
                    local_178 = local_178 + 2;
                    if (local_188 - local_178 < 2) {
                      local_f1 = 1;
                      func_0x0001457744b0();
                    }
                    *(undefined2 *)((long)local_180 + local_178) = 0x40;
                    local_178 = local_178 + 2;
                    if (0xffff < local_258) {
                      local_f1 = 1;
                      func_0x00014550d930();
                      local_130[3] = CONCAT62(uStack_116,uStack_118);
                      *(ulong *)((long)local_130 + 0x12) =
                           CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
                      local_130[1] = CONCAT44(uStack_124,
                                              CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
                      *(ushort *)(local_130 + 2) = uStack_120;
                      *local_130 = 1;
                      uVar15 = local_188;
                      goto joined_r0x00014551a9e8;
                    }
                    local_f1 = 0;
                    func_0x0001406442a0();
                    uVar17 = local_208;
                    if (local_208 <= local_140) {
                      local_f1 = 0;
                      func_0x000145903b33();
                      goto LAB_14551ac36;
                    }
                    local_138 = (byte *)CONCAT62(local_138._2_6_,
                                                 *(undefined2 *)(local_218._8_8_ + local_140 * 4));
                    if (local_208 == local_218._0_8_) {
                      local_f1 = 0;
                      func_0x0001457783e0();
                    }
                    *(ushort *)(local_218._8_8_ + uVar17 * 4) = (ushort)local_138;
                    *(short *)(local_218._8_8_ + 2 + uVar17 * 4) = (short)local_158;
                    local_208 = uVar17 + 1;
                    local_f1 = 0;
                    func_0x00014550c470();
                    local_150 = (ulong)((int)local_150 + 1);
                  }
                }
              }
            }
            lVar24 = 0;
            lVar8 = 0x1469fa308;
            while (lVar24 != 0x30) {
              uVar13 = *(undefined4 *)(lVar24 + 4 + lVar8);
              local_200 = (byte *)CONCAT44(local_200._4_4_,*(undefined4 *)(lVar24 + lVar8));
              lVar9 = func_0x000145502cb0();
              lVar24 = lVar24 + 8;
              if (lVar9 == 0) {
                local_128 = (char)uVar13;
                uStack_127 = (undefined1)((uint)uVar13 >> 8);
                sStack_126 = (short)((uint)uVar13 >> 0x10);
                lVar9 = func_0x000145502cb0();
                if (lVar9 != 0) {
                  func_0x00014550c470();
                  local_150 = (ulong)((int)local_150 + 1);
                }
              }
            }
            if ((int)local_150 == 0) {
              func_0x000140188f20();
              uVar16 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
              if (local_128 != '\0') {
                func_0x00014590379b();
                goto LAB_14551ac36;
              }
              uVar19 = CONCAT62(uStack_116,uStack_118);
              if (local_100 != (byte *)0x0) {
                func_0x0001457731ed(uVar19,uVar16,local_148,uVar19,local_100);
              }
              local_130[1] = uVar16;
              local_130[2] = uVar19;
              local_130[3] = local_100;
              *local_130 = 0;
            }
            else {
              local_230 = 0;
              local_228 = 1;
              local_220 = 0;
              func_0x000140188f20();
              if (local_128 != '\0') {
                func_0x00014590379b();
                goto LAB_14551ac36;
              }
              local_240 = (byte *)CONCAT62(uStack_116,uStack_118);
              local_238 = (uint *)0x0;
              local_138 = pbStack_260 + local_258 * 0x18;
              local_148 = (uint *)0x0;
              pbVar18 = pbStack_260;
              local_248 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
              local_158 = local_240;
              while (uVar14 = (uint)local_220, pbVar18 != local_138) {
                if ((ulong)(local_248 - (long)local_148) < 4) {
                  uVar17 = local_220;
                  func_0x0001457744b0();
                  uVar14 = (uint)uVar17;
                  local_158 = local_240;
                  local_148 = local_238;
                }
                *(uint *)(local_158 + (long)local_148) =
                     uVar14 >> 0x18 | (uVar14 & 0xff0000) >> 8 | (uVar14 & 0xff00) << 8 |
                     uVar14 << 0x18;
                local_238 = local_148 + 1;
                local_100 = *(byte **)(pbVar18 + 8);
                uVar17 = *(ulong *)(pbVar18 + 0x10);
                local_148 = local_238;
                if (local_230 - local_220 < uVar17) {
                  func_0x0001457744b0(uVar17,local_220,local_220,&local_230,uVar17,1);
LAB_145519bd9:
                  func_0x0001457731ed();
                }
                else if (uVar17 != 0) goto LAB_145519bd9;
                pbVar18 = pbVar18 + 0x18;
                for (uVar17 = local_220 + uVar17; local_220 = uVar17, (uVar17 & 3) != 0;
                    uVar17 = uVar17 + 1) {
                  if (uVar17 == local_230) {
                    func_0x000145903690();
                  }
                  *(undefined1 *)(local_228 + uVar17) = 0;
                }
              }
              if ((ulong)(local_248 - (long)local_148) < 4) {
                uVar17 = local_220;
                func_0x0001457744b0();
                uVar14 = (uint)uVar17;
                local_148 = local_238;
              }
              *(uint *)(local_240 + (long)local_148) =
                   uVar14 >> 0x18 | (uVar14 & 0xff0000) >> 8 | (uVar14 & 0xff00) << 8 |
                   uVar14 << 0x18;
              local_238 = local_148 + 1;
              func_0x000140188f20();
              if (CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)) == 1) {
                func_0x00014590379b();
                goto LAB_14551ac36;
              }
              local_298 = (uint *)CONCAT62(uStack_116,uStack_118);
              local_290 = 0;
              puVar1 = (ushort *)(local_218._8_8_ + local_208 * 2 * 2);
              local_2a0 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
              for (puVar20 = (ushort *)local_218._8_8_; local_148 = local_298, puVar20 != puVar1;
                  puVar20 = puVar20 + 2) {
                uVar22 = *puVar20;
                if ((ulong)(local_2a0 - local_290) < 2) {
                  func_0x0001457744b0();
                  local_148 = local_298;
                }
                *(ushort *)((long)local_148 + local_290) = uVar22 << 8 | uVar22 >> 8;
                local_290 = local_290 + 2;
                uVar22 = puVar20[1];
                local_298 = local_148;
                if ((ulong)(local_2a0 - local_290) < 2) {
                  func_0x0001457744b0();
                }
                *(ushort *)((long)local_298 + local_290) = uVar22 << 8 | uVar22 >> 8;
                local_290 = local_290 + 2;
              }
              uVar22 = (ushort)local_258;
              func_0x000140188f20();
              local_150 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
              if (local_128 != '\0') {
                func_0x00014590379b();
                goto LAB_14551ac36;
              }
              local_158 = (byte *)CONCAT62(uStack_116,uStack_118);
              if ((uVar15 == 0) || (func_0x0001457731ed(), uVar15 < 0x34)) {
                func_0x000145903d40();
                goto LAB_14551ac36;
              }
              local_158[0x32] = 0;
              local_158[0x33] = 1;
              local_158[8] = 0;
              local_158[9] = 0;
              local_158[10] = 0;
              local_158[0xb] = 0;
              func_0x000140188f20();
              local_140 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
              if (CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)) == 1) {
                func_0x00014590379b();
                goto LAB_14551ac36;
              }
              local_138 = (byte *)CONCAT62(uStack_116,uStack_118);
              if ((local_160 == (byte *)0x0) ||
                 (pbVar18 = local_160, func_0x0001457731ed(), pbVar18 < (byte *)0x6)) {
                func_0x000145903d40();
                goto LAB_14551ac36;
              }
              uVar22 = uVar22 << 8 | uVar22 >> 8;
              *(ushort *)(local_138 + 4) = uVar22;
              if (local_160 < &DAT_00000020) {
LAB_14551a19e:
                func_0x000140188f20();
                local_170 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
                if (local_128 != '\0') {
                  func_0x00014590379b();
LAB_14551ac36:
                    /* WARNING: Does not return */
                  pcVar2 = (code *)invalidInstructionException();
                  (*pcVar2)();
                }
                local_1c0 = CONCAT62(uStack_116,uStack_118);
                if ((local_1e0 == (byte *)0x0) ||
                   (pbVar18 = local_1e0, func_0x0001457731ed(), pbVar18 < (byte *)0x24)) {
                  func_0x000145903d40();
                  goto LAB_14551ac36;
                }
                *(ushort *)(local_1c0 + 0x22) = uVar22;
                func_0x00014550da00();
                lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
                puVar10 = (undefined8 *)CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
                uVar15 = CONCAT62(uStack_116,uStack_118);
                if (lVar24 == -1) {
                  func_0x000140002200();
                  if (0x1f < uVar15) {
                    local_1e0 = (byte *)func_0x0001400021c0();
                    if (local_1e0 == (byte *)0x0) {
                      func_0x00014590379b();
                      goto LAB_14551ac36;
                    }
                    local_2e8 = &DAT_00000020;
                    uVar16 = *puVar10;
                    uVar19 = puVar10[1];
                    uVar4 = puVar10[3];
                    *(undefined8 *)(local_1e0 + 0x10) = puVar10[2];
                    *(undefined8 *)(local_1e0 + 0x18) = uVar4;
                    *(undefined8 *)local_1e0 = uVar16;
                    *(undefined8 *)(local_1e0 + 8) = uVar19;
                    local_2d8 = 0x20;
                    local_1e0[0] = 0;
                    local_1e0[1] = 3;
                    local_1e0[2] = 0;
                    local_1e0[3] = 0;
                    local_1a8._0_4_ = 0;
                    local_1a8._4_4_ = 0;
                    pbStack_1a0 = &DAT_00000008;
                    local_198 = 0;
                    local_160 = local_1b8 + (long)pbVar23 * 0x18;
                    local_100 = local_1b8;
                    local_2e0 = local_1e0;
                    while (local_100 != local_160) {
                      pbVar23 = local_100 + 0x18;
                      if (*local_100 - 0x44 < 0x2d) {
                    /* WARNING: Could not emulate address calculation at 0x00014551a4e2 */
                    /* WARNING: Treating indirect jump as call */
                        puVar10 = (undefined8 *)
                                  (*(code *)((long)*(int *)((ulong)(*local_100 - 0x44) * 4 +
                                                           0x146d346c8) + 0x146d346c8))();
                        return puVar10;
                      }
                      uVar15 = *(ulong *)(local_100 + 0x10);
                      func_0x000140188f20(*(undefined8 *)(local_100 + 8),uVar15,uVar15,&local_128,0,
                                          1);
                      uVar16 = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
                      if (local_128 != '\0') {
                        func_0x00014590379b();
                        goto LAB_14551ac36;
                      }
                      local_2b8 = CONCAT62(uStack_116,uStack_118);
                      local_2b0 = 0;
                      local_2c0 = uVar16;
                      if (uVar15 != 0) {
                        func_0x0001457731ed();
                        local_2b0 = uVar15;
                      }
                      uVar13 = *(undefined4 *)local_100;
                      local_128 = (char)uVar13;
                      uStack_127 = (undefined1)((uint)uVar13 >> 8);
                      sStack_126 = (short)((uint)uVar13 >> 0x10);
                      local_110 = local_2b0;
                      uStack_120 = (ushort)local_2c0;
                      uStack_11e = (undefined2)((ulong)local_2c0 >> 0x10);
                      uStack_11c = (undefined4)((ulong)local_2c0 >> 0x20);
                      uStack_118 = (ushort)local_2b8;
                      uStack_116 = (undefined6)((ulong)local_2b8 >> 0x10);
                      func_0x0001455135b0();
                      local_100 = pbVar23;
                    }
                    uStack_118 = (ushort)local_198;
                    uStack_116 = (undefined6)(local_198 >> 0x10);
                    local_128 = (char)(undefined4)local_1a8;
                    uStack_127 = (undefined1)((uint)(undefined4)local_1a8 >> 8);
                    sStack_126 = (short)((uint)(undefined4)local_1a8 >> 0x10);
                    uStack_124 = local_1a8._4_4_;
                    uStack_120 = (ushort)pbStack_1a0;
                    uStack_11e = (undefined2)((ulong)pbStack_1a0 >> 0x10);
                    uStack_11c = (undefined4)((ulong)pbStack_1a0 >> 0x20);
                    func_0x000145517960();
                    local_130[3] = pbStack_1f0;
                    local_130[1] = local_200;
                    local_130[2] = pbStack_1f8;
                    *local_130 = 0;
                    func_0x0001400021d0();
                    func_0x0001400021d0();
                    func_0x0001400021d0();
                    func_0x0001400021d0();
                    if (local_2a0 != 0) {
                      func_0x0001400021d0();
                    }
                    if (local_248 != 0) {
                      func_0x0001400021d0();
                    }
                    if (local_230 != 0) {
                      func_0x0001400021d0();
                    }
                    if (local_218._0_8_ != 0) {
                      func_0x0001400021d0();
                    }
                    func_0x000140001000();
                    func_0x00014550cd20();
                    goto LAB_145518826;
                  }
                  lVar24 = 10;
                  puVar10 = (undefined8 *)func_0x0001400021c0();
                  if (puVar10 == (undefined8 *)0x0) {
                    func_0x00014590379b();
                    goto LAB_14551ac36;
                  }
                  *puVar10 = 0x6f702074726f6873;
                  *(undefined2 *)(puVar10 + 1) = 0x7473;
                  uVar15 = 10;
                }
                local_130[1] = lVar24;
                local_130[2] = puVar10;
                local_130[3] = uVar15;
                *local_130 = 1;
                func_0x0001400021d0();
              }
              else {
                func_0x000145518150();
                lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
                uVar15 = (ulong)uStack_120;
                if (lVar24 == -1) {
                  func_0x000145518150();
                  lVar24 = CONCAT44(uStack_124,CONCAT22(sStack_126,CONCAT11(uStack_127,local_128)));
                  if (lVar24 == -1) {
                    if ((short)uVar15 < 0) {
                      uVar15 = CONCAT62((int6)(uVar15 >> 0x10),0xffff);
                    }
                    else {
                      uVar15 = (ulong)(uint)((int)uVar15 * 2);
                    }
                    func_0x00014550d9a0(uStack_120,uVar15,local_160,local_138,10,uVar15 & 0xffffffff
                                       );
                    func_0x00014550d9a0();
                    func_0x00014550d9a0();
                    func_0x00014550d9a0();
                    goto LAB_14551a19e;
                  }
                  local_130[3] = CONCAT62(uStack_116,uStack_118);
                  *(ulong *)((long)local_130 + 0x12) =
                       CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
                }
                else {
                  local_130[3] = CONCAT62(uStack_116,uStack_118);
                  *(ulong *)((long)local_130 + 0x12) =
                       CONCAT26(uStack_118,CONCAT42(uStack_11c,uStack_11e));
                }
                local_130[1] = lVar24;
                *(ushort *)(local_130 + 2) = uStack_120;
                *local_130 = 1;
              }
              func_0x0001400021d0();
              func_0x0001400021d0();
              if (local_2a0 != 0) {
                func_0x0001400021d0();
              }
              uVar15 = local_230;
              if (local_248 != 0) {
                func_0x0001400021d0();
                uVar15 = local_230;
              }
joined_r0x00014551a9e8:
              if (uVar15 != 0) {
                func_0x0001400021d0();
              }
            }
            if (local_218._0_8_ != 0) {
              func_0x0001400021d0();
            }
          }
          func_0x000140001000();
        }
        func_0x00014550cd20();
        goto LAB_145518826;
      }
      local_130[3] = local_110;
      local_130[1] = CONCAT44(uStack_11c,CONCAT22(uStack_11e,uStack_120));
      local_130[2] = pbStack_1a0;
    }
    else {
      local_130[1] = local_200;
      local_130[2] = pbStack_1f8;
      local_130[3] = pbStack_1f0;
    }
  }
  else {
LAB_14551880c:
    local_130[1] = lVar24;
    local_130[2] = lVar8;
LAB_14551881b:
    local_130[3] = pbVar18;
  }
LAB_14551881f:
  *local_130 = 1;
LAB_145518826:
  if (local_1b0 != (byte *)0x0) {
    func_0x0001400021d0();
    return local_130;
  }
  return local_130;
}
