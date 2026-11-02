/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  undefined8 *puVar1;
  long *plVar2;
  undefined4 *puVar3;
  uint *puVar4;
  uint uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  uint *puVar9;
  undefined3 uVar10;
  undefined8 uVar11;
  ulong uVar12;
  char cVar13;
  long *plVar14;
  long lVar15;
  long lVar16;
  undefined1 uVar17;
  undefined4 in_XMM6_Da;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined8 *in_stack_00000028;
  undefined8 local_2b8;
  long *local_2a0;
  long *local_298;
  undefined8 local_288;
  undefined4 uStack_280;
  undefined4 uStack_27c;
  undefined4 local_278;
  undefined4 uStack_274;
  undefined4 local_270;
  undefined4 uStack_26c;
  undefined4 uStack_268;
  uint uStack_264;
  undefined4 uStack_260;
  undefined4 local_25c;
  undefined4 uStack_258;
  undefined4 uStack_254;
  undefined4 uStack_250;
  undefined4 local_24c;
  undefined4 uStack_248;
  undefined4 uStack_244;
  undefined4 uStack_240;
  undefined4 uStack_23c;
  undefined4 local_238;
  undefined4 local_22c;
  undefined8 local_208;
  undefined4 local_200;
  undefined4 local_1e4;
  undefined8 local_1a0;
  undefined2 local_188;
  undefined1 local_186;
  undefined8 local_178;
  undefined4 local_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  undefined4 uStack_15c;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 local_110;
  undefined4 local_108;
  undefined1 local_104;
  undefined4 local_100;
  undefined1 local_fc;
  char local_f8;
  undefined1 local_f7;
  undefined8 local_f4;
  undefined4 local_ec;
  undefined4 local_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  undefined8 local_d8;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined8 uStack_c0;
  uint local_a8;
  uint uStack_a4;
  uint uStack_a0;
  uint uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  uint uStack_8c;
  uint uStack_88;
  undefined4 local_84;
  undefined1 uStack_80;
  undefined4 uStack_7f;
  undefined4 local_7b;
  undefined4 uStack_77;
  undefined4 uStack_73;
  undefined4 uStack_6f;
  long local_68;
  undefined8 local_60;
  undefined4 local_58;
  undefined1 uVar18;

  local_60 = 0xfffffffffffffffe;
  plVar14 = *(long **)(param_3 + 0x10);
  plVar2 = *(long **)(param_3 + 0x18);
  lVar15 = *param_5;
  lVar8 = *param_6;
  puVar9 = (uint *)*in_stack_00000028;
  local_58 = in_XMM6_Da;
  func_0x000145bbd970(param_1,param_2,0x145f49705,&local_288,0xe);
  if (local_288 == -2) {
    local_68 = CONCAT44(uStack_27c,uStack_280);
    if (local_68 != -1) {
      uVar12 = func_0x000145bdb8d0();
      if (local_68 != 0) {
        func_0x0001400021d0();
      }
      if ((uVar12 & 1) == 0) {
        uVar18 = 1;
        uVar17 = 1;
        uVar19 = (undefined4)(uVar12 >> 0x20);
        goto joined_r0x000140c14b83;
      }
    }
  }
  else if ((local_288 != -1) && (local_288 != 0)) {
    func_0x0001400021d0();
  }
  uVar19 = 0x40e00000;
  uVar18 = 0;
  uVar17 = 0;
