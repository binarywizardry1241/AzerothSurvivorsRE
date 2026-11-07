
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5
          ,ulong *param_6,undefined8 *param_7,undefined8 param_8,ulong param_9)

{
  undefined8 *puVar1;
  float *pfVar2;
  undefined8 *puVar3;
  undefined4 *puVar4;
  undefined8 uVar5;
  ushort uVar6;
  long *plVar7;
  char cVar8;
  byte bVar9;
  int iVar10;
  long lVar11;
  double *pdVar12;
  ulong uVar13;
  ulong uVar14;
  byte bVar15;
  long *plVar16;
  long lVar17;
  long lVar18;
  undefined8 extraout_RDX;
  float fVar19;
  int iVar20;
  ulong uVar21;
  ulong *puVar22;
  uint uVar23;
  ulong uVar24;
  ulong uVar25;
  long lVar26;
  byte bVar27;
  long lVar28;
  long *plVar29;
  char cVar30;
  undefined1 uVar31;
  uint uVar32;
  long lVar33;
  ulong *puVar34;
  bool bVar35;
  float fVar36;
  float extraout_XMM0_Da;
  undefined8 extraout_XMM0_Qa;
  undefined1 auVar37 [16];
  undefined8 extraout_XMM0_Qb;
  undefined8 extraout_XMM0_Qb_00;
  undefined1 auVar38 [16];
  undefined8 extraout_XMM1_Qa;
  float fVar40;
  undefined1 auVar39 [16];
  float fVar41;
  undefined4 in_XMM6_Da;
  undefined8 in_XMM7_Qa;
  undefined1 auVar42 [16];
  undefined1 auVar45 [12];
  undefined1 auVar43 [16];
  undefined1 auVar44 [16];
  float fVar46;
  float fVar47;
  float fVar48;
  undefined4 uVar49;
  float fVar50;
  float fVar51;
  undefined4 uVar52;
  double dVar53;
  undefined4 uVar54;
  undefined4 uVar55;
  undefined4 uVar56;
  float fVar57;
  undefined4 uVar58;
  undefined4 uVar59;
  undefined4 uVar60;
  undefined1 auVar61 [16];
  undefined1 auVar62 [16];
  undefined1 auVar63 [16];
  undefined1 in_stack_00000028;
  char in_stack_00000030;
  char in_stack_00000038;
  ulong local_2a8;
  ulong uStack_2a0;
  undefined8 local_298;
  undefined8 local_290 [2];
  long local_280;
  ulong *local_278;
  long local_270;
  ulong local_268;
  ulong uStack_260;
  undefined8 local_258;
  undefined8 local_248;
  undefined1 *local_240;
  undefined8 local_238;
  float local_230;
  undefined4 local_22c;
  ulong *local_228;
  ulong local_220 [2];
  long local_210;
  ulong local_208;
  float local_200;
  ulong *local_1f8;
  long local_1f0;
  undefined8 local_1e8;
  ulong *local_1e0;
  float local_1d8;
  float fStack_1d4;
  float local_1d0;
  float fStack_1cc;
  float local_1c8;
  undefined4 local_1c4;
  undefined1 local_1c0;
  char local_1bf;
  long local_1b8;
  undefined4 local_1b0;
  undefined4 uStack_1ac;
  float fStack_1a8;
  undefined4 uStack_1a4;
  undefined8 local_1a0;
  undefined8 uStack_198;
  undefined8 local_190;
  long *local_188;
  ulong *local_180;
  undefined8 local_178;
  float fStack_170;
  float fStack_16c;
  float fStack_168;
  float fStack_164;
  float fStack_160;
  undefined1 uStack_15c;
  undefined1 uStack_15b;
  char cStack_15a;
  char cStack_159;
  undefined1 local_158;
  undefined1 uStack_157;
  undefined2 uStack_156;
  float fStack_154;
  uint uStack_150;
  undefined8 uStack_14c;
  undefined4 local_144;
  undefined8 local_140;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined4 uStack_130;
  undefined8 uStack_12c;
  ulong local_118;
  ulong local_110;
  float local_108;
  ulong *local_100;
  undefined1 local_f6;
  undefined1 local_f5;
  undefined1 local_f4;
  undefined1 local_f3;
  undefined1 local_f2;
  undefined1 local_f1;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined8 local_d8;

  fVar51 = fStack_154;
  local_f0 = 0xfffffffffffffffe;
  if (*(char *)((long)param_7 + 0x95f) != '\x01') {
    return;
  }
  fVar48 = *(float *)((long)param_7 + 0x8e4);
  lVar33 = param_7[0x99];
  lVar11 = param_7[0x9a] * 0x160;
  lVar17 = 0;
  lVar28 = lVar33;
  do {
    uVar24 = param_9;
    fVar47 = _DAT_1458eb480;
    if (lVar11 - lVar17 == 0) goto LAB_1454c3398;
    lVar17 = lVar17 + 0x160;
    puVar1 = (undefined8 *)(lVar28 + 0x88);
    lVar28 = lVar28 + 0x160;
  } while ((ulong *)*puVar1 != param_6);
  if ((((*(float *)(lVar33 + -0x1c + lVar17) <= fVar48) &&
       (*(float *)(lVar33 + -0xc4 + lVar17) <= fVar48)) &&
      (*(float *)(lVar33 + -0x10 + lVar17) <= fVar48)) || (uVar25 = param_7[0xda], uVar25 == 0)) {
    if (*(long *)(lVar33 + -0x148 + lVar17) == -1) goto LAB_1454c3070;
LAB_1454c3078:
    uVar25 = param_7[0xda];
    fVar46 = _DAT_1458f667c;
    if (uVar25 != 0) {
      lVar28 = param_7[0xd9];
      if (uVar25 == 1) {
        uVar24 = 0;
      }
      else {
        uVar24 = 0;
        do {
          if (*(char *)(lVar28 + uVar24 * 8) == '\x13') {
            fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          else {
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          if (cVar30 == '\x13') {
            fVar46 = fVar46 + *(float *)(lVar28 + 0xc + uVar24 * 8);
          }
          uVar24 = uVar24 + 2;
        } while ((uVar25 & 0xfffffffffffffffe) != uVar24);
        if ((uVar25 & 1) == 0) goto LAB_1454c315c;
      }
      if (*(char *)(lVar28 + uVar24 * 8) == '\x13') {
        fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
      }
    }
LAB_1454c315c:
    fVar47 = fVar47 + fVar46;
    fVar46 = *(float *)(lVar33 + -0x6c + lVar17) * _DAT_14590ae44;
    pfVar2 = (float *)(lVar33 + -0x70 + lVar17);
    if (fVar46 < *pfVar2 || fVar46 == *pfVar2) goto LAB_1454c317c;
LAB_1454c30bc:
    uVar25 = param_7[0xda];
    fVar46 = _DAT_1458f667c;
    if (uVar25 != 0) {
      lVar28 = param_7[0xd9];
      if (uVar25 == 1) {
        uVar24 = 0;
      }
      else {
        uVar24 = 0;
        do {
          if (*(char *)(lVar28 + uVar24 * 8) == '\x14') {
            fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          else {
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          if (cVar30 == '\x14') {
            fVar46 = fVar46 + *(float *)(lVar28 + 0xc + uVar24 * 8);
          }
          uVar24 = uVar24 + 2;
        } while ((uVar25 & 0xfffffffffffffffe) != uVar24);
        if ((uVar25 & 1) == 0) goto LAB_1454c32ac;
      }
      if (*(char *)(lVar28 + uVar24 * 8) == '\x14') {
        fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
      }
    }
LAB_1454c32ac:
    fVar47 = fVar47 + fVar46;
    if (*(long *)(lVar33 + -0x150 + lVar17) != 0) goto LAB_1454c318b;
LAB_1454c32c0:
    fVar46 = *(float *)(lVar33 + -0xb4 + lVar17);
  }
  else {
    lVar28 = param_7[0xd9];
    fVar46 = _DAT_1458f667c;
    if (uVar25 == 1) {
      uVar24 = 0;
LAB_1454c304e:
      if (*(char *)(lVar28 + uVar24 * 8) == '\x12') {
        fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
      }
    }
    else {
      uVar24 = 0;
      do {
        if (*(char *)(lVar28 + uVar24 * 8) == '\x12') {
          fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
          cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
        }
        else {
          cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
        }
        if (cVar30 == '\x12') {
          fVar46 = fVar46 + *(float *)(lVar28 + 0xc + uVar24 * 8);
        }
        uVar24 = uVar24 + 2;
      } while ((uVar25 & 0xfffffffffffffffe) != uVar24);
      if ((uVar25 & 1) != 0) goto LAB_1454c304e;
    }
    fVar47 = fVar46 + _DAT_1458eb480;
    if (*(long *)(lVar33 + -0x148 + lVar17) != -1) goto LAB_1454c3078;
LAB_1454c3070:
    if (*(char *)(lVar33 + -8 + lVar17) == '\x01') goto LAB_1454c3078;
    fVar46 = *(float *)(lVar33 + -0x6c + lVar17) * _DAT_14590ae44;
    pfVar2 = (float *)(lVar33 + -0x70 + lVar17);
    if (*pfVar2 <= fVar46 && fVar46 != *pfVar2) goto LAB_1454c30bc;
LAB_1454c317c:
    if (*(long *)(lVar33 + -0x150 + lVar17) == 0) goto LAB_1454c32c0;
LAB_1454c318b:
    uVar25 = param_7[0xda];
    fVar46 = _DAT_1458f667c;
    if (uVar25 != 0) {
      lVar28 = param_7[0xd9];
      if (uVar25 == 1) {
        uVar24 = 0;
      }
      else {
        uVar24 = 0;
        do {
          if (*(char *)(lVar28 + uVar24 * 8) == '\x15') {
            fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          else {
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          if (cVar30 == '\x15') {
            fVar46 = fVar46 + *(float *)(lVar28 + 0xc + uVar24 * 8);
          }
          uVar24 = uVar24 + 2;
        } while ((uVar25 & 0xfffffffffffffffe) != uVar24);
        if ((uVar25 & 1) == 0) goto LAB_1454c321c;
      }
      if (*(char *)(lVar28 + uVar24 * 8) == '\x15') {
        fVar46 = fVar46 + *(float *)(lVar28 + 4 + uVar24 * 8);
      }
    }
LAB_1454c321c:
    fVar47 = fVar47 + fVar46;
    fVar46 = *(float *)(lVar33 + -0xb4 + lVar17);
  }
  if (fVar48 < fVar46) {
    fVar47 = fVar47 + *(float *)(lVar33 + -0xb8 + lVar17);
  }
  if (0.0 < *(float *)((long)param_7 + 0x404)) {
    uVar25 = param_7[0xda];
    fVar48 = _DAT_1458f667c;
    if (uVar25 != 0) {
      lVar28 = param_7[0xd9];
      if (uVar25 == 1) {
        uVar24 = 0;
      }
      else {
        uVar24 = 0;
        do {
          if (*(char *)(lVar28 + uVar24 * 8) == '\x1c') {
            fVar48 = fVar48 + *(float *)(lVar28 + 4 + uVar24 * 8);
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          else {
            cVar30 = *(char *)(lVar28 + 8 + uVar24 * 8);
          }
          if (cVar30 == '\x1c') {
            fVar48 = fVar48 + *(float *)(lVar28 + 0xc + uVar24 * 8);
          }
          uVar24 = uVar24 + 2;
        } while ((uVar25 & 0xfffffffffffffffe) != uVar24);
        if ((uVar25 & 1) == 0) goto LAB_1454c338c;
      }
      if (*(char *)(lVar28 + uVar24 * 8) == '\x1c') {
        fVar48 = fVar48 + *(float *)(lVar28 + 4 + uVar24 * 8);
      }
    }
LAB_1454c338c:
    fVar47 = fVar47 + fVar48;
  }
  fVar47 = fVar47 + *(float *)(lVar33 + -0x24 + lVar17);
LAB_1454c3398:
  if (param_7[0x9a] == 0) {
    return;
  }
  lVar28 = 0;
  while ((*(ulong **)(lVar33 + 0x88 + lVar28) != param_6 || (*(int *)(lVar33 + 0x68 + lVar28) == 1))
        ) {
    lVar28 = lVar28 + 0x160;
    if (lVar11 - lVar28 == 0) {
      return;
    }
  }
  fVar48 = fVar47 * param_3;
  if (fVar47 * param_3 <= _DAT_1458eb480) {
    fVar48 = _DAT_1458eb480;
  }
  fVar47 = *(float *)(lVar33 + 0xf0 + lVar28);
  fVar46 = *(float *)(lVar33 + 0x128 + lVar28);
  fVar19 = fVar47;
  if (fVar47 <= 0.0) {
    fVar19 = 0.0;
  }
  *(float *)(lVar33 + 0xf0 + lVar28) = fVar47 - fVar48;
  if (fVar46 <= 0.0) {
    auVar61._0_8_ = *(undefined8 *)(lVar33 + 0x118 + lVar28);
    fVar46 = (float)auVar61._0_8_;
    fVar50 = (float)((ulong)auVar61._0_8_ >> 0x20);
    fVar47 = *(float *)(lVar33 + 0x120 + lVar28);
  }
  else {
    fVar46 = (*(float *)((long)param_7 + 0x8e4) - *(float *)(lVar33 + 0x124 + lVar28)) / fVar46;
    fVar47 = 0.0;
    if (0.0 <= fVar46) {
      fVar47 = fVar46;
    }
    fVar36 = _DAT_1458eb480;
    if (fVar47 <= _DAT_1458eb480) {
      fVar36 = fVar47;
    }
    auVar61._0_8_ = *(undefined8 *)(lVar33 + 0x10c + lVar28);
    uVar5 = *(undefined8 *)(lVar33 + 0x118 + lVar28);
    fVar46 = (float)auVar61._0_8_;
    fVar50 = (float)((ulong)auVar61._0_8_ >> 0x20);
    fVar46 = fVar36 * ((float)uVar5 - fVar46) + fVar46;
    fVar50 = fVar36 * ((float)((ulong)uVar5 >> 0x20) - fVar50) + fVar50;
    fVar47 = *(float *)(lVar33 + 0x114 + lVar28);
    fVar47 = (*(float *)(lVar33 + 0x120 + lVar28) - fVar47) * fVar36 + fVar47;
  }
  fVar36 = fVar48;
  if (fVar19 <= fVar48) {
    fVar36 = fVar19;
  }
  auVar61 = ZEXT416((uint)fVar36);
  lVar11 = *(long *)(lVar33 + 0x18 + lVar28);
  dVar53 = (double)fVar48;
  param_7[0xc2] = (double)param_7[0xc2] + dVar53;
  local_178 = param_7 + 199;
  lVar17 = param_7[199];
  fVar19 = (float)param_9;
  fStack_154 = (float)((ulong)local_178 >> 0x20);
  if (lVar17 != 0) {
    lVar18 = param_7[200];
    do {
      uVar25 = (ulong)*(ushort *)(lVar17 + 0x8e);
      lVar26 = (ulong)*(ushort *)(lVar17 + 0x8e) << 2;
      uVar21 = 0xffffffffffffffff;
      do {
        fStack_170 = (float)lVar17;
        fStack_16c = (float)((ulong)lVar17 >> 0x20);
        uVar24 = uVar25;
        if (lVar26 == 0) goto LAB_1454c351d;
        fVar36 = *(float *)(lVar17 + 100 + uVar21 * 4);
        bVar27 = ((uint)fVar36 < (uint)fVar19) - ((uint)fVar19 < (uint)fVar36);
        uVar21 = uVar21 + 1;
        lVar26 = lVar26 + -4;
      } while (bVar27 == 1);
      uVar24 = (ulong)bVar27;
      uVar25 = uVar21;
      if (bVar27 == 0) {
        fStack_168 = (float)lVar18;
        fStack_164 = (float)((ulong)lVar18 >> 0x20);
        fStack_160 = (float)uVar21;
        uStack_15c = (undefined1)(uVar21 >> 0x20);
        uStack_15b = (undefined1)(uVar21 >> 0x28);
        cStack_15a = (char)(uVar21 >> 0x30);
        cStack_159 = (char)(uVar21 >> 0x38);
        local_158 = SUB81(local_178,0);
        uStack_157 = (undefined1)((ulong)local_178 >> 8);
        uStack_156 = (undefined2)((ulong)local_178 >> 0x10);
        local_178 = (undefined8 *)0x0;
        goto LAB_1454c3572;
      }
LAB_1454c351d:
      bVar35 = lVar18 == 0;
      lVar18 = lVar18 + -1;
      if (bVar35) goto LAB_1454c4859;
      lVar17 = *(long *)(lVar17 + 0x90 + uVar25 * 8);
    } while( true );
  }
  fStack_170 = 0.0;
  fStack_16c = 0.0;
LAB_1454c356c:
  local_158 = (undefined1)param_9;
  uStack_157 = (undefined1)(param_9 >> 8);
  uStack_156 = (undefined2)(param_9 >> 0x10);
  fStack_154 = fVar51;
LAB_1454c3572:
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Qa;
  pdVar12 = (double *)func_0x000145427860();
  *pdVar12 = dVar53 + *pdVar12;
  fVar51 = *(float *)(lVar33 + 0xf0 + lVar28);
  func_0x000145756e6d();
  auVar42._8_8_ = auVar61._8_8_;
  auVar42._0_8_ = (double)auVar61._0_4_;
  auVar61 = func_0x00014548f030();
  func_0x0001454eff80(auVar61._0_8_,auVar61._8_8_,auVar42._0_4_);
  if (lVar11 != -1) {
    if (*(int *)((long)param_7 + 0x654) != 0) {
      *(undefined4 *)(param_7 + 0xca) = *(undefined4 *)((long)param_7 + 0x8e4);
      *(undefined4 *)((long)param_7 + 0x654) = 0;
      lVar28 = param_7[0xc1];
      param_7[0xc1] = 0;
      if (lVar28 != 0) {
        lVar33 = param_7[0xc0] + 8;
        do {
          if ((*(long *)(lVar33 + -8) != -1) && (*(long *)(lVar33 + -8) != 0)) {
            func_0x0001400021d0();
          }
          lVar33 = lVar33 + 0x38;
          lVar28 = lVar28 + -1;
        } while (lVar28 != 0);
      }
    }
    auVar61 = func_0x00014548f030();
    func_0x0001454eff80(auVar61._0_8_,auVar61._8_8_,auVar42._0_4_);
  }
  if (fVar19 != 0.0 && in_stack_00000038 == '\0') {
    if (fVar19 == 2.2474e-41) {
      uVar24 = 0x209d;
    }
    else if (fVar19 == 1.98788e-41) {
      uVar24 = 0x832;
    }
    else {
      uVar24 = param_9 & 0xffffffff;
      if (fVar19 == 7.43809e-42) {
        uVar24 = 0x50a7;
      }
    }
    func_0x000145444a90();
    lVar28 = param_7[0xa9];
    if (lVar28 == param_7[0xa7]) {
      func_0x0001457580b0();
    }
    lVar33 = param_7[0xa8];
    puVar1 = (undefined8 *)(lVar33 + 0x10 + lVar28 * 0x20);
    *puVar1 = CONCAT44(fStack_164,fStack_168);
    puVar1[1] = CONCAT17(cStack_159,
                         CONCAT16(cStack_15a,CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160))));
    puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
    *puVar1 = local_178;
    puVar1[1] = CONCAT44(fStack_16c,fStack_170);
    param_7[0xa9] = lVar28 + 1;
  }
  local_290[0] = 0;
  local_280 = 0;
  local_178 = local_290;
  fStack_170 = 0.0;
  fStack_16c = 0.0;
  fStack_168 = 0.0;
  fStack_164 = 0.0;
  local_158 = 0x16;
  uStack_157 = 0;
  uStack_156 = 0;
  fStack_154 = 0.0;
  func_0x000145427a50();
  local_230 = 0.0;
  local_248 = 0;
  local_240 = (undefined1 *)0x1;
  local_238 = 0;
  if (local_280 != 0) {
    local_f3 = 1;
    func_0x0001458e7110();
    *local_240 = 0;
    local_238 = 1;
    local_f3 = 1;
    func_0x000145509090();
    local_f3 = 1;
    func_0x000145500460();
    local_230 = (float)((int)local_230 + 1);
  }
  fStack_168 = (float)local_238;
  fStack_164 = (float)((ulong)local_238 >> 0x20);
  fStack_160 = local_230;
  uStack_15c = (undefined1)local_22c;
  uStack_15b = (undefined1)((uint)local_22c >> 8);
  cStack_15a = (char)((uint)local_22c >> 0x10);
  cStack_159 = (char)((uint)local_22c >> 0x18);
  local_178._0_4_ = (float)local_248;
  local_178._4_4_ = (float)((ulong)local_248 >> 0x20);
  fStack_170 = SUB84(local_240,0);
  fStack_16c = (float)((ulong)local_240 >> 0x20);
  local_f3 = 0;
  func_0x0001454ffad0();
  lVar28 = param_7[0xa9];
  if (lVar28 == param_7[0xa7]) {
    func_0x0001457580b0();
  }
  lVar33 = param_7[0xa8];
  puVar22 = (ulong *)(lVar33 + 0x10 + lVar28 * 0x20);
  *puVar22 = local_1a0;
  puVar22[1] = uStack_198;
  puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
  *puVar1 = CONCAT44(uStack_1ac,local_1b0);
  puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
  param_7[0xa9] = lVar28 + 1;
  fVar36 = (float)func_0x0001454b03e0();
  fVar57 = 0.0;
  if (0.0 < fVar36) {
    fVar41 = *(float *)(param_7 + 0x80);
    fVar40 = *(float *)(param_7 + 0x8b);
    auVar42 = ZEXT416((uint)fVar40);
    fVar36 = fVar48 * fVar36 + fVar41;
    fVar48 = fVar36;
    if (fVar40 <= fVar36) {
      fVar48 = fVar40;
    }
    fVar48 = (float)(~-(uint)NAN(fVar48) & (uint)fVar48 | (uint)fVar36 & -(uint)NAN(fVar48));
    *(float *)(param_7 + 0x80) = fVar48;
    fVar48 = fVar48 - fVar41;
    if (0.0 < fVar48) {
      local_f3 = 0;
      lVar28 = func_0x000145452400();
      auVar61._0_8_ = extraout_RDX;
      if (lVar28 == 0) {
        auVar61._0_8_ = 5;
        lVar28 = 0x1469aafd0;
      }
      local_178._0_4_ = -NAN;
      local_178._4_4_ = -NAN;
      fStack_170 = (float)lVar28;
      fStack_16c = (float)((ulong)lVar28 >> 0x20);
      fStack_168 = (float)auVar61._0_8_;
      fStack_164 = (float)((ulong)auVar61._0_8_ >> 0x20);
      fStack_160 = 19799.916;
      uStack_15c = 1;
      uStack_15b = 0;
      cStack_15a = '\0';
      cStack_159 = '\0';
      local_158 = 0x18;
      uStack_157 = 0;
      uStack_156 = 0;
      fStack_154 = 0.0;
      uStack_150 = uStack_150 & 0xffffff00;
      local_f3 = 0;
      func_0x0001454eff80(extraout_XMM0_Qa,extraout_XMM1_Qa,SUB84((double)fVar48,0));
      auVar42 = ZEXT816(0);
    }
    fVar36 = 0.0;
    fVar48 = (float)func_0x000145756e6d();
    uVar58 = (int)(long)fVar48;
    if (fVar48 < fVar36) {
      uVar58 = 0;
    }
    uVar59 = 0xffffffff;
    if (fVar48 <= _DAT_1458eb51c) {
      uVar59 = uVar58;
    }
    plVar29 = param_7 + 0x117;
    lVar28 = param_7[0x117];
    if (lVar28 != 0) {
      lVar33 = param_7[0x118];
      do {
        uVar24 = (ulong)*(ushort *)(lVar28 + 0x36);
        uVar21 = (ulong)((uint)*(ushort *)(lVar28 + 0x36) * 2);
        uVar25 = 0xffffffffffffffff;
        do {
          if (uVar21 == 0) goto LAB_1454c3a4e;
          uVar6 = *(ushort *)(lVar28 + 0x3a + uVar25 * 2);
          uVar25 = uVar25 + 1;
          uVar21 = uVar21 - 2;
        } while ((char)((uVar6 < 0x16) - (0x16 < uVar6)) == '\x01');
        uVar24 = uVar25;
        if (uVar6 < 0x16 == 0x16 < uVar6) {
          *(undefined4 *)(lVar28 + 8 + uVar25 * 4) = uVar59;
          goto LAB_1454c3aaa;
        }
LAB_1454c3a4e:
        bVar35 = lVar33 == 0;
        lVar33 = lVar33 + -1;
        if (bVar35) goto LAB_1454c3a64;
        lVar28 = *(long *)(lVar28 + 0x50 + uVar24 * 8);
      } while( true );
    }
    lVar28 = 0;
LAB_1454c3a64:
    fStack_170 = (float)lVar28;
    fStack_16c = (float)((ulong)lVar28 >> 0x20);
    fStack_168 = 0.0;
    fStack_164 = 0.0;
    fStack_160 = (float)uVar24;
    uStack_15c = (undefined1)(uVar24 >> 0x20);
    uStack_15b = (undefined1)(uVar24 >> 0x28);
    cStack_15a = (char)(uVar24 >> 0x30);
    cStack_159 = (char)(uVar24 >> 0x38);
    local_158 = 0x16;
    uStack_157 = 0;
    uStack_156 = 0;
    fStack_154 = 0.0;
    local_f3 = 0;
    local_178 = (ulong *)plVar29;
    func_0x000145427a50();
LAB_1454c3aaa:
    fVar48 = (float)func_0x000145756e6d();
    uVar58 = (int)(long)fVar48;
    if (fVar48 < 0.0) {
      uVar58 = 0;
    }
    uVar59 = 0xffffffff;
    if (fVar48 <= _DAT_1458eb51c) {
      uVar59 = uVar58;
    }
    lVar28 = *plVar29;
    if (lVar28 != 0) {
      lVar33 = param_7[0x118];
      do {
        uVar24 = (ulong)*(ushort *)(lVar28 + 0x36);
        uVar21 = (ulong)((uint)*(ushort *)(lVar28 + 0x36) * 2);
        uVar25 = 0xffffffffffffffff;
        do {
          if (uVar21 == 0) goto LAB_1454c3b2e;
          uVar6 = *(ushort *)(lVar28 + 0x3a + uVar25 * 2);
          uVar25 = uVar25 + 1;
          uVar21 = uVar21 - 2;
        } while ((char)((uVar6 < 0x1c) - (0x1c < uVar6)) == '\x01');
        uVar24 = uVar25;
        if (uVar6 < 0x1c == 0x1c < uVar6) {
          *(undefined4 *)(lVar28 + 8 + uVar25 * 4) = uVar59;
          goto LAB_1454c3b8a;
        }
LAB_1454c3b2e:
        bVar35 = lVar33 == 0;
        lVar33 = lVar33 + -1;
        if (bVar35) goto LAB_1454c3b44;
        lVar28 = *(long *)(lVar28 + 0x50 + uVar24 * 8);
      } while( true );
    }
    lVar28 = 0;
LAB_1454c3b44:
    fStack_170 = (float)lVar28;
    fStack_16c = (float)((ulong)lVar28 >> 0x20);
    fStack_168 = 0.0;
    fStack_164 = 0.0;
    fStack_160 = (float)uVar24;
    uStack_15c = (undefined1)(uVar24 >> 0x20);
    uStack_15b = (undefined1)(uVar24 >> 0x28);
    cStack_15a = (char)(uVar24 >> 0x30);
    cStack_159 = (char)(uVar24 >> 0x38);
    local_158 = 0x1c;
    uStack_157 = 0;
    uStack_156 = 0;
    fStack_154 = 0.0;
    local_f3 = 0;
    local_178 = (ulong *)plVar29;
    func_0x000145427a50();
  }
LAB_1454c3b8a:
  if (fVar57 < fVar51) {
    local_188 = (long *)0xffffffffffffffff;
  }
  else {
    lVar28 = param_7[0x99];
    lVar33 = param_7[0x9a];
    lVar17 = lVar33 * 0x160;
    lVar11 = lVar28 + -0x160;
    do {
      lVar18 = lVar11;
      if (lVar17 == 0) {
        local_188 = (long *)0xffffffffffffffff;
        goto LAB_1454c3c65;
      }
      lVar17 = lVar17 + -0x160;
      lVar11 = lVar18 + 0x160;
    } while (*(ulong **)(lVar18 + 0x1e8) != param_6);
    auVar42 = ZEXT416(*(uint *)(lVar18 + 0x254));
    local_f3 = 0;
    func_0x000145537d10();
    fStack_160 = auVar42._0_4_;
    uStack_15c = SUB41(fVar46,0);
    uStack_15b = (undefined1)((uint)fVar46 >> 8);
    cStack_15a = (char)((uint)fVar46 >> 0x10);
    cStack_159 = (char)((uint)fVar46 >> 0x18);
    local_158 = SUB41(fVar50,0);
    uStack_157 = (undefined1)((uint)fVar50 >> 8);
    uStack_156 = (undefined2)((uint)fVar50 >> 0x10);
    local_188 = (long *)local_178;
    local_1e8 = CONCAT44(fStack_16c,fStack_170);
    local_268 = CONCAT44(fStack_164,fStack_168);
    uStack_260 = CONCAT17(cStack_159,
                          CONCAT16(cStack_15a,CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160))))
    ;
    local_258 = CONCAT44(fVar47,fVar50);
    lVar28 = param_7[0x99];
    lVar33 = param_7[0x9a];
    fStack_154 = fVar47;
LAB_1454c3c65:
    fVar48 = *(float *)((long)param_7 + 0x8e4);
    lVar33 = lVar33 * 0x160;
    lVar28 = lVar28 + -0x160;
    do {
      lVar11 = lVar28;
      if (lVar33 == 0) goto LAB_1454c4d50;
      lVar33 = lVar33 + -0x160;
      lVar28 = lVar11 + 0x160;
    } while (*(ulong **)(lVar11 + 0x1e8) != param_6);
    fVar36 = *(float *)(lVar11 + 0x288);
    if (fVar36 <= 0.0) {
      local_108 = *(float *)(lVar11 + 0x280);
      local_110 = *(ulong *)(lVar11 + 0x278);
    }
    else {
      fVar41 = (fVar48 - *(float *)(lVar11 + 0x284)) / fVar36;
      fVar57 = 0.0;
      if (0.0 <= fVar41) {
        fVar57 = fVar41;
      }
      fVar41 = _DAT_1458eb480;
      if (fVar57 <= _DAT_1458eb480) {
        fVar41 = fVar57;
      }
      local_108 = (*(float *)(lVar11 + 0x280) - *(float *)(lVar11 + 0x274)) * fVar41 +
                  *(float *)(lVar11 + 0x274);
      fVar57 = (float)*(undefined8 *)(lVar11 + 0x26c);
      fVar40 = (float)((ulong)*(undefined8 *)(lVar11 + 0x26c) >> 0x20);
      local_110 = CONCAT44(fVar41 * ((float)((ulong)*(undefined8 *)(lVar11 + 0x278) >> 0x20) -
                                    fVar40) + fVar40,
                           fVar41 * ((float)*(undefined8 *)(lVar11 + 0x278) - fVar57) + fVar57);
    }
    if (fVar36 <= 0.0) {
      bVar35 = false;
    }
    else {
      bVar35 = fVar48 < fVar36 + *(float *)(lVar11 + 0x284);
    }
    *(float *)(lVar11 + 0x274) = local_108;
    *(ulong *)(lVar11 + 0x26c) = local_110;
    *(ulong *)(lVar11 + 0x278) = local_110;
    *(float *)(lVar11 + 0x280) = local_108;
    *(ulong *)(lVar11 + 0x284) = (ulong)(uint)fVar48;
    *(undefined4 *)(lVar11 + 0x1c8) = 1;
    *(float *)(lVar11 + 0x1cc) = fVar48;
    *(undefined8 *)(lVar11 + 0x170) = 0;
    if (*(long *)(lVar11 + 0x178) == -1) {
      local_118 = 0;
    }
    else {
      local_118 = *(ulong *)(lVar11 + 400);
    }
    lVar28 = *(long *)(lVar11 + 0x1a0);
    if (lVar28 != -1) {
      local_1f8 = *(ulong **)(lVar11 + 0x1b8);
    }
    local_1b8 = *(long *)(lVar11 + 0x1f0);
    cVar30 = *(char *)(lVar11 + 0x2b8);
    auVar62 = func_0x00014540d290();
    local_180 = auVar62._8_8_;
    local_100 = auVar62._0_8_;
    if (bVar35) {
      auVar42._8_8_ = 0;
      auVar42._0_8_ = (double)local_110;
      uVar24 = func_0x0001454627f0();
      fStack_1a8 = extraout_XMM0_Da;
      if ((uVar24 & 1) == 0) {
        fStack_1a8 = local_108;
      }
      local_1b0 = auVar42._0_4_;
      uStack_1ac = auVar42._4_4_;
      *(int *)(param_7 + 0x121) = *(int *)(param_7 + 0x121) + 1;
      func_0x0001454451b0();
      lVar33 = param_7[0xa9];
      if (lVar33 == param_7[0xa7]) {
        func_0x0001457580b0();
      }
      auVar62._8_8_ = local_180;
      auVar62._0_8_ = local_100;
      lVar11 = param_7[0xa8];
      puVar1 = (undefined8 *)(lVar11 + 0x10 + lVar33 * 0x20);
      *puVar1 = CONCAT44(fStack_164,fStack_168);
      puVar1[1] = CONCAT17(cStack_159,
                           CONCAT16(cStack_15a,CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160)))
                          );
      puVar1 = (undefined8 *)(lVar11 + lVar33 * 0x20);
      *puVar1 = local_178;
      puVar1[1] = CONCAT44(fStack_16c,fStack_170);
      param_7[0xa9] = lVar33 + 1;
    }
    local_180 = auVar62._8_8_;
    local_100 = auVar62._0_8_;
    local_220[0] = 0;
    local_210 = 0;
    local_178 = local_220;
    fStack_170 = 0.0;
    fStack_16c = 0.0;
    fStack_168 = 0.0;
    fStack_164 = 0.0;
    local_158 = 0x16;
    uStack_157 = 0;
    uStack_156 = 0;
    fStack_154 = 0.0;
    func_0x000145427a50();
    func_0x0001455002f0();
    local_1c8 = 0.0;
    local_1e0 = (ulong *)0x0;
    local_1d8 = 1.4013e-45;
    fStack_1d4 = 0.0;
    local_1d0 = 0.0;
    fStack_1cc = 0.0;
    if (local_210 != 0) {
      local_f1 = 1;
      func_0x0001458e7110();
      *(undefined1 *)CONCAT44(fStack_1d4,local_1d8) = 0;
      local_1d0 = 1.4013e-45;
      fStack_1cc = 0.0;
      local_f1 = 1;
      func_0x000145509090();
      local_f1 = 1;
      func_0x000145500460();
      local_1c8 = (float)((int)local_1c8 + 1);
    }
    fStack_168 = local_1d0;
    fStack_164 = fStack_1cc;
    fStack_160 = local_1c8;
    uStack_15c = (undefined1)local_1c4;
    uStack_15b = (undefined1)((uint)local_1c4 >> 8);
    cStack_15a = (char)((uint)local_1c4 >> 0x10);
    cStack_159 = (char)((uint)local_1c4 >> 0x18);
    local_178._0_4_ = SUB84(local_1e0,0);
    local_178._4_4_ = (float)((ulong)local_1e0 >> 0x20);
    fStack_170 = local_1d8;
    fStack_16c = fStack_1d4;
    local_f1 = 0;
    func_0x0001454ffad0();
    auVar45 = auVar42._4_12_;
    lVar33 = param_7[0xa9];
    if (lVar33 == param_7[0xa7]) {
      func_0x0001457580b0();
      auVar45 = auVar42._4_12_;
    }
    lVar11 = param_7[0xa8];
    puVar22 = (ulong *)(lVar11 + 0x10 + lVar33 * 0x20);
    *puVar22 = local_1a0;
    puVar22[1] = uStack_198;
    puVar1 = (undefined8 *)(lVar11 + lVar33 * 0x20);
    *puVar1 = CONCAT44(uStack_1ac,local_1b0);
    puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
    param_7[0xa9] = lVar33 + 1;
    *(int *)((long)param_7 + 0x65c) = *(int *)((long)param_7 + 0x65c) + 1;
    if (cVar30 != '\0') {
      *(int *)(param_7 + 0xcc) = *(int *)(param_7 + 0xcc) + 1;
    }
    fVar36 = *(float *)((long)param_7 + 0x494);
    uVar58 = 0;
    uVar59 = 0;
    uVar60 = 0;
    if (0.0 < fVar36) {
      local_f1 = 0;
      auVar63 = func_0x000145452400();
      fVar57 = *(float *)(param_7 + 0x80);
      fVar41 = *(float *)(param_7 + 0x8b);
      auVar61 = ZEXT416((uint)fVar41);
      fVar36 = fVar36 + fVar57;
      fVar40 = fVar36;
      if (fVar41 <= fVar36) {
        fVar40 = fVar41;
      }
      auVar37._4_4_ = uVar58;
      auVar37._0_4_ = (uint)fVar36 & -(uint)NAN(fVar40);
      auVar37._8_4_ = uVar59;
      auVar37._12_4_ = uVar60;
      auVar37 = ZEXT416(~-(uint)NAN(fVar40) & (uint)fVar40) | auVar37;
      *(float *)(param_7 + 0x80) = auVar37._0_4_;
      auVar39._4_12_ = auVar37._4_12_;
      auVar39._0_4_ = auVar37._0_4_ - fVar57;
      if (0.0 < auVar39._0_4_) {
        if (auVar63._0_8_ == 0) {
          auVar63._8_8_ = 0xf;
          auVar63._0_8_ = 0x1469ab852;
        }
        local_178._0_4_ = -NAN;
        local_178._4_4_ = -NAN;
        fStack_170 = auVar63._0_4_;
        fStack_16c = auVar63._4_4_;
        fStack_168 = auVar63._8_4_;
        fStack_164 = auVar63._12_4_;
        fStack_160 = 19804.19;
        uStack_15c = 1;
        uStack_15b = 0;
        cStack_15a = '\0';
        cStack_159 = '\0';
        local_158 = 0x16;
        uStack_157 = 0;
        uStack_156 = 0;
        fStack_154 = 0.0;
        uStack_150 = uStack_150 & 0xffffff00;
        local_f1 = 0;
        func_0x0001454eff80(auVar37._0_8_,auVar39._0_8_,SUB84((double)auVar39._0_4_,0));
        auVar61 = ZEXT816(0);
      }
      func_0x000145756e6d();
      local_f1 = 0;
      func_0x000145500230();
      func_0x000145756e6d();
      local_f1 = 0;
      func_0x000145500230();
      auVar45 = auVar61._4_12_;
    }
    if (local_118 == 0) {
      if (lVar28 == -1) {
        if (local_1b8 != 0) {
          if (*(char *)(local_1b8 + 0x4c) == '\x01') {
            fVar48 = _DAT_1469aa5a0 / ((float)*(ushort *)(param_7 + 0x46) / _DAT_1458eb52c);
            iVar20 = *(int *)(local_1b8 + 0x40);
          }
          else {
            *(float *)(param_7 + 0x122) = *(float *)(local_1b8 + 0x44) + *(float *)(param_7 + 0x122)
            ;
            fVar48 = _DAT_1469aa5a0 / ((float)*(ushort *)(param_7 + 0x46) / _DAT_1458eb52c);
            if (*(char *)(local_1b8 + 0x4c) == '\x01') {
              iVar20 = *(int *)(local_1b8 + 0x40);
            }
            else {
              uVar32 = *(uint *)(local_1b8 + 0x40);
              uVar25 = param_7[0x110];
              uVar21 = param_7[0x111];
              uVar24 = param_7[0x113] + uVar25;
              uVar14 = param_7[0x113] ^ uVar21;
              param_7[0x111] = uVar21 ^ param_7[0x112] ^ uVar25;
              auVar44._0_4_ = (float)uVar32 * fVar48;
              auVar44._4_12_ = auVar45;
              iVar10 = 0;
              if (0.0 <= auVar44._0_4_) {
                iVar10 = (int)(long)auVar44._0_4_;
              }
              param_7[0x110] = uVar25 ^ uVar14;
              iVar20 = -1;
              if (auVar44._0_4_ <= _DAT_1458eb51c) {
                iVar20 = iVar10;
              }
              param_7[0x112] = param_7[0x112] ^ uVar25 ^ uVar21 << 0x11;
              param_7[0x113] = uVar14 << 0x2d | uVar14 >> 0x13;
              fVar57 = (float)(uint)((uVar24 * 0x800000 | uVar24 >> 0x29) + uVar25 >> 0x28) *
                       _DAT_1459eb3c0;
              fVar36 = (float)func_0x000145756e25();
              iVar20 = (uint)(fVar57 < auVar44._0_4_ - fVar36) + iVar20;
            }
          }
          if (iVar20 != 0) {
            local_f1 = 0;
            func_0x0001454c8110();
          }
          fVar36 = _DAT_1458eb480;
          if (*(char *)(local_1b8 + 0x4c) == '\0') {
            fVar36 = fVar48 * _DAT_1458f6620;
          }
          uVar25 = param_7[0x110];
          uVar24 = param_7[0x113] + uVar25;
          uVar21 = param_7[0x111];
          uVar14 = param_7[0x113] ^ uVar21;
          param_7[0x111] = uVar21 ^ param_7[0x112] ^ uVar25;
          param_7[0x110] = uVar25 ^ uVar14;
          param_7[0x112] = param_7[0x112] ^ uVar25 ^ uVar21 << 0x11;
          param_7[0x113] = uVar14 << 0x2d | uVar14 >> 0x13;
          if ((float)(uint)((uVar24 * 0x800000 | uVar24 >> 0x29) + uVar25 >> 0x28) * _DAT_1459eb3c0
              < fVar36) {
            if (*(char *)(local_1b8 + 0x4c) == '\0') {
              local_f1 = 0;
              func_0x0001454f9a40();
            }
            local_178._0_4_ = (float)local_110 + _DAT_1459c8510;
            local_178._4_4_ = (float)(local_110 >> 0x20) + fRam00000001459c8514;
            fStack_170 = local_108;
            local_f1 = 0;
            func_0x0001454c8110();
          }
          if (*(char *)(local_1b8 + 0x4c) != '\0') {
            fVar48 = (float)local_110 + _DAT_1469aa5b0;
            fVar36 = (float)(local_110 >> 0x20) + fRam00000001469aa5b4;
            local_f1 = 0;
            fStack_170 = (float)func_0x0001454606b0();
            local_f1 = 0;
            local_178._0_4_ = fVar48;
            local_178._4_4_ = fVar36;
            func_0x0001454c8110();
          }
        }
      }
      else {
        if (local_1f8 < (ulong *)param_7[0xb2]) {
          lVar28 = param_7[0xb1];
          *(undefined8 *)(lVar28 + (long)local_1f8 * 0x28) = 0;
          *(float *)(lVar28 + 0x24 + (long)local_1f8 * 0x28) =
               *(float *)((long)param_7 + 0x8e4) + _DAT_1459c7c24;
        }
        *param_7 = 0;
        *(int *)((long)param_7 + 0x664) = *(int *)((long)param_7 + 0x664) + 1;
        local_f1 = 0;
        func_0x000145452400();
        local_f1 = 0;
        func_0x00014543f640();
        lVar28 = param_7[0xa9];
        if (lVar28 == param_7[0xa7]) {
          func_0x0001457580b0();
        }
        lVar33 = param_7[0xa8];
        puVar1 = (undefined8 *)(lVar33 + 0x10 + lVar28 * 0x20);
        *puVar1 = CONCAT44(fStack_164,fStack_168);
        puVar1[1] = CONCAT17(cStack_159,
                             CONCAT16(cStack_15a,
                                      CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160))));
        puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
        *puVar1 = CONCAT44(local_178._4_4_,(float)local_178);
        puVar1[1] = CONCAT44(fStack_16c,fStack_170);
        param_7[0xa9] = lVar28 + 1;
        local_f1 = 0;
        func_0x000145440110();
        lVar28 = param_7[0xa9];
        if (lVar28 == param_7[0xa7]) {
          func_0x0001457580b0();
        }
        lVar33 = param_7[0xa8];
        puVar1 = (undefined8 *)(lVar33 + 0x10 + lVar28 * 0x20);
        *puVar1 = CONCAT44(fStack_164,fStack_168);
        puVar1[1] = CONCAT17(cStack_159,
                             CONCAT16(cStack_15a,
                                      CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160))));
        puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
        *puVar1 = CONCAT44(local_178._4_4_,(float)local_178);
        puVar1[1] = CONCAT44(fStack_16c,fStack_170);
        param_7[0xa9] = lVar28 + 1;
        local_f1 = 0;
        func_0x000145450bf0();
        local_f1 = 0;
        func_0x000145451620();
        local_f1 = 0;
        func_0x000145451620();
        local_f1 = 0;
        func_0x0001454512c0();
        lVar28 = param_7[0xac];
        if (lVar28 == param_7[0xaa]) {
          local_118 = CONCAT44(uStack_1ac,local_1b0);
          local_100 = (ulong *)CONCAT44(uStack_1a4,fStack_1a8);
          func_0x000145757f60();
        }
        lVar33 = param_7[0xab];
        *(ulong *)(lVar33 + 0x10 + lVar28 * 0x18) = local_1a0;
        puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x18);
        *puVar1 = CONCAT44(uStack_1ac,local_1b0);
        puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
        param_7[0xac] = lVar28 + 1;
        local_f1 = 0;
        func_0x0001454c8110();
        local_f1 = 0;
        func_0x0001454c16a0();
        *(int *)(param_7 + 0x11f) = *(int *)(param_7 + 0x11f) + 1;
      }
    }
    else {
      lVar33 = param_7[0x9a] * 0x160;
      lVar28 = param_7[0x99];
      do {
        lVar11 = lVar28;
        if (lVar33 == 0) {
          if ((*(uint *)((long)param_7 + 0x654) & 1) == 0 && *(uint *)((long)param_7 + 0x654) != 2)
          {
            *(undefined4 *)((long)param_7 + 0x654) = 1;
            *(undefined4 *)(param_7 + 0xcb) = *(undefined4 *)((long)param_7 + 0x8e4);
          }
          break;
        }
        lVar33 = lVar33 + -0x160;
        lVar28 = lVar11 + 0x160;
      } while ((*(char *)(lVar11 + 0x68) != '\0') || (*(long *)(lVar11 + 0x18) == -1));
      *(int *)(param_7 + 0xcd) = *(int *)(param_7 + 0xcd) + 1;
      local_f1 = 0;
      func_0x00014540e4a0();
      local_f1 = 0;
      func_0x000145452400();
      local_f1 = 0;
      func_0x000145441160();
      lVar28 = param_7[0xa9];
      if (lVar28 == param_7[0xa7]) {
        func_0x0001457580b0();
      }
      lVar33 = param_7[0xa8];
      puVar1 = (undefined8 *)(lVar33 + 0x10 + lVar28 * 0x20);
      *puVar1 = CONCAT44(fStack_164,fStack_168);
      puVar1[1] = CONCAT17(cStack_159,
                           CONCAT16(cStack_15a,CONCAT15(uStack_15b,CONCAT14(uStack_15c,fStack_160)))
                          );
      puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
      *puVar1 = CONCAT44(local_178._4_4_,(float)local_178);
      puVar1[1] = CONCAT44(fStack_16c,fStack_170);
      param_7[0xa9] = lVar28 + 1;
      local_f1 = 0;
      func_0x000145450bf0();
      local_f1 = 0;
      func_0x000145451620();
      local_f5 = 1;
      func_0x00014540e4a0();
      local_f5 = 0;
      func_0x000145451620();
      local_f1 = 0;
      func_0x0001454512c0();
      lVar28 = param_7[0xac];
      if (lVar28 == param_7[0xaa]) {
        local_100 = (ulong *)CONCAT44(uStack_1ac,local_1b0);
        local_180 = (ulong *)CONCAT44(uStack_1a4,fStack_1a8);
        func_0x000145757f60();
      }
      lVar33 = param_7[0xab];
      *(ulong *)(lVar33 + 0x10 + lVar28 * 0x18) = local_1a0;
      puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x18);
      *puVar1 = CONCAT44(uStack_1ac,local_1b0);
      puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
      param_7[0xac] = lVar28 + 1;
      local_f1 = 0;
      func_0x0001454c8110();
      fVar57 = (float)local_110;
      fVar41 = (float)(local_110 >> 0x20);
      local_178._0_4_ = (float)_DAT_1469aa590 + fVar57;
      local_178._4_4_ = (float)((ulong)_DAT_1469aa590 >> 0x20) + fVar41;
      fStack_170 = local_108;
      local_f1 = 0;
      fVar36 = local_108;
      func_0x0001454c8110();
      if ((param_7[0xd1] != 0) &&
         (*(float *)param_7[0xd0] < *(float *)((long)param_7 + 0x8e4) ||
          *(float *)param_7[0xd0] == *(float *)((long)param_7 + 0x8e4))) {
        local_f1 = 0;
        func_0x0001455259a0();
        local_178._0_4_ = fVar57 + _DAT_1469aa560;
        local_178._4_4_ = fVar41 + fRam00000001469aa564;
        local_f1 = 0;
        fStack_170 = fVar36;
        func_0x0001454c8110();
      }
      if (*(char *)(param_7 + 299) == '\0') {
        lVar28 = func_0x00014540e820();
        uVar24 = *(ulong *)(lVar28 * 0xf0 + 0x1467164c0);
        if ((((uVar24 == local_118) || (uVar24 + 0x58 == local_118)) || (uVar24 + 0xb0 == local_118)
            ) || ((uVar24 + 0x108 == local_118 || (uVar24 + 0x160 == local_118)))) {
          func_0x00014540e820();
          local_f1 = 0;
          auVar61._0_8_ = func_0x000145451160();
          auVar43._8_4_ = (int)extraout_XMM0_Qb;
          auVar43._0_8_ = auVar61._0_8_;
          auVar43._12_4_ = (int)((ulong)extraout_XMM0_Qb >> 0x20);
          local_f1 = 0;
          func_0x0001454589f0();
          local_180 = (ulong *)CONCAT44(local_178._4_4_,(float)local_178);
          puVar22 = (ulong *)CONCAT44(fStack_16c,fStack_170);
          local_100 = puVar22;
          if (CONCAT44(fStack_164,fStack_168) != 0) {
            puVar34 = puVar22 + CONCAT44(fStack_164,fStack_168);
            fVar36 = _DAT_1459eb3c0;
            do {
              uVar14 = *puVar22;
              fVar57 = *(float *)((long)puVar22 + 4);
              uVar25 = param_7[0x110];
              uVar21 = param_7[0x111];
              uVar24 = param_7[0x113] + uVar25;
              uVar13 = param_7[0x113] ^ uVar21;
              param_7[0x111] = uVar21 ^ param_7[0x112] ^ uVar25;
              param_7[0x110] = uVar25 ^ uVar13;
              param_7[0x112] = param_7[0x112] ^ uVar25 ^ uVar21 << 0x11;
              param_7[0x113] = uVar13 << 0x2d | uVar13 >> 0x13;
              if ((float)(uint)((uVar24 * 0x800000 | uVar24 >> 0x29) + uVar25 >> 0x28) * fVar36 <
                  (fVar57 + *(float *)(param_7 + 0x41)) * auVar43._0_4_) {
                lVar28 = param_7[0xb5];
                if (lVar28 == param_7[0xb3]) {
                  func_0x00014575b6b0();
                }
                *(int *)(param_7[0xb4] + lVar28 * 4) = (int)uVar14;
                param_7[0xb5] = lVar28 + 1;
              }
              puVar22 = puVar22 + 1;
            } while (puVar22 != puVar34);
          }
          if (local_180 != (ulong *)0x0) {
            func_0x0001400021d0();
          }
        }
      }
      local_f1 = 0;
      func_0x0001454d2380();
      if ((*(char *)(local_118 + 0x54) == '\x01') && (*(char *)(param_7 + 0x10b) == '\0')) {
        *(undefined4 *)(param_7 + 0x10b) = 1;
        *(float *)((long)param_7 + 0x85c) = fVar48;
      }
    }
    func_0x0001455127d0();
