/* WARNING: Type propagation algorithm not settling */

void FUN_140017b60(void)

{
  ushort *puVar1;
  code *pcVar2;
  byte bVar3;
  undefined8 *puVar4;
  char cVar5;
  int iVar6;
  longlong lVar7;
  undefined8 *******pppppppuVar8;
  ulonglong uVar9;
  ulonglong uVar10;
  longlong lVar11;
  ulonglong *puVar12;
  undefined8 uVar13;
  ulonglong uVar14;
  ulonglong uVar15;
  longlong lVar16;
  undefined8 *******pppppppuVar17;
  undefined8 unaff_RSI;
  undefined8 *******pppppppuVar18;
  undefined8 *******pppppppuVar19;
  undefined8 *******pppppppuVar20;
  undefined8 ******ppppppuVar21;
  undefined8 uVar22;
  undefined8 *******unaff_R14;
  undefined8 *******pppppppuVar23;
  undefined8 uStack_c50;
  undefined8 uStack_c48;
  undefined8 uStack_c40;
  undefined8 uStack_c38;
  undefined1 uStack_c30;
  undefined4 uStack_c2f;
  undefined4 uStack_c2b;
  undefined4 uStack_c27;
  undefined4 uStack_c23;
  undefined7 uStack_c1f;
  undefined8 uStack_c18;
  undefined8 *******pppppppuStack_c10;
  undefined1 uStack_c08;
  undefined7 uStack_c07;
  undefined8 uStack_c00;
  undefined8 uStack_9f0;
  undefined1 auStack_790 [624];
  undefined8 *******pppppppuStack_520;
  undefined8 uStack_518;
  undefined4 uStack_510;
  undefined4 uStack_50c;
  undefined1 uStack_508;
  undefined7 uStack_507;
  undefined1 uStack_500;
  undefined8 *******pppppppuStack_4ff;
  undefined2 uStack_4e8;
  undefined1 uStack_4e6;
  longlong lStack_2b0;
  undefined8 uStack_2a8;
  undefined8 uStack_2a0;
  longlong lStack_290;
  undefined8 uStack_288;
  undefined8 uStack_280;
  longlong lStack_270;
  undefined8 *******pppppppuStack_268;
  longlong lStack_260;
  longlong lStack_258;
  undefined8 *******pppppppuStack_250;
  undefined4 uStack_248;
  undefined4 uStack_244;
  undefined8 uStack_240;
  undefined4 uStack_238;
  undefined4 uStack_234;
  undefined4 uStack_230;
  undefined4 uStack_22c;
  longlong lStack_228;
  undefined8 *******pppppppuStack_218;
  undefined8 *******pppppppuStack_210;
  undefined8 uStack_208;
  ulonglong uStack_200;
  ulonglong uStack_1f8;
  undefined8 *******pppppppuStack_1f0;
  undefined8 *******pppppppuStack_1e8;
  undefined8 *******pppppppuStack_1e0;
  undefined8 *******pppppppuStack_1d8;
  longlong lStack_1c0;
  longlong lStack_1b8;
  ulonglong uStack_1b0;
  ulonglong uStack_1a8;
  undefined8 *******pppppppuStack_1a0;
  undefined8 *******pppppppuStack_198;
  undefined8 *******pppppppuStack_190;
  ulonglong uStack_188;
  undefined8 uStack_180;
  undefined8 *******pppppppuStack_178;
  undefined8 *******pppppppuStack_170;
  undefined8 uStack_168;
  undefined8 *******pppppppuStack_158;
  undefined8 *******pppppppuStack_150;
  byte bStack_148;
  undefined7 uStack_147;
  undefined1 uStack_140;
  undefined8 *******pppppppuStack_13f;
  undefined8 *******pppppppuStack_137;
  undefined2 uStack_120;
  undefined1 uStack_11e;
  undefined8 uStack_118;
  undefined8 uStack_110;
  undefined8 uStack_108;
  undefined4 uStack_100;
  uint uStack_fc;
  undefined7 uStack_f8;
  undefined8 *******pppppppuStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  undefined1 uStack_b8;
  longlong lStack_b7;
  undefined7 uStack_af;
  undefined1 uStack_a8;
  undefined7 uStack_a7;
  undefined2 uStack_a0;
  undefined1 uStack_9e;
  undefined8 *******pppppppuStack_90;
  undefined8 *******pppppppuStack_88;
  undefined8 uStack_80;
  undefined8 *******pppppppuStack_78;
  undefined8 *******pppppppuStack_70;
  undefined8 *******pppppppuStack_68;
  undefined1 uStack_59;
  undefined8 *******pppppppuStack_58;
  undefined1 uStack_4a;
  undefined1 uStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  func_0x0001404f7650(&uStack_c50);
  if (uStack_c50 == (undefined8 *******)0xffffffffffffffff) {
    return;
  }
  pppppppuStack_78 = uStack_c50;
  pppppppuStack_70 = (undefined8 *******)uStack_c48;
  pppppppuStack_90 = (undefined8 *******)CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40);
  FUN_145cb3990(&uStack_c50);
  if (uStack_c50 == (undefined8 *******)0xffffffffffffffff) {
    if ((1 < ((uint)uStack_c48 & 3) - 2) && (((ulonglong)uStack_c48 & 3) != 0)) {
      uStack_518 = (undefined8 *******)((longlong)uStack_c48 + -1);
      pppppppuStack_520 = (undefined8 *******)CONCAT71(pppppppuStack_520._1_7_,3);
      func_0x000145cdf070(&uStack_518);
    }
    pppppppuVar8 = pppppppuStack_78;
    goto LAB_140018293;
  }
  pppppppuStack_58 = uStack_c50;
  uVar13 = CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40);
  pppppppuStack_68 = (undefined8 *******)uStack_c48;
  lVar7 = FUN_145ca62e0(uStack_c48,uVar13);
  if (lVar7 == 0) {
    pppppppuVar17 = (undefined8 *******)0xffffffffffffffff;
    pppppppuVar8 = pppppppuStack_78;
  }
  else {
    FUN_145ca61b0(&uStack_c50,lVar7,uVar13,
                  "benilla-config.cargo\\registry\\src\\index.crates.io-1949cf8c6b5b557f\\image-0.25.10\\src\\io\\encoder.rs"
                  ,0xe);
    unaff_RSI = CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40);
    pppppppuVar17 = uStack_c50;
    unaff_R14 = (undefined8 *******)uStack_c48;
    pppppppuVar8 = pppppppuStack_78;
  }
  pppppppuStack_78 = pppppppuVar8;
  if (pppppppuStack_58 != (undefined8 *******)0x0) {
    func_0x0001400021d0(pppppppuStack_68,pppppppuStack_58,1);
  }
  if (pppppppuVar17 == (undefined8 *******)0xffffffffffffffff) goto LAB_140018293;
  pppppppuStack_e8 = unaff_R14;
  pppppppuStack_88 = pppppppuVar17;
  FUN_145ca5900(&pppppppuStack_158,unaff_R14,unaff_RSI);
  FUN_145ca5900(&uStack_d8,pppppppuStack_70,pppppppuStack_90);
  pppppppuVar17 = uStack_d0;
  pppppppuVar8 = pppppppuStack_150;
  if (pppppppuStack_150 == uStack_d0) {
    if (((((char)uStack_120 != (char)uStack_a0) || (uStack_120._1_1_ != '\x02')) ||
        (uStack_a0._1_1_ != '\x02')) ||
       (((byte)uStack_c8 < 3 != bStack_148 < 3 ||
        (iVar6 = func_0x000145cf9991(pppppppuStack_158,uStack_d8,pppppppuStack_150), iVar6 != 0))))
    goto LAB_140017cf8;
LAB_140017e27:
    FUN_145cb6350(&uStack_c50,pppppppuStack_70,pppppppuStack_90);
    if ((int)uStack_c50 != 2) goto LAB_14001826e;
    if ((1 < ((uint)uStack_c48 & 3) - 2) && (((ulonglong)uStack_c48 & 3) != 0)) {
      uStack_c48 = (code *)((longlong)uStack_c48 + -1);
      uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,3);
      func_0x000145cdf070(&uStack_c48);
    }
    func_0x000140002200();
    pppppppuStack_58 = (undefined8 *******)func_0x0001400021c0(0x20,8);
    if (pppppppuStack_58 == (undefined8 *******)0x0) {
      FUN_145e9bd71(8,0x20);
LAB_140019543:
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    FUN_145ca61b0(&uStack_c50,&DAT_145ea18c8,0xe,
                  "benilla-config.cargo\\registry\\src\\index.crates.io-1949cf8c6b5b557f\\image-0.25.10\\src\\io\\encoder.rs"
                  ,0xe);
    *(undefined4 *)(pppppppuStack_58 + 2) = (undefined4)uStack_c40;
    *(undefined4 *)((longlong)pppppppuStack_58 + 0x14) = uStack_c40._4_4_;
    *(undefined4 *)(pppppppuStack_58 + 3) = (undefined4)uStack_c38;
    *(undefined4 *)((longlong)pppppppuStack_58 + 0x1c) = uStack_c38._4_4_;
    *(int *)pppppppuStack_58 = (int)uStack_c50;
    *(undefined4 *)((longlong)pppppppuStack_58 + 4) = uStack_c50._4_4_;
    *(undefined4 *)(pppppppuStack_58 + 1) = (undefined4)uStack_c48;
    *(undefined4 *)((longlong)pppppppuStack_58 + 0xc) = uStack_c48._4_4_;
    uStack_118 = (undefined8 *******)0x1;
    uStack_110 = pppppppuStack_58;
    uStack_108 = 1;
    FUN_145ca61b0(&uStack_d8,&DAT_145ea18c8,0xe,&DAT_145ea18b0,7);
    pppppppuStack_58 = uStack_d0;
    FUN_145ca61b0(&pppppppuStack_158,uStack_d0,CONCAT44(uStack_c8._4_4_,(undefined4)uStack_c8),
                  &DAT_145ea18b7,9);
    pppppppuStack_68 = pppppppuStack_150;
    FUN_145cb6440(&uStack_c50,pppppppuStack_150,CONCAT71(uStack_147,bStack_148));
    if ((int)uStack_c50 == 2) {
      uStack_518 = (undefined8 *******)uStack_c48;
      pppppppuStack_520 = (undefined8 *******)0x2;
    }
    else {
      func_0x000145cf998b(&pppppppuStack_520,&uStack_c50,0x270);
    }
    if (pppppppuStack_158 != (undefined8 *******)0x0) {
      func_0x0001400021d0(pppppppuStack_68,pppppppuStack_158,1);
    }
    if ((int)pppppppuStack_520 == 2) {
LAB_1400180e3:
      FUN_1400031a0(&pppppppuStack_520);
    }
    else {
      func_0x000145cf998b(auStack_790,&pppppppuStack_520,0x270);
      uStack_c50 = (undefined8 *******)0x0;
      uStack_9f0 = 0;
      FUN_14007ef10(&pppppppuStack_158,&uStack_c50);
      pppppppuVar8 = pppppppuStack_150;
      uVar10 = CONCAT71(uStack_147,bStack_148);
      if (1 < uVar10) {
        if (uVar10 < 0x15) {
          uStack_4a = 1;
          FUN_140026750(pppppppuStack_150,uVar10,1,&uStack_59);
        }
        else {
          uStack_4a = 1;
          FUN_14580ca00(pppppppuStack_150,uVar10,&uStack_59);
        }
      }
      pppppppuVar17 = pppppppuStack_158;
      uStack_c38 = pppppppuVar8 + uVar10 * 4;
      uStack_c50 = pppppppuVar8;
      uStack_c40._0_4_ = SUB84(pppppppuStack_158,0);
      uStack_c40._4_4_ = (undefined4)((ulonglong)pppppppuStack_158 >> 0x20);
      uStack_c48 = (code *)pppppppuVar8;
      if (uVar10 == 0) {
        uStack_108 = 1;
      }
      else {
        FUN_145cf9da0(&uStack_118,1,uVar10,8,0x20);
        lVar7 = uStack_108;
        func_0x000145cf998b(uStack_110 + uStack_108 * 4,pppppppuVar8,uVar10 * 0x20);
        uStack_108 = lVar7 + uVar10;
      }
      if (pppppppuVar17 != (undefined8 *******)0x0) {
        func_0x0001400021d0(pppppppuVar8,(longlong)pppppppuVar17 << 5,8);
      }
      if (pppppppuStack_520 == (undefined8 *******)0x2) goto LAB_1400180e3;
    }
    if (uStack_d8 != (undefined8 *******)0x0) {
      func_0x0001400021d0(pppppppuStack_58,uStack_d8,1);
    }
    FUN_1400657b0(&uStack_118);
    lVar7 = uStack_108;
    lStack_228 = uStack_108;
    uStack_238 = (undefined4)uStack_118;
    uStack_234 = uStack_118._4_4_;
    uStack_230 = (undefined4)uStack_110;
    uStack_22c = uStack_110._4_4_;
    if (uStack_108 == 0) {
      if (uStack_118 != (undefined8 *******)0x0) {
        func_0x0001400021d0(uStack_110,(longlong)uStack_118 << 5,8);
      }
      goto LAB_14001826e;
    }
    pppppppuStack_1a0 = uStack_110;
    uStack_200 = 0;
    pppppppuStack_1f0 = (undefined8 *******)0x0;
    pppppppuStack_218 = uStack_110 + uStack_108 * 4;
    pppppppuVar8 = uStack_110;
    if (uStack_110 != pppppppuStack_218) {
      do {
        FUN_140017550(pppppppuVar8[1],pppppppuVar8[2],1,0,&uStack_200);
        pppppppuVar8 = pppppppuVar8 + 4;
      } while (pppppppuVar8 != pppppppuStack_218);
    }
    FUN_145ca5fd0(&lStack_290,pppppppuStack_70,pppppppuStack_90,"part",4);
    uStack_80 = uStack_288;
    uStack_180 = uStack_280;
    FUN_145cb6350(&uStack_c50);
    if ((int)uStack_c50 == 2) {
      if ((1 < ((uint)uStack_c48 & 3) - 2) && (((ulonglong)uStack_c48 & 3) != 0)) {
        uStack_c48 = (code *)((longlong)uStack_c48 + -1);
        uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,3);
        func_0x000145cdf070(&uStack_c48);
      }
LAB_1400182de:
      uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,1);
      pppppppuVar8 = (undefined8 *******)FUN_145cad750(&uStack_c50);
      if (pppppppuVar8 != (undefined8 *******)0x0) goto LAB_140018306;
      uStack_1a8 = (ulonglong)(uStack_200 != 0);
      pppppppuVar17 = (undefined8 *******)0x0;
      if (uStack_200 != 0) {
        pppppppuVar17 = pppppppuStack_1f0;
      }
      lStack_258 = lVar7;
      uVar10 = uStack_200;
      uVar14 = 0;
      uVar15 = uStack_1f8;
      while( true ) {
        pppppppuVar8 = (undefined8 *******)((longlong)pppppppuVar17 + -1);
        if (pppppppuVar17 == (undefined8 *******)0x0) break;
        if ((uVar14 == 0) && ((uStack_1a8 & 1) != 0)) {
          uStack_1a8 = 1;
          uVar14 = uVar10;
          if (uVar15 != 0) {
            uVar9 = uVar15;
            if ((uVar15 & 7) != 0) {
              uVar14 = 0;
              do {
                uVar10 = *(ulonglong *)(uVar10 + 0x278);
                uVar14 = uVar14 + 1;
              } while ((uVar15 & 7) != uVar14);
              uVar9 = uVar15 - uVar14;
            }
            uVar14 = uVar10;
            if (7 < uVar15) {
              do {
                uVar10 = *(ulonglong *)
                          (*(longlong *)
                            (*(longlong *)
                              (*(longlong *)
                                (*(longlong *)
                                  (*(longlong *)
                                    (*(longlong *)(*(longlong *)(uVar10 + 0x278) + 0x278) + 0x278) +
                                  0x278) + 0x278) + 0x278) + 0x278) + 0x278);
                uVar9 = uVar9 - 8;
                uVar14 = uVar10;
              } while (uVar9 != 0);
            }
          }
          uVar15 = 0;
          uVar10 = 0;
          if (*(short *)(uVar14 + 0x272) == 0) {
LAB_140018590:
            do {
              uVar9 = *(ulonglong *)(uVar14 + 0x160);
              if (uVar9 == 0) {
                pppppppuStack_210 = pppppppuVar8;
                FUN_145e9c080(&DAT_145ea08a0);
                goto LAB_140019543;
              }
              uVar10 = uVar10 + 1;
              puVar1 = (ushort *)(uVar14 + 0x270);
              uVar15 = (ulonglong)*puVar1;
              uVar14 = uVar9;
            } while (*(ushort *)(uVar9 + 0x272) <= *puVar1);
          }
        }
        else {
          if ((uStack_1a8 & 1) == 0) {
            FUN_145e9c080(&DAT_145ea1800);
            goto LAB_140019543;
          }
          if (*(ushort *)(uVar14 + 0x272) <= uVar15) goto LAB_140018590;
        }
        if (uVar10 == 0) {
          uStack_188 = uVar15 + 1;
          uStack_1b0 = uVar14;
        }
        else {
          puVar12 = (ulonglong *)(uVar14 + uVar15 * 8 + 0x280);
          uVar9 = uVar10;
          if ((uVar10 & 7) != 0) {
            uVar9 = 0;
            do {
              uStack_1b0 = *puVar12;
              puVar12 = (ulonglong *)(uStack_1b0 + 0x278);
              uVar9 = uVar9 + 1;
            } while ((uVar10 & 7) != uVar9);
            uVar9 = uVar10 - uVar9;
          }
          if (7 < uVar10) {
            do {
              uStack_1b0 = *(ulonglong *)
                            (*(longlong *)
                              (*(longlong *)
                                (*(longlong *)
                                  (*(longlong *)
                                    (*(longlong *)(*(longlong *)(*puVar12 + 0x278) + 0x278) + 0x278)
                                  + 0x278) + 0x278) + 0x278) + 0x278);
              puVar12 = (ulonglong *)(uStack_1b0 + 0x278);
              uVar9 = uVar9 - 8;
            } while (uVar9 != 0);
          }
          uStack_188 = 0;
        }
        uVar10 = *(ulonglong *)(uVar14 + 0x178 + uVar15 * 0x18);
        pppppppuStack_210 = pppppppuVar8;
        if (1 < uVar10) {
          pppppppuVar17 = *(undefined8 ********)(uVar14 + 0x170 + uVar15 * 0x18);
          if (uVar10 < 0x15) {
            pppppppuStack_68 = pppppppuVar17 + uVar10 * 5;
            pppppppuVar20 = pppppppuVar17 + 5;
            pppppppuStack_58 = pppppppuVar17;
            do {
              FUN_140024c10(pppppppuStack_58,pppppppuVar20);
              pppppppuVar20 = pppppppuVar20 + 5;
            } while (pppppppuVar20 != pppppppuStack_68);
          }
          else {
            FUN_140099370(pppppppuVar17,uVar10,&uStack_59);
          }
        }
        lVar16 = uVar15 * 0x20 + uVar14;
        FUN_145ca61b0(&lStack_2b0,uStack_80,uStack_180,*(undefined8 *)(lVar16 + 8),
                      *(undefined8 *)(lVar16 + 0x10));
        uStack_e0 = uStack_2a8;
        uStack_208 = uStack_2a0;
        uVar13 = uStack_2a0;
        lVar11 = FUN_145ca62e0();
        if (lVar11 != 0) {
          uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,1);
          pppppppuVar8 = (undefined8 *******)FUN_145cad750(&uStack_c50,lVar11,uVar13);
          if (pppppppuVar8 == (undefined8 *******)0x0) goto LAB_140018711;
LAB_14001941b:
          if (lStack_2b0 != 0) {
            func_0x0001400021d0(uStack_e0,lStack_2b0,1);
          }
          goto LAB_140018306;
        }
