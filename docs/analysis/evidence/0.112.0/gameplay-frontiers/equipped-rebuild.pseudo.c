void FUN_14592d530(longlong param_1)

{
  longlong *plVar1;
  longlong lVar2;
  ulonglong *puVar3;
  undefined8 uVar4;
  code *pcVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  longlong lVar10;
  int iVar11;
  ulonglong uVar12;
  longlong *plVar13;
  undefined4 *puVar14;
  longlong lVar15;
  longlong *plVar16;
  ulonglong uVar17;
  char *pcVar18;
  longlong lVar19;
  char *pcVar20;
  undefined8 *puVar21;
  ulonglong *puVar22;
  ulonglong *puVar23;
  longlong lVar24;
  ulonglong uVar25;
  undefined8 *puVar26;
  ulonglong uVar27;
  ulonglong uVar28;
  float fVar29;
  undefined8 uStack_288;
  undefined8 uStack_280;
  undefined8 uStack_278;
  undefined8 uStack_270;
  undefined4 uStack_268;
  undefined4 uStack_264;
  undefined4 uStack_260;
  undefined4 uStack_25c;
  undefined4 uStack_258;
  undefined4 uStack_254;
  undefined4 uStack_250;
  undefined4 uStack_24c;
  ulonglong uStack_248;
  undefined8 uStack_240;
  undefined8 uStack_238;
  undefined8 uStack_230;
  undefined8 uStack_228;
  undefined8 uStack_220;
  undefined8 uStack_218;
  undefined8 uStack_210;
  undefined4 uStack_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 uStack_1f0;
  undefined4 uStack_1ec;
  ulonglong uStack_1e8;
  undefined8 uStack_1e0;
  undefined8 uStack_1d8;
  undefined8 uStack_1d0;
  undefined8 uStack_1c8;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  undefined4 uStack_1b8;
  undefined4 uStack_1b4;
  undefined4 uStack_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  undefined4 uStack_198;
  undefined4 uStack_194;
  undefined8 uStack_190;
  undefined4 uStack_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  undefined4 uStack_174;
  float fStack_170;
  undefined4 uStack_16c;
  char *pcStack_168;
  longlong lStack_160;
  longlong lStack_158;
  char *pcStack_150;
  longlong lStack_148;
  undefined4 uStack_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined8 uStack_128;
  undefined8 uStack_120;
  undefined8 uStack_118;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  ulonglong uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  longlong lStack_c8;
  longlong *plStack_c0;
  char *pcStack_b8;
  longlong *plStack_b0;
  undefined1 uStack_a2;
  undefined1 uStack_a1;
  undefined8 uStack_a0;

  uStack_a0 = 0xfffffffffffffffe;
  FUN_145897880(&uStack_288,param_1 + 0x1c8);
  plVar16 = (longlong *)uStack_248;
  uStack_a2 = 1;
  FUN_1459cdb60(&uStack_128);
  plVar13 = (longlong *)CONCAT44(uStack_118._4_4_,(undefined4)uStack_118);
  if (CONCAT44(uStack_128._4_4_,(undefined4)uStack_128) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_120._4_4_,(undefined4)uStack_120),
                        CONCAT44(uStack_128._4_4_,(undefined4)uStack_128) * 0x18);
  }
  uStack_1d8 = uStack_238;
  uStack_1d0 = uStack_230;
  uStack_1e8 = uStack_248;
  uStack_1e0 = uStack_240;
  uStack_1f8 = uStack_258;
  uStack_1f4 = uStack_254;
  uStack_1f0 = uStack_250;
  uStack_1ec = uStack_24c;
  uStack_208 = uStack_268;
  uStack_204 = uStack_264;
  uStack_200 = uStack_260;
  uStack_1fc = uStack_25c;
  uStack_218 = uStack_278;
  uStack_210 = uStack_270;
  uStack_228 = uStack_288;
  uStack_220 = uStack_280;
  plStack_b0 = plVar16;
  plStack_c0 = plVar13;
  if (*(longlong *)(param_1 + 0x3a0) != -1) {
    uVar12 = 4;
    if (*(ulonglong *)(param_1 + 0x400) < 4) {
      uVar12 = *(ulonglong *)(param_1 + 0x400);
    }
    fVar29 = (float)func_0x000145c0a465(*(float *)(&DAT_146c022bc + (uVar12 & 0xffffffff) * 4) *
                                        -0.5 + 1.0,
                                        (float)(int)(*(int *)(param_1 + 0x408) + -1 +
                                                    (uint)(*(int *)(param_1 + 0x408) == 0)));
    fStack_170 = 3.0 - (fVar29 + fVar29);
    lVar2 = *(longlong *)(param_1 + 0x3d8);
    uStack_120 = *(longlong *)(param_1 + 0x3e0) * 0x40 + lVar2;
    uStack_128._0_4_ = (undefined4)lVar2;
    uStack_128._4_4_ = (undefined4)((ulonglong)lVar2 >> 0x20);
    uStack_118 = &fStack_170;
    uStack_a1 = 1;
    FUN_1459d9940(&lStack_158,&uStack_128);
    lStack_c8 = lStack_158;
    pcStack_b8 = pcStack_150;
    if (lStack_148 != 0) {
      pcVar20 = pcStack_150 + lStack_148 * 0x40;
      pcVar18 = pcStack_150;
      do {
        if (*pcVar18 == -1) break;
        uStack_f4 = *(undefined4 *)(pcVar18 + 0x34);
        uStack_f0 = *(undefined4 *)(pcVar18 + 0x38);
        uStack_ec = *(undefined4 *)(pcVar18 + 0x3c);
        uStack_104._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x25);
        uStack_104 = CONCAT31(uStack_104._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x21) >> 0x18)
                             );
        uStack_100._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x29);
        uStack_100 = CONCAT31(uStack_100._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x25) >> 0x18)
                             );
        uStack_fc._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x2d);
        uStack_fc = CONCAT31(uStack_fc._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x29) >> 0x18));
        uStack_f8._1_3_ = (undefined3)((uint)*(undefined4 *)(pcVar18 + 0x30) >> 8);
        uStack_f8._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar18 + 0x2d) >> 0x18);
        uStack_118._5_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x15);
        uStack_118._4_4_ =
             CONCAT31(uStack_118._5_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x11) >> 0x18));
        uStack_110._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x19);
        uStack_110 = CONCAT31(uStack_110._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x15) >> 0x18)
                             );
        uStack_10c._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0x1d);
        uStack_10c = CONCAT31(uStack_10c._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 0x19) >> 0x18)
                             );
        uStack_108._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar18 + 0x1d) >> 0x18);
        uStack_108 = CONCAT31((int3)*(undefined4 *)(pcVar18 + 0x21),(undefined1)uStack_108);
        uStack_128._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar18 + 1),*pcVar18);
        uStack_128._5_3_ = (undefined3)*(undefined4 *)(pcVar18 + 5);
        uStack_128._4_4_ =
             CONCAT31(uStack_128._5_3_,(char)((uint)*(undefined4 *)(pcVar18 + 1) >> 0x18));
        uStack_120._1_3_ = (undefined3)*(undefined4 *)(pcVar18 + 9);
        uStack_120._0_4_ =
             CONCAT31(uStack_120._1_3_,(char)((uint)*(undefined4 *)(pcVar18 + 5) >> 0x18));
        uStack_120._5_3_ = (undefined3)*(undefined4 *)(pcVar18 + 0xd);
        uStack_120._4_4_ =
             CONCAT31(uStack_120._5_3_,(char)((uint)*(undefined4 *)(pcVar18 + 9) >> 0x18));
        uStack_118._0_1_ = (undefined1)((uint)*(undefined4 *)(pcVar18 + 0xd) >> 0x18);
        uStack_118._0_4_ = CONCAT31((int3)*(undefined4 *)(pcVar18 + 0x11),(undefined1)uStack_118);
        FUN_145bdd5f0(&fStack_170,param_1 + 0x3b8);
        lStack_148 = lStack_160;
        lStack_158 = CONCAT44(uStack_16c,fStack_170);
        pcStack_150 = pcStack_168;
        uStack_140 = *(undefined4 *)(param_1 + 1000);
        uStack_13c = *(undefined4 *)(param_1 + 0x3ec);
        uStack_138 = *(undefined4 *)(param_1 + 0x3f0);
        uStack_134 = *(undefined4 *)(param_1 + 0x3f4);
        FUN_1458975c0(&uStack_228,&uStack_128);
        pcVar18 = pcVar18 + 0x40;
      } while (pcVar18 != pcVar20);
    }
    plVar16 = plStack_b0;
    plVar13 = plStack_c0;
    if (lStack_c8 != 0) {
      func_0x0001400021d0(pcStack_b8,lStack_c8 << 6);
    }
  }
  uStack_d8 = uStack_1d8;
  uStack_d0 = uStack_1d0;
  uStack_e8 = uStack_1e8;
  uStack_e0 = uStack_1e0;
  uStack_f8 = uStack_1f8;
  uStack_f4 = uStack_1f4;
  uStack_f0 = uStack_1f0;
  uStack_ec = uStack_1ec;
  uStack_108 = uStack_208;
  uStack_104 = uStack_204;
  uStack_100 = uStack_200;
  uStack_fc = uStack_1fc;
  uStack_118._0_4_ = (undefined4)uStack_218;
  uStack_118._4_4_ = uStack_218._4_4_;
  uStack_110 = (undefined4)uStack_210;
  uStack_10c = uStack_210._4_4_;
  uStack_128._0_4_ = (undefined4)uStack_228;
  uStack_128._4_4_ = uStack_228._4_4_;
  uStack_120._0_4_ = (undefined4)uStack_220;
  uStack_120._4_4_ = uStack_220._4_4_;
  lVar2 = param_1 + 0x7f0;
  FUN_145896300(lVar2);
  *(undefined8 *)(param_1 + 0x840) = uStack_d8;
  *(undefined8 *)(param_1 + 0x848) = uStack_d0;
  *(ulonglong *)(param_1 + 0x830) = uStack_e8;
  *(undefined8 *)(param_1 + 0x838) = uStack_e0;
  *(undefined4 *)(param_1 + 0x820) = uStack_f8;
  *(undefined4 *)(param_1 + 0x824) = uStack_f4;
  *(undefined4 *)(param_1 + 0x828) = uStack_f0;
  *(undefined4 *)(param_1 + 0x82c) = uStack_ec;
  *(undefined4 *)(param_1 + 0x810) = uStack_108;
  *(undefined4 *)(param_1 + 0x814) = uStack_104;
  *(undefined4 *)(param_1 + 0x818) = uStack_100;
  *(undefined4 *)(param_1 + 0x81c) = uStack_fc;
  *(undefined4 *)(param_1 + 0x800) = (undefined4)uStack_118;
  *(undefined4 *)(param_1 + 0x804) = uStack_118._4_4_;
  *(undefined4 *)(param_1 + 0x808) = uStack_110;
  *(undefined4 *)(param_1 + 0x80c) = uStack_10c;
  *(undefined4 *)(param_1 + 0x7f0) = (undefined4)uStack_128;
  *(undefined4 *)(param_1 + 0x7f4) = uStack_128._4_4_;
  *(undefined4 *)(param_1 + 0x7f8) = (undefined4)uStack_120;
  *(undefined4 *)(param_1 + 0x7fc) = uStack_120._4_4_;
  uVar12 = *(ulonglong *)(param_1 + 0x78);
  if (plVar16 <= *(ulonglong *)(param_1 + 0x78)) {
    *(longlong **)(param_1 + 0x78) = plVar16;
    uVar12 = (ulonglong)plVar16;
  }
  uVar28 = *(ulonglong *)(param_1 + 0x830);
  uVar25 = uVar28 - uVar12;
  if (uVar12 <= uVar28 && uVar25 != 0) {
    if (*(longlong *)(param_1 + 0x68) - uVar12 < uVar25) {
      uStack_a1 = 0;
      FUN_145c0d470((longlong *)(param_1 + 0x68),uVar12,uVar25,4,4);
      lVar19 = *(longlong *)(param_1 + 0x70);
      puVar14 = (undefined4 *)(lVar19 + *(ulonglong *)(param_1 + 0x78) * 4);
      uVar27 = *(ulonglong *)(param_1 + 0x78);
    }
    else {
      lVar19 = *(longlong *)(param_1 + 0x70);
      puVar14 = (undefined4 *)(lVar19 + uVar12 * 4);
      uVar27 = uVar12;
    }
    if (1 < uVar25) {
      func_0x000145c0a3e1(puVar14,0);
      puVar14 = (undefined4 *)(lVar19 + (uVar28 + uVar27) * 4 + uVar12 * -4 + -4);
      uVar27 = (uVar27 + uVar25) - 1;
    }
    *puVar14 = 0;
    uVar28 = uVar27 + 1;
    plVar13 = plStack_c0;
    plVar16 = plStack_b0;
  }
  *(ulonglong *)(param_1 + 0x78) = uVar28;
  uVar12 = *(ulonglong *)(param_1 + 0x90);
  if (plVar16 <= *(ulonglong *)(param_1 + 0x90)) {
    *(longlong **)(param_1 + 0x90) = plVar16;
    uVar12 = (ulonglong)plVar16;
  }
  uVar28 = *(ulonglong *)(param_1 + 0x830);
  uVar25 = uVar28 - uVar12;
  if (uVar12 <= uVar28 && uVar25 != 0) {
    if (*(longlong *)(param_1 + 0x80) - uVar12 < uVar25) {
      uStack_a1 = 0;
      FUN_145c0d470((longlong *)(param_1 + 0x80),uVar12,uVar25,4,4);
      lVar19 = *(longlong *)(param_1 + 0x88);
      puVar14 = (undefined4 *)(lVar19 + *(ulonglong *)(param_1 + 0x90) * 4);
      uVar27 = *(ulonglong *)(param_1 + 0x90);
    }
    else {
      lVar19 = *(longlong *)(param_1 + 0x88);
      puVar14 = (undefined4 *)(lVar19 + uVar12 * 4);
      uVar27 = uVar12;
    }
    if (1 < uVar25) {
      func_0x000145c0a3e1(puVar14,0);
      puVar14 = (undefined4 *)(lVar19 + (uVar28 + uVar27) * 4 + uVar12 * -4 + -4);
      uVar27 = (uVar27 + uVar25) - 1;
    }
    *puVar14 = 0;
    uVar28 = uVar27 + 1;
    plVar13 = plStack_c0;
    plVar16 = plStack_b0;
  }
  *(ulonglong *)(param_1 + 0x90) = uVar28;
  uVar12 = *(ulonglong *)(param_1 + 0xa8);
  lVar19 = uVar12 - (longlong)plVar16;
  if (plVar16 <= uVar12) {
    *(longlong **)(param_1 + 0xa8) = plVar16;
    uVar12 = (ulonglong)plVar16;
    if (lVar19 != 0) {
      puVar21 = (undefined8 *)(*(longlong *)(param_1 + 0xa0) + (longlong)plVar16 * 0x18 + 8);
      do {
        if (puVar21[-1] != 0) {
          func_0x0001400021d0(*puVar21,puVar21[-1] << 2);
        }
        puVar21 = puVar21 + 3;
        lVar19 = lVar19 + -1;
      } while (lVar19 != 0);
      uVar12 = *(ulonglong *)(param_1 + 0xa8);
    }
  }
  uVar28 = *(ulonglong *)(param_1 + 0x830);
  if (uVar12 < uVar28) {
    uStack_128._0_4_ = 0;
    uStack_128._4_4_ = 0;
    uStack_120._0_4_ = 4;
    uStack_120._4_4_ = 0;
    uStack_118._0_4_ = 0;
    uStack_118._4_4_ = 0;
    uStack_a1 = 0;
    FUN_1459c6f20(param_1 + 0x98);
  }
  else {
    *(ulonglong *)(param_1 + 0xa8) = uVar28;
    lVar19 = uVar12 - uVar28;
    if (lVar19 != 0) {
      puVar21 = (undefined8 *)(*(longlong *)(param_1 + 0xa0) + uVar28 * 0x18 + 8);
      do {
        if (puVar21[-1] != 0) {
          func_0x0001400021d0(*puVar21,puVar21[-1] << 2);
        }
        puVar21 = puVar21 + 3;
        lVar19 = lVar19 + -1;
      } while (lVar19 != 0);
    }
  }
  uVar12 = *(ulonglong *)(param_1 + 0x60);
  if (uVar12 != 0) {
    puVar3 = *(ulonglong **)(param_1 + 0x58);
    uVar28 = 0;
    puVar23 = puVar3;
    do {
      puVar22 = puVar23 + 2;
      if (plVar16 <= *puVar23) {
        uVar25 = uVar28 + 1;
        if (uVar25 < uVar12) {
          uVar17 = uVar28 - uVar12;
          uVar27 = uVar17;
          if ((uVar17 & 1) == 0) {
            uVar27 = uVar28;
            if (*puVar22 < plVar16) {
              *(int *)puVar23 = (int)*puVar22;
              *(undefined4 *)((longlong)puVar23 + 4) = *(undefined4 *)((longlong)puVar23 + 0x14);
              *(int *)(puVar23 + 1) = (int)puVar23[3];
              *(undefined4 *)((longlong)puVar23 + 0xc) = *(undefined4 *)((longlong)puVar23 + 0x1c);
              uVar27 = uVar28 + 1;
            }
            uVar25 = uVar28 + 2;
            uVar28 = uVar27;
          }
          if (uVar17 != 0xfffffffffffffffe) {
            lVar19 = uVar12 - uVar25;
            puVar23 = puVar3 + uVar25 * 2 + 2;
            uVar27 = uVar28;
            do {
              if (puVar23[-2] < plVar16) {
                uVar6 = *(undefined4 *)((longlong)puVar23 + -0xc);
                uVar12 = puVar23[-1];
                uVar7 = *(undefined4 *)((longlong)puVar23 + -4);
                puVar22 = puVar3 + uVar27 * 2;
                *(int *)puVar22 = (int)puVar23[-2];
                *(undefined4 *)((longlong)puVar22 + 4) = uVar6;
                *(int *)(puVar22 + 1) = (int)uVar12;
                *(undefined4 *)((longlong)puVar22 + 0xc) = uVar7;
                uVar27 = uVar27 + 1;
                uVar12 = *puVar23;
              }
              else {
                uVar12 = *puVar23;
              }
              if (uVar12 < plVar16) {
                uVar6 = *(undefined4 *)((longlong)puVar23 + 4);
                uVar12 = puVar23[1];
                uVar7 = *(undefined4 *)((longlong)puVar23 + 0xc);
                puVar22 = puVar3 + uVar27 * 2;
                *(int *)puVar22 = (int)*puVar23;
                *(undefined4 *)((longlong)puVar22 + 4) = uVar6;
                *(int *)(puVar22 + 1) = (int)uVar12;
                *(undefined4 *)((longlong)puVar22 + 0xc) = uVar7;
                uVar27 = uVar27 + 1;
              }
              puVar23 = puVar23 + 4;
              lVar19 = lVar19 + -2;
            } while (lVar19 != 0);
          }
          *(ulonglong *)(param_1 + 0x60) = uVar27;
        }
        else {
          *(ulonglong *)(param_1 + 0x60) = uVar28;
        }
        break;
      }
      uVar28 = uVar28 + 1;
      puVar23 = puVar22;
    } while (uVar28 != uVar12);
  }
  if (plVar13 <= *(longlong **)(param_1 + 0xc0)) {
    *(longlong **)(param_1 + 0xc0) = plVar13;
  }
  uStack_a1 = 0;
  FUN_1459cdb60(&uStack_128,*(longlong *)(param_1 + 0x828),
                *(longlong *)(param_1 + 0x830) * 0x40 + *(longlong *)(param_1 + 0x828));
  pcStack_b8 = (char *)CONCAT44(uStack_128._4_4_,(undefined4)uStack_128);
  plStack_b0 = (longlong *)CONCAT44(uStack_120._4_4_,(undefined4)uStack_120);
  plVar16 = (longlong *)CONCAT44(uStack_118._4_4_,(undefined4)uStack_118);
  uVar12 = 0;
  if (plVar13 <= plVar16) {
    uVar12 = (longlong)plVar16 - (longlong)plVar13;
  }
  if (plVar16 <= plVar13) goto LAB_14592ddf1;
  uVar28 = (ulonglong)((uint)uVar12 & 3);
  if ((ulonglong)((longlong)plVar13 - (longlong)plVar16) < 0xfffffffffffffffd) {
    uVar25 = 0;
    plVar16 = plStack_b0;
    do {
      lVar19 = plVar16[(longlong)plVar13 * 3];
      lVar10 = (plVar16 + (longlong)plVar13 * 3)[1];
      plVar16[2] = plVar16[(longlong)plVar13 * 3 + 2];
      *plVar16 = lVar19;
      plVar16[1] = lVar10;
      lVar19 = plVar16[(longlong)plVar13 * 3 + 3];
      lVar10 = (plVar16 + (longlong)plVar13 * 3 + 3)[1];
      plVar16[5] = plVar16[(longlong)plVar13 * 3 + 5];
      plVar16[3] = lVar19;
      plVar16[4] = lVar10;
      lVar19 = plVar16[(longlong)plVar13 * 3 + 6];
      lVar10 = (plVar16 + (longlong)plVar13 * 3 + 6)[1];
      plVar16[8] = plVar16[(longlong)plVar13 * 3 + 8];
      plVar16[6] = lVar19;
      plVar16[7] = lVar10;
      uVar25 = uVar25 + 4;
      plVar1 = plVar16 + (longlong)plVar13 * 3 + 9;
      lVar19 = *plVar1;
      uVar6 = *(undefined4 *)((longlong)plVar1 + 4);
      lVar10 = plVar1[1];
      uVar7 = *(undefined4 *)((longlong)plVar1 + 0xc);
      plVar16[0xb] = plVar16[(longlong)plVar13 * 3 + 0xb];
      *(int *)(plVar16 + 9) = (int)lVar19;
      *(undefined4 *)((longlong)plVar16 + 0x4c) = uVar6;
      *(int *)(plVar16 + 10) = (int)lVar10;
      *(undefined4 *)((longlong)plVar16 + 0x54) = uVar7;
      plVar16 = plVar16 + 0xc;
    } while ((uVar12 & 0x7fffffffffffffc) != uVar25);
    if (uVar28 != 0) goto LAB_14592dc10;
  }
  else {
    uVar25 = 0;
LAB_14592dc10:
    plVar16 = plStack_b0 + uVar25 * 3;
    do {
      plVar1 = plVar16 + (longlong)plVar13 * 3;
      lVar19 = *plVar1;
      uVar6 = *(undefined4 *)((longlong)plVar1 + 4);
      lVar10 = plVar1[1];
      uVar7 = *(undefined4 *)((longlong)plVar1 + 0xc);
      plVar16[2] = plVar16[(longlong)plVar13 * 3 + 2];
      *(int *)plVar16 = (int)lVar19;
      *(undefined4 *)((longlong)plVar16 + 4) = uVar6;
      *(int *)(plVar16 + 1) = (int)lVar10;
      *(undefined4 *)((longlong)plVar16 + 0xc) = uVar7;
      plVar16 = plVar16 + 3;
      uVar28 = uVar28 - 1;
    } while (uVar28 != 0);
  }
  plStack_c0 = plStack_b0 + uVar12 * 3;
  plVar13 = plStack_b0;
  do {
    lVar19 = *plVar13;
    if (lVar19 == 0) break;
    plVar16 = plVar13 + 3;
    lVar10 = plVar13[2];
    pcVar18 = (char *)plVar13[1];
    lVar24 = 0;
    lStack_158 = lVar19;
    pcStack_150 = pcVar18;
    while ((*(char **)((longlong)&DAT_146bf5eb8 + lVar24) != pcVar18 ||
           (iVar11 = func_0x000145c0a3e7(*(undefined8 *)((longlong)&DAT_146bf5eb0 + lVar24),lVar19,
                                         pcVar18), iVar11 != 0))) {
      lVar24 = lVar24 + 0x78;
      if (lVar24 == 0x34f8) {
        uStack_128 = &lStack_158;
        uStack_120._0_4_ = 0x400020c0;
        uStack_120._4_4_ = 1;
        FUN_145da9a60(&DAT_146bf5098,&uStack_128,&DAT_146bf50a8);
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
    }
    uStack_1a4 = 0;
    uStack_1a0 = 0;
    uStack_19c = 0;
    uStack_198 = 0;
    uStack_194 = 0;
    uStack_1c8 = (longlong)&DAT_146bf5eb0 + lVar24;
    uStack_1c0 = 1;
    uStack_1bc = 0x3f000000;
    uStack_1b8 = 0x3f800000;
    uStack_1b4 = 0x3f800000;
    uStack_1b0 = 0;
    uStack_1ac = 0x3f800000;
    uStack_1a8 = 0x3f800000;
    uStack_190 = 0x3f8000003f800000;
    uStack_188 = 0;
    uStack_184 = 0x3f800000;
    uStack_180 = 0x3f800000;
    uStack_17c = 0;
    uStack_178 = 0x3f800000;
    FUN_145897ab0(&uStack_190,lVar2,uStack_1c8);
    uStack_1bc = 0x3f800000;
    lVar19 = *(longlong *)(param_1 + 0xc0);
    if (lVar19 == *(longlong *)(param_1 + 0xb0)) {
      FUN_145c16400(param_1 + 0xb0);
    }
    lVar24 = *(longlong *)(param_1 + 0xb8);
    lVar15 = lVar19 * 0x60;
    *(ulonglong *)(lVar24 + 0x50 + lVar15) = CONCAT44(uStack_174,uStack_178);
    puVar21 = (undefined8 *)(lVar24 + 0x40 + lVar15);
    *puVar21 = CONCAT44(uStack_184,uStack_188);
    puVar21[1] = CONCAT44(uStack_17c,uStack_180);
    puVar21 = (undefined8 *)(lVar24 + 0x30 + lVar15);
    *puVar21 = CONCAT44(uStack_194,uStack_198);
    puVar21[1] = uStack_190;
    puVar21 = (undefined8 *)(lVar24 + 0x20 + lVar15);
    *puVar21 = CONCAT44(uStack_1a4,uStack_1a8);
    puVar21[1] = CONCAT44(uStack_19c,uStack_1a0);
    puVar21 = (undefined8 *)(lVar24 + 0x10 + lVar15);
    *puVar21 = CONCAT44(uStack_1b4,uStack_1b8);
    puVar21[1] = CONCAT44(uStack_1ac,uStack_1b0);
    puVar14 = (undefined4 *)(lVar24 + lVar15);
    *puVar14 = (undefined4)uStack_1c8;
    puVar14[1] = uStack_1c8._4_4_;
    puVar14[2] = uStack_1c0;
    puVar14[3] = uStack_1bc;
    *(int *)(lVar24 + 0x58 + lVar15) = (int)lVar10;
    *(longlong *)(param_1 + 0xc0) = lVar19 + 1;
    plVar13 = plVar16;
  } while (plVar16 != plStack_c0);
LAB_14592ddf1:
  if (pcStack_b8 != (char *)0x0) {
    func_0x0001400021d0(plStack_b0,(longlong)pcStack_b8 * 0x18,8);
  }
  lVar19 = *(longlong *)(param_1 + 0x330);
  uStack_120 = *(longlong *)(param_1 + 0x338) * 0x58 + lVar19;
  uStack_128._0_4_ = (undefined4)lVar19;
  uStack_128._4_4_ = (undefined4)((ulonglong)lVar19 >> 0x20);
  uStack_a1 = 0;
  uStack_118 = (float *)lVar2;
  FUN_1459d9a50(&lStack_158,&uStack_128);
  lVar19 = *(longlong *)(param_1 + 0x338);
  if (lVar19 != 0) {
    lVar10 = *(longlong *)(param_1 + 0x330);
    lVar24 = 0;
    lVar15 = 0;
    do {
      if (lStack_148 * 0x1c == lVar24) break;
      pcVar18 = pcStack_150 + lVar24;
      uVar6 = *(undefined4 *)pcVar18;
      uVar7 = *(undefined4 *)(pcVar18 + 4);
      uVar8 = *(undefined4 *)(pcVar18 + 8);
      uVar9 = *(undefined4 *)(pcVar18 + 0xc);
      uVar4 = *(undefined8 *)(pcVar18 + 0x10);
      *(undefined4 *)(lVar10 + 0x50 + lVar15) = *(undefined4 *)(pcVar18 + 0x18);
      *(undefined8 *)(lVar10 + 0x48 + lVar15) = uVar4;
      puVar14 = (undefined4 *)(lVar10 + 0x38 + lVar15);
      *puVar14 = uVar6;
      puVar14[1] = uVar7;
      puVar14[2] = uVar8;
      puVar14[3] = uVar9;
      lVar15 = lVar15 + 0x58;
      lVar24 = lVar24 + 0x1c;
    } while (lVar19 * 0x58 - lVar15 != 0);
  }
  if (lStack_158 != 0) {
    func_0x0001400021d0(pcStack_150,lStack_158 * 0x1c,4);
  }
  puVar21 = *(undefined8 **)(param_1 + 0xb8);
  puVar26 = puVar21 + *(longlong *)(param_1 + 0xc0) * 0xc;
  for (; puVar21 != puVar26; puVar21 = puVar21 + 0xc) {
    uStack_a1 = 0;
    FUN_145897ab0(&uStack_128,lVar2,*puVar21);
    *(ulonglong *)((longlong)puVar21 + 0x44) = CONCAT44((undefined4)uStack_118,uStack_120._4_4_);
    *(ulonglong *)((longlong)puVar21 + 0x4c) = CONCAT44(uStack_110,uStack_118._4_4_);
    *(undefined4 *)(puVar21 + 7) = (undefined4)uStack_128;
    *(undefined4 *)((longlong)puVar21 + 0x3c) = uStack_128._4_4_;
    puVar21[8] = uStack_120;
  }
  uStack_a1 = 0;
  FUN_1458f28e0(param_1);
  return;
}
