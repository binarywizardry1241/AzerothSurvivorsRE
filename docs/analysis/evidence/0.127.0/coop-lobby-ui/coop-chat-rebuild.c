
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 param_4,ulong *param_5,
          long *param_6)

{
  byte bVar1;
  uint *puVar2;
  int *piVar3;
  ulong *puVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined4 uVar7;
  int iVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  uint *puVar13;
  uint uVar14;
  uint *puVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  ulong uVar19;
  long lVar20;
  ulong uVar21;
  long lVar22;
  uint uVar23;
  bool bVar24;
  float fVar25;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  undefined8 *in_stack_00000038;
  long *in_stack_00000040;
  long *in_stack_00000048;
  ulong *in_stack_00000050;
  undefined4 local_258;
  undefined4 uStack_254;
  undefined4 uStack_250;
  undefined4 uStack_24c;
  undefined4 local_248;
  undefined4 uStack_244;
  undefined4 uStack_240;
  undefined4 uStack_23c;
  ulong *local_238;
  undefined8 *puStack_230;
  undefined8 local_228;
  undefined8 uStack_220;
  undefined8 *local_218;
  ulong local_210;
  ulong uStack_208;
  ulong local_200;
  ulong uStack_1f8;
  long local_1f0;
  long lStack_1e8;
  long local_1e0;
  long lStack_1d8;
  undefined8 local_1d0;
  undefined8 uStack_1c8;
  undefined8 local_1c0;
  undefined8 uStack_1b8;
  long local_1b0;
  long lStack_1a8;
  undefined8 local_1a0;
  long local_198;
  long lStack_190;
  long local_188;
  undefined8 local_180;
  undefined8 uStack_178;
  undefined8 local_170;
  undefined8 uStack_168;
  long local_160;
  long lStack_158;
  long local_150;
  long lStack_148;
  ulong *local_140;
  ulong local_130;
  ulong *local_128;
  undefined8 *local_120;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined8 *local_108;
  undefined4 *local_100;
  ulong *local_f8;
  long local_f0;
  ulong local_e8;
  undefined4 *local_e0;
  ulong *local_d8;
  undefined8 *local_d0;
  ulong *local_c8;
  long *plStack_c0;
  undefined8 *local_b8;
  undefined4 local_ac;
  long local_a8;
  long local_a0;
  undefined4 *local_98;
  long local_90;
  ulong *local_88;
  long local_80;
  undefined4 *local_78;
  int *local_70;
  ulong *local_68;
  undefined8 local_60;
  undefined1 local_51;
  undefined8 local_50;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  local_218 = (undefined8 *)param_3[4];
  local_238 = (ulong *)*param_3;
  puStack_230 = (undefined8 *)param_3[1];
  local_228 = (ulong *)param_3[2];
  uStack_220 = (long *)param_3[3];
  uVar21 = *param_5;
  uStack_208 = param_5[1];
  local_200 = param_5[2];
  uStack_1f8 = param_5[3];
  lVar16 = *param_6;
  lStack_1e8 = param_6[1];
  local_1e0 = param_6[2];
  lStack_1d8 = param_6[3];
  local_180 = *in_stack_00000028;
  uStack_178 = in_stack_00000028[1];
  local_170 = in_stack_00000028[2];
  uStack_168 = in_stack_00000028[3];
  local_160 = *in_stack_00000030;
  lStack_158 = in_stack_00000030[1];
  local_150 = in_stack_00000030[2];
  lStack_148 = in_stack_00000030[3];
  local_1d0 = *in_stack_00000038;
  uStack_1c8 = in_stack_00000038[1];
  local_1c0 = in_stack_00000038[2];
  uStack_1b8 = in_stack_00000038[3];
  local_1b0 = *in_stack_00000040;
  lStack_1a8 = in_stack_00000040[1];
  lVar18 = in_stack_00000040[2];
  local_188 = in_stack_00000048[2];
  local_198 = *in_stack_00000048;
  lStack_190 = in_stack_00000048[1];
  local_140 = in_stack_00000050;
  if (local_160 == 0) {
    return;
  }
  local_258 = (undefined4)*in_stack_00000030;
  uStack_254 = *(undefined4 *)((long)in_stack_00000030 + 4);
  uStack_250 = (undefined4)in_stack_00000030[1];
  uStack_24c = *(undefined4 *)((long)in_stack_00000030 + 0xc);
  local_248 = (undefined4)in_stack_00000030[2];
  uStack_244 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  uStack_240 = (undefined4)in_stack_00000030[3];
  uStack_23c = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  local_1a0._4_4_ = (undefined4)((ulong)lVar18 >> 0x20);
  local_ac = local_1a0._4_4_;
  puVar13 = *(uint **)(local_1b0 + 0xf8);
  puVar2 = puVar13 + *(long *)(local_1b0 + 0x100);
  bVar1 = *(byte *)(local_1b0 + 0x108);
  local_68 = (ulong *)(ulong)bVar1;
  local_98 = (undefined4 *)CONCAT71(local_98._1_7_,bVar1);
  if (bVar1 == 0) {
    lVar9 = 8;
    uVar11 = 0;
    uVar23 = 0;
    lVar22 = 0;
    local_90 = 0;
    local_80 = 0;
    local_60 = (ulong)local_60._4_4_ << 0x20;
    uVar10 = 0;
    puVar15 = puVar13;
    local_68 = param_5;
    do {
      while( true ) {
        uVar14 = uVar23;
        if (uVar23 == (uint)uVar10) {
          uVar19 = 0;
          lVar22 = 8;
          puVar13 = puVar15;
          if (puVar15 == puVar2) goto LAB_1402e4a04;
          while( true ) {
            uVar10 = *(ulong *)(*(long *)(lStack_1a8 + 0x108) + 0x58 + (ulong)*puVar15 * 0xa0);
            if (uVar10 != 0) break;
            puVar15 = puVar15 + 1;
            puVar13 = puVar2;
            if (puVar15 == puVar2) goto LAB_1402e4abb;
          }
          lVar9 = *(long *)(lStack_1a8 + 0x108) + (ulong)*puVar15 * 0xa0;
          lVar22 = (ulong)*(uint *)(lVar9 + 0x94) * 0x48 + *(long *)(lStack_1a8 + 0x1a8);
          uVar11 = *(ulong *)(local_1b0 + 0x110);
          uVar14 = 0;
          if ((uVar11 < *(ulong *)(lVar9 + 0x88)) &&
             (*(long *)(*(long *)(lVar9 + 0x80) + uVar11 * 8) != 0)) {
            local_60 = CONCAT44(local_60._4_4_,
                                (int)CONCAT71((int7)((ulong)*(long *)(lVar9 + 0x80) >> 8),1));
            if ((uVar11 < *(ulong *)(lVar22 + 0x40)) &&
               (uVar11 = *(ulong *)(*(long *)(lVar22 + 0x38) + uVar11 * 8), uVar11 != 0)) {
              local_80 = *(long *)(*(long *)(lVar22 + 0x18) + 0x10 + ~uVar11 * 0x30);
            }
            else {
              local_80 = 0;
            }
          }
          else {
            local_60 = (ulong)local_60._4_4_ << 0x20;
          }
          puVar15 = puVar15 + 1;
          lVar12 = *(long *)(lVar22 + 0x18);
          lVar20 = ~*(ulong *)(*(long *)(lVar22 + 0x38) + *(long *)(local_1b0 + 0x118) * 8) * 0x30;
          local_90 = *(long *)(lVar12 + 0x10 + lVar20);
          local_a8 = *(long *)(lVar12 + 0x28 + lVar20);
          lVar20 = ~*(ulong *)(*(long *)(lVar22 + 0x38) + *(long *)(local_1b0 + 0x120) * 8) * 0x30;
          lVar22 = *(long *)(lVar12 + 0x10 + lVar20);
          local_a0 = *(long *)(lVar12 + 0x28 + lVar20);
          lVar9 = *(long *)(lVar9 + 0x50);
          uVar11 = uVar10 & 0xffffffff;
        }
        uVar19 = *(ulong *)(lVar9 + (ulong)uVar14 * 0x10);
        if ((int)uVar19 != 0) break;
        uVar23 = uVar14 + 1;
      }
      uVar17 = (ulong)~*(uint *)((ulong)uVar14 * 0x10 + lVar9 + 8);
      local_78 = (undefined4 *)(local_80 + uVar17 * 0x18);
      if ((char)local_60 == '\0') {
        local_78 = (undefined4 *)0x0;
      }
      local_50 = (float *)(local_90 + uVar17 * 0xc);
      local_70 = (int *)(local_a8 + uVar17 * 4);
      in_stack_00000048 = (long *)(uVar17 * 0x180 + lVar22);
      local_88 = (ulong *)(local_a0 + uVar17 * 4);
      local_68 = (ulong *)(uVar19 >> 0x20);
      uVar23 = uVar14 + 1;
    } while ((int)uVar19 == 0);
    uVar23 = uVar14 + 1;
    puVar13 = puVar15;
  }
  else {
    lVar22 = 8;
    uVar11 = 0;
    uVar23 = 0;
    lVar9 = 0;
    local_90 = 0;
    local_80 = 0;
    local_60 = (ulong)local_60._4_4_ << 0x20;
    uVar10 = 0;
    do {
      while( true ) {
        uVar14 = uVar23;
        if (uVar23 == (uint)uVar10) {
          lVar9 = 8;
          if (puVar13 == puVar2) goto LAB_1402e4a04;
          puVar15 = puVar13;
          while( true ) {
            uVar10 = *(ulong *)(*(long *)(lStack_1a8 + 0x1a8) + 0x10 + (ulong)*puVar15 * 0x48);
            if (uVar10 != 0) break;
            puVar15 = puVar15 + 1;
            puVar13 = puVar2;
            if (puVar15 == puVar2) goto LAB_1402e4a04;
          }
          lVar9 = *(long *)(lStack_1a8 + 0x1a8) + (ulong)*puVar15 * 0x48;
          uVar14 = 0;
          lVar12 = *(long *)(lVar9 + 0x38);
          if ((*(ulong *)(local_1b0 + 0x110) < *(ulong *)(lVar9 + 0x40)) &&
             (uVar11 = *(ulong *)(lVar12 + *(ulong *)(local_1b0 + 0x110) * 8), uVar11 != 0)) {
            local_80 = *(long *)(*(long *)(lVar9 + 0x18) + 0x10 + ~uVar11 * 0x30);
            local_60 = CONCAT44(local_60._4_4_,(int)CONCAT71((int7)((ulong)local_80 >> 8),1));
          }
          else {
            local_60 = (ulong)local_60._4_4_ << 0x20;
          }
          puVar13 = puVar15 + 1;
          lVar22 = *(long *)(lVar9 + 8);
          lVar20 = *(long *)(lVar9 + 0x18);
          lVar9 = ~*(ulong *)(lVar12 + *(long *)(local_1b0 + 0x118) * 8) * 0x30;
          local_90 = *(long *)(lVar20 + 0x10 + lVar9);
          local_a8 = *(long *)(lVar20 + 0x28 + lVar9);
          lVar12 = ~*(ulong *)(lVar12 + *(long *)(local_1b0 + 0x120) * 8) * 0x30;
          lVar9 = *(long *)(lVar20 + 0x10 + lVar12);
          local_a0 = *(long *)(lVar20 + 0x28 + lVar12);
          uVar11 = uVar10 & 0xffffffff;
        }
        uVar17 = (ulong)uVar14;
        uVar19 = *(ulong *)(lVar22 + uVar17 * 8);
        if ((int)uVar19 != 0) break;
        uVar23 = uVar14 + 1;
      }
      local_78 = (undefined4 *)(local_80 + uVar17 * 0x18);
      if ((char)local_60 == '\0') {
        local_78 = (undefined4 *)0x0;
      }
      local_50 = (float *)(local_90 + uVar17 * 0xc);
      local_70 = (int *)(local_a8 + uVar17 * 4);
      in_stack_00000048 = (long *)(uVar17 * 0x180 + lVar9);
      local_88 = (ulong *)(local_a0 + uVar17 * 4);
      local_68 = (ulong *)(uVar19 >> 0x20);
      uVar23 = uVar14 + 1;
    } while ((int)uVar19 == 0);
    uVar23 = uVar14 + 1;
    lVar9 = 8;
    if (bVar1 != 0) goto LAB_1402e4a4f;
  }
LAB_1402e4abb:
  do {
    if (uVar23 == (uint)uVar11) {
      do {
        if (puVar13 == puVar2) goto LAB_1402e4ae6;
        uVar23 = *puVar13;
        puVar13 = puVar13 + 1;
        uVar11 = *(ulong *)(*(long *)(lStack_1a8 + 0x108) + 0x58 + (ulong)uVar23 * 0xa0);
      } while (uVar11 == 0);
      lVar9 = *(long *)(*(long *)(lStack_1a8 + 0x108) + (ulong)uVar23 * 0xa0 + 0x50);
      uVar23 = 0;
    }
    uVar10 = (ulong)uVar23;
    uVar23 = uVar23 + 1;
    iVar8 = *(int *)(lVar9 + uVar10 * 0x10);
  } while (iVar8 == 0);
LAB_1402e4ae9:
  local_210 = uVar21;
  local_1f0 = lVar16;
  local_1a0 = lVar18;
  if (((int)uVar19 == 0) || (iVar8 != 0)) {
    if (*in_stack_00000050 != 0xffffffffffffffff) {
      if (*in_stack_00000050 != 0) {
        func_0x0001400021d0();
      }
      if (in_stack_00000050[5] != 0) {
        func_0x0001400021d0();
      }
    }
    *in_stack_00000050 = 0xffffffffffffffff;
    return;
  }
  fVar25 = _DAT_1462777e0;
  if (*(long *)(uVar21 + 0x50) != 0) {
    puVar2 = *(uint **)(uVar21 + 0x18);
    lVar18 = *(long *)(uVar21 + 0x20);
    if (lVar18 == 4) {
      uVar23 = *puVar2;
      uVar23 = uVar23 >> 0x18 | (uVar23 & 0xff0000) >> 8 | (uVar23 & 0xff00) << 8 | uVar23 << 0x18;
      if (0x6c656674 < uVar23 != uVar23 < 0x6c656674) goto LAB_1402e4c23;
    }
    else {
      if (lVar18 == 6) {
        uVar23 = *puVar2;
        uVar23 = uVar23 >> 0x18 | (uVar23 & 0xff0000) >> 8 | (uVar23 & 0xff00) << 8 | uVar23 << 0x18
        ;
        uVar14 = 0x6a6f696e;
        if (uVar23 != 0x6a6f696e) goto LAB_1402e4c08;
        uVar23 = (uint)(ushort)((ushort)puVar2[1] << 8 | (ushort)puVar2[1] >> 8);
        uVar14 = 0x6564;
        iVar8 = 0;
        if (uVar23 != 0x6564) goto LAB_1402e4c08;
      }
      else {
        if (lVar18 != 7) goto LAB_1402e4c23;
        if (*(int *)((long)puVar2 + 3) == 0x676e6974 && *puVar2 == 0x74736f68) goto LAB_1402e4c1b;
        uVar23 = *puVar2;
        uVar23 = uVar23 >> 0x18 | (uVar23 & 0xff0000) >> 8 | (uVar23 & 0xff00) << 8 | uVar23 << 0x18
        ;
        uVar14 = 0x6a6f696e;
        if (uVar23 == 0x6a6f696e) {
          uVar23 = *(uint *)((long)puVar2 + 3);
          uVar23 = uVar23 >> 0x18 | (uVar23 & 0xff0000) >> 8 | (uVar23 & 0xff00) << 8 |
                   uVar23 << 0x18;
          uVar14 = 0x6e696e67;
          iVar8 = 0;
          if (uVar23 == 0x6e696e67) goto LAB_1402e4c17;
        }
LAB_1402e4c08:
        iVar8 = (uint)(uVar14 <= uVar23) * 2 + -1;
      }
LAB_1402e4c17:
      if (iVar8 != 0) goto LAB_1402e4c23;
    }
LAB_1402e4c1b:
    fVar25 = _DAT_1462777e4;
  }
LAB_1402e4c23:
  if ((*local_50 != fVar25) || (NAN(*local_50) || NAN(fVar25))) {
LAB_1402e4c45:
    *local_70 = local_1a0._4_4_;
    *local_50 = fVar25;
    local_50[1] = 680.0;
    *(undefined4 *)(in_stack_00000048 + 0x11) = 1;
    *(float *)((long)in_stack_00000048 + 0x8c) = fVar25;
    *(undefined4 *)local_88 = local_1a0._4_4_;
    in_stack_00000048[0x12] = 0x442a000000000001;
  }
  else if ((local_50[1] != _DAT_1462777e8) || (NAN(local_50[1]) || NAN(_DAT_1462777e8)))
  goto LAB_1402e4c45;
  uVar10 = *(ulong *)(uVar21 + 0x1a8);
  local_50 = (float *)CONCAT71(local_50._1_7_,*(undefined1 *)(lVar16 + 0x30));
  local_60 = uVar21;
  func_0x000146034930(uVar19,lVar16,lVar16 + 0x18,&local_130);
  local_70 = (int *)CONCAT71(local_70._1_7_,*(undefined1 *)(lVar16 + 0x38));
  func_0x000146034930();
  puVar6 = local_d0;
  puVar5 = local_120;
  puVar4 = local_128;
  local_98 = local_e0;
  local_88 = local_d8;
  uVar11 = *in_stack_00000050;
  uVar17 = local_130;
  if (((local_78 == (undefined4 *)0x0) || (*(long *)(local_78 + 4) == 0)) ||
     (uVar11 == 0xffffffffffffffff)) {
    if (uVar11 != 0xffffffffffffffff) goto LAB_1402e4dec;
  }
  else {
    if (((((in_stack_00000050[3] == uVar10) && ((char)in_stack_00000050[4] == (char)local_50)) &&
         (((undefined8 *)in_stack_00000050[2] == local_120 &&
          ((iVar8 = func_0x000146061721(), iVar8 == 0 &&
           (*(char *)((long)in_stack_00000050 + 0x21) == (char)local_70)))))) &&
        ((undefined8 *)in_stack_00000050[7] == puVar6)) &&
       (iVar8 = func_0x000146061721(), iVar8 == 0)) {
      local_100 = local_98;
      if (uVar17 != 0) {
        func_0x0001400021d0();
        local_100 = local_98;
      }
      goto joined_r0x0001402e53d9;
    }
LAB_1402e4dec:
    if (uVar11 != 0) {
      func_0x0001400021d0();
    }
    local_130 = uVar17;
    if (in_stack_00000050[5] != 0) {
      func_0x0001400021d0();
      local_130 = uVar17;
    }
  }
  local_68 = (ulong *)((long)local_68 << 0x20 | uVar19 & 0xffffffff);
  *in_stack_00000050 = local_130;
  in_stack_00000050[1] = (ulong)puVar4;
  in_stack_00000050[2] = (ulong)puVar5;
  in_stack_00000050[3] = uVar10;
  *(char *)(in_stack_00000050 + 4) = (char)local_50;
  *(char *)((long)in_stack_00000050 + 0x21) = (char)local_70;
  in_stack_00000050[5] = (ulong)local_98;
  in_stack_00000050[6] = (ulong)local_88;
  in_stack_00000050[7] = (ulong)puVar6;
  puVar13 = *(uint **)(local_198 + 0xf8);
  puVar2 = puVar13 + *(long *)(local_198 + 0x100);
  if (*(char *)(local_198 + 0x108) == '\0') {
    lVar22 = 8;
    lVar16 = 0;
    uVar10 = 0;
    lVar18 = 0;
LAB_1402e507a:
    do {
      if ((int)uVar10 == (int)lVar18) {
        do {
          if (puVar13 == puVar2) goto LAB_1402e5259;
          uVar23 = *puVar13;
          puVar13 = puVar13 + 1;
          lVar18 = *(long *)(*(long *)(lStack_190 + 0x108) + 0x58 + (ulong)uVar23 * 0xa0);
        } while (lVar18 == 0);
        lVar22 = *(long *)(lStack_190 + 0x108) + (ulong)uVar23 * 0xa0;
        uVar21 = (ulong)*(uint *)(lVar22 + 0x94);
        if (*(ulong *)(local_198 + 0x110) <
            *(ulong *)(*(long *)(lStack_190 + 0x1a8) + 0x40 + uVar21 * 0x48)) {
          lVar16 = *(long *)(lStack_190 + 0x1a8) + uVar21 * 0x48;
          uVar21 = *(ulong *)(*(long *)(lVar16 + 0x38) + *(ulong *)(local_198 + 0x110) * 8);
          if (uVar21 == 0) goto LAB_1402e5103;
          lVar16 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar21 * 0x30);
        }
        else {
LAB_1402e5103:
          lVar16 = 0;
        }
        lVar22 = *(long *)(lVar22 + 0x50);
        uVar10 = 0;
      }
      lVar9 = uVar10 * 0x10;
      uVar11 = *(ulong *)(lVar22 + lVar9);
      if ((int)uVar11 == 0) {
        uVar10 = (ulong)((int)uVar10 + 1);
        goto LAB_1402e507a;
      }
      uVar21 = uVar11 >> 0x20;
      uVar10 = (ulong)((int)uVar10 + 1);
    } while (((int)uVar11 == 0) || (*(long *)(local_60 + 0x50) == 0));
    piVar3 = *(int **)(local_60 + 0x18);
    lVar12 = *(long *)(local_60 + 0x20);
    if (lVar12 == 4) {
      if (*piVar3 != 0x7466656c) goto LAB_1402e507a;
    }
    else {
      uVar7 = local_50._4_4_;
      if (lVar12 == 6) {
        iVar8 = *piVar3;
        uVar23 = *(ushort *)(piVar3 + 1) ^ 0x6465;
      }
      else {
        if (lVar12 != 7) goto LAB_1402e507a;
        local_50 = (float *)(CONCAT44(local_50._4_4_,*piVar3) ^ 0x74736f68);
        local_70 = piVar3;
        if (*(int *)((long)piVar3 + 3) == 0x676e6974 && *piVar3 == 0x74736f68) goto LAB_1402e5216;
        iVar8 = *piVar3;
        uVar23 = *(uint *)((long)piVar3 + 3) ^ 0x676e696e;
      }
      local_50 = (float *)(CONCAT44(uVar7,iVar8) ^ 0x6e696f6a);
      if (uVar23 != 0 || iVar8 != 0x6e696f6a) goto LAB_1402e507a;
    }
LAB_1402e5216:
    if ((*(long *)(local_60 + 0x158) == 0) ||
       (*(long *)((ulong)~*(uint *)(lVar9 + lVar22 + 8) * 0x10 + lVar16) !=
        *(long *)(local_60 + 0x198))) goto LAB_1402e507a;
  }
  else {
    lVar22 = 8;
    lVar16 = 0;
    uVar23 = 0;
    lVar18 = 0;
LAB_1402e4eb7:
    do {
      if (uVar23 == (uint)lVar18) {
        do {
          if (puVar13 == puVar2) goto LAB_1402e5259;
          uVar23 = *puVar13;
          puVar13 = puVar13 + 1;
          lVar18 = *(long *)(*(long *)(lStack_190 + 0x1a8) + 0x10 + (ulong)uVar23 * 0x48);
        } while (lVar18 == 0);
        lVar22 = *(long *)(lStack_190 + 0x1a8) + (ulong)uVar23 * 0x48;
        if ((*(ulong *)(local_198 + 0x110) < *(ulong *)(lVar22 + 0x40)) &&
           (uVar10 = *(ulong *)(*(long *)(lVar22 + 0x38) + *(ulong *)(local_198 + 0x110) * 8),
           uVar10 != 0)) {
          lVar16 = *(long *)(*(long *)(lVar22 + 0x18) + 0x10 + ~uVar10 * 0x30);
        }
        else {
          lVar16 = 0;
        }
        lVar22 = *(long *)(lVar22 + 8);
        uVar23 = 0;
      }
      uVar10 = (ulong)uVar23;
      uVar23 = uVar23 + 1;
      uVar11 = *(ulong *)(lVar22 + uVar10 * 8);
      bVar24 = (int)uVar11 == 0;
      if (!bVar24) {
        uVar21 = uVar11 >> 0x20;
      }
      uVar21 = uVar21 & 0xffffffff;
    } while ((bVar24) || (*(long *)(local_60 + 0x50) == 0));
    piVar3 = *(int **)(local_60 + 0x18);
    lVar9 = *(long *)(local_60 + 0x20);
    uVar7 = local_50._4_4_;
    if (lVar9 == 7) {
      local_50 = (float *)(CONCAT44(local_50._4_4_,*piVar3) ^ 0x74736f68);
      local_70 = piVar3;
      if (*(int *)((long)piVar3 + 3) != 0x676e6974 || *piVar3 != 0x74736f68) {
        iVar8 = *piVar3;
        uVar14 = *(uint *)((long)piVar3 + 3) ^ 0x676e696e;
        goto LAB_1402e500f;
      }
    }
    else if (lVar9 == 6) {
      iVar8 = *piVar3;
      uVar14 = *(ushort *)(piVar3 + 1) ^ 0x6465;
LAB_1402e500f:
      local_50 = (float *)(CONCAT44(uVar7,iVar8) ^ 0x6e696f6a);
      if (uVar14 != 0 || iVar8 != 0x6e696f6a) goto LAB_1402e4eb7;
    }
    else if ((lVar9 != 4) || (*piVar3 != 0x7466656c)) goto LAB_1402e4eb7;
    if ((*(long *)(local_60 + 0x158) == 0) ||
       (*(long *)(lVar16 + uVar10 * 0x10) != *(long *)(local_60 + 0x198))) goto LAB_1402e4eb7;
  }
  local_e8 = uVar21 << 0x20 | uVar11 & 0xffffffff;