LAB_140018711:
        FUN_145ca5900(&pppppppuStack_158,*(undefined8 *)(lVar16 + 8),*(undefined8 *)(lVar16 + 0x10))
        ;
        FUN_145ca5900(&uStack_d8,"config.toml",0xb);
        pppppppuVar17 = uStack_d0;
        bVar3 = bStack_148;
        pppppppuVar8 = pppppppuStack_150;
        lStack_1c0 = uVar14 + uVar15 * 0x18 + 0x168;
        if (pppppppuStack_150 == uStack_d0) {
          if (((((char)uStack_120 != (char)uStack_a0) || (uStack_120._1_1_ != '\x02')) ||
              (uStack_a0._1_1_ != '\x02')) || ((byte)uStack_c8 < 3 != bStack_148 < 3))
          goto LAB_1400187cd;
          iVar6 = func_0x000145cf9991(pppppppuStack_158,uStack_d8,pppppppuStack_150);
          if (iVar6 != 0) goto LAB_1400187cd;
LAB_1400188f2:
          lVar16 = *(longlong *)(lStack_1c0 + 8);
          pppppppuStack_250 = (undefined8 *******)0x0;
          uStack_240 = 0;
          pppppppuStack_178 = (undefined8 *******)0x0;
          pppppppuStack_170 = (undefined8 *******)0x1;
          uStack_168 = 0;
          lStack_260 = lVar16 + *(longlong *)(lStack_1c0 + 0x10) * 0x28;
          lVar11 = lStack_1c0;
LAB_140018940:
          if (lVar16 != lStack_260) {
            uStack_49 = 1;
            lStack_270 = lVar16;
            FUN_145cbcb20(&uStack_c50,*(undefined8 *)(lVar16 + 0x10),*(undefined8 *)(lVar16 + 0x18))
            ;
            if (uStack_c50 == (undefined8 *******)0xffffffffffffffff) {
              if ((1 < ((uint)uStack_c48 & 3) - 2) && (((ulonglong)uStack_c48 & 3) != 0)) {
                uStack_518 = (undefined8 *******)((longlong)uStack_c48 + -1);
                pppppppuStack_520 = (undefined8 *******)CONCAT71(pppppppuStack_520._1_7_,3);
                uStack_49 = 1;
                func_0x000145cdf070(&uStack_518);
              }
            }
            else {
              pppppppuStack_190 = uStack_c50;
              pppppppuVar8 = uStack_c40;
              pppppppuStack_198 = (undefined8 *******)uStack_c48;
              func_0x000141452c30(&uStack_c50,uStack_c48,uStack_c40);
              if ((int)uStack_c50 == 2) {
                pppppppuStack_1d8 = uStack_c38;
                pppppppuStack_1e8 = (undefined8 *******)uStack_c48;
                pppppppuStack_1e0 = uStack_c40;
                pppppppuVar17 = (undefined8 *******)uStack_c48;
                pppppppuVar20 = uStack_c40;
                pppppppuStack_268 = pppppppuVar8;
                if ((undefined8 *******)uStack_c48 != (undefined8 *******)0x0) {
                  while( true ) {
                    pppppppuStack_58 =
                         (undefined8 *******)(ulonglong)*(ushort *)((longlong)pppppppuVar17 + 0x272)
                    ;
                    lVar7 = (ulonglong)((uint)*(ushort *)((longlong)pppppppuVar17 + 0x272) * 8) * 3;
                    pppppppuVar18 = (undefined8 *******)0xffffffffffffffff;
                    pppppppuVar8 = pppppppuVar17 + 0x2d;
                    pppppppuVar19 = pppppppuVar17 + -1;
                    do {
                      pppppppuVar23 = pppppppuVar19;
                      pppppppuVar19 = pppppppuStack_58;
                      if (lVar7 == 0) goto LAB_140018a77;
                      ppppppuVar21 = pppppppuVar8[2];
                      lVar11 = (longlong)ppppppuVar21 - 5;
                      if ((undefined8 ******)0x4 < ppppppuVar21) {
                        ppppppuVar21 = (undefined8 ******)0x5;
                      }
                      iVar6 = func_0x000145cf9991(&DAT_145ea18c0,pppppppuVar8[1],ppppppuVar21);
                      lVar11 = -lVar11;
                      if (iVar6 != 0) {
                        lVar11 = (longlong)iVar6;
                      }
                      pppppppuVar18 = (undefined8 *******)((longlong)pppppppuVar18 + 1);
                      lVar7 = lVar7 + -0x18;
                      pppppppuVar8 = pppppppuVar8 + 3;
                      pppppppuVar19 = pppppppuVar23 + 4;
                    } while ((char)((0 < lVar11) - (lVar11 < 0)) == '\x01');
                    pppppppuVar19 = pppppppuVar18;
                    if (0 < lVar11 == lVar11 < 0) break;
LAB_140018a77:
                    if (pppppppuVar20 == (undefined8 *******)0x0) goto LAB_140018cbd;
                    pppppppuVar17 =
                         (undefined8 *******)
                         pppppppuVar17[(longlong)((longlong)pppppppuVar19 + 0x4f)];
                    pppppppuVar20 = (undefined8 *******)((longlong)pppppppuVar20 + -1);
                  }
                  if (*(char *)(pppppppuVar23 + 1) == '\x06') {
                    if (pppppppuVar23[4] == (undefined8 ******)0x0) {
                      pppppppuStack_c10 = (undefined8 *******)0x0;
                      uStack_c50 = (undefined8 *******)0x0;
                    }
                    else {
                      if (pppppppuVar23[2] == (undefined8 ******)0x0) {
                        FUN_145e9c080(&DAT_145ed52d0);
                        goto LAB_140019543;
                      }
                      FUN_140109f20(&uStack_c50,pppppppuVar23[2],pppppppuVar23[3]);
                      pppppppuStack_c10 = uStack_c40;
                    }
                    uStack_c18 = (undefined8 *******)uStack_c48;
                    uStack_c30 = uStack_c50 != (undefined8 *******)0x0;
                    if (!(bool)uStack_c30) {
                      pppppppuStack_c10 = (undefined8 *******)0x0;
                    }
                    uStack_c48 = (code *)0x0;
                    uStack_c40._0_4_ = SUB84(uStack_c50,0);
                    uStack_c40._4_4_ = (undefined4)((ulonglong)uStack_c50 >> 0x20);
                    uStack_c38._0_4_ = SUB84(uStack_c18,0);
                    uStack_c38._4_4_ = (undefined4)((ulonglong)uStack_c18 >> 0x20);
                    uStack_c2f = 0;
                    uStack_c2b = 0;
                    uStack_c27 = 0;
                    uStack_c23._3_1_ = (byte)uStack_c50;
                    uStack_c23 = (uint)uStack_c23._3_1_ << 0x18;
                    uStack_c1f = (undefined7)((ulonglong)uStack_c50 >> 8);
                    uStack_c50 = (undefined8 *******)(ulonglong)(byte)uStack_c30;
                    goto LAB_140018b50;
                  }
                }
                goto LAB_140018cbd;
              }
              if (uStack_c38 != (undefined8 *******)0x0) {
                func_0x0001400021d0(CONCAT35((undefined3)uStack_c2b,CONCAT41(uStack_c2f,uStack_c30))
                                    ,uStack_c38,1);
              }
              if (0 < CONCAT71(uStack_c07,uStack_c08)) {
                func_0x0001400021d0(uStack_c00,CONCAT71(uStack_c07,uStack_c08),1);
              }
              pppppppuVar8 = uStack_c18;
              if (pppppppuStack_c10 != (undefined8 *******)0x0) {
                pppppppuVar17 = uStack_c18 + 1;
                pppppppuVar20 = pppppppuStack_c10;
                do {
                  if (pppppppuVar17[-1] != (undefined8 ******)0x0) {
                    func_0x0001400021d0(*pppppppuVar17,pppppppuVar17[-1],1);
                  }
                  pppppppuVar17 = pppppppuVar17 + 3;
                  pppppppuVar20 = (undefined8 *******)((longlong)pppppppuVar20 + -1);
                } while (pppppppuVar20 != (undefined8 *******)0x0);
              }
              if (CONCAT71(uStack_c1f,uStack_c23._3_1_) != 0) {
                func_0x0001400021d0(pppppppuVar8,CONCAT71(uStack_c1f,uStack_c23._3_1_) * 0x18,8);
              }
              if (pppppppuStack_190 != (undefined8 *******)0x0) {
                func_0x0001400021d0(pppppppuStack_198,pppppppuStack_190,1);
              }
            }
            if (pppppppuStack_178 != (undefined8 *******)0x0) {
              func_0x0001400021d0(pppppppuStack_170,pppppppuStack_178,1);
            }
            FUN_140106a90(&pppppppuStack_250);
            goto LAB_140018fab;
          }
          pppppppuStack_158 = (undefined8 *******)0x0;
          bStack_148 = 0;
          uStack_147 = 0;
          func_0x000140002200();
          pppppppuVar8 = (undefined8 *******)func_0x0001400021c0(5,1);
          pppppppuStack_58 =
               (undefined8 *******)
               CONCAT71(pppppppuStack_58._1_7_,pppppppuVar8 == (undefined8 *******)0x0);
          if (pppppppuVar8 == (undefined8 *******)0x0) {
            FUN_145e9bd8b(1,5);
            goto LAB_140019543;
          }
          *(undefined1 *)((longlong)pppppppuVar8 + 4) = 0x73;
          *(undefined4 *)pppppppuVar8 = 0x72617663;
          uStack_d8 = (undefined8 *******)0x5;
          uStack_c8._0_4_ = 5;
          uStack_c8._4_4_ = 0;
          uStack_c38._0_4_ = (undefined4)uStack_240;
          uStack_c38._4_4_ = (undefined4)((ulonglong)uStack_240 >> 0x20);
          uStack_c48 = (code *)pppppppuStack_250;
          uStack_c40._0_4_ = uStack_248;
          uStack_c40._4_4_ = uStack_244;
          uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,6);
          uStack_d0 = pppppppuVar8;
          FUN_14011d480(&pppppppuStack_520,&pppppppuStack_158,&uStack_d8,&uStack_c50);
          if ((byte)pppppppuStack_520 < 5) {
            if (3 < (byte)pppppppuStack_520 - 1) {
              if ((byte)pppppppuStack_520 == 0) {
                if (uStack_518 != (undefined8 *******)0x0) {
                  uVar13 = CONCAT44(uStack_50c,uStack_510);
                  uVar22 = 1;
                  pppppppuVar8 = uStack_518;
                  goto LAB_140019062;
                }
              }
              else {
LAB_140019029:
                FUN_140106a90(&uStack_518);
              }
            }
          }
          else if ((byte)pppppppuStack_520 == 5) {
            FUN_140090370(&uStack_518);
            if (uStack_518 != (undefined8 *******)0x0) {
              uVar13 = CONCAT44(uStack_50c,uStack_510);
              pppppppuVar8 = (undefined8 *******)((longlong)uStack_518 << 5);
              uVar22 = 8;
LAB_140019062:
              func_0x0001400021d0(uVar13,pppppppuVar8,uVar22);
            }
          }
          else if ((byte)pppppppuStack_520 != 0xff) goto LAB_140019029;
          FUN_14022b520(&uStack_c50,&pppppppuStack_158);
          if ((int)uStack_c50 == 1) {
            if ((-0x7ffffffffffffffc < (longlong)uStack_c48) &&
               ((undefined8 *******)uStack_c48 != (undefined8 *******)0x0)) {
              func_0x0001400021d0(CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40),uStack_c48,1);
            }
