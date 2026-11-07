
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,
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
  long lVar15;
  ulong uVar16;
  byte bVar17;
  ulong uVar18;
  ulong uVar19;
  float fVar20;
  float fVar21;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float extraout_XMM0_Da_01;
  float fVar22;
  float fVar23;
  undefined8 extraout_XMM0_Qa_03;
  float fVar31;
  undefined8 extraout_XMM0_Qa;
  undefined4 extraout_XMM0_Dc;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar24 [16];
  undefined8 extraout_XMM0_Qa_00;
  undefined8 extraout_XMM0_Qb_00;
  undefined1 auVar25 [16];
  undefined8 extraout_XMM0_Qa_01;
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined8 extraout_XMM0_Qa_02;
  float extraout_XMM0_Dc_00;
  undefined1 auVar28 [16];
  undefined8 extraout_XMM0_Qb_01;
  undefined1 auVar29 [16];
  undefined4 extraout_XMM0_Dc_01;
  undefined1 auVar30 [16];
  float fVar32;
  undefined8 extraout_XMM1_Qa_02;
  undefined8 extraout_XMM1_Qa;
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  undefined1 auVar35 [16];
  undefined1 auVar36 [16];
  undefined8 extraout_XMM1_Qa_00;
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  undefined1 auVar39 [16];
  undefined8 extraout_XMM1_Qa_01;
  undefined1 auVar40 [16];
  undefined1 auVar41 [16];
  undefined1 auVar42 [16];
  undefined4 in_XMM6_Da;
  undefined8 in_XMM7_Qa;
  undefined1 auVar43 [16];
  undefined1 auVar44 [16];
  float fVar46;
  float fVar47;
  undefined1 auVar45 [16];
  float fVar48;
  undefined4 uVar49;
  undefined4 uVar50;
  undefined4 uVar51;
  undefined8 uVar52;
  undefined1 auVar53 [16];
  undefined1 auVar54 [16];
  undefined1 auVar55 [16];
  undefined1 auVar56 [16];
  float fVar57;
  float fVar59;
  undefined1 auVar58 [16];
  undefined1 auVar60 [16];
  undefined1 auVar61 [16];
  int local_148;
  undefined4 uStack_144;
  undefined4 uStack_140;
  float fStack_13c;
  float *local_138;
  long lStack_130;
  int local_e8;
  float fStack_e4;
  undefined4 local_e0;
  uint local_dc;
  char local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined8 local_b8;

  lVar1 = CONCAT44(uStack_144,local_148);
  local_d0 = 0xfffffffffffffffe;
  auVar58 = ZEXT416((uint)*param_6);
  if (*(char *)(param_7 + 0x8f8) == '\0') {
    fVar23 = param_6[1];
  }
  else {
    fVar23 = param_6[1];
    fVar20 = (float)*(undefined8 *)(param_7 + 0x8fc) - *param_6;
    fVar31 = (float)((ulong)*(undefined8 *)(param_7 + 0x8fc) >> 0x20) - fVar23;
    if ((_DAT_14593f7c0 < fVar31 * fVar31 + fVar20 * fVar20) && (*(char *)(param_7 + 0x908) != '\0')
       ) {
      *(char *)(param_7 + 0x908) = *(char *)(param_7 + 0x908) + -1;
      return;
    }
    *(undefined4 *)(param_7 + 0x8f8) = 0;
  }
  uVar51 = 0;
  uVar50 = 0;
  uVar49 = 0;
  local_c8 = in_XMM6_Da;
  local_b8 = in_XMM7_Qa;
  lVar12 = func_0x000145420480(param_6,param_7,*(undefined8 *)(param_7 + 0x230),
                               *(undefined8 *)(param_7 + 0x228));
  lVar12 = lVar12 * 0xf0;
  lVar14 = *(long *)(param_7 + 0x898);
  fVar20 = *(float *)(lVar12 + 0x1467335e0);
  fVar31 = *(float *)(lVar12 + 0x1467335e4);
  fVar46 = 0.0;
  fVar47 = 0.0;
  fVar57 = fVar31;
  uVar13 = func_0x00014552a140();
  if ((uVar13 & 1) == 0) {
    if ((*(long *)(lVar14 + 0x68) == -1) ||
       (func_0x00014552d220(extraout_XMM0_Qa,extraout_XMM1_Qa,fVar20,fVar57), local_148 != 1)) {
      auVar43 = ZEXT416(*(uint *)(lVar14 + 0xb8));
    }
    else {
      auVar43 = ZEXT416((uint)fStack_13c);
    }
  }
  else {
    auVar43._8_4_ = (int)extraout_XMM0_Qb;
    auVar43._0_8_ = extraout_XMM0_Qa;
    auVar43._12_4_ = (int)((ulong)extraout_XMM0_Qb >> 0x20);
  }
  lVar14 = func_0x000145420480();
  lVar15 = lVar14 * 0xf0;
  uVar13 = *(ulong *)(lVar15 + 0x146733578);
  if ((lVar14 == 2) || ((int)lVar14 == 7)) {
    lVar14 = *(long *)(lVar15 + 0x146733570);
    bVar17 = 0;
    uVar16 = uVar13 - 1;
    uVar19 = 0;
    do {
      if (uVar13 <= uVar16) {
        func_0x000145903b33();
                    /* WARNING: Does not return */
        pcVar8 = (code *)invalidInstructionException();
        (*pcVar8)();
      }
      fVar57 = *(float *)(lVar14 + 4 + uVar19 * 8);
      fVar21 = *(float *)(lVar14 + 4 + uVar16 * 8);
      if ((fVar23 < fVar21 != fVar23 < fVar57) &&
         (fVar22 = *(float *)(lVar14 + uVar19 * 8), fVar21 = fVar21 - fVar57,
         auVar58._0_4_ <
         ((fVar23 - fVar57) * (*(float *)(lVar14 + uVar16 * 8) - fVar22)) / fVar21 + fVar22)) {
        bVar17 = bVar17 ^ 1;
      }
      uVar18 = uVar19 + 1;
      uVar16 = uVar19;
      uVar19 = uVar18;
    } while (uVar13 != uVar18);
    local_d1 = bVar17 ^ 1;
  }
  else {
    auVar24._4_12_ = auVar58._4_12_;
    auVar24._0_4_ = auVar58._0_4_ - *(float *)(lVar15 + 0x1467335e0);
    auVar33._4_4_ = uVar49;
    auVar33._0_4_ = fVar23;
    auVar33._8_4_ = uVar50;
    auVar33._12_4_ = uVar51;
    auVar34._4_12_ = auVar33._4_12_;
    auVar34._0_4_ = fVar23 - *(float *)(lVar15 + 0x1467335e4);
    fVar21 = (float)func_0x000145773277(auVar24._0_8_,auVar34._0_8_);
    local_d1 = *(float *)(lVar15 + 0x1467335f0) + _DAT_145915800 < fVar21;
  }
  cVar4 = *(char *)(lVar12 + 0x146733604);
  fVar57 = _DAT_145907494;
  if (cVar4 == '\0') {
    local_148._0_1_ = 0;
    bVar9 = 0;
    bVar17 = 0;
    if (*(int *)(param_7 + 0x890) == 0) goto LAB_1454a6075;
LAB_1454a5f89:
    if (*(long *)(*(long *)(param_7 + 0x898) + 0x68) == -1) {
      local_e8 = 0;
      local_138 = param_6;
    }
    else {
      local_e8 = func_0x00014552b4e0();
      local_138 = param_6;
      fVar21 = extraout_XMM0_Da_00;
    }
    lVar1 = param_7 + 0x934;
    uStack_140 = 0x457396f0;
    fStack_13c = 1.4013e-45;
    lStack_130 = 0x1457396f0;
    param_6 = local_138;
    func_0x000145711f90();
    fStack_e4 = fVar21;
    if (bVar9 != 0) goto LAB_1454a6079;
LAB_1454a6027:
    *(undefined4 *)(param_7 + 0x880) = 0;
    bVar5 = false;
    if (cVar4 != '\0') goto LAB_1454a60bf;
LAB_1454a60fd:
    *(undefined4 *)(param_7 + 0x888) = 0;
    bVar6 = false;
    if (cVar4 == '\0') goto LAB_1454a6171;
LAB_1454a6111:
    if (((*(char *)(param_7 + 0x9b9) != '\x01') || ((*(uint *)(param_7 + 0x990) & 0xf) == 0)) ||
       ((*(uint *)(param_7 + 0x990) & 0x1000) != 0)) goto LAB_1454a6171;
    if (*(int *)(param_7 + 0x90c) == 1) {
      fVar21 = *(float *)(param_7 + 0x910);
    }
    else {
      fVar21 = *(float *)(param_7 + 0x934);
      *(undefined4 *)(param_7 + 0x90c) = 1;
      *(float *)(param_7 + 0x910) = fVar21;
      *(undefined8 *)(param_7 + 0x914) = *(undefined8 *)param_6;
      *(float *)(param_7 + 0x91c) = param_6[2];
    }
    auVar25._4_12_ = auVar58._4_12_;
    auVar25._0_4_ = auVar58._0_4_ - *(float *)(param_7 + 0x914);
    auVar35._4_4_ = uVar49;
    auVar35._0_4_ = fVar23;
    auVar35._8_4_ = uVar50;
    auVar35._12_4_ = uVar51;
    auVar36._4_12_ = auVar35._4_12_;
    auVar36._0_4_ = fVar23 - *(float *)(param_7 + 0x918);
    fVar22 = (float)func_0x000145773277(auVar25._0_8_,auVar36._0_8_);
    if (_DAT_145915930 < fVar22) {
      *(undefined4 *)(param_7 + 0x90c) = 1;
      *(float *)(param_7 + 0x910) = *(float *)(param_7 + 0x934);
      *(float *)(param_7 + 0x91c) = param_6[2];
      *(undefined8 *)(param_7 + 0x914) = *(undefined8 *)param_6;
      goto LAB_1454a617b;
    }
    bVar7 = _DAT_14594b3d8 <= *(float *)(param_7 + 0x934) - fVar21;
  }
  else {
    if (*(long *)(*(long *)(param_7 + 0x898) + 0x68) == -1) {
      local_148._0_1_ = 0;
      bVar9 = 0;
      fVar21 = _DAT_145907494;
    }
    else {
      func_0x00014552d220();
      fVar57 = fStack_13c + _DAT_14593fc20;
      if (*(long *)(*(long *)(param_7 + 0x898) + 0x68) == -1) {
        bVar9 = 0;
        fVar21 = _DAT_145907494;
      }
      else {
        bVar9 = func_0x00014552b4e0();
        fVar21 = extraout_XMM0_Da + _DAT_145907500;
      }
    }
    bVar9 = (param_6[2] <= fVar21 && fVar21 != param_6[2]) & bVar9;
    bVar17 = bVar9;
    if (*(int *)(param_7 + 0x890) != 0) goto LAB_1454a5f89;
LAB_1454a6075:
    if (bVar17 == 0) goto LAB_1454a6027;
LAB_1454a6079:
    fVar21 = *(float *)(param_7 + 0x934);
    if (*(int *)(param_7 + 0x880) == 1) {
      fVar22 = *(float *)(param_7 + 0x884);
    }
    else {
      *(undefined4 *)(param_7 + 0x880) = 1;
      *(float *)(param_7 + 0x884) = fVar21;
      fVar22 = fVar21;
    }
    bVar5 = _DAT_145915930 <= fVar21 - fVar22;
    if (cVar4 == '\0') goto LAB_1454a60fd;
LAB_1454a60bf:
    if ((*(long *)(*(long *)(param_7 + 0x898) + 0x40) == -1) ||
       (cVar10 = func_0x0001455257a0(), cVar10 == '\0')) goto LAB_1454a60fd;
    fVar21 = *(float *)(param_7 + 0x934);
    if (*(int *)(param_7 + 0x888) == 1) {
      fVar22 = *(float *)(param_7 + 0x88c);
    }
    else {
      *(undefined4 *)(param_7 + 0x888) = 1;
      *(float *)(param_7 + 0x88c) = fVar21;
      fVar22 = fVar21;
    }
    bVar6 = _DAT_145907490 <= fVar21 - fVar22;
    if (cVar4 != '\0') goto LAB_1454a6111;
LAB_1454a6171:
    *(undefined4 *)(param_7 + 0x90c) = 0;
LAB_1454a617b:
    bVar7 = false;
  }
  uVar11 = func_0x00014552a140();
  fVar21 = (float)extraout_XMM0_Qa_00;
  auVar53._8_4_ = (int)extraout_XMM0_Qb_00;
  auVar53._0_8_ = extraout_XMM0_Qa_00;
  auVar53._12_4_ = (int)((ulong)extraout_XMM0_Qb_00 >> 0x20);
  if ((cVar4 == '\0') && (uVar11 != 1)) {
    uVar13 = func_0x0001455266f0();
    fVar21 = auVar53._0_4_;
    if (((!bVar5) && (!bVar6)) && (!bVar7)) {
      if ((uVar11 & 1) == 0) {
        if (((byte)local_148 & 1) == 0) {
          if ((uVar13 & 1) == 0) goto LAB_1454a633f;
          fVar22 = param_6[2];
          fVar57 = extraout_XMM0_Da_01 + _DAT_14593f8d0;
          goto LAB_1454a6351;
        }
LAB_1454a6274:
        fVar22 = param_6[2];
        bVar6 = fVar22 < fVar57;
      }
      else {
        fVar22 = param_6[2];
LAB_1454a6240:
        bVar6 = fVar22 < fVar21 + _DAT_14593f8d0;
      }
joined_r0x0001454a635c:
      if ((local_d1 == '\0') && (!bVar6)) {
        uVar52 = *(undefined8 *)param_6;
        goto LAB_1454a67c7;
      }
    }
  }
  else if ((!bVar5) && ((!bVar6 && (!bVar7)))) {
    if ((uVar11 & 1) != 0) {
      fVar22 = param_6[2];
      if (cVar4 != '\0') {
        bVar6 = fVar22 < fVar21 + _DAT_14593fc20;
        goto joined_r0x0001454a635c;
      }
      goto LAB_1454a6240;
    }
    if (((byte)local_148 & 1) != 0) goto LAB_1454a6274;
LAB_1454a633f:
    fVar22 = param_6[2];
    fVar57 = _DAT_1469f5c48 + auVar43._0_4_;
LAB_1454a6351:
    bVar6 = fVar22 < fVar57;
    goto joined_r0x0001454a635c;
  }
  if (*(int *)(param_7 + 0x890) != 0) {
    lVar1 = param_7 + 0x934;
    uStack_140 = 0x457396f0;
    fStack_13c = 1.4013e-45;
    local_138 = (float *)&local_d1;
    lStack_130 = 0x14573b480;
    func_0x000145711f90();
  }
  *(undefined4 *)(param_7 + 0x880) = 0;
  *(undefined4 *)(param_7 + 0x888) = 0;
  *(undefined4 *)(param_7 + 0x90c) = 0;
  auVar54._0_8_ = auVar58._0_8_;
  auVar54._8_4_ = auVar58._4_4_;
  auVar54._12_4_ = uVar49;
  auVar41._8_8_ = auVar54._8_8_;
  auVar41._0_4_ = auVar58._0_4_;
  auVar41._4_4_ = fVar23;
  if (local_d1 == '\x01') {
    lVar14 = func_0x000145420480();
    lVar12 = lVar14 * 0xf0;
    fVar57 = *(float *)(lVar12 + 0x1467335e0);
    fVar21 = *(float *)(lVar12 + 0x1467335e4);
    fVar22 = 0.0;
    fVar59 = 0.0;
    if ((lVar14 == 2) || ((int)lVar14 == 7)) {
      func_0x0001454205d0(extraout_XMM0_Qa_01,extraout_XMM1_Qa_00,auVar58._0_4_,fVar23);
      fVar32 = 0.0;
      fVar48 = 0.0;
      auVar58._0_4_ = fVar57 - extraout_EAX;
      auVar58._4_4_ = fVar21 - extraout_var;
      auVar58._8_4_ = fVar22 - 0.0;
      auVar58._12_4_ = fVar59 - 0.0;
      fVar57 = extraout_EAX;
      fVar21 = extraout_var;
      fVar23 = (float)func_0x000145773277();
      if (fVar23 <= _DAT_14594e610) {
        fVar23 = _DAT_14594e610;
      }
      auVar26._4_4_ = fVar23;
      auVar26._0_4_ = fVar23;
      auVar26._8_4_ = extraout_XMM0_Dc;
      auVar26._12_4_ = extraout_XMM0_Dc;
      auVar58 = divps(auVar58,auVar26);
      auVar41._4_4_ = auVar58._4_4_ * fRam00000001459e4794 + fVar21;
      auVar41._0_4_ = auVar58._0_4_ * _DAT_1459e4790 + fVar57;
      auVar41._8_4_ = auVar58._8_4_ * fRam00000001459e4798 + fVar32;
      auVar41._12_4_ = auVar58._12_4_ * fRam00000001459e479c + fVar48;
      goto LAB_1454a6485;
    }
    auVar56._0_4_ = auVar41._0_4_ - fVar57;
    auVar56._4_4_ = auVar41._4_4_ - fVar21;
    auVar56._8_4_ = auVar41._8_4_ - 0.0;
    auVar56._12_4_ = auVar41._12_4_ - 0.0;
    fVar23 = (float)func_0x000145773277();
    if (fVar23 <= _DAT_14594e610) {
      fVar23 = _DAT_14594e610;
    }
    fVar32 = *(float *)(lVar12 + 0x1467335f0) + _DAT_145915800 + _DAT_1459e4a00;
    auVar30._4_4_ = fVar23;
    auVar30._0_4_ = fVar23;
    auVar30._8_4_ = extraout_XMM0_Dc_01;
    auVar30._12_4_ = extraout_XMM0_Dc_01;
    auVar58 = divps(auVar56,auVar30);
    auVar41._4_4_ = fVar32 * auVar58._4_4_ + fVar21;
    auVar41._0_4_ = fVar32 * auVar58._0_4_ + fVar57;
    auVar41._8_4_ = auVar58._8_4_ * 0.0 + fVar22;
    auVar41._12_4_ = auVar58._12_4_ * 0.0 + fVar59;
    if (!bVar7) goto LAB_1454a648b;
LAB_1454a6495:
    if (((*(byte *)(param_7 + 0x920) & 1) == 0) ||
       (_DAT_14593f7e0 <= *(float *)(param_7 + 0x934) - *(float *)(param_7 + 0x924))) {
      *(undefined4 *)(param_7 + 0x920) = 1;
      *(float *)(param_7 + 0x924) = *(float *)(param_7 + 0x934);
      *(float *)(param_7 + 0x930) = param_6[2];
      *(undefined8 *)(param_7 + 0x928) = *(undefined8 *)param_6;
    }
    else {
      fVar23 = auVar41._4_4_;
      auVar27._4_12_ = auVar41._4_12_;
      auVar27._0_4_ = auVar41._0_4_ - *(float *)(param_7 + 0x928);
      auVar37._4_4_ = fVar23;
      auVar37._0_4_ = fVar23;
      auVar37._8_4_ = auVar41._12_4_;
      auVar37._12_4_ = auVar41._12_4_;
      auVar38._4_12_ = auVar37._4_12_;
      auVar38._0_4_ = fVar23 - *(float *)(param_7 + 0x92c);
      lVar14 = param_7;
      fVar57 = (float)func_0x000145773277(auVar27._0_8_,auVar38._0_8_);
      fVar23 = _DAT_1459132fc;
      *(undefined4 *)(lVar14 + 0x920) = 1;
      *(undefined4 *)(lVar14 + 0x924) = *(undefined4 *)(lVar14 + 0x934);
      *(float *)(param_7 + 0x930) = param_6[2];
      *(undefined8 *)(param_7 + 0x928) = *(undefined8 *)param_6;
      param_7 = lVar14;
      if (fVar57 < fVar23) {
        auVar45._0_4_ = fVar20 - auVar41._0_4_;
        auVar45._4_4_ = fVar31 - auVar41._4_4_;
        auVar45._8_4_ = fVar46 - auVar41._8_4_;
        auVar45._12_4_ = fVar47 - auVar41._12_4_;
        fVar23 = (float)func_0x000145773277();
        if (fVar23 <= _DAT_14594e610) {
          fVar23 = _DAT_14594e610;
        }
        auVar39._4_4_ = fVar23;
        auVar39._0_4_ = fVar23;
        auVar39._8_4_ = extraout_XMM0_Dc_00;
        auVar39._12_4_ = extraout_XMM0_Dc_00;
        if (_DAT_145907508 <= fVar23) {
          fVar23 = _DAT_145907508;
        }
        auVar58 = divps(auVar45,auVar39);
        auVar55._0_4_ = auVar41._0_4_ + fVar23 * auVar58._0_4_;
        auVar55._4_4_ = auVar41._4_4_ + fVar23 * auVar58._4_4_;
        auVar55._8_4_ = auVar41._8_4_ + extraout_XMM0_Dc_00 * auVar58._8_4_;
        auVar55._12_4_ = auVar41._12_4_ + extraout_XMM0_Dc_00 * auVar58._12_4_;
        param_7 = lVar14;
        auVar41 = auVar55;
      }
    }
  }
  else {
LAB_1454a6485:
    if (bVar7) goto LAB_1454a6495;
LAB_1454a648b:
    if (bVar5) goto LAB_1454a6495;
  }
  uStack_144 = (undefined4)((ulong)lVar1 >> 0x20);
  local_148 = (int)lVar1;
  if ((*(long *)(*(long *)(param_7 + 0x898) + 0x40) != -1) && (cVar4 != '\0')) {
    uVar49 = auVar41._4_4_;
    cVar10 = func_0x0001455257a0();
    if (cVar10 != '\0') {
      func_0x000145525bb0(extraout_XMM0_Qa_02,extraout_XMM1_Qa_01,auVar41._0_4_,uVar49);
      auVar28._4_4_ = uStack_140;
      auVar28._0_4_ = uStack_144;
      auVar28._8_8_ = 0;
      auVar40._0_4_ = (local_148 << 0x1f) >> 0x1f;
      auVar40._4_4_ = (local_148 << 0x1f) >> 0x1f;
      auVar40._8_4_ = (local_148 << 0x1f) >> 0x1f;
      auVar40._12_4_ = (local_148 << 0x1f) >> 0x1f;
      auVar41 = ~auVar40 & auVar41 | auVar28 & auVar40;
    }
  }
  uVar49 = auVar41._4_4_;
  uVar13 = func_0x00014552a140();
  auVar61._8_8_ = extraout_XMM1_Qa_02;
  auVar61._0_8_ = extraout_XMM0_Qa_03;
  auVar44._8_8_ = extraout_XMM0_Qb_01;
  auVar44._0_8_ = extraout_XMM0_Qa_03;
  if ((uVar13 & 1) == 0) {
    auVar44 = auVar43;
    if ((*(long *)(*(long *)(param_7 + 0x898) + 0x68) == -1) ||
       (auVar61 = func_0x00014552d220(extraout_XMM0_Qa_03,extraout_XMM1_Qa_02,auVar41._0_4_,uVar49),
       auVar44 = auVar43, local_e8 != 1)) {
      if (cVar4 == '\0') {
        func_0x00014551dc20(auVar61._0_8_,auVar61._8_8_,auVar41._0_4_,uVar49);
        auVar29._4_4_ = uStack_140;
        auVar29._0_4_ = uStack_144;
        auVar29._8_8_ = 0;
        if (local_148 != 0) {
          auVar44 = ZEXT416((uint)fStack_13c);
        }
        auVar42._0_4_ = (local_148 << 0x1f) >> 0x1f;
        auVar42._4_4_ = (local_148 << 0x1f) >> 0x1f;
        auVar42._8_4_ = (local_148 << 0x1f) >> 0x1f;
        auVar42._12_4_ = (local_148 << 0x1f) >> 0x1f;
        auVar41 = ~auVar42 & auVar41 | auVar29 & auVar42;
      }
    }
    else {
      auVar41._4_4_ = local_e0;
      auVar41._0_4_ = fStack_e4;
      auVar41._8_8_ = 0;
      auVar44 = ZEXT416(local_dc);
    }
  }
  auVar60._4_12_ = auVar44._4_12_;
  auVar60._0_4_ = auVar44._0_4_ + _DAT_145907498;
  *(int *)(param_7 + 0x4cc) = *(int *)(param_7 + 0x4cc) + 1;
  func_0x000145467450(param_7 + 0x550);
  lVar14 = *(long *)(param_7 + 0x560);
  if (lVar14 == *(long *)(param_7 + 0x550)) {
    func_0x000145774710();
  }
  uVar52 = auVar41._0_8_;
  fVar22 = auVar60._0_4_;
  lVar12 = *(long *)(param_7 + 0x558);
  plVar2 = (long *)(lVar12 + 0x10 + lVar14 * 0x20);
  *plVar2 = (long)local_138;
  plVar2[1] = lStack_130;
  plVar2 = (long *)(lVar12 + lVar14 * 0x20);
  *plVar2 = lVar1;
  plVar2[1] = CONCAT44(fStack_13c,uStack_140);
  *(long *)(param_7 + 0x560) = lVar14 + 1;
  if (local_d1 != '\0') {
    func_0x00014545dc90();
    uVar52 = auVar41._0_8_;
    fVar22 = auVar60._0_4_;
    lVar14 = *(long *)(param_7 + 0x560);
    if (lVar14 == *(long *)(param_7 + 0x550)) {
      func_0x000145774710();
      uVar52 = auVar41._0_8_;
      fVar22 = auVar60._0_4_;
    }
    lVar12 = *(long *)(param_7 + 0x558);
    plVar2 = (long *)(lVar12 + 0x10 + lVar14 * 0x20);
    *plVar2 = (long)local_138;
    plVar2[1] = lStack_130;
    plVar2 = (long *)(lVar12 + lVar14 * 0x20);
    *plVar2 = lVar1;
    plVar2[1] = CONCAT44(fStack_13c,uStack_140);
    *(long *)(param_7 + 0x560) = lVar14 + 1;
  }
  *(undefined4 *)(param_7 + 0x8f8) = 1;
  *(undefined8 *)(param_7 + 0x8fc) = uVar52;
  *(float *)(param_7 + 0x904) = fVar22;
  *(undefined1 *)(param_7 + 0x908) = 0xc;
LAB_1454a67c7:
  uVar3 = *(undefined8 *)(param_7 + 0x400);
  *(undefined8 *)(param_7 + 0x400) = uVar52;
  *(float *)(param_7 + 0x408) = fVar22;
  *(undefined4 *)(param_7 + 0x40c) = param_3;
  if ((*(char *)(param_7 + 0x9b9) == '\0') &&
     (fVar23 = (float)uVar3 - (float)uVar52,
     fVar20 = (float)((ulong)uVar3 >> 0x20) - (float)((ulong)uVar52 >> 0x20),
     _DAT_145c31440 < fVar20 * fVar20 + fVar23 * fVar23)) {
    func_0x0001454c2890();
  }
  return;
}