LAB_1454c4d50:
    local_2a8 = local_268;
    uStack_2a0 = uStack_260;
    local_298 = local_258;
  }
  local_208 = CONCAT44(fVar50,fVar46);
  lVar28 = 0;
  do {
    local_278 = param_6;
    local_200 = fVar47;
    if (param_7[0x54] * 0x58 - lVar28 == 0) goto LAB_1454c5fc8;
    plVar29 = (long *)(param_7[0x53] + lVar28);
    lVar28 = lVar28 + 0x58;
  } while (*(char *)(*plVar29 + 0x75) != '\v');
  bVar27 = *(byte *)((long)param_7 + 0x111);
  bVar9 = (*(byte *)((long)param_7 + 0x7ec) ^ 1) &
          (*(int *)((long)param_7 + 0x104) == 0 && param_7[8] == 0);
  uVar32 = (uint)bVar27;
  if (fVar51 <= 0.0) {
                    /* WARNING: Could not emulate address calculation at 0x0001454c4dd9 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)uVar32 * 4 + 0x1469acd94) + 0x1469acd94))();
    return;
  }
  local_118 = local_118 & 0xffffffff00000000;
  lVar28 = param_7[0xf4];
  uVar25 = param_7[0xf5];
  uVar21 = uVar25 & 0xffffffffffffff8;
  uVar24 = 0;
  while (uVar21 != uVar24) {
    if ((((*(ulong **)(lVar28 + uVar24 * 8) == param_6) ||
         (*(ulong **)(lVar28 + 8 + uVar24 * 8) == param_6)) ||
        (*(ulong **)(lVar28 + 0x10 + uVar24 * 8) == param_6)) ||
       (((*(ulong **)(lVar28 + 0x18 + uVar24 * 8) == param_6 ||
         (*(ulong **)(lVar28 + 0x20 + uVar24 * 8) == param_6)) ||
        ((*(ulong **)(lVar28 + 0x28 + uVar24 * 8) == param_6 ||
         ((*(ulong **)(lVar28 + 0x30 + uVar24 * 8) == param_6 ||
          (lVar33 = uVar24 * 8, uVar24 = uVar24 + 8, *(ulong **)(lVar28 + 0x38 + lVar33) == param_6)
          ))))))) goto LAB_1454c4e78;
  }
  uVar23 = (uint)uVar25 & 7;
  if ((uVar25 & 7) == 0) {
LAB_1454c4fd6:
    uVar32 = (uint)bVar27;
    bVar35 = false;
    goto LAB_1454c4fd9;
  }
  if (*(ulong **)(lVar28 + uVar21 * 8) != param_6) {
    if (uVar23 == 1) goto LAB_1454c4fd6;
    if (*(ulong **)(lVar28 + 8 + uVar21 * 8) != param_6) {
      if (uVar23 == 2) goto LAB_1454c4fd6;
      if (*(ulong **)(lVar28 + 0x10 + uVar21 * 8) != param_6) {
        if (uVar23 == 3) goto LAB_1454c4fd6;
        if (*(ulong **)(lVar28 + 0x18 + uVar21 * 8) != param_6) {
          if (uVar23 == 4) goto LAB_1454c4fd6;
          if (*(ulong **)(lVar28 + 0x20 + uVar21 * 8) != param_6) {
            if (uVar23 == 5) {
LAB_1454c516c:
              bVar35 = false;
              goto LAB_1454c4fd9;
            }
            if (*(ulong **)(lVar28 + 0x28 + uVar21 * 8) != param_6) {
              if (uVar23 == 6) goto LAB_1454c516c;
              if (*(ulong **)(lVar28 + 0x30 + uVar21 * 8) != param_6 && uVar23 == 7)
              goto LAB_1454c4fd6;
            }
          }
        }
      }
    }
  }
LAB_1454c4e78:
  uVar32 = (uint)bVar27;
  if ((bVar27 < 2 & bVar9) == 1) {
    lVar33 = param_7[0x9a] * 0x160;
    lVar28 = param_7[0x99] + -0x160;
    do {
      bVar35 = true;
      if (lVar33 == 0) goto LAB_1454c4fd9;
      lVar33 = lVar33 + -0x160;
      puVar1 = (undefined8 *)(lVar28 + 0x1e8);
      lVar28 = lVar28 + 0x160;
    } while ((ulong *)*puVar1 != param_6);
    func_0x00014540d200();
    local_108 = fStack_16c;
    local_110 = CONCAT44(fStack_170,local_178._4_4_);
    local_178._0_4_ = SUB84(param_6,0);
    local_178._4_4_ = (float)((ulong)param_6 >> 0x20);
    func_0x000145524410();
    uVar58 = *(undefined4 *)((long)param_7 + 0x8e4);
    lVar33 = param_7[0x99];
    lVar11 = 0;
    lVar28 = lVar33;
    do {
      if (param_7[0x9a] * 0x160 - lVar11 == 0) goto LAB_1454c5687;
      lVar11 = lVar11 + 0x160;
      puVar1 = (undefined8 *)(lVar28 + 0x88);
      lVar28 = lVar28 + 0x160;
    } while ((ulong *)*puVar1 != param_6);
    *(undefined4 *)(lVar33 + -0x20 + lVar11) = 0;
    *(undefined4 *)(lVar33 + -0x34 + lVar11) = uVar58;
    iVar10 = *(int *)(lVar33 + -0xf8 + lVar11);
    if (*(long *)(lVar33 + -0xd0 + lVar11) == 0) {
      if (iVar10 == 0) goto LAB_1454c566b;
    }
    else if (iVar10 == 0) {
      local_f2 = 1;
      func_0x0001454d5440();
LAB_1454c566b:
      local_f2 = 1;
      func_0x0001454d13a0();
    }
LAB_1454c5687:
    local_178 = (ulong *)CONCAT44(local_178._4_4_,(float)local_178);
    if (param_7[0x54] != 0) {
      lVar28 = param_7[0x53];
      lVar33 = 0;
      do {
        plVar29 = *(long **)(lVar28 + lVar33);
        if ((plVar29[1] == 9) &&
           ((char)((long *)*plVar29)[1] == 'h' && *(long *)*plVar29 == 0x70726f6d796c6f70)) {
          fStack_170 = *(float *)(lVar28 + 8 + lVar33);
          fStack_164 = *(float *)(lVar28 + 0x14 + lVar33);
          fStack_160 = *(float *)(lVar28 + 0x18 + lVar33);
          local_144 = *(undefined4 *)(lVar28 + 0x34 + lVar33);
          puVar1 = (undefined8 *)(lVar28 + 0x24 + lVar33);
          auVar61._0_8_ = *puVar1;
          uStack_14c = puVar1[1];
          fStack_154 = (float)auVar61._0_8_;
          uStack_150 = (uint)((ulong)auVar61._0_8_ >> 0x20);
          puVar1 = (undefined8 *)(lVar28 + 0x38 + lVar33);
          local_140 = *puVar1;
          auVar61._0_8_ = puVar1[1];
          lVar11 = lVar28 + 0x44 + lVar33;
          uStack_130 = *(undefined4 *)(lVar11 + 4);
          uStack_12c = *(undefined8 *)(lVar11 + 8);
          uStack_138 = (undefined4)auVar61._0_8_;
          uStack_134 = (undefined4)((ulong)auVar61._0_8_ >> 0x20);
          local_178._0_4_ = SUB84(plVar29,0);
          local_178._4_4_ = (float)((ulong)plVar29 >> 0x20);
          auVar61._0_8_ = *(undefined8 *)(lVar28 + 0xc + lVar33);
          fStack_16c = (float)auVar61._0_8_;
          fStack_168 = (float)((ulong)auVar61._0_8_ >> 0x20);
          auVar61._0_8_ = *(undefined8 *)(lVar28 + 0x1c + lVar33);
          uStack_15c = (undefined1)auVar61._0_8_;
          uStack_15b = (undefined1)((ulong)auVar61._0_8_ >> 8);
          cStack_15a = (char)((ulong)auVar61._0_8_ >> 0x10);
          cStack_159 = (char)((ulong)auVar61._0_8_ >> 0x18);
          local_158 = (undefined1)((ulong)auVar61._0_8_ >> 0x20);
          uStack_157 = (undefined1)((ulong)auVar61._0_8_ >> 0x28);
          uStack_156 = (undefined2)((ulong)auVar61._0_8_ >> 0x30);
          bVar15 = *(char *)((long)plVar29 + 0x75) - 2;
          fVar48 = _DAT_1458eb480;
          if (bVar15 < 7) {
            fVar48 = *(float *)((ulong)bVar15 * 4 + 0x1469aca9c);
          }
          local_180 = (ulong *)CONCAT44(local_180._4_4_,fVar48);
          func_0x0001454f96d0();
          local_f2 = 1;
          func_0x0001454ee0d0();
          local_1b8 = CONCAT44(local_1b8._4_4_,uVar32);
          local_100 = (ulong *)CONCAT44(fStack_1d4,local_1d8);
          local_220[0] = CONCAT44(local_220[0]._4_4_,2);
          local_268 = local_268 & 0xffffffff00000000;
          func_0x00014544b1a0();
          lVar28 = param_7[0xa9];
          if (lVar28 == param_7[0xa7]) {
            func_0x0001457580b0();
          }
          lVar33 = param_7[0xa8];
          puVar4 = (undefined4 *)(lVar33 + 0x10 + lVar28 * 0x20);
          *puVar4 = (undefined4)local_1a0;
          puVar4[1] = local_1a0._4_4_;
          puVar4[2] = (undefined4)uStack_198;
          puVar4[3] = uStack_198._4_4_;
          puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
          *puVar1 = CONCAT44(uStack_1ac,local_1b0);
          puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
          param_7[0xa9] = lVar28 + 1;
          func_0x0001454d43d0();
          if (local_1e0 != (ulong *)0x0) {
            func_0x0001400021d0();
          }
          uVar32 = (uint)local_1b8;
          local_178 = (ulong *)CONCAT44(local_178._4_4_,(float)local_178);
          break;
        }
        lVar33 = lVar33 + 0x58;
        local_178 = (ulong *)CONCAT44(local_178._4_4_,(float)local_178);
      } while (param_7[0x54] * 0x58 - lVar33 != 0);
    }
  }
  else {
    bVar35 = true;
    if (fVar51 <= 0.0) {
      func_0x000145524410();
    }
  }
LAB_1454c4fd9:
  if ((bVar27 == 0 & bVar9) == 0) {
LAB_1454c59e9:
    cVar30 = (char)uVar32;
    if ((char)local_118 == '\0') {
      if (fVar51 <= 0.0) {
LAB_1454c5a3a:
        if ((cVar30 == '\x03') && (*(int *)((long)param_7 + 0x7e4) == 1)) {
          local_f2 = 1;
          func_0x0001454d5230();
        }
        goto LAB_1454c5a66;
      }
    }
    else {
      local_f2 = 1;
      func_0x0001454d68b0();
      local_f2 = 1;
      func_0x0001454d5230();
      if (fVar51 <= 0.0) goto LAB_1454c5a66;
    }
  }
  else {
    if (param_7[0x54] != 0) {
      plVar29 = (long *)param_7[0x53];
      lVar28 = param_7[0x54] * 0x58;
      lVar33 = 0;
      do {
        if (((*(long **)((long)plVar29 + lVar33))[1] == 9) &&
           (plVar16 = (long *)**(long **)((long)plVar29 + lVar33),
           (char)plVar16[1] == 'e' && *plVar16 == 0x676172646f6f6c62)) {
          fVar48 = *(float *)(param_7 + 0xf9);
          fVar36 = fVar48;
          if (_DAT_1458f6624 <= fVar48) {
            fVar36 = _DAT_1458f6624;
          }
          if (fVar36 <= 0.0) {
            fVar36 = 0.0;
          }
          *(float *)(param_7 + 0xf9) = fVar48 - fVar36;
          fVar36 = fVar36 + *(float *)((long)param_7 + 0x7c4);
          if (_DAT_1458eb52c <= fVar36) {
            fVar36 = _DAT_1458eb52c;
          }
          *(float *)((long)param_7 + 0x7c4) = fVar36;
          *(undefined4 *)((long)param_7 + 0x7cc) = *(undefined4 *)((long)param_7 + 0x8e4);
          local_f2 = 1;
          func_0x0001454d69f0();
          if (param_7[0x54] == 0) goto LAB_1454c51eb;
          plVar29 = (long *)param_7[0x53];
          lVar28 = param_7[0x54] * 0x58;
          break;
        }
        lVar33 = lVar33 + 0x58;
      } while (lVar28 - lVar33 != 0);
      plVar16 = (long *)(lVar28 + (long)plVar29);
      do {
        if ((((long *)*plVar29)[1] == 9) &&
           (plVar7 = *(long **)*plVar29, (char)plVar7[1] == 'e' && *plVar7 == 0x7461665f6c616573)) {
          fVar48 = _DAT_1458f6624;
          if (in_stack_00000030 == '\0') {
            fVar48 = _DAT_1458eb480;
          }
          auVar42 = ZEXT416(*(uint *)((long)param_7 + 0x7d4));
          auVar61._0_8_ = func_0x000145756e55();
          auVar61._8_8_ = extraout_XMM0_Qb_00;
          if (fVar48 <= (float)auVar61._0_8_) {
            auVar38._4_12_ = auVar61._4_12_;
            auVar38._0_4_ = fVar48;
            auVar61._0_8_ = auVar38._0_8_;
          }
          fVar48 = (float)auVar61._0_8_;
          if (fVar48 <= 0.0) {
            fVar48 = 0.0;
          }
          iVar10 = 0;
          if (0.0 <= fVar48) {
            iVar10 = (int)(long)fVar48;
          }
          *(float *)((long)param_7 + 0x7d4) = auVar42._0_4_ - fVar48;
          iVar20 = -1;
          if (fVar48 <= _DAT_1458eb51c) {
            iVar20 = iVar10;
          }
          uVar23 = 5;
          if ((uint)(iVar20 + *(int *)(param_7 + 0xfa)) < 5) {
            uVar23 = iVar20 + *(int *)(param_7 + 0xfa);
          }
          *(uint *)(param_7 + 0xfa) = uVar23;
          local_f2 = 1;
          func_0x0001454d7020();
          break;
        }
        plVar29 = plVar29 + 0xb;
      } while (plVar29 != plVar16);
    }
LAB_1454c51eb:
    lVar28 = param_7[0xee];
    lVar33 = 0;
    do {
      if (param_7[0xef] << 4 == lVar33) goto LAB_1454c5984;
      lVar11 = lVar33 + 0x10;
      puVar1 = (undefined8 *)(lVar28 + lVar33);
      lVar33 = lVar11;
    } while ((ulong *)*puVar1 != param_6);
    fVar48 = *(float *)(lVar28 + -8 + lVar11);
    if (_DAT_1458eb480 <= fVar48) {
      *(float *)(lVar28 + -8 + lVar11) = fVar48 + _DAT_1458eb4fc;
      if (param_7[0x54] != 0) {
        lVar28 = param_7[0x53];
        lVar33 = 0;
        do {
          plVar29 = *(long **)(lVar28 + lVar33);
          if ((plVar29[1] == 0xb) &&
             (*(long *)(*plVar29 + 3) == 0x657269665f656972 &&
              *(long *)*plVar29 == 0x665f656972656166)) {
            fStack_170 = *(float *)(lVar28 + 8 + lVar33);
            fStack_164 = *(float *)(lVar28 + 0x14 + lVar33);
            fStack_160 = *(float *)(lVar28 + 0x18 + lVar33);
            local_144 = *(undefined4 *)(lVar28 + 0x34 + lVar33);
            puVar1 = (undefined8 *)(lVar28 + 0x24 + lVar33);
            auVar61._0_8_ = *puVar1;
            uStack_14c = puVar1[1];
            fStack_154 = (float)auVar61._0_8_;
            uStack_150 = (uint)((ulong)auVar61._0_8_ >> 0x20);
            puVar1 = (undefined8 *)(lVar28 + 0x38 + lVar33);
            local_140 = *puVar1;
            puVar3 = (undefined8 *)(lVar28 + 0x44 + lVar33);
            auVar61._0_8_ = *puVar3;
            uStack_12c = puVar3[1];
            uStack_138 = (undefined4)puVar1[1];
            uStack_134 = (undefined4)auVar61._0_8_;
            uStack_130 = (undefined4)((ulong)auVar61._0_8_ >> 0x20);
            auVar61._0_8_ = *(undefined8 *)(lVar28 + 0xc + lVar33);
            fStack_16c = (float)auVar61._0_8_;
            fStack_168 = (float)((ulong)auVar61._0_8_ >> 0x20);
            uVar5 = *(undefined8 *)(lVar28 + 0x1c + lVar33);
            uStack_15c = (undefined1)uVar5;
            uStack_15b = (undefined1)((ulong)uVar5 >> 8);
            cStack_15a = (char)((ulong)uVar5 >> 0x10);
            cStack_159 = (char)((ulong)uVar5 >> 0x18);
            local_158 = (undefined1)((ulong)uVar5 >> 0x20);
            uStack_157 = (undefined1)((ulong)uVar5 >> 0x28);
            uStack_156 = (undefined2)((ulong)uVar5 >> 0x30);
            lVar33 = param_7[0x9a] * 0x160;
            lVar28 = param_7[0x99] + -0x160;
            goto LAB_1454c533a;
          }
          lVar33 = lVar33 + 0x58;
        } while (param_7[0x54] * 0x58 - lVar33 != 0);
      }
    }
LAB_1454c5984:
    cVar30 = (char)uVar32;
    if (0.0 < fVar51) {
      if (fVar19 != 0.0 && !bVar35) {
        local_f2 = 1;
        func_0x0001454d4dc0();
      }
      goto LAB_1454c59e9;
    }
    if ((char)local_118 == '\0') goto LAB_1454c5a3a;
    local_f2 = 1;
    func_0x0001454d68b0();
    local_f2 = 1;
    func_0x0001454d5230();
LAB_1454c5a66:
    if ((param_6 != (ulong *)0x0) && (param_6 == (ulong *)param_7[0xf6])) {
      local_108 = local_200;
      local_110 = local_208;
      param_7[0xf6] = 0;
      fVar51 = *(float *)((long)param_7 + 0x8e4);
      *(float *)(param_7 + 0xfd) = _DAT_1458eb480 + fVar51;
      if (param_7[0x54] != 0) {
        lVar28 = param_7[0x53];
        lVar33 = 0;
        do {
          plVar29 = *(long **)(lVar28 + lVar33);
          if ((plVar29[1] == 0xc) &&
             ((int)((long *)*plVar29)[1] == 0x6b72616d && *(long *)*plVar29 == 0x5f737265746e7568))
          {
            fStack_170 = *(float *)(lVar28 + 8 + lVar33);
            fStack_164 = *(float *)(lVar28 + 0x14 + lVar33);
            fStack_160 = *(float *)(lVar28 + 0x18 + lVar33);
            local_144 = *(undefined4 *)(lVar28 + 0x34 + lVar33);
            puVar1 = (undefined8 *)(lVar28 + 0x24 + lVar33);
            auVar61._0_8_ = *puVar1;
            uStack_14c = puVar1[1];
            fStack_154 = (float)auVar61._0_8_;
            uStack_150 = (uint)((ulong)auVar61._0_8_ >> 0x20);
            puVar1 = (undefined8 *)(lVar28 + 0x38 + lVar33);
            local_140 = *puVar1;
            puVar4 = (undefined4 *)(lVar28 + 0x44 + lVar33);
            uStack_134 = *puVar4;
            uStack_130 = puVar4[1];
            uStack_12c = *(undefined8 *)(puVar4 + 2);
            uStack_138 = (undefined4)puVar1[1];
            local_178._0_4_ = SUB84(plVar29,0);
            local_178._4_4_ = (float)((ulong)plVar29 >> 0x20);
            auVar61._0_8_ = *(undefined8 *)(lVar28 + 0xc + lVar33);
            fStack_16c = (float)auVar61._0_8_;
            fStack_168 = (float)((ulong)auVar61._0_8_ >> 0x20);
            auVar61._0_8_ = *(undefined8 *)(lVar28 + 0x1c + lVar33);
            uStack_15c = (undefined1)auVar61._0_8_;
            uStack_15b = (undefined1)((ulong)auVar61._0_8_ >> 8);
            cStack_15a = (char)((ulong)auVar61._0_8_ >> 0x10);
            cStack_159 = (char)((ulong)auVar61._0_8_ >> 0x18);
            local_158 = (undefined1)((ulong)auVar61._0_8_ >> 0x20);
            uStack_157 = (undefined1)((ulong)auVar61._0_8_ >> 0x28);
            uStack_156 = (undefined2)((ulong)auVar61._0_8_ >> 0x30);
            fVar48 = (float)func_0x000145413960();
            if (fVar48 <= fVar51) {
              local_f2 = 1;
              func_0x0001454d49e0();
              func_0x0001454f96d0();
              local_1b0 = SUB84(param_6,0);
              uStack_1ac = (undefined4)((ulong)param_6 >> 0x20);
              local_f2 = 1;
              func_0x0001454ee0d0();
              local_118 = CONCAT44(fStack_1d4,local_1d8);
              lVar33 = CONCAT44(fStack_1cc,local_1d0);
              local_220[0] = CONCAT44(local_220[0]._4_4_,2);
              local_268 = local_268 & 0xffffffff00000000;
              local_f4 = 1;
              func_0x00014544b1a0();
              lVar28 = param_7[0xa9];
              if (lVar28 == param_7[0xa7]) {
                func_0x0001457580b0();
              }
              lVar11 = param_7[0xa8];
              puVar22 = (ulong *)(lVar11 + 0x10 + lVar28 * 0x20);
              *puVar22 = local_1a0;
              puVar22[1] = uStack_198;
              puVar1 = (undefined8 *)(lVar11 + lVar28 * 0x20);
              *puVar1 = CONCAT44(uStack_1ac,local_1b0);
              puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
              param_7[0xa9] = lVar28 + 1;
              local_100 = local_1e0;
              if (lVar33 != 0) {
                uVar31 = *(undefined1 *)((long)param_7 + 0x111);
                uVar58 = *(undefined4 *)(param_7 + 4);
                uVar59 = *(undefined4 *)((long)param_7 + 0x24);
                uVar60 = *(undefined4 *)(param_7 + 5);
                uVar49 = *(undefined4 *)((long)param_7 + 0x2c);
                uVar52 = *(undefined4 *)(param_7 + 8);
                uVar54 = *(undefined4 *)((long)param_7 + 0x44);
                uVar55 = *(undefined4 *)(param_7 + 9);
                uVar56 = *(undefined4 *)((long)param_7 + 0x4c);
                lVar28 = 0;
                do {
                  uVar24 = param_7[0x111];
                  uVar21 = param_7[0x112] ^ param_7[0x110];
                  uVar25 = param_7[0x113] ^ uVar24;
                  param_7[0x111] = uVar24 ^ uVar21;
                  param_7[0x110] = param_7[0x110] ^ uVar25;
                  param_7[0x112] = uVar21 ^ uVar24 << 0x11;
                  param_7[0x113] = uVar25 << 0x2d | uVar25 >> 0x13;
                  *(undefined1 *)((long)param_7 + 0x111) = 3;
                  param_7[4] = 0;
                  param_7[8] = 0;
                  entry();
                  *(undefined1 *)((long)param_7 + 0x111) = uVar31;
                  *(undefined4 *)(param_7 + 4) = uVar58;
                  *(undefined4 *)((long)param_7 + 0x24) = uVar59;
                  *(undefined4 *)(param_7 + 5) = uVar60;
                  *(undefined4 *)((long)param_7 + 0x2c) = uVar49;
                  *(undefined4 *)(param_7 + 8) = uVar52;
                  *(undefined4 *)((long)param_7 + 0x44) = uVar54;
                  *(undefined4 *)(param_7 + 9) = uVar55;
                  *(undefined4 *)((long)param_7 + 0x4c) = uVar56;
                  lVar28 = lVar28 + 8;
                } while (lVar33 << 3 != lVar28);
              }
              if (local_100 != (ulong *)0x0) {
                func_0x0001400021d0();
              }
            }
            break;
          }
          lVar33 = lVar33 + 0x58;
        } while (param_7[0x54] * 0x58 - lVar33 != 0);
      }
    }
    lVar28 = 0;
    do {
      if (param_7[0xef] << 4 == lVar28) goto LAB_1454c5fc8;
      puVar1 = (undefined8 *)(param_7[0xee] + lVar28);
      lVar28 = lVar28 + 0x10;
    } while ((ulong *)*puVar1 != param_6);
    func_0x000145524320();
    if (param_7[0x54] != 0) {
      lVar28 = param_7[0x53];
      lVar33 = 0;
      do {
        plVar29 = *(long **)(lVar28 + lVar33);
        if ((plVar29[1] == 0xb) &&
           (*(long *)(*plVar29 + 3) == 0x657269665f656972 && *(long *)*plVar29 == 0x665f656972656166
           )) {
          if (*(int *)((long)plVar29 + 0x54) == 0) {
LAB_1454c5f53:
            uVar32 = 1;
          }
          else {
            uVar23 = *(int *)(lVar28 + 0x18 + lVar33) + *(int *)(lVar28 + 0x40 + lVar33) +
                     *(int *)((long)param_7 + 0x48c) + *(int *)((long)plVar29 + 0x54);
            uVar32 = 3;
            if (uVar23 < 3) {
              uVar32 = uVar23;
            }
            if (uVar23 == 0) goto LAB_1454c5f53;
          }
          if ((ulong)param_7[0xef] < (ulong)uVar32) {
            local_f2 = 1;
            func_0x0001454d5950();
            if (CONCAT44(fStack_164,fStack_168) != 0) {
              local_118 = CONCAT44(fStack_16c,fStack_170);
              func_0x0001454d7810();
            }
            if (local_178 != (ulong *)0x0) {
              func_0x0001400021d0();
            }
          }
          break;
        }
        lVar33 = lVar33 + 0x58;
      } while (param_7[0x54] * 0x58 - lVar33 != 0);
    }
  }
LAB_1454c5fc8:
  cVar30 = *(char *)((long)param_7 + 0x111);
  if ((cVar30 == '\x03') || (param_7[0xe0] == 0)) {
    if (0xfffffffffffffffd < (long)local_188 - 1U) goto LAB_1454c61a5;
  }
  else {
    local_1bf = (char)*(undefined4 *)(param_7 + 0x22);
    if (cVar30 == '\x01') {
      cVar8 = local_1bf;
      if (local_1bf != '\0') goto LAB_1454c6021;
    }
    else {
      local_1bf = '\0';
      cVar8 = '\0';
      if (cVar30 == '\0') {
LAB_1454c6021:
        local_1bf = cVar8;
        lVar28 = param_7[0x1e];
        if (lVar28 != 0) {
          lVar11 = param_7[0x1d];
          lVar33 = lVar28 * 4;
          lVar17 = 0;
          do {
            if (*(float *)(lVar11 + lVar17 * 4) == fVar19) {
              *(undefined4 *)(lVar11 + lVar17 * 4) = *(undefined4 *)(lVar11 + -4 + lVar28 * 4);
              param_7[0x1e] = lVar28 + -1;
              uVar31 = 1;
              goto LAB_1454c6055;
            }
            lVar17 = lVar17 + 1;
            lVar33 = lVar33 + -4;
          } while (lVar33 != 0);
        }
      }
    }
    uVar31 = 0;
LAB_1454c6055:
    local_1c4 = CONCAT13(in_stack_00000030,
                         CONCAT12(cVar30,CONCAT11(cVar30 == '\x01',in_stack_00000028)));
    local_f6 = 0;
    local_1e0 = param_6;
    local_1d8 = fVar19;
    fStack_1d4 = fVar46;
    local_1d0 = fVar50;
    fStack_1cc = fVar47;
    local_1c8 = param_3;
    local_1c0 = uVar31;
    func_0x0001454b9930();
    if (local_188 == (long *)0xffffffffffffffff) goto LAB_1454c61a5;
    local_1b0 = SUB84(local_188,0);
    uStack_1ac = (undefined4)((ulong)local_188 >> 0x20);
    fStack_1a8 = (float)local_1e8;
    uStack_1a4 = (undefined4)((ulong)local_1e8 >> 0x20);
    local_1a0 = local_2a8;
    uStack_198 = uStack_2a0;
    local_190 = local_298;
    uStack_15b = 2;
    uStack_15c = in_stack_00000028;
    cStack_159 = in_stack_00000030;
    local_178._0_4_ = SUB84(param_6,0);
    local_178._4_4_ = (float)((ulong)param_6 >> 0x20);
    uStack_157 = 0;
    fStack_170 = fVar19;
    fStack_16c = fVar46;
    fStack_168 = fVar50;
    fStack_164 = fVar47;
    fStack_160 = param_3;
    cStack_15a = cVar30;
    local_158 = uVar31;
    func_0x0001454b9930();
    if (local_188 == (long *)0x0) goto LAB_1454c61a5;
  }
  func_0x0001400021d0();
LAB_1454c61a5:
  func_0x0001455127d0();
  return;
LAB_1454c4859:
  fStack_168 = 0.0;
  fStack_164 = 0.0;
  fStack_160 = (float)uVar25;
  uStack_15c = (undefined1)(uVar25 >> 0x20);
  uStack_15b = (undefined1)(uVar25 >> 0x28);
  cStack_15a = (char)(uVar25 >> 0x30);
  cStack_159 = (char)(uVar25 >> 0x38);
  goto LAB_1454c356c;
  while( true ) {
    lVar33 = lVar33 + -0x160;
    puVar1 = (undefined8 *)(lVar28 + 0x1e8);
    lVar28 = lVar28 + 0x160;
    if ((ulong *)*puVar1 == param_6) break;
LAB_1454c533a:
    local_178 = (ulong *)plVar29;
    if (lVar33 == 0) goto LAB_1454c5984;
  }
  func_0x00014540d200(uVar5,auVar61._0_8_,*(undefined4 *)((long)param_7 + 0x8e4));
  uStack_260 = CONCAT44(uStack_260._4_4_,uStack_1a4);
  local_268 = CONCAT44(fStack_1a8,uStack_1ac);
  func_0x0001454f96d0();
  local_f2 = 1;
  local_1e0 = param_6;
  func_0x0001454ee0d0();
  local_1b8 = CONCAT44(local_1b8._4_4_,uVar32);
  local_1f0 = CONCAT44(uStack_1ac,local_1b0);
  local_100 = (ulong *)CONCAT44(uStack_1a4,fStack_1a8);
  lVar28 = (ulong)(local_1a0 != 1) * 8 + 8;
  if (local_1a0 == 0) {
    lVar28 = 0;
  }
  local_180 = (ulong *)(lVar28 + (long)local_100);
  local_228 = local_100;
  if (local_100 != local_180) {
    do {
      local_110 = *local_100;
      local_1d8 = (float)local_110;
      fStack_1d4 = (float)(local_110 >> 0x20);
      local_1e0 = (ulong *)((ulong)local_1e0 & 0xffffffff00000000);
      local_220[0] = local_220[0] & 0xffffffff00000000;
      func_0x00014544b1a0();
      lVar28 = param_7[0xa9];
      if (lVar28 == param_7[0xa7]) {
        func_0x0001457580b0();
      }
      lVar33 = param_7[0xa8];
      puVar22 = (ulong *)(lVar33 + 0x10 + lVar28 * 0x20);
      *puVar22 = local_1a0;
      puVar22[1] = uStack_198;
      puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
      *puVar1 = CONCAT44(uStack_1ac,local_1b0);
      puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
      param_7[0xa9] = lVar28 + 1;
      uVar31 = *(undefined1 *)((long)param_7 + 0x111);
      *(undefined1 *)((long)param_7 + 0x111) = 3;
      uVar58 = *(undefined4 *)(param_7 + 4);
      uVar59 = *(undefined4 *)((long)param_7 + 0x24);
      uVar60 = *(undefined4 *)(param_7 + 5);
      uVar49 = *(undefined4 *)((long)param_7 + 0x2c);
      uVar52 = *(undefined4 *)(param_7 + 8);
      uVar54 = *(undefined4 *)((long)param_7 + 0x44);
      uVar55 = *(undefined4 *)(param_7 + 9);
      uVar56 = *(undefined4 *)((long)param_7 + 0x4c);
      param_7[4] = 0;
      param_7[8] = 0;
      entry();
      local_100 = local_100 + 1;
      *(undefined1 *)((long)param_7 + 0x111) = uVar31;
      *(undefined4 *)(param_7 + 4) = uVar58;
      *(undefined4 *)((long)param_7 + 0x24) = uVar59;
      *(undefined4 *)(param_7 + 5) = uVar60;
      *(undefined4 *)((long)param_7 + 0x2c) = uVar49;
      *(undefined4 *)(param_7 + 8) = uVar52;
      *(undefined4 *)((long)param_7 + 0x44) = uVar54;
      *(undefined4 *)(param_7 + 9) = uVar55;
      *(undefined4 *)((long)param_7 + 0x4c) = uVar56;
    } while (local_100 != local_180);
  }
  lVar28 = param_7[0xe0];
  if (lVar28 == 0) {
LAB_1454c5961:
    uVar32 = (uint)local_1b8;
  }
  else {
    local_1f8 = (ulong *)*plVar29;
    lVar33 = plVar29[1];
    plVar29 = (long *)(param_7[0xdf] + 0x10);
    fVar48 = _DAT_1458f667c;
    local_270 = lVar33;
    do {
      if (((char)plVar29[-2] == '\r') && (*plVar29 == lVar33)) {
        iVar10 = func_0x000145756dd7();
        lVar33 = local_270;
        if (iVar10 == 0) {
          fVar48 = fVar48 + *(float *)((long)plVar29 + -0xc);
        }
      }
      plVar29 = plVar29 + 8;
      lVar28 = lVar28 + -1;
    } while (lVar28 != 0);
    if (fVar48 <= 0.0) goto LAB_1454c5961;
    puVar22 = local_228;
    uVar32 = (uint)local_1b8;
LAB_1454c623b:
    if (puVar22 != local_180) {
      uVar24 = *puVar22;
      puVar22 = puVar22 + 1;
      lVar33 = param_7[0x9a] * 0x160;
      lVar28 = param_7[0x99];
      do {
        lVar11 = lVar28;
        if (lVar33 == 0) goto LAB_1454c623b;
        lVar33 = lVar33 + -0x160;
        lVar28 = lVar11 + 0x160;
      } while ((*(ulong *)(lVar11 + 0x88) != uVar24) || ((*(byte *)(lVar11 + 0x68) & 1) != 0));
      local_1d8 = (float)uVar24;
      fStack_1d4 = (float)(uVar24 >> 0x20);
      local_1e0 = (ulong *)((ulong)local_1e0 & 0xffffffff00000000);
      local_220[0] = local_220[0] & 0xffffffff00000000;
      local_1f8 = puVar22;
      local_110 = uVar24;
      func_0x00014544b1a0();
      lVar28 = param_7[0xa9];
      if (lVar28 == param_7[0xa7]) {
        func_0x0001457580b0();
      }
      lVar33 = param_7[0xa8];
      puVar22 = (ulong *)(lVar33 + 0x10 + lVar28 * 0x20);
      *puVar22 = local_1a0;
      puVar22[1] = uStack_198;
      puVar1 = (undefined8 *)(lVar33 + lVar28 * 0x20);
      *puVar1 = CONCAT44(uStack_1ac,local_1b0);
      puVar1[1] = CONCAT44(uStack_1a4,fStack_1a8);
      param_7[0xa9] = lVar28 + 1;
      uVar31 = *(undefined1 *)((long)param_7 + 0x111);
      *(undefined1 *)((long)param_7 + 0x111) = 3;
      uVar52 = *(undefined4 *)(param_7 + 4);
      uVar54 = *(undefined4 *)((long)param_7 + 0x24);
      uVar55 = *(undefined4 *)(param_7 + 5);
      uVar56 = *(undefined4 *)((long)param_7 + 0x2c);
      uVar58 = *(undefined4 *)(param_7 + 8);
      uVar59 = *(undefined4 *)((long)param_7 + 0x44);
      uVar60 = *(undefined4 *)(param_7 + 9);
      uVar49 = *(undefined4 *)((long)param_7 + 0x4c);
      param_7[4] = 0;
      param_7[8] = 0;
      entry();
      *(undefined1 *)((long)param_7 + 0x111) = uVar31;
      *(undefined4 *)(param_7 + 4) = uVar52;
      *(undefined4 *)((long)param_7 + 0x24) = uVar54;
      *(undefined4 *)(param_7 + 5) = uVar55;
      *(undefined4 *)((long)param_7 + 0x2c) = uVar56;
      *(undefined4 *)(param_7 + 8) = uVar58;
      *(undefined4 *)((long)param_7 + 0x44) = uVar59;
      *(undefined4 *)(param_7 + 9) = uVar60;
      *(undefined4 *)((long)param_7 + 0x4c) = uVar49;
      puVar22 = local_1f8;
      uVar32 = (uint)local_1b8;
      goto LAB_1454c623b;
    }
  }
  if (local_1f0 != 0) {
    func_0x0001400021d0();
  }
  goto LAB_1454c5984;
}