LAB_1400191ec:
            uStack_49 = 0;
            FUN_140106a90(&pppppppuStack_158);
            if (pppppppuStack_178 != (undefined8 *******)0x0) {
              func_0x0001400021d0(pppppppuStack_170,pppppppuStack_178,1);
            }
            goto LAB_140018fab;
          }
          uStack_d8 = (undefined8 *******)CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40);
          uStack_d0 = (undefined8 *******)CONCAT44(uStack_c38._4_4_,(undefined4)uStack_c38);
          if ((undefined8 *******)uStack_c48 == (undefined8 *******)0xffffffffffffffff)
          goto LAB_1400191ec;
          uStack_518 = (undefined8 *******)CONCAT44(uStack_c40._4_4_,(undefined4)uStack_c40);
          uStack_510 = (undefined4)uStack_c38;
          uStack_50c = uStack_c38._4_4_;
          pppppppuStack_520 = (undefined8 *******)uStack_c48;
          uStack_c50 = &pppppppuStack_178;
          uStack_c48 = (code *)&DAT_1400020e0;
          uStack_c38._0_4_ = 0x400020e0;
          uStack_c38._4_4_ = 1;
          uStack_c40 = &pppppppuStack_520;
          FUN_145ccc6e0(&uStack_118,&DAT_145ea18c5,&uStack_c50);
          if (pppppppuStack_520 != (undefined8 *******)0x0) {
            func_0x0001400021d0(uStack_518,pppppppuStack_520,1);
          }
          lVar16 = uStack_108;
          pppppppuVar17 = uStack_110;
          pppppppuVar8 = uStack_118;
          uStack_49 = 0;
          FUN_140106a90(&pppppppuStack_158);
          if (pppppppuStack_178 != (undefined8 *******)0x0) {
            func_0x0001400021d0(pppppppuStack_170,pppppppuStack_178,1);
          }
          if (pppppppuVar8 == (undefined8 *******)0xffffffffffffffff) goto LAB_140018fab;
          pppppppuStack_58 = pppppppuVar8;
          pppppppuStack_68 = pppppppuVar17;
          pppppppuVar8 = (undefined8 *******)
                         FUN_145cbcfe0(uStack_e0,uStack_208,pppppppuVar17,lVar16);
          uVar15 = uStack_188;
          pppppppuVar17 = pppppppuStack_210;
          if (pppppppuStack_58 != (undefined8 *******)0x0) {
            func_0x0001400021d0(pppppppuStack_68);
          }
          if (pppppppuVar8 != (undefined8 *******)0x0) goto LAB_14001941b;
        }
        else {
LAB_1400187cd:
          if (bVar3 != 0xff) {
            pppppppuStack_1e8 = (undefined8 *******)CONCAT17(uStack_140,uStack_147);
            pppppppuStack_1d8 = pppppppuStack_137;
            pppppppuStack_1e0 = pppppppuStack_13f;
          }
          pppppppuStack_520 = pppppppuStack_158;
          uStack_518 = pppppppuVar8;
          pppppppuStack_4ff = pppppppuStack_1d8;
          uStack_510._1_3_ = SUB83(pppppppuStack_1e8,0);
          uStack_510 = CONCAT31(uStack_510._1_3_,bVar3);
          uStack_50c = (undefined4)((ulonglong)pppppppuStack_1e8 >> 0x18);
          uStack_508 = (undefined1)((ulonglong)pppppppuStack_1e8 >> 0x38);
          uStack_507 = SUB87(pppppppuStack_1e0,0);
          uStack_500 = (undefined1)((ulonglong)pppppppuStack_1e0 >> 0x38);
          uStack_4e8 = uStack_120;
          uStack_4e6 = uStack_11e;
          if ((byte)uStack_c8 != -1) {
            uStack_f8 = uStack_a7;
            uStack_118 = (undefined8 *******)
                         CONCAT17((undefined1)uStack_c0,CONCAT43(uStack_c8._4_4_,uStack_c8._1_3_));
            uStack_110 = (undefined8 *******)CONCAT17(uStack_b8,CONCAT43(uStack_bc,uStack_c0._1_3_))
            ;
            uStack_108 = lStack_b7;
            uStack_100 = (undefined4)uStack_af;
            uStack_fc = (uint)(CONCAT17(uStack_a8,uStack_af) >> 0x20);
          }
          uStack_c50 = uStack_d8;
          uStack_c48 = (code *)pppppppuVar17;
          uStack_c1f = uStack_f8;
          uStack_c2f = (undefined4)uStack_108;
          uStack_c2b = uStack_108._4_4_;
          uStack_c27 = uStack_100;
          uStack_c23 = uStack_fc;
          uStack_c40._1_3_ = SUB83(uStack_118,0);
          uStack_c40._0_4_ = CONCAT31(uStack_c40._1_3_,(byte)uStack_c8);
          uStack_c40._4_4_ = (undefined4)((ulonglong)uStack_118 >> 0x18);
          uStack_c38._1_3_ = SUB83(uStack_110,0);
          uStack_c38._0_4_ = CONCAT31(uStack_c38._1_3_,(char)((ulonglong)uStack_118 >> 0x38));
          uStack_c38._4_4_ = (undefined4)((ulonglong)uStack_110 >> 0x18);
          uStack_c30 = (undefined1)((ulonglong)uStack_110 >> 0x38);
          uStack_c18._0_3_ = CONCAT12(uStack_9e,uStack_a0);
          cVar5 = FUN_140011280(&pppppppuStack_520,&uStack_c50);
          lVar11 = lStack_1c0;
          if (cVar5 != '\0') goto LAB_1400188f2;
LAB_140018fab:
          lVar16 = *(longlong *)(lVar11 + 0x10);
          if (lVar16 == 0) {
            FUN_145e9c040("a file has a copycrates\\wenilla-rogue-app\\src\\legacy_config.rs",0x11,
                          &DAT_145ea1990);
            goto LAB_140019543;
          }
          pppppppuVar8 = *(undefined8 ********)(*(longlong *)(lVar11 + 8) + -0x10 + lVar16 * 0x28);
          lVar11 = FUN_145cb6080(*(undefined8 *)(*(longlong *)(lVar11 + 8) + -0x18 + lVar16 * 0x28),
                                 pppppppuVar8,uStack_e0,uStack_208);
          uVar15 = uStack_188;
          pppppppuVar17 = pppppppuStack_210;
          if (lVar11 == 1) goto LAB_14001941b;
        }
        if (lStack_2b0 != 0) {
          func_0x0001400021d0(uStack_e0);
        }
        uVar10 = 0;
        uVar14 = uStack_1b0;
      }
      pppppppuVar8 = (undefined8 *******)
                     FUN_145cb6180(uStack_80,uStack_180,pppppppuStack_70,pppppppuStack_90);
      pppppppuVar17 = pppppppuStack_1f0;
      if (pppppppuVar8 != (undefined8 *******)0x0) goto LAB_140018306;
      if (lStack_290 != 0) {
        func_0x0001400021d0(uStack_80,lStack_290,1);
      }
      FUN_1401279a0(&uStack_200);
      uStack_118 = pppppppuVar17;
      FUN_1400869c0(&pppppppuStack_520,pppppppuStack_1a0,pppppppuStack_218);
      pppppppuVar8 = uStack_518;
      FUN_140161890(&uStack_c50,uStack_518,CONCAT44(uStack_50c,uStack_510),&DAT_145ea18d6,2);
      uStack_d8 = uStack_c50;
      uStack_d0 = (undefined8 *******)uStack_c48;
      pppppppuStack_158 = pppppppuStack_70;
      pppppppuStack_150 = pppppppuStack_90;
      uStack_c50 = (undefined8 *******)&uStack_118;
      uStack_c48 = FUN_145cdf080;
      uStack_c38._0_4_ = 0x400020e0;
      uStack_c38._4_4_ = 1;
      uStack_c30 = SUB81(&pppppppuStack_158,0);
      uStack_c2f = (undefined4)((ulonglong)&pppppppuStack_158 >> 8);
      uStack_c2b._0_3_ = (undefined3)((ulonglong)&pppppppuStack_158 >> 0x28);
      uStack_c2b = CONCAT13(0x90,(undefined3)uStack_c2b);
      uStack_c27 = 0x145cbf5;
      uStack_c23 = uStack_c23 & 0xff000000;
      puVar4 = &uStack_d8;
      uStack_c8 = uStack_c40;
      FUN_145cb5ab0(&DAT_145ea18d8,&uStack_c50);
      uStack_c40 = (undefined8 *******)puVar4;
      pppppppuStack_58 = pppppppuVar8;
      if (uStack_d8 != (undefined8 *******)0x0) {
        func_0x0001400021d0(uStack_d0,uStack_d8,1);
      }
      FUN_140090110(&pppppppuStack_520);
      if (pppppppuStack_520 != (undefined8 *******)0x0) {
        func_0x0001400021d0(pppppppuStack_58,(longlong)pppppppuStack_520 * 0x18,8);
      }
    }
    else {
      pppppppuVar8 = (undefined8 *******)FUN_145cb5f90(uStack_80,uStack_180);
      if (pppppppuVar8 == (undefined8 *******)0x0) goto LAB_1400182de;
LAB_140018306:
      if (lStack_290 != 0) {
        func_0x0001400021d0(uStack_80,lStack_290,1);
      }
      FUN_1401279a0(&uStack_200);
      pppppppuStack_520 = pppppppuStack_70;
      uStack_518 = pppppppuStack_90;
      uStack_c50 = &pppppppuStack_520;
      uStack_c48 = (code *)&SUB_145cbf590;
      uStack_c40 = (undefined8 *******)&uStack_d8;
      uStack_c38._0_4_ = 0x45cdd3a0;
      uStack_c38._4_4_ = 1;
      uStack_d8 = pppppppuVar8;
      FUN_145cb5ba0(&DAT_145ea1903,&uStack_c50);
      uStack_c8 = (undefined8 *******)CONCAT44(uStack_c8._4_4_,(undefined4)uStack_c8);
      if ((1 < ((uint)uStack_d8 & 3) - 2) &&
         (uStack_c8 = (undefined8 *******)CONCAT44(uStack_c8._4_4_,(undefined4)uStack_c8),
         ((ulonglong)uStack_d8 & 3) != 0)) {
        uStack_c48 = (code *)((longlong)uStack_d8 + -1);
        uStack_c50 = (undefined8 *******)CONCAT71(uStack_c50._1_7_,3);
        func_0x000145cdf070(&uStack_c48);
      }
    }
    pppppppuVar8 = pppppppuStack_78;
    pppppppuVar17 = pppppppuStack_88;
    pppppppuVar20 = pppppppuStack_1a0 + 1;
    do {
      if (pppppppuVar20[-1] != (undefined8 ******)0x0) {
        func_0x0001400021d0(*pppppppuVar20,pppppppuVar20[-1],1);
      }
      pppppppuVar20 = pppppppuVar20 + 4;
      lVar7 = lVar7 + -1;
    } while (lVar7 != 0);
    if (CONCAT44(uStack_234,uStack_238) != 0) {
      func_0x0001400021d0(pppppppuStack_1a0,CONCAT44(uStack_234,uStack_238) << 5,8);
    }
  }
  else {
LAB_140017cf8:
    if (bStack_148 != 0xff) {
      pppppppuStack_1e8 = (undefined8 *******)CONCAT17(uStack_140,uStack_147);
      pppppppuStack_1d8 = pppppppuStack_137;
      pppppppuStack_1e0 = pppppppuStack_13f;
    }
    pppppppuStack_520 = pppppppuStack_158;
    uStack_518 = pppppppuVar8;
    uStack_510._1_3_ = SUB83(pppppppuStack_1e8,0);
    uStack_510 = CONCAT31(uStack_510._1_3_,bStack_148);
    uStack_50c = (undefined4)((ulonglong)pppppppuStack_1e8 >> 0x18);
    uStack_508 = (undefined1)((ulonglong)pppppppuStack_1e8 >> 0x38);
    uStack_507 = SUB87(pppppppuStack_1e0,0);
    uStack_500 = (undefined1)((ulonglong)pppppppuStack_1e0 >> 0x38);
    pppppppuStack_4ff = pppppppuStack_1d8;
    uStack_4e8 = uStack_120;
    uStack_4e6 = uStack_11e;
    if ((byte)uStack_c8 != -1) {
      uStack_f8 = uStack_a7;
      uStack_118 = (undefined8 *******)
                   CONCAT17((undefined1)uStack_c0,CONCAT43(uStack_c8._4_4_,uStack_c8._1_3_));
      uStack_110 = (undefined8 *******)CONCAT17(uStack_b8,CONCAT43(uStack_bc,uStack_c0._1_3_));
      uStack_108 = lStack_b7;
      uStack_100 = (undefined4)uStack_af;
      uStack_fc = (uint)(CONCAT17(uStack_a8,uStack_af) >> 0x20);
    }
    uStack_c50 = uStack_d8;
    uStack_c48 = (code *)pppppppuVar17;
    uStack_c40._1_3_ = SUB83(uStack_118,0);
    uStack_c40._0_4_ = CONCAT31(uStack_c40._1_3_,(byte)uStack_c8);
    uStack_c40._4_4_ = (undefined4)((ulonglong)uStack_118 >> 0x18);
    uStack_c38._1_3_ = SUB83(uStack_110,0);
    uStack_c38._0_4_ = CONCAT31(uStack_c38._1_3_,(char)((ulonglong)uStack_118 >> 0x38));
    uStack_c38._4_4_ = (undefined4)((ulonglong)uStack_110 >> 0x18);
    uStack_c30 = (undefined1)((ulonglong)uStack_110 >> 0x38);
    uStack_c2f = (undefined4)uStack_108;
    uStack_c2b = uStack_108._4_4_;
    uStack_c27 = uStack_100;
    uStack_c23 = uStack_fc;
    uStack_c1f = uStack_f8;
    uStack_c18._0_3_ = CONCAT12(uStack_9e,uStack_a0);
    cVar5 = FUN_140011280(&pppppppuStack_520,&uStack_c50);
    if (cVar5 != '\0') goto LAB_140017e27;
LAB_14001826e:
    pppppppuVar17 = pppppppuStack_88;
    pppppppuVar8 = pppppppuStack_78;
  }
  if (pppppppuVar17 != (undefined8 *******)0x0) {
    func_0x0001400021d0(pppppppuStack_e8,pppppppuVar17,1);
  }
