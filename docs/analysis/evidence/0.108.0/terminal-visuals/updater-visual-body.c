/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  undefined8 *puVar1;
  uint *puVar2;
  long *plVar3;
  undefined4 *puVar4;
  char cVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  long lVar10;
  uint uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  long lVar21;
  long extraout_RDX;
  uint uVar22;
  int iVar23;
  long lVar24;
  long lVar25;
  uint *puVar26;
  undefined4 *puVar27;
  undefined4 uVar28;
  float *pfVar29;
  ulong uVar30;
  uint *puVar31;
  undefined4 *unaff_R13;
  undefined4 *puVar32;
  long lVar33;
  uint *puVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  undefined4 in_XMM6_Da;
  float fVar39;
  undefined4 in_XMM7_Da;
  float fVar40;
  undefined4 uVar41;
  undefined4 uVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  float fVar46;
  float fVar47;
  long *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long *in_stack_00000040;
  long local_1c0;
  long local_1b8;
  long local_1b0;
  long local_1a8;
  undefined4 *local_1a0;
  long local_198;
  long local_190;
  long local_188;
  long local_170;
  undefined4 local_148;
  undefined4 uStack_144;
  undefined4 uStack_140;
  undefined4 uStack_13c;
  undefined4 local_138;
  undefined4 uStack_134;
  long local_130;
  long local_128;
  long local_120;
  long local_118;
  undefined4 local_110;
  undefined8 local_10c;
  undefined4 local_104;
  float local_100;
  undefined4 local_fc;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined4 local_e8;
  undefined4 local_d8;

  fVar35 = _DAT_145dcd0ac;
  fVar36 = _DAT_145dcd0a8;
  fVar47 = _DAT_145dcd0a4;
  fVar46 = _DAT_145dcd0a0;
  fVar45 = _DAT_145da61f8;
  fVar40 = _DAT_145da61bc;
  fVar37 = _DAT_145da61b0;
  fVar39 = _DAT_145d97610;
  lVar24 = *param_5;
  lVar33 = param_5[1];
  uVar41 = *(undefined4 *)((long)param_5 + 0x14);
  local_188 = CONCAT44(local_188._4_4_,uVar41);
  lVar14 = *param_6;
  lVar21 = param_6[1];
  uVar42 = *(undefined4 *)((long)param_6 + 0x14);
  local_1a0 = (undefined4 *)CONCAT44(local_1a0._4_4_,uVar42);
  lVar17 = *in_stack_00000028;
  local_170 = in_stack_00000028[1];
  uVar6 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  puVar27 = (undefined4 *)*in_stack_00000030;
  local_120 = in_stack_00000030[1];
  uVar7 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  local_118 = *in_stack_00000038;
  fVar38 = *(float *)(*param_3 + 0x5c);
  local_130 = in_stack_00000038[1];
  uVar8 = *(undefined4 *)((long)in_stack_00000038 + 0x14);
  lVar10 = *in_stack_00000040;
  local_128 = in_stack_00000040[1];
  uVar9 = *(undefined4 *)((long)in_stack_00000040 + 0x14);
  puVar26 = *(uint **)(lVar24 + 0xf8);
  puVar31 = puVar26 + *(long *)(lVar24 + 0x100);
  cVar5 = *(char *)(lVar24 + 0x108);
  local_190 = 8;
  local_1a8 = 0;
  local_1b8 = 0;
  uVar11 = 0;
  lVar18 = 0;
  lVar19 = local_128;
