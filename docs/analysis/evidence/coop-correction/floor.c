
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

byte entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,
          undefined8 param_5,float *param_6,long param_7)

{
  long lVar1;
  long *plVar2;
  undefined8 uVar3;
  char cVar4;
  bool bVar5;
  bool bVar6;
  bool bVar7;
  code *pcVar8;
  byte bVar9;
  char cVar10;
  uint uVar11;
  float extraout_EAX;
  long lVar12;
  ulong uVar13;
  long lVar14;
  float extraout_var;
  float *pfVar15;
  long lVar16;
  ulong uVar17;
  byte bVar18;
  int iVar19;
  ulong uVar20;
  ulong uVar21;
  float fVar22;
  float fVar23;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float extraout_XMM0_Da_01;
  float fVar24;
  float fVar25;
  undefined8 extraout_XMM0_Qa_03;
  float fVar34;
  undefined8 extraout_XMM0_Qa;
  undefined4 extraout_XMM0_Dc;
  undefined1 auVar26 [16];
  undefined8 extraout_XMM0_Qa_00;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined8 extraout_XMM0_Qa_01;
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined8 extraout_XMM0_Qa_02;
  float extraout_XMM0_Dc_00;
  undefined1 auVar31 [16];
  undefined8 extraout_XMM0_Qb_00;
  undefined1 auVar32 [16];
  undefined4 extraout_XMM0_Dc_01;
  undefined1 auVar33 [16];
  float fVar35;
  undefined8 extraout_XMM1_Qa_02;
  undefined8 extraout_XMM1_Qa;
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  undefined1 auVar39 [16];
  undefined8 extraout_XMM1_Qa_00;
  undefined1 auVar40 [16];
  undefined1 auVar41 [16];
  undefined1 auVar42 [16];
  undefined8 extraout_XMM1_Qa_01;
  undefined1 auVar43 [16];
  undefined1 auVar44 [16];
  undefined1 auVar45 [16];
  undefined4 in_XMM6_Da;
  float fVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  undefined4 uVar49;
  undefined4 in_XMM7_Da;
  float fVar50;
  float fVar53;
  undefined1 auVar51 [16];
  undefined1 auVar52 [16];
  float fVar55;
  float fVar56;
  float fVar57;
  undefined1 auVar54 [16];
  undefined4 uVar58;
  undefined4 uVar59;
  undefined4 uVar60;
  undefined8 uVar61;
  undefined1 auVar62 [16];
  undefined1 auVar63 [16];
  undefined1 auVar64 [16];
  undefined1 auVar65 [16];
  float fVar66;
  float fVar69;
  undefined1 auVar67 [16];
  undefined1 auVar68 [16];
  float fVar70;
  undefined1 auVar71 [16];
  int local_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  float fStack_15c;
  float *local_158;
  long lStack_150;
  int local_108;
  float fStack_104;
  undefined4 local_100;
  uint local_fc;
  float local_f8;
  char local_f1;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;
  
  lVar1 = CONCAT44(uStack_164,local_168);
  local_f0 = 0xfffffffffffffffe;
  fVar46 = *param_6;
  uVar47 = 0;
  uVar48 = 0;
  uVar49 = 0;
  fVar50 = param_6[1];
  fVar70 = param_6[2];
  if (*(char *)(param_7 + 3000) == '\0') {
    fVar25 = param_6[1];
  }
  else {
    fVar25 = param_6[1];
    fVar22 = (float)*(undefined8 *)(param_7 + 0xbbc) - fVar46;
    fVar34 = (float)((ulong)*(undefined8 *)(param_7 + 0xbbc) >> 0x20) - fVar25;
    if ((_DAT_1461bdfbc < fVar34 * fVar34 + fVar22 * fVar22) &&
       (*(float *)(param_7 + 0xc98) - *(float *)(param_7 + 0xbcc) < _DAT_1461b2380)) {
      return 0;
    }
    *(undefined4 *)(param_7 + 3000) = 0;
  }
  uVar60 = 0;
  uVar59 = 0;
  uVar58 = 0;
  pfVar15 = (float *)(param_7 + 0xbd4);
  if ((*(uint *)(param_7 + 0xbd0) & 1) == 0) {
    pfVar15 = (float *)(param_7 + 0xc98);
  }
  fVar22 = *pfVar15;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  lVar12 = func_0x000145aaef50(param_6,param_7,*(undefined8 *)(param_7 + 0x2d8),
                               *(undefined8 *)(param_7 + 0x2d0));
  lVar12 = lVar12 * 0xf0;
  lVar14 = *(long *)(param_7 + 0xbf0);
  fVar34 = *(float *)(lVar12 + 0x146fd9038);
  fVar55 = *(float *)(lVar12 + 0x146fd903c);
  fVar56 = 0.0;
  fVar57 = 0.0;
  fVar66 = fVar55;
  uVar13 = func_0x000145bee7c0();
  local_f8 = (float)extraout_XMM0_Qa;
  if (((uVar13 & 1) == 0) &&
     ((*(long *)(lVar14 + 0x68) == -1 ||
      (func_0x000145bf1d00(extraout_XMM0_Qa,extraout_XMM1_Qa,fVar34,fVar66), local_f8 = fStack_15c,
      local_168 != 1)))) {
    local_f8 = *(float *)(lVar14 + 0xb8);
  }
  lVar14 = func_0x000145aaef50();
  lVar16 = lVar14 * 0xf0;
  uVar13 = *(ulong *)(lVar16 + 0x146fd8fd0);
  if ((lVar14 == 2) || ((int)lVar14 == 7)) {
    lVar14 = *(long *)(lVar16 + 0x146fd8fc8);
    bVar18 = 0;
    uVar17 = uVar13 - 1;
    uVar21 = 0;
    do {
      if (uVar13 <= uVar17) {
        func_0x0001461ae0f3();
                    /* WARNING: Does not return */
        pcVar8 = (code *)invalidInstructionException();
        (*pcVar8)();
      }
      fVar66 = *(float *)(lVar14 + 4 + uVar21 * 8);
      fVar23 = *(float *)(lVar14 + 4 + uVar17 * 8);
      if ((fVar25 < fVar23 != fVar25 < fVar66) &&
         (fVar24 = *(float *)(lVar14 + uVar21 * 8), fVar23 = fVar23 - fVar66,
         fVar46 < ((fVar25 - fVar66) * (*(float *)(lVar14 + uVar17 * 8) - fVar24)) / fVar23 + fVar24
         )) {
        bVar18 = bVar18 ^ 1;
      }
      uVar20 = uVar21 + 1;
      uVar17 = uVar21;
      uVar21 = uVar20;
    } while (uVar13 != uVar20);
    local_f1 = bVar18 ^ 1;
  }
  else {
    auVar68._4_4_ = uVar47;
    auVar68._0_4_ = fVar46;
    auVar68._8_4_ = uVar48;
    auVar68._12_4_ = uVar49;
    auVar26._4_12_ = auVar68._4_12_;
    auVar26._0_4_ = fVar46 - *(float *)(lVar16 + 0x146fd9038);
    auVar36._4_4_ = uVar58;
    auVar36._0_4_ = fVar25;
    auVar36._8_4_ = uVar59;
    auVar36._12_4_ = uVar60;
    auVar37._4_12_ = auVar36._4_12_;
    auVar37._0_4_ = fVar25 - *(float *)(lVar16 + 0x146fd903c);
    fVar23 = (float)func_0x000146005081(auVar26._0_8_,auVar37._0_8_);
    local_f1 = *(float *)(lVar16 + 0x146fd9048) + _DAT_1461b2410 < fVar23;
  }
  cVar4 = *(char *)(lVar12 + 0x146fd905c);
  fVar66 = _DAT_1461d1fc4;
  if (cVar4 == '\0') {
    local_168._0_1_ = 0;
    bVar18 = 0;
    bVar9 = 0;
    if (*(int *)(param_7 + 0xbe8) != 0) goto LAB_145b0a3fe;
LAB_145b0a375:
    if (bVar9 == 0) goto LAB_145b0a49f;
LAB_145b0a37d:
    if (*(int *)(param_7 + 0xbd8) == 1) {
      fVar23 = *(float *)(param_7 + 0xbdc);
    }
    else {
      *(undefined4 *)(param_7 + 0xbd8) = 1;
      *(float *)(param_7 + 0xbdc) = fVar22;
      fVar23 = fVar22;
    }
    bVar5 = _DAT_1461c0c60 <= fVar22 - fVar23;
    if (cVar4 != '\0') goto LAB_145b0a4b3;
LAB_145b0a4e8:
    *(undefined4 *)(param_7 + 0xbe0) = 0;
    bVar6 = false;
    if (cVar4 == '\0') goto LAB_145b0a562;
LAB_145b0a4fc:
    if (((*(char *)(param_7 + 0xd57) != '\x01') || ((*(uint *)(param_7 + 0xd10) & 0xf) == 0)) ||
       ((*(uint *)(param_7 + 0xd10) & 0x1000) != 0)) goto LAB_145b0a562;
    if (*(int *)(param_7 + 0xc70) == 1) {
      fVar23 = *(float *)(param_7 + 0xc74);
    }
    else {
      *(undefined4 *)(param_7 + 0xc70) = 1;
      *(float *)(param_7 + 0xc74) = fVar22;
      *(undefined8 *)(param_7 + 0xc78) = *(undefined8 *)param_6;
      *(float *)(param_7 + 0xc80) = param_6[2];
      fVar23 = fVar22;
    }
    auVar27._4_4_ = uVar47;
    auVar27._0_4_ = fVar46;
    auVar27._8_4_ = uVar48;
    auVar27._12_4_ = uVar49;
    auVar28._4_12_ = auVar27._4_12_;
    auVar28._0_4_ = fVar46 - *(float *)(param_7 + 0xc78);
    auVar38._4_4_ = uVar58;
    auVar38._0_4_ = fVar25;
    auVar38._8_4_ = uVar59;
    auVar38._12_4_ = uVar60;
    auVar39._4_12_ = auVar38._4_12_;
    auVar39._0_4_ = fVar25 - *(float *)(param_7 + 0xc7c);
    fVar24 = (float)func_0x000146005081(auVar28._0_8_,auVar39._0_8_);
    if (_DAT_1461c0c60 < fVar24) {
      *(undefined4 *)(param_7 + 0xc70) = 1;
      *(float *)(param_7 + 0xc74) = fVar22;
      *(float *)(param_7 + 0xc80) = param_6[2];
      *(undefined8 *)(param_7 + 0xc78) = *(undefined8 *)param_6;
      goto LAB_145b0a56c;
    }
    bVar7 = _DAT_1461be048 <= fVar22 - fVar23;
  }
  else {
    if (*(long *)(*(long *)(param_7 + 0xbf0) + 0x68) == -1) {
      local_168._0_1_ = 0;
      bVar9 = 0;
      fVar23 = _DAT_1461d1fc4;
    }
    else {
      func_0x000145bf1d00();
      fVar66 = fStack_15c + _DAT_1461bdf20;
      if (*(long *)(*(long *)(param_7 + 0xbf0) + 0x68) == -1) {
        bVar9 = 0;
        fVar23 = _DAT_1461d1fc4;
      }
      else {
        bVar9 = func_0x000145beffd0();
        fVar23 = extraout_XMM0_Da + _DAT_1461c3550;
      }
    }
    bVar9 = (param_6[2] <= fVar23 && fVar23 != param_6[2]) & bVar9;
    bVar18 = bVar9;
    if (*(int *)(param_7 + 0xbe8) == 0) goto LAB_145b0a375;
LAB_145b0a3fe:
    if (*(long *)(*(long *)(param_7 + 0xbf0) + 0x68) == -1) {
      local_108 = 0;
      local_158 = param_6;
    }
    else {
      local_108 = func_0x000145beffd0();
      local_158 = param_6;
      fVar23 = extraout_XMM0_Da_00;
    }
    lVar1 = param_7 + 0xc98;
    uStack_160 = 0x45fe8b50;
    fStack_15c = 1.4013e-45;
    lStack_150 = 0x145fe8b50;
    param_6 = local_158;
    func_0x000145fc1260();
    fStack_104 = fVar23;
    if (bVar18 != 0) goto LAB_145b0a37d;
LAB_145b0a49f:
    *(undefined4 *)(param_7 + 0xbd8) = 0;
    bVar5 = false;
    if (cVar4 == '\0') goto LAB_145b0a4e8;
LAB_145b0a4b3:
    if ((*(long *)(*(long *)(param_7 + 0xbf0) + 0x40) == -1) ||
       (cVar10 = func_0x000145c3b260(), cVar10 == '\0')) goto LAB_145b0a4e8;
    if (*(int *)(param_7 + 0xbe0) == 1) {
      fVar23 = *(float *)(param_7 + 0xbe4);
    }
    else {
      *(undefined4 *)(param_7 + 0xbe0) = 1;
      *(float *)(param_7 + 0xbe4) = fVar22;
      fVar23 = fVar22;
    }
    bVar6 = _DAT_1461b2200 <= fVar22 - fVar23;
    if (cVar4 != '\0') goto LAB_145b0a4fc;
LAB_145b0a562:
    *(undefined4 *)(param_7 + 0xc70) = 0;
LAB_145b0a56c:
    bVar7 = false;
  }
  uVar11 = func_0x000145bee7c0();
  fVar23 = (float)extraout_XMM0_Qa_00;
  auVar62._8_4_ = (int)extraout_XMM0_Qb;
  auVar62._0_8_ = extraout_XMM0_Qa_00;
  auVar62._12_4_ = (int)((ulong)extraout_XMM0_Qb >> 0x20);
  if ((cVar4 == '\0') && (uVar11 != 1)) {
    uVar13 = func_0x000145becbb0();
    fVar23 = auVar62._0_4_;
    if (((!bVar5) && (!bVar6)) && (!bVar7)) {
      if ((uVar11 & 1) == 0) {
        if (((byte)local_168 & 1) == 0) {
          if ((uVar13 & 1) == 0) goto LAB_145b0a725;
          fVar66 = param_6[2];
          fVar23 = extraout_XMM0_Da_01 + _DAT_14620ce70;
          goto LAB_145b0a738;
        }
LAB_145b0a663:
        auVar52 = ZEXT416((uint)param_6[2]);
        bVar6 = param_6[2] < fVar66;
      }
      else {
        auVar52 = ZEXT416((uint)param_6[2]);
LAB_145b0a62f:
        bVar6 = auVar52._0_4_ < fVar23 + _DAT_14620ce70;
      }
joined_r0x000145b0a743:
      if ((local_f1 == '\0') && (!bVar6)) {
        auVar44._8_8_ = 0;
        auVar44._0_8_ = *(ulong *)param_6;
        uVar47 = *(undefined4 *)(param_7 + 0xc98);
        goto LAB_145b0abcb;
      }
    }
  }
  else if ((!bVar5) && ((!bVar6 && (!bVar7)))) {
    if ((uVar11 & 1) != 0) {
      auVar52 = ZEXT416((uint)param_6[2]);
      if (cVar4 != '\0') {
        bVar6 = param_6[2] < fVar23 + _DAT_1461bdf20;
        goto joined_r0x000145b0a743;
      }
      goto LAB_145b0a62f;
    }
    if (((byte)local_168 & 1) != 0) goto LAB_145b0a663;
LAB_145b0a725:
    fVar66 = param_6[2];
    fVar23 = _DAT_14732a6d4 + local_f8;
LAB_145b0a738:
    auVar52 = ZEXT416((uint)fVar66);
    bVar6 = fVar66 < fVar23;
    goto joined_r0x000145b0a743;
  }
  if (*(int *)(param_7 + 0xbe8) != 0) {
    lVar1 = param_7 + 0xc98;
    uStack_160 = 0x45fe8b50;
    fStack_15c = 1.4013e-45;
    local_158 = (float *)&local_f1;
    lStack_150 = 0x145fea880;
    func_0x000145fc1260();
  }
  *(undefined4 *)(param_7 + 0xbd8) = 0;
  *(undefined4 *)(param_7 + 0xbe0) = 0;
  *(undefined4 *)(param_7 + 0xc70) = 0;
  auVar63._4_4_ = uVar47;
  auVar63._0_4_ = fVar46;
  auVar63._8_4_ = uVar47;
  auVar63._12_4_ = uVar58;
  auVar44._8_8_ = auVar63._8_8_;
  auVar44._4_4_ = fVar25;
  auVar44._0_4_ = fVar46;
  if (local_f1 == '\x01') {
    lVar14 = func_0x000145aaef50();
    lVar12 = lVar14 * 0xf0;
    fVar66 = *(float *)(lVar12 + 0x146fd9038);
    fVar23 = *(float *)(lVar12 + 0x146fd903c);
    fVar24 = 0.0;
    fVar69 = 0.0;
    if ((lVar14 == 2) || ((int)lVar14 == 7)) {
      func_0x000145aaf410(extraout_XMM0_Qa_01,extraout_XMM1_Qa_00,fVar46,fVar25);
      fVar35 = 0.0;
      fVar53 = 0.0;
      auVar67._0_4_ = fVar66 - extraout_EAX;
      auVar67._4_4_ = fVar23 - extraout_var;
      auVar67._8_4_ = fVar24 - 0.0;
      auVar67._12_4_ = fVar69 - 0.0;
      fVar66 = extraout_EAX;
      fVar23 = extraout_var;
      fVar25 = (float)func_0x000146005081();
      if (fVar25 <= _DAT_1461be050) {
        fVar25 = _DAT_1461be050;
      }
      auVar29._4_4_ = fVar25;
      auVar29._0_4_ = fVar25;
      auVar29._8_4_ = extraout_XMM0_Dc;
      auVar29._12_4_ = extraout_XMM0_Dc;
      auVar68 = divps(auVar67,auVar29);
      auVar44._4_4_ = auVar68._4_4_ * fRam0000000146363ab4 + fVar23;
      auVar44._0_4_ = auVar68._0_4_ * _DAT_146363ab0 + fVar66;
      auVar44._8_4_ = auVar68._8_4_ * fRam0000000146363ab8 + fVar35;
      auVar44._12_4_ = auVar68._12_4_ * fRam0000000146363abc + fVar53;
      goto LAB_145b0a876;
    }
    auVar65._0_4_ = auVar44._0_4_ - fVar66;
    auVar65._4_4_ = auVar44._4_4_ - fVar23;
    auVar65._8_4_ = auVar44._8_4_ - 0.0;
    auVar65._12_4_ = auVar44._12_4_ - 0.0;
    fVar25 = (float)func_0x000146005081();
    if (fVar25 <= _DAT_1461be050) {
      fVar25 = _DAT_1461be050;
    }
    fVar35 = *(float *)(lVar12 + 0x146fd9048) + _DAT_1461b2410 + _DAT_1465f5bc0;
    auVar33._4_4_ = fVar25;
    auVar33._0_4_ = fVar25;
    auVar33._8_4_ = extraout_XMM0_Dc_01;
    auVar33._12_4_ = extraout_XMM0_Dc_01;
    auVar68 = divps(auVar65,auVar33);
    auVar44._4_4_ = fVar35 * auVar68._4_4_ + fVar23;
    auVar44._0_4_ = fVar35 * auVar68._0_4_ + fVar66;
    auVar44._8_4_ = auVar68._8_4_ * 0.0 + fVar24;
    auVar44._12_4_ = auVar68._12_4_ * 0.0 + fVar69;
    if (!bVar7) goto LAB_145b0a87c;
LAB_145b0a886:
    if (((*(byte *)(param_7 + 0xc84) & 1) == 0) ||
       (_DAT_1461b2278 <= (float)((uint)(fVar22 - *(float *)(param_7 + 0xc88)) & _DAT_1461bdb50))) {
      *(undefined4 *)(param_7 + 0xc84) = 1;
      *(float *)(param_7 + 0xc88) = fVar22;
      *(float *)(param_7 + 0xc94) = param_6[2];
      *(undefined8 *)(param_7 + 0xc8c) = *(undefined8 *)param_6;
    }
    else {
      fVar25 = auVar44._4_4_;
      auVar30._4_12_ = auVar44._4_12_;
      auVar30._0_4_ = auVar44._0_4_ - *(float *)(param_7 + 0xc8c);
      auVar40._4_4_ = fVar25;
      auVar40._0_4_ = fVar25;
      auVar40._8_4_ = auVar44._12_4_;
      auVar40._12_4_ = auVar44._12_4_;
      auVar41._4_12_ = auVar40._4_12_;
      auVar41._0_4_ = fVar25 - *(float *)(param_7 + 0xc90);
      lVar14 = param_7;
      fVar66 = (float)func_0x000146005081(auVar30._0_8_,auVar41._0_8_);
      fVar25 = _DAT_1461b2380;
      *(undefined4 *)(lVar14 + 0xc84) = 1;
      *(float *)(lVar14 + 0xc88) = fVar22;
      *(undefined8 *)(param_7 + 0xc8c) = *(undefined8 *)param_6;
      *(float *)(param_7 + 0xc94) = param_6[2];
      param_7 = lVar14;
      if (fVar66 < fVar25) {
        auVar54._0_4_ = fVar34 - auVar44._0_4_;
        auVar54._4_4_ = fVar55 - auVar44._4_4_;
        auVar54._8_4_ = fVar56 - auVar44._8_4_;
        auVar54._12_4_ = fVar57 - auVar44._12_4_;
        fVar25 = (float)func_0x000146005081();
        if (fVar25 <= _DAT_1461be050) {
          fVar25 = _DAT_1461be050;
        }
        auVar42._4_4_ = fVar25;
        auVar42._0_4_ = fVar25;
        auVar42._8_4_ = extraout_XMM0_Dc_00;
        auVar42._12_4_ = extraout_XMM0_Dc_00;
        if (_DAT_1461bdba4 <= fVar25) {
          fVar25 = _DAT_1461bdba4;
        }
        auVar68 = divps(auVar54,auVar42);
        auVar64._0_4_ = auVar44._0_4_ + fVar25 * auVar68._0_4_;
        auVar64._4_4_ = auVar44._4_4_ + fVar25 * auVar68._4_4_;
        auVar64._8_4_ = auVar44._8_4_ + extraout_XMM0_Dc_00 * auVar68._8_4_;
        auVar64._12_4_ = auVar44._12_4_ + extraout_XMM0_Dc_00 * auVar68._12_4_;
        param_7 = lVar14;
        auVar44 = auVar64;
      }
    }
  }
  else {
LAB_145b0a876:
    if (bVar7) goto LAB_145b0a886;
LAB_145b0a87c:
    if (bVar5) goto LAB_145b0a886;
  }
  uStack_164 = (undefined4)((ulong)lVar1 >> 0x20);
  local_168 = (int)lVar1;
  if ((*(long *)(*(long *)(param_7 + 0xbf0) + 0x40) != -1) && (cVar4 != '\0')) {
    uVar47 = auVar44._4_4_;
    cVar10 = func_0x000145c3b260();
    if (cVar10 != '\0') {
      func_0x000145c3b670(extraout_XMM0_Qa_02,extraout_XMM1_Qa_01,auVar44._0_4_,uVar47);
      auVar31._4_4_ = uStack_160;
      auVar31._0_4_ = uStack_164;
      auVar31._8_8_ = 0;
      auVar43._0_4_ = (local_168 << 0x1f) >> 0x1f;
      auVar43._4_4_ = (local_168 << 0x1f) >> 0x1f;
      auVar43._8_4_ = (local_168 << 0x1f) >> 0x1f;
      auVar43._12_4_ = (local_168 << 0x1f) >> 0x1f;
      auVar44 = ~auVar43 & auVar44 | auVar31 & auVar43;
    }
  }
  uVar47 = auVar44._4_4_;
  uVar13 = func_0x000145bee7c0();
  auVar71._8_8_ = extraout_XMM1_Qa_02;
  auVar71._0_8_ = extraout_XMM0_Qa_03;
  auVar51._8_8_ = extraout_XMM0_Qb_00;
  auVar51._0_8_ = extraout_XMM0_Qa_03;
  if ((uVar13 & 1) == 0) {
    if ((*(long *)(*(long *)(param_7 + 0xbf0) + 0x68) == -1) ||
       (auVar71 = func_0x000145bf1d00(extraout_XMM0_Qa_03,extraout_XMM1_Qa_02,auVar44._0_4_,uVar47),
       local_108 != 1)) {
      if (cVar4 == '\0') {
        func_0x000145be62f0(auVar71._0_8_,auVar71._8_8_,auVar44._0_4_,uVar47);
        auVar32._4_4_ = uStack_160;
        auVar32._0_4_ = uStack_164;
        auVar32._8_8_ = 0;
        auVar45._0_4_ = (local_168 << 0x1f) >> 0x1f;
        auVar45._4_4_ = (local_168 << 0x1f) >> 0x1f;
        auVar45._8_4_ = (local_168 << 0x1f) >> 0x1f;
        auVar45._12_4_ = (local_168 << 0x1f) >> 0x1f;
        if (local_168 != 0) {
          local_f8 = fStack_15c;
        }
        auVar44 = auVar32 & auVar45 | ~auVar45 & auVar44;
      }
      auVar51 = ZEXT416((uint)local_f8);
    }
    else {
      auVar44._4_4_ = local_100;
      auVar44._0_4_ = fStack_104;
      auVar44._8_8_ = 0;
      auVar51 = ZEXT416(local_fc);
    }
  }
  auVar52._4_12_ = auVar51._4_12_;
  auVar52._0_4_ = auVar51._0_4_ + _DAT_1461b21b4;
  iVar19 = *(int *)(param_7 + 0x5a0);
  *(int *)(param_7 + 0x5a0) = iVar19 + 1;
  func_0x000145c74b00();
  lVar14 = *(long *)(param_7 + 0x680);
  if (lVar14 == *(long *)(param_7 + 0x670)) {
    func_0x000146006460();
  }
  lVar12 = *(long *)(param_7 + 0x678);
  plVar2 = (long *)(lVar12 + (lVar14 * 8 + 4) * 4);
  *plVar2 = (long)local_158;
  plVar2[1] = lStack_150;
  plVar2 = (long *)(lVar12 + lVar14 * 0x20);
  *plVar2 = lVar1;
  plVar2[1] = CONCAT44(fStack_15c,uStack_160);
  *(long *)(param_7 + 0x680) = lVar14 + 1;
  if (local_f1 != '\0') {
    func_0x000145c6a5f0();
    lVar14 = *(long *)(param_7 + 0x680);
    if (lVar14 == *(long *)(param_7 + 0x670)) {
      func_0x000146006460();
    }
    lVar12 = *(long *)(param_7 + 0x678);
    plVar2 = (long *)(lVar12 + (lVar14 * 8 + 4) * 4);
    *plVar2 = (long)local_158;
    plVar2[1] = lStack_150;
    plVar2 = (long *)(lVar12 + lVar14 * 0x20);
    *plVar2 = lVar1;
    plVar2[1] = CONCAT44(fStack_15c,uStack_160);
    *(long *)(param_7 + 0x680) = lVar14 + 1;
  }
  uVar47 = *(undefined4 *)(param_7 + 0xc98);
  *(undefined4 *)(param_7 + 3000) = 1;
  *(long *)(param_7 + 0xbbc) = auVar44._0_8_;
  *(int *)(param_7 + 0xbc4) = auVar52._0_4_;
  *(int *)(param_7 + 0xbc8) = iVar19;
  *(undefined4 *)(param_7 + 0xbcc) = uVar47;
LAB_145b0abcb:
  uVar3 = *(undefined8 *)(param_7 + 0x520);
  uVar61 = auVar44._0_8_;
  *(undefined8 *)(param_7 + 0x520) = uVar61;
  fVar25 = auVar52._0_4_;
  *(float *)(param_7 + 0x528) = fVar25;
  *(undefined4 *)(param_7 + 0x52c) = param_3;
  *(undefined4 *)(param_7 + 0xd14) = uVar47;
  if ((((*(char *)(param_7 + 0xd57) == '\0') &&
       (fVar22 = (float)uVar3 - auVar44._0_4_,
       fVar34 = (float)((ulong)uVar3 >> 0x20) - auVar44._4_4_,
       _DAT_1461bdb40 < fVar34 * fVar34 + fVar22 * fVar22)) && (*(long *)(param_7 + 0xc50) == 0)) &&
     (*(char *)(param_7 + 0xd53) == '\0')) {
    func_0x000145b18c00();
    uVar61 = auVar44._0_8_;
    fVar25 = auVar52._0_4_;
  }
  return fVar25 == fVar70 & -(fVar46 == (float)uVar61 && (float)((ulong)uVar61 >> 0x20) == fVar50);
}