LAB_1402e5263:
  local_e0 = (undefined4 *)0x1;
  local_d8 = (ulong *)local_78;
  local_d0 = (undefined8 *)0x0;
  plStack_c0 = (long *)0x0;
  func_0x0001401005f0();
  puVar5 = puStack_230;
  puVar4 = local_238;
  local_108 = local_218;
  local_118 = (undefined4)local_228;
  uStack_114 = local_228._4_4_;
  uStack_110 = (undefined4)uStack_220;
  uStack_10c = uStack_220._4_4_;
  local_130 = (ulong)local_68;
  local_128 = local_238;
  local_120 = puStack_230;
  local_e0 = &local_258;
  local_d8 = &local_210;
  local_d0 = &local_1d0;
  local_c8 = &local_e8;
  local_b8 = &local_180;
  local_51 = 1;
  plStack_c0 = &local_1f0;
  func_0x00014033bd80();
  local_78 = local_100;
  local_68 = local_f8;
  if (local_f0 != 0) {
    lVar18 = 0;
    do {
      local_100 = local_78;
      if ((int)*(undefined4 **)((long)local_68 + lVar18) == 0) break;
      local_b8 = local_218;
      local_c8 = local_228;
      plStack_c0 = uStack_220;
      local_d8 = puVar4;
      local_d0 = puVar5;
      local_e0 = *(undefined4 **)((long)local_68 + lVar18);
      func_0x0001450b3990();
      lVar18 = lVar18 + 8;
      local_100 = local_78;
    } while (local_f0 << 3 != lVar18);
  }