LAB_1400ce860:
  if (cVar5 == '\0') {
    if (uVar11 == (uint)lVar18) {
      do {
        if (puVar26 == puVar31) goto LAB_1400cec5e;
        uVar11 = *puVar26;
        puVar26 = puVar26 + 1;
        lVar18 = *(long *)(*(long *)(lVar33 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
      } while (lVar18 == 0);
      lVar12 = *(long *)(lVar33 + 0x108) + (ulong)uVar11 * 0xa0;
      uVar15 = (ulong)*(uint *)(lVar12 + 0x94);
      lVar25 = *(long *)(lVar33 + 0x1a8);
      unaff_R13 = (undefined4 *)(uVar15 * 9);
      lVar13 = lVar25 + uVar15 * 0x48;
      lVar20 = *(long *)(lVar25 + 0x38 + uVar15 * 0x48);
      if (*(ulong *)(lVar24 + 0x110) < *(ulong *)(lVar25 + 0x40 + uVar15 * 0x48)) {
        uVar15 = *(ulong *)(lVar20 + *(ulong *)(lVar24 + 0x110) * 8);
        lVar13 = *(long *)(lVar13 + 0x18);
        if (uVar15 == 0) goto LAB_1400ce9dc;
        local_1b8 = *(long *)(lVar13 + 0x10 + ~uVar15 * 0x30);
      }
      else {
        lVar13 = *(long *)(lVar13 + 0x18);
LAB_1400ce9dc:
        local_1b8 = 0;
      }
      lVar25 = ~*(ulong *)(lVar20 + *(long *)(lVar24 + 0x118) * 8) * 0x30;
      local_1a8 = *(long *)(lVar13 + 0x10 + lVar25);
      local_198 = *(long *)(lVar13 + 0x28 + lVar25);
      local_190 = *(long *)(lVar12 + 0x50);
      uVar11 = 0;
    }
    uVar22 = ~*(uint *)(local_190 + 8 + (ulong)uVar11 * 0x10);
    goto LAB_1400cea3d;
  }
  uVar22 = uVar11;
  if (uVar11 != (uint)lVar18) goto LAB_1400cea3d;
  do {
    if (puVar26 == puVar31) goto LAB_1400cec5e;
    uVar11 = *puVar26;
    puVar26 = puVar26 + 1;
    lVar18 = *(long *)(*(long *)(lVar33 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
  } while (lVar18 == 0);
  lVar13 = *(long *)(lVar33 + 0x1a8) + (ulong)uVar11 * 0x48;
  if (*(ulong *)(lVar24 + 0x110) < *(ulong *)(lVar13 + 0x40)) {
    uVar15 = *(ulong *)(*(long *)(lVar13 + 0x38) + *(ulong *)(lVar24 + 0x110) * 8);
    lVar25 = *(long *)(lVar13 + 0x18);
    if (uVar15 == 0) goto LAB_1400ce994;
    local_1b8 = *(long *)(lVar25 + 0x10 + ~uVar15 * 0x30);
  }
  else {
    lVar25 = *(long *)(lVar13 + 0x18);
LAB_1400ce994:
    local_1b8 = 0;
  }
  lVar13 = ~*(ulong *)(*(long *)(lVar13 + 0x38) + *(long *)(lVar24 + 0x118) * 8) * 0x30;
  local_1a8 = *(long *)(lVar25 + 0x10 + lVar13);
  local_198 = *(long *)(lVar25 + 0x28 + lVar13);
  uVar11 = 0;
  uVar22 = uVar11;
LAB_1400cea3d:
  uVar15 = (ulong)uVar22;
  puVar1 = (undefined8 *)(local_1a8 + uVar15 * 0x14);
  uVar11 = uVar11 + 1;
  fVar43 = (fVar38 - *(float *)(local_1b8 + uVar15 * 4)) / fVar37;
  fVar44 = 0.0;
  if (0.0 <= fVar43) {
    fVar44 = fVar43;
  }
  fVar43 = fVar39;
  if (fVar44 <= fVar39) {
    fVar43 = fVar44;
  }
  *(undefined4 *)(local_198 + uVar15 * 4) = uVar41;
  *puVar1 = 0;
  puVar1[1] = 0;
  *(float *)(puVar1 + 2) = fVar43 * fVar46;
  fVar43 = fVar43 + fVar40;
  puVar34 = *(uint **)(lVar14 + 0xf8);
  puVar2 = puVar34 + *(long *)(lVar14 + 0x100);
  fVar44 = (fVar43 * fVar43 * fVar36 + fVar43 * fVar43 * fVar43 * fVar47 + fVar39) * fVar35 + fVar45
  ;
  if (*(char *)(lVar14 + 0x108) == '\0') {
    lVar25 = 0;
    lVar13 = 8;
    unaff_R13 = (undefined4 *)0x0;
    uVar22 = 0;
    do {
      if (uVar22 == (uint)lVar25) {
        do {
          if (puVar34 == puVar2) goto LAB_1400ce860;
          uVar22 = *puVar34;
          puVar34 = puVar34 + 1;
          lVar13 = *(long *)(lVar21 + 0x108);
          puVar32 = (undefined4 *)((ulong)uVar22 * 0xa0);
          lVar25 = *(long *)(lVar13 + 0x58 + (long)puVar32);
          unaff_R13 = puVar32;
        } while (lVar25 == 0);
        uVar15 = (ulong)*(uint *)((long)puVar32 + lVar13 + 0x94);
        lVar19 = *(long *)(*(long *)(lVar21 + 0x1a8) + 0x18 + uVar15 * 0x48);
        lVar20 = ~*(ulong *)(*(long *)(*(long *)(lVar21 + 0x1a8) + 0x38 + uVar15 * 0x48) +
                            *(long *)(lVar14 + 0x110) * 8) * 0x30;
        unaff_R13 = *(undefined4 **)(lVar19 + 0x10 + lVar20);
        lVar19 = *(long *)(lVar19 + 0x28 + lVar20);
        lVar13 = *(long *)((long)puVar32 + lVar13 + 0x50);
        uVar22 = 0;
      }
      uVar15 = (ulong)uVar22;
      uVar22 = uVar22 + 1;
      uVar15 = (ulong)~*(uint *)(lVar13 + 8 + uVar15 * 0x10);
      *(undefined4 *)(lVar19 + uVar15 * 4) = uVar42;
      unaff_R13[uVar15 * 8 + 4] = fVar44;
      unaff_R13[uVar15 * 8 + 5] = fVar44;
    } while( true );
  }
  lVar25 = 0;
  lVar13 = 0;
  uVar22 = 0;
  do {
    if (uVar22 == (uint)lVar25) {
      do {
        if (puVar34 == puVar2) goto LAB_1400ce860;
        uVar15 = (ulong)*puVar34;
        puVar34 = puVar34 + 1;
        unaff_R13 = (undefined4 *)(uVar15 * 9);
        lVar25 = *(long *)(*(long *)(lVar21 + 0x1a8) + 0x10 + uVar15 * 0x48);
      } while (lVar25 == 0);
      lVar19 = *(long *)(lVar21 + 0x1a8) + uVar15 * 0x48;
      lVar20 = *(long *)(lVar19 + 0x18);
      lVar19 = ~*(ulong *)(*(long *)(lVar19 + 0x38) + *(long *)(lVar14 + 0x110) * 8) * 0x30;
      lVar13 = *(long *)(lVar20 + 0x10 + lVar19);
      lVar19 = *(long *)(lVar20 + 0x28 + lVar19);
      uVar22 = 0;
    }
    uVar15 = (ulong)uVar22;
    uVar22 = uVar22 + 1;
    *(undefined4 *)(lVar19 + uVar15 * 4) = uVar42;
    unaff_R13 = (undefined4 *)(uVar15 * 0x20);
    *(float *)(lVar13 + 0x10 + (long)unaff_R13) = fVar44;
    *(float *)(lVar13 + 0x14 + (long)unaff_R13) = fVar44;
  } while( true );
LAB_1400cec5e:
  puVar26 = *(uint **)(lVar17 + 0xf8);
  puVar31 = puVar26 + *(long *)(lVar17 + 0x100);
  cVar5 = *(char *)(lVar17 + 0x108);
  local_190 = 8;
  uVar15 = 0;
  uVar41 = (undefined4)_DAT_145dcd0c0;
  uVar42 = (undefined4)((ulong)_DAT_145dcd0c0 >> 0x20);
  lVar24 = 0;
  local_1a8 = 0;
  local_1b0 = 0;
  local_1b8 = 0;
  fVar39 = _DAT_145dcd048;
  fVar37 = _DAT_145dcd054;
  fVar40 = _DAT_145dcd0b0;
  fVar45 = _DAT_145d97640;
  fVar46 = _DAT_145dcd0b4;
  fVar47 = _DAT_145dcd0b8;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  do {
    if (cVar5 == '\0') {
      if ((int)uVar15 == (int)lVar24) {
        do {
          if (puVar26 == puVar31) goto LAB_1400cf005;
          uVar11 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar24 = *(long *)(*(long *)(local_170 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
        } while (lVar24 == 0);
        lVar18 = *(long *)(local_170 + 0x108) + (ulong)uVar11 * 0xa0;
        uVar15 = (ulong)*(uint *)(lVar18 + 0x94);
        lVar14 = *(long *)(local_170 + 0x1a8);
        lVar33 = lVar14 + uVar15 * 0x48;
        lVar21 = *(long *)(lVar14 + 0x38 + uVar15 * 0x48);
        if (*(ulong *)(lVar17 + 0x110) < *(ulong *)(lVar14 + 0x40 + uVar15 * 0x48)) {
          uVar15 = *(ulong *)(lVar21 + *(ulong *)(lVar17 + 0x110) * 8);
          lVar33 = *(long *)(lVar33 + 0x18);
          if (uVar15 == 0) goto LAB_1400cef73;
          local_1b0 = *(long *)(lVar33 + 0x10 + ~uVar15 * 0x30);
        }
        else {
          lVar33 = *(long *)(lVar33 + 0x18);
LAB_1400cef73:
          local_1b0 = 0;
        }
        lVar14 = ~*(ulong *)(lVar21 + *(long *)(lVar17 + 0x118) * 8) * 0x30;
        local_1b8 = *(long *)(lVar33 + 0x10 + lVar14);
        local_188 = *(long *)(lVar33 + 0x28 + lVar14);
        lVar14 = ~*(ulong *)(lVar21 + *(long *)(lVar17 + 0x120) * 8) * 0x30;
        local_1a8 = *(long *)(lVar33 + 0x10 + lVar14);
        local_198 = *(long *)(lVar33 + 0x28 + lVar14);
        local_190 = *(long *)(lVar18 + 0x50);
        uVar15 = 0;
      }
      iVar23 = (int)uVar15;
      uVar15 = (ulong)~*(uint *)(local_190 + 8 + uVar15 * 0x10);
    }
    else {
      if ((int)uVar15 == (int)lVar24) {
        do {
          if (puVar26 == puVar31) goto LAB_1400cf005;
          uVar11 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar24 = *(long *)(*(long *)(local_170 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
        } while (lVar24 == 0);
        lVar33 = *(long *)(local_170 + 0x1a8) + (ulong)uVar11 * 0x48;
        lVar14 = *(long *)(lVar33 + 0x38);
        if (*(ulong *)(lVar17 + 0x110) < *(ulong *)(lVar33 + 0x40)) {
          uVar15 = *(ulong *)(lVar14 + *(ulong *)(lVar17 + 0x110) * 8);
          lVar33 = *(long *)(lVar33 + 0x18);
          if (uVar15 == 0) goto LAB_1400cecf8;
          local_1b0 = *(long *)(lVar33 + 0x10 + ~uVar15 * 0x30);
        }
        else {
          lVar33 = *(long *)(lVar33 + 0x18);
LAB_1400cecf8:
          local_1b0 = 0;
        }
        lVar21 = ~*(ulong *)(lVar14 + *(long *)(lVar17 + 0x118) * 8) * 0x30;
        local_1b8 = *(long *)(lVar33 + 0x10 + lVar21);
        local_188 = *(long *)(lVar33 + 0x28 + lVar21);
        lVar14 = ~*(ulong *)(lVar14 + *(long *)(lVar17 + 0x120) * 8) * 0x30;
        local_1a8 = *(long *)(lVar33 + 0x10 + lVar14);
        local_198 = *(long *)(lVar33 + 0x28 + lVar14);
        uVar15 = 0;
      }
      iVar23 = (int)uVar15;
    }
    pfVar29 = (float *)(local_1b0 + uVar15 * 0xc);
    lVar14 = uVar15 * 0x180 + local_1b8;
    lVar33 = uVar15 * 4;
    unaff_R13 = (undefined4 *)(local_1a8 + uVar15 * 0x14);
    local_1a0 = (undefined4 *)(local_198 + uVar15 * 4);
    uVar15 = (ulong)(iVar23 + 1);
    fVar36 = pfVar29[2];
    fVar44 = pfVar29[1] * fVar38 + fVar36;
    fVar35 = (float)func_0x000145bf2971(fVar44);
    fVar44 = fVar44 - fVar35;
    fVar35 = (float)func_0x000145bf2977(fVar36 * fVar39 + fVar44 * fVar37);
    fVar36 = *pfVar29;
    *(undefined4 *)(lVar14 + 0x68) = 2;
    *(float *)(lVar14 + 0x6c) = fVar35 + fVar35 + fVar36;
    *(undefined4 *)(local_188 + lVar33) = uVar6;
    *(undefined4 *)(lVar14 + 0x78) = 2;
    *(float *)(lVar14 + 0x7c) = fVar44 * fVar40 + fVar45;
    uVar28 = uVar6;
    fVar36 = (float)func_0x000145bf2977(fVar44 * fVar46);
    *local_1a0 = uVar28;
    *unaff_R13 = 0;
    *(ulong *)(unaff_R13 + 1) = CONCAT44(uVar42,uVar41);
    unaff_R13[3] = 0x3eb33333;
    unaff_R13[4] = fVar36 * fVar47;
  } while( true );
LAB_1400cf005:
  func_0x000145bf2977(_DAT_145dcd0d0 * fVar38);
  puVar26 = *(uint **)(puVar27 + 0x3e);
  puVar31 = puVar26 + *(long *)(puVar27 + 0x40);
  puVar32 = puVar27;
  fVar39 = _DAT_145d97614;
  if (*(char *)(puVar27 + 0x42) == '\0') {
    lVar14 = 0;
    lVar33 = 8;
    lVar24 = 0;
    uVar15 = 0;
    do {
      if ((int)uVar15 == (int)lVar14) {
        do {
          if (puVar26 == puVar31) goto LAB_1400cf21a;
          uVar11 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar33 = *(long *)(local_120 + 0x108);
          puVar32 = (undefined4 *)((ulong)uVar11 * 0xa0);
          lVar14 = *(long *)(lVar33 + 0x58 + (long)puVar32);
        } while (lVar14 == 0);
        uVar15 = (ulong)*(uint *)((long)puVar32 + lVar33 + 0x94);
        lVar21 = *(long *)(*(long *)(local_120 + 0x1a8) + 0x18 + uVar15 * 0x48);
        lVar17 = ~*(ulong *)(*(long *)(*(long *)(local_120 + 0x1a8) + 0x38 + uVar15 * 0x48) +
                            *(long *)(puVar27 + 0x44) * 8) * 0x30;
        lVar24 = *(long *)(lVar21 + 0x10 + lVar17);
        local_1a0 = *(undefined4 **)(lVar21 + 0x28 + lVar17);
        lVar33 = *(long *)((long)puVar32 + lVar33 + 0x50);
        uVar15 = 0;
      }
      uVar16 = uVar15 & 0xffffffff;
      uVar15 = (ulong)((int)uVar15 + 1);
      uVar16 = (ulong)~*(uint *)(lVar33 + 8 + uVar16 * 0x10);
      func_0x000144c7e960();
      local_1a0[uVar16] = uVar7;
      *(undefined4 *)(lVar24 + 0x10 + uVar16 * 0x14) = local_138;
      puVar32 = (undefined4 *)(lVar24 + uVar16 * 0x14);
      *puVar32 = local_148;
      puVar32[1] = uStack_144;
      puVar32[2] = uStack_140;
      puVar32[3] = uStack_13c;
      puVar32 = local_1a0;
    } while( true );
  }
  lVar33 = 0;
  lVar24 = 0;
  uVar15 = 0;
  do {
    uVar11 = (uint)uVar15;
    if (uVar11 == (uint)lVar33) {
      do {
        if (puVar26 == puVar31) goto LAB_1400cf21a;
        uVar15 = (ulong)*puVar26;
        puVar26 = puVar26 + 1;
        puVar32 = (undefined4 *)(uVar15 * 9);
        lVar33 = *(long *)(*(long *)(local_120 + 0x1a8) + 0x10 + uVar15 * 0x48);
      } while (lVar33 == 0);
      lVar24 = *(long *)(local_120 + 0x1a8) + uVar15 * 0x48;
      lVar14 = *(long *)(lVar24 + 0x18);
      lVar21 = ~*(ulong *)(*(long *)(lVar24 + 0x38) + *(long *)(puVar27 + 0x44) * 8) * 0x30;
      lVar24 = *(long *)(lVar14 + 0x10 + lVar21);
      unaff_R13 = *(undefined4 **)(lVar14 + 0x28 + lVar21);
      uVar11 = 0;
    }
    uVar30 = (ulong)uVar11;
    uVar15 = (ulong)(uVar11 + 1);
    puVar32 = &local_148;
    uVar16 = uVar30;
    func_0x000144c7e960(uVar30,uVar15,0x145dce5c4);
    unaff_R13[uVar16] = uVar7;
    *(undefined4 *)(lVar24 + 0x10 + uVar30 * 0x14) = local_138;
    puVar4 = (undefined4 *)(lVar24 + uVar30 * 0x14);
    *puVar4 = local_148;
    puVar4[1] = uStack_144;
    puVar4[2] = uStack_140;
    puVar4[3] = uStack_13c;
  } while( true );
LAB_1400cf21a:
  lVar33 = local_118;
  puVar26 = *(uint **)(local_118 + 0xf8);
  puVar31 = puVar26 + *(long *)(local_118 + 0x100);
  fVar40 = fVar38 / _DAT_145da6020;
  fVar37 = (float)func_0x000145bf2971(fVar40);
  lVar24 = local_130;
  fVar37 = (fVar40 - fVar37) * _DAT_145dcd0d4 + _DAT_145dcd0d8;
  if (*(char *)(lVar33 + 0x108) == '\0') {
    lVar17 = 0;
    lVar21 = 8;
    lVar24 = 0;
    uVar11 = 0;
    lVar14 = extraout_RDX;
    do {
      if (uVar11 == (uint)lVar17) {
        do {
          if (puVar26 == puVar31) goto LAB_1400cf3d9;
          uVar11 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar17 = *(long *)(*(long *)(local_130 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
        } while (lVar17 == 0);
        lVar21 = *(long *)(local_130 + 0x108) + (ulong)uVar11 * 0xa0;
        uVar15 = (ulong)*(uint *)(lVar21 + 0x94);
        lVar14 = *(long *)(*(long *)(local_130 + 0x1a8) + 0x18 + uVar15 * 0x48);
        lVar18 = ~*(ulong *)(*(long *)(*(long *)(local_130 + 0x1a8) + 0x38 + uVar15 * 0x48) +
                            *(long *)(lVar33 + 0x110) * 8) * 0x30;
        lVar24 = *(long *)(lVar14 + 0x10 + lVar18);
        lVar14 = *(long *)(lVar14 + 0x28 + lVar18);
        lVar21 = *(long *)(lVar21 + 0x50);
        uVar11 = 0;
      }
      uVar15 = (ulong)uVar11;
      uVar11 = uVar11 + 1;
      uVar15 = (ulong)~*(uint *)(lVar21 + 8 + uVar15 * 0x10);
      lVar18 = uVar15 * 0x180;
      *(undefined4 *)(lVar14 + uVar15 * 4) = uVar8;
      *(undefined4 *)(lVar24 + 0x68 + lVar18) = 1;
      *(float *)(lVar24 + 0x6c + lVar18) = fVar37;
    } while( true );
  }
  lVar21 = 0;
  lVar14 = 0;
  uVar15 = 0;
  do {
    if ((int)uVar15 == (int)lVar21) {
      do {
        if (puVar26 == puVar31) {
LAB_1400cf3d9:
          puVar26 = *(uint **)(lVar10 + 0xf8);
          puVar31 = puVar26 + *(long *)(lVar10 + 0x100);
          cVar5 = *(char *)(lVar10 + 0x108);
          fVar38 = (float)func_0x000145bf2977(fVar38 * _DAT_145da2410);
          fVar39 = (fVar38 * fVar39 + fVar39) * _DAT_145da61b0 + _DAT_145da6024;
          lVar24 = 0;
          local_1b0 = 8;
          uVar41 = (undefined4)_DAT_145da61e0;
          uVar42 = (undefined4)((ulong)_DAT_145da61e0 >> 0x20);
          lVar33 = 0;
          local_1c0 = 0;
          uVar15 = 0;
          fVar38 = _DAT_145da61d0;
          do {
            uVar16 = uVar15;
            if (cVar5 == '\0') {
              if ((int)uVar15 == (int)lVar24) {
                do {
                  if (puVar26 == puVar31) {
                    return;
                  }
                  uVar11 = *puVar26;
                  puVar26 = puVar26 + 1;
                  lVar24 = *(long *)(*(long *)(local_128 + 0x108) + 0x58 + (ulong)uVar11 * 0xa0);
                } while (lVar24 == 0);
                lVar17 = *(long *)(local_128 + 0x108) + (ulong)uVar11 * 0xa0;
                uVar15 = (ulong)*(uint *)(lVar17 + 0x94);
                lVar33 = *(long *)(local_128 + 0x1a8);
                lVar14 = *(long *)(lVar33 + 0x18 + uVar15 * 0x48);
                lVar21 = *(long *)(lVar33 + 0x38 + uVar15 * 0x48);
                if ((*(ulong *)(lVar10 + 0x118) < *(ulong *)(lVar33 + 0x40 + uVar15 * 0x48)) &&
                   (uVar15 = *(ulong *)(lVar21 + *(ulong *)(lVar10 + 0x118) * 8), uVar15 != 0)) {
                  local_1c0 = *(long *)(lVar14 + 0x10 + ~uVar15 * 0x30);
                }
                else {
                  local_1c0 = 0;
                }
                lVar21 = ~*(ulong *)(lVar21 + *(long *)(lVar10 + 0x110) * 8) * 0x30;
                lVar33 = *(long *)(lVar14 + 0x10 + lVar21);
                local_170 = *(long *)(lVar14 + 0x28 + lVar21);
                local_1b0 = *(long *)(lVar17 + 0x50);
                uVar16 = 0;
              }
              uVar15 = (ulong)~*(uint *)(local_1b0 + 8 + uVar16 * 0x10);
            }
            else if ((int)uVar15 == (int)lVar24) {
              do {
                if (puVar26 == puVar31) {
                  return;
                }
                uVar11 = *puVar26;
                puVar26 = puVar26 + 1;
                lVar24 = *(long *)(*(long *)(local_128 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
              } while (lVar24 == 0);
              lVar33 = *(long *)(local_128 + 0x1a8) + (ulong)uVar11 * 0x48;
              lVar14 = *(long *)(lVar33 + 0x18);
              if ((*(ulong *)(lVar10 + 0x118) < *(ulong *)(lVar33 + 0x40)) &&
                 (uVar15 = *(ulong *)(*(long *)(lVar33 + 0x38) + *(ulong *)(lVar10 + 0x118) * 8),
                 uVar15 != 0)) {
                local_1c0 = *(long *)(lVar14 + 0x10 + ~uVar15 * 0x30);
              }
              else {
                local_1c0 = 0;
              }
              lVar21 = ~*(ulong *)(*(long *)(lVar33 + 0x38) + *(long *)(lVar10 + 0x110) * 8) * 0x30;
              lVar33 = *(long *)(lVar14 + 0x10 + lVar21);
              local_170 = *(long *)(lVar14 + 0x28 + lVar21);
              uVar15 = 0;
              uVar16 = uVar15;
            }
            iVar23 = (int)uVar16;
            plVar3 = (long *)(lVar33 + uVar15 * 0x18);
            puVar27 = (undefined4 *)(local_170 + uVar15 * 4);
            local_100 = fVar39;
            if (*(char *)(uVar15 + local_1c0) != '\x02') {
              local_100 = fVar38;
            }
            local_10c = CONCAT44(uVar42,uVar41);
            local_104 = 0x3e800000;
            local_110 = 0;
            func_0x000144c779b0(uVar16,puVar27,&local_110,&local_148);
            local_f8 = local_148;
            uStack_f4 = uStack_144;
            uStack_f0 = uStack_140;
            uStack_ec = uStack_13c;
            local_fc = 1;
            func_0x000142643b60();
            *puVar27 = uVar9;
            if (*plVar3 != 0) {
              func_0x0001400021d0();
            }
            uVar15 = (ulong)(iVar23 + 1);
            plVar3[2] = CONCAT44(uStack_134,local_138);
            *(undefined4 *)plVar3 = local_148;
            *(undefined4 *)((long)plVar3 + 4) = uStack_144;
            *(undefined4 *)(plVar3 + 1) = uStack_140;
            *(undefined4 *)((long)plVar3 + 0xc) = uStack_13c;
          } while( true );
        }
        uVar11 = *puVar26;
        puVar26 = puVar26 + 1;
        lVar21 = *(long *)(*(long *)(lVar24 + 0x1a8) + 0x10 + (ulong)uVar11 * 0x48);
      } while (lVar21 == 0);
      lVar14 = *(long *)(lVar24 + 0x1a8) + (ulong)uVar11 * 0x48;
      lVar17 = *(long *)(lVar14 + 0x18);
      lVar18 = ~*(ulong *)(*(long *)(lVar14 + 0x38) + *(long *)(lVar33 + 0x110) * 8) * 0x30;
      lVar14 = *(long *)(lVar17 + 0x10 + lVar18);
      puVar32 = *(undefined4 **)(lVar17 + 0x28 + lVar18);
      uVar15 = 0;
    }
    puVar32[uVar15] = uVar8;
    *(undefined4 *)(lVar14 + 0x68 + uVar15 * 0x180) = 1;
    *(float *)(lVar14 + 0x6c + uVar15 * 0x180) = fVar37;
    uVar15 = (ulong)((int)uVar15 + 1);
  } while( true );
}
