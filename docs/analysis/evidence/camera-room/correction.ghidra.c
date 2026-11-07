
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
          undefined8 *param_5,long *param_6)

{
  uint uVar1;
  uint *puVar2;
  undefined1 auVar3 [16];
  char cVar4;
  ulong uVar5;
  uint *puVar6;
  int iVar7;
  undefined4 *unaff_RBP;
  long lVar8;
  long lVar9;
  float *pfVar10;
  float *pfVar11;
  long lVar12;
  int iVar13;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float extraout_XMM0_Da_01;
  float extraout_XMM0_Da_02;
  float extraout_XMM0_Da_03;
  float extraout_XMM0_Da_04;
  float extraout_XMM0_Da_05;
  float extraout_XMM0_Da_06;
  float extraout_XMM0_Da_07;
  float extraout_XMM0_Da_08;
  float extraout_XMM0_Da_09;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  undefined4 in_XMM6_Da;
  float fVar20;
  undefined4 in_XMM7_Da;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  float fVar28;
  float fVar29;
  float fVar30;
  float fVar31;
  long *in_stack_00000028;
  undefined8 *in_stack_00000030;
  undefined8 *in_stack_00000038;
  undefined8 *in_stack_00000040;
  undefined4 *in_stack_00000048;
  undefined8 in_stack_00000050;
  long *in_stack_00000058;
  float *in_stack_00000060;
  float local_350;
  float local_34c;
  undefined8 local_348;
  undefined8 uStack_340;
  float *local_338;
  undefined8 **local_330;
  undefined1 *local_328;
  undefined8 ******local_320;
  float local_318;
  undefined8 local_310;
  undefined4 local_304;
  float *local_300;
  float local_2f4 [3];
  float *local_2e8;
  undefined8 local_2e0;
  undefined1 local_2d8;
  undefined8 *local_2d0;
  undefined4 *local_2c8;
  undefined8 *local_2c0;
  undefined8 *local_2b8;
  undefined8 **local_2b0;
  long local_2a8;
  long lStack_2a0;
  long local_298;
  long lStack_290;
  long local_288;
  long lStack_280;
  long local_278;
  long lStack_270;
  long local_268;
  long lStack_260;
  long local_258;
  long lStack_250;
  undefined8 local_248;
  undefined8 uStack_240;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined8 local_228;
  undefined8 uStack_220;
  undefined8 local_218;
  undefined8 local_210;
  undefined8 uStack_208;
  undefined8 local_200;
  undefined8 uStack_1f8;
  undefined4 local_1f0;
  undefined4 uStack_1ec;
  undefined4 uStack_1e8;
  undefined4 uStack_1e4;
  undefined4 local_1e0;
  undefined4 uStack_1dc;
  undefined4 uStack_1d8;
  undefined4 uStack_1d4;
  undefined1 local_1d0 [168];
  long local_128;
  long lStack_120;
  undefined8 local_118;
  int *local_110;
  undefined8 uStack_108;
  undefined8 local_100;
  undefined8 uStack_f8;
  float *local_f0;
  undefined4 local_e8;
  undefined4 local_d8;
  long lVar14;
  
  local_2a8 = *param_3;
  lStack_2a0 = param_3[1];
  local_298 = param_3[2];
  lStack_290 = param_3[3];
  local_110 = (int *)*param_5;
  uStack_108 = param_5[1];
  local_100 = param_5[2];
  uStack_f8 = param_5[3];
  local_288 = *param_6;
  lStack_280 = param_6[1];
  local_278 = param_6[2];
  lStack_270 = param_6[3];
  local_268 = *in_stack_00000028;
  lStack_260 = in_stack_00000028[1];
  local_258 = in_stack_00000028[2];
  lStack_250 = in_stack_00000028[3];
  local_248 = *in_stack_00000030;
  uStack_240 = in_stack_00000030[1];
  local_238 = in_stack_00000030[2];
  uStack_230 = in_stack_00000030[3];
  local_228 = *in_stack_00000038;
  uStack_220 = in_stack_00000038[1];
  local_218 = in_stack_00000038[2];
  local_210 = *in_stack_00000040;
  uStack_208 = in_stack_00000040[1];
  local_200 = in_stack_00000040[2];
  uStack_1f8 = in_stack_00000040[3];
  local_1f0 = *in_stack_00000048;
  uStack_1ec = in_stack_00000048[1];
  uStack_1e8 = in_stack_00000048[2];
  uStack_1e4 = in_stack_00000048[3];
  local_1e0 = in_stack_00000048[4];
  uStack_1dc = in_stack_00000048[5];
  uStack_1d8 = in_stack_00000048[6];
  uStack_1d4 = in_stack_00000048[7];
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  func_0x000145bfa0e7(in_stack_00000030,in_stack_00000058,in_stack_00000050,local_1d0,0xa8);
  local_128 = *in_stack_00000058;
  lStack_120 = in_stack_00000058[1];
  local_f0 = in_stack_00000060;
  puVar2 = *(uint **)(local_128 + 0xf8);
  lVar8 = *(long *)(local_128 + 0x100) * 4;
  puVar6 = puVar2;
  if (*(char *)(local_128 + 0x108) == '\0') {
    do {
      if (lVar8 == 0) goto LAB_14098845e;
      uVar1 = *puVar6;
      puVar6 = puVar6 + 1;
      lVar14 = *(long *)(*(long *)(lStack_120 + 0x108) + 0x58 + (ulong)uVar1 * 0xa0);
      lVar8 = lVar8 + -4;
    } while (lVar14 == 0);
    lVar9 = *(long *)(lStack_120 + 0x108) + (ulong)uVar1 * 0xa0;
    uVar5 = (ulong)*(uint *)(lVar9 + 0x94);
    lVar8 = *(long *)(*(long *)(lStack_120 + 0x1a8) + 0x18 + uVar5 * 0x48);
    lVar12 = ~*(ulong *)(*(long *)(*(long *)(lStack_120 + 0x1a8) + 0x38 + uVar5 * 0x48) +
                        *(long *)(local_128 + 0x110) * 8) * 0x30;
    uVar5 = (ulong)~*(uint *)(*(long *)(lVar9 + 0x50) + 8);
    pfVar10 = (float *)(uVar5 * 0x30 + *(long *)(lVar8 + 0x10 + lVar12));
    unaff_RBP = (undefined4 *)(uVar5 * 4 + *(long *)(lVar8 + 0x28 + lVar12));
  }
  else {
    do {
      if (lVar8 == 0) goto LAB_14098845e;
      uVar1 = *puVar6;
      puVar6 = puVar6 + 1;
      lVar14 = *(long *)(*(long *)(lStack_120 + 0x1a8) + 0x10 + (ulong)uVar1 * 0x48);
      lVar8 = lVar8 + -4;
    } while (lVar14 == 0);
    lVar8 = *(long *)(lStack_120 + 0x1a8) + (ulong)uVar1 * 0x48;
    lVar9 = *(long *)(lVar8 + 0x18);
    lVar8 = ~*(ulong *)(*(long *)(lVar8 + 0x38) + *(long *)(local_128 + 0x110) * 8) * 0x30;
    pfVar10 = *(float **)(lVar9 + 0x10 + lVar8);
    unaff_RBP = *(undefined4 **)(lVar9 + 0x28 + lVar8);
  }
  iVar13 = (int)lVar14;
  iVar7 = 1;
LAB_140988465:
  local_118._4_4_ = (undefined4)((ulong)in_stack_00000058[2] >> 0x20);
  local_304 = local_118._4_4_;
  if (*(char *)(local_128 + 0x108) == '\0') {
    if (iVar7 == iVar13) {
      do {
        if (puVar6 == puVar2 + *(long *)(local_128 + 0x100)) goto LAB_140988508;
        uVar1 = *puVar6;
        puVar6 = puVar6 + 1;
      } while (*(long *)(*(long *)(lStack_120 + 0x108) + 0x58 + (ulong)uVar1 * 0xa0) == 0);
    }
  }
  else if (iVar7 == iVar13) {
    do {
      if (puVar6 == puVar2 + *(long *)(local_128 + 0x100)) {
LAB_140988508:
        if (pfVar10 == (float *)0x0) {
          return;
        }
        local_2c0 = &local_248;
        local_2b8 = &local_228;
        local_2d0 = &local_210;
        local_2c8 = &local_1f0;
        fVar29 = *(float *)(local_2a8 + 0x58);
        fVar28 = *(float *)(local_268 + 0x4c) * _DAT_145d9d440;
        fVar24 = (float)*(undefined8 *)(local_288 + 0x70) + fVar28;
        fVar25 = (float)((ulong)*(undefined8 *)(local_288 + 0x70) >> 0x20) +
                 *(float *)(local_268 + 0x4c) * fRam0000000145d9d444;
        fVar28 = fVar28 + *(float *)(local_288 + 0x78);
        local_348 = (undefined8 *******)CONCAT44(fVar25,fVar24);
        auVar26._0_4_ = (float)*(undefined8 *)(pfVar10 + 4) - fVar24;
        auVar26._4_4_ = (float)((ulong)*(undefined8 *)(pfVar10 + 4) >> 0x20) - fVar25;
        auVar26._8_4_ = 0.0 - (fRam0000000145d9d448 * 0.0 + 0.0);
        auVar26._12_4_ = 0.0 - (fRam0000000145d9d44c * 0.0 + 0.0);
        local_2f4[2] = pfVar10[6] - fVar28;
        fVar23 = SQRT(auVar26._4_4_ * auVar26._4_4_ + auVar26._0_4_ * auVar26._0_4_ +
                      local_2f4[2] * local_2f4[2]);
        local_2f4[1] = 0.0;
        local_2b0 = &local_2d0;
        if ((((local_110 != (int *)0x0) && (*local_110 == 0xbd)) && (_DAT_145dd4d08 <= fVar23)) &&
           (_DAT_145de4d54 < SQRT(auVar26._0_4_ * auVar26._0_4_ + local_2f4[2] * local_2f4[2]))) {
          local_310 = CONCAT44(uStack_1ec,local_1f0);
          uStack_340 = (float **)CONCAT44(uStack_340._4_4_,fVar28);
          auVar27 = auVar26;
          local_350 = fVar23;
          local_320 = local_348;
          local_318 = fVar28;
          local_2f4[0] = auVar26._0_4_;
          local_118 = in_stack_00000058[2];
          func_0x0001417080b0(pfVar10,local_248,local_310,local_210,&local_348);
          cVar4 = func_0x000140946c80();
          if (cVar4 != '\0') {
            pfVar11 = pfVar10;
            fVar23 = (float)func_0x000145bfa17d(auVar26._4_4_ / fVar23);
            local_300 = local_2f4;
            auVar26._4_4_ = 0.0;
            local_34c = fVar23;
            if (fVar23 < _DAT_145ed0830) {
              uStack_340 = (float **)CONCAT44(uStack_340._4_4_,pfVar10[6]);
              local_348 = *(undefined8 ********)(pfVar10 + 4);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              if (cVar4 == '\0') {
                uStack_340 = &local_300;
                local_338 = &local_350;
                local_330 = &local_2c0;
                local_328 = local_1d0;
                local_2e0 = 0xa00000001;
                local_2d8 = 0;
                local_2e8 = &local_34c;
                local_348 = &local_320;
                uVar5 = func_0x0001409311b0();
                auVar26._4_4_ = extraout_XMM0_Da;
                fVar23 = local_34c;
                if (((((uVar5 & 1) == 0) &&
                     (uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_00,
                     fVar23 = local_34c, (uVar5 & 1) == 0)) &&
                    ((uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_01,
                     fVar23 = local_34c, (uVar5 & 1) == 0 &&
                     ((uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_02,
                      fVar23 = local_34c, (uVar5 & 1) == 0 &&
                      (uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_03,
                      fVar23 = local_34c, (uVar5 & 1) == 0)))))) &&
                   ((uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_04,
                    fVar23 = local_34c, (uVar5 & 1) == 0 &&
                    ((((uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_05,
                       fVar23 = local_34c, (uVar5 & 1) == 0 &&
                       (uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_06,
                       fVar23 = local_34c, (uVar5 & 1) == 0)) &&
                      (uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_07,
                      fVar23 = local_34c, (uVar5 & 1) == 0)) &&
                     (uVar5 = func_0x0001409311b0(), auVar26._4_4_ = extraout_XMM0_Da_09,
                     fVar23 = local_34c, (uVar5 & 1) == 0)))))) {
                  auVar26._4_4_ = _DAT_145ed0830 - local_34c;
                }
              }
            }
            fVar20 = *in_stack_00000060;
            fVar21 = auVar26._4_4_ - fVar20;
            auVar26._4_4_ =
                 (float)func_0x000145bfa135(fVar29 * *(float *)((ulong)(fVar20 < auVar26._4_4_) * 4
                                                               + 0x145ed0c68));
            fVar29 = _DAT_145d9d2a0;
            fVar20 = (_DAT_145d9d2a0 - auVar26._4_4_) * fVar21 + fVar20;
            *in_stack_00000060 = fVar20;
            if (fVar20 < _DAT_145ed0c24) {
              uStack_340 = (float **)CONCAT44(uStack_340._4_4_,pfVar11[6]);
              local_348 = *(undefined8 ********)(pfVar11 + 4);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              fVar23 = local_34c;
              if (cVar4 != '\0') {
                return;
              }
            }
            auVar26._4_4_ = fVar23;
            if (fVar23 <= _DAT_145ed0830) {
              auVar26._4_4_ = _DAT_145ed0830;
            }
            fVar21 = fVar20 + fVar23;
            if (auVar26._4_4_ <= fVar20 + fVar23) {
              fVar21 = auVar26._4_4_;
            }
            auVar26._4_4_ = local_300[2];
            fVar30 = auVar26._4_4_ * auVar26._4_4_;
            pfVar10 = local_300;
            fVar23 = (float)func_0x000145bfa11d(fVar21);
            fVar20 = (float)*(undefined8 *)pfVar10;
            fVar22 = (float)((ulong)*(undefined8 *)pfVar10 >> 0x20);
            fVar29 = fVar29 / SQRT(fVar22 * fVar22 + fVar20 * fVar20 + fVar30);
            fVar20 = fVar23 * fVar29 * fVar20;
            fVar22 = fVar23 * fVar29 * fVar22;
            fVar23 = fVar29 * auVar26._4_4_ * fVar23;
            fVar29 = (float)func_0x000145bfa117(fVar21);
            fVar20 = fVar20 + fVar29 * _DAT_145d9d440;
            fVar22 = fVar22 + fVar29 * fRam0000000145d9d444;
            fVar23 = fVar29 * _DAT_145d9d440 + fVar23;
            local_2e8 = (float *)CONCAT44(fVar22,fVar20);
            local_2e0 = CONCAT44(local_2e0._4_4_,fVar23);
            local_348 = (undefined8 *******)local_320;
            uStack_340._0_4_ = local_318;
            uVar5 = func_0x0001415c70f0();
            fVar29 = local_350;
            if ((uVar5 & 1) != 0) {
              fVar29 = extraout_XMM0_Da_08;
              if (local_350 <= extraout_XMM0_Da_08) {
                fVar29 = local_350;
              }
              fVar29 = (float)(~-(uint)NAN(fVar29) & (uint)fVar29 |
                              (uint)extraout_XMM0_Da_08 & -(uint)NAN(fVar29));
            }
            auVar26._4_4_ = fVar29 * fVar20 + fVar24;
            fVar21 = fVar29 * fVar22 + fVar25;
            fVar30 = fVar23 * fVar29 + fVar28;
            local_348 = (undefined8 *******)CONCAT44(fVar21,auVar26._4_4_);
            uStack_340._0_4_ = fVar30;
            func_0x0001417080b0();
            cVar4 = func_0x000140946c80();
            if (cVar4 == '\0') {
              fVar21 = 0.0;
              fVar31 = (fVar29 + 0.0) * _DAT_145d9d2a4;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              fVar30 = _DAT_145d9d2a4;
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              auVar26._4_4_ = fVar31;
              if (cVar4 == '\0') {
                auVar26._4_4_ = fVar21;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + auVar26._4_4_) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              fVar21 = fVar31;
              if (cVar4 == '\0') {
                fVar21 = auVar26._4_4_;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + fVar21) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              auVar26._4_4_ = fVar31;
              if (cVar4 == '\0') {
                auVar26._4_4_ = fVar21;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + auVar26._4_4_) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              fVar21 = fVar31;
              if (cVar4 == '\0') {
                fVar21 = auVar26._4_4_;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + fVar21) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              auVar26._4_4_ = fVar31;
              if (cVar4 == '\0') {
                auVar26._4_4_ = fVar21;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + auVar26._4_4_) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              fVar21 = fVar31;
              if (cVar4 == '\0') {
                fVar21 = auVar26._4_4_;
                fVar29 = fVar31;
              }
              fVar31 = (fVar29 + fVar21) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar31 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar22 + fVar25,fVar31 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              auVar26._4_4_ = fVar31;
              if (cVar4 == '\0') {
                auVar26._4_4_ = fVar21;
                fVar29 = fVar31;
              }
              fVar30 = (fVar29 + auVar26._4_4_) * fVar30;
              uStack_340._0_4_ = fVar23 * fVar30 + fVar28;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar30 * fVar22 + fVar25,fVar30 * fVar20 + fVar24);
              func_0x0001417080b0();
              cVar4 = func_0x000140946c80();
              if (cVar4 == '\0') {
                fVar30 = auVar26._4_4_;
              }
              auVar26._4_4_ = fVar24 + fVar20 * fVar30;
              fVar21 = fVar25 + fVar22 * fVar30;
              fVar30 = fVar28 + fVar23 * fVar30;
            }
            auVar3._4_4_ = local_350;
            auVar3._0_4_ = local_350;
            auVar3._8_8_ = 0;
            divps(auVar27,auVar3);
            func_0x000144ff9f20();
            fVar29 = *pfVar11;
            fVar23 = pfVar11[1];
            fVar24 = pfVar11[2];
            fVar25 = pfVar11[3];
            fVar17 = fVar24 * (float)local_348 * fRam0000000145ed0c74;
            fVar18 = fVar23 * (float)local_348 * fRam0000000145ed0c78;
            fVar19 = fVar29 * (float)local_348 * fRam0000000145ed0c7c;
            fVar31 = fVar25 * local_348._4_4_ * fRam0000000145ed0c84;
            fVar15 = fVar29 * local_348._4_4_ * fRam0000000145ed0c88;
            fVar16 = fVar23 * local_348._4_4_ * fRam0000000145ed0c8c;
            fVar28 = fVar29 * (float)uStack_340 * fRam0000000145ed0c94;
            fVar20 = fVar25 * (float)uStack_340 * fRam0000000145ed0c98;
            fVar22 = fVar24 * (float)uStack_340 * fRam0000000145ed0c9c;
            *pfVar11 = fVar23 * (float)uStack_340 * _DAT_145ed0c90 +
                       fVar24 * local_348._4_4_ * _DAT_145ed0c80 +
                       fVar25 * (float)local_348 * _DAT_145ed0c70 + uStack_340._4_4_ * fVar29;
            pfVar11[1] = fVar28 + fVar31 + fVar17 + uStack_340._4_4_ * fVar23;
            pfVar11[2] = fVar20 + fVar15 + fVar18 + uStack_340._4_4_ * fVar24;
            pfVar11[3] = fVar22 + fVar16 + fVar19 + uStack_340._4_4_ * fVar25;
            *unaff_RBP = local_304;
            *(ulong *)(pfVar11 + 4) = CONCAT44(fVar21,auVar26._4_4_);
            pfVar11[6] = fVar30;
            return;
          }
        }
        *in_stack_00000060 = 0.0;
        return;
      }
      uVar1 = *puVar6;
      puVar6 = puVar6 + 1;
    } while (*(long *)(*(long *)(lStack_120 + 0x1a8) + 0x10 + (ulong)uVar1 * 0x48) == 0);
  }
  return;
LAB_14098845e:
  iVar13 = 0;
  iVar7 = 0;
  pfVar10 = (float *)0x0;
  goto LAB_140988465;
}

