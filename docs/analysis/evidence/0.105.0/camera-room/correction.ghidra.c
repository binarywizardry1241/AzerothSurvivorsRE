
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
          undefined8 *param_5,long *param_6)

{
  uint *puVar1;
  uint uVar2;
  undefined1 auVar3 [16];
  undefined4 uVar4;
  char cVar5;
  ulong uVar6;
  uint *puVar7;
  undefined4 *unaff_RBP;
  int iVar8;
  long lVar9;
  float *pfVar10;
  float *pfVar11;
  long lVar12;
  int iVar13;
  long lVar15;
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
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  undefined4 in_XMM6_Da;
  float fVar21;
  undefined4 in_XMM7_Da;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  float fVar29;
  float fVar30;
  float fVar31;
  float fVar32;
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
  undefined8 local_320;
  undefined8 ******local_318;
  float local_310;
  undefined8 local_308;
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
  func_0x000145bc977b(in_stack_00000030,in_stack_00000058,in_stack_00000050,local_1d0,0xa8);
  local_308 = local_248;
  local_128 = *in_stack_00000058;
  lStack_120 = in_stack_00000058[1];
  local_f0 = in_stack_00000060;
  puVar7 = *(uint **)(local_128 + 0xf8);
  puVar1 = puVar7 + *(long *)(local_128 + 0x100);
  lVar15 = *(long *)(local_128 + 0x100) << 2;
  if (*(char *)(local_128 + 0x108) == '\0') {
    do {
      if (lVar15 == 0) goto LAB_140b07530;
      uVar2 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar14 = *(long *)(*(long *)(lStack_120 + 0x108) + 0x58 + (ulong)uVar2 * 0xa0);
      lVar15 = lVar15 + -4;
    } while (lVar14 == 0);
    lVar9 = *(long *)(lStack_120 + 0x108) + (ulong)uVar2 * 0xa0;
    uVar6 = (ulong)*(uint *)(lVar9 + 0x94);
    lVar15 = *(long *)(*(long *)(lStack_120 + 0x1a8) + 0x18 + uVar6 * 0x48);
    lVar12 = ~*(ulong *)(*(long *)(*(long *)(lStack_120 + 0x1a8) + 0x38 + uVar6 * 0x48) +
                        *(long *)(local_128 + 0x110) * 8) * 0x30;
    uVar6 = (ulong)~*(uint *)(*(long *)(lVar9 + 0x50) + 8);
    pfVar10 = (float *)(uVar6 * 0x30 + *(long *)(lVar15 + 0x10 + lVar12));
    unaff_RBP = (undefined4 *)(uVar6 * 4 + *(long *)(lVar15 + 0x28 + lVar12));
  }
  else {
    do {
      if (lVar15 == 0) goto LAB_140b07530;
      uVar2 = *puVar7;
      puVar7 = puVar7 + 1;
      lVar14 = *(long *)(*(long *)(lStack_120 + 0x1a8) + 0x10 + (ulong)uVar2 * 0x48);
      lVar15 = lVar15 + -4;
    } while (lVar14 == 0);
    lVar15 = *(long *)(lStack_120 + 0x1a8) + (ulong)uVar2 * 0x48;
    lVar9 = *(long *)(lVar15 + 0x18);
    lVar15 = ~*(ulong *)(*(long *)(lVar15 + 0x38) + *(long *)(local_128 + 0x110) * 8) * 0x30;
    pfVar10 = *(float **)(lVar9 + 0x10 + lVar15);
    unaff_RBP = *(undefined4 **)(lVar9 + 0x28 + lVar15);
  }
  iVar13 = (int)lVar14;
  iVar8 = 1;
LAB_140b0753a:
  local_118._4_4_ = (undefined4)((ulong)in_stack_00000058[2] >> 0x20);
  uVar4 = local_118._4_4_;
  if (*(char *)(local_128 + 0x108) == '\0') {
    if (iVar8 == iVar13) {
      do {
        if (puVar7 == puVar1) goto LAB_140b075c8;
        uVar2 = *puVar7;
        puVar7 = puVar7 + 1;
      } while (*(long *)(*(long *)(lStack_120 + 0x108) + 0x58 + (ulong)uVar2 * 0xa0) == 0);
    }
  }
  else if (iVar8 == iVar13) {
    do {
      if (puVar7 == puVar1) {
LAB_140b075c8:
        if (pfVar10 == (float *)0x0) {
          return;
        }
        local_2c0 = &local_248;
        local_2b8 = &local_228;
        local_2d0 = &local_210;
        local_2c8 = &local_1f0;
        fVar30 = *(float *)(local_2a8 + 0x58);
        fVar29 = *(float *)(local_268 + 0x4c) * _DAT_145d6d300;
        fVar25 = (float)*(undefined8 *)(local_288 + 0x70) + fVar29;
        fVar26 = (float)((ulong)*(undefined8 *)(local_288 + 0x70) >> 0x20) +
                 *(float *)(local_268 + 0x4c) * fRam0000000145d6d304;
        fVar29 = fVar29 + *(float *)(local_288 + 0x78);
        local_348 = (undefined8 *******)CONCAT44(fVar26,fVar25);
        auVar27._0_4_ = (float)*(undefined8 *)(pfVar10 + 4) - fVar25;
        auVar27._4_4_ = (float)((ulong)*(undefined8 *)(pfVar10 + 4) >> 0x20) - fVar26;
        auVar27._8_4_ = 0.0 - (fRam0000000145d6d308 * 0.0 + 0.0);
        auVar27._12_4_ = 0.0 - (fRam0000000145d6d30c * 0.0 + 0.0);
        local_2f4[2] = pfVar10[6] - fVar29;
        fVar24 = SQRT(auVar27._4_4_ * auVar27._4_4_ + auVar27._0_4_ * auVar27._0_4_ +
                      local_2f4[2] * local_2f4[2]);
        local_2f4[1] = 0.0;
        local_2b0 = &local_2d0;
        if ((((local_110 != (int *)0x0) && (*local_110 == 0xbd)) && (_DAT_145d6d42c <= fVar24)) &&
           (_DAT_145d70cb4 < SQRT(auVar27._0_4_ * auVar27._0_4_ + local_2f4[2] * local_2f4[2]))) {
          uStack_340 = (float **)CONCAT44(uStack_340._4_4_,fVar29);
          local_320 = local_210;
          auVar28 = auVar27;
          local_350 = fVar24;
          local_318 = local_348;
          local_310 = fVar29;
          local_2f4[0] = auVar27._0_4_;
          local_118 = in_stack_00000058[2];
          func_0x0001418e5a00();
          cVar5 = func_0x000140acaca0();
          if (cVar5 != '\0') {
            pfVar11 = pfVar10;
            fVar24 = (float)func_0x000145bc9829(auVar27._4_4_ / fVar24);
            local_300 = local_2f4;
            auVar27._4_4_ = 0.0;
            local_34c = fVar24;
            if (fVar24 < _DAT_145f4eac0) {
              uStack_340 = (float **)CONCAT44(uStack_340._4_4_,pfVar10[6]);
              local_348 = *(undefined8 ********)(pfVar10 + 4);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              if (cVar5 == '\0') {
                uStack_340 = &local_300;
                local_338 = &local_350;
                local_330 = &local_2c0;
                local_2e0 = 0xa00000001;
                local_2d8 = 0;
                local_2e8 = &local_34c;
                local_348 = &local_318;
                local_328 = local_1d0;
                uVar6 = func_0x000140ab2310();
                auVar27._4_4_ = extraout_XMM0_Da;
                fVar24 = local_34c;
                if (((((uVar6 & 1) == 0) &&
                     (uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_00,
                     fVar24 = local_34c, (uVar6 & 1) == 0)) &&
                    ((uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_01,
                     fVar24 = local_34c, (uVar6 & 1) == 0 &&
                     ((uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_02,
                      fVar24 = local_34c, (uVar6 & 1) == 0 &&
                      (uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_03,
                      fVar24 = local_34c, (uVar6 & 1) == 0)))))) &&
                   ((uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_04,
                    fVar24 = local_34c, (uVar6 & 1) == 0 &&
                    ((((uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_05,
                       fVar24 = local_34c, (uVar6 & 1) == 0 &&
                       (uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_06,
                       fVar24 = local_34c, (uVar6 & 1) == 0)) &&
                      (uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_07,
                      fVar24 = local_34c, (uVar6 & 1) == 0)) &&
                     (uVar6 = func_0x000140ab2310(), auVar27._4_4_ = extraout_XMM0_Da_09,
                     fVar24 = local_34c, (uVar6 & 1) == 0)))))) {
                  auVar27._4_4_ = _DAT_145f4eac0 - local_34c;
                }
              }
            }
            fVar21 = *in_stack_00000060;
            fVar22 = auVar27._4_4_ - fVar21;
            auVar27._4_4_ =
                 (float)func_0x000145bc97cf(fVar30 * *(float *)((ulong)(fVar21 < auVar27._4_4_) * 4
                                                               + 0x145f4ef20));
            fVar30 = _DAT_145d6d36c;
            fVar21 = (_DAT_145d6d36c - auVar27._4_4_) * fVar22 + fVar21;
            *in_stack_00000060 = fVar21;
            if (fVar21 < _DAT_145ef1c48) {
              uStack_340 = (float **)CONCAT44(uStack_340._4_4_,pfVar11[6]);
              local_348 = *(undefined8 ********)(pfVar11 + 4);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              fVar24 = local_34c;
              if (cVar5 != '\0') {
                return;
              }
            }
            pfVar10 = local_300;
            auVar27._4_4_ = fVar24;
            if (fVar24 <= _DAT_145f4eac0) {
              auVar27._4_4_ = _DAT_145f4eac0;
            }
            fVar22 = fVar21 + fVar24;
            if (auVar27._4_4_ <= fVar21 + fVar24) {
              fVar22 = auVar27._4_4_;
            }
            auVar27._4_4_ = local_300[2];
            fVar31 = auVar27._4_4_ * auVar27._4_4_;
            fVar24 = (float)func_0x000145bc97c3(fVar22);
            fVar21 = (float)*(undefined8 *)pfVar10;
            fVar23 = (float)((ulong)*(undefined8 *)pfVar10 >> 0x20);
            fVar30 = fVar30 / SQRT(fVar23 * fVar23 + fVar21 * fVar21 + fVar31);
            fVar21 = fVar24 * fVar30 * fVar21;
            fVar23 = fVar24 * fVar30 * fVar23;
            fVar24 = fVar30 * auVar27._4_4_ * fVar24;
            fVar30 = (float)func_0x000145bc97bd(fVar22);
            fVar21 = fVar21 + fVar30 * _DAT_145d6d300;
            fVar23 = fVar23 + fVar30 * fRam0000000145d6d304;
            fVar24 = fVar30 * _DAT_145d6d300 + fVar24;
            local_2e8 = (float *)CONCAT44(fVar23,fVar21);
            local_2e0 = CONCAT44(local_2e0._4_4_,fVar24);
            local_348 = (undefined8 *******)local_318;
            uStack_340._0_4_ = local_310;
            uVar6 = func_0x000141898ff0();
            fVar30 = local_350;
            if ((uVar6 & 1) != 0) {
              fVar30 = extraout_XMM0_Da_08;
              if (local_350 <= extraout_XMM0_Da_08) {
                fVar30 = local_350;
              }
              fVar30 = (float)(~-(uint)NAN(fVar30) & (uint)fVar30 |
                              (uint)extraout_XMM0_Da_08 & -(uint)NAN(fVar30));
            }
            auVar27._4_4_ = fVar30 * fVar21 + fVar25;
            fVar22 = fVar30 * fVar23 + fVar26;
            fVar31 = fVar24 * fVar30 + fVar29;
            local_348 = (undefined8 *******)CONCAT44(fVar22,auVar27._4_4_);
            uStack_340._0_4_ = fVar31;
            func_0x0001418e5a00();
            cVar5 = func_0x000140acaca0();
            if (cVar5 == '\0') {
              fVar22 = 0.0;
              fVar32 = (fVar30 + 0.0) * _DAT_145d6d754;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              fVar31 = _DAT_145d6d754;
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              auVar27._4_4_ = fVar32;
              if (cVar5 == '\0') {
                auVar27._4_4_ = fVar22;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + auVar27._4_4_) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              fVar22 = fVar32;
              if (cVar5 == '\0') {
                fVar22 = auVar27._4_4_;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + fVar22) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              auVar27._4_4_ = fVar32;
              if (cVar5 == '\0') {
                auVar27._4_4_ = fVar22;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + auVar27._4_4_) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              fVar22 = fVar32;
              if (cVar5 == '\0') {
                fVar22 = auVar27._4_4_;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + fVar22) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              auVar27._4_4_ = fVar32;
              if (cVar5 == '\0') {
                auVar27._4_4_ = fVar22;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + auVar27._4_4_) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              fVar22 = fVar32;
              if (cVar5 == '\0') {
                fVar22 = auVar27._4_4_;
                fVar30 = fVar32;
              }
              fVar32 = (fVar30 + fVar22) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar32 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar32 * fVar23 + fVar26,fVar32 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              auVar27._4_4_ = fVar32;
              if (cVar5 == '\0') {
                auVar27._4_4_ = fVar22;
                fVar30 = fVar32;
              }
              fVar31 = (fVar30 + auVar27._4_4_) * fVar31;
              uStack_340._0_4_ = fVar24 * fVar31 + fVar29;
              local_348 = (undefined8 *******)
                          CONCAT44(fVar31 * fVar23 + fVar26,fVar31 * fVar21 + fVar25);
              func_0x0001418e5a00();
              cVar5 = func_0x000140acaca0();
              if (cVar5 == '\0') {
                fVar31 = auVar27._4_4_;
              }
              auVar27._4_4_ = fVar25 + fVar21 * fVar31;
              fVar22 = fVar26 + fVar23 * fVar31;
              fVar31 = fVar29 + fVar24 * fVar31;
            }
            auVar3._4_4_ = local_350;
            auVar3._0_4_ = local_350;
            auVar3._8_8_ = 0;
            divps(auVar28,auVar3);
            func_0x000144fe3290();
            fVar30 = *pfVar11;
            fVar24 = pfVar11[1];
            fVar25 = pfVar11[2];
            fVar26 = pfVar11[3];
            fVar18 = fVar25 * (float)local_348 * fRam0000000145e7d9b4;
            fVar19 = fVar24 * (float)local_348 * fRam0000000145e7d9b8;
            fVar20 = fVar30 * (float)local_348 * fRam0000000145e7d9bc;
            fVar32 = fVar26 * local_348._4_4_ * fRam0000000145e7d9c4;
            fVar16 = fVar30 * local_348._4_4_ * fRam0000000145e7d9c8;
            fVar17 = fVar24 * local_348._4_4_ * fRam0000000145e7d9cc;
            fVar29 = fVar30 * (float)uStack_340 * fRam0000000145e7d9d4;
            fVar21 = fVar26 * (float)uStack_340 * fRam0000000145e7d9d8;
            fVar23 = fVar25 * (float)uStack_340 * fRam0000000145e7d9dc;
            *pfVar11 = fVar24 * (float)uStack_340 * _DAT_145e7d9d0 +
                       fVar25 * local_348._4_4_ * _DAT_145e7d9c0 +
                       fVar26 * (float)local_348 * _DAT_145e7d9b0 + uStack_340._4_4_ * fVar30;
            pfVar11[1] = fVar29 + fVar32 + fVar18 + uStack_340._4_4_ * fVar24;
            pfVar11[2] = fVar21 + fVar16 + fVar19 + uStack_340._4_4_ * fVar25;
            pfVar11[3] = fVar23 + fVar17 + fVar20 + uStack_340._4_4_ * fVar26;
            *unaff_RBP = uVar4;
            *(ulong *)(pfVar11 + 4) = CONCAT44(fVar22,auVar27._4_4_);
            pfVar11[6] = fVar31;
            return;
          }
        }
        *in_stack_00000060 = 0.0;
        return;
      }
      uVar2 = *puVar7;
      puVar7 = puVar7 + 1;
    } while (*(long *)(*(long *)(lStack_120 + 0x1a8) + 0x10 + (ulong)uVar2 * 0x48) == 0);
  }
  return;
LAB_140b07530:
  iVar13 = 0;
  iVar8 = 0;
  pfVar10 = (float *)0x0;
  puVar7 = puVar1;
  goto LAB_140b0753a;
}
