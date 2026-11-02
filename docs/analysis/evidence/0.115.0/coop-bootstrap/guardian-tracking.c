void FUN_145981fe0(char *param_1)

{
  float *pfVar1;
  longlong lVar2;
  undefined4 *puVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  undefined1 uVar10;
  char cVar11;
  ushort uVar12;
  uint uVar13;
  int iVar14;
  code *pcVar15;
  longlong lVar16;
  ulonglong uVar17;
  undefined8 *puVar18;
  undefined8 uVar19;
  undefined *puVar20;
  char *pcVar21;
  longlong lVar22;
  float *pfVar23;
  ulonglong uVar24;
  undefined8 uVar25;
  undefined *puVar26;
  ulonglong uVar27;
  longlong lVar28;
  longlong lVar29;
  longlong *plVar30;
  ulonglong uVar31;
  ulonglong uVar32;
  ulonglong uVar33;
  ulonglong uVar34;
  ulonglong uVar35;
  longlong *plVar36;
  ulonglong uVar37;
  longlong lVar38;
  undefined4 uVar39;
  float fVar40;
  undefined1 auVar41 [16];
  float fVar43;
  undefined1 auVar42 [16];
  float fVar44;
  float fVar45;
  float fVar46;
  float fVar47;
  undefined8 in_stack_fffffffffffffc98;
  undefined4 uVar48;
  undefined8 uStack_338;
  undefined8 uStack_330;
  undefined8 uStack_328;
  undefined8 uStack_320;
  ulonglong uStack_2e0;
  undefined *puStack_2d8;
  ulonglong uStack_2d0;
  undefined *puStack_2c8;
  ulonglong uStack_2c0;
  undefined *puStack_2b8;
  ulonglong uStack_2b0;
  ulonglong uStack_2a8;
  undefined8 uStack_2a0;
  undefined8 uStack_298;
  undefined1 uStack_290;
  undefined4 uStack_288;
  undefined4 uStack_280;
  undefined4 uStack_278;
  undefined4 uStack_268;
  ulonglong uStack_248;
  undefined8 uStack_240;
  longlong lStack_238;
  undefined4 uStack_230;
  undefined4 uStack_22c;
  undefined4 uStack_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined4 uStack_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 uStack_20c;
  undefined4 uStack_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 uStack_1f0;
  undefined4 uStack_1ec;
  undefined4 uStack_1e8;
  undefined4 uStack_1e4;
  undefined8 uStack_1e0;
  undefined4 uStack_1d8;
  undefined4 uStack_1d4;
  undefined4 uStack_1d0;
  float fStack_1cc;
  float fStack_1c8;
  float fStack_1c4;
  float fStack_1c0;
  undefined8 uStack_1bc;
  undefined4 uStack_1b4;
  undefined8 uStack_1b0;
  undefined4 uStack_1a8;
  ulonglong uStack_1a4;
  uint uStack_19c;
  float fStack_198;
  undefined4 uStack_194;
  undefined4 uStack_190;
  undefined4 uStack_18c;
  undefined4 uStack_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  float fStack_174;
  undefined4 uStack_170;
  undefined4 uStack_16c;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined1 uStack_160;
  longlong lStack_158;
  undefined8 uStack_150;
  float fStack_144;
  ulonglong uStack_140;
  undefined8 uStack_138;
  undefined4 uStack_130;
  longlong lStack_128;
  code *pcStack_120;
  undefined8 uStack_110;
  undefined4 uStack_108;
  undefined4 uStack_104;
  code *pcStack_100;
  undefined1 uStack_f1;
  undefined8 uStack_f0;

  uStack_f0 = 0xfffffffffffffffe;
  if (param_1[0xc3c] == '\0') {
    uVar33 = *(ulonglong *)(param_1 + 0x688);
    if (uVar33 == 0) {
      uVar33 = 0;
    }
    else {
      uVar27 = 0;
      uStack_140 = uVar33;
      do {
        uVar48 = (undefined4)((ulonglong)in_stack_fffffffffffffc98 >> 0x20);
        if (*(ulonglong *)(param_1 + 0x688) <= uVar27) {
          FUN_145eb7363(uVar27,*(ulonglong *)(param_1 + 0x688),&DAT_147332600);
                    /* WARNING: Does not return */
          pcVar15 = (code *)invalidInstructionException();
          (*pcVar15)();
        }
        if ((*(longlong *)(*(longlong *)(param_1 + 0x680) + uVar27 * 0x28) == 0) &&
           (lVar22 = *(longlong *)(param_1 + 0x680) + uVar27 * 0x28,
           *(float *)(lVar22 + 0x24) <= *(float *)(param_1 + 0xb9c))) {
          lVar16 = FUN_1458095e0(*(undefined8 *)(param_1 + 0x2a8),*(undefined8 *)(param_1 + 0x2b0));
          uStack_130 = *(undefined4 *)(lVar22 + 0x20);
          uStack_138 = *(undefined8 *)(lVar22 + 0x18);
          uVar32 = *(ulonglong *)(lVar22 + 0x10);
          if (*(ulonglong *)(&DAT_146cc0d88 + lVar16 * 0xf0) <= uVar32) {
            FUN_145eb7363(uVar32,*(ulonglong *)(&DAT_146cc0d88 + lVar16 * 0xf0),&DAT_147332740);
                    /* WARNING: Does not return */
            pcVar15 = (code *)invalidInstructionException();
            (*pcVar15)();
          }
          lVar22 = *(longlong *)(&DAT_146cc0d80 + lVar16 * 0xf0);
          lVar16 = uVar32 * 0x50;
          pcStack_100 = (code *)(lVar22 + lVar16);
          uVar39 = FUN_145983510(param_1,uVar32);
          uStack_104 = FUN_1459839d0(param_1,uVar32);
          fVar47 = *(float *)(lVar22 + 0x28 + lVar16) * 1.35;
          uVar13 = *(uint *)(lVar22 + 0x20 + lVar16);
          iVar14 = *(int *)(param_1 + 0xbc8);
          *(uint *)(param_1 + 0xbc8) = iVar14 + 1U;
          uVar37 = (ulonglong)(iVar14 + 1U & 0xffffff) | (ulonglong)(uVar13 & 0xffffff) << 0x18 |
                   0xf130000000000000;
          in_stack_fffffffffffffc98 = CONCAT44(uVar48,fVar47);
          uStack_108 = uVar39;
          FUN_14594d100(param_1,uVar37,uVar13,*(undefined4 *)(lVar22 + 0x24 + lVar16),
                        in_stack_fffffffffffffc98,uVar39,1,&uStack_138);
          uVar13 = *(uint *)(param_1 + 0xb9c);
          fStack_144 = *(float *)(lVar22 + 0x38 + lVar16);
          fVar40 = *(float *)(lVar22 + 0x3c + lVar16);
          uVar10 = *(undefined1 *)(lVar22 + 0x4c + lVar16);
          uVar12 = *(ushort *)(param_1 + 0x2ce);
          uVar32 = *(ulonglong *)(param_1 + 0xae8);
          uVar31 = *(ulonglong *)(param_1 + 0xb00);
          uVar24 = *(ulonglong *)(param_1 + 0xaf0);
          uVar17 = *(ulonglong *)(param_1 + 0xaf8);
          do {
            lVar22 = ((uVar32 + uVar31) * 0x800000 | uVar32 + uVar31 >> 0x29) + uVar32;
            uVar34 = uVar24 << 0x11;
            uVar17 = uVar17 ^ uVar32;
            uVar31 = uVar31 ^ uVar24;
            uVar24 = uVar24 ^ uVar17;
            uVar32 = uVar32 ^ uVar31;
            uVar31 = uVar31 << 0x2d | uVar31 >> 0x13;
            uVar17 = uVar17 ^ uVar34;
            fVar44 = ((float)((uint)((ulonglong)lVar22 >> 0x29) | 0x3f800000) + -1.0) * 6.2831855;
          } while (6.2831855 <= fVar44);
          *(ulonglong *)(param_1 + 0xae8) = uVar32;
          *(ulonglong *)(param_1 + 0xb00) = uVar31;
          *(ulonglong *)(param_1 + 0xaf0) = uVar24;
          *(ulonglong *)(param_1 + 0xaf8) = uVar17;
          uVar48 = *(undefined4 *)((longlong)pcStack_100 + 0x20);
          do {
            uVar34 = ((uVar32 + uVar31) * 0x800000 | uVar32 + uVar31 >> 0x29) + uVar32;
            uVar35 = uVar24 << 0x11;
            uVar17 = uVar17 ^ uVar32;
            uVar31 = uVar31 ^ uVar24;
            uVar24 = uVar24 ^ uVar17;
            uVar32 = uVar32 ^ uVar31;
            uVar17 = uVar17 ^ uVar35;
            uVar31 = uVar31 << 0x2d | uVar31 >> 0x13;
          } while ((uVar34 >> 0x39 & 1) != 0);
          fVar45 = fStack_144 * 0.5;
          fVar46 = fVar47 * 1.2 + 2.2;
          *(ulonglong *)(param_1 + 0xae8) = uVar32;
          *(ulonglong *)(param_1 + 0xb00) = uVar31;
          *(ulonglong *)(param_1 + 0xaf0) = uVar24;
          *(ulonglong *)(param_1 + 0xaf8) = uVar17;
          puVar18 = (undefined8 *)FUN_145809730(uVar48);
          uStack_f1 = uVar10;
          if (puVar18 == (undefined8 *)0x0) {
            uVar19 = FUN_145809730(*(undefined4 *)((longlong)pcStack_100 + 0x20));
            uVar32 = 3;
            puVar26 = &DAT_146ccca90;
LAB_145982466:
            uStack_110 = uVar19;
            FUN_140002200();
            puVar20 = (undefined *)thunk_FUN_145cbdd70(uVar32 * 4,4);
            if (puVar20 == (undefined *)0x0) {
              FUN_145eb6fcb(4,uVar32 * 4);
                    /* WARNING: Does not return */
              pcVar15 = (code *)invalidInstructionException();
              (*pcVar15)();
            }
            uStack_2a0 = uStack_110;
            uVar33 = uStack_140;
            if (uVar32 < 8) {
              uVar31 = 0;
            }
            else {
              pfVar23 = (float *)(puVar26 + 0x30);
              if ((puVar20 < puVar26 + uVar32 * 0x38 + -4) && (pfVar23 < puVar20 + uVar32 * 4)) {
                uVar31 = 0;
              }
              else {
                uVar31 = uVar32 & 0xfffffffffffffff8;
                uVar24 = 0;
                do {
                  fVar43 = pfVar23[0xe];
                  fVar4 = pfVar23[0x1c];
                  fVar5 = pfVar23[0x2a];
                  fVar6 = pfVar23[0x62];
                  fVar7 = pfVar23[0x54];
                  fVar8 = pfVar23[0x46];
                  fVar9 = pfVar23[0x38];
                  pfVar1 = (float *)(puVar20 + uVar24 * 4);
                  *pfVar1 = *pfVar23 * 0.5;
                  pfVar1[1] = fVar43 * 0.5;
                  pfVar1[2] = fVar4 * 0.5;
                  pfVar1[3] = fVar5 * 0.5;
                  pfVar1 = (float *)(puVar20 + uVar24 * 4 + 0x10);
                  *pfVar1 = fVar9 * 0.5;
                  pfVar1[1] = fVar8 * 0.5;
                  pfVar1[2] = fVar7 * 0.5;
                  pfVar1[3] = fVar6 * 0.5;
                  uVar24 = uVar24 + 8;
                  pfVar23 = pfVar23 + 0x70;
                } while (uVar31 != uVar24);
                if (uVar32 == uVar31) goto LAB_145982638;
              }
            }
            uVar17 = uVar32 & 3;
            uVar24 = uVar31;
            if (uVar17 != 0) {
              lVar22 = 0;
              do {
                *(float *)(puVar20 + uVar24 * 4) =
                     *(float *)(puVar26 + lVar22 * 4 + uVar31 * 0x38 + 0x30) * 0.5;
                uVar24 = uVar24 + 1;
                lVar22 = lVar22 + 0xe;
              } while ((ulonglong)(uint)((int)uVar17 << 4) + uVar17 * -2 != lVar22);
            }
            if (uVar31 - uVar32 < 0xfffffffffffffffd) {
              pfVar23 = (float *)(puVar26 + uVar24 * 0x38 + 0xd8);
              do {
                *(float *)(puVar20 + uVar24 * 4) = pfVar23[-0x2a] * 0.5;
                *(float *)(puVar20 + uVar24 * 4 + 4) = pfVar23[-0x1c] * 0.5;
                *(float *)(puVar20 + uVar24 * 4 + 8) = pfVar23[-0xe] * 0.5;
                *(float *)(puVar20 + uVar24 * 4 + 0xc) = *pfVar23 * 0.5;
                uVar24 = uVar24 + 4;
                pfVar23 = pfVar23 + 0x38;
              } while (uVar32 != uVar24);
            }
          }
          else {
            uVar32 = puVar18[3];
            if (uVar32 != 0) {
              uVar31 = uVar32 + 1;
              if (uVar31 == 0) {
                FUN_145eb7660(&DAT_146cccb68);
                    /* WARNING: Does not return */
                pcVar15 = (code *)invalidInstructionException();
                (*pcVar15)();
              }
              uVar34 = uVar34 >> 0x3a;
              if (uVar31 <= uVar34) {
                uVar34 = uVar34 % (uVar31 & 0xffffffff);
              }
              if (uVar34 != 0) {
                uVar34 = uVar34 - 1;
                if (uVar32 <= uVar34) {
                  FUN_145eb7363(uVar34,uVar32,&DAT_146cccb80);
                    /* WARNING: Does not return */
                  pcVar15 = (code *)invalidInstructionException();
                  (*pcVar15)();
                }
                puVar18 = (undefined8 *)(uVar34 * 0x10 + puVar18[2]);
              }
            }
            puVar26 = (undefined *)*puVar18;
            uVar32 = puVar18[1];
            uVar19 = FUN_145809730(*(undefined4 *)((longlong)pcStack_100 + 0x20));
            if (uVar32 != 0) goto LAB_145982466;
            puVar20 = (undefined *)0x4;
            uVar32 = 0;
            uStack_2a0 = uVar19;
          }
LAB_145982638:
          fStack_1cc = fVar40 * ((float)uVar12 / 100.0);
          fStack_174 = fVar44 + 0.0;
          uStack_290 = 0;
          uStack_298 = 0;
          uStack_338 = (longlong *)0x0;
          uStack_330 = (undefined *)0x8;
          uStack_328 = 0;
          uStack_320 = 0xffffffffffffffff;
          uStack_288 = 0;
          uStack_280 = 0;
          uStack_278 = 0;
          uStack_268 = 0xffffffff;
          uStack_240 = 0;
          lStack_238 = (longlong)pcStack_100;
          uStack_1f0 = 0;
          uStack_1ec = 0;
          uStack_1e8 = 0;
          uStack_1e4 = 0;
          uStack_200 = 0;
          uStack_1fc = 0;
          uStack_1f8 = 0;
          uStack_1f4 = 0;
          uStack_210 = 0;
          uStack_20c = 0;
          uStack_208 = 0;
          uStack_204 = 0;
          uStack_220 = 0;
          uStack_21c = 0;
          uStack_218 = 0;
          uStack_214 = 0;
          uStack_230 = 0;
          uStack_22c = 0;
          uStack_228 = 0;
          uStack_224 = 0;
          uStack_1e0 = 0;
          uStack_1d8 = uStack_108;
          uStack_1d4 = uStack_108;
          uStack_1d0 = uStack_104;
          fStack_1c8 = fStack_144;
          uStack_1b4 = uStack_130;
          uStack_1bc = uStack_138;
          uStack_1a8 = uStack_130;
          uStack_1b0 = uStack_138;
          uStack_1a4 = (ulonglong)uVar13;
          uStack_184 = 0;
          uStack_180 = 0;
          uStack_17c = 0;
          uStack_178 = 0;
          uStack_194 = 0;
          uStack_190 = 0;
          uStack_18c = 0;
          uStack_188 = 0;
          uStack_170 = 0;
          uStack_16c = 0;
          uStack_168 = 0;
          uStack_164 = 0;
          uStack_160 = uStack_f1;
          lVar22 = *(longlong *)(param_1 + 0x580);
          uStack_2e0 = uVar32;
          puStack_2d8 = puVar20;
          uStack_2d0 = uVar32;
          puStack_2c8 = puVar26;
          uStack_2c0 = uVar32;
          puStack_2b8 = puVar26;
          uStack_2b0 = uVar32;
          uStack_2a8 = uVar27;
          uStack_248 = uVar37;
          fStack_1c4 = fVar46;
          fStack_1c0 = fVar47;
          uStack_19c = uVar13;
          fStack_198 = fVar45;
          if (lVar22 == *(longlong *)(param_1 + 0x570)) {
            FUN_145e98470(param_1 + 0x570);
          }
          memcpy((void *)(lVar22 * 0x1e0 + *(longlong *)(param_1 + 0x578)),&uStack_338,0x1e0);
          *(longlong *)(param_1 + 0x580) = lVar22 + 1;
          if (*(ulonglong *)(param_1 + 0x688) <= uVar27) {
            FUN_145eb7363(uVar27,*(ulonglong *)(param_1 + 0x688),&DAT_147332758);
                    /* WARNING: Does not return */
            pcVar15 = (code *)invalidInstructionException();
            (*pcVar15)();
          }
          lVar22 = *(longlong *)(param_1 + 0x680);
          *(undefined8 *)(lVar22 + uVar27 * 0x28) = 1;
          *(ulonglong *)(lVar22 + 8 + uVar27 * 0x28) = uVar37;
          param_1[0] = '\0';
          param_1[1] = '\0';
          param_1[2] = '\0';
          param_1[3] = '\0';
          param_1[4] = '\0';
          param_1[5] = '\0';
          param_1[6] = '\0';
          param_1[7] = '\0';
          if (21.0 < *(float *)(param_1 + 0xb9c)) {
            lVar22 = FUN_1458095e0(*(undefined8 *)(param_1 + 0x2a8),*(undefined8 *)(param_1 + 0x2b0)
                                  );
            if (*(ulonglong *)(param_1 + 0x688) <= uVar27) {
              FUN_145eb7363(uVar27,*(ulonglong *)(param_1 + 0x688),&DAT_147332618);
                    /* WARNING: Does not return */
              pcVar15 = (code *)invalidInstructionException();
              (*pcVar15)();
            }
            uVar33 = *(ulonglong *)(*(longlong *)(param_1 + 0x680) + 0x10 + uVar27 * 0x28);
            if (*(ulonglong *)(&DAT_146cc0d88 + lVar22 * 0xf0) <= uVar33) {
              FUN_145eb7363(uVar33,*(ulonglong *)(&DAT_146cc0d88 + lVar22 * 0xf0),&DAT_147332630);
                    /* WARNING: Does not return */
              pcVar15 = (code *)invalidInstructionException();
              (*pcVar15)();
            }
            lVar22 = *(longlong *)(&DAT_146cc0d80 + lVar22 * 0xf0);
            lVar38 = uVar33 * 0x50;
            lStack_128 = lVar22 + lVar38 + 0x20;
            pcStack_120 = FUN_145cf8e00;
            FUN_145ce7350(&uStack_338,&DAT_146cb4e91,&lStack_128);
            lVar16 = *(longlong *)(lVar22 + 0x10 + lVar38);
            uVar19 = *(undefined8 *)(lVar22 + 0x18 + lVar38);
            pcStack_100 = (code *)uStack_330;
            uVar25 = uStack_328;
            lVar22 = FUN_1458dff90(uStack_330,uStack_328);
            if (uStack_338 != (longlong *)0x0) {
              thunk_FUN_145cbddd0(pcStack_100,uStack_338,1);
            }
            if (lVar22 == 0) {
              uVar25 = uVar19;
              lVar22 = lVar16;
            }
            in_stack_fffffffffffffc98 = 0x1d;
            pcVar21 = (char *)FUN_1458dff90("%s claims its lair once more.");
            if (pcVar21 == (char *)0x0) {
              pcVar21 = "%s claims its lair once more.";
              in_stack_fffffffffffffc98 = 0x1d;
            }
            FUN_1459a9360(&uStack_338,lVar22,uVar25,pcVar21,in_stack_fffffffffffffc98);
            lVar22 = *(longlong *)(param_1 + 0x640);
            if (lVar22 == *(longlong *)(param_1 + 0x630)) {
              FUN_145d150f0(param_1 + 0x630);
            }
            lVar16 = *(longlong *)(param_1 + 0x638);
            puVar3 = (undefined4 *)(lVar16 + 0x10 + lVar22 * 0x20);
            *puVar3 = (undefined4)uStack_328;
            puVar3[1] = uStack_328._4_4_;
            puVar3[2] = (undefined4)uStack_320;
            puVar3[3] = uStack_320._4_4_;
            puVar3 = (undefined4 *)(lVar16 + lVar22 * 0x20);
            *puVar3 = (undefined4)uStack_338;
            puVar3[1] = uStack_338._4_4_;
            puVar3[2] = (undefined4)uStack_330;
            puVar3[3] = uStack_330._4_4_;
            *(longlong *)(param_1 + 0x640) = lVar22 + 1;
            uVar33 = uStack_140;
          }
        }
        uVar27 = uVar27 + 1;
      } while (uVar27 != uVar33);
      uVar33 = *(ulonglong *)(param_1 + 0x688);
    }
    fVar40 = (float)*(undefined8 *)(param_1 + 0x4e0);
    fVar47 = (float)((ulonglong)*(undefined8 *)(param_1 + 0x4e0) >> 0x20);
    lVar22 = *(longlong *)(param_1 + 0x680);
    lVar16 = uVar33 * 0x28;
    uVar27 = 0;
    lVar38 = 0;
    do {
      if (lVar16 == lVar38) {
        if (uVar33 == 0) {
          return;
        }
        if (uVar33 == 1) {
          uVar31 = 0;
        }
        else {
          uVar32 = 1;
          lVar28 = lVar22;
          uVar27 = 0;
          lVar38 = lVar22;
          do {
            uVar31 = uVar32;
            lVar29 = lVar38 + 0x28;
            if ((int)((uint)((int)*(uint *)(lVar28 + 0x24) >> 0x1f) >> 1 ^ *(uint *)(lVar28 + 0x24))
                <= (int)((uint)((int)*(uint *)(lVar38 + 0x4c) >> 0x1f) >> 1 ^
                        *(uint *)(lVar38 + 0x4c))) {
              uVar31 = uVar27;
              lVar29 = lVar28;
            }
            lVar2 = (lVar16 - 0x28U >> 3) * 0x3333333333333333 + uVar32;
            uVar32 = uVar32 + 1;
            lVar28 = lVar29;
            uVar27 = uVar31;
            lVar38 = lVar38 + 0x28;
          } while (lVar2 != 0);
        }
        goto LAB_145982a95;
      }
      lVar28 = lVar38 + 0x28;
      uVar27 = uVar27 - 1;
      plVar36 = (longlong *)(lVar22 + lVar38);
      lVar38 = lVar28;
    } while (*plVar36 == 0);
    uVar31 = ~uVar27;
    if (lVar16 - lVar28 != 0) {
      plVar36 = (longlong *)(lVar22 + lVar28);
      plVar30 = (longlong *)(lVar22 + lVar28 + -0x28);
      uVar32 = 0;
      do {
        if ((*plVar36 != 0) &&
           (fVar44 = (float)plVar30[3] - fVar40,
           fVar45 = (float)((ulonglong)plVar30[3] >> 0x20) - fVar47,
           fVar46 = (float)plVar36[3] - fVar40,
           fVar43 = (float)((ulonglong)plVar36[3] >> 0x20) - fVar47,
           auVar41._0_4_ = fVar44 * fVar44 + fVar45 * fVar45,
           auVar41._8_4_ = fVar46 * fVar46 + fVar43 * fVar43, auVar41._4_4_ = auVar41._8_4_,
           auVar41._12_4_ = 0, auVar41 = sqrtps(auVar41,auVar41),
           auVar42._0_4_ = (uint)(auVar41._0_4_ >> 0x1f) >> 1,
           auVar42._4_4_ = (uint)(auVar41._4_4_ >> 0x1f) >> 1,
           auVar42._8_4_ = (uint)(auVar41._8_4_ >> 0x1f) >> 1,
           auVar42._12_4_ = (uint)(auVar41._12_4_ >> 0x1f) >> 1,
           SUB164(auVar42 ^ auVar41,4) < SUB164(auVar42 ^ auVar41,0))) {
          uVar31 = uVar32 - uVar27;
          plVar30 = plVar36;
        }
        uVar32 = uVar32 + 1;
        plVar36 = plVar36 + 5;
      } while ((ulonglong)(lVar16 - lVar28) / 0x28 != uVar32);
    }
LAB_145982a95:
    if (param_1[0xc30] == '\0') {
      param_1[0] = '\x01';
      param_1[1] = '\0';
      param_1[2] = '\0';
      param_1[3] = '\0';
      param_1[4] = '\0';
      param_1[5] = '\0';
      param_1[6] = '\0';
      param_1[7] = '\0';
      *(ulonglong *)(param_1 + 8) = uVar31;
      cVar11 = param_1[0xc31];
      param_1[0xc31] = '\0';
      if (cVar11 != '\0') {
        pcStack_120 = (code *)CONCAT44(pcStack_120._4_4_,*(undefined4 *)(param_1 + 0x4e8));
        lStack_128 = *(longlong *)(param_1 + 0x4e0);
        FUN_1459b0190(&uStack_338,&lStack_128);
        lVar22 = *(longlong *)(param_1 + 0x640);
        if (lVar22 == *(longlong *)(param_1 + 0x630)) {
          FUN_145d150f0(param_1 + 0x630);
        }
        lVar16 = *(longlong *)(param_1 + 0x638);
        puVar18 = (undefined8 *)(lVar16 + 0x10 + lVar22 * 0x20);
        *puVar18 = uStack_328;
        puVar18[1] = uStack_320;
        plVar36 = (longlong *)(lVar16 + lVar22 * 0x20);
        *plVar36 = (longlong)uStack_338;
        plVar36[1] = (longlong)uStack_330;
        *(longlong *)(param_1 + 0x640) = lVar22 + 1;
      }
    }
    else {
      if (*param_1 == '\0') {
        fVar40 = *(float *)(param_1 + 0xb9c);
      }
      else {
        fVar40 = *(float *)(param_1 + 0xb9c);
        if (((*(ulonglong *)(param_1 + 8) == uVar31) && (param_1[0xc31] != '\0')) &&
           (fVar40 - *(float *)(param_1 + 0xbc0) <= 300.0)) {
          return;
        }
      }
      param_1[0] = '\x01';
      param_1[1] = '\0';
      param_1[2] = '\0';
      param_1[3] = '\0';
      param_1[4] = '\0';
      param_1[5] = '\0';
      param_1[6] = '\0';
      param_1[7] = '\0';
      *(ulonglong *)(param_1 + 8) = uVar31;
      *(float *)(param_1 + 0xbc0) = fVar40;
      param_1[0xc31] = '\x01';
      if (uVar33 <= uVar31) {
        FUN_145eb7363(uVar31,uVar33,&DAT_1473325b0);
                    /* WARNING: Does not return */
        pcVar15 = (code *)invalidInstructionException();
        (*pcVar15)();
      }
      lVar16 = FUN_1458095e0(*(undefined8 *)(param_1 + 0x2a8),*(undefined8 *)(param_1 + 0x2b0));
      uVar33 = *(ulonglong *)(lVar22 + 0x10 + uVar31 * 0x28);
      if (*(ulonglong *)(&DAT_146cc0d88 + lVar16 * 0xf0) <= uVar33) {
        FUN_145eb7363(uVar33,*(ulonglong *)(&DAT_146cc0d88 + lVar16 * 0xf0),&DAT_1473325c8);
                    /* WARNING: Does not return */
        pcVar15 = (code *)invalidInstructionException();
        (*pcVar15)();
      }
      lVar16 = *(longlong *)(&DAT_146cc0d80 + lVar16 * 0xf0);
      lVar28 = uVar33 * 0x50;
      lStack_128 = lVar16 + lVar28 + 0x20;
      pcStack_120 = FUN_145cf8e00;
      FUN_145ce7350(&uStack_338,&DAT_146cb4e91,&lStack_128);
      lVar38 = *(longlong *)(lVar16 + 0x10 + lVar28);
      uVar19 = *(undefined8 *)(lVar16 + 0x18 + lVar28);
      pcStack_100 = (code *)uStack_330;
      uVar25 = uStack_328;
      lStack_158 = FUN_1458dff90();
      if (uStack_338 != (longlong *)0x0) {
        thunk_FUN_145cbddd0(pcStack_100,uStack_338,1);
      }
      if (lStack_158 == 0) {
        uVar25 = uVar19;
        lStack_158 = lVar38;
      }
      if (*(longlong *)(lVar22 + uVar31 * 0x28) == 0) {
        puVar26 = &DAT_1473325ee;
      }
      else {
        puVar26 = &DAT_1473325e0;
      }
      uStack_338 = &lStack_158;
      uStack_330 = &DAT_1400020c0;
      uStack_150 = uVar25;
      FUN_145ce7350(&lStack_128,puVar26,&uStack_338);
      pcStack_100 = pcStack_120;
      FUN_1459a9a00(&uStack_338);
      lVar22 = *(longlong *)(param_1 + 0x640);
      if (lVar22 == *(longlong *)(param_1 + 0x630)) {
        FUN_145d150f0(param_1 + 0x630);
      }
      lVar16 = *(longlong *)(param_1 + 0x638);
      puVar18 = (undefined8 *)(lVar16 + 0x10 + lVar22 * 0x20);
      *puVar18 = uStack_328;
      puVar18[1] = uStack_320;
      puVar3 = (undefined4 *)(lVar16 + lVar22 * 0x20);
      *puVar3 = (undefined4)uStack_338;
      puVar3[1] = uStack_338._4_4_;
      puVar3[2] = (undefined4)uStack_330;
      puVar3[3] = uStack_330._4_4_;
      *(longlong *)(param_1 + 0x640) = lVar22 + 1;
      if (lStack_128 != 0) {
        thunk_FUN_145cbddd0(pcStack_100,lStack_128,1);
      }
    }
  }
  return;
}