LAB_140018293:
  if (pppppppuVar8 != (undefined8 *******)0x0) {
    func_0x0001400021d0(pppppppuStack_70,pppppppuVar8,1);
  }
  return;
LAB_140018b50:
  FUN_14011dad0(&pppppppuStack_520,&uStack_c50);
  if (pppppppuStack_520 != (undefined8 *******)0x0) {
    lVar7 = CONCAT44(uStack_50c,uStack_510);
    if ((undefined8 *******)pppppppuStack_520[lVar7 * 3 + 0x2d] ==
        (undefined8 *******)0xffffffffffffffff) goto LAB_140018cb4;
    pppppppuStack_150 = (undefined8 *******)pppppppuStack_520[lVar7 * 3 + 0x2e];
    bStack_148 = (byte)pppppppuStack_520[lVar7 * 3 + 0x2f];
    uStack_147 = (undefined7)((ulonglong)pppppppuStack_520[lVar7 * 3 + 0x2f] >> 8);
    uStack_d8 = (undefined8 *******)pppppppuStack_520[lVar7 * 4];
    uStack_d0 = (undefined8 *******)(pppppppuStack_520 + lVar7 * 4)[1];
    pppppppuVar8 = pppppppuStack_520 + lVar7 * 4 + 2;
    uStack_c8._0_4_ = *(undefined4 *)pppppppuVar8;
    uStack_c8._4_4_ = *(undefined4 *)((longlong)pppppppuVar8 + 4);
    uStack_c0 = *(undefined4 *)(pppppppuVar8 + 1);
    uStack_bc = *(undefined4 *)((longlong)pppppppuVar8 + 0xc);
    pppppppuStack_158 = (undefined8 *******)pppppppuStack_520[lVar7 * 3 + 0x2d];
    FUN_14011d480(&pppppppuStack_520,&pppppppuStack_250,&pppppppuStack_158,&uStack_d8);
    if ((byte)pppppppuStack_520 < 5) {
      if (3 < (byte)pppppppuStack_520 - 1) {
        if ((byte)pppppppuStack_520 == 0) {
          if (uStack_518 != (undefined8 *******)0x0) {
            func_0x0001400021d0(CONCAT44(uStack_50c,uStack_510),uStack_518,1);
          }
        }
        else {
LAB_140018b3b:
          FUN_140106a90(&uStack_518);
        }
      }
    }
    else if ((byte)pppppppuStack_520 == 5) {
      lStack_1b8 = CONCAT44(uStack_50c,uStack_510);
      pppppppuStack_68 = (undefined8 *******)CONCAT71(uStack_507,uStack_508);
      pppppppuStack_58 = (undefined8 *******)0x0;
      lVar7 = lStack_1b8;
      while (pppppppuStack_68 != pppppppuStack_58) {
        pppppppuStack_58 = (undefined8 *******)((longlong)pppppppuStack_58 + 1);
        FUN_140069270(lVar7);
        lVar7 = lVar7 + 0x20;
      }
      if (uStack_518 != (undefined8 *******)0x0) {
        func_0x0001400021d0(lStack_1b8,(longlong)uStack_518 << 5,8);
      }
    }
    else if ((byte)pppppppuStack_520 != 0xff) goto LAB_140018b3b;
    goto LAB_140018b50;
  }
