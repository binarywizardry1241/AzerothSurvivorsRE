/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1458f6280(undefined8 param_1,undefined8 param_2,long param_3,char *param_4)

{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  short sVar8;
  short sVar9;
  short sVar10;
  short sVar11;
  short sVar12;
  short sVar13;
  short sVar14;
  short sVar15;
  short sVar16;
  undefined1 auVar17 [15];
  undefined1 auVar18 [15];
  undefined1 auVar19 [15];
  undefined1 auVar20 [15];
  undefined1 auVar21 [15];
  undefined1 auVar22 [15];
  undefined1 auVar23 [15];
  undefined1 auVar24 [15];
  undefined1 auVar25 [15];
  undefined1 auVar26 [15];
  undefined1 auVar27 [15];
  undefined1 auVar28 [15];
  undefined1 auVar29 [15];
  undefined1 auVar30 [15];
  undefined1 auVar31 [16];
  undefined8 uVar32;
  undefined1 auVar33 [15];
  undefined1 auVar34 [15];
  undefined1 auVar35 [15];
  undefined1 auVar36 [15];
  undefined1 auVar37 [15];
  undefined1 auVar38 [15];
  uint uVar39;
  uint uVar40;
  ulong uVar41;
  ulong uVar42;
  char cVar43;
  byte bVar44;
  undefined1 auVar45 [16];
  undefined1 auVar46 [16];
  undefined1 auVar47 [16];
  undefined1 auVar48 [16];
  undefined1 auVar49 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar50;
  undefined4 uVar51;
  undefined4 uVar52;
  undefined4 uVar53;
  undefined4 in_XMM7_Da;
  undefined4 uVar54;
  undefined4 uVar55;
  undefined4 uVar56;
  undefined4 uVar57;
  undefined8 uStack_1e8;
  undefined8 uStack_1e0;
  undefined8 uStack_1d8;
  undefined8 uStack_1d0;
  undefined8 uStack_1c8;
  undefined8 uStack_1c0;
  undefined8 uStack_1b8;
  undefined8 uStack_1b0;
  undefined8 uStack_1a8;
  undefined8 uStack_1a0;
  undefined8 uStack_198;
  ulong uStack_190;
  undefined8 uStack_188;
  ulong uStack_178;
  undefined4 uStack_170;
  undefined4 uStack_16c;
  undefined4 uStack_168;
  undefined4 uStack_164;
  uint uStack_160;
  undefined4 uStack_15c;
  undefined8 uStack_158;
  undefined8 uStack_150;
  undefined8 uStack_148;
  undefined8 uStack_140;
  undefined8 uStack_138;
  undefined8 uStack_130;
  undefined8 uStack_128;
  ulong uStack_120;
  byte bStack_118;
  undefined7 uStack_117;
  ulong uStack_110;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  uint uStack_f8;
  undefined4 uStack_f4;
  undefined8 auStack_f0 [2];
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  ulong uStack_b8;
  byte bStack_b0;
  undefined7 uStack_af;
  undefined1 auStack_a8 [16];
  undefined1 auStack_98 [16];
  undefined1 auStack_88 [16];
  undefined8 uStack_78;
  ulong uStack_70;
  undefined4 uStack_68;
  undefined4 uStack_58;

  uStack_128 = 0;
  uStack_120 = 0;
  uStack_138 = 0;
  uStack_130 = 0;
  uStack_148 = 0;
  uStack_140 = 0;
  uStack_158 = 0;
  uStack_150 = 0;
  bStack_118 = 0;
  uStack_170 = _DAT_146884870;
  uStack_16c = uRam0000000146884874;
  uStack_168 = uRam0000000146884878;
  uStack_164 = uRam000000014688487c;
  uStack_160 = 0xc3d2e1f0;
  uStack_1e8 = _DAT_146ed2e40;
  uStack_1e0 = uRam0000000146ed2e48;
  uStack_1d8 = _DAT_146ed2e50;
  uStack_1d0 = uRam0000000146ed2e58;
  uStack_1c8 = _DAT_146ed2e60;
  uStack_1c0 = uRam0000000146ed2e68;
  uStack_1b8 = _DAT_145de79e0;
  uStack_1b0 = uRam0000000145de79e8;
  uStack_178 = 1;
  uVar50 = _DAT_146884870;
  uVar51 = uRam0000000146884874;
  uVar52 = uRam0000000146884878;
  uVar53 = uRam000000014688487c;
  uStack_68 = in_XMM6_Da;
  uStack_58 = in_XMM7_Da;
  func_0x000145a5dfc0(param_1,param_4,&uStack_1e8,&uStack_170,1);
  bStack_118 = 0;
  uVar41 = *(ulong *)(param_3 + 8);
  if (uVar41 < 0x40) {
    func_0x000145bfa0e7();
    uVar42 = uVar41;
  }
  else {
    uVar42 = (ulong)((uint)uVar41 & 0x3f);
    uStack_178 = uStack_178 + (uVar41 >> 6);
    func_0x000145a5dfc0();
    func_0x000145bfa0e7();
  }
  bStack_118 = (byte)uVar42;
  uVar41 = *(ulong *)(param_3 + 0x18);
  if (uVar41 < 0x40 - uVar42) {
    func_0x000145bfa0e7();
    uVar42 = uVar41 + uVar42;
  }
  else {
    if (uVar42 != 0) {
      func_0x000145bfa0e7();
      uStack_178 = uStack_178 + 1;
      func_0x000145a5dfc0();
      uVar41 = uVar41 - (0x40 - uVar42);
    }
    uVar42 = (ulong)((uint)uVar41 & 0x3f);
    if (uVar41 >> 6 != 0) {
      uStack_178 = uStack_178 + (uVar41 >> 6);
      func_0x000145a5dfc0();
    }
    func_0x000145bfa0e7();
  }
  cVar43 = (char)uVar42;
  uVar41 = *(ulong *)(param_3 + 0x28);
  bStack_118 = cVar43;
  if (uVar41 < 0x40 - uVar42) {
    func_0x000145bfa0e7();
    bStack_118 = (char)uVar41 + cVar43;
  }
  else {
    if (uVar42 != 0) {
      func_0x000145bfa0e7();
      uStack_178 = uStack_178 + 1;
      func_0x000145a5dfc0();
      uVar41 = uVar41 - (0x40 - uVar42);
    }
    if (uVar41 >> 6 != 0) {
      uStack_178 = uStack_178 + (uVar41 >> 6);
      func_0x000145a5dfc0();
    }
    func_0x000145bfa0e7();
    bStack_118 = (byte)uVar41 & 0x3f;
  }
  uVar54 = 0;
  uVar55 = 0;
  uVar56 = 0;
  uVar57 = 0;
  uStack_c0 = 0;
  uStack_b8 = 0;
  uStack_d0 = 0;
  uStack_c8 = 0;
  uStack_e0 = 0;
  uStack_d8 = 0;
  auStack_f0[0] = 0;
  auStack_f0[1] = 0;
  bStack_b0 = 0;
  uStack_f8 = 0xc3d2e1f0;
  uStack_1e8 = _DAT_146ed2e70;
  uStack_1e0 = uRam0000000146ed2e78;
  uStack_1d8 = _DAT_146ed2e80;
  uStack_1d0 = uRam0000000146ed2e88;
  uStack_1c8 = _DAT_146ed2e90;
  uStack_1c0 = uRam0000000146ed2e98;
  uStack_1b8 = _DAT_145de2650;
  uStack_1b0 = uRam0000000145de2658;
  uStack_110 = 1;
  uStack_108 = uVar50;
  uStack_104 = uVar51;
  uStack_100 = uVar52;
  uStack_fc = uVar53;
  func_0x000145a5dfc0();
  bVar44 = bStack_118;
  uVar39 = uStack_160;
  uVar53 = uStack_164;
  uVar52 = uStack_168;
  uVar51 = uStack_16c;
  uVar50 = uStack_170;
  bStack_b0 = 0;
  uStack_1e0 = CONCAT44(uStack_16c,uStack_170);
  uStack_1d8 = CONCAT44(uStack_164,uStack_168);
  uStack_1d0 = CONCAT44(uStack_15c,uStack_160);
  uStack_1e8 = uStack_178;
  uStack_188 = CONCAT71(uStack_117,bStack_118);
  uStack_198 = uStack_128;
  uStack_190 = uStack_120;
  uStack_1a8 = uStack_138;
  uStack_1a0 = uStack_130;
  uStack_1b8 = uStack_148;
  uStack_1b0 = uStack_140;
  uStack_1c8 = uStack_158;
  uStack_1c0 = uStack_150;
  uVar40 = (uint)uStack_188 & 0xff;
  uVar41 = uStack_178 << 9;
  uVar42 = (ulong)(uVar40 * 8);
  uVar32 = CONCAT44(uStack_16c,uStack_170);
  auVar45._12_4_ = uStack_164;
  auVar45._8_4_ = uStack_168;
  uVar41 = (uStack_178 & 0x7fffffffffffff) >> 0x2f | (uVar41 & 0xff000000000000) >> 0x28 |
           (uVar41 & 0xff0000000000) >> 0x18 | (uVar41 & 0xff00000000) >> 8 |
           (uVar41 & 0xff000000) << 8 | (uVar41 & 0xff0000) << 0x18 |
           ((uVar42 | uVar41) & 0xff00) << 0x28 | uVar42 << 0x38;
  *(undefined1 *)((long)&uStack_1c8 + (ulong)bStack_118) = 0x80;
  if ((uVar40 == 0x3f) || (func_0x000145bfa0db(), uVar42 = uVar41, (bVar44 ^ 0x38) < 8)) {
    func_0x000145a5dfc0();
    auStack_88._4_4_ = uVar55;
    auStack_88._0_4_ = uVar54;
    auStack_88._8_4_ = uVar56;
    auStack_88._12_4_ = uVar57;
    auStack_98._4_4_ = uVar55;
    auStack_98._0_4_ = uVar54;
    auStack_98._8_4_ = uVar56;
    auStack_98._12_4_ = uVar57;
    auStack_a8._4_4_ = uVar55;
    auStack_a8._0_4_ = uVar54;
    auStack_a8._8_4_ = uVar56;
    auStack_a8._12_4_ = uVar57;
    uStack_78 = 0;
    uVar42 = uStack_190;
    uStack_70 = uVar41;
  }
  uStack_190 = uVar42;
  func_0x000145a5dfc0();
  bVar44 = bStack_b0;
  uVar40 = uVar39 >> 0x18 | (uVar39 & 0xff0000) >> 8 | (uVar39 & 0xff00) << 8 | uVar39 << 0x18;
  auVar45._0_8_ = uVar32;
  auVar48[1] = 0;
  auVar48[0] = (byte)uVar52;
  auVar48[2] = (char)((uint)uVar52 >> 8);
  auVar48[3] = 0;
  auVar48[4] = (char)((uint)uVar52 >> 0x10);
  auVar48[5] = 0;
  auVar48[6] = (char)((uint)uVar52 >> 0x18);
  auVar48[7] = 0;
  auVar48[8] = (char)uVar53;
  auVar48[9] = 0;
  auVar48[10] = (char)((uint)uVar53 >> 8);
  auVar48[0xb] = 0;
  auVar48[0xc] = (char)((uint)uVar53 >> 0x10);
  auVar48[0xd] = 0;
  auVar48[0xe] = (char)((uint)uVar53 >> 0x18);
  auVar48[0xf] = 0;
  auVar47 = pshuflw(auVar48,auVar48,0x1b);
  auVar48 = pshufhw(auVar47,auVar47,0x1b);
  auVar17[0xd] = 0;
  auVar17._0_13_ = auVar45._0_13_;
  auVar17[0xe] = (char)((uint)uVar51 >> 0x18);
  auVar19[0xc] = (char)((uint)uVar51 >> 0x10);
  auVar19._0_12_ = auVar45._0_12_;
  auVar19._13_2_ = auVar17._13_2_;
  auVar21[0xb] = 0;
  auVar21._0_11_ = auVar45._0_11_;
  auVar21._12_3_ = auVar19._12_3_;
  auVar23[10] = (char)((uint)uVar51 >> 8);
  auVar23._0_10_ = auVar45._0_10_;
  auVar23._11_4_ = auVar21._11_4_;
  auVar25[9] = 0;
  auVar25._0_9_ = auVar45._0_9_;
  auVar25._10_5_ = auVar23._10_5_;
  auVar27[8] = (char)uVar51;
  auVar27._0_8_ = uVar32;
  auVar27._9_6_ = auVar25._9_6_;
  auVar33._7_8_ = 0;
  auVar33._0_7_ = auVar27._8_7_;
  auVar35._1_8_ = SUB158(auVar33 << 0x40,7);
  auVar35[0] = (char)((uint)uVar50 >> 0x18);
  auVar35._9_6_ = 0;
  auVar36._1_10_ = SUB1510(auVar35 << 0x30,5);
  auVar36[0] = (char)((uint)uVar50 >> 0x10);
  auVar36._11_4_ = 0;
  auVar29[2] = (char)((uint)uVar50 >> 8);
  auVar29._0_2_ = (ushort)uVar50;
  auVar29._3_12_ = SUB1512(auVar36 << 0x20,3);
  auVar47._0_2_ = (ushort)uVar50 & 0xff;
  auVar47._2_13_ = auVar29._2_13_;
  auVar47[0xf] = 0;
  auVar45 = pshuflw((undefined1  [16])0x0,auVar47,0x1b);
  auVar45 = pshufhw(auVar45,auVar45,0x1b);
  sVar1 = auVar45._0_2_;
  sVar2 = auVar45._2_2_;
  sVar3 = auVar45._4_2_;
  sVar4 = auVar45._6_2_;
  sVar5 = auVar45._8_2_;
  sVar6 = auVar45._10_2_;
  sVar7 = auVar45._12_2_;
  sVar8 = auVar45._14_2_;
  sVar9 = auVar48._0_2_;
  sVar10 = auVar48._2_2_;
  sVar11 = auVar48._4_2_;
  sVar12 = auVar48._6_2_;
  sVar13 = auVar48._8_2_;
  sVar14 = auVar48._10_2_;
  sVar15 = auVar48._12_2_;
  sVar16 = auVar48._14_2_;
  uStack_1e8 = CONCAT17((0 < sVar8) * (sVar8 < 0x100) * auVar45[0xe] - (0xff < sVar8),
                        CONCAT16((0 < sVar7) * (sVar7 < 0x100) * auVar45[0xc] - (0xff < sVar7),
                                 CONCAT15((0 < sVar6) * (sVar6 < 0x100) * auVar45[10] -
                                          (0xff < sVar6),
                                          CONCAT14((0 < sVar5) * (sVar5 < 0x100) * auVar45[8] -
                                                   (0xff < sVar5),
                                                   CONCAT13((0 < sVar4) * (sVar4 < 0x100) *
                                                            auVar45[6] - (0xff < sVar4),
                                                            CONCAT12((0 < sVar3) * (sVar3 < 0x100) *
                                                                     auVar45[4] - (0xff < sVar3),
                                                                     CONCAT11((0 < sVar2) *
                                                                              (sVar2 < 0x100) *
                                                                              auVar45[2] -
                                                                              (0xff < sVar2),
                                                                              (0 < sVar1) *
                                                                              (sVar1 < 0x100) *
                                                                              auVar45[0] -
                                                                              (0xff < sVar1))))))));
  uStack_1e0 = CONCAT17((0 < sVar16) * (sVar16 < 0x100) * auVar48[0xe] - (0xff < sVar16),
                        CONCAT16((0 < sVar15) * (sVar15 < 0x100) * auVar48[0xc] - (0xff < sVar15),
                                 CONCAT15((0 < sVar14) * (sVar14 < 0x100) * auVar48[10] -
                                          (0xff < sVar14),
                                          CONCAT14((0 < sVar13) * (sVar13 < 0x100) * auVar48[8] -
                                                   (0xff < sVar13),
                                                   CONCAT13((0 < sVar12) * (sVar12 < 0x100) *
                                                            auVar48[6] - (0xff < sVar12),
                                                            CONCAT12((0 < sVar11) * (sVar11 < 0x100)
                                                                     * auVar48[4] - (0xff < sVar11),
                                                                     CONCAT11((0 < sVar10) *
                                                                              (sVar10 < 0x100) *
                                                                              auVar48[2] -
                                                                              (0xff < sVar10),
                                                                              (0 < sVar9) *
                                                                              (sVar9 < 0x100) *
                                                                              auVar48[0] -
                                                                              (0xff < sVar9))))))));
  uStack_1d8 = CONCAT44(uStack_1d8._4_4_,uVar40);
  uVar41 = (ulong)bStack_b0;
  if (uVar41 < 0x2c) {
    *(uint *)((long)&uStack_e0 + uVar41) = uVar40;
    *(ulong *)((long)auStack_f0 + uVar41) = uStack_1e8;
    *(undefined8 *)((long)auStack_f0 + uVar41 + 8) = uStack_1e0;
    cVar43 = '\x14';
  }
  else {
    cVar43 = -0x2c;
    func_0x000145bfa0e7();
    uStack_110 = uStack_110 + 1;
    func_0x000145a5dfc0();
    func_0x000145bfa0e7();
  }
  uVar39 = uStack_f8;
  uVar53 = uStack_fc;
  uVar52 = uStack_100;
  uVar51 = uStack_104;
  uVar50 = uStack_108;
  bVar44 = bVar44 + cVar43;
  uStack_1e0 = CONCAT44(uStack_104,uStack_108);
  uStack_1d8 = CONCAT44(uStack_fc,uStack_100);
  uStack_1d0 = CONCAT44(uStack_f4,uStack_f8);
  uStack_1e8 = uStack_110;
  uStack_188 = CONCAT71(uStack_af,bVar44);
  uStack_198 = uStack_c0;
  uStack_190 = uStack_b8;
  uStack_1a8 = uStack_d0;
  uStack_1a0 = uStack_c8;
  uStack_1b8 = uStack_e0;
  uStack_1b0 = uStack_d8;
  uStack_1c8 = auStack_f0[0];
  uStack_1c0 = auStack_f0[1];
  uVar40 = (uint)uStack_188 & 0xff;
  uVar41 = uStack_110 << 9;
  uVar42 = (ulong)(uVar40 * 8);
  uVar32 = CONCAT44(uStack_104,uStack_108);
  auVar31._12_4_ = uStack_fc;
  auVar31._8_4_ = uStack_100;
  uVar41 = (uStack_110 & 0x7fffffffffffff) >> 0x2f | (uVar41 & 0xff000000000000) >> 0x28 |
           (uVar41 & 0xff0000000000) >> 0x18 | (uVar41 & 0xff00000000) >> 8 |
           (uVar41 & 0xff000000) << 8 | (uVar41 & 0xff0000) << 0x18 |
           ((uVar42 | uVar41) & 0xff00) << 0x28 | uVar42 << 0x38;
  bStack_b0 = bVar44;
  *(undefined1 *)((long)&uStack_1c8 + (ulong)bVar44) = 0x80;
  if ((uVar40 == 0x3f) || (func_0x000145bfa0db(), uVar42 = uVar41, (bVar44 ^ 0x38) < 8)) {
    func_0x000145a5dfc0();
    auStack_88 = (undefined1  [16])0x0;
    auStack_98 = (undefined1  [16])0x0;
    auStack_a8 = (undefined1  [16])0x0;
    uStack_78 = 0;
    uVar42 = uStack_190;
    uStack_70 = uVar41;
  }
  uStack_190 = uVar42;
  func_0x000145a5dfc0();
  auVar31._0_8_ = uVar32;
  auVar49[1] = 0;
  auVar49[0] = (byte)uVar52;
  auVar49[2] = (char)((uint)uVar52 >> 8);
  auVar49[3] = 0;
  auVar49[4] = (char)((uint)uVar52 >> 0x10);
  auVar49[5] = 0;
  auVar49[6] = (char)((uint)uVar52 >> 0x18);
  auVar49[7] = 0;
  auVar49[8] = (char)uVar53;
  auVar49[9] = 0;
  auVar49[10] = (char)((uint)uVar53 >> 8);
  auVar49[0xb] = 0;
  auVar49[0xc] = (char)((uint)uVar53 >> 0x10);
  auVar49[0xd] = 0;
  auVar49[0xe] = (char)((uint)uVar53 >> 0x18);
  auVar49[0xf] = 0;
  auVar45 = pshuflw(auVar49,auVar49,0x1b);
  auVar47 = pshufhw(auVar45,auVar45,0x1b);
  auVar18[0xd] = 0;
  auVar18._0_13_ = auVar31._0_13_;
  auVar18[0xe] = (char)((uint)uVar51 >> 0x18);
  auVar20[0xc] = (char)((uint)uVar51 >> 0x10);
  auVar20._0_12_ = auVar31._0_12_;
  auVar20._13_2_ = auVar18._13_2_;
  auVar22[0xb] = 0;
  auVar22._0_11_ = auVar31._0_11_;
  auVar22._12_3_ = auVar20._12_3_;
  auVar24[10] = (char)((uint)uVar51 >> 8);
  auVar24._0_10_ = auVar31._0_10_;
  auVar24._11_4_ = auVar22._11_4_;
  auVar26[9] = 0;
  auVar26._0_9_ = auVar31._0_9_;
  auVar26._10_5_ = auVar24._10_5_;
  auVar28[8] = (char)uVar51;
  auVar28._0_8_ = uVar32;
  auVar28._9_6_ = auVar26._9_6_;
  auVar34._7_8_ = 0;
  auVar34._0_7_ = auVar28._8_7_;
  auVar37._1_8_ = SUB158(auVar34 << 0x40,7);
  auVar37[0] = (char)((uint)uVar50 >> 0x18);
  auVar37._9_6_ = 0;
  auVar38._1_10_ = SUB1510(auVar37 << 0x30,5);
  auVar38[0] = (char)((uint)uVar50 >> 0x10);
  auVar38._11_4_ = 0;
  auVar30[2] = (char)((uint)uVar50 >> 8);
  auVar30._0_2_ = (ushort)uVar50;
  auVar30._3_12_ = SUB1512(auVar38 << 0x20,3);
  auVar46._0_2_ = (ushort)uVar50 & 0xff;
  auVar46._2_13_ = auVar30._2_13_;
  auVar46[0xf] = 0;
  auVar45 = pshuflw((undefined1  [16])0x0,auVar46,0x1b);
  auVar45 = pshufhw(auVar45,auVar45,0x1b);
  sVar1 = auVar45._0_2_;
  sVar2 = auVar45._2_2_;
  sVar3 = auVar45._4_2_;
  sVar4 = auVar45._6_2_;
  sVar5 = auVar45._8_2_;
  sVar6 = auVar45._10_2_;
  sVar7 = auVar45._12_2_;
  sVar8 = auVar45._14_2_;
  sVar9 = auVar47._0_2_;
  sVar10 = auVar47._2_2_;
  sVar11 = auVar47._4_2_;
  sVar12 = auVar47._6_2_;
  sVar13 = auVar47._8_2_;
  sVar14 = auVar47._10_2_;
  sVar15 = auVar47._12_2_;
  sVar16 = auVar47._14_2_;
  *param_4 = (0 < sVar1) * (sVar1 < 0x100) * auVar45[0] - (0xff < sVar1);
  param_4[1] = (0 < sVar2) * (sVar2 < 0x100) * auVar45[2] - (0xff < sVar2);
  param_4[2] = (0 < sVar3) * (sVar3 < 0x100) * auVar45[4] - (0xff < sVar3);
  param_4[3] = (0 < sVar4) * (sVar4 < 0x100) * auVar45[6] - (0xff < sVar4);
  param_4[4] = (0 < sVar5) * (sVar5 < 0x100) * auVar45[8] - (0xff < sVar5);
  param_4[5] = (0 < sVar6) * (sVar6 < 0x100) * auVar45[10] - (0xff < sVar6);
  param_4[6] = (0 < sVar7) * (sVar7 < 0x100) * auVar45[0xc] - (0xff < sVar7);
  param_4[7] = (0 < sVar8) * (sVar8 < 0x100) * auVar45[0xe] - (0xff < sVar8);
  param_4[8] = (0 < sVar9) * (sVar9 < 0x100) * auVar47[0] - (0xff < sVar9);
  param_4[9] = (0 < sVar10) * (sVar10 < 0x100) * auVar47[2] - (0xff < sVar10);
  param_4[10] = (0 < sVar11) * (sVar11 < 0x100) * auVar47[4] - (0xff < sVar11);
  param_4[0xb] = (0 < sVar12) * (sVar12 < 0x100) * auVar47[6] - (0xff < sVar12);
  param_4[0xc] = (0 < sVar13) * (sVar13 < 0x100) * auVar47[8] - (0xff < sVar13);
  param_4[0xd] = (0 < sVar14) * (sVar14 < 0x100) * auVar47[10] - (0xff < sVar14);
  param_4[0xe] = (0 < sVar15) * (sVar15 < 0x100) * auVar47[0xc] - (0xff < sVar15);
  param_4[0xf] = (0 < sVar16) * (sVar16 < 0x100) * auVar47[0xe] - (0xff < sVar16);
  *(uint *)(param_4 + 0x10) =
       uVar39 >> 0x18 | (uVar39 & 0xff0000) >> 8 | (uVar39 & 0xff00) << 8 | uVar39 << 0x18;
  return;
}
