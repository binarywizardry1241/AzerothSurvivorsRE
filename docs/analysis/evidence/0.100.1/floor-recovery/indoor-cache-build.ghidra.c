
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,ulong param_3,undefined8 *param_4,uint *param_5,
     long param_6)

{
  code *pcVar1;
  undefined1 auVar2 [16];
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  unkuint9 Var16;
  undefined8 uVar17;
  char cVar18;
  int iVar19;
  undefined1 (*pauVar20) [16];
  long lVar21;
  int *piVar22;
  undefined4 *puVar23;
  uint **ppuVar24;
  long lVar25;
  undefined1 *puVar26;
  uint *puVar27;
  ulong *puVar28;
  undefined1 *puVar29;
  uint *puVar30;
  undefined1 *puVar31;
  undefined8 *puVar32;
  undefined1 *puVar33;
  uint **ppuVar34;
  long lVar35;
  ulong uVar36;
  undefined1 *puVar37;
  long lVar38;
  uint *puVar39;
  int iVar40;
  ulong uVar41;
  undefined4 *puVar42;
  uint *puVar43;
  int iVar44;
  uint *puVar45;
  ulong uVar46;
  int *piVar47;
  uint *puVar48;
  bool bVar49;
  uint uVar50;
  uint uVar51;
  uint uVar52;
  uint uVar53;
  float fVar54;
  undefined4 extraout_XMM0_Da;
  undefined8 extraout_XMM0_Qa;
  float fVar60;
  undefined1 auVar55 [16];
  undefined1 auVar56 [16];
  float fVar59;
  float fVar61;
  undefined1 auVar57 [16];
  undefined1 auVar58 [16];
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar62 [16];
  undefined1 auVar63 [16];
  undefined1 auVar64 [16];
  undefined1 auVar65 [16];
  float fVar66;
  float fVar67;
  undefined1 auVar68 [16];
  undefined1 auVar69 [16];
  undefined1 auVar70 [16];
  float fVar73;
  undefined1 auVar71 [16];
  undefined1 auVar72 [16];
  undefined1 auVar74 [16];
  undefined1 auVar75 [16];
  undefined1 auVar76 [16];
  undefined1 auVar77 [16];
  undefined1 auVar78 [16];
  undefined1 auVar79 [16];
  float fVar80;
  undefined1 auVar81 [16];
  undefined1 auVar82 [16];
  undefined1 auVar83 [16];
  undefined1 auVar84 [16];
  undefined1 auVar85 [16];
  undefined1 auVar86 [16];
  undefined1 auVar87 [16];
  undefined1 auVar88 [16];
  undefined1 auVar89 [16];
  undefined8 in_XMM6_Qa;
  undefined1 auVar90 [12];
  undefined1 auVar91 [16];
  undefined1 auVar92 [16];
  undefined1 auVar93 [16];
  undefined1 auVar94 [16];
  undefined1 auVar95 [16];
  undefined4 in_XMM7_Da;
  float fVar96;
  undefined4 uVar97;
  float fVar98;
  float fVar99;
  float fVar100;
  undefined4 uVar108;
  undefined1 auVar101 [16];
  undefined1 auVar102 [16];
  undefined1 auVar103 [16];
  undefined1 auVar104 [16];
  undefined1 auVar105 [16];
  undefined1 auVar106 [16];
  undefined1 auVar107 [16];
  undefined4 uVar109;
  undefined4 uVar119;
  undefined1 auVar110 [16];
  undefined1 auVar111 [16];
  undefined1 auVar112 [16];
  undefined1 auVar113 [16];
  undefined1 auVar114 [16];
  undefined1 auVar115 [16];
  undefined1 auVar116 [16];
  undefined1 auVar117 [16];
  undefined1 auVar118 [16];
  float fVar120;
  undefined8 *in_stack_00000028;
  float in_stack_00000030;
  ulong local_2c0;
  undefined4 uStack_2b8;
  undefined4 uStack_2b4;
  ulong local_2b0;
  long lStack_2a8;
  uint *local_2a0;
  ulong uStack_298;
  undefined1 *local_290;
  ulong local_288;
  long local_280;
  ulong local_278;
  undefined1 *local_270;
  undefined1 local_248 [16];
  undefined8 local_238;
  undefined8 uStack_230;
  undefined1 local_228 [16];
  undefined8 local_218;
  undefined4 local_210;
  undefined8 local_208;
  undefined4 local_200;
  undefined8 local_1f8;
  undefined4 local_1f0;
  undefined8 local_1e8;
  int local_1e0;
  undefined8 local_1d8;
  undefined4 uStack_1d0;
  float fStack_1cc;
  undefined8 local_1c8;
  uint *local_1c0;
  undefined8 *local_1b8;
  uint *local_1b0;
  uint *local_1a8;
  undefined1 *local_1a0;
  ulong local_198;
  uint *puStack_190;
  ulong local_188;
  long lStack_180;
  uint *local_178;
  ulong uStack_170;
  uint *local_168;
  int *local_160;
  ulong local_158;
  uint *local_150;
  undefined1 *local_148;
  ulong local_140;
  long local_138;
  ulong local_130;
  undefined8 local_128;
  float fStack_120;
  float fStack_11c;
  float local_114;
  int *local_110;
  uint *local_108;
  uint *local_100;
  float local_f4;
  undefined8 local_f0;
  undefined8 local_e8;
  undefined4 local_d8;

  local_f0 = 0xfffffffffffffffe;
  auVar107 = ZEXT416((uint)in_stack_00000030);
  local_1b8 = param_4;
  local_100 = param_5;
  local_e8 = in_XMM6_Qa;
  local_d8 = in_XMM7_Da;
  fVar54 = (float)func_0x00014577327d(in_stack_00000030 + in_stack_00000030 +
                                      in_stack_00000030 + in_stack_00000030);
  puVar30 = (uint *)0x0;
  if (0.0 <= fVar54) {
    puVar30 = (uint *)((long)(fVar54 - _DAT_1459071e0) & (long)fVar54 >> 0x3f | (long)fVar54);
  }
  local_108 = (uint *)0xffffffffffffffff;
  if (fVar54 <= _DAT_1459071e4) {
    local_108 = puVar30;
  }
  fVar54 = (float)*in_stack_00000028;
  fVar96 = (float)((ulong)*in_stack_00000028 >> 0x20);
  uVar97 = 0;
  fVar66 = 0.0;
  local_114 = *(float *)(in_stack_00000028 + 1);
  local_140 = 0;
  local_138 = 4;
  local_130 = 0;
  pauVar20 = (undefined1 (*) [16])func_0x0001456ff6a0();
  auVar90 = auVar107._0_12_;
  if (pauVar20[1][0] == '\x01') {
    local_228 = *pauVar20;
  }
  else {
    local_228 = func_0x000145712ca0();
    auVar90 = auVar107._0_12_;
    *pauVar20 = local_228;
    pauVar20[1][0] = 1;
  }
  local_1d8 = CONCAT44(fVar96,fVar54);
  fVar54 = fVar54 - auVar90._0_4_;
  fVar96 = fVar96 - auVar90._0_4_;
  fVar98 = fVar66 - auVar90._8_4_;
  fVar100 = _DAT_1459158d4 + local_114;
  *(long *)*pauVar20 = local_228._0_8_ + 1;
  local_238 = _DAT_146d34840;
  uStack_230 = uRam0000000146d34848;
  local_248 = _DAT_146d34830;
  local_168 = local_100 + param_6 * 0x12;
  puVar30 = (uint *)&local_1c8;
  piVar22 = (int *)0x0;
  puVar48 = local_100;
  uStack_1d0 = uVar97;
  fStack_1cc = fVar66;
LAB_14552b81a:
  if ((piVar22 != (int *)0x0) && (piVar47 = piVar22, piVar22 != local_110)) goto LAB_14552b85c;
  while (puVar45 = puVar48, puVar45 != local_168) {
    puVar48 = puVar45 + 0x12;
    if (*(long *)(puVar45 + 0x10) != 0) goto code_r0x00014552b84a;
  }
  local_128 = (undefined4 *)CONCAT44(fVar96,fVar96);
  fVar66 = fVar96;
  fVar120 = _DAT_145907498;
  fStack_120 = fVar98;
  fStack_11c = fVar98;
  local_f4 = fVar100;
  while (local_100 != local_168) {
    auVar118 = ZEXT416((uint)_DAT_145a082ac);
    fVar98 = _DAT_145a082ac;
    auVar107 = _DAT_145a14c30;
    if (*(long *)(local_100 + 4) != 0) {
      lVar21 = 0;
      auVar118 = _DAT_145a14c40;
      do {
        uVar46 = *(ulong *)(*(long *)(local_100 + 2) + 0x10 + lVar21 * 0x180);
        if (uVar46 != 0) {
          lVar38 = *(long *)(*(long *)(local_100 + 2) + 8 + lVar21 * 0x180);
          if (uVar46 < 9) {
            lVar35 = 0;
          }
          else {
            uVar41 = (ulong)((uint)uVar46 & 7);
            if ((uVar46 & 7) == 0) {
              uVar41 = 8;
            }
            lVar35 = uVar46 - uVar41;
            uVar97 = auVar107._0_4_;
            uVar108 = auVar107._4_4_;
            auVar82._0_8_ = CONCAT44(uVar108,uVar108);
            auVar82._8_4_ = uVar108;
            auVar82._12_4_ = uVar108;
            auVar102._0_8_ = CONCAT44(uVar97,uVar97);
            auVar102._8_4_ = uVar97;
            auVar102._12_4_ = uVar97;
            uVar109 = auVar118._0_4_;
            uVar119 = auVar118._4_4_;
            auVar63._0_8_ = CONCAT44(uVar119,uVar119);
            auVar63._8_4_ = uVar119;
            auVar63._12_4_ = uVar119;
            auVar111._0_8_ = CONCAT44(uVar109,uVar109);
            auVar111._8_4_ = uVar109;
            auVar111._12_4_ = uVar109;
            puVar23 = (undefined4 *)(lVar38 + 0x58);
            auVar85._8_4_ = uVar108;
            auVar85._0_8_ = auVar82._0_8_;
            auVar85._12_4_ = uVar108;
            auVar75._8_4_ = uVar97;
            auVar75._0_8_ = auVar102._0_8_;
            auVar75._12_4_ = uVar97;
            auVar69._8_4_ = uVar119;
            auVar69._0_8_ = auVar63._0_8_;
            auVar69._12_4_ = uVar119;
            auVar79._8_4_ = uVar109;
            auVar79._0_8_ = auVar111._0_8_;
            auVar79._12_4_ = uVar109;
            lVar25 = lVar35;
            do {
              auVar91._4_4_ = puVar23[-0x12];
              auVar91._0_4_ = puVar23[-0x15];
              auVar91._12_4_ = puVar23[-0xc];
              auVar91._8_4_ = puVar23[-0xf];
              auVar5._4_4_ = puVar23[-0x13];
              auVar5._0_4_ = puVar23[-0x16];
              auVar5._8_4_ = puVar23[-0x10];
              auVar5._12_4_ = puVar23[-0xd];
              auVar107 = minps(auVar111,auVar5);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar110._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar110._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar110._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar110._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar9._4_4_ = auVar111._4_4_ & uVar51;
              auVar9._0_4_ = auVar111._0_4_ & uVar50;
              auVar9._8_4_ = auVar111._8_4_ & uVar52;
              auVar9._12_4_ = auVar111._12_4_ & uVar53;
              auVar111 = auVar110 | auVar9;
              auVar14._4_4_ = puVar23[-7];
              auVar14._0_4_ = puVar23[-10];
              auVar14._8_4_ = puVar23[-4];
              auVar14._12_4_ = puVar23[-1];
              auVar107 = minps(auVar79,auVar14);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar55._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar55._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar55._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar55._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar10._4_4_ = auVar79._4_4_ & uVar51;
              auVar10._0_4_ = auVar79._0_4_ & uVar50;
              auVar10._8_4_ = auVar79._8_4_ & uVar52;
              auVar10._12_4_ = auVar79._12_4_ & uVar53;
              auVar79 = auVar55 | auVar10;
              auVar107 = minps(auVar63,auVar91);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar62._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar62._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar62._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar62._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar11._4_4_ = auVar63._4_4_ & uVar51;
              auVar11._0_4_ = auVar63._0_4_ & uVar50;
              auVar11._8_4_ = auVar63._8_4_ & uVar52;
              auVar11._12_4_ = auVar63._12_4_ & uVar53;
              auVar63 = auVar62 | auVar11;
              auVar2._4_4_ = puVar23[-6];
              auVar2._0_4_ = puVar23[-9];
              auVar2._8_4_ = puVar23[-3];
              auVar2._12_4_ = *puVar23;
              auVar107 = minps(auVar69,auVar2);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar68._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar68._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar68._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar68._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar12._4_4_ = auVar69._4_4_ & uVar51;
              auVar12._0_4_ = auVar69._0_4_ & uVar50;
              auVar12._8_4_ = auVar69._8_4_ & uVar52;
              auVar12._12_4_ = auVar69._12_4_ & uVar53;
              auVar69 = auVar68 | auVar12;
              auVar6._4_4_ = puVar23[-0x13];
              auVar6._0_4_ = puVar23[-0x16];
              auVar6._8_4_ = puVar23[-0x10];
              auVar6._12_4_ = puVar23[-0xd];
              auVar107 = maxps(auVar102,auVar6);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar101._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar101._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar101._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar101._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar13._4_4_ = auVar102._4_4_ & uVar51;
              auVar13._0_4_ = auVar102._0_4_ & uVar50;
              auVar13._8_4_ = auVar102._8_4_ & uVar52;
              auVar13._12_4_ = auVar102._12_4_ & uVar53;
              auVar102 = auVar101 | auVar13;
              auVar15._4_4_ = puVar23[-7];
              auVar15._0_4_ = puVar23[-10];
              auVar15._8_4_ = puVar23[-4];
              auVar15._12_4_ = puVar23[-1];
              auVar107 = maxps(auVar75,auVar15);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar74._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar74._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar74._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar74._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar7._4_4_ = auVar75._4_4_ & uVar51;
              auVar7._0_4_ = auVar75._0_4_ & uVar50;
              auVar7._8_4_ = auVar75._8_4_ & uVar52;
              auVar7._12_4_ = auVar75._12_4_ & uVar53;
              auVar75 = auVar74 | auVar7;
              auVar107 = maxps(auVar82,auVar91);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar81._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar81._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar81._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar81._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar8._4_4_ = auVar82._4_4_ & uVar51;
              auVar8._0_4_ = auVar82._0_4_ & uVar50;
              auVar8._8_4_ = auVar82._8_4_ & uVar52;
              auVar8._12_4_ = auVar82._12_4_ & uVar53;
              auVar82 = auVar81 | auVar8;
              auVar3._4_4_ = puVar23[-6];
              auVar3._0_4_ = puVar23[-9];
              auVar3._8_4_ = puVar23[-3];
              auVar3._12_4_ = *puVar23;
              auVar107 = maxps(auVar85,auVar3);
              uVar50 = -(uint)NAN(auVar107._0_4_);
              uVar51 = -(uint)NAN(auVar107._4_4_);
              uVar52 = -(uint)NAN(auVar107._8_4_);
              uVar53 = -(uint)NAN(auVar107._12_4_);
              auVar92._0_4_ = auVar85._0_4_ & uVar50;
              auVar92._4_4_ = auVar85._4_4_ & uVar51;
              auVar92._8_4_ = auVar85._8_4_ & uVar52;
              auVar92._12_4_ = auVar85._12_4_ & uVar53;
              auVar84._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
              auVar84._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
              auVar84._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
              auVar84._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
              auVar85 = auVar84 | auVar92;
              puVar23 = puVar23 + 0x18;
              lVar25 = lVar25 + -8;
            } while (lVar25 != 0);
            auVar107 = maxps(auVar82,auVar85);
            uVar50 = -(uint)NAN(auVar107._0_4_);
            uVar51 = -(uint)NAN(auVar107._4_4_);
            uVar52 = -(uint)NAN(auVar107._8_4_);
            uVar53 = -(uint)NAN(auVar107._12_4_);
            auVar83._0_4_ = auVar82._0_4_ & uVar50;
            auVar83._4_4_ = auVar82._4_4_ & uVar51;
            auVar83._8_4_ = auVar82._8_4_ & uVar52;
            auVar83._12_4_ = auVar82._12_4_ & uVar53;
            auVar86._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
            auVar86._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
            auVar86._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
            auVar86._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
            auVar86 = auVar86 | auVar83;
            fVar98 = auVar86._0_4_;
            fVar100 = auVar86._4_4_;
            fVar80 = auVar86._8_4_;
            fVar99 = auVar86._12_4_;
            fVar66 = fVar100;
            if (fVar100 <= fVar98) {
              fVar66 = fVar98;
            }
            fVar66 = (float)(~-(uint)NAN(fVar98) & (uint)fVar66 | -(uint)NAN(fVar98) & (uint)fVar100
                            );
            auVar88._0_8_ = auVar86._8_8_;
            auVar4._8_4_ = fVar80;
            auVar4._0_8_ = auVar88._0_8_;
            auVar4._12_4_ = fVar99;
            if (fVar80 <= fVar66) {
              auVar87._4_12_ = auVar4._4_12_;
              auVar87._0_4_ = fVar66;
              auVar88._0_8_ = auVar87._0_8_;
            }
            fVar98 = (float)(-(uint)NAN(fVar66) & (uint)fVar80 |
                            ~-(uint)NAN(fVar66) & (uint)auVar88._0_8_);
            fVar66 = fVar99;
            if (fVar99 <= fVar98) {
              fVar66 = fVar98;
            }
            auVar107 = maxps(auVar102,auVar75);
            uVar50 = -(uint)NAN(auVar107._0_4_);
            uVar51 = -(uint)NAN(auVar107._4_4_);
            uVar52 = -(uint)NAN(auVar107._8_4_);
            uVar53 = -(uint)NAN(auVar107._12_4_);
            auVar103._0_4_ = auVar102._0_4_ & uVar50;
            auVar103._4_4_ = auVar102._4_4_ & uVar51;
            auVar103._8_4_ = auVar102._8_4_ & uVar52;
            auVar103._12_4_ = auVar102._12_4_ & uVar53;
            auVar76._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
            auVar76._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
            auVar76._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
            auVar76._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
            auVar76 = auVar76 | auVar103;
            fVar80 = auVar76._0_4_;
            fVar59 = auVar76._4_4_;
            fVar67 = auVar76._8_4_;
            fVar73 = auVar76._12_4_;
            auVar77._0_8_ = auVar76._8_8_;
            auVar77._8_4_ = fVar67;
            auVar77._12_4_ = fVar73;
            fVar100 = fVar59;
            if (fVar59 <= fVar80) {
              fVar100 = fVar80;
            }
            fVar100 = (float)(~-(uint)NAN(fVar80) & (uint)fVar100 |
                             -(uint)NAN(fVar80) & (uint)fVar59);
            if (fVar67 <= fVar100) {
              auVar77._4_12_ = auVar77._4_12_;
              auVar77._0_4_ = fVar100;
            }
            fVar80 = (float)(-(uint)NAN(fVar100) & (uint)fVar67 |
                            ~-(uint)NAN(fVar100) & auVar77._0_4_);
            uVar50 = (uint)fVar59 & (uint)fVar73 | ~(uint)fVar59 & auVar77._4_4_;
            uVar51 = (uint)fVar73 & (uint)fVar67 | ~(uint)fVar73 & auVar77._8_4_;
            uVar52 = (uint)fVar73 | ~(uint)fVar73 & auVar77._12_4_;
            fVar100 = fVar73;
            if (fVar73 <= fVar80) {
              fVar100 = fVar80;
            }
            auVar93._0_4_ = ~-(uint)NAN(fVar80) & (uint)fVar100;
            auVar93._4_4_ = ~uVar50 & (uint)fVar73;
            auVar93._8_4_ = ~uVar51 & (uint)fVar73;
            auVar93._12_4_ = ~uVar52 & (uint)fVar73;
            auVar104._0_4_ = -(uint)NAN(fVar80) & (uint)fVar73;
            auVar104._4_4_ = uVar50 & (uint)fVar73;
            auVar104._8_4_ = uVar51 & (uint)fVar73;
            auVar104._12_4_ = uVar52 & (uint)fVar73;
            auVar104 = auVar104 | auVar93;
            auVar107 = minps(auVar63,auVar69);
            uVar50 = -(uint)NAN(auVar107._0_4_);
            uVar51 = -(uint)NAN(auVar107._4_4_);
            uVar52 = -(uint)NAN(auVar107._8_4_);
            uVar53 = -(uint)NAN(auVar107._12_4_);
            auVar64._0_4_ = auVar63._0_4_ & uVar50;
            auVar64._4_4_ = auVar63._4_4_ & uVar51;
            auVar64._8_4_ = auVar63._8_4_ & uVar52;
            auVar64._12_4_ = auVar63._12_4_ & uVar53;
            auVar70._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
            auVar70._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
            auVar70._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
            auVar70._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
            auVar70 = auVar70 | auVar64;
            fVar80 = auVar70._0_4_;
            fVar59 = auVar70._4_4_;
            fVar67 = auVar70._8_4_;
            fVar73 = auVar70._12_4_;
            auVar88._0_8_ = auVar70._8_8_;
            auVar88._8_4_ = fVar67;
            auVar88._12_4_ = fVar73;
            fVar100 = fVar59;
            if (fVar80 <= fVar59) {
              fVar100 = fVar80;
            }
            fVar100 = (float)(~-(uint)NAN(fVar80) & (uint)fVar100 |
                             -(uint)NAN(fVar80) & (uint)fVar59);
            if (fVar100 <= fVar67) {
              auVar71._4_12_ = auVar88._4_12_;
              auVar71._0_4_ = fVar100;
              auVar88._0_8_ = auVar71._0_8_;
            }
            fVar80 = (float)(-(uint)NAN(fVar100) & (uint)fVar67 |
                            ~-(uint)NAN(fVar100) & (uint)auVar88._0_8_);
            fVar100 = fVar73;
            if (fVar80 <= fVar73) {
              fVar100 = fVar80;
            }
            auVar107 = minps(auVar111,auVar79);
            uVar50 = -(uint)NAN(auVar107._0_4_);
            uVar51 = -(uint)NAN(auVar107._4_4_);
            uVar52 = -(uint)NAN(auVar107._8_4_);
            uVar53 = -(uint)NAN(auVar107._12_4_);
            auVar112._0_4_ = auVar111._0_4_ & uVar50;
            auVar112._4_4_ = auVar111._4_4_ & uVar51;
            auVar112._8_4_ = auVar111._8_4_ & uVar52;
            auVar112._12_4_ = auVar111._12_4_ & uVar53;
            auVar56._0_4_ = ~uVar50 & (uint)auVar107._0_4_;
            auVar56._4_4_ = ~uVar51 & (uint)auVar107._4_4_;
            auVar56._8_4_ = ~uVar52 & (uint)auVar107._8_4_;
            auVar56._12_4_ = ~uVar53 & (uint)auVar107._12_4_;
            auVar56 = auVar56 | auVar112;
            fVar67 = auVar56._0_4_;
            fVar59 = auVar56._4_4_;
            fVar60 = auVar56._8_4_;
            fVar61 = auVar56._12_4_;
            auVar57._0_8_ = auVar56._8_8_;
            auVar57._8_4_ = fVar60;
            auVar57._12_4_ = fVar61;
            auVar94._0_4_ = -(uint)NAN(fVar67) & (uint)fVar59;
            auVar94._4_4_ = fVar59;
            auVar94._8_4_ = (uint)fVar60 & (uint)fVar61;
            auVar94._12_4_ = fVar61;
            if (fVar67 <= fVar59) {
              fVar59 = fVar67;
            }
            auVar113._0_4_ = ~-(uint)NAN(fVar67) & (uint)fVar59;
            auVar113._4_4_ = 0;
            auVar113._8_4_ = ~(uint)fVar60 & (uint)fVar61;
            auVar113._12_4_ = 0;
            auVar113 = auVar113 | auVar94;
            fVar59 = auVar113._0_4_;
            if (fVar59 <= fVar60) {
              auVar57._4_12_ = auVar57._4_12_;
              auVar57._0_4_ = fVar59;
            }
            auVar89._0_4_ = ~-(uint)NAN(fVar59) & auVar57._0_4_;
            auVar89._4_4_ = ~auVar113._4_4_ & auVar57._4_4_;
            auVar89._8_4_ = ~auVar113._8_4_ & auVar57._8_4_;
            auVar89._12_4_ = ~auVar113._12_4_ & auVar57._12_4_;
            auVar114._0_4_ = -(uint)NAN(fVar59) & (uint)fVar60;
            auVar114._4_4_ = auVar113._4_4_ & (uint)fVar61;
            auVar114._8_4_ = auVar113._8_4_ & (uint)fVar60;
            auVar114._12_4_ = auVar113._12_4_ & (uint)fVar61;
            auVar114 = auVar114 | auVar89;
            fVar67 = auVar114._0_4_;
            fVar59 = fVar61;
            if (fVar67 <= fVar61) {
              fVar59 = fVar67;
            }
            auVar78._0_4_ = ~-(uint)NAN(fVar67) & (uint)fVar59;
            auVar78._4_4_ = ~auVar114._4_4_ & (uint)fVar61;
            auVar78._8_4_ = ~auVar114._8_4_ & (uint)fVar61;
            auVar78._12_4_ = ~auVar114._12_4_ & (uint)fVar61;
            auVar115._0_4_ = -(uint)NAN(fVar67) & (uint)fVar61;
            auVar115._4_4_ = auVar114._4_4_ & (uint)fVar61;
            auVar115._8_4_ = auVar114._8_4_ & (uint)fVar61;
            auVar115._12_4_ = auVar114._12_4_ & (uint)fVar61;
            auVar115 = auVar115 | auVar78;
            auVar105._0_8_ = auVar104._0_8_;
            auVar105._8_4_ = auVar104._4_4_;
            auVar105._12_4_ = fVar99;
            auVar107._8_8_ = auVar105._8_8_;
            auVar107._0_4_ = auVar104._0_4_;
            auVar107._4_4_ = -(uint)NAN(fVar98) & (uint)fVar99 | ~-(uint)NAN(fVar98) & (uint)fVar66;
            auVar116._0_8_ = auVar115._0_8_;
            auVar116._8_4_ = auVar115._4_4_;
            auVar116._12_4_ = fVar73;
            auVar118._8_8_ = auVar116._8_8_;
            auVar118._0_4_ = auVar115._0_4_;
            auVar118._4_4_ = -(uint)NAN(fVar80) & (uint)fVar73 | ~-(uint)NAN(fVar80) & (uint)fVar100
            ;
            fVar100 = local_f4;
            fVar66 = (float)local_128;
          }
          lVar25 = uVar46 - lVar35;
          puVar28 = (ulong *)(lVar38 + lVar35 * 0xc);
          do {
            auVar72._8_8_ = 0;
            auVar72._0_8_ = *puVar28;
            auVar79 = minps(auVar118,auVar72);
            uVar50 = -(uint)NAN(auVar79._0_4_);
            uVar51 = -(uint)NAN(auVar79._4_4_);
            uVar52 = -(uint)NAN(auVar79._8_4_);
            uVar53 = -(uint)NAN(auVar79._12_4_);
            auVar65._0_4_ = auVar118._0_4_ & uVar50;
            auVar65._4_4_ = auVar118._4_4_ & uVar51;
            auVar65._8_4_ = auVar118._8_4_ & uVar52;
            auVar65._12_4_ = auVar118._12_4_ & uVar53;
            auVar117._0_4_ = ~uVar50 & (uint)auVar79._0_4_;
            auVar117._4_4_ = ~uVar51 & (uint)auVar79._4_4_;
            auVar117._8_4_ = ~uVar52 & (uint)auVar79._8_4_;
            auVar117._12_4_ = ~uVar53 & (uint)auVar79._12_4_;
            auVar118 = auVar117 | auVar65;
            auVar79 = maxps(auVar107,auVar72);
            uVar50 = -(uint)NAN(auVar79._0_4_);
            uVar51 = -(uint)NAN(auVar79._4_4_);
            uVar52 = -(uint)NAN(auVar79._8_4_);
            uVar53 = -(uint)NAN(auVar79._12_4_);
            auVar58._0_4_ = auVar107._0_4_ & uVar50;
            auVar58._4_4_ = auVar107._4_4_ & uVar51;
            auVar58._8_4_ = auVar107._8_4_ & uVar52;
            auVar58._12_4_ = auVar107._12_4_ & uVar53;
            auVar106._0_4_ = ~uVar50 & (uint)auVar79._0_4_;
            auVar106._4_4_ = ~uVar51 & (uint)auVar79._4_4_;
            auVar106._8_4_ = ~uVar52 & (uint)auVar79._8_4_;
            auVar106._12_4_ = ~uVar53 & (uint)auVar79._12_4_;
            auVar107 = auVar106 | auVar58;
            puVar28 = (ulong *)((long)puVar28 + 0xc);
            lVar25 = lVar25 + -1;
          } while (lVar25 != 0);
        }
        lVar21 = lVar21 + 1;
      } while (lVar21 != *(long *)(local_100 + 4));
      fVar98 = auVar118._4_4_;
    }
    local_100 = local_100 + 0x12;
    fVar80 = auVar107._4_4_;
    puVar48 = (uint *)0x0;
    while (puVar45 = puVar48, puVar45 < local_108) {
      puVar48 = (uint *)((long)puVar45 + 1);
      fVar99 = ((float)puVar45 + fVar120) * fVar120 + fVar66;
      if ((fVar98 <= fVar99) && (fVar99 <= fVar80)) {
        lVar21 = (long)puVar45 * (long)local_108;
        puVar30 = (uint *)0x0;
        while (puVar30 < local_108) {
          iVar40 = (int)puVar30;
          Var16 = ZEXT89(puVar30);
          puVar30 = (uint *)((long)puVar30 + 1);
          fVar99 = ((float)(unkint9)Var16 + fVar120) * fVar120 + fVar54;
          if ((auVar118._0_4_ <= fVar99) && (fVar99 <= auVar107._0_4_)) {
            iVar19 = func_0x00014568f2e0();
            if (iVar19 == 1) {
              fVar99 = (float)extraout_XMM0_Qa;
              auVar95._8_4_ = (int)extraout_XMM0_Qb;
              auVar95._0_8_ = extraout_XMM0_Qa;
              auVar95._12_4_ = (int)((ulong)extraout_XMM0_Qb >> 0x20);
              if (fVar99 <= fVar100) {
                if (local_130 == local_140) {
                  func_0x000145780180();
                  fVar99 = auVar95._0_4_;
                }
                *(int *)(local_138 + local_130 * 8) = iVar40 + (int)lVar21;
                *(float *)(local_138 + 4 + local_130 * 8) = fVar99;
                local_130 = local_130 + 1;
              }
            }
          }
        }
      }
    }
  }
  if (1 < local_130) {
    if (local_130 < 0x15) {
      func_0x000145507780();
    }
    else {
      func_0x000145482040();
    }
  }
  puVar48 = (uint *)((long)local_108 * (long)local_108);
  if (0x7ffffffffffffffc < (long)puVar48 * 4 + 4U || (uint *)0x3ffffffffffffffe < puVar48) {
LAB_14552c1a3:
    func_0x00014590379b();
    goto LAB_14552cb82;
  }
  puVar31 = (undefined1 *)((long)puVar48 + 1);
  if ((long)puVar48 * 4 == -4) {
    piVar22 = (int *)&DAT_00000004;
    puVar33 = (undefined1 *)0x0;
  }
  else {
    func_0x000140002200();
    puVar30 = (uint *)&DAT_00000004;
    piVar22 = (int *)func_0x0001400021f0();
    puVar33 = puVar31;
    if (piVar22 == (int *)0x0) goto LAB_14552c1a3;
  }
  local_1a0 = puVar33;
  local_110 = piVar22;
  if (local_130 != 0) {
    lVar21 = 0;
    do {
      puVar30 = (uint *)(ulong)*(uint *)(local_138 + lVar21);
      if (puVar48 < puVar30 || (long)puVar48 - (long)puVar30 == 0) {
        func_0x000145903b33();
        goto LAB_14552cb82;
      }
      piVar22[(long)((long)puVar30 + 1)] = piVar22[(long)((long)puVar30 + 1)] + 1;
      lVar21 = lVar21 + 8;
    } while (local_130 << 3 != lVar21);
LAB_14552c235:
    iVar40 = *piVar22;
    puVar33 = (undefined1 *)((long)puVar48 + -1);
    uVar46 = (ulong)((uint)puVar48 & 3);
    if (puVar33 < (undefined1 *)0x3) {
      uVar41 = 0;
LAB_14552c296:
      uVar36 = 0;
      do {
        iVar40 = iVar40 + piVar22[uVar41 + uVar36 + 1];
        piVar22[uVar41 + uVar36 + 1] = iVar40;
        uVar36 = uVar36 + 1;
      } while (uVar46 != uVar36);
    }
    else {
      uVar41 = 0;
      do {
        iVar19 = piVar22[uVar41 + 1];
        piVar22[uVar41 + 1] = iVar40 + iVar19;
        iVar40 = iVar40 + iVar19 + piVar22[uVar41 + 2];
        piVar22[uVar41 + 2] = iVar40;
        iVar40 = iVar40 + piVar22[uVar41 + 3];
        piVar22[uVar41 + 3] = iVar40;
        iVar40 = iVar40 + piVar22[uVar41 + 4];
        piVar22[uVar41 + 4] = iVar40;
        uVar41 = uVar41 + 4;
      } while (((ulong)puVar48 & 0x3ffffffffffffffc) != uVar41);
      if (uVar46 != 0) goto LAB_14552c296;
    }
    if ((ulong)puVar48 >> 0x3d == 0) {
      func_0x000140002200();
      puVar30 = (uint *)&DAT_00000004;
      puVar23 = (undefined4 *)func_0x0001400021c0();
      uVar17 = uRam0000000145be7de8;
      auVar88._0_8_ = _DAT_145be7de0;
      if (puVar23 != (undefined4 *)0x0) {
        puVar42 = puVar23;
        if ((uint *)0x1 < puVar48) {
          puVar26 = (undefined1 *)0x1;
          if ((uint *)0x8 < puVar48) {
            puVar29 = (undefined1 *)((ulong)puVar33 & 0xfffffffffffffff8);
            puVar42 = puVar23 + (long)puVar29;
            puVar26 = puVar29 + 1;
            puVar37 = (undefined1 *)0x0;
            do {
              *(undefined8 *)(puVar23 + (long)puVar37) = auVar88._0_8_;
              *(undefined8 *)((long)(puVar23 + (long)puVar37) + 8) = uVar17;
              *(undefined8 *)(puVar23 + (long)(puVar37 + 4)) = auVar88._0_8_;
              *(undefined8 *)((long)(puVar23 + (long)(puVar37 + 4)) + 8) = uVar17;
              puVar37 = puVar37 + 8;
            } while (puVar29 != puVar37);
            if (puVar33 == puVar29) goto LAB_14552c360;
          }
          lVar21 = (long)puVar48 - (long)puVar26;
          do {
            *puVar42 = 0x7fc00000;
            puVar42 = puVar42 + 1;
            lVar21 = lVar21 + -1;
          } while (lVar21 != 0);
        }
LAB_14552c360:
        *puVar42 = 0x7fc00000;
        local_148 = puVar31;
        local_128 = puVar23;
        local_100 = puVar48;
        goto LAB_14552c3aa;
      }
    }
    func_0x00014590379b();
    goto LAB_14552cb82;
  }
  if (puVar48 != (uint *)0x0) goto LAB_14552c235;
  local_128 = (undefined4 *)&DAT_00000004;
  local_100 = (uint *)0x0;
  local_148 = puVar31;
LAB_14552c3aa:
  puVar45 = local_100;
  fVar66 = ((float)local_1d8 - fVar54) + ((float)local_1d8 - fVar54);
  uVar50 = (int)fVar66;
  if (_DAT_1459e51e0 < fVar66) {
    uVar50 = 0x7fffffff;
  }
  puVar39 = (uint *)0x0;
  puVar43 = (uint *)(ulong)uVar50;
  if (NAN(fVar66)) {
    puVar43 = puVar39;
  }
  fVar98 = (local_1d8._4_4_ - fVar96) + (local_1d8._4_4_ - fVar96);
  uVar50 = (int)fVar98;
  if (_DAT_1459e51e0 < fVar98) {
    uVar50 = 0x7fffffff;
  }
  local_168 = (uint *)(ulong)uVar50;
  if (NAN(fVar98)) {
    local_168 = puVar39;
  }
  local_1d8 = local_138;
  local_158 = local_130;
  fVar98 = -NAN;
  do {
    fVar100 = (float)((int)fVar98 + 1);
    if (fVar98 == 2.24208e-44) {
      fVar100 = fVar98;
    }
    uVar50 = (int)fVar98 + (int)local_168;
    iVar40 = (int)local_108;
    puVar27 = local_1b0;
    local_150 = puVar48;
    if ((int)uVar50 < iVar40) {
      local_160 = (int *)((long)local_108 * (ulong)uVar50);
      iVar19 = -0x10;
      do {
        local_f4 = fVar100;
        puVar27 = local_1b0;
        if (puVar39 == (uint *)0x0) {
          while( true ) {
            bVar49 = iVar19 == 0x10;
            iVar44 = iVar19 + 1;
            if (bVar49) {
              iVar44 = iVar19;
            }
            uVar51 = iVar19 + (int)puVar43;
            if (((int)uVar51 < iVar40) && (-1 < (int)(uVar51 | uVar50))) break;
            if ((iVar19 == 0x10) || (iVar19 = iVar44, 0x10 < iVar44)) {
              puVar39 = (uint *)0x0;
              goto joined_r0x00014552c68d;
            }
          }
          uVar52 = iVar19 * iVar19 + (int)fVar98 * (int)fVar98;
        }
        else {
          while( true ) {
            bVar49 = iVar19 == 0x10;
            iVar44 = iVar19 + 1;
            if (bVar49) {
              iVar44 = iVar19;
            }
            uVar51 = iVar19 + (int)puVar43;
            if ((((int)uVar51 < iVar40) && (-1 < (int)(uVar51 | uVar50))) &&
               (uVar52 = iVar19 * iVar19 + (int)fVar98 * (int)fVar98, (int)uVar52 < (int)puVar30))
            break;
            if ((iVar19 == 0x10) || (iVar19 = iVar44, 0x10 < iVar44)) {
              puVar39 = (uint *)0x1;
              goto joined_r0x00014552c68d;
            }
          }
        }
        puVar27 = (uint *)((ulong)uVar51 + (long)local_160);
        if (puVar48 < puVar27) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        if (puVar48 <= puVar27) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        uVar51 = local_110[(long)puVar27];
        uVar53 = local_110[(long)((long)puVar27 + 1)];
        uVar46 = (ulong)uVar53;
        if ((uVar53 < uVar51) || (local_130 < uVar46)) {
          func_0x000145903d40();
          goto LAB_14552cb82;
        }
        if (uVar51 != uVar53) {
          lVar21 = local_138 + uVar46 * 8;
          uVar46 = uVar46 * 8 + (ulong)uVar51 * -8;
          lVar38 = local_138 + (ulong)uVar51 * 8;
LAB_14552c5a0:
          uVar46 = uVar46 - 8;
          lVar25 = lVar38 + 8;
          fVar120 = *(float *)(lVar38 + 4);
          fVar80 = (float)((uint)(fVar120 - local_114) & _DAT_145915780);
          local_1a8 = puVar39;
          if (_DAT_14673ded0 < fVar80) goto code_r0x00014552c5bd;
          if (lVar25 != lVar21) {
            uVar41 = 0;
            do {
              fVar66 = *(float *)(lVar38 + 0xc + uVar41 * 8);
              fVar67 = (float)((uint)(fVar66 - local_114) & _DAT_145915780);
              fVar99 = fVar80;
              fVar59 = fVar120;
              if ((fVar67 <= _DAT_14673ded0) &&
                 (fVar99 = fVar67, fVar59 = fVar66,
                 (int)((uint)((int)fVar80 >> 0x1f) >> 1 ^ (uint)fVar80) <= (int)fVar67)) {
                fVar99 = fVar80;
                fVar59 = fVar120;
              }
              fVar120 = fVar59;
              uVar41 = uVar41 + 1;
              fVar80 = fVar99;
            } while (uVar46 >> 3 != uVar41);
          }
          puVar30 = (uint *)(ulong)uVar52;
          puVar39 = (uint *)0x1;
          local_1b0 = puVar27;
          fVar66 = fVar120;
        }
LAB_14552c63d:
        iVar19 = iVar44;
        puVar27 = local_1b0;
      } while (!bVar49 && iVar44 < 0x11);
    }
joined_r0x00014552c68d:
    local_1b0 = puVar27;
  } while ((fVar98 != 2.24208e-44) && (fVar98 = fVar100, (int)fVar100 < 0x11));
  if (puVar39 != (uint *)0x1) {
    *local_1b8 = local_100;
    local_1b8[1] = local_128;
    local_1b8[2] = local_100;
    local_1b8[3] = local_108;
    local_1b8[4] = CONCAT44(fVar96,fVar54);
    puVar32 = local_1b8;
LAB_14552c962:
    if (local_1a0 != (undefined1 *)0x0) {
      func_0x0001400021d0();
    }
    if ((local_248._8_8_ != 0) &&
       (local_248._8_8_ + (local_248._8_8_ * 4 + 0x13U & 0xfffffffffffffff0) != -0x11)) {
      func_0x0001400021d0();
    }
    if (local_140 != 0) {
      func_0x0001400021d0();
    }
    return puVar32;
  }
  if (local_100 <= puVar27) {
    func_0x000145903b33((ulong)uVar50,puVar27,local_100,puVar27,0x146d34f90);
    goto LAB_14552cb82;
  }
  local_128[(long)puVar27] = fVar66;
  func_0x000140002200();
  puVar30 = (uint *)func_0x0001400021c0();
  if (puVar30 != (uint *)0x0) {
    local_198 = 1;
    puStack_190 = puVar30;
    *(uint **)puVar30 = puVar27;
    local_188 = 0;
    lStack_180 = 1;
    ppuVar34 = &local_2a0;
LAB_14552c735:
    do {
      uVar46 = local_188;
      if (lStack_180 == 0) {
        *local_1b8 = puVar45;
        local_1b8[1] = local_128;
        local_1b8[2] = puVar45;
        local_1b8[3] = local_108;
        local_1b8[4] = CONCAT44(fVar96,fVar54);
        puVar32 = local_1b8;
        if (local_198 != 0) {
          func_0x0001400021d0();
        }
        goto LAB_14552c962;
      }
      uVar41 = local_198;
      if (local_188 + 1 < local_198) {
        uVar41 = 0;
      }
      local_188 = (local_188 - uVar41) + 1;
      lStack_180 = lStack_180 + -1;
      if (local_108 == (uint *)0x0) {
        func_0x000145903e30();
        goto LAB_14552cb82;
      }
      puVar30 = *(uint **)(puStack_190 + uVar46 * 2);
      if (puVar45 <= puVar30) {
        func_0x000145903b33();
        goto LAB_14552cb82;
      }
      if (((ulong)puVar30 | (ulong)local_108) >> 0x20 == 0) {
        uVar46 = ((ulong)puVar30 & 0xffffffff) / ((ulong)local_108 & 0xffffffff);
        uVar41 = ((ulong)puVar30 & 0xffffffff) % ((ulong)local_108 & 0xffffffff);
      }
      else {
        uVar46 = (ulong)puVar30 / (ulong)local_108;
        uVar41 = (ulong)puVar30 % (ulong)local_108;
      }
      local_2a0 = (uint *)((long)puVar30 + -1);
      uStack_298 = (ulong)((uint *)(uVar41 + 1) < local_108);
      local_290 = (undefined1 *)((long)puVar30 + 1);
      local_288 = (ulong)(local_108 <= puVar30);
      local_280 = (long)puVar30 - (long)local_108;
      local_278 = (ulong)((uint *)(uVar46 + 1) < local_108);
      local_270 = (undefined1 *)((long)puVar30 + (long)local_108);
      lVar21 = 0;
      while (puVar45 = local_100, lVar21 != 4) {
        ppuVar24 = ppuVar34 + lVar21 * 2;
        while (*(int *)(ppuVar24 + -1) != 1) {
          lVar21 = lVar21 + 1;
          ppuVar24 = ppuVar24 + 2;
          if (lVar21 == 4) goto LAB_14552c735;
        }
        puVar30 = *ppuVar24;
        if (local_100 <= puVar30) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        lVar21 = lVar21 + 1;
        if (NAN((float)local_128[(long)puVar30])) {
          iVar40 = func_0x0001455244e0();
          if (iVar40 == 1) {
            local_128[(long)puVar30] = extraout_XMM0_Da;
            func_0x00014546d100();
          }
        }
      }
    } while( true );
  }
  func_0x00014590379b();
LAB_14552cb82:
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
code_r0x00014552b84a:
  local_110 = *(int **)(puVar45 + 0xe) + *(long *)(puVar45 + 0x10) * 0xe;
  piVar47 = *(int **)(puVar45 + 0xe);
LAB_14552b85c:
  cVar18 = func_0x00014546cf80();
  piVar22 = piVar47 + 0xe;
  if (cVar18 == '\0') {
    local_160 = piVar47 + 0xe;
    func_0x000145682320();
    if (local_2c0 == 0xffffffffffffffff) {
      func_0x0001456f8fa0();
      piVar22 = local_160;
    }
    else {
      puStack_190 = (uint *)CONCAT44(uStack_2b4,uStack_2b8);
      local_178 = local_2a0;
      uStack_170 = uStack_298;
      local_188 = local_2b0;
      lStack_180 = lStack_2a8;
      local_198 = local_2c0;
      local_1e0 = piVar47[8];
      local_1e8 = *(undefined8 *)(piVar47 + 6);
      local_1c0 = (uint *)CONCAT44(local_1c0._4_4_,piVar47[0xb]);
      local_1c8 = *(undefined8 *)(piVar47 + 9);
      local_158 = param_3;
      local_150 = puStack_190;
      func_0x000145530130();
      uVar46 = (uStack_170 / 3) * 3;
      local_128 = (undefined4 *)CONCAT44(uStack_2b4,uStack_2b8);
      local_1a8 = local_178;
      puVar45 = local_178;
      while (2 < uVar46) {
        uVar46 = uVar46 - 3;
        uVar41 = (ulong)*puVar45;
        if (local_2b0 <= uVar41) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        local_1f0 = local_128[uVar41 * 3 + 2];
        local_1f8 = *(undefined8 *)(local_128 + uVar41 * 3);
        uVar41 = (ulong)puVar45[1];
        if (local_2b0 <= uVar41) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        local_200 = local_128[uVar41 * 3 + 2];
        local_208 = *(undefined8 *)(local_128 + uVar41 * 3);
        uVar41 = (ulong)puVar45[2];
        if (local_2b0 <= uVar41) {
          func_0x000145903b33();
          goto LAB_14552cb82;
        }
        local_210 = local_128[uVar41 * 3 + 2];
        local_218 = *(undefined8 *)(local_128 + uVar41 * 3);
        local_1c8 = CONCAT44(fVar96,fVar54);
        local_1c0 = local_108;
        func_0x000145530800();
        puVar45 = puVar45 + 3;
      }
      if (local_2c0 != 0) {
        func_0x0001400021d0();
      }
      if (local_198 != 0) {
        func_0x0001400021d0();
      }
      piVar22 = local_160;
      param_3 = local_158;
      if (lStack_180 != 0) {
        func_0x0001400021d0();
        piVar22 = local_160;
      }
    }
  }
  goto LAB_14552b81a;
code_r0x00014552c5bd:
  lVar38 = lVar25;
  if (lVar25 == lVar21) goto LAB_14552c63d;
  goto LAB_14552c5a0;
}