joined_r0x000140c14b83:
  if (plVar14 == (long *)0x0) {
    plVar14 = plVar2;
    uVar17 = uVar18;
  }
  lVar16 = plVar14[2];
  if ((ulong)(*plVar14 - lVar16) < 0x10) {
    func_0x000145bfa970(lVar16,plVar14,lVar16,plVar14,0x10,1);
  }
  lVar6 = plVar14[1];
  *(undefined8 *)(lVar6 + lVar16) = 0x1409d41a0;
  *(undefined4 *)(lVar6 + 8 + lVar16) = uVar19;
  *(undefined1 *)(lVar6 + 0xc + lVar16) = uVar17;
  lVar6 = lVar16 + 0x10;
  plVar14[2] = lVar6;
  uVar19 = 0;
  uVar20 = 0;
  uVar21 = 0;
  uVar22 = 0;
  uStack_26c = 0;
  uStack_268 = 0;
  uStack_264 = 0;
  uStack_260 = 0;
  local_25c = 0;
  uStack_258 = 0;
  uStack_254 = 0;
  uStack_250 = 0;
  local_24c = 0;
  local_a8 = (uint)(byte)local_a8;
  uStack_a4 = 0;
  uStack_a0 = 0;
  uStack_9c = 0;
  uStack_98 = 0;
  uStack_94._0_1_ = 0;
  uVar17 = (undefined1)uStack_94;
  uStack_94._1_3_ = 0;
  uVar10 = uStack_94._1_3_;
  uStack_94._0_1_ = 0;
  uStack_94._1_3_ = 0;
  uStack_90 = 0;
  uStack_8c = uStack_8c & 0xffffff00;
  if ((ulong)(*plVar14 - lVar6) < 0x108) {
    uStack_94._0_1_ = uVar17;
    uStack_94._1_3_ = uVar10;
    func_0x000145bfa970();
  }
  lVar7 = plVar14[1];
  *(undefined8 *)(lVar7 + 0x10 + lVar16) = 0x1409d4140;
  *(undefined8 *)(lVar7 + 0x18 + lVar16) = 0;
  *(undefined8 *)(lVar7 + 0x28 + lVar16) = 0;
  *(undefined4 *)(lVar7 + 0x50 + lVar16) = 0;
  *(undefined4 *)(lVar7 + 0x58 + lVar16) = 0;
  *(undefined4 *)(lVar7 + 0x60 + lVar16) = 0;
  *(undefined4 *)(lVar7 + 0x68 + lVar16) = 0;
  puVar3 = (undefined4 *)(lVar7 + 0x8c + lVar6);
  *puVar3 = uStack_258;
  puVar3[1] = uStack_254;
  puVar3[2] = uStack_250;
  puVar3[3] = local_24c;
  puVar1 = (undefined8 *)(lVar7 + 0x7c + lVar6);
  *puVar1 = CONCAT44(uStack_264,uStack_268);
  puVar1[1] = CONCAT44(local_25c,uStack_260);
  puVar1 = (undefined8 *)(lVar7 + 0x6c + lVar6);
  *puVar1 = CONCAT44(uStack_274,local_278);
  puVar1[1] = CONCAT44(uStack_26c,local_270);
  plVar2 = (long *)(lVar7 + 0x5c + lVar6);
  *plVar2 = local_288;
  plVar2[1] = CONCAT44(uStack_27c,uStack_280);
  puVar3 = (undefined4 *)(lVar7 + 0x9c + lVar6);
  *puVar3 = uVar19;
  puVar3[1] = uVar20;
  puVar3[2] = uVar21;
  puVar3[3] = uVar22;
  puVar3 = (undefined4 *)(lVar7 + 0xac + lVar6);
  *puVar3 = uVar19;
  puVar3[1] = uVar20;
  puVar3[2] = uVar21;
  puVar3[3] = uVar22;
  puVar3 = (undefined4 *)(lVar7 + 0xbc + lVar6);
  *puVar3 = uVar19;
  puVar3[1] = uVar20;
  puVar3[2] = uVar21;
  puVar3[3] = uVar22;
  *(undefined4 *)(lVar7 + 0xdc + lVar16) = 0x4001c71c;
  puVar3 = (undefined4 *)(lVar7 + 0xd0 + lVar6);
  *puVar3 = uVar19;
  puVar3[1] = uVar20;
  puVar3[2] = uVar21;
  puVar3[3] = uVar22;
  *(undefined8 *)(lVar7 + 0xdd + lVar6) = 0;
  puVar4 = (uint *)(lVar7 + 0xe5 + lVar6);
  *puVar4 = local_a8;
  puVar4[1] = uStack_a4;
  puVar4[2] = uStack_a0;
  puVar4[3] = uStack_9c;
  puVar1 = (undefined8 *)(lVar7 + 0xf2 + lVar6);
  *puVar1 = CONCAT17((undefined1)uStack_94,CONCAT43(uStack_98,uStack_9c._1_3_));
  puVar1[1] = CONCAT17((undefined1)uStack_8c,CONCAT43(uStack_90,uStack_94._1_3_));
  plVar14[2] = lVar16 + 0x118;
  func_0x000141c88cf0(local_a8,_DAT_145f3df30,_DAT_145f3df34);
  func_0x0001408e7e80();
  uStack_94 = 0;
  uStack_90 = 0;
  uStack_8c = 0;
  uStack_88 = uStack_88 & 0xffffff00;
  local_288 = CONCAT44(uVar19,(undefined4)local_288);
  uStack_264 = uStack_264 & 0xffffff00;
  lVar16 = plVar14[2];
  uStack_280 = uVar20;
  uStack_27c = uVar21;
  local_278 = uVar22;
  uStack_274 = uVar19;
  local_270 = uVar20;
  uStack_26c = uVar21;
  uStack_268 = uVar22;
  if ((ulong)(*plVar14 - lVar16) < 0x10c) {
    func_0x000145bfa970();
  }
  lVar6 = plVar14[1];
  *(undefined8 *)(lVar6 + lVar16) = 0x1409d41e0;
  *(undefined4 *)(lVar6 + 8 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0x14 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0x1c + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0x3c + lVar16) = 0;
  puVar1 = (undefined8 *)(lVar6 + 0x40 + lVar16);
  *puVar1 = CONCAT44(uStack_a4,local_a8);
  puVar1[1] = CONCAT44(uStack_9c,uStack_a0);
  puVar1 = (undefined8 *)(lVar6 + 0x50 + lVar16);
  *puVar1 = CONCAT44(uStack_94,uStack_98);
  puVar1[1] = CONCAT44(uStack_8c,uStack_90);
  *(undefined1 *)(lVar6 + 0x60 + lVar16) = (undefined1)uStack_88;
  *(undefined1 *)(lVar6 + 100 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0x68 + lVar16) = 0;
  *(undefined8 *)(lVar6 + 0x80 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0x88 + lVar16) = 0;
  *(undefined1 *)(lVar6 + 0x8c + lVar16) = 1;
  *(undefined4 *)(lVar6 + 0x90 + lVar16) = 0;
  *(undefined8 *)(lVar6 + 0xa8 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0xb0 + lVar16) = 0;
  *(undefined1 *)(lVar6 + 0xb4 + lVar16) = 1;
  *(undefined8 *)(lVar6 + 0xb8 + lVar16) = _DAT_145f3df40;
  *(undefined1 *)(lVar6 + 0xc0 + lVar16) = 0;
  *(undefined4 *)(lVar6 + 0xc4 + lVar16) = 0;
  puVar1 = (undefined8 *)(lVar6 + 200 + lVar16);
  *puVar1 = local_288;
  puVar1[1] = CONCAT44(uStack_27c,uStack_280);
  puVar3 = (undefined4 *)(lVar6 + 0xd8 + lVar16);
  *puVar3 = local_278;
  puVar3[1] = uStack_274;
  puVar3[2] = local_270;
  puVar3[3] = uStack_26c;
  *(ulong *)(lVar6 + 0xe5 + lVar16) =
       CONCAT17((undefined1)uStack_264,CONCAT43(uStack_268,uStack_26c._1_3_));
  uVar11 = uRam0000000145f3df58;
  puVar1 = (undefined8 *)(lVar6 + 0xf0 + lVar16);
  *puVar1 = _DAT_145f3df50;
  puVar1[1] = uVar11;
  *(undefined2 *)(lVar6 + 0x108 + lVar16) = 0;
  *(undefined8 *)(lVar6 + 0x100 + lVar16) = 0;
  *(undefined1 *)(lVar6 + 0x10a + lVar16) = 2;
  plVar14[2] = lVar16 + 0x10c;
  if ((lVar15 == 0) || (lVar8 == 0)) {
    uVar5 = *puVar9;
    cVar13 = '\x01';
    if ((1 < uVar5) && (cVar13 = '\x02', 3 < uVar5)) {
      cVar13 = (7 < uVar5) * '\x04' + '\x04';
    }
    local_d8 = _DAT_145f3df90;
    uStack_d0 = 0x42c80000;
    uStack_cc = 0x3f800000;
    uStack_c8 = 0x3f800000;
    uStack_c4 = 0x3f800000;
    local_288 = _DAT_145f3dfa0;
    uStack_280 = 0xc2c80000;
    func_0x0001407e6e70();
    uStack_27c = (undefined4)_DAT_145f47ad0;
    local_278 = (undefined4)((ulong)_DAT_145f47ad0 >> 0x20);
    uStack_274 = (undefined4)uRam0000000145f47ad8;
    local_270 = (undefined4)((ulong)uRam0000000145f47ad8 >> 0x20);
    uStack_26c = (undefined4)_DAT_145f47ae0;
    uStack_268 = (undefined4)((ulong)_DAT_145f47ae0 >> 0x20);
    uStack_264 = (uint)uRam0000000145f47ae8;
    uStack_260 = (undefined4)((ulong)uRam0000000145f47ae8 >> 0x20);
    local_25c = (undefined4)_DAT_145f47af0;
    uStack_258 = (undefined4)((ulong)_DAT_145f47af0 >> 0x20);
    uStack_254 = (undefined4)uRam0000000145f47af8;
    uStack_250 = (undefined4)((ulong)uRam0000000145f47af8 >> 0x20);
    local_24c = (undefined4)_DAT_145f47b00;
    uStack_248 = (undefined4)((ulong)_DAT_145f47b00 >> 0x20);
    uStack_244 = (undefined4)uRam0000000145f47b08;
    uStack_240 = (undefined4)((ulong)uRam0000000145f47b08 >> 0x20);
    uStack_9c._1_3_ = (undefined3)local_e8;
    uStack_98._1_3_ = (undefined3)uStack_e4;
    uStack_98 = CONCAT31(uStack_98._1_3_,(char)((uint)local_e8 >> 0x18));
    uStack_94._1_3_ = (undefined3)uStack_e0;
    uStack_94 = CONCAT31(uStack_94._1_3_,(char)((uint)uStack_e4 >> 0x18));
    uStack_90._1_3_ = (undefined3)uStack_dc;
    uStack_90 = CONCAT31(uStack_90._1_3_,(char)((uint)uStack_e0 >> 0x18));
    uStack_8c._1_3_ = (undefined3)local_d8;
    uStack_8c = CONCAT31(uStack_8c._1_3_,(char)((uint)uStack_dc >> 0x18));
    uStack_88 = (uint)((ulong)local_d8 >> 0x18);
    local_84._1_3_ = (undefined3)uStack_d0;
    local_84 = CONCAT31(local_84._1_3_,(char)((ulong)local_d8 >> 0x38));
    uStack_80 = (undefined1)((uint)uStack_d0 >> 0x18);
    uStack_7f = uStack_cc;
    local_7b = uStack_c8;
    uStack_77 = uStack_c4;
    uStack_73 = (undefined4)uStack_c0;
    uStack_6f = uStack_c0._4_4_;
    uVar11 = func_0x000144e1e910();
    lVar15 = plVar14[2];
    local_2a0 = plVar14;
    if ((ulong)(*plVar14 - lVar15) < 0x188) {
      func_0x000145bfa970();
      local_2a0 = plVar14;
    }
    lVar8 = local_2a0[1];
    *(undefined8 *)(lVar8 + lVar15) = 0x1409dcb00;
    *(undefined4 *)(lVar8 + 8 + lVar15) = 0;
    puVar1 = (undefined8 *)(lVar8 + 0xc + lVar15);
    *puVar1 = local_288;
    puVar1[1] = CONCAT44(uStack_27c,uStack_280);
    puVar1 = (undefined8 *)(lVar8 + 0x1c + lVar15);
    *puVar1 = CONCAT44(uStack_274,local_278);
    puVar1[1] = CONCAT44(uStack_26c,local_270);
    puVar1 = (undefined8 *)(lVar8 + 0x2c + lVar15);
    *puVar1 = CONCAT44(uStack_264,uStack_268);
    puVar1[1] = CONCAT44(local_25c,uStack_260);
    puVar1 = (undefined8 *)(lVar8 + 0x3c + lVar15);
    *puVar1 = CONCAT44(uStack_254,uStack_258);
    puVar1[1] = CONCAT44(local_24c,uStack_250);
    puVar1 = (undefined8 *)(lVar8 + 0x48 + lVar15);
    *puVar1 = CONCAT44(uStack_248,local_24c);
    puVar1[1] = CONCAT44(uStack_240,uStack_244);
    *(undefined4 *)(lVar8 + 0x58 + lVar15) = 0;
    *(undefined4 *)(lVar8 + 100 + lVar15) = 0;
    *(undefined8 *)(lVar8 + 0x88 + lVar15) = 0;
    *(undefined4 *)(lVar8 + 0x90 + lVar15) = 0;
    *(undefined4 *)(lVar8 + 0xac + lVar15) = 0;
    *(undefined8 *)(lVar8 + 0xf0 + lVar15) = 0xafffffffe;
    *(undefined2 *)(lVar8 + 0x108 + lVar15) = 1;
    *(undefined1 *)(lVar8 + 0x10a + lVar15) = 1;
    puVar1 = (undefined8 *)(lVar8 + 0x10b + lVar15);
    *puVar1 = CONCAT44(uStack_a4,local_a8);
    puVar1[1] = CONCAT44(uStack_9c,uStack_a0);
    puVar1 = (undefined8 *)(lVar8 + 0x11b + lVar15);
    *puVar1 = CONCAT44(uStack_94,uStack_98);
    puVar1[1] = CONCAT44(uStack_8c,uStack_90);
    puVar1 = (undefined8 *)(lVar8 + 299 + lVar15);
    *puVar1 = CONCAT44(local_84,uStack_88);
    puVar1[1] = CONCAT35((undefined3)local_7b,CONCAT41(uStack_7f,uStack_80));
    puVar1 = (undefined8 *)(lVar8 + 0x138 + lVar15);
    *puVar1 = CONCAT44(uStack_77,local_7b);
    puVar1[1] = CONCAT44(uStack_6f,uStack_73);
    *(undefined8 *)(lVar8 + 0x148 + lVar15) = 0;
    *(undefined8 *)(lVar8 + 0x150 + lVar15) = 1;
    *(undefined4 *)(lVar8 + 0x158 + lVar15) = 0x10;
    *(undefined1 *)(lVar8 + 0x15c + lVar15) = 1;
    *(undefined4 *)(lVar8 + 0x160 + lVar15) = 0x3f800000;
    *(undefined1 *)(lVar8 + 0x164 + lVar15) = 0;
    *(char *)(lVar8 + 0x168 + lVar15) = cVar13;
    *(undefined1 *)(lVar8 + 0x169 + lVar15) = 0;
    *(undefined8 *)(lVar8 + 0x16c + lVar15) = 0;
    *(undefined4 *)(lVar8 + 0x174 + lVar15) = 0x42200000;
    *(undefined8 *)(lVar8 + 0x178 + lVar15) = uVar11;
    lVar15 = lVar15 + 0x188;
  }
  else {
    uVar5 = *puVar9;
    cVar13 = '\x01';
    if ((1 < uVar5) && (cVar13 = '\x02', 3 < uVar5)) {
      cVar13 = (7 < uVar5) * '\x04' + '\x04';
    }
    local_d8 = _DAT_145f3db40;
    uStack_d0 = (undefined4)uRam0000000145f3db48;
    uStack_cc = (undefined4)((ulong)uRam0000000145f3db48 >> 0x20);
    uStack_c8 = (undefined4)_DAT_145f3df60;
    uStack_c4 = (undefined4)((ulong)_DAT_145f3df60 >> 0x20);
    uStack_c0 = uRam0000000145f3df68;
    local_e8 = 6;
    uStack_98 = (undefined4)_DAT_145f3df70;
    uStack_94 = (undefined4)((ulong)_DAT_145f3df70 >> 0x20);
    uStack_90 = 0x460cc7cd;
    local_a8 = (uint)_DAT_145e7e0b0;
    uStack_a4 = (uint)((ulong)_DAT_145e7e0b0 >> 0x20);
    uStack_a0 = (uint)uRam0000000145e7e0b8;
    uStack_9c = (uint)((ulong)uRam0000000145e7e0b8 >> 0x20);
    uStack_8c = 0x3f800000;
    uStack_88 = 0x3f800000;
    local_84 = 0x3f800000;
    local_288 = _DAT_145f3df80;
    uStack_280 = 0xc2700000;
    func_0x0001407e6e70();
    local_148 = CONCAT44(uStack_a4,local_a8);
    uStack_140 = CONCAT44(uStack_9c,uStack_a0);
    local_138 = CONCAT44(uStack_94,uStack_98);
    uStack_130 = CONCAT44(uStack_8c,uStack_90);
    local_128 = CONCAT44(local_84,uStack_88);
    uStack_120 = CONCAT35((undefined3)local_7b,CONCAT41(uStack_7f,uStack_80));
    local_118 = 0;
    local_110 = 1;
    local_108 = 0x10;
    local_104 = 1;
    local_178 = CONCAT44(uStack_e4,local_e8);
    local_168 = (undefined4)local_d8;
    uStack_164 = local_d8._4_4_;
    uStack_160 = uStack_d0;
    uStack_15c = uStack_cc;
    local_158 = uStack_c8;
    uStack_154 = uStack_c4;
    uStack_150 = (undefined4)uStack_c0;
    uStack_14c = uStack_c0._4_4_;
    local_f7 = 0;
    local_100 = 0x3f800000;
    local_fc = 0;
    local_288 = local_288 & 0xffffffff00000000;
    uStack_248 = (undefined4)_DAT_145f47b00;
    uStack_244 = (undefined4)((ulong)_DAT_145f47b00 >> 0x20);
    uStack_240 = (undefined4)uRam0000000145f47b08;
    uStack_23c = (undefined4)((ulong)uRam0000000145f47b08 >> 0x20);
    uStack_258 = (undefined4)_DAT_145f47af0;
    uStack_254 = (undefined4)((ulong)_DAT_145f47af0 >> 0x20);
    uStack_250 = (undefined4)uRam0000000145f47af8;
    local_24c = (undefined4)((ulong)uRam0000000145f47af8 >> 0x20);
    uStack_268 = (undefined4)_DAT_145f47ae0;
    uStack_264 = (uint)((ulong)_DAT_145f47ae0 >> 0x20);
    uStack_260 = (undefined4)uRam0000000145f47ae8;
    local_25c = (undefined4)((ulong)uRam0000000145f47ae8 >> 0x20);
    local_278 = (undefined4)_DAT_145f47ad0;
    uStack_274 = (undefined4)((ulong)_DAT_145f47ad0 >> 0x20);
    local_270 = (undefined4)uRam0000000145f47ad8;
    uStack_26c = (undefined4)((ulong)uRam0000000145f47ad8 >> 0x20);
    local_238 = 0;
    local_22c = 0;
    local_208 = 0;
    local_200 = 0;
    local_1e4 = 0;
    local_1a0 = 0xafffffffe;
    local_188 = 1;
    local_186 = 1;
    local_f4 = _DAT_145de2580;
    local_ec = 0x42c80000;
    local_f8 = cVar13;
    func_0x0001408f09d0();
    func_0x000145bb9990();
    if (local_288 != 0xffffffffffffffff) {
      if (local_288 != 0) {
        func_0x0001400021d0();
      }
      plVar14 = local_2a0;
      if (local_2a0 == (long *)0x0) {
        plVar14 = local_298;
      }
      lVar15 = plVar14[2];
      if ((ulong)(*plVar14 - lVar15) < 0x18) {
        func_0x000145bfa970(lVar15,plVar14,lVar15,plVar14,0x18,1);
      }
      lVar8 = plVar14[1];
      *(undefined8 *)(lVar8 + lVar15) = 0x1409e8f30;
      *(undefined8 *)(lVar8 + 8 + lVar15) = local_2b8;
      *(undefined1 *)(lVar8 + 0x10 + lVar15) = 0;
      plVar14[2] = lVar15 + 0x18;
    }
    func_0x000145bb9990();
    if (local_288 != 0xffffffffffffffff) {
      if (local_288 == 0) {
        return;
      }
      func_0x0001400021d0();
      return;
    }
    if (local_2a0 == (long *)0x0) {
      local_2a0 = local_298;
    }
    lVar15 = local_2a0[2];
    if ((ulong)(*local_2a0 - lVar15) < 0x30) {
      func_0x000145bfa970(lVar15,local_2a0,lVar15,local_2a0,0x30,1);
    }
    lVar8 = local_2a0[1];
    *(undefined8 *)(lVar8 + lVar15) = 0x1409e61b0;
    *(undefined4 *)(lVar8 + 8 + lVar15) = 2;
    *(undefined1 *)(lVar8 + 0x24 + lVar15) = 0;
    *(undefined8 *)(lVar8 + 0x28 + lVar15) = local_2b8;
    lVar15 = lVar15 + 0x30;
  }
  local_2a0[2] = lVar15;
  return;
}
