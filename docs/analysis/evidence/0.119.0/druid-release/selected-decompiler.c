/* Tranquility pulse branch; selected normalized lines 288..365; owner 0x145bc53e0. Inferred types/ABI remain uncertain. */
           (1.0 <= *(float *)(param_1 + 0x1a0))) {
          iVar39 = *(int *)(*(longlong *)(param_1 + 0x848) + 0xc + lVar38);
          *(float *)(param_1 + 0x1a4) = *(float *)(param_1 + 0xbdc) + 1.0;
          *(undefined4 *)(param_1 + 0x1a0) = 0;
          uStack_1c0._0_4_ = *(undefined4 *)(param_1 + 0x4f8);
          pppppppuStack_1c8 = *(ulonglong ********)(param_1 + 0x4f0);
          in_stack_fffffffffffffda0 = (ulonglong *******)0x0;
          FUN_145bc04c0(auStack_128,param_1);
          pppppppuVar15 = uStack_118;
          if (iVar39 == 0) {
            ppppppuStack_150 = (ulonglong ******)uStack_120;
          }
          else {
            pppppppuStack_148 = (ulonglong *******)CONCAT44(pppppppuStack_148._4_4_,2);
            uStack_160 = (ulonglong ******)((ulonglong)uStack_160 & 0xffffffff00000000);
            uStack_109 = 1;
            in_stack_fffffffffffffda8 = (ulonglong *******)&uStack_160;
            in_stack_fffffffffffffda0 = (ulonglong *******)&pppppppuStack_148;
            ppppppuStack_150 = (ulonglong ******)uStack_120;
            FUN_145b6c400(&pppppppuStack_1c8,*(undefined8 *)(param_1 + 0x488),iVar39,uStack_120,
                          uStack_118,in_stack_fffffffffffffda0,in_stack_fffffffffffffda8);
            lVar38 = *(longlong *)(param_1 + 0x650);
            if (lVar38 == *(longlong *)(param_1 + 0x640)) {
              FUN_145f94930(param_1 + 0x640);
            }
            lVar20 = *(longlong *)(param_1 + 0x648);
            auVar60._4_4_ = fStack_1b4;
            auVar60._0_4_ = iStack_1b8;
            auVar60._8_4_ = uStack_1b0;
            auVar60[0xc] = uStack_1ac;
            auVar60[0xd] = uStack_1ab;
            auVar60._14_2_ = uStack_1aa;
            *(undefined1 (*) [16])(lVar20 + 0x10 + lVar38 * 0x20) = auVar60;
            plVar36 = (longlong *)(lVar20 + lVar38 * 0x20);
            *plVar36 = (longlong)pppppppuStack_1c8;
            plVar36[1] = CONCAT44(uStack_1c0._4_4_,(undefined4)uStack_1c0);
            *(longlong *)(param_1 + 0x650) = lVar38 + 1;
          }
          auVar60 = *(undefined1 (*) [16])(param_1 + 0x20);
          *(undefined8 *)(param_1 + 0x20) = 1;
          *(longlong *)(param_1 + 0x28) = lVar40;
          ppppppuVar14 = (ulonglong ******)_auStack_128;
          if (pppppppuVar15 != (ulonglong *******)0x0) {
            uVar2 = *(undefined1 *)(param_1 + 0x1ad);
            lVar38 = 0;
            do {
              uVar41 = *(undefined8 *)((longlong)ppppppuStack_150 + lVar38);
              uVar29 = *(ulonglong *)(param_1 + 0xb28);
              uVar28 = *(ulonglong *)(param_1 + 0xb40) + uVar29;
              uVar13 = (uVar28 * 0x800000 | uVar28 >> 0x29) + uVar29;
              uVar28 = *(ulonglong *)(param_1 + 0xb30);
              uVar16 = *(ulonglong *)(param_1 + 0xb38) ^ uVar29;
              uVar44 = *(ulonglong *)(param_1 + 0xb40) ^ uVar28;
              *(ulonglong *)(param_1 + 0xb30) = uVar28 ^ uVar16;
              *(ulonglong *)(param_1 + 0xb28) = uVar29 ^ uVar44;
              *(ulonglong *)(param_1 + 0xb38) = uVar16 ^ uVar28 << 0x11;
              *(ulonglong *)(param_1 + 0xb40) = uVar44 << 0x2d | uVar44 >> 0x13;
              *(undefined1 *)(param_1 + 0x1ad) = 3;
              in_stack_fffffffffffffda0 =
                   (ulonglong *******)
                   CONCAT71((int7)((ulonglong)in_stack_fffffffffffffda0 >> 8),
                            (float)(uint)(uVar13 >> 0x28) * 5.9604645e-08 <
                            *(float *)(param_1 + 0x4ac));
              in_stack_fffffffffffffda8 =
                   (ulonglong *******)((ulonglong)in_stack_fffffffffffffda8 & 0xffffffffffffff00);
              FUN_145bd6420(param_1,uVar41,uVar13 >> 0x28,0x2e4,3,in_stack_fffffffffffffda0,
                            in_stack_fffffffffffffda8);
              *(undefined1 *)(param_1 + 0x1ad) = uVar2;
              lVar38 = lVar38 + 8;
            } while ((longlong)pppppppuVar15 * 8 != lVar38);
          }
          if (ppppppuVar14 != (ulonglong ******)0x0) {
            func_0x0001400021d0(ppppppuStack_150,(longlong)ppppppuVar14 << 3);
          }
          *(undefined1 (*) [16])(param_1 + 0x20) = auVar60;
        }
        break;
      }

