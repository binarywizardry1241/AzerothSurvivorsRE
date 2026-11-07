/* WARNING: Removing unreachable block (ram,0x00014006835e) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140067fc0(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  ushort uVar1;
  code *pcVar2;
  undefined3 uVar3;
  undefined8 **ppuVar4;
  undefined1 auVar5 [12];
  undefined1 auVar6 [12];
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  char cVar10;
  uint uVar11;
  uint *puVar12;
  ulong uVar13;
  long *plVar14;
  long lVar15;
  ulong uVar16;
  undefined8 *puVar17;
  undefined8 *puVar18;
  long lVar19;
  char *pcVar20;
  int extraout_EDX;
  ulong uVar21;
  long lVar22;
  undefined8 uVar23;
  undefined8 *extraout_RDX;
  undefined8 **ppuVar24;
  undefined8 *puVar25;
  undefined8 **ppuVar26;
  bool bVar27;
  undefined4 in_XMM6_Da;
  uint uVar28;
  uint uVar29;
  uint uVar30;
  uint uVar31;
  undefined1 auVar32 [12];
  undefined1 auVar33 [12];
  undefined1 auVar34 [16];
  undefined8 uStack_2d8;
  undefined8 *puStack_2c0;
  undefined8 *puStack_2b8;
  undefined8 uStack_2b0;
  undefined8 **ppuStack_2a8;
  undefined8 **ppuStack_2a0;
  undefined8 uStack_298;
  undefined8 **ppuStack_290;
  undefined8 *puStack_288;
  undefined8 uStack_280;
  long lStack_278;
  undefined8 **ppuStack_270;
  long lStack_268;
  long lStack_260;
  char cStack_258;
  undefined4 uStack_257;
  undefined4 uStack_253;
  undefined4 uStack_24f;
  undefined4 uStack_24b;
  undefined7 uStack_247;
  undefined8 *puStack_240;
  undefined8 **ppuStack_238;
  undefined4 uStack_230;
  undefined4 uStack_22c;
  undefined8 **ppuStack_228;
  undefined8 uStack_220;
  long lStack_218;
  ulong uStack_210;
  char cStack_208;
  undefined1 uStack_207;
  undefined2 uStack_206;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined1 uStack_1f8;
  undefined7 uStack_1f7;
  undefined8 *puStack_1f0;
  long lStack_1e8;
  undefined8 uStack_1e0;
  char cStack_1d8;
  undefined8 *puStack_1b0;
  undefined8 uStack_1a8;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  undefined4 uStack_198;
  undefined4 uStack_194;
  undefined8 *puStack_190;
  undefined8 uStack_188;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  uint uStack_178;
  undefined4 uStack_174;
  undefined7 uStack_170;
  undefined1 uStack_169;
  int iStack_168;
  uint uStack_164;
  undefined8 uStack_160;
  undefined8 uStack_158;
  undefined8 uStack_150;
  uint uStack_148;
  uint uStack_144;
  uint uStack_140;
  uint uStack_13c;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_110;
  uint uStack_108;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f8;
  uint uStack_f4;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  long lStack_d8;
  undefined8 *puStack_d0;
  undefined1 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined8 *puStack_a0;
  undefined1 uStack_8c;
  undefined1 uStack_8b;
  undefined1 uStack_8a;
  undefined1 uStack_89;
  undefined8 *puStack_88;
  undefined8 *puStack_80;
  undefined1 uStack_71;
  undefined8 *puStack_70;
  undefined1 uStack_62;
  undefined1 uStack_61;
  undefined8 uStack_60;
  undefined4 uStack_58;

  uStack_60 = 0xfffffffffffffffe;
  uStack_148 = CONCAT31(uStack_148._1_3_,0xff);
  cStack_1d8 = -1;
  puStack_70 = (undefined8 *)0x0;
  lStack_1e8 = param_4;
  uStack_1e0 = param_3;
  uStack_58 = in_XMM6_Da;
  auVar32 = func_0x000145ba4280();
  iStack_168 = -1;
  uVar28 = 0;
  uVar29 = 0;
  uVar30 = 0;
  uVar31 = 0;
  puVar18 = (undefined8 *)0x0;
  lStack_268 = 0;
  uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
  uStack_1a8 = (undefined8 **)CONCAT44(uStack_1a8._4_4_,(uint)uStack_1a8);
LAB_140068069:
  uStack_164 = auVar32._8_4_;
  uStack_210 = auVar32._0_8_;
  puStack_70 = puVar18;
  auVar32 = func_0x000145ba4280();
  uStack_b8 = auVar32._0_8_;
  uStack_b0 = (undefined8 *)CONCAT44(uStack_b0._4_4_,auVar32._8_4_);
  puStack_70 = puVar18;
  func_0x000145ba4020();
  puStack_70 = puVar18;
  if (extraout_EDX == -1) {
    if (lStack_1e8 == 2) {
      func_0x0001401b8f30();
      ppuVar26 = uStack_100;
    }
    else if ((int)lStack_1e8 == 1) {
      func_0x0001401b8210();
      ppuVar26 = uStack_100;
    }
    else {
      FUN_1400561c0();
      ppuVar26 = uStack_100;
    }
    puStack_80 = puVar18;
    if ((char)uStack_108 == -2) {
      uStack_257 = CONCAT31(uStack_257._1_3_,1);
      cStack_258 = (char)uStack_108;
      goto LAB_140068167;
    }
    uStack_100._0_1_ = SUB81(ppuVar26,0);
    uStack_100._5_3_ = (undefined3)((ulong)ppuVar26 >> 0x28);
    uStack_247 = (undefined7)(CONCAT44(uStack_f4,uStack_f8) >> 8);
    puStack_240 = uStack_f0;
    uStack_257 = CONCAT13((undefined1)uStack_104,uStack_108._1_3_);
    uStack_253 = CONCAT13((undefined1)uStack_100,uStack_104._1_3_);
    uStack_24f = (int)((ulong)ppuVar26 >> 8);
    uStack_24b = CONCAT13((undefined1)uStack_f8,uStack_100._5_3_);
    cStack_258 = (char)uStack_108;
  }
  else if (lStack_1e8 == 0) {
    FUN_1400561c0();
    puStack_80 = puVar18;
    ppuVar26 = uStack_100;
  }
  else if ((int)lStack_1e8 == 1) {
    func_0x0001401b8210();
    puStack_80 = puVar18;
    ppuVar26 = uStack_100;
  }
  else {
    func_0x0001401b8f30();
    puStack_80 = puVar18;
    ppuVar26 = uStack_100;
  }
  if (cStack_258 != -2) {
    puVar12 = (uint *)&cStack_258;
    uStack_100 = ppuVar26;
    if ((byte)uStack_148 == -1) goto LAB_1400683e0;
    FUN_14005e410();
    puVar12 = (uint *)&cStack_258;
    goto LAB_1400683e0;
  }
LAB_140068167:
  uStack_100 = ppuVar26;
  if ((char)uStack_257 != '\0') {
    puVar18 = puStack_80;
    if (cStack_1d8 != -1) {
      puStack_288 = puStack_80;
      FUN_14005e410();
    }
    if (puVar18 != (undefined8 *)0x0) {
      (*_DAT_145d9a8c0)();
      func_0x0001400021d0();
    }
    if ((byte)uStack_148 != -1) {
      FUN_14005e410();
    }
    func_0x00014029efa0();
    return;
  }
  if (lStack_1e8 == 2) goto LAB_140068414;
LAB_140068198:
  puVar18 = puStack_80;
  uStack_108 = uVar28;
  uStack_104 = uVar29;
  uStack_100._0_4_ = uVar30;
  uStack_100._4_4_ = uVar31;
  uStack_f8 = uVar28;
  uStack_f4 = uVar29;
  puStack_70 = puStack_80;
  if ((int)lStack_1e8 == 1) {
    uStack_f0 = (undefined8 *)CONCAT44(uVar31,uVar30);
    uStack_e8 = 0;
    cVar10 = func_0x0001401b7920();
    if (cVar10 != '\0') {
      puStack_70 = puVar18;
      func_0x0001401b8050();
      if ((char)uStack_b8 == -2) {
        cStack_208 = -2;
        uStack_207 = 1;
        uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
      }
      else {
        uStack_1f8 = SUB81(uStack_a8,0);
        uStack_1f7 = (undefined7)((ulong)uStack_a8 >> 8);
        puStack_1f0 = puStack_a0;
        uStack_207 = (undefined1)((ulong)uStack_b8 >> 8);
        uStack_206 = (undefined2)((ulong)uStack_b8 >> 0x10);
        uStack_204 = uStack_b8._4_4_;
        uStack_200 = (undefined4)uStack_b0;
        uStack_1fc = uStack_b0._4_4_;
        cStack_208 = (char)uStack_b8;
      }
      goto LAB_140068427;
    }
  }
  else {
    uStack_f0 = (undefined8 *)CONCAT44(uVar31,uVar30);
    uStack_e8 = 0;
    cVar10 = FUN_140055e60();
    if (cVar10 != '\0') {
      plVar14 = (long *)CONCAT44(uStack_104,uStack_108);
      ppuVar26 = uStack_1a8;
      if (plVar14 == (long *)0x0) {
LAB_1400682ce:
        uStack_207 = 1;
        uStack_1a8._0_1_ = -2;
      }
      else {
        puVar12 = (uint *)*plVar14;
        puVar18 = (undefined8 *)plVar14[1];
        puVar17 = (undefined8 *)plVar14[2];
        puStack_190 = (undefined8 *)plVar14[3];
        plVar14[4] = CONCAT44(uStack_100._4_4_,(uint)uStack_100);
        uStack_b8._0_4_ = (uint)puVar12;
        uStack_b8._4_4_ = (undefined4)((ulong)puVar12 >> 0x20);
        uStack_b0._0_4_ = SUB84(puVar18,0);
        uStack_b0._4_4_ = (undefined4)((ulong)puVar18 >> 0x20);
        uStack_a8._0_4_ = SUB84(puVar17,0);
        uStack_a8._4_4_ = (undefined4)((ulong)puVar17 >> 0x20);
        uStack_198 = (undefined4)uStack_a8;
        uStack_194 = uStack_a8._4_4_;
        uStack_1a8._0_4_ = (uint)uStack_b8;
        uStack_1a8._4_4_ = uStack_b8._4_4_;
        uStack_1a0 = (undefined4)uStack_b0;
        uStack_19c = uStack_b0._4_4_;
        uStack_b8 = puVar12;
        uStack_b0 = puVar18;
        uStack_a8 = puVar17;
        puStack_a0 = puStack_190;
        FUN_140050770();
        ppuVar26 = (undefined8 **)CONCAT44(uStack_1a8._4_4_,(uint)uStack_1a8);
        uStack_180 = CONCAT13((undefined1)uStack_19c,uStack_1a0._1_3_);
        uStack_188 = CONCAT44(CONCAT13((undefined1)uStack_1a0,uStack_1a8._5_3_),
                              CONCAT13(uStack_1a8._4_1_,uStack_1a8._1_3_));
        uStack_17c._0_3_ = (undefined3)((uint)uStack_19c >> 8);
        uStack_17c._3_1_ = (undefined1)uStack_198;
        uStack_178 = (uint)(CONCAT44(uStack_194,uStack_198) >> 8);
        uVar3 = (undefined3)((uint)uStack_194 >> 8);
        uStack_174._3_1_ = SUB81(puStack_190,0);
        uStack_174 = CONCAT13(uStack_174._3_1_,uVar3);
        uStack_170 = (undefined7)((ulong)puStack_190 >> 8);
        puVar18 = puStack_80;
        if ((char)uStack_1a8 == -2) goto LAB_1400682ce;
        uStack_1f7 = CONCAT34(uVar3,uStack_178);
        puStack_1f0 = puStack_190;
        uStack_207 = (undefined1)((uint)uStack_1a8 >> 8);
        uStack_206 = (undefined2)((uint)uStack_1a8 >> 0x10);
        uStack_204 = uStack_1a8._4_4_;
        uStack_200 = uStack_1a0;
        uStack_1fc = uStack_19c;
        uStack_1f8 = uStack_17c._3_1_;
      }
      cStack_208 = (char)uStack_1a8;
      uStack_1a8 = ppuVar26;
      goto LAB_140068427;
    }
  }
  cStack_208 = -2;
  uStack_207 = 0;
LAB_140068427:
  do {
    puVar12 = (uint *)&cStack_208;
    if (cStack_208 == -2) {
      if ((byte)uStack_148 != -1) {
        if (puVar18 != (undefined8 *)0x0) {
          ppuVar26 = uStack_100;
          if (cStack_1d8 == -1) goto LAB_14006938d;
          puStack_70 = puVar18;
          cVar10 = FUN_14007de60();
          auVar32._8_4_ = uStack_164;
          auVar32._0_8_ = uStack_210;
          ppuVar26 = uStack_100;
          if (cVar10 == '\0') goto LAB_14006938d;
          goto LAB_140068069;
        }
        puStack_70 = (undefined8 *)0x0;
        auVar33 = func_0x000145ba4280();
        auVar32._8_4_ = uStack_164;
        auVar32._0_8_ = uStack_210;
        auVar6._8_4_ = uStack_164;
        auVar6._0_8_ = uStack_210;
        if (auVar33._0_8_ == uStack_210) {
          if (auVar33._8_4_ < uStack_164) {
            puVar18 = (undefined8 *)0x0;
            auVar32 = auVar6;
            goto LAB_140068069;
          }
        }
        else if (auVar33._0_8_ < uStack_210) {
          puVar18 = (undefined8 *)0x0;
          goto LAB_140068069;
        }
        puStack_70 = (undefined8 *)0x0;
        func_0x0001400a91d0();
        lVar19 = CONCAT44(uStack_104,uStack_108);
        ppuStack_2a8 = uStack_100;
        uVar16 = CONCAT44(uStack_f4,uStack_f8) * 0x20;
        ppuStack_290 = uStack_100 + CONCAT44(uStack_f4,uStack_f8) * 4;
        ppuVar26 = uStack_100 + 5;
        puVar12 = &uStack_f8;
        uStack_298 = lVar19;
        ppuStack_270 = ppuStack_290;
        ppuVar4 = uStack_100;
        break;
      }
      if (puVar18 != (undefined8 *)0x0) {
        (*_DAT_145d9a8c0)();
        func_0x0001400021d0();
      }
      if (cStack_1d8 != -1) {
        FUN_14005e410();
      }
      auVar32._8_4_ = uStack_164;
      auVar32._0_8_ = uStack_210;
      cStack_1d8 = -1;
      puVar18 = (undefined8 *)0x0;
      goto LAB_140068069;
    }
    if ((byte)uStack_148 != -1) {
      uVar11 = uStack_148 & 0xff;
      if (2 < uVar11) {
        if (uVar11 == 3) {
          lVar19 = CONCAT44(uStack_13c,uStack_140);
        }
        else {
          if (uVar11 != 4) {
            lVar19 = CONCAT44(uStack_13c,uStack_140);
            if (lVar19 != 0) {
              uStack_100._0_4_ = 0;
              uStack_100._4_4_ = 0;
              uStack_f8 = uStack_140;
              uStack_f4 = uStack_13c;
              uStack_f0 = puStack_138;
              uStack_e0 = 0;
              puStack_d0 = puStack_138;
              uStack_e8 = 1;
              lStack_d8 = lVar19;
              if (puStack_130 == (undefined8 *)0x0) {
                uStack_108 = 0;
                uStack_104 = 0;
                if (puStack_138 != (undefined8 *)0x0) {
                  puVar18 = puStack_138;
                  if (((ulong)puStack_138 & 7) != 0) {
                    uVar16 = 0;
                    do {
                      lVar19 = *(long *)(lVar19 + 0x278);
                      uVar16 = uVar16 + 1;
                    } while (((ulong)puStack_138 & 7) != uVar16);
                    puVar18 = (undefined8 *)((long)puStack_138 - uVar16);
                  }
                  if ((undefined8 *)0x7 < puStack_138) {
                    do {
                      lVar19 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)
                                                  (*(long *)(lVar19 + 0x278) + 0x278) + 0x278) +
                                                  0x278) + 0x278) + 0x278) + 0x278) + 0x278);
                      puVar18 = puVar18 + -1;
                    } while (puVar18 != (undefined8 *)0x0);
                  }
                }
                puStack_c8 = (undefined1 *)0x0;
                for (lVar19 = *(long *)(lVar19 + 0x160); lVar19 != 0;
                    lVar19 = *(long *)(lVar19 + 0x160)) {
                  func_0x0001400021d0();
                }
              }
              else {
                puStack_c8 = (undefined1 *)((long)puStack_130 + -1);
                if (puStack_138 != (undefined8 *)0x0) {
                  puVar18 = puStack_138;
                  if (((ulong)puStack_138 & 7) != 0) {
                    uVar16 = 0;
                    do {
                      lVar19 = *(long *)(lVar19 + 0x278);
                      uVar16 = uVar16 + 1;
                    } while (((ulong)puStack_138 & 7) != uVar16);
                    puVar18 = (undefined8 *)((long)puStack_138 - uVar16);
                  }
                  if ((undefined8 *)0x7 < puStack_138) {
                    do {
                      lVar19 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)
                                                  (*(long *)(lVar19 + 0x278) + 0x278) + 0x278) +
                                                  0x278) + 0x278) + 0x278) + 0x278) + 0x278);
                      puVar18 = puVar18 + -1;
                    } while (puVar18 != (undefined8 *)0x0);
                  }
                }
                uStack_108 = 1;
                uStack_104 = 0;
                if (*(short *)(lVar19 + 0x272) == 0) {
                  uVar16 = 0;
                  do {
                    uVar13 = uVar16;
                    lVar15 = *(long *)(lVar19 + 0x160);
                    if (lVar15 == 0) {
                      uVar23 = 0x2d8;
                      if (uVar13 == 0) {
                        uVar23 = 0x278;
                      }
                      func_0x0001400021d0(uVar13,0,uVar23,lVar19,8);
                      func_0x000145d995b0();
                      goto LAB_14006a04e;
                    }
                    uVar1 = *(ushort *)(lVar19 + 0x270);
                    puVar18 = (undefined8 *)(ulong)uVar1;
                    uVar16 = uVar13 - 1;
                    uVar23 = 0x2d8;
                    if (uVar13 == 0) {
                      uVar23 = 0x278;
                    }
                    func_0x0001400021d0(uVar13,lVar15,uVar23,lVar19);
                    lVar19 = lVar15;
                  } while (*(ushort *)(lVar19 + 0x272) <= uVar1);
                  if (uVar16 == 0) goto LAB_14006863d;
                  uVar21 = -uVar16;
                  plVar14 = (long *)(lVar19 + (long)puVar18 * 8 + 0x280);
                  if ((uVar21 & 7) == 0) {
                    lVar15 = lVar19;
                    if (6 < ~uVar16) goto LAB_140068d80;
LAB_140068d71:
                    puVar12 = &uStack_f8;
                    uStack_f0 = (undefined8 *)0x0;
                  }
                  else {
                    lVar22 = 0;
                    do {
                      lVar15 = *plVar14;
                      plVar14 = (long *)(lVar15 + 0x278);
                      lVar22 = lVar22 + -1;
                    } while (-lVar22 != (ulong)((byte)(1 - (char)uVar13) & 7));
                    uVar21 = lVar22 - uVar16;
                    if (~uVar16 < 7) goto LAB_140068d71;
LAB_140068d80:
                    do {
                      puVar12 = &uStack_f8;
                      lVar15 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)
                                                  (*plVar14 + 0x278) + 0x278) + 0x278) + 0x278) +
                                                  0x278) + 0x278) + 0x278);
                      plVar14 = (long *)(lVar15 + 0x278);
                      uVar21 = uVar21 - 8;
                    } while (uVar21 != 0);
                    uStack_f0 = (undefined8 *)0x0;
                  }
                }
                else {
                  puVar18 = (undefined8 *)0x0;
LAB_14006863d:
                  puVar12 = &uStack_f8;
                  uStack_f0 = (undefined8 *)((long)puVar18 + 1);
                  lVar15 = lVar19;
                }
                while( true ) {
                  uStack_100._0_4_ = (uint)lVar15;
                  uStack_100._4_4_ = (uint)((ulong)lVar15 >> 0x20);
                  uStack_f8 = 0;
                  uStack_f4 = 0;
                  uStack_b8 = &uStack_108;
                  if (*(long *)(lVar19 + 0x168 + (long)puVar18 * 0x18) != 0) {
                    func_0x0001400021d0();
                  }
                  FUN_14005e410();
                  if (puStack_c8 == (undefined1 *)0x0) break;
                  puStack_c8 = puStack_c8 + -1;
                  if (uStack_108 != 1) {
                    func_0x000145d995b0();
                    goto LAB_14006a04e;
                  }
                  lVar19 = CONCAT44(uStack_100._4_4_,(uint)uStack_100);
                  if (lVar19 == 0) {
                    lVar19 = CONCAT44(uStack_f4,uStack_f8);
                    if (uStack_f0 != (undefined8 *)0x0) {
                      puVar18 = uStack_f0;
                      if (((ulong)uStack_f0 & 7) != 0) {
                        uVar16 = 0;
                        do {
                          lVar19 = *(long *)(lVar19 + 0x278);
                          uVar16 = uVar16 + 1;
                        } while (((ulong)uStack_f0 & 7) != uVar16);
                        puVar18 = (undefined8 *)((long)uStack_f0 - uVar16);
                      }
                      if ((undefined8 *)0x7 < uStack_f0) {
                        do {
                          lVar19 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(
                                                  long *)(*(long *)(lVar19 + 0x278) + 0x278) + 0x278
                                                  ) + 0x278) + 0x278) + 0x278) + 0x278) + 0x278);
                          puVar18 = puVar18 + -1;
                        } while (puVar18 != (undefined8 *)0x0);
                      }
                    }
                    uStack_108 = 1;
                    uStack_104 = 0;
                    uStack_100._0_4_ = (uint)lVar19;
                    uStack_100._4_4_ = (uint)((ulong)lVar19 >> 0x20);
                    *puVar12 = uVar28;
                    puVar12[1] = uVar29;
                    puVar12[2] = uVar30;
                    puVar12[3] = uVar31;
                    puVar18 = (undefined8 *)0x0;
                    uVar16 = 0;
                    if (*(short *)(lVar19 + 0x272) == 0) goto LAB_140068f60;
                  }
                  else {
                    uVar16 = CONCAT44(uStack_f4,uStack_f8);
                    puVar18 = uStack_f0;
                    if ((undefined8 *)(ulong)*(ushort *)(lVar19 + 0x272) <= uStack_f0) {
LAB_140068f60:
                      do {
                        if (*(long *)(lVar19 + 0x160) == 0) {
                          func_0x0001400021d0();
                          func_0x000145d995b0();
                          goto LAB_14006a04e;
                        }
                        uVar16 = uVar16 + 1;
                        uVar1 = *(ushort *)(lVar19 + 0x270);
                        lVar19 = *(long *)(lVar19 + 0x160);
                        func_0x0001400021d0();
                        puVar18 = (undefined8 *)(ulong)uVar1;
                      } while (*(ushort *)(lVar19 + 0x272) <= uVar1);
                    }
                  }
                  if (uVar16 == 0) {
                    uStack_f0 = (undefined8 *)((long)puVar18 + 1);
                    lVar15 = lVar19;
                  }
                  else {
                    plVar14 = (long *)(lVar19 + (long)puVar18 * 8 + 0x280);
                    uVar13 = uVar16;
                    if ((uVar16 & 7) != 0) {
                      uVar13 = 0;
                      do {
                        lVar15 = *plVar14;
                        plVar14 = (long *)(lVar15 + 0x278);
                        uVar13 = uVar13 + 1;
                      } while ((uVar16 & 7) != uVar13);
                      uVar13 = uVar16 - uVar13;
                    }
                    uStack_f0 = (undefined8 *)0x0;
                    if (7 < uVar16) {
                      do {
                        lVar15 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long
                                                  *)(*plVar14 + 0x278) + 0x278) + 0x278) + 0x278) +
                                                  0x278) + 0x278) + 0x278);
                        plVar14 = (long *)(lVar15 + 0x278);
                        uVar13 = uVar13 - 8;
                      } while (uVar13 != 0);
                      uStack_f0 = (undefined8 *)0x0;
                    }
                  }
                }
                if (CONCAT44(uStack_104,uStack_108) != 1) goto LAB_1400691ec;
                lVar19 = CONCAT44(uStack_f4,uStack_f8);
                lVar15 = CONCAT44(uStack_100._4_4_,(uint)uStack_100);
                if ((CONCAT44(uStack_100._4_4_,(uint)uStack_100) == 0) &&
                   (lVar15 = lVar19, uStack_f0 != (undefined8 *)0x0)) {
                  puVar18 = uStack_f0;
                  if (((ulong)uStack_f0 & 7) != 0) {
                    uVar16 = 0;
                    do {
                      lVar19 = *(long *)(lVar19 + 0x278);
                      uVar16 = uVar16 + 1;
                    } while (((ulong)uStack_f0 & 7) != uVar16);
                    lVar15 = lVar19;
                    puVar18 = (undefined8 *)((long)uStack_f0 - uVar16);
                  }
                  if ((undefined8 *)0x7 < uStack_f0) {
                    do {
                      lVar15 = *(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)(*(long *)
                                                  (*(long *)(lVar15 + 0x278) + 0x278) + 0x278) +
                                                  0x278) + 0x278) + 0x278) + 0x278) + 0x278);
                      puVar18 = puVar18 + -1;
                    } while (puVar18 != (undefined8 *)0x0);
                  }
                }
                for (lVar19 = *(long *)(lVar15 + 0x160); lVar19 != 0;
                    lVar19 = *(long *)(lVar19 + 0x160)) {
                  func_0x0001400021d0();
                }
              }
              func_0x0001400021d0();
            }
LAB_1400691ec:
            puVar12 = (uint *)&cStack_208;
            goto LAB_1400683e0;
          }
          puStack_c0 = puStack_130;
          puStack_1b0 = puStack_138;
          puStack_88 = (undefined8 *)0x0;
          while (puStack_c0 != puStack_88) {
            puStack_88 = (undefined8 *)((long)puStack_88 + 1);
            FUN_14008bc40();
          }
          lVar19 = CONCAT44(uStack_13c,uStack_140);
        }
        if (lVar19 != 0) {
          func_0x0001400021d0();
        }
      }
    }
LAB_1400683e0:
    uStack_148 = *puVar12;
    uStack_144 = puVar12[1];
    uStack_140 = puVar12[2];
    uStack_13c = puVar12[3];
    puStack_138 = *(undefined8 **)(puVar12 + 4);
    puStack_130 = *(undefined8 **)(puVar12 + 6);
    if (lStack_1e8 != 2) goto LAB_140068198;
LAB_140068414:
    puVar18 = puStack_80;
    puStack_70 = puStack_80;
    func_0x0001401ba060();
  } while( true );
LAB_14006892b:
  uVar16 = uVar16 - 0x20;
  if (uStack_100 == ppuStack_270) goto LAB_1400690e8;
  ppuVar24 = uStack_100 + 4;
  puVar18 = *uStack_100;
  ppuStack_2a0 = ppuVar24;
  if (puVar18 == (undefined8 *)0xffffffffffffffff) {
    puVar18 = (undefined8 *)0x0;
    if (ppuStack_270 != ppuVar24) {
LAB_1400690fb:
      uVar16 = uVar16 >> 5;
      do {
        if (ppuVar26[-1] != (undefined8 *)0x0) {
          uStack_100 = ppuVar4;
          func_0x0001400021d0();
          ppuVar4 = uStack_100;
        }
        ppuVar26 = ppuVar26 + 4;
        uVar16 = uVar16 - 1;
      } while (uVar16 != 0);
    }
    goto LAB_140069336;
  }
  puStack_1b0 = uStack_100[1];
  puVar17 = uStack_100[2];
  uStack_108 = 0;
  uStack_100._0_4_ = 0;
  uStack_100._4_4_ = 0;
  uStack_f8 = 7;
  puStack_c0 = puVar18;
  *(undefined8 *)((long)puVar12 + 9) = 0;
  puVar12[1] = 0;
  puVar12[2] = 0;
  uStack_f0 = (undefined8 *)CONCAT62(uStack_f0._2_6_,0x101);
  auVar34 = func_0x000145bb24a0();
  puStack_88 = auVar34._8_8_;
  if (auVar34._0_8_ == 1) {
    uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
    if ((1 < (auVar34._8_4_ & 3) - 2) &&
       (uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100),
       ((ulong)puStack_88 & 3) != 0)) {
      uStack_b0 = (undefined8 *)((long)puStack_88 + -1);
      uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,3);
      func_0x000145bdf7c0();
    }
  }
  else {
    func_0x000140002200();
    puVar18 = (undefined8 *)func_0x0001400021c0();
    if (puVar18 == (undefined8 *)0x0) {
      func_0x000145d992a1();
      goto LAB_14006a04e;
    }
    *puVar18 = puStack_88;
    uStack_160 = (undefined8 **)0x0;
    uStack_150 = 0;
    puStack_80 = puVar18;
    func_0x000140002200();
    puVar18 = (undefined8 *)func_0x0001400021c0();
    if (puVar18 == (undefined8 *)0x0) {
      func_0x000145d992bb();
      goto LAB_14006a04e;
    }
    *(undefined1 *)puVar18 = 0x76;
    puStack_120 = (undefined8 *)0x1;
    uStack_110 = 1;
    uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,2);
    uStack_b0 = (undefined8 *)0x0;
    uStack_a8 = (undefined8 *)0x1;
    puVar25 = &uStack_1a8;
    puStack_118 = puVar18;
    FUN_140062cb0();
    if ((char)uStack_1a8 != -1) {
      FUN_14005e410();
    }
    func_0x000140002200();
    puVar18 = (undefined8 *)func_0x0001400021c0();
    if (puVar18 == (undefined8 *)0x0) {
      func_0x000145d992bb();
      goto LAB_14006a04e;
    }
    *puVar18 = 0x695f746e65696c63;
    *(undefined1 *)(puVar18 + 1) = 100;
    puStack_120 = (undefined8 *)0x9;
    uStack_110 = 9;
    puStack_118 = puVar18;
    func_0x000140002200();
    puStack_88 = (undefined8 *)func_0x0001400021c0();
    uVar9 = uRam0000000145dcf50f;
    uVar8 = uRam0000000145dcf50b;
    uVar7 = uRam0000000145dcf507;
    if (puStack_88 == (undefined8 *)0x0) {
      func_0x000145d992bb();
      goto LAB_14006a04e;
    }
    *(undefined4 *)puStack_88 = _DAT_145dcf503;
    *(undefined4 *)((long)puStack_88 + 4) = uVar7;
    *(undefined4 *)(puStack_88 + 1) = uVar8;
    *(undefined4 *)((long)puStack_88 + 0xc) = uVar9;
    *(undefined4 *)((long)puStack_88 + 0xf) = 0x34363532;
    uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,3);
    uStack_b0 = (undefined8 *)0x13;
    puStack_a0 = (undefined8 *)0x13;
    uStack_a8 = puStack_88;
    FUN_140062cb0();
    if ((char)uStack_1a8 != -1) {
      FUN_14005e410();
    }
    uStack_170 = (undefined7)uStack_150;
    uStack_169 = (undefined1)((ulong)uStack_150 >> 0x38);
    uStack_180 = (undefined4)uStack_160;
    uStack_17c = uStack_160._4_4_;
    uStack_178 = (uint)uStack_158;
    uStack_174 = uStack_158._4_4_;
    uStack_188 = CONCAT71(uStack_188._1_7_,5);
    uVar13 = FUN_14006b080();
    if (uVar13 == 0) {
      FUN_14006af20();
      ppuVar4 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
      puStack_88 = uStack_b0;
      if ((uStack_b0 != (undefined8 *)0xffffffffffffffff) && ((uint)uStack_b8 == 1)) {
        if (*_DAT_14807cfa8 < 3) {
          if (DAT_1480410b0 - 1 < 2) {
LAB_14006921e:
            cVar10 = func_0x000144c5d8d0();
            ppuVar4 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
            if (cVar10 != '\0') {
              uStack_f0 = (undefined8 *)(_DAT_1480410a0 + 0x30);
              puStack_120 = puStack_1b0;
              uStack_1a8 = &puStack_120;
              uStack_1a0 = 0x45bbfce0;
              uStack_19c = 1;
              uStack_160 = (undefined8 **)0x145dcf516;
              puStack_2c0 = &uStack_160;
              puStack_2b8 = (undefined8 *)0x145dcf3b8;
              uStack_108 = 1;
              uStack_104 = 0;
              uStack_100 = &puStack_2c0;
              uStack_f8 = 1;
              uStack_f4 = 0;
              uStack_158 = puVar25;
              puStack_118 = puVar17;
              func_0x000144c5f0f0();
              ppuVar4 = uStack_100;
            }
          }
          else if (DAT_1480410b0 != 0) {
            cVar10 = func_0x000145d45220();
            ppuVar4 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
            if (cVar10 != '\0') goto LAB_14006921e;
          }
        }
        uStack_100 = ppuVar4;
        if (puStack_88 != (undefined8 *)0x0) {
          func_0x0001400021d0();
        }
        uStack_61 = 0;
        FUN_14005e410();
        if (puStack_c0 != (undefined8 *)0x0) {
          func_0x0001400021d0();
        }
        puVar18 = puStack_80;
        ppuVar4 = uStack_100;
        if (ppuStack_270 != ppuVar24) goto LAB_1400690fb;
        goto LAB_140069336;
      }
      if (uStack_b0 == (undefined8 *)0xffffffffffffffff) {
        uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
        if ((1 < ((uint)uStack_b8 & 3) - 2) && (uStack_100 = ppuVar4, ((ulong)uStack_b8 & 3) != 0))
        {
          uStack_100 = (undefined8 **)((long)uStack_b8 + -1);
          uStack_108 = CONCAT31(uStack_108._1_3_,3);
          func_0x000145bdf7c0();
        }
      }
      else {
        uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
        if (uStack_b0 != (undefined8 *)0x0) {
          func_0x0001400021d0();
          uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
        }
      }
    }
    else {
      uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
      if ((1 < ((uint)uVar13 & 3) - 2) &&
         (uStack_100 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100), (uVar13 & 3) != 0
         )) {
        uStack_100 = (undefined8 **)(uVar13 - 1);
        uStack_108 = CONCAT31(uStack_108._1_3_,3);
        func_0x000145bdf7c0();
      }
    }
    uStack_61 = 1;
    FUN_14005e410();
    (*_DAT_145d9a8c0)();
    puVar12 = &uStack_f8;
    func_0x0001400021d0();
  }
  ppuVar4 = uStack_100;
  if (puStack_c0 != (undefined8 *)0x0) {
    func_0x0001400021d0();
    ppuVar4 = uStack_100;
  }
  uStack_100 = ppuVar24;
  ppuVar26 = ppuVar26 + 4;
  goto LAB_14006892b;
LAB_1400690e8:
  puVar18 = (undefined8 *)0x0;
LAB_140069336:
  puStack_80 = puVar18;
  uStack_100 = ppuVar4;
  if (lVar19 != 0) {
    func_0x0001400021d0();
  }
  if (cStack_1d8 != -1) {
    FUN_14005e410();
  }
  cStack_1d8 = -1;
  puVar18 = puStack_80;
  ppuVar26 = uStack_100;
  if (puStack_80 == (undefined8 *)0x0) {
    puStack_70 = (undefined8 *)0x0;
    func_0x000145ba4280();
    puStack_70 = (undefined8 *)0x0;
    auVar32 = func_0x000145bc14f0();
    puVar18 = (undefined8 *)0x0;
    goto LAB_140068069;
  }
LAB_14006938d:
  uStack_100._4_4_ = (uint)((ulong)ppuVar26 >> 0x20);
  if (iStack_168 != -1) {
    uStack_108 = (uint)uStack_2d8;
    uStack_104 = (uint)((ulong)uStack_2d8 >> 0x20);
    uStack_100._0_4_ = iStack_168;
    puStack_70 = puVar18;
    uVar16 = func_0x000145ba43d0();
    auVar32._8_4_ = uStack_164;
    auVar32._0_8_ = uStack_210;
    ppuVar26 = (undefined8 **)CONCAT44(uStack_100._4_4_,(uint)uStack_100);
    uStack_100 = ppuVar26;
    if (uVar16 < 4) goto LAB_140068069;
  }
  puStack_70 = puVar18;
  uStack_100 = ppuVar26;
  auVar32 = func_0x000145ba4280();
  iStack_168 = auVar32._8_4_;
  uStack_2d8 = auVar32._0_8_;
  ppuStack_238 = (undefined8 **)0x0;
  ppuStack_228 = (undefined8 **)0x0;
  func_0x000140002200();
  puVar17 = (undefined8 *)func_0x0001400021c0();
  puStack_80 = puVar18;
  if (puVar17 == (undefined8 *)0x0) {
    func_0x000145d992bb();
  }
  else {
    *(undefined1 *)((long)puVar17 + 2) = 100;
    *(undefined2 *)puVar17 = 0x6d63;
    uStack_188 = 3;
    uStack_180 = SUB84(puVar17,0);
    uStack_17c = (undefined4)((ulong)puVar17 >> 0x20);
    uStack_178 = 3;
    uStack_174 = 0;
    puStack_c0 = puVar17;
    func_0x000140002200();
    puStack_88 = (undefined8 *)func_0x0001400021c0();
    if (puStack_88 == (undefined8 *)0x0) {
      func_0x000145d992bb();
    }
    else {
      *puStack_88 = 0x495443415f544553;
      *(undefined4 *)(puStack_88 + 1) = 0x59544956;
      uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,3);
      uStack_b0 = (undefined8 *)0xc;
      puStack_a0 = (undefined8 *)0xc;
      uStack_a8 = puStack_88;
      FUN_140062cb0();
      if ((char)uStack_1a8 != -1) {
        FUN_14005e410();
      }
      func_0x000140002200();
      puVar18 = (undefined8 *)func_0x0001400021c0();
      if (puVar18 == (undefined8 *)0x0) {
        func_0x000145d992bb();
      }
      else {
        *(undefined4 *)puVar18 = 0x73677261;
        puStack_2c0 = (undefined8 *)0x4;
        uStack_2b0 = 4;
        uStack_160 = (undefined8 **)0x0;
        uStack_150 = 0;
        puStack_2b8 = puVar18;
        puStack_88 = puVar18;
        func_0x000140002200();
        puVar18 = (undefined8 *)func_0x0001400021c0();
        if (puVar18 == (undefined8 *)0x0) {
          func_0x000145d992bb();
        }
        else {
          *(undefined1 *)((long)puVar18 + 2) = 100;
          *(undefined2 *)puVar18 = 0x6970;
          puStack_120 = (undefined8 *)0x3;
          uStack_110 = 3;
          uStack_89 = 1;
          puStack_118 = puVar18;
          puStack_c0 = puVar18;
          uVar11 = func_0x000145bb5680();
          uStack_a8 = (undefined8 *)(ulong)uVar11;
          uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,2);
          uStack_b0 = (undefined8 *)0x0;
          uStack_89 = 0;
          FUN_140062cb0();
          if ((char)uStack_1a8 != -1) {
            FUN_14005e410();
          }
          func_0x000140002200();
          puVar18 = (undefined8 *)func_0x0001400021c0();
          if (puVar18 == (undefined8 *)0x0) {
            func_0x000145d992bb();
          }
          else {
            *puVar18 = 0x7974697669746361;
            puStack_120 = (undefined8 *)0x8;
            uStack_110 = 8;
            uStack_62 = 1;
            puStack_118 = puVar18;
            puStack_c0 = puVar18;
            FUN_140060380();
            if ((char)uStack_b8 == -1) {
              uStack_1a8._0_4_ = (undefined4)uStack_b0;
              uStack_1a8._4_4_ = uStack_b0._4_4_;
              func_0x000145d995d0();
            }
            else {
              uStack_198 = (undefined4)uStack_a8;
              uStack_194 = uStack_a8._4_4_;
              puStack_190 = puStack_a0;
              uStack_1a8._0_4_ = (uint)uStack_b8;
              uStack_1a8._4_4_ = uStack_b8._4_4_;
              uStack_1a0 = (undefined4)uStack_b0;
              uStack_19c = uStack_b0._4_4_;
              uStack_62 = 0;
              FUN_140062cb0();
              if ((char)uStack_b8 != -1) {
                FUN_14005e410();
              }
              uStack_170 = (undefined7)uStack_150;
              uStack_169 = (undefined1)((ulong)uStack_150 >> 0x38);
              uStack_180 = (undefined4)uStack_160;
              uStack_17c = uStack_160._4_4_;
              uStack_178 = (uint)uStack_158;
              uStack_174 = uStack_158._4_4_;
              uStack_188 = CONCAT71(uStack_188._1_7_,5);
              uStack_8a = 0;
              FUN_140062cb0();
              if ((char)uStack_b8 != -1) {
                FUN_14005e410();
              }
              func_0x000140002200();
              puVar18 = (undefined8 *)func_0x0001400021c0();
              if (puVar18 == (undefined8 *)0x0) {
                func_0x000145d992bb();
              }
              else {
                lStack_268 = lStack_268 + 1;
                *(undefined1 *)((long)puVar18 + 4) = 0x65;
                *(undefined4 *)puVar18 = 0x636e6f6e;
                uStack_188 = 5;
                uStack_180 = SUB84(puVar18,0);
                uStack_17c = (undefined4)((ulong)puVar18 >> 0x20);
                uStack_178 = 5;
                uStack_174 = 0;
                puStack_88 = puVar18;
                func_0x000145bd3fa0();
                if (-1 < (long)extraout_RDX) {
                  bVar27 = extraout_RDX == (undefined8 *)0x0;
                  puVar18 = extraout_RDX;
                  puStack_c0 = extraout_RDX;
                  if (bVar27) {
                    puVar17 = (undefined8 *)0x1;
                    lStack_260 = 1;
LAB_140069856:
                    uStack_b8 = (uint *)CONCAT71(uStack_b8._1_7_,3);
                    uStack_8c = 0;
                    lVar19 = lStack_260;
                    lStack_278 = lStack_260;
                    uStack_b0 = puVar18;
                    uStack_a8 = puVar17;
                    puStack_a0 = puVar18;
                    uStack_8b = bVar27;
                    FUN_140062cb0();
                    if ((char)uStack_1a8 != -1) {
                      lStack_218 = lVar19;
                      uStack_71 = bVar27;
                      FUN_14005e410();
                    }
                    if (puStack_c0 != (undefined8 *)0x0) {
                      func_0x0001400021d0();
                    }
                    ppuStack_290 = ppuStack_228;
                    ppuStack_2a0 = ppuStack_238;
                    uStack_298 = CONCAT44(uStack_22c,uStack_230);
                    ppuStack_2a8 = (undefined8 **)CONCAT71(ppuStack_2a8._1_7_,5);
                    uVar16 = FUN_14006b080();
                    puVar12 = &uStack_f8;
                    if (uVar16 == 0) {
                      FUN_14006af20();
                      if (CONCAT44(uStack_17c,uStack_180) != -1) {
                        puStack_c0 = (undefined8 *)CONCAT44(uStack_174,uStack_178);
                        uStack_108 = uStack_178;
                        uStack_104 = uStack_174;
                        uStack_100._0_4_ = (uint)uStack_170;
                        uStack_100._4_4_ = (uint)(CONCAT17(uStack_169,uStack_170) >> 0x20);
                        puStack_88 = (undefined8 *)CONCAT44(uStack_17c,uStack_180);
                        *puVar12 = uVar28;
                        puVar12[1] = uVar29;
                        puVar12[2] = uVar30;
                        puVar12[3] = uVar31;
                        func_0x000140179a50();
                        if ((char)uStack_b8 == -1) {
                          uStack_1a8._0_4_ = (uint)uStack_1a8 & 0xffffff00;
                          FUN_14005e350();
                        }
                        else {
                          uStack_198 = SUB84(uStack_a8,0);
                          uStack_194 = (undefined4)((ulong)uStack_a8 >> 0x20);
                          puStack_190 = puStack_a0;
                          uStack_1a8._0_4_ = (uint)uStack_b8;
                          uStack_1a8._4_4_ = uStack_b8._4_4_;
                          uStack_1a0 = (undefined4)uStack_b0;
                          uStack_19c = uStack_b0._4_4_;
                        }
                        pcVar20 = (char *)func_0x000142aeace0();
                        if (pcVar20 == (char *)0x0) {
                          pcVar20 = _DAT_148060290;
                        }
                        if ((((((*pcVar20 == '\x03') && (*(long *)(pcVar20 + 0x18) == 5)) &&
                              ((char)(*(int **)(pcVar20 + 0x10))[1] == 'R' &&
                               **(int **)(pcVar20 + 0x10) == 0x4f525245)) && (*_DAT_14807cfa8 < 4))
                            && ((DAT_148041098 - 1 < 2 ||
                                ((DAT_148041098 != 0 &&
                                 (cVar10 = func_0x000145d45220(), cVar10 != '\0')))))) &&
                           (cVar10 = func_0x000144c5d8d0(), cVar10 != '\0')) {
                          lVar19 = _DAT_148041088;
                          uStack_b8 = (uint *)func_0x000142aeace0();
                          if (uStack_b8 == (uint *)0x0) {
                            uStack_b8 = (uint *)_DAT_148060290;
                          }
                          uStack_f0 = (undefined8 *)(lVar19 + 0x30);
                          uStack_b0 = (undefined8 *)0x142aeb950;
                          puStack_120 = (undefined8 *)0x145dcf457;
                          puStack_118 = &uStack_b8;
                          uStack_160 = &puStack_120;
                          uStack_158 = (undefined8 *)0x145dcf3b8;
                          uStack_108 = 1;
                          uStack_104 = 0;
                          uStack_100 = (undefined8 **)&uStack_160;
                          uStack_f8 = 1;
                          uStack_f4 = 0;
                          func_0x000144c5f0f0();
                    /* WARNING: Could not emulate address calculation at 0x000140069b96 */
                    /* WARNING: Treating indirect jump as call */
                          (*(code *)((long)*(int *)((ulong)(byte)uStack_148 * 4 + 0x145dd0e0c) +
                                    0x145dd0e0c))();
                          return;
                        }
                    /* WARNING: Could not emulate address calculation at 0x000140069bb8 */
                    /* WARNING: Treating indirect jump as call */
                        (*(code *)((long)*(int *)((ulong)(byte)uStack_148 * 4 + 0x145dd0e0c) +
                                  0x145dd0e0c))();
                        return;
                      }
                    }
                    else {
                      uStack_180 = 0xffffffff;
                      uStack_17c = 0xffffffff;
                      uStack_188 = uVar16;
                    }
                    (*_DAT_145d9a8c0)();
                    func_0x0001400021d0();
                    uStack_220 = 0;
                    func_0x000145ba4280();
                    uStack_220 = 0;
                    auVar32 = func_0x000145bc14f0();
                    uStack_164 = auVar32._8_4_;
                    uStack_210 = auVar32._0_8_;
                    puVar18 = (undefined8 *)0x0;
                    uStack_280 = 0;
                    FUN_14005e410();
                    auVar5._8_4_ = uStack_164;
                    auVar5._0_8_ = uStack_210;
                    auVar33._8_4_ = uStack_164;
                    auVar33._0_8_ = uStack_210;
                    auVar32._8_4_ = uStack_164;
                    auVar32._0_8_ = uStack_210;
                    uStack_1a8 = (undefined8 **)CONCAT44(uStack_1a8._4_4_,(uint)uStack_1a8);
                    if (((CONCAT44(uStack_17c,uStack_180) == -1) &&
                        (uStack_1a8 = (undefined8 **)CONCAT44(uStack_1a8._4_4_,(uint)uStack_1a8),
                        auVar32 = auVar33, 1 < ((uint)uStack_188 & 3) - 2)) &&
                       (uStack_1a8 = (undefined8 **)CONCAT44(uStack_1a8._4_4_,(uint)uStack_1a8),
                       auVar32 = auVar5, (uStack_188 & 3) != 0)) {
                      uStack_100 = (undefined8 **)(uStack_188 - 1);
                      uStack_108 = CONCAT31(uStack_108._1_3_,3);
                      puStack_70 = puVar18;
                      func_0x000145bdf7c0();
                      auVar32._8_4_ = uStack_164;
                      auVar32._0_8_ = uStack_210;
                    }
                    goto LAB_140068069;
                  }
                  func_0x000140002200();
                  lVar19 = func_0x0001400021c0();
                  if (lVar19 != 0) {
                    func_0x000145bfa0e7();
                    func_0x000140002200();
                    puVar17 = (undefined8 *)func_0x0001400021c0();
                    if (puVar17 == (undefined8 *)0x0) {
                      uStack_8b = 0;
                      uStack_8c = 1;
                      lStack_278 = lVar19;
                      func_0x000145d992bb();
                      goto LAB_14006a04e;
                    }
                    func_0x000145bfa0e7();
                    lStack_260 = lVar19;
                    goto LAB_140069856;
                  }
                }
                func_0x000145d992bb();
              }
            }
          }
        }
      }
    }
  }
LAB_14006a04e:
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
