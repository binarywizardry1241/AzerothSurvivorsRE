
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long *plVar1;
  ulong *puVar2;
  undefined4 *puVar3;
  char cVar4;
  code *pcVar5;
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  byte bVar11;
  int iVar12;
  long lVar13;
  undefined8 *puVar14;
  ulong uVar15;
  undefined8 *puVar16;
  float *pfVar17;
  undefined8 *in_RCX;
  long lVar18;
  ulong uVar19;
  ulong uVar20;
  float *pfVar21;
  byte *pbVar22;
  ulong uVar23;
  ulong uVar24;
  char *pcVar25;
  long lVar26;
  undefined8 *puVar27;
  byte *pbVar28;
  ulong uVar29;
  long lVar30;
  undefined8 *puVar31;
  ulong uVar32;
  byte bVar33;
  byte bVar34;
  long lVar35;
  undefined8 *puVar36;
  float fVar37;
  float fVar38;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float extraout_XMM0_Da_01;
  float extraout_XMM0_Da_02;
  undefined4 extraout_XMM0_Da_03;
  float fVar39;
  float extraout_XMM0_Da_04;
  float extraout_XMM0_Da_05;
  float extraout_XMM0_Da_06;
  undefined8 uVar40;
  undefined8 uVar41;
  undefined4 extraout_XMM0_Dc;
  undefined4 extraout_XMM0_Dc_00;
  undefined4 extraout_XMM0_Dd;
  float fVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  undefined4 in_XMM6_Da;
  undefined4 uVar46;
  undefined4 uVar47;
  float fVar48;
  undefined4 uVar49;
  undefined4 uVar50;
  float fVar51;
  float fVar52;
  undefined4 uVar53;
  undefined4 uVar54;
  float fVar55;
  uint uVar56;
  uint uVar57;
  float fVar58;
  float fVar59;
  undefined8 in_XMM7_Qa;
  undefined1 auVar60 [16];
  float fVar63;
  undefined1 auVar61 [16];
  undefined1 auVar62 [16];
  uint uVar64;
  uint uVar65;
  float fVar66;
  undefined4 uVar67;
  undefined4 uVar68;
  uint uVar69;
  uint uVar70;
  float fVar71;
  float fVar72;
  undefined4 uVar73;
  undefined4 uVar74;
  undefined4 uVar75;
  undefined4 uVar76;
  undefined4 uVar77;
  undefined4 uVar78;
  float fVar79;
  float fVar80;
  float fVar81;
  float fVar82;
  float fVar83;
  float fVar84;
  float fVar85;
  float fVar86;
  float fVar87;
  float fVar88;
  undefined1 auVar89 [16];
  undefined4 uStack_264;
  undefined4 uStack_260;
  undefined4 uStack_21c;
  undefined1 local_218 [16];
  ulong local_208;
  undefined8 *local_200;
  long local_1f8;
  undefined8 *local_1f0;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined1 local_1d0 [16];
  undefined8 *local_1c0;
  undefined8 *local_1b8;
  float local_1ac;
  long *local_1a8;
  ulong local_1a0;
  undefined4 local_198;
  undefined4 uStack_194;
  undefined4 uStack_190;
  undefined4 uStack_18c;
  undefined1 *local_188;
  undefined8 *local_178;
  float local_16c;
  undefined8 local_168;
  undefined8 uStack_160;
  undefined8 local_158;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 *local_120;
  undefined8 *local_118;
  undefined1 local_109;
  undefined8 *local_108;
  float *local_100;
  undefined8 *local_f8;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined8 local_d8;
  
  local_f0 = 0xfffffffffffffffe;
  *(undefined1 *)((long)in_RCX + 0xd57) = 1;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Qa;
  func_0x000145bfae00();
  local_108 = in_RCX;
  if (*(char *)((long)in_RCX + 0xd4c) != '\0') {
    bVar11 = *(char *)((long)in_RCX + 0x354) - 2;
    if (bVar11 < 10) {
      lVar26 = *(long *)((ulong)bVar11 * 8 + 0x14732df28);
    }
    else {
      lVar26 = 0x146fdb2c0;
    }
    local_148 = *(undefined8 **)(lVar26 + 0x30);
    uStack_140 = local_148 + *(long *)(lVar26 + 0x38) * 2;
    local_138 = in_RCX;
    func_0x000145ca7cd0();
    puVar27 = in_RCX + 0x6e;
    if (in_RCX[0x6e] != 0) {
      func_0x0001400021d0();
    }
    puVar27[2] = local_158;
    *(int *)puVar27 = (int)local_168;
    *(undefined4 *)((long)puVar27 + 4) = local_168._4_4_;
    *(undefined4 *)(puVar27 + 1) = (undefined4)uStack_160;
    *(float *)((long)puVar27 + 0xc) = uStack_160._4_4_;
    func_0x000145b9de40();
    local_178 = local_148;
    local_118 = uStack_140;
    if (local_138 != (undefined8 *)0x0) {
      puVar14 = uStack_140 + (long)local_138 * 2;
      local_f8 = in_RCX + 0x112;
      local_100 = (float *)(in_RCX + 0x16);
      lVar26 = 0x146fdc818;
      uVar46 = 0;
      uVar49 = 0;
      uVar53 = 0;
      uVar56 = 0;
      uVar64 = (uint)_DAT_1461b2190;
      uVar67 = (undefined4)((ulong)_DAT_1461b2190 >> 0x20);
      puVar27 = uStack_140;
      uVar70 = _DAT_1461b21a0;
      uVar74 = uRam00000001461b21a4;
      uVar76 = uRam00000001461b21a8;
      uVar78 = uRam00000001461b21ac;
      uVar40 = _DAT_1461b2180;
      do {
        local_168 = (undefined8 *)*puVar27;
        puVar31 = (undefined8 *)puVar27[1];
        puVar27 = puVar27 + 2;
        lVar35 = 0;
        uVar47 = uVar46;
        uVar50 = uVar49;
        uVar54 = uVar53;
        uVar57 = uVar56;
        uVar65 = uVar64;
        uVar68 = uVar67;
        uVar69 = uVar70;
        uVar73 = uVar74;
        uVar75 = uVar76;
        uVar77 = uVar78;
        uStack_160 = puVar31;
        while ((*(undefined8 **)(lVar35 + 8 + lVar26) != puVar31 ||
               (iVar12 = func_0x000146005051(), iVar12 != 0))) {
          lVar35 = lVar35 + 0x78;
          if (lVar35 == 0x34f8) {
            local_148 = &local_168;
            uStack_140 = (undefined8 *)0x1400020c0;
            func_0x0001461ae2d0();
            goto LAB_145b1b55e;
          }
        }
        lVar35 = lVar35 + lVar26;
        uStack_264 = (undefined4)uVar40;
        uStack_260 = (undefined4)((ulong)uVar40 >> 0x20);
        uVar46 = uVar47;
        uVar49 = uVar50;
        uVar53 = uVar54;
        uVar56 = uVar57;
        uVar64 = uVar65;
        uVar67 = uVar68;
        uVar70 = uVar69;
        uVar74 = uVar73;
        uVar76 = uVar75;
        uVar78 = uVar77;
        func_0x000145bd26e0();
        puVar31 = local_108;
        lVar13 = local_108[0x18];
        if (lVar13 == local_108[0x16]) {
          func_0x0001460359e0();
        }
        lVar30 = puVar31[0x17];
        lVar18 = lVar13 * 0x60;
        *(ulong *)(lVar30 + 0x50 + lVar18) = CONCAT44(uStack_21c,uVar77);
        plVar1 = (long *)(lVar30 + 0x40 + lVar18);
        *plVar1 = (ulong)uVar69 << 0x20;
        plVar1[1] = CONCAT44(uVar75,uVar73);
        puVar2 = (ulong *)(lVar30 + 0x30 + lVar18);
        *puVar2 = (ulong)uVar57;
        puVar2[1] = CONCAT44(uVar68,uVar65);
        puVar36 = (undefined8 *)(lVar30 + 0x20 + lVar18);
        *puVar36 = CONCAT44(uVar47,uVar68);
        puVar36[1] = CONCAT44(uVar54,uVar50);
        puVar36 = (undefined8 *)(lVar30 + 0x10 + lVar18);
        *puVar36 = CONCAT44(0x3f800000,uStack_260);
        puVar36[1] = (ulong)uVar65 << 0x20;
        plVar1 = (long *)(lVar30 + lVar18);
        *plVar1 = lVar35;
        *(undefined4 *)(plVar1 + 1) = 1;
        *(undefined4 *)((long)plVar1 + 0xc) = uStack_264;
        *(undefined4 *)(lVar30 + 0x58 + lVar18) = 0;
        puVar31[0x18] = lVar13 + 1;
      } while (puVar27 != puVar14);
    }
    if (local_178 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    func_0x000145b87d50();
    func_0x000145aaef50();
    func_0x000145b64b60();
    func_0x000145b64b60();
    func_0x000145b64b60();
    func_0x000145b64b60();
    func_0x000145b64b60();
  }
  lVar35 = func_0x000145aaef50();
  lVar35 = lVar35 * 0xf0;
  puVar27 = (undefined8 *)(lVar35 + 0x146fd8f78);
  uStack_160 = (undefined8 *)0x1400020c0;
  local_168 = puVar27;
  func_0x000145fd7da0(puVar27,lVar35,0x146fccf3e,&local_148,&local_168);
  lVar26 = *(long *)(lVar35 + 0x146fd8f88);
  local_f8 = uStack_140;
  lVar13 = func_0x000145bbff50();
  lVar35 = lVar35 + 0x146fd8f70;
  if (local_148 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  local_f8 = (undefined8 *)lVar13;
  if (lVar13 == 0) {
    local_f8 = (undefined8 *)lVar26;
  }
  func_0x000145bbff50();
  uStack_160 = (undefined8 *)0x1400020c0;
  local_168 = puVar27;
  func_0x000145fd7da0();
  uVar40 = *(undefined8 *)(lVar35 + 0x28);
  uVar41 = *(undefined8 *)(lVar35 + 0x30);
  local_100 = (float *)uStack_140;
  local_1d0 = func_0x000145bbff50(uVar40,uVar41,local_138);
  if (local_148 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  auVar89._8_8_ = uVar41;
  auVar89._0_8_ = uVar40;
  if (local_1d0._0_8_ == 0) {
    local_1d0 = auVar89;
  }
  local_148 = (undefined8 *)0x14732bb99;
  uStack_140 = (undefined8 *)0x8;
  local_138 = (undefined8 *)local_1d0;
  uStack_130 = 0x14732ad60;
  func_0x000145bc0330();
  local_f8 = (undefined8 *)CONCAT44(uStack_18c,uStack_190);
  func_0x000145c65190();
  puVar27 = local_108;
  local_1b8 = local_108 + 0xce;
  lVar26 = local_108[0xd0];
  if (lVar26 == local_108[0xce]) {
    func_0x000146006460();
  }
  lVar35 = puVar27[0xcf];
  puVar3 = (undefined4 *)(lVar35 + 0x10 + lVar26 * 0x20);
  *puVar3 = (undefined4)local_158;
  puVar3[1] = local_158._4_4_;
  puVar3[2] = uStack_150;
  puVar3[3] = uStack_14c;
  puVar3 = (undefined4 *)(lVar35 + lVar26 * 0x20);
  *puVar3 = (int)local_168;
  puVar3[1] = local_168._4_4_;
  puVar3[2] = (undefined4)uStack_160;
  puVar3[3] = uStack_160._4_4_;
  puVar27[0xd0] = lVar26 + 1;
  if (CONCAT44(uStack_194,local_198) != 0) {
    func_0x0001400021d0();
  }
  if (*(char *)((long)puVar27 + 0x36f) != '\0') {
    func_0x000145be05e0();
    pbVar28 = (byte *)puVar27[0x107];
    pbVar22 = pbVar28 + puVar27[0x108];
    while (pbVar28 != pbVar22) {
      bVar11 = *pbVar28;
      auVar9._8_8_ = *(undefined8 *)((ulong)((uint)bVar11 * 8) + 0x14732de50);
      auVar9._0_8_ = *(undefined8 *)((ulong)((uint)bVar11 * 8) + 0x14732de68);
      auVar89 = func_0x000145bbff50();
      if (auVar89._0_8_ == 0) {
        auVar89 = auVar9;
      }
      auVar10._8_8_ = *(undefined8 *)((ulong)bVar11 * 8 + 0x14732de80);
      auVar10._0_8_ = *(undefined8 *)((ulong)bVar11 * 8 + 0x14732de98);
      local_218 = auVar89;
      auVar89 = func_0x000145bbff50();
      if (auVar89._0_8_ == 0) {
        auVar89 = auVar10;
      }
      local_148 = (undefined8 *)local_218;
      uStack_140 = (undefined8 *)0x1400020c0;
      local_138 = (undefined8 *)local_1d0;
      uStack_130 = 0x1400020c0;
      local_1d0 = auVar89;
      func_0x000145fd7da0();
      puVar27 = local_158;
      if ((undefined8 *)(CONCAT44(uStack_194,local_198) - (long)local_188) < local_158) {
        local_100 = (float *)uStack_160;
        local_f8 = local_168;
        func_0x000146005df0();
        puVar14 = local_f8;
LAB_145b1934e:
        func_0x00014600504b();
      }
      else {
        puVar14 = local_168;
        if (local_158 != (undefined8 *)0x0) goto LAB_145b1934e;
      }
      pbVar28 = pbVar28 + 1;
      local_188 = local_188 + (long)puVar27;
      if (puVar14 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
    }
    local_168 = (undefined8 *)&local_198;
    uStack_160 = (undefined8 *)0x1400020e0;
    func_0x000145fd7da0();
    local_f8 = local_148;
    local_100 = (float *)uStack_140;
    func_0x000145c6a5f0();
    puVar27 = local_108;
    lVar26 = local_108[0xd0];
    if (lVar26 == local_108[0xce]) {
      func_0x000146006460();
    }
    lVar35 = puVar27[0xcf];
    puVar3 = (undefined4 *)(lVar35 + 0x10 + lVar26 * 0x20);
    *puVar3 = (undefined4)local_138;
    puVar3[1] = local_138._4_4_;
    puVar3[2] = (undefined4)uStack_130;
    puVar3[3] = uStack_130._4_4_;
    puVar3 = (undefined4 *)(lVar35 + lVar26 * 0x20);
    *puVar3 = (int)local_148;
    puVar3[1] = local_148._4_4_;
    puVar3[2] = (undefined4)uStack_140;
    puVar3[3] = uStack_140._4_4_;
    puVar27[0xd0] = lVar26 + 1;
    if (local_f8 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    if (CONCAT44(uStack_194,local_198) != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x000140002200();
  puVar14 = (undefined8 *)func_0x0001400021c0();
  if (puVar14 == (undefined8 *)0x0) {
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  *(undefined1 *)puVar14 = 0x7b;
  local_148 = (undefined8 *)0x1;
  local_138 = (undefined8 *)0x1;
  uStack_130 = CONCAT71(uStack_130._1_7_,1);
  puVar31 = (undefined8 *)&DAT_00000004;
  uStack_140 = puVar14;
  func_0x000145b9b7a0();
  puVar14 = local_158;
  if (local_168 == local_158) {
    puVar31 = (undefined8 *)0x1;
    func_0x000146005df0();
  }
  local_f8 = local_168;
  local_100 = (float *)uStack_160;
  *(undefined1 *)((long)uStack_160 + (long)puVar14) = 0x7d;
  local_1c0 = puVar27 + 0xd1;
  lVar26 = puVar27[0xd3];
  if (lVar26 == puVar27[0xd1]) {
    func_0x0001460061c0();
  }
  lVar35 = puVar27[0xd2];
  *(undefined8 **)(lVar35 + lVar26 * 0x18) = local_f8;
  *(float **)(lVar35 + 8 + lVar26 * 0x18) = local_100;
  *(undefined1 **)(lVar35 + 0x10 + lVar26 * 0x18) = (undefined1 *)((long)puVar14 + 1);
  puVar27[0xd3] = lVar26 + 1;
  func_0x000145b3e1b0();
  if (*(char *)((long)puVar27 + 0xd4c) != '\0') {
    func_0x000145b9e5f0();
    local_100 = (float *)local_148;
    local_f8 = uStack_140;
    if (local_138 != (undefined8 *)0x0) {
      lVar26 = (long)local_138 << 3;
      lVar35 = 0;
      do {
        if (*(char *)(*(long *)((long)local_f8 + lVar35) + 0x39) != '\0') {
          func_0x000145b7ae40();
        }
        lVar35 = lVar35 + 8;
      } while (lVar26 != lVar35);
    }
    if (local_100 != (float *)0x0) {
      func_0x0001400021d0();
    }
  }
  func_0x000145b4da20();
  local_148 = (undefined8 *)((ulong)local_148 & 0xffffffff00000000);
  func_0x000145b51390();
  local_148 = (undefined8 *)((ulong)local_148 & 0xffffffff00000000);
  func_0x000145b51390();
  local_148 = (undefined8 *)((ulong)local_148 & 0xffffffff00000000);
  func_0x000145b51390();
  local_148 = (undefined8 *)((ulong)local_148 & 0xffffffff00000000);
  func_0x000145b51390();
  uVar23 = 2;
  if (*(char *)((long)puVar27 + 0xd52) == '\0') goto LAB_145b197c0;
  uVar24 = 0;
  uVar23 = (puVar27[0x146] + 1) - puVar27[0x18d];
  if (puVar27[0x146] + 1 < (ulong)puVar27[0x18d]) {
    uVar23 = uVar24;
  }
  fVar37 = ((float)(long)(uVar23 + (uVar23 == 0)) + _DAT_1461b26b4) * _DAT_1461b21b4 +
           _DAT_1461b2200;
  fVar37 = (float)func_0x0001460050ab(fVar37 + fVar37);
  uVar20 = (long)(fVar37 - _DAT_1461bdb9c) & (long)fVar37 >> 0x3f | (long)fVar37;
  if (fVar37 < 0.0) {
    uVar20 = uVar24;
  }
  uVar23 = 0xffffffffffffffff;
  if (fVar37 <= _DAT_1461bdba0) {
    uVar23 = uVar20;
  }
  for (; uVar23 != 0; uVar23 = uVar23 - 1) {
LAB_145b197c0:
    func_0x000145b51dc0();
    puVar31 = &local_148;
    func_0x000145b58cc0();
  }
  uVar23 = func_0x000145cbf9d0();
  lVar26 = func_0x000145aaef50();
  lVar26 = *(long *)(lVar26 * 0xf0 + 0x146fd8ff8);
  fVar37 = _DAT_14732a7e0;
  if (lVar26 != -0x1a0) {
    fVar37 = *(float *)(lVar26 + 0x1f0) * _DAT_1461c0c20;
  }
  if ((long)uVar23 < 0) {
    fVar38 = (float)uVar23;
    local_108[0x105] = 0;
    if (uVar23 == 0) goto LAB_145b19a15;
LAB_145b19893:
    fVar37 = fVar37 / fVar38;
    uVar24 = 0;
    puVar27 = local_108;
    fVar38 = _DAT_14732a7e4;
    fVar52 = _DAT_1461b26f0;
    fVar55 = _DAT_1461b2200;
    fVar71 = _DAT_1461b26b4;
    do {
      uVar20 = puVar27[0x17f];
      uVar15 = puVar27[0x180];
      uVar29 = puVar27[0x182];
      uVar19 = puVar27[0x181];
      do {
        lVar26 = ((uVar20 + uVar29) * 0x800000 | uVar20 + uVar29 >> 0x29) + uVar20;
        uVar32 = uVar15 << 0x11;
        uVar19 = uVar19 ^ uVar20;
        uVar29 = uVar29 ^ uVar15;
        uVar15 = uVar15 ^ uVar19;
        uVar20 = uVar20 ^ uVar29;
        uVar19 = uVar19 ^ uVar32;
        uVar29 = uVar29 << 0x2d | uVar29 >> 0x13;
        auVar62._0_4_ = (float)((uint)((ulong)lVar26 >> 0x29) | 0x3f800000);
        puVar31 = (undefined8 *)(ulong)(uint)auVar62._0_4_;
        auVar62._0_4_ = (auVar62._0_4_ + fVar71) * fVar38 + fVar52;
      } while (fVar55 <= auVar62._0_4_);
      if ((long)uVar24 < 0) {
        puVar31 = (undefined8 *)(uVar24 >> 1);
      }
      fVar66 = (float)uVar24;
      puVar27[0x17f] = uVar20;
      puVar27[0x182] = uVar29;
      puVar27[0x180] = uVar15;
      puVar27[0x181] = uVar19;
      if (uVar24 == puVar27[0x103]) {
        func_0x000146035a50();
      }
      lVar26 = puVar27[0x104];
      *(float *)(lVar26 + uVar24 * 8) = fVar66 * fVar37;
      *(float *)(lVar26 + 4 + uVar24 * 8) = auVar62._0_4_ * fVar37 + fVar66 * fVar37;
      uVar24 = uVar24 + 1;
      puVar27[0x105] = uVar24;
    } while (uVar24 != uVar23);
    cVar4 = *(char *)((long)puVar27 + 0xd4c);
  }
  else {
    fVar38 = (float)(long)uVar23;
    local_108[0x105] = 0;
    if (uVar23 != 0) goto LAB_145b19893;
LAB_145b19a15:
    cVar4 = *(char *)((long)local_108 + 0xd4c);
  }
  if (cVar4 == '\0') {
    lVar26 = func_0x000145aaef50();
    lVar35 = lVar26 * 0xf0;
    pcVar25 = (char *)(lVar35 + 0x146fd8f70);
    if (lVar26 == 0xb) {
      if (0x7ffffffffffffff8 < (ulong)((long)puRam0000000146fd9a10 * 8)) {
LAB_145b19a6f:
        func_0x0001461add5b();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      if ((long)puRam0000000146fd9a10 * 8 == 0) {
        puVar16 = (undefined8 *)0x8;
        puVar14 = (undefined8 *)0x0;
        puVar36 = puRam0000000146fd9a10;
      }
      else {
        puVar14 = puRam0000000146fd9a10;
        func_0x000140002200();
        puVar16 = (undefined8 *)func_0x0001400021c0();
        puVar36 = puVar14;
        if (puVar16 == (undefined8 *)0x0) goto LAB_145b19a6f;
      }
      puVar27 = local_108;
      local_168 = puVar14;
      uStack_160 = puVar16;
      uVar46 = func_0x00014600504b();
      local_158 = puVar36;
LAB_145b1a8b9:
      pfVar17 = (float *)(pcVar25 + 0xd8);
      if (*pcVar25 != '\0') {
        pfVar17 = (float *)(pcVar25 + 4);
      }
      fVar37 = *pfVar17;
      lVar26 = puVar27[0x17e];
      fVar38 = (float)*(undefined8 *)(pcVar25 + 200);
      fVar52 = (float)((ulong)*(undefined8 *)(pcVar25 + 200) >> 0x20);
      fVar55 = 0.0;
      fVar71 = 0.0;
      uVar23 = func_0x000145bee7c0(uVar46,fVar38,fVar52);
      local_1a8 = (long *)CONCAT44(local_1a8._4_4_,extraout_XMM0_Da_03);
      if ((uVar23 & 1) == 0) {
        if (*(long *)(lVar26 + 0x68) == -1) {
LAB_145b1a933:
          uVar46 = *(undefined4 *)(lVar26 + 0xb8);
        }
        else {
          func_0x000145bf1d00();
          if ((int)local_148 != 1) goto LAB_145b1a933;
          uVar46 = uStack_140._4_4_;
        }
        local_1a8 = (long *)CONCAT44(local_1a8._4_4_,uVar46);
      }
      fVar39 = _DAT_1461b21b4 * fVar37;
      local_1f0 = local_108 + 0xd7;
      local_1ac = *(float *)(pcVar25 + 0xd4) + _DAT_14627e708;
      local_1f8 = *(long *)(pcVar25 + 0x38);
      local_200 = uStack_160;
      puVar27 = (undefined8 *)(*(long *)(pcVar25 + 0x40) << 4);
      fVar72 = 0.0;
      fVar85 = 0.0;
      fVar86 = 0.0;
      fVar87 = 0.0;
      fVar88 = 0.0;
      uVar23 = 0;
      auVar62._0_4_ = fVar39;
      fVar66 = _DAT_14732a800;
      fVar48 = fRam000000014732a804;
      fVar59 = fRam000000014732a808;
      fVar51 = fRam000000014732a80c;
      fVar63 = _DAT_1461bdb9c;
      fVar58 = _DAT_1461bdba0;
      local_178 = puVar27;
      while (uVar23 < 4) {
        local_208 = uVar23 + 1;
        fVar79 = (float)(long)uVar23 * _DAT_1461ba348 * _DAT_1461b21b0 + local_1ac;
        puVar14 = (undefined8 *)0x0;
        do {
          puVar36 = puVar14;
          local_1a0 = uVar23;
          if (puVar27 == puVar36) goto LAB_145b1aae5;
          puVar14 = puVar36 + 2;
        } while (*(ulong *)(local_1f8 + (long)puVar36) != uVar23);
        local_1e8 = *(undefined8 *)(local_1f8 + -8 + (long)(puVar36 + 2));
        lVar26 = local_108[0x17e];
        uStack_1e0 = 0;
        uVar23 = func_0x000145bee7c0(auVar62._0_4_,(int)local_1e8,(int)((ulong)local_1e8 >> 0x20));
        local_16c = extraout_XMM0_Da_04;
        if ((uVar23 & 1) == 0) {
          if (*(long *)(lVar26 + 0x68) != -1) {
            func_0x000145bf1d00();
            if ((int)local_148 == 1) {
              local_16c = uStack_140._4_4_;
              goto LAB_145b1aae5;
            }
          }
          local_16c = *(float *)(lVar26 + 0xb8);
        }
LAB_145b1aae5:
        local_138 = _DAT_14732a7f0;
        uStack_130 = lRam000000014732a7f8;
        local_128 = CONCAT44(local_128._4_4_,0x3ec28f5c);
        uVar40 = func_0x00014600509f(fVar79);
        uVar41 = func_0x00014600508d(fVar79);
        fVar79 = (float)uVar41;
        local_100 = (float *)0x0;
        local_118 = puVar36;
LAB_145b1ab3e:
        fVar84 = (float)((ulong)uVar41 >> 0x20);
        auVar62._0_4_ = (float)uVar41;
        fVar80 = (float)local_1e8;
        fVar81 = local_1e8._4_4_;
        fVar82 = local_16c;
        if (local_100 == (float *)0x5) {
          if (puVar27 != puVar36) goto LAB_145b1b340;
          fVar80 = (float)uVar40 * fVar39 + fVar38;
          fVar81 = fVar79 * fVar39 + fVar52;
          lVar26 = local_108[0x17e];
          uVar23 = func_0x000145bee7c0(auVar62._0_4_,fVar80,fVar81);
          auVar62._0_4_ = extraout_XMM0_Da_06;
          fVar82 = extraout_XMM0_Da_06;
          if ((uVar23 & 1) != 0) goto LAB_145b1b340;
          if (*(long *)(lVar26 + 0x68) != -1) {
            auVar62._0_4_ = (float)func_0x000145bf1d00();
            if ((int)local_148 == 1) {
              fVar82 = uStack_140._4_4_;
              goto LAB_145b1b340;
            }
          }
          fVar82 = *(float *)(lVar26 + 0xb8);
          goto LAB_145b1b340;
        }
        if (puVar27 != puVar36) goto LAB_145b1b340;
        auVar62._0_4_ = *(float *)((long)&local_138 + (long)local_100 * 4) * fVar37;
        local_100 = (float *)((long)local_100 + 1);
        fVar80 = auVar62._0_4_ * (float)uVar40 + fVar38;
        fVar81 = auVar62._0_4_ * fVar79 + fVar52;
        fVar82 = (float)((ulong)uVar40 >> 0x20) * 0.0 + fVar55;
        fVar83 = fVar84 * 0.0 + fVar71;
        lVar26 = local_108[0x17e];
        if (*(long *)(lVar26 + 0x40) != -1) {
          fVar45 = *(float *)(lVar26 + 100);
          auVar62._0_4_ = (fVar81 + _DAT_146218684) - fVar45;
          uVar23 = (long)(auVar62._0_4_ - fVar63) & (long)auVar62._0_4_ >> 0x3f |
                   (long)auVar62._0_4_;
          if (auVar62._0_4_ < fVar72) {
            uVar23 = 0;
          }
          if (fVar58 < auVar62._0_4_) {
            uVar23 = 0xffffffffffffffff;
          }
          fVar42 = (fVar81 + fVar66) - fVar45;
          fVar43 = (fVar81 + fVar48) - fVar45;
          fVar44 = (fVar81 + fVar59) - fVar45;
          fVar45 = (fVar81 + fVar51) - fVar45;
          uVar24 = (long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45;
          if (fVar45 < fVar72) {
            uVar24 = 0;
          }
          if (fVar58 < fVar45) {
            uVar24 = 0xffffffffffffffff;
          }
          uVar20 = (long)(fVar44 - fVar63) & (long)fVar44 >> 0x3f | (long)fVar44;
          if (fVar44 < fVar72) {
            uVar20 = 0;
          }
          if (fVar58 < fVar44) {
            uVar20 = 0xffffffffffffffff;
          }
          uVar15 = (long)(fVar43 - fVar63) & (long)fVar43 >> 0x3f | (long)fVar43;
          if (fVar43 < fVar72) {
            uVar15 = 0;
          }
          if (fVar58 < fVar43) {
            uVar15 = 0xffffffffffffffff;
          }
          auVar8._4_4_ = -(uint)(fVar43 < fVar86);
          auVar8._0_4_ = -(uint)(fVar42 < fVar85);
          auVar8._8_4_ = -(uint)(fVar44 < fVar87);
          auVar8._12_4_ = -(uint)(fVar45 < fVar88);
          uVar56 = movmskps((int)puVar31,auVar8);
          puVar31 = (undefined8 *)(ulong)uVar56;
          bVar33 = (byte)uVar56;
          bVar34 = (bVar33 & 2) >> 1;
          bVar11 = (bVar33 & 4) >> 2;
          local_f8 = (undefined8 *)((long)(fVar42 - fVar63) & (long)fVar42 >> 0x3f | (long)fVar42);
          if (fVar42 < fVar72) {
            local_f8 = (undefined8 *)0x0;
          }
          if (fVar58 < fVar42) {
            local_f8 = (undefined8 *)0xffffffffffffffff;
          }
          iVar12 = -2;
          do {
            fVar45 = ((float)iVar12 + fVar80) - *(float *)(lVar26 + 0x60);
            puVar36 = local_118;
            puVar27 = local_178;
            if ((fVar72 <= fVar45) && (fVar72 <= auVar62._0_4_)) {
              uVar29 = 0;
              if (fVar72 <= fVar45) {
                uVar29 = (long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45;
              }
              if (fVar58 < fVar45) {
                uVar29 = 0xffffffffffffffff;
              }
              uVar19 = *(ulong *)(lVar26 + 0x58);
              if ((uVar29 < uVar19) && (uVar23 < uVar19)) {
                uVar29 = uVar19 * uVar23 + uVar29;
                if (*(ulong *)(lVar26 + 0x50) <= uVar29) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                uVar41 = CONCAT44(fVar84,auVar62._0_4_);
                if (*(char *)(*(long *)(lVar26 + 0x48) + uVar29) != '\0') goto LAB_145b1ab3e;
              }
            }
            if (fVar72 <= fVar45 && bVar33 >> 3 == 0) {
              uVar29 = 0;
              if (fVar72 <= fVar45) {
                uVar29 = (long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45;
              }
              if (fVar58 < fVar45) {
                uVar29 = 0xffffffffffffffff;
              }
              uVar19 = *(ulong *)(lVar26 + 0x58);
              if ((uVar29 < uVar19) && (uVar24 < uVar19)) {
                uVar29 = uVar19 * uVar24 + uVar29;
                if (*(ulong *)(lVar26 + 0x50) <= uVar29) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                uVar41 = CONCAT44(fVar84,auVar62._0_4_);
                if (*(char *)(*(long *)(lVar26 + 0x48) + uVar29) != '\0') goto LAB_145b1ab3e;
              }
            }
            if (fVar72 <= fVar45 && bVar11 == 0) {
              uVar29 = 0;
              if (fVar72 <= fVar45) {
                uVar29 = (long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45;
              }
              if (fVar58 < fVar45) {
                uVar29 = 0xffffffffffffffff;
              }
              uVar19 = *(ulong *)(lVar26 + 0x58);
              if ((uVar29 < uVar19) && (uVar20 < uVar19)) {
                uVar29 = uVar19 * uVar20 + uVar29;
                if (*(ulong *)(lVar26 + 0x50) <= uVar29) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                uVar41 = CONCAT44(fVar84,auVar62._0_4_);
                if (*(char *)(*(long *)(lVar26 + 0x48) + uVar29) != '\0') goto LAB_145b1ab3e;
              }
            }
            if (fVar72 <= fVar45 && bVar34 == 0) {
              uVar29 = 0;
              if (fVar72 <= fVar45) {
                uVar29 = (long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45;
              }
              if (fVar58 < fVar45) {
                uVar29 = 0xffffffffffffffff;
              }
              uVar19 = *(ulong *)(lVar26 + 0x58);
              if ((uVar29 < uVar19) && (uVar15 < uVar19)) {
                uVar29 = uVar19 * uVar15 + uVar29;
                if (*(ulong *)(lVar26 + 0x50) <= uVar29) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                uVar41 = CONCAT44(fVar84,auVar62._0_4_);
                if (*(char *)(*(long *)(lVar26 + 0x48) + uVar29) != '\0') goto LAB_145b1ab3e;
              }
            }
            if (fVar72 <= fVar45 && (uVar56 & 1) == 0) {
              puVar14 = (undefined8 *)0x0;
              if (fVar72 <= fVar45) {
                puVar14 = (undefined8 *)
                          ((long)(fVar45 - fVar63) & (long)fVar45 >> 0x3f | (long)fVar45);
              }
              if (fVar58 < fVar45) {
                puVar14 = (undefined8 *)0xffffffffffffffff;
              }
              puVar16 = *(undefined8 **)(lVar26 + 0x58);
              if ((puVar14 < puVar16) && (local_f8 < puVar16)) {
                puVar14 = (undefined8 *)((long)puVar16 * (long)local_f8 + (long)puVar14);
                if (*(undefined8 **)(lVar26 + 0x50) <= puVar14) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                uVar41 = CONCAT44(fVar84,auVar62._0_4_);
                if (*(char *)(*(long *)(lVar26 + 0x48) + (long)puVar14) != '\0') goto LAB_145b1ab3e;
              }
            }
            iVar12 = iVar12 + 1;
          } while (iVar12 != 2);
          fVar45 = (fVar80 + _DAT_1461b227c) - *(float *)(lVar26 + 0x60);
          if ((fVar72 <= fVar45) && (fVar72 <= auVar62._0_4_)) {
            auVar62._0_4_ = fVar45 - fVar63;
            uVar29 = 0;
            if (fVar72 <= fVar45) {
              uVar29 = (long)auVar62._0_4_ & (long)fVar45 >> 0x3f | (long)fVar45;
            }
            if (fVar58 < fVar45) {
              uVar29 = 0xffffffffffffffff;
            }
            uVar19 = *(ulong *)(lVar26 + 0x58);
            if ((uVar29 < uVar19) && (uVar23 < uVar19)) {
              uVar29 = uVar19 * uVar23 + uVar29;
              if (*(ulong *)(lVar26 + 0x50) <= uVar29) {
                func_0x0001461ae0f3();
                goto LAB_145b1b55e;
              }
              uVar41 = CONCAT44(fVar84,auVar62._0_4_);
              if (*(char *)(*(long *)(lVar26 + 0x48) + uVar29) != '\0') goto LAB_145b1ab3e;
            }
          }
          if (fVar72 <= fVar45 && bVar33 >> 3 == 0) {
            auVar62._0_4_ = fVar45 - fVar63;
            uVar23 = 0;
            if (fVar72 <= fVar45) {
              uVar23 = (long)auVar62._0_4_ & (long)fVar45 >> 0x3f | (long)fVar45;
            }
            if (fVar58 < fVar45) {
              uVar23 = 0xffffffffffffffff;
            }
            uVar29 = *(ulong *)(lVar26 + 0x58);
            if ((uVar23 < uVar29) && (uVar24 < uVar29)) {
              uVar23 = uVar29 * uVar24 + uVar23;
              if (*(ulong *)(lVar26 + 0x50) <= uVar23) {
                func_0x0001461ae0f3();
                goto LAB_145b1b55e;
              }
              uVar41 = CONCAT44(fVar84,auVar62._0_4_);
              if (*(char *)(*(long *)(lVar26 + 0x48) + uVar23) != '\0') goto LAB_145b1ab3e;
            }
          }
          if (fVar72 <= fVar45 && bVar11 == 0) {
            auVar62._0_4_ = fVar45 - fVar63;
            uVar23 = 0;
            if (fVar72 <= fVar45) {
              uVar23 = (long)auVar62._0_4_ & (long)fVar45 >> 0x3f | (long)fVar45;
            }
            if (fVar58 < fVar45) {
              uVar23 = 0xffffffffffffffff;
            }
            uVar24 = *(ulong *)(lVar26 + 0x58);
            if ((uVar23 < uVar24) && (uVar20 < uVar24)) {
              uVar23 = uVar24 * uVar20 + uVar23;
              if (*(ulong *)(lVar26 + 0x50) <= uVar23) {
                func_0x0001461ae0f3();
                goto LAB_145b1b55e;
              }
              uVar41 = CONCAT44(fVar84,auVar62._0_4_);
              if (*(char *)(*(long *)(lVar26 + 0x48) + uVar23) != '\0') goto LAB_145b1ab3e;
            }
          }
          if (fVar72 <= fVar45 && bVar34 == 0) {
            auVar62._0_4_ = fVar45 - fVar63;
            uVar23 = 0;
            if (fVar72 <= fVar45) {
              uVar23 = (long)auVar62._0_4_ & (long)fVar45 >> 0x3f | (long)fVar45;
            }
            if (fVar58 < fVar45) {
              uVar23 = 0xffffffffffffffff;
            }
            uVar24 = *(ulong *)(lVar26 + 0x58);
            if ((uVar23 < uVar24) && (uVar15 < uVar24)) {
              uVar23 = uVar24 * uVar15 + uVar23;
              if (*(ulong *)(lVar26 + 0x50) <= uVar23) {
                func_0x0001461ae0f3();
                goto LAB_145b1b55e;
              }
              uVar41 = CONCAT44(fVar84,auVar62._0_4_);
              if (*(char *)(*(long *)(lVar26 + 0x48) + uVar23) != '\0') goto LAB_145b1ab3e;
            }
          }
          if (fVar72 <= fVar45 && (uVar56 & 1) == 0) {
            auVar62._0_4_ = fVar45 - fVar63;
            puVar31 = (undefined8 *)((long)auVar62._0_4_ & (long)fVar45 >> 0x3f | (long)fVar45);
            puVar14 = (undefined8 *)0x0;
            if (fVar72 <= fVar45) {
              puVar14 = puVar31;
            }
            if (fVar58 < fVar45) {
              puVar14 = (undefined8 *)0xffffffffffffffff;
            }
            puVar16 = *(undefined8 **)(lVar26 + 0x58);
            if ((puVar14 < puVar16) && (local_f8 < puVar16)) {
              puVar14 = (undefined8 *)((long)puVar16 * (long)local_f8 + (long)puVar14);
              if (*(undefined8 **)(lVar26 + 0x50) <= puVar14) {
                func_0x0001461ae0f3();
                goto LAB_145b1b55e;
              }
              uVar41 = CONCAT44(fVar84,auVar62._0_4_);
              if (*(char *)(*(long *)(lVar26 + 0x48) + (long)puVar14) != '\0') goto LAB_145b1ab3e;
            }
          }
        }
        uVar23 = func_0x000145bee7c0(auVar62._0_4_,fVar80);
        uVar41 = CONCAT44(fVar84,extraout_XMM0_Da_05);
        if (((uVar23 & 1) == 0) ||
           (uVar41 = CONCAT44(fVar84,extraout_XMM0_Da_05),
           _DAT_1461dd760 <= (float)((uint)(extraout_XMM0_Da_05 - local_1a8._0_4_) & _DAT_1461bdb50)
           )) goto LAB_145b1ab3e;
        local_1e8 = CONCAT44(fVar81,fVar80);
        uStack_1e0 = CONCAT44(fVar83,fVar82);
        auVar62._0_4_ = extraout_XMM0_Da_05;
        fVar82 = extraout_XMM0_Da_05;
        local_16c = extraout_XMM0_Da_05;
LAB_145b1b340:
        if (local_158 == (undefined8 *)0x0) {
          func_0x0001461ae3f0();
          goto LAB_145b1b55e;
        }
        if ((local_1a0 | (ulong)local_158) >> 0x20 == 0) {
          uVar23 = (local_1a0 & 0xffffffff) % ((ulong)local_158 & 0xffffffff);
        }
        else {
          uVar23 = local_1a0 % (ulong)local_158;
        }
        uVar40 = local_200[uVar23];
        lVar26 = local_108[0xd9];
        if (lVar26 == local_108[0xd7]) {
          auVar62._0_4_ = (float)func_0x0001460064d0();
        }
        lVar35 = local_108[0xd8];
        *(undefined8 *)(lVar35 + lVar26 * 0x28) = 0;
        *(undefined8 *)(lVar35 + 0x10 + lVar26 * 0x28) = uVar40;
        *(ulong *)(lVar35 + 0x18 + lVar26 * 0x28) = CONCAT44(fVar81,fVar80);
        *(float *)(lVar35 + 0x20 + lVar26 * 0x28) = fVar82;
        *(undefined4 *)(lVar35 + 0x24 + lVar26 * 0x28) = 0x41a00000;
        local_108[0xd9] = lVar26 + 1;
        uVar23 = local_208;
      }
    }
    else {
      local_148 = *(undefined8 **)(lVar35 + 0x146fd8fe8);
      uStack_140 = local_148 + *(long *)(lVar35 + 0x146fd8ff0) * 10;
      local_138 = (undefined8 *)0x0;
      uVar46 = func_0x000145c9def0();
      puVar27 = local_108;
      if (local_158 != (undefined8 *)0x0) goto LAB_145b1a8b9;
    }
    if (local_168 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
  }
  lVar26 = func_0x000145aaef50();
  lVar35 = lVar26 * 0xf0;
  local_f8 = (undefined8 *)(lVar35 + 0x146fd8f70);
  local_148 = (undefined8 *)0x0;
  uStack_140 = (undefined8 *)&DAT_00000004;
  local_138 = (undefined8 *)0x0;
  if ((lVar26 == 2) || ((int)lVar26 == 7)) {
    pfVar17 = *(float **)(lVar35 + 0x146fd8fc8);
    local_100 = pfVar17 + *(ulong *)(lVar35 + 0x146fd8fd0) * 2;
    fVar71 = 0.0;
    uVar23 = 0;
    pfVar21 = pfVar17;
    fVar37 = extraout_XMM0_Da;
    fVar38 = _DAT_1461b2200;
    fVar52 = _DAT_1461bdb9c;
    fVar55 = _DAT_1461bdba0;
    local_118 = (undefined8 *)*(ulong *)(lVar35 + 0x146fd8fd0);
    while (puVar27 = local_138, pfVar21 != local_100) {
      uVar23 = uVar23 + 1;
      if ((uVar23 | (ulong)local_118) >> 0x20 == 0) {
        uVar24 = (uVar23 & 0xffffffff) % ((ulong)local_118 & 0xffffffff);
      }
      else {
        uVar24 = uVar23 % (ulong)local_118;
      }
      auVar62._0_4_ = *pfVar21;
      fVar66 = pfVar21[1];
      fVar48 = pfVar17[uVar24 * 2] - auVar62._0_4_;
      fVar59 = pfVar17[uVar24 * 2 + 1] - fVar66;
      fVar37 = (float)func_0x000146005081(fVar48,fVar59);
      fVar37 = (float)func_0x000146005099(fVar37 / _DAT_1461b2414);
      if (fVar37 <= fVar38) {
        fVar37 = fVar38;
      }
      uVar24 = (long)(fVar37 - fVar52) & (long)fVar37 >> 0x3f | (long)fVar37;
      if (fVar37 < fVar71) {
        uVar24 = 0;
      }
      if (fVar55 < fVar37) {
        uVar24 = 0xffffffffffffffff;
      }
      fVar51 = (float)uVar24;
      pfVar21 = pfVar21 + 2;
      for (uVar20 = 0; uVar20 < uVar24; uVar20 = uVar20 + 1) {
        fVar63 = (float)uVar20;
        if (local_138 == local_148) {
          local_109 = 1;
          func_0x000146035a50();
        }
        fVar37 = fVar48 * (fVar63 / fVar51) + auVar62._0_4_;
        uStack_140[(long)local_138] = CONCAT44((fVar63 / fVar51) * fVar59 + fVar66,fVar37);
        local_138 = (undefined8 *)((long)local_138 + 1);
      }
    }
  }
  else {
    fVar38 = *(float *)(lVar35 + 0x146fd9048) + _DAT_1461b2410;
    fVar37 = (float)func_0x000146005099((_DAT_1461ba348 * fVar38) / _DAT_1461b2414);
    puVar27 = (undefined8 *)0x0;
    puVar14 = (undefined8 *)((long)(fVar37 - _DAT_1461bdb9c) & (long)fVar37 >> 0x3f | (long)fVar37);
    if (fVar37 < 0.0) {
      puVar14 = puVar27;
    }
    puVar31 = (undefined8 *)0xffffffffffffffff;
    if (fVar37 <= _DAT_1461bdba0) {
      puVar31 = puVar14;
    }
    fVar55 = (float)puVar31;
    puVar14 = local_f8;
    fVar52 = _DAT_1461ba348;
    for (puVar36 = (undefined8 *)0x0; puVar36 < puVar31; puVar36 = (undefined8 *)((long)puVar36 + 1)
        ) {
      auVar62._0_4_ = ((float)puVar36 * fVar52) / fVar55;
      fVar37 = (float)func_0x00014600509f(auVar62._0_4_);
      fVar71 = fVar37 * fVar38 + *(float *)(puVar14 + 0x19);
      uVar40 = func_0x00014600508d(auVar62._0_4_);
      fVar37 = (float)uVar40;
      auVar61._8_4_ = extraout_XMM0_Dc_00;
      auVar61._0_8_ = uVar40;
      auVar61._12_4_ = extraout_XMM0_Dd;
      auVar62._4_12_ = auVar61._4_12_;
      auVar62._0_4_ = fVar37 * fVar38 + *(float *)((long)puVar14 + 0xcc);
      if (puVar27 == local_148) {
        local_109 = 1;
        fVar37 = (float)func_0x000146035a50();
      }
      uStack_140[(long)puVar27] = CONCAT44(auVar62._0_4_,fVar71);
      puVar27 = (undefined8 *)((long)puVar27 + 1);
      local_138 = puVar27;
    }
  }
  local_118 = local_148;
  local_100 = (float *)uStack_140;
  if (puVar27 != (undefined8 *)0x0) {
    puVar27 = uStack_140 + (long)puVar27;
    fVar71 = 0.0;
    auVar62._0_4_ = 0.0;
    fVar66 = 0.0;
    puVar14 = uStack_140;
    fVar38 = _DAT_1461be050;
    fVar52 = _DAT_1461bdb9c;
    fVar55 = _DAT_1461bdba0;
    do {
      fVar59 = (float)*puVar14;
      fVar51 = (float)((ulong)*puVar14 >> 0x20);
      fVar63 = 0.0;
      fVar58 = 0.0;
      fVar48 = fVar51;
      uVar23 = func_0x000145bee7c0(fVar37,fVar59,fVar51);
      fVar37 = extraout_XMM0_Da_00;
      if ((uVar23 & 1) == 0) {
        if (*(char *)((long)local_f8 + 0xec) == '\0') {
          lVar26 = local_108[0x17e];
          uVar23 = func_0x000145bee7c0(extraout_XMM0_Da_00,fVar59,fVar48);
          fVar37 = extraout_XMM0_Da_01;
          if ((uVar23 & 1) == 0) {
            if (*(long *)(lVar26 + 0x68) != -1) {
              func_0x000145bf1d00();
              if ((int)local_168 == 1) {
                fVar37 = uStack_160._4_4_;
                goto LAB_145b1a050;
              }
            }
            fVar37 = *(float *)(lVar26 + 0xb8);
          }
          goto LAB_145b1a050;
        }
      }
      else {
        if (*(char *)((long)local_f8 + 0xec) != '\0') {
          puVar31 = local_108;
          lVar26 = func_0x000145aaef50();
          uVar46 = 0x46fd8f70;
          uVar40 = *(undefined8 *)(lVar26 * 0xf0 + 0x146fd9038);
          auVar60._0_4_ = (float)uVar40 - fVar59;
          auVar60._4_4_ = (float)((ulong)uVar40 >> 0x20) - fVar51;
          auVar60._8_4_ = 0.0 - fVar63;
          auVar60._12_4_ = 0.0 - fVar58;
          fVar48 = (float)func_0x000146005081(auVar60._0_4_,auVar60._4_4_);
          lVar26 = puVar31[0x17e];
          if (*(long *)(lVar26 + 0x40) != -1) {
            if (fVar48 <= fVar38) {
              fVar48 = fVar38;
            }
            auVar6._4_4_ = fVar48;
            auVar6._0_4_ = fVar48;
            auVar6._8_4_ = extraout_XMM0_Dc;
            auVar6._12_4_ = extraout_XMM0_Dc;
            auVar89 = divps(auVar60,auVar6);
            fVar48 = (auVar89._0_4_ + fVar59) - (float)*(undefined8 *)(lVar26 + 0x60);
            fVar63 = (auVar89._4_4_ + fVar51) -
                     (float)((ulong)*(undefined8 *)(lVar26 + 0x60) >> 0x20);
            auVar7._4_4_ = -(uint)(fVar48 < fVar71);
            auVar7._0_4_ = -(uint)(fVar48 < fVar71);
            auVar7._8_4_ = -(uint)(fVar63 < auVar62._0_4_);
            auVar7._12_4_ = -(uint)(fVar63 < auVar62._0_4_);
            iVar12 = movmskpd(uVar46,auVar7);
            if (iVar12 == 0) {
              uVar23 = 0;
              uVar24 = 0;
              if (fVar66 <= fVar48) {
                uVar24 = (long)fVar48 >> 0x3f & (long)(fVar48 - fVar52) | (long)fVar48;
              }
              if (fVar55 < fVar48) {
                uVar24 = 0xffffffffffffffff;
              }
              if (fVar66 <= fVar63) {
                uVar23 = (long)fVar63 >> 0x3f & (long)(fVar63 - fVar52) | (long)fVar63;
              }
              uVar20 = 0xffffffffffffffff;
              if (fVar63 <= fVar55) {
                uVar20 = uVar23;
              }
              uVar23 = *(ulong *)(lVar26 + 0x58);
              if (uVar20 < uVar23 && uVar24 < uVar23) {
                uVar24 = uVar23 * uVar20 + uVar24;
                if (*(ulong *)(lVar26 + 0x50) <= uVar24) {
                  func_0x0001461ae0f3();
                  goto LAB_145b1b55e;
                }
                if (*(char *)(*(long *)(lVar26 + 0x48) + uVar24) != '\0') goto LAB_145b19dfc;
              }
            }
          }
        }
LAB_145b1a050:
        local_168 = (undefined8 *)CONCAT44(fVar51,fVar59);
        uStack_160 = (undefined8 *)CONCAT44(uStack_160._4_4_,fVar37);
        uVar40 = func_0x000145b6c2e0();
        lVar26 = local_108[0x143];
        fVar37 = extraout_XMM0_Da_02;
        if (lVar26 == local_108[0x141]) {
          fVar37 = (float)func_0x0001460062a0();
        }
        *(undefined8 *)(local_108[0x142] + lVar26 * 8) = uVar40;
        local_108[0x143] = lVar26 + 1;
      }
LAB_145b19dfc:
      puVar14 = puVar14 + 1;
    } while (puVar14 != puVar27);
  }
  if (local_118 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  puVar27 = local_108;
  if (*(char *)((long)local_108 + 0xd4d) == '\0') goto LAB_145b1a455;
  func_0x000145aaef50();
  func_0x000145bf5040();
  puVar14 = local_138;
  lVar26 = puVar27[0xdc];
  uVar56 = (uint)local_138;
  if ((undefined8 *)(puVar27[0xda] - lVar26) < local_138) {
    local_f8 = uStack_140;
    func_0x000146005df0();
    lVar26 = puVar27[0xdc];
    lVar35 = puVar27[0xdb];
    puVar31 = local_f8;
    if (puVar14 < (undefined8 *)0x11) {
LAB_145b1a17b:
      lVar18 = 0;
    }
    else {
LAB_145b1a155:
      if (((undefined1 *)(lVar35 + lVar26 * 4) <
           (undefined1 *)((long)puVar31 + (long)puVar14 * 8 + -4)) &&
         (puVar31 < (undefined8 *)(lVar35 + (long)(lVar26 + (long)puVar14) * 4)))
      goto LAB_145b1a17b;
      lVar13 = lVar26 * 4;
      uVar23 = 8;
      if (((ulong)puVar14 & 7) != 0) {
        uVar23 = (ulong)(uVar56 & 7);
      }
      lVar18 = (long)puVar14 - uVar23;
      lVar26 = lVar26 + lVar18;
      lVar13 = lVar13 + lVar35;
      lVar30 = 0;
      do {
        uVar46 = *(undefined4 *)(puVar31 + lVar30 + 1);
        uVar49 = *(undefined4 *)(puVar31 + lVar30 + 2);
        uVar53 = *(undefined4 *)(puVar31 + lVar30 + 2 + 1);
        uVar67 = *(undefined4 *)(puVar31 + lVar30 + 4);
        uVar74 = *(undefined4 *)(puVar31 + lVar30 + 4 + 1);
        uVar76 = *(undefined4 *)(puVar31 + lVar30 + 6);
        uVar78 = *(undefined4 *)(puVar31 + lVar30 + 6 + 1);
        puVar3 = (undefined4 *)(lVar13 + lVar30 * 4);
        *puVar3 = *(undefined4 *)(puVar31 + lVar30);
        puVar3[1] = uVar46;
        puVar3[2] = uVar49;
        puVar3[3] = uVar53;
        puVar3 = (undefined4 *)(lVar13 + 0x10 + lVar30 * 4);
        *puVar3 = uVar67;
        puVar3[1] = uVar74;
        puVar3[2] = uVar76;
        puVar3[3] = uVar78;
        lVar30 = lVar30 + 8;
      } while (lVar18 != lVar30);
    }
    uVar56 = uVar56 - (int)lVar18 & 3;
    uVar23 = (ulong)uVar56;
    lVar13 = lVar18;
    if (uVar56 != 0) {
      do {
        *(undefined4 *)(lVar35 + lVar26 * 4) = *(undefined4 *)(puVar31 + lVar13);
        lVar26 = lVar26 + 1;
        lVar13 = lVar13 + 1;
        uVar23 = uVar23 - 1;
      } while (uVar23 != 0);
    }
    if ((ulong)(lVar18 - (long)puVar14) < 0xfffffffffffffffd) {
      lVar35 = lVar35 + lVar26 * 4;
      lVar30 = 0;
      do {
        *(undefined4 *)(lVar35 + lVar30 * 4) = *(undefined4 *)(puVar31 + lVar13 + lVar30);
        *(undefined4 *)(lVar35 + 4 + lVar30 * 4) = *(undefined4 *)(puVar31 + lVar13 + lVar30 + 1);
        *(undefined4 *)(lVar35 + 8 + lVar30 * 4) = *(undefined4 *)(puVar31 + lVar13 + lVar30 + 2);
        *(undefined4 *)(lVar35 + 0xc + lVar30 * 4) = *(undefined4 *)(puVar31 + lVar13 + lVar30 + 3);
        lVar30 = lVar30 + 4;
      } while ((long)puVar14 - lVar13 != lVar30);
      lVar26 = lVar26 + lVar30;
    }
  }
  else if (local_138 != (undefined8 *)0x0) {
    lVar35 = puVar27[0xdb];
    puVar31 = uStack_140;
    if ((undefined8 *)0x10 < local_138) goto LAB_145b1a155;
    goto LAB_145b1a17b;
  }
  puVar27[0xdc] = lVar26;
  if (local_148 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
LAB_145b1a455:
  if (*(char *)((long)puVar27 + 0xd52) != '\0') {
    *(undefined1 *)(puVar27 + 0x1ab) = 1;
    local_168 = (undefined8 *)puVar27[0x18a];
    local_148 = (undefined8 *)puVar27[0xcf];
    uStack_130 = puVar27[0xd0];
    puVar27[0xd0] = 0;
    uStack_140 = (undefined8 *)(uStack_130 * 0x20 + (long)local_148);
    local_128 = 0;
    local_138 = local_1b8;
    puVar14 = &local_168;
    local_120 = puVar14;
    func_0x000145c8c410(puVar14,&local_148,&local_148,puVar27 + 0x15c);
    local_148 = (undefined8 *)puVar27[0xd2];
    uStack_130 = puVar27[0xd3];
    puVar27[0xd3] = 0;
    uStack_140 = local_148 + uStack_130 * 3;
    local_128 = 0;
    local_138 = local_1c0;
    local_120 = puVar14;
    func_0x000145c8c340();
    plVar1 = puVar27 + 0x144;
    local_188 = (undefined1 *)puVar27[0x146];
    local_198 = *(undefined4 *)(puVar27 + 0x144);
    uStack_194 = *(undefined4 *)((long)puVar27 + 0xa24);
    uStack_190 = *(undefined4 *)(puVar27 + 0x145);
    uStack_18c = *(undefined4 *)((long)puVar27 + 0xa2c);
    puVar14 = (undefined8 *)puVar27[0x145];
    puVar27[0x144] = 0;
    puVar27[0x145] = 8;
    puVar27[0x146] = 0;
    local_178 = puVar14 + (long)local_188 * 0x13e;
    lVar26 = 0;
    puVar31 = local_178;
    while (local_118 = puVar14, local_118 != puVar31) {
      puVar14 = local_118 + 0x13e;
      lVar26 = lVar26 + 1;
      if (*(char *)((long)local_118 + 0x9df) == '\0') {
        func_0x000145b20420();
        puVar27[0x18a] = lVar26;
        *(undefined1 *)((long)puVar27 + 0xd57) = 1;
        func_0x000140002200();
        puVar31 = (undefined8 *)func_0x0001400021c0();
        if (puVar31 == (undefined8 *)0x0) {
          func_0x0001461add5b();
LAB_145b1b55e:
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        *(undefined1 *)puVar31 = 0x7b;
        local_148 = (undefined8 *)0x1;
        local_138 = (undefined8 *)0x1;
        uStack_130 = CONCAT71(uStack_130._1_7_,1);
        uStack_140 = puVar31;
        func_0x000145b9b7a0();
        puVar31 = local_158;
        if (local_168 == local_158) {
          func_0x000146005df0();
        }
        local_f8 = local_168;
        local_100 = (float *)uStack_160;
        *(undefined1 *)((long)uStack_160 + (long)puVar31) = 0x7d;
        lVar35 = puVar27[0xd3];
        if (lVar35 == puVar27[0xd1]) {
          func_0x0001460061c0();
        }
        puVar27 = local_108;
        lVar13 = local_108[0xd2];
        *(undefined8 **)(lVar13 + lVar35 * 0x18) = local_f8;
        *(float **)(lVar13 + 8 + lVar35 * 0x18) = local_100;
        *(undefined1 **)(lVar13 + 0x10 + lVar35 * 0x18) = (undefined1 *)((long)puVar31 + 1);
        local_108[0xd3] = lVar35 + 1;
        func_0x000145b3e1b0();
        func_0x000145b4da20();
        func_0x000145afc720();
        puVar27[0x18a] = 0;
        func_0x000145b20420();
        puVar31 = local_178;
      }
    }
    local_1a0 = puVar27[0x145];
    local_100 = (float *)puVar27[0x146];
    local_f8 = (undefined8 *)0x0;
    local_1a8 = plVar1;
    while (local_100 != (float *)local_f8) {
      local_f8 = (undefined8 *)((long)local_f8 + 1);
      func_0x000145c8e270();
    }
    if (*local_1a8 != 0) {
      func_0x0001400021d0();
    }
    local_1a8[2] = (long)local_188;
    *local_1a8 = CONCAT44(uStack_194,local_198);
    local_1a8[1] = CONCAT44(uStack_18c,uStack_190);
  }
  return;
}