/* Source-kind3 generic-effect exclusion; selected normalized lines 8200..8215; owner 0x145bd6420. Inferred types/ABI remain uncertain. */
  fStack_1c8 = fVar167;
  pppppppfVar70 = uStack_1d8;
  lVar65 = CONCAT44(uStack_fc,uStack_100);
  cVar163 = *(char *)(lVar65 + 0x1ad);
  if ((cVar163 == '\x03') || (*(longlong *)(lVar65 + 0x850) == 0)) {
    if ((char *)0xfffffffffffffffd < (char *)((longlong)pppppppfStack_128 - 1U)) goto LAB_145bd9aab;
  }
  else {
    cVar149 = (char)*(undefined4 *)(lVar65 + 0x1ac);
    cVar56 = '\0';
    if (cVar163 == '\x01') {
      cVar56 = cVar149;
      if (cVar149 != '\0') goto LAB_145bd9873;
LAB_145bd98cd:
      uVar58 = 0;
    }

/* Self-HoT source-local replacement and insertion; selected normalized lines 10912..10981; owner 0x145bb8e90. Inferred types/ABI remain uncertain. */
        fVar309 = *(float *)((longlong)pauVar182[6] + 0xc);
        if (fVar328 * 0.85 < *(float *)((longlong)param_1[0x50] + 8)) {
          pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc284;
          cVar62 = func_0x000145b85e70(param_1);
          if (cVar62 == '\0') {
            return (undefined1 (*) [16])0x0;
          }
        }
        fVar308 = SQRT(fVar308 * fVar312) * 1.4;
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc2be;
        FUN_145b85270(param_1,*(undefined4 *)pauVar182[4],fVar308 * fVar309);
        auVar227._0_8_ = *(undefined8 *)((longlong)param_1[0x48] + 8);
        uStack_158._0_4_ = (float)auVar227._0_8_;
        uStack_158._4_4_ = (undefined4)((ulonglong)auVar227._0_8_ >> 0x20);
        acStack_130[0] = '\x02';
        acStack_130[1] = '\0';
        acStack_130[2] = '\0';
        uStack_12d = uStack_12d & 0xffffff00;
        auVar43._12_4_ = 0;
        auVar43._0_12_ = stack0xfffffffffffffdfc;
        _auStack_208 = auVar43 << 0x20;
        uStack_2a8 = (undefined1 (*) [16])auStack_208;
        uStack_2b0 = acStack_130;
        uStack_2b8._0_4_ = 1.4013e-45;
        uStack_2b8._4_4_ = 0.0;
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc319;
        FUN_145b6c400(&uStack_1e8,auVar227._0_8_,*(undefined4 *)pauVar182[4],&uStack_158);
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc324;
        FUN_145b1e060(param_1 + 100,&uStack_1e8);
        if (*(float *)((longlong)pauVar182[5] + 8) <= 0.0) {
          uStack_1e8._0_4_ = -NAN;
          uStack_1e8._4_4_ = -NAN;
          pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc3ec;
          FUN_145b931a0(param_1);
          return (undefined1 (*) [16])0x1;
        }
        acStack_130[0] = *(int *)pauVar182[4] == 0x306;
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc35c;
        FUN_145c20c50((undefined8 *)((longlong)param_1[0x3a] + 8),pauVar182,acStack_130);
        uVar315 = *(undefined4 *)pauVar182[4];
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc36b;
        func_0x000145b8aea0(&uStack_1e8,param_2);
        lVar102 = *(longlong *)((longlong)param_1[0x3b] + 8);
        if (lVar102 == *(longlong *)((longlong)param_1[0x3a] + 8)) {
          pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbc38b;
          FUN_145f94930((undefined8 *)((longlong)param_1[0x3a] + 8));
        }
        lVar195 = *(longlong *)pauStack_100[0x3b];
        lVar294 = lVar102 * 0x20;
        *(undefined8 *)(lVar195 + lVar294) = 0;
        *(ulonglong *)(lVar195 + 8 + lVar294) = CONCAT44(uStack_1e8._4_4_,(float)uStack_1e8);
        *(float *)(lVar195 + 0x10 + lVar294) = (float)uStack_1e0;
        *(undefined4 *)(lVar195 + 0x14 + lVar294) = uVar315;
        *(float *)(lVar195 + 0x18 + lVar294) = fVar310 + fVar298;
        *(float *)(lVar195 + 0x1c + lVar294) = fVar328 * fVar309 * fVar308;
code_r0x000145bbbc03:
        *(longlong *)((longlong)pauStack_100[0x3b] + 8) = lVar102 + 1;
        pauStack_2e0 = (undefined1 (*) [16])&UNK_145bbbc12;
        FUN_145b8bd60();
        return (undefined1 (*) [16])0x1;
      }
      if (uVar68 == 0xc) {
        if (fVar328 * 0.35 < *(float *)((longlong)param_1[0x50] + 8)) {
          return (undefined1 (*) [16])0x0;
        }
        pauVar197 = param_1 + 100;
        pauVar97 = *(undefined1 (**) [16])((longlong)param_1[0x48] + 8);
        pauVar188 = (undefined1 (*) [16])(ulonglong)*(uint *)pauVar182[4];
        uStack_158._0_4_ = SUB84(pauVar97,0);
        uStack_158._4_4_ = (undefined4)((ulonglong)pauVar97 >> 0x20);

/* Complete local source-aware prune helper; selected normalized lines 1..120; owner 0x145c20c50. Inferred types/ABI remain uncertain. */

void FUN_145c20c50(longlong param_1,longlong param_2,byte *param_3)

{
  int iVar1;
  int iVar2;
  ulonglong uVar3;
  longlong *plVar4;
  longlong lVar5;
  longlong lVar6;
  longlong lVar7;
  ulonglong uVar8;
  ulonglong uVar9;
  longlong *plVar10;
  longlong lVar11;
  int *piVar12;
  longlong *plVar13;
  ulonglong uVar14;

  uVar3 = *(ulonglong *)(param_1 + 0x10);
  if (uVar3 != 0) {
    plVar4 = *(longlong **)(param_1 + 8);
    iVar1 = *(int *)(param_2 + 0x40);
    if ((*param_3 & 1) == 0) {
      piVar12 = (int *)((longlong)plVar4 + 0x14);
      uVar8 = 0;
      do {
        if (*piVar12 == iVar1) goto LAB_145c20c9c;
        uVar8 = uVar8 + 1;
        piVar12 = piVar12 + 8;
      } while (uVar3 != uVar8);
    }
    else {
      uVar8 = 0;
      plVar13 = plVar4;
      do {
        if ((*(int *)((longlong)plVar13 + 0x14) == iVar1) && (*plVar13 == 0)) {
LAB_145c20c9c:
          uVar14 = uVar8 + 1;
          uVar9 = uVar8;
          if (uVar14 < uVar3) {
            if ((*param_3 & 1) == 0) {
              if (((int)uVar8 - (int)uVar3 & 1U) == 0) {
                if (*(int *)((longlong)plVar4 + uVar14 * 0x20 + 0x14) != iVar1) {
                  plVar13 = plVar4 + uVar14 * 4;
                  lVar11 = *plVar13;
                  lVar5 = plVar13[1];
                  lVar6 = plVar13[3];
                  plVar4[uVar8 * 4 + 2] = plVar13[2];
                  (plVar4 + uVar8 * 4 + 2)[1] = lVar6;
                  plVar4[uVar8 * 4] = lVar11;
                  (plVar4 + uVar8 * 4)[1] = lVar5;
                  uVar9 = uVar8 + 1;
                }
                uVar14 = uVar8 + 2;
              }
              if (uVar3 - 2 != uVar8) {
                lVar11 = uVar3 - uVar14;
                piVar12 = (int *)((longlong)plVar4 + uVar14 * 0x20 + 0x34);
                do {
                  if (piVar12[-8] == iVar1) {
                    iVar2 = *piVar12;
                  }
                  else {
                    lVar5 = *(longlong *)(piVar12 + -0xd);
                    lVar6 = *(longlong *)(piVar12 + -0xb);
                    lVar7 = *(longlong *)(piVar12 + -7);
                    plVar4[uVar9 * 4 + 2] = *(longlong *)(piVar12 + -9);
                    (plVar4 + uVar9 * 4 + 2)[1] = lVar7;
                    plVar4[uVar9 * 4] = lVar5;
                    (plVar4 + uVar9 * 4)[1] = lVar6;
                    uVar9 = uVar9 + 1;
                    iVar2 = *piVar12;
                  }
                  if (iVar2 != iVar1) {
                    lVar5 = *(longlong *)(piVar12 + -5);
                    lVar6 = *(longlong *)(piVar12 + -3);
                    lVar7 = *(longlong *)(piVar12 + 1);
                    plVar4[uVar9 * 4 + 2] = *(longlong *)(piVar12 + -1);
                    (plVar4 + uVar9 * 4 + 2)[1] = lVar7;
                    plVar4[uVar9 * 4] = lVar5;
                    (plVar4 + uVar9 * 4)[1] = lVar6;
                    uVar9 = uVar9 + 1;
                  }
                  piVar12 = piVar12 + 0x10;
                  lVar11 = lVar11 + -2;
                } while (lVar11 != 0);
              }
            }
            else {
              lVar11 = ~uVar8 + uVar3;
              plVar13 = plVar4 + uVar8 * 4;
              do {
                plVar10 = plVar13 + 4;
                if ((*(int *)((longlong)plVar13 + 0x34) != iVar1) || (*plVar10 != 0)) {
                  lVar5 = *plVar10;
                  lVar6 = plVar13[5];
                  lVar7 = plVar13[7];
                  plVar4[uVar9 * 4 + 2] = plVar13[6];
                  (plVar4 + uVar9 * 4 + 2)[1] = lVar7;
                  plVar4[uVar9 * 4] = lVar5;
                  (plVar4 + uVar9 * 4)[1] = lVar6;
                  uVar9 = uVar9 + 1;
                }
                lVar11 = lVar11 + -1;
                plVar13 = plVar10;
              } while (lVar11 != 0);
            }
          }
          *(ulonglong *)(param_1 + 0x10) = uVar9;
          return;
        }
        uVar8 = uVar8 + 1;
        plVar13 = plVar13 + 4;
      } while (uVar3 != uVar8);
    }
  }
  return;
}


/* Independent per-row HoT consumption; selected normalized lines 103..143; owner 0x145b8d6e0. Inferred types/ABI remain uncertain. */
  lVar21 = *(longlong *)(param_1 + 0x3b0);
  lVar16 = *(longlong *)(param_1 + 0x3b8);
  fVar44 = 1.0;
  fVar45 = 0.0;
  lVar19 = lVar21;
  while (lVar17 = lVar19, lVar19 = lStack_168, lVar17 != lVar16 * 0x20 + lVar21) {
    fVar38 = *(float *)(lVar17 + 0x1c);
    if (0.0 < fVar38) {
      fVar37 = *(float *)(lVar17 + 0x18) - fVar36;
      fVar46 = fVar37;
      if (fVar37 <= param_2) {
        fVar46 = param_2;
      }
      fVar46 = param_2 / (float)(~-(uint)NAN(fVar46) & (uint)fVar46 |
                                (uint)fVar37 & -(uint)NAN(fVar46));
      if (1.0 <= fVar46) {
        fVar46 = 1.0;
      }
      fVar46 = fVar46 * fVar38;
      *(float *)(lVar17 + 0x1c) = fVar38 - fVar46;
      uVar15 = *(undefined4 *)(lVar17 + 0x14);
      if (lStack_168 == lStack_178) {
        cStack_f1 = 1;
        FUN_145fc4810(&lStack_178);
      }
      fVar45 = fVar45 + fVar46;
      *(undefined4 *)(puStack_170 + lVar19) = uVar15;
      *(float *)((longlong)puStack_170 + lVar19 * 8 + 4) = fVar46;
      lStack_168 = lVar19 + 1;
    }
    uVar27 = uStack_180;
    lVar19 = lVar17 + 0x20;
    if (*(float *)(lVar17 + 0x18) <= fVar36) {
      uVar15 = *(undefined4 *)(lVar17 + 0x14);
      if (uStack_180 == uStack_190) {
        cStack_f1 = 1;
        FUN_145f99640(&uStack_190);
      }
      *(undefined4 *)(lStack_188 + uVar27 * 4) = uVar15;
      uStack_180 = uVar27 + 1;
    }

/* One health clamp for regeneration and all HoTs; selected normalized lines 288..321; owner 0x145b8d6e0. Inferred types/ABI remain uncertain. */
  }
  cStack_f1 = 1;
  FUN_145b94600(param_1);
  cStack_f1 = 1;
  FUN_145b8bd60(param_1);
LAB_145b8d9ef:
  fVar37 = *(float *)(param_1 + 0x4c4) * param_2;
  fVar36 = *(float *)(param_1 + 0x4a0);
  fVar38 = *(float *)(param_1 + 0x508);
  fVar46 = fVar38;
  if (fVar38 < fVar36) {
    fVar39 = fVar37 + fVar38 + fVar45;
    fVar46 = fVar39;
    if (fVar36 <= fVar39) {
      fVar46 = fVar36;
    }
    fVar36 = (float)(~-(uint)NAN(fVar46) & (uint)fVar46 | (uint)fVar39 & -(uint)NAN(fVar46));
    *(float *)(param_1 + 0x508) = fVar36;
    if (fVar36 <= 0.0) {
      fVar36 = 0.0;
    }
    fVar36 = (float)func_0x000145f94247(fVar36);
    uVar27 = (longlong)fVar36 & 0xffffffff;
    if (fVar36 < 0.0) {
      uVar27 = 0;
    }
    if (4.294967e+09 < fVar36) {
      uVar27 = 0xffffffff;
    }
    cStack_f1 = 1;
    FUN_145a74ac0(param_1 + 0xb60,0x16,uVar27);
    func_0x000145f94247();
    cStack_f1 = 1;
    FUN_145a74ac0(param_1 + 0xb60,0x1c);

/* Merge active aura rows by spell; selected normalized lines 62..112; owner 0x145b8bd60. Inferred types/ABI remain uncertain. */
  fVar4 = *(float *)(param_1 + 0xbdc);
  uStack_e0 = 0;
  lStack_d8 = 4;
  uStack_d0 = 0;
  lVar22 = *(longlong *)(param_1 + 0x3b0);
  lVar26 = *(longlong *)(param_1 + 0x3b8) * 0x20;
  lVar27 = lVar22 + lVar26;
  lVar38 = lVar22;
  lStack_c8 = param_1;
LAB_145b8bdd9:
  uVar29 = uStack_d0;
  lVar39 = lVar38;
  if (lVar38 != lVar27) {
    while( true ) {
      lVar38 = lVar39 + 0x20;
      fVar5 = *(float *)(lVar39 + 0x18);
      if (fVar4 < fVar5) break;
      lVar39 = lVar38;
      if (lVar38 == lVar27) goto LAB_145b8beb5;
    }
    iVar15 = *(int *)(lVar39 + 0x14);
    lVar18 = 0;
    do {
      if (uStack_d0 * 0xc == lVar18) {
        if (uStack_d0 == uStack_e0) {
          FUN_145fc4c00(&uStack_e0);
        }
        *(int *)(lStack_d8 + uVar29 * 0xc) = iVar15;
        *(float *)(lStack_d8 + 4 + uVar29 * 0xc) = fVar5;
        *(undefined4 *)(lStack_d8 + 8 + uVar29 * 0xc) = 1;
        uStack_d0 = uVar29 + 1;
        goto LAB_145b8bdd9;
      }
      lVar1 = lVar18 + 0xc;
      piVar3 = (int *)(lStack_d8 + lVar18);
      lVar18 = lVar1;
    } while (*piVar3 != iVar15);
    piVar3 = (int *)(lStack_d8 + -4 + lVar1);
    *piVar3 = *piVar3 + 1;
    fVar5 = *(float *)(lStack_d8 + -8 + lVar1);
    fVar41 = fVar5;
    if (fVar5 <= *(float *)(lVar39 + 0x18)) {
      fVar41 = *(float *)(lVar39 + 0x18);
    }
    *(uint *)(lStack_d8 + -8 + lVar1) =
         ~-(uint)NAN(fVar41) & (uint)fVar41 | (uint)fVar5 & -(uint)NAN(fVar41);
    goto LAB_145b8bdd9;
  }
LAB_145b8beb5:
  uStack_f8 = 0;
  plStack_f0 = (longlong *)&DAT_00000004;

/* Complete shared-heal event producer; selected normalized lines 1..36; owner 0x145b85270. Inferred types/ABI remain uncertain. */

void FUN_145b85270(longlong param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  longlong lVar5;
  longlong lVar6;
  longlong lVar7;

  if (*(char *)(param_1 + 0xc85) == '\x01') {
    uVar2 = *(undefined8 *)(param_1 + 0xb80);
    uVar3 = *(undefined8 *)(param_1 + 0x488);
    uVar1 = *(undefined4 *)(param_1 + 0x4f8);
    uVar4 = *(undefined8 *)(param_1 + 0x4f0);
    lVar5 = *(longlong *)(param_1 + 0xa40);
    if (lVar5 == *(longlong *)(param_1 + 0xa30)) {
      FUN_145f948c0(param_1 + 0xa30);
    }
    lVar6 = *(longlong *)(param_1 + 0xa38);
    lVar7 = lVar5 * 0x38;
    *(undefined8 *)(lVar6 + lVar7) = uVar2;
    *(undefined8 *)(lVar6 + 8 + lVar7) = uVar3;
    *(undefined8 *)(lVar6 + 0x10 + lVar7) = uVar4;
    *(undefined4 *)(lVar6 + 0x18 + lVar7) = uVar1;
    *(undefined4 *)(lVar6 + 0x1c + lVar7) = param_2;
    *(undefined4 *)(lVar6 + 0x20 + lVar7) = param_3;
    *(undefined4 *)(lVar6 + 0x24 + lVar7) = param_4;
    *(undefined4 *)(lVar6 + 0x28 + lVar7) = 0xe;
    *(longlong *)(param_1 + 0xa40) = lVar5 + 1;
  }
  return;
}


/* Shared-heal source-aware consumer; selected normalized lines 1..500; owner 0x145b86da0. Inferred types/ABI remain uncertain. */

void FUN_145b86da0(longlong param_1,longlong param_2)

{
  longlong lVar1;
  longlong *plVar2;
  undefined8 *puVar3;
  int *piVar4;
  float fVar5;
  float fVar6;
  undefined1 auVar7 [16];
  char *pcVar8;
  ulonglong uVar9;
  code *pcVar10;
  int iVar11;
  int iVar12;
  bool bVar13;
  ulonglong *puVar14;
  ulonglong *puVar15;
  char *pcVar16;
  undefined4 uVar17;
  int iVar18;
  int iVar19;
  ulonglong *puVar20;
  longlong lVar21;
  undefined4 *puVar22;
  ulonglong uVar23;
  longlong lVar24;
  undefined8 uVar25;
  char *pcVar26;
  ulonglong uVar27;
  undefined8 uVar28;
  longlong *plVar29;
  undefined4 uVar30;
  longlong lVar31;
  longlong lVar32;
  longlong *plVar33;
  ulonglong uVar34;
  ulonglong uVar35;
  uint uVar36;
  undefined1 (*pauVar37) [16];
  undefined1 (*pauVar38) [16];
  int *piVar39;
  uint uVar40;
  uint uVar41;
  char cVar42;
  undefined4 uVar43;
  ulonglong uVar44;
  uint uVar45;
  longlong lVar46;
  longlong lVar47;
  ulonglong *puVar48;
  undefined4 unaff_XMM6_Da;
  undefined4 unaff_XMM6_Db;
  undefined4 unaff_XMM6_Dc;
  undefined4 unaff_XMM6_Dd;
  float fVar49;
  float fVar50;
  undefined4 unaff_XMM8_Dc;
  undefined4 unaff_XMM8_Dd;
  ulonglong uStack_f8;
  longlong *plStack_f0;
  ulonglong uStack_e8;
  ulonglong uStack_e0;
  longlong lStack_d8;
  ulonglong uStack_d0;
  longlong lStack_c8;
  undefined1 uStack_b9;
  ulonglong *puStack_b8;
  ulonglong *puStack_b0;
  longlong lStack_a8;
  ulonglong *puStack_a0;
  undefined1 uStack_91;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_40;

  uStack_40 = CONCAT44(unaff_XMM8_Dd,unaff_XMM8_Dc);
  uStack_68 = CONCAT44(unaff_XMM6_Db,unaff_XMM6_Da);
  uStack_60 = CONCAT44(unaff_XMM6_Dd,unaff_XMM6_Dc);
  uStack_70 = 0xfffffffffffffffe;
  fVar50 = *(float *)(param_1 + 0x4a0);
  fVar5 = *(float *)(param_2 + 0x20);
  fVar49 = fVar50 * fVar5;
  iVar18 = 2;
  if (0xd < *(uint *)(param_2 + 0x28)) {
    iVar18 = *(uint *)(param_2 + 0x28) - 0xe;
  }
  if (iVar18 == 0) {
    fVar6 = *(float *)(param_2 + 0x24);
    if (fVar6 <= 0.0) {
      fVar5 = *(float *)(param_1 + 0x508);
      fVar49 = fVar49 + fVar5;
      fVar6 = fVar49;
      if (fVar50 <= fVar49) {
        fVar6 = fVar50;
      }
      fVar50 = (float)(~-(uint)NAN(fVar6) & (uint)fVar6 | (uint)fVar49 & -(uint)NAN(fVar6));
      *(float *)(param_1 + 0x508) = fVar50;
      fVar50 = fVar50 - fVar5;
      if (1.0 <= fVar50) {
        uVar43 = 0;
        uVar17 = (int)(longlong)fVar50;
        if (fVar50 < 0.0) {
          uVar17 = uVar43;
        }
        if (4.294967e+09 < fVar50) {
          uVar17 = 0xffffffff;
        }
        lStack_a8 = CONCAT44(lStack_a8._4_4_,uVar17);
        puStack_a0 = (ulonglong *)((ulonglong)puStack_a0 & 0xffffffffffffff00);
        uStack_d0 = 0x145b86fbf;
        FUN_145b63580(&uStack_90,*(undefined8 *)(param_1 + 0x488),*(undefined8 *)(param_2 + 8),
                      *(undefined4 *)(param_2 + 0x1c));
        lVar31 = *(longlong *)(param_1 + 0x650);
        if (lVar31 == *(longlong *)(param_1 + 0x640)) {
          uStack_d0 = 0x145b86fdb;
          FUN_145f94930(param_1 + 0x640);
        }
        lVar24 = *(longlong *)(param_1 + 0x648);
        puVar22 = (undefined4 *)(lVar24 + 0x10 + lVar31 * 0x20);
        *puVar22 = (undefined4)uStack_80;
        puVar22[1] = uStack_80._4_4_;
        puVar22[2] = uStack_78;
        puVar22[3] = uStack_74;
        puVar3 = (undefined8 *)(lVar24 + lVar31 * 0x20);
        *puVar3 = uStack_90;
        puVar3[1] = uStack_88;
        *(longlong *)(param_1 + 0x650) = lVar31 + 1;
        uStack_d0 = 0x145b8701e;
        fVar50 = (float)func_0x000145f94247();
        uVar17 = (int)(longlong)fVar50;
        if (fVar50 < 0.0) {
          uVar17 = uVar43;
        }
        if (4.294967e+09 < fVar50) {
          uVar17 = 0xffffffff;
        }
        uStack_d0 = 0x145b87043;
        fVar50 = (float)func_0x000145f94247();
        uVar30 = (int)(longlong)fVar50;
        if (fVar50 < 0.0) {
          uVar30 = uVar43;
        }
        if (4.294967e+09 < fVar50) {
          uVar30 = 0xffffffff;
        }
        uStack_d0 = 0x145b8706d;
        FUN_145a74ac0(param_1 + 0xb60,0x16,uVar17);
        uStack_d0 = 0x145b8707c;
        FUN_145a74ac0(param_1 + 0xb60,0x1c,uVar30);
      }
      return;
    }
    iVar18 = *(int *)(param_2 + 0x1c);
    uVar34 = *(ulonglong *)(param_1 + 0x3b8);
    if (uVar34 == 0) {
      lVar31 = *(longlong *)(param_2 + 8);
      uVar34 = 0;
    }
    else {
      plVar2 = *(longlong **)(param_1 + 0x3b0);
      lVar31 = *(longlong *)(param_2 + 8);
      if (iVar18 == 0x306) {
        uVar23 = 0;
        plVar29 = plVar2;
        do {
          if ((*(int *)((longlong)plVar29 + 0x14) == 0x306) && (*plVar29 == lVar31))
          goto LAB_145b86ebe;
          uVar23 = uVar23 + 1;
          plVar29 = plVar29 + 4;
        } while (uVar34 != uVar23);
      }
      else {
        piVar39 = (int *)((longlong)plVar2 + 0x14);
        uVar23 = 0;
        do {
          if (*piVar39 == iVar18) goto LAB_145b86ebe;
          uVar23 = uVar23 + 1;
          piVar39 = piVar39 + 8;
        } while (uVar34 != uVar23);
      }
    }
    goto LAB_145b8719e;
  }
  if (iVar18 == 1) {
    *(float *)(param_1 + 0x50c) = *(float *)(param_1 + 0x50c) + fVar49;
    iVar18 = *(int *)(param_2 + 0x1c);
    if (*(int *)(param_1 + 0x490) == 0) {
      *(int *)(param_1 + 0x490) = iVar18;
      *(float *)(param_1 + 0x494) = fVar49;
      uVar34 = *(ulonglong *)(param_1 + 0x3b8);
    }
    else {
      uVar34 = *(ulonglong *)(param_1 + 0x3b8);
    }
    if (uVar34 != 0) {
      lVar31 = *(longlong *)(param_1 + 0x3b0);
      piVar39 = (int *)(lVar31 + 0x34);
      uVar23 = 0;
LAB_145b86e40:
      if (piVar39[-8] != iVar18) goto code_r0x000145b86e4a;
      uVar44 = uVar23 + 1;
      uVar27 = uVar23;
      if (uVar44 < uVar34) {
        if (((int)uVar34 + (int)uVar23 & 1U) == 0) {
          if (*piVar39 != iVar18) {
            piVar39[-9] = piVar39[-1];
            piVar39[-8] = *piVar39;
            piVar39[-7] = piVar39[1];
            piVar39[-6] = piVar39[2];
            *(undefined1 (*) [16])(piVar39 + -0xd) = *(undefined1 (*) [16])(piVar39 + -5);
            uVar27 = uVar23 + 1;
          }
          uVar44 = uVar23 + 2;
        }
        if (uVar34 - 2 != uVar23) {
          lVar24 = uVar34 - uVar44;
          piVar39 = (int *)(uVar44 * 0x20 + lVar31 + 0x34);
          do {
            if (piVar39[-8] == iVar18) {
              iVar19 = *piVar39;
            }
            else {
              auVar7 = *(undefined1 (*) [16])(piVar39 + -0xd);
              iVar19 = piVar39[-8];
              iVar11 = piVar39[-7];
              iVar12 = piVar39[-6];
              piVar4 = (int *)(lVar31 + 0x10 + uVar27 * 0x20);
              *piVar4 = piVar39[-9];
              piVar4[1] = iVar19;
              piVar4[2] = iVar11;
              piVar4[3] = iVar12;
              *(undefined1 (*) [16])(lVar31 + uVar27 * 0x20) = auVar7;
              uVar27 = uVar27 + 1;
              iVar19 = *piVar39;
            }
            if (iVar19 != iVar18) {
              auVar7 = *(undefined1 (*) [16])(piVar39 + -5);
              iVar19 = *piVar39;
              iVar11 = piVar39[1];
              iVar12 = piVar39[2];
              piVar4 = (int *)(lVar31 + 0x10 + uVar27 * 0x20);
              *piVar4 = piVar39[-1];
              piVar4[1] = iVar19;
              piVar4[2] = iVar11;
              piVar4[3] = iVar12;
              *(undefined1 (*) [16])(lVar31 + uVar27 * 0x20) = auVar7;
              uVar27 = uVar27 + 1;
            }
            piVar39 = piVar39 + 0x10;
            lVar24 = lVar24 + -2;
          } while (lVar24 != 0);
        }
      }
      *(ulonglong *)(param_1 + 0x3b8) = uVar27;
      fVar50 = *(float *)(param_1 + 0xbdc) + *(float *)(param_2 + 0x24);
      if (uVar27 == *(ulonglong *)(param_1 + 0x3a8)) goto LAB_145b870cf;
      goto LAB_145b870db;
    }
    uVar27 = 0;
LAB_145b870b9:
    fVar50 = *(float *)(param_1 + 0xbdc) + *(float *)(param_2 + 0x24);
    if (uVar27 == *(ulonglong *)(param_1 + 0x3a8)) {
LAB_145b870cf:
      uStack_d0 = 0x145b870db;
      FUN_145f94930(param_1 + 0x3a8);
    }
LAB_145b870db:
    lVar31 = *(longlong *)(param_1 + 0x3b0);
    lVar24 = uVar27 * 0x20;
    *(undefined8 *)(lVar31 + lVar24) = 0;
    *(undefined4 *)(lVar31 + 8 + lVar24) = 7;
    *(float *)(lVar31 + 0xc + lVar24) = fVar5;
    *(int *)(lVar31 + 0x14 + lVar24) = iVar18;
    *(float *)(lVar31 + 0x18 + lVar24) = fVar50;
    *(undefined4 *)(lVar31 + 0x1c + lVar24) = 0;
    *(ulonglong *)(param_1 + 0x3b8) = uVar27 + 1;
  }
  else {
    uVar34 = *(ulonglong *)(param_1 + 0x3b8);
    if (uVar34 != 0) {
      lVar31 = *(longlong *)(param_1 + 0x3b0);
      iVar18 = *(int *)(param_2 + 0x1c);
      piVar39 = (int *)(lVar31 + 0x34);
      uVar23 = 0;
LAB_145b86f20:
      if (piVar39[-8] != iVar18) goto code_r0x000145b86f2a;
      uVar27 = uVar23 + 1;
      uVar44 = uVar23;
      if (uVar27 < uVar34) {
        if (((int)uVar34 + (int)uVar23 & 1U) == 0) {
          if (*piVar39 != iVar18) {
            piVar39[-9] = piVar39[-1];
            piVar39[-8] = *piVar39;
            piVar39[-7] = piVar39[1];
            piVar39[-6] = piVar39[2];
            *(undefined1 (*) [16])(piVar39 + -0xd) = *(undefined1 (*) [16])(piVar39 + -5);
            uVar44 = uVar23 + 1;
          }
          uVar27 = uVar23 + 2;
        }
        if (uVar34 - 2 != uVar23) {
          lVar24 = uVar34 - uVar27;
          piVar39 = (int *)(uVar27 * 0x20 + lVar31 + 0x34);
          do {
            if (piVar39[-8] == iVar18) {
              iVar19 = *piVar39;
            }
            else {
              auVar7 = *(undefined1 (*) [16])(piVar39 + -0xd);
              iVar19 = piVar39[-8];
              iVar11 = piVar39[-7];
              iVar12 = piVar39[-6];
              piVar4 = (int *)(lVar31 + 0x10 + uVar44 * 0x20);
              *piVar4 = piVar39[-9];
              piVar4[1] = iVar19;
              piVar4[2] = iVar11;
              piVar4[3] = iVar12;
              *(undefined1 (*) [16])(lVar31 + uVar44 * 0x20) = auVar7;
              uVar44 = uVar44 + 1;
              iVar19 = *piVar39;
            }
            if (iVar19 != iVar18) {
              auVar7 = *(undefined1 (*) [16])(piVar39 + -5);
              iVar19 = *piVar39;
              iVar11 = piVar39[1];
              iVar12 = piVar39[2];
              piVar4 = (int *)(lVar31 + 0x10 + uVar44 * 0x20);
              *piVar4 = piVar39[-1];
              piVar4[1] = iVar19;
              piVar4[2] = iVar11;
              piVar4[3] = iVar12;
              *(undefined1 (*) [16])(lVar31 + uVar44 * 0x20) = auVar7;
              uVar44 = uVar44 + 1;
            }
            piVar39 = piVar39 + 0x10;
            lVar24 = lVar24 + -2;
          } while (lVar24 != 0);
        }
      }
      *(ulonglong *)(param_1 + 0x3b8) = uVar44;
      uVar34 = uVar44;
      goto LAB_145b87125;
    }
    iVar18 = *(int *)(param_2 + 0x1c);
    uVar34 = 0;
LAB_145b87125:
    fVar50 = *(float *)(param_1 + 0xbdc);
    fVar5 = *(float *)(param_2 + 0x24);
    uVar25 = *(undefined8 *)(param_2 + 8);
    if (uVar34 == *(ulonglong *)(param_1 + 0x3a8)) {
      uStack_d0 = 0x145b8714f;
      FUN_145f94930(param_1 + 0x3a8);
    }
    lVar31 = *(longlong *)(param_1 + 0x3b0);
    lVar24 = uVar34 * 0x20;
    *(undefined8 *)(lVar31 + lVar24) = uVar25;
    *(undefined8 *)(lVar31 + 8 + lVar24) = *(undefined8 *)(param_2 + 0x28);
    *(undefined4 *)(lVar31 + 0x10 + lVar24) = *(undefined4 *)(param_2 + 0x30);
    *(int *)(lVar31 + 0x14 + lVar24) = iVar18;
    *(float *)(lVar31 + 0x18 + lVar24) = fVar50 + fVar5;
    *(undefined4 *)(lVar31 + 0x1c + lVar24) = 0;
    *(ulonglong *)(param_1 + 0x3b8) = uVar34 + 1;
    uStack_d0 = 0x145b87195;
    FUN_145b94600(param_1);
  }
  goto LAB_145b871f7;
code_r0x000145b86f2a:
  uVar23 = uVar23 + 1;
  piVar39 = piVar39 + 8;
  if (uVar34 == uVar23) goto LAB_145b87125;
  goto LAB_145b86f20;
code_r0x000145b86e4a:
  uVar23 = uVar23 + 1;
  piVar39 = piVar39 + 8;
  uVar27 = uVar34;
  if (uVar34 == uVar23) goto LAB_145b870b9;
  goto LAB_145b86e40;
LAB_145b86ebe:
  uVar44 = uVar23 + 1;
  uVar27 = uVar23;
  if (uVar44 < uVar34) {
    if (iVar18 == 0x306) {
      lVar24 = ~uVar23 + uVar34;
      pauVar38 = (undefined1 (*) [16])(plVar2 + uVar23 * 4);
      do {
        pauVar37 = pauVar38 + 2;
        if ((*(int *)(pauVar38[3] + 4) != 0x306) || (*(longlong *)*pauVar37 != lVar31)) {
          auVar7 = *pauVar37;
          uVar17 = *(undefined4 *)(pauVar38[3] + 4);
          uVar43 = *(undefined4 *)(pauVar38[3] + 8);
          uVar30 = *(undefined4 *)(pauVar38[3] + 0xc);
          plVar29 = plVar2 + uVar27 * 4 + 2;
          *(undefined4 *)plVar29 = *(undefined4 *)pauVar38[3];
          *(undefined4 *)((longlong)plVar29 + 4) = uVar17;
          *(undefined4 *)(plVar29 + 1) = uVar43;
          *(undefined4 *)((longlong)plVar29 + 0xc) = uVar30;
          *(undefined1 (*) [16])(plVar2 + uVar27 * 4) = auVar7;
          uVar27 = uVar27 + 1;
        }
        lVar24 = lVar24 + -1;
        pauVar38 = pauVar37;
      } while (lVar24 != 0);
    }
    else {
      if (((int)uVar23 - (int)uVar34 & 1U) == 0) {
        if (*(int *)((longlong)plVar2 + uVar44 * 0x20 + 0x14) != iVar18) {
          pauVar38 = (undefined1 (*) [16])(plVar2 + uVar44 * 4);
          auVar7 = *pauVar38;
          uVar17 = *(undefined4 *)(pauVar38[1] + 4);
          uVar43 = *(undefined4 *)(pauVar38[1] + 8);
          uVar30 = *(undefined4 *)(pauVar38[1] + 0xc);
          plVar29 = plVar2 + uVar23 * 4 + 2;
          *(undefined4 *)plVar29 = *(undefined4 *)pauVar38[1];
          *(undefined4 *)((longlong)plVar29 + 4) = uVar17;
          *(undefined4 *)(plVar29 + 1) = uVar43;
          *(undefined4 *)((longlong)plVar29 + 0xc) = uVar30;
          *(undefined1 (*) [16])(plVar2 + uVar23 * 4) = auVar7;
          uVar27 = uVar23 + 1;
        }
        uVar44 = uVar23 + 2;
      }
      if (uVar34 - 2 != uVar23) {
        lVar24 = uVar34 - uVar44;
        piVar39 = (int *)((longlong)plVar2 + uVar44 * 0x20 + 0x34);
        do {
          if (piVar39[-8] == iVar18) {
            iVar19 = *piVar39;
          }
          else {
            auVar7 = *(undefined1 (*) [16])(piVar39 + -0xd);
            iVar19 = piVar39[-8];
            iVar11 = piVar39[-7];
            iVar12 = piVar39[-6];
            plVar29 = plVar2 + uVar27 * 4 + 2;
            *(int *)plVar29 = piVar39[-9];
            *(int *)((longlong)plVar29 + 4) = iVar19;
            *(int *)(plVar29 + 1) = iVar11;
            *(int *)((longlong)plVar29 + 0xc) = iVar12;
            *(undefined1 (*) [16])(plVar2 + uVar27 * 4) = auVar7;
            uVar27 = uVar27 + 1;
            iVar19 = *piVar39;
          }
          if (iVar19 != iVar18) {
            auVar7 = *(undefined1 (*) [16])(piVar39 + -5);
            iVar19 = *piVar39;
            iVar11 = piVar39[1];
            iVar12 = piVar39[2];
            plVar29 = plVar2 + uVar27 * 4 + 2;
            *(int *)plVar29 = piVar39[-1];
            *(int *)((longlong)plVar29 + 4) = iVar19;
            *(int *)(plVar29 + 1) = iVar11;
            *(int *)((longlong)plVar29 + 0xc) = iVar12;
            *(undefined1 (*) [16])(plVar2 + uVar27 * 4) = auVar7;
            uVar27 = uVar27 + 1;
          }
          piVar39 = piVar39 + 0x10;
          lVar24 = lVar24 + -2;
        } while (lVar24 != 0);
      }
    }
  }
  *(ulonglong *)(param_1 + 0x3b8) = uVar27;
  uVar34 = uVar27;
LAB_145b8719e:
  fVar50 = *(float *)(param_1 + 0xbdc);
  if (uVar34 == *(ulonglong *)(param_1 + 0x3a8)) {
    uStack_d0 = 0x145b871bc;
    FUN_145f94930(param_1 + 0x3a8);
  }
  lVar24 = *(longlong *)(param_1 + 0x3b0);
  lVar32 = uVar34 * 0x20;
  *(longlong *)(lVar24 + lVar32) = lVar31;
  *(undefined4 *)(lVar24 + 8 + lVar32) = 6;
  *(float *)(lVar24 + 0xc + lVar32) = fVar5;
  *(int *)(lVar24 + 0x14 + lVar32) = iVar18;
  *(float *)(lVar24 + 0x18 + lVar32) = fVar6 + fVar50;
  *(float *)(lVar24 + 0x1c + lVar32) = fVar49;
  *(ulonglong *)(param_1 + 0x3b8) = uVar34 + 1;
LAB_145b871f7:
  uStack_80 = uStack_60;
  uStack_60 = uStack_40;
  uStack_88 = uStack_68;
  uStack_90 = 0xfffffffffffffffe;
  fVar50 = *(float *)(param_1 + 0xbdc);
  uStack_e0 = 0;
  lStack_d8 = 4;
  uStack_d0 = 0;
  lVar24 = *(longlong *)(param_1 + 0x3b0);
  lVar32 = *(longlong *)(param_1 + 0x3b8) * 0x20;
  lVar31 = lVar24 + lVar32;
  lVar46 = lVar24;
  lStack_c8 = param_1;

/* Remote-recipient filter; selected normalized lines 1..95; owner 0x145b244b0. Inferred types/ABI remain uncertain. */

void FUN_145b244b0(short *param_1,longlong param_2,longlong *param_3,longlong param_4)

{
  longlong lVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  longlong *plVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  float fVar7;
  float fVar8;

  if (param_2 == 2 && param_1 != (short *)0x0) {
    if (*param_1 == 0x6e65) {
      uVar4 = 1;
      param_1 = (short *)0x0;
    }
    else {
      uVar4 = 1;
      if (*param_1 == 0x6c70) {
        param_1 = (short *)0x1;
      }
      else if (*param_1 == 0x7363) {
        param_1 = (short *)0x2;
      }
      else if (*param_1 == 0x6564) {
        param_1 = (short *)0x3;
      }
      else if (*param_1 == 0x7470) {
        param_1 = (short *)&DAT_00000004;
      }
      else if (*param_1 == 0x7365) {
        param_1 = (short *)0x5;
      }
      else if (*param_1 == 0x7266) {
        param_1 = (short *)0x6;
      }
      else if (*param_1 == 0x6f72) {
        param_1 = (short *)0x7;
      }
      else if (*param_1 == 0x7274) {
        param_1 = (short *)&DAT_00000008;
      }
      else if (*param_1 == 0x7572) {
        param_1 = (short *)0x9;
      }
      else if (*param_1 == 0x6b75) {
        param_1 = (short *)0xa;
      }
      else if (*param_1 == 0x687a) {
        param_1 = (short *)0xb;
      }
      else if (*param_1 == 0x616a) {
        param_1 = (short *)&DAT_0000000c;
      }
      else {
        uVar4 = (ulonglong)(*param_1 == 0x6f6b);
        param_1 = (short *)0xd;
      }
    }
  }
  else {
    uVar4 = 0;
  }
  lVar1 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)_tls_index * 8);
  uVar2 = *(undefined8 *)(lVar1 + 0x368);
  uVar3 = *(undefined8 *)(lVar1 + 0x370);
  *(ulonglong *)(lVar1 + 0x368) = uVar4;
  *(short **)(lVar1 + 0x370) = param_1;
  if (*(char *)(param_4 + 0xc8a) == '\x01') {
    lVar6 = *(longlong *)(*param_3 + 0x10);
    if (lVar6 != 0) {
      plVar5 = *(longlong **)(*param_3 + 8);
      lVar6 = lVar6 * 0x38;
      do {
        if (*plVar5 != *(longlong *)(param_4 + 0xb80)) {
          fVar7 = (float)plVar5[2] - (float)*(undefined8 *)(param_4 + 0x4f0);
          fVar8 = (float)((ulonglong)plVar5[2] >> 0x20) -
                  (float)((ulonglong)*(undefined8 *)(param_4 + 0x4f0) >> 0x20);
          if (fVar8 * fVar8 + fVar7 * fVar7 <= 900.0) {
            FUN_145b86da0(param_4,plVar5);
          }
        }
        plVar5 = plVar5 + 7;
        lVar6 = lVar6 + -0x38;
      } while (lVar6 != 0);
    }
  }
  *(undefined8 *)(lVar1 + 0x368) = uVar2;
  *(undefined8 *)(lVar1 + 0x370) = uVar3;
  return;
}