joined_r0x0001402e53d9:
  if (local_100 != (undefined4 *)0x0) {
    func_0x0001400021d0();
  }
  return;
LAB_1402e4a04:
  uVar19 = 0;
  if (bVar1 == 0) goto LAB_1402e4abb;
LAB_1402e4a4f:
  do {
    if (uVar23 == (uint)uVar11) {
      do {
        if (puVar13 == puVar2) goto LAB_1402e4ae6;
        uVar23 = *puVar13;
        puVar13 = puVar13 + 1;
        uVar11 = *(ulong *)(*(long *)(lStack_1a8 + 0x1a8) + 0x10 + (ulong)uVar23 * 0x48);
      } while (uVar11 == 0);
      lVar22 = *(long *)(*(long *)(lStack_1a8 + 0x1a8) + (ulong)uVar23 * 0x48 + 8);
      uVar23 = 0;
    }
    uVar10 = (ulong)uVar23;
    uVar23 = uVar23 + 1;
    iVar8 = *(int *)(lVar22 + uVar10 * 8);
  } while (iVar8 == 0);
  goto LAB_1402e4ae9;
LAB_1402e4ae6:
  iVar8 = 0;
  goto LAB_1402e4ae9;
LAB_1402e5259:
  local_e8 = local_e8 & 0xffffffff00000000;
  goto LAB_1402e5263;
}