LAB_140018cb4:
  FUN_14012e030(&uStack_c50);
LAB_140018cbd:
  uStack_c50 = (undefined8 *******)0x0;
  uStack_c48 = (code *)pppppppuStack_268;
  uStack_c40._0_4_ = SUB84(pppppppuStack_198,0);
  uStack_c40._4_4_ = (undefined4)((ulonglong)pppppppuStack_198 >> 0x20);
  uStack_c38._0_4_ = SUB84(pppppppuStack_268,0);
  uStack_c38._4_4_ = (undefined4)((ulonglong)pppppppuStack_268 >> 0x20);
  uStack_c30 = 0;
  uStack_c2f = 0;
  uStack_c2b._3_1_ = (byte)pppppppuStack_268;
  uStack_c2b = (uint)uStack_c2b._3_1_ << 0x18;
  uStack_c27 = (undefined4)((ulonglong)pppppppuStack_268 >> 8);
  uStack_c23 = CONCAT13(10,(int3)((ulonglong)pppppppuStack_268 >> 0x28));
  uStack_c1f = 0xa000000;
  uStack_c18 = (undefined8 *******)CONCAT71(uStack_c18._1_7_,1);
  pppppppuStack_c10 = (undefined8 *******)((ulonglong)pppppppuStack_c10 & 0xffffffffffff0000);
  uStack_c08 = 0;
  FUN_14009e3c0(&pppppppuStack_520,&uStack_c50);
  lVar7 = lStack_258;
  if (pppppppuStack_178 != (undefined8 *******)0x0) {
    func_0x0001400021d0(pppppppuStack_170,pppppppuStack_178,1);
  }
  uStack_168 = CONCAT44(uStack_50c,uStack_510);
  pppppppuStack_178 = pppppppuStack_520;
  pppppppuStack_170 = uStack_518;
  FUN_140106a90(&pppppppuStack_1e8);
  lVar11 = lStack_1c0;
  lVar16 = lStack_270 + 0x28;
  if (pppppppuStack_190 != (undefined8 *******)0x0) {
    func_0x0001400021d0(pppppppuStack_198,pppppppuStack_190,1);
  }
  goto LAB_140018940;
}
