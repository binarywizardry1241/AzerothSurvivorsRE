/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140c04400(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,
                  undefined8 *param_5,undefined4 *param_6)

{
  uint uVar1;
  undefined4 *puVar2;
  long *plVar3;
  code *pcVar4;
  ulong uVar5;
  long lVar6;
  undefined7 uVar7;
  uint uVar8;
  uint *puVar9;
  long lVar10;
  uint uVar11;
  float *pfVar12;
  uint *puVar13;
  byte *extraout_RDX;
  long lVar14;
  ulong uVar15;
  byte *pbVar16;
  byte *pbVar17;
  ulong uVar18;
  undefined4 uVar19;
  ulong uVar20;
  int iVar21;
  uint uVar22;
  long lVar23;
  undefined8 in_R10;
  long lVar24;
  byte *pbVar25;
  ulong unaff_R13;
  uint uVar26;
  ulong uVar27;
  float fVar28;
  undefined4 in_XMM6_Da;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined8 local_f8;
  undefined4 local_e4;
  long local_e0;
  byte *local_d8;
  char local_d0;
  undefined2 uStack_cf;
  undefined4 uStack_cd;
  long local_c8;
  long local_c0;
  long local_b8;
  byte *local_b0;
  undefined4 *local_a8;
  long local_a0;
  byte *local_98;
  undefined4 *local_90;
  byte *local_88;
  undefined8 local_80;
  ulong local_78;
  long local_70;
  float local_64;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  pbVar16 = *(byte **)(param_3 + 0x10);
  local_b0 = *(byte **)(param_3 + 0x18);
  local_88 = (byte *)*param_5;
  puVar2 = (undefined4 *)param_5[2];
  uVar19 = *(undefined4 *)((long)param_5 + 0x1c);
  local_90 = (undefined4 *)*in_stack_00000028;
  local_c0 = in_stack_00000028[1];
  iVar21 = *(int *)(in_stack_00000028 + 2);
  local_70 = CONCAT44(local_70._4_4_,*(undefined4 *)((long)in_stack_00000028 + 0x14));
  local_e0 = *in_stack_00000030;
  local_b8 = in_stack_00000030[1];
  local_e4 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  local_108 = *param_6;
  uStack_104 = param_6[1];
  uStack_100 = param_6[2];
  uStack_fc = param_6[3];
  local_f8 = *(undefined8 *)(param_6 + 4);
  local_58 = in_XMM6_Da;
  func_0x0001400bfb90(iVar21,uVar19,&local_108,&local_d0);
  local_64 = _DAT_145d9d2a0;
  fVar28 = _DAT_145d9d2a0;
  if (local_d0 == '\0') {
    pfVar12 = (float *)(local_c8 + 200);
    if (*(char *)(local_c8 + 0xb8) != '\0') {
      pfVar12 = (float *)(local_c8 + 0xbc);
    }
    local_64 = (float)(*(int *)(local_c8 + 0xc0) + (uint)(*(int *)(local_c8 + 0xc0) == 0));
    fVar28 = *pfVar12;
  }
  local_80 = CONCAT44(local_80._4_4_,uVar19);
  if (*local_88 == 1) {
    puVar13 = (uint *)(local_88 + 4);
    puVar9 = (uint *)(local_88 + 8);
    unaff_R13 = (ulong)*(uint5 *)(local_88 + 0xc);
    uVar15 = CONCAT71((int7)((ulong)in_R10 >> 8),1);
    pbVar17 = (byte *)(ulong)*(uint3 *)(local_88 + 1);
  }
  else {
    puVar13 = (uint *)(*(long *)(local_88 + 8) + 0x68);
    puVar9 = (uint *)(*(long *)(local_88 + 8) + 0x6c);
    uVar15 = 0;
    pbVar17 = pbVar16;
  }
  local_64 = ((float)*(uint *)(local_88 + 0x30) * fVar28) / local_64;
  uVar26 = *puVar13;
  uVar20 = (ulong)uVar26;
  uVar1 = *puVar9;
  pbVar25 = local_88;
  local_a8 = puVar2;
  local_98 = pbVar16;
  if (local_88[0x18] != 2) {
    uVar22 = *(uint *)(local_88 + 0x20);
    if (local_88[0x18] == 1) {
      if (((char)uVar15 == '\0') ||
         (((ulong)((uint)pbVar17 & 0xffffff) | uVar20 << 0x18 | (ulong)uVar1 << 0x38) !=
          ((ulong)*(uint3 *)(local_88 + 0x19) |
          (ulong)*(uint *)(local_88 + 0x1c) << 0x18 | (ulong)uVar22 << 0x38) ||
          ((ulong)(uVar1 >> 8) | unaff_R13 << 0x18) !=
          ((ulong)(uVar22 >> 8) | *(long *)(local_88 + 0x24) << 0x18))) goto LAB_140c04569;
    }
    else if ((*(uint *)(local_88 + 0x1c) == uVar26 & (*local_88 ^ 1) & uVar22 == uVar1) == 0)
    goto LAB_140c04569;
    if ((*(float *)(local_88 + 0x2c) == local_64) &&
       (!NAN(*(float *)(local_88 + 0x2c)) && !NAN(local_64))) {
      puVar9 = *(uint **)(local_90 + 0x3e);
      puVar13 = puVar9 + *(long *)(local_90 + 0x40);
      local_78 = CONCAT44(local_78._4_4_,(int)uVar15);
      if (*(char *)(local_90 + 0x42) == '\0') {
        uVar20 = 0xc233b000;
        if ((uint)((int)local_70 - iVar21) < 0xc233b000) {
          uVar20 = (ulong)(uint)((int)local_70 - iVar21);
        }
        lVar24 = 0;
        lVar23 = 8;
        iVar21 = 0;
        uVar5 = 0;
        local_a0 = CONCAT44(local_a0._4_4_,uVar26);
        do {
          if ((int)uVar5 == iVar21) {
            do {
              if (puVar9 == puVar13) {
                return;
              }
              uVar26 = *puVar9;
              puVar9 = puVar9 + 1;
            } while (*(long *)(*(long *)(local_c0 + 0x108) + 0x58 + (ulong)uVar26 * 0xa0) == 0);
            lVar14 = *(long *)(local_c0 + 0x108) + (ulong)uVar26 * 0xa0;
            lVar24 = func_0x000144e4ed00();
            lVar23 = *(long *)(lVar14 + 0x50);
            iVar21 = *(int *)(lVar14 + 0x58);
            uVar5 = 0;
            pbVar25 = local_88;
          }
          lVar14 = uVar5 * 0x10;
          uVar5 = (ulong)((int)uVar5 + 1);
          uVar15 = local_78 & 0xffffffff;
          uVar26 = (uint)local_a0;
        } while ((uint)uVar20 <=
                 (uint)((int)local_70 -
                       *(int *)(lVar24 + (ulong)~*(uint *)(lVar23 + 8 + lVar14) * 4)));
      }
      else {
        uVar22 = 0xc233b000;
        if ((uint)((int)local_70 - iVar21) < 0xc233b000) {
          uVar22 = (int)local_70 - iVar21;
        }
        lVar23 = 0;
        uVar8 = 0;
        uVar11 = 0;
        local_d8 = (byte *)CONCAT44(local_d8._4_4_,uVar22);
        do {
          uVar26 = (uint)uVar20;
          if (uVar11 == uVar8) {
            do {
              if (puVar9 == puVar13) {
                return;
              }
              uVar22 = *puVar9;
              puVar9 = puVar9 + 1;
            } while (*(long *)(*(long *)(local_c0 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48) == 0);
            lVar24 = *(long *)(local_c0 + 0x1a8) + (ulong)uVar22 * 0x48;
            lVar23 = func_0x000144e4ed00(lVar24,uVar20,*(undefined8 *)(local_90 + 0x44),lVar24);
            uVar8 = *(uint *)(lVar24 + 0x10);
            uVar11 = 0;
            uVar15 = local_78 & 0xffffffff;
            pbVar25 = local_88;
            uVar22 = (uint)local_d8;
          }
          uVar5 = (ulong)uVar11;
          uVar11 = uVar11 + 1;
          uVar20 = (ulong)uVar26;
        } while (uVar22 <= (uint)((int)local_70 - *(int *)(lVar23 + uVar5 * 4)));
      }
    }
  }
LAB_140c04569:
  *local_a8 = (undefined4)local_80;
  pbVar25[0x18] = (byte)uVar15;
  *(short *)(pbVar25 + 0x19) = (short)pbVar17;
  pbVar25[0x1b] = (byte)((ulong)pbVar17 >> 0x10);
  *(uint *)(pbVar25 + 0x1c) = uVar26;
  *(uint *)(pbVar25 + 0x20) = uVar1;
  *(ulong *)(pbVar25 + 0x24) = unaff_R13;
  *(float *)(pbVar25 + 0x2c) = local_64;
  fVar28 = (float)func_0x000145bfa19b(local_64 / fVar28);
  if (0.0 <= fVar28) {
    fVar28 = 0.0;
  }
  puVar9 = *(uint **)(local_e0 + 0xf8);
  puVar13 = puVar9 + *(long *)(local_e0 + 0x100);
  local_c0 = CONCAT71(local_c0._1_7_,*(char *)(local_e0 + 0x108));
  if (local_98 != (byte *)0x0) {
    local_b0 = local_98;
  }
  local_d8 = local_88 + 1;
  uVar26 = 0;
  lVar24 = 8;
  lVar23 = 8;
  local_78 = 0;
  uVar20 = 0;
  pbVar16 = extraout_RDX;
  uVar15 = 0;
  lVar14 = local_b8;
  pbVar17 = local_88;
  if (*(char *)(local_e0 + 0x108) == '\0') goto LAB_140c0475b;
  do {
    uVar5 = (ulong)uVar26;
    do {
      uVar27 = uVar20;
      if ((int)uVar20 == (int)uVar5) {
        if (puVar9 == puVar13) {
LAB_140c046bf:
          uVar18 = uVar15 & 0xffffffff00000000;
          goto LAB_140c047b6;
        }
        while( true ) {
          uVar5 = *(ulong *)(*(long *)(lVar14 + 0x1a8) + 0x10 + (ulong)*puVar9 * 0x48);
          if (uVar5 != 0) break;
          puVar9 = puVar9 + 1;
          if (puVar9 == puVar13) goto LAB_140c046bf;
        }
        lVar10 = *(long *)(lVar14 + 0x1a8) + (ulong)*puVar9 * 0x48;
        lVar23 = *(long *)(lVar10 + 8);
        lVar6 = ~*(ulong *)(*(long *)(lVar10 + 0x38) + *(long *)(local_e0 + 0x110) * 8) * 0x30;
        local_78 = *(long *)(*(long *)(lVar10 + 0x18) + 0x10 + lVar6);
        local_a0 = *(long *)(*(long *)(lVar10 + 0x18) + 0x28 + lVar6);
        puVar9 = puVar9 + 1;
        uVar27 = 0;
        uVar26 = (uint)uVar5;
      }
      uVar20 = (ulong)((int)uVar27 + 1);
      uVar18 = *(ulong *)(lVar23 + uVar27 * 8);
    } while ((int)uVar18 == 0);
    local_90 = (undefined4 *)(local_a0 + uVar27 * 4);
    pbVar16 = (byte *)(uVar27 * 0x20 + local_78);
LAB_140c047b6:
    if ((int)uVar18 == 0) {
      return;
    }
    if (*pbVar17 == 1) {
      local_108 = *(undefined4 *)local_d8;
      uStack_104._0_3_ = (undefined3)((uint)*(undefined4 *)(local_d8 + 3) >> 8);
      uVar7 = (undefined7)((ulong)local_a8 >> 8);
      local_a8 = (undefined4 *)CONCAT71(uVar7,pbVar17[0x10]);
      local_80 = CONCAT44(local_80._4_4_,(int)CONCAT71(uVar7,1));
    }
    else {
      plVar3 = *(long **)(pbVar17 + 8);
      LOCK();
      lVar10 = *plVar3;
      *plVar3 = *plVar3 + 1;
      UNLOCK();
      if (*plVar3 == 0 || SCARRY8(lVar10,1) != *plVar3 < 0) {
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      local_80 = (ulong)local_80._4_4_ << 0x20;
    }
    local_70 = *(long *)(pbVar17 + 8);
    local_d0 = (char)local_108;
    uStack_cf = (undefined2)((uint)local_108 >> 8);
    uStack_cd._0_1_ = (undefined1)((uint)local_108 >> 0x18);
    uStack_cd = CONCAT31((int3)uStack_104,(undefined1)uStack_cd);
    *local_90 = local_e4;
    local_98 = pbVar16;
    if ((*pbVar16 < 2) && (*pbVar16 == 0)) {
      plVar3 = *(long **)(pbVar16 + 8);
      LOCK();
      *plVar3 = *plVar3 + -1;
      UNLOCK();
      if (*plVar3 == 0) {
        func_0x000144985170();
        lVar14 = local_b8;
        pbVar17 = local_88;
      }
    }
    *local_98 = (byte)local_80;
    *(uint *)(local_98 + 1) = CONCAT13((undefined1)uStack_cd,CONCAT21(uStack_cf,local_d0));
    *(undefined4 *)(local_98 + 4) = uStack_cd;
    *(long *)(local_98 + 8) = local_70;
    *(undefined4 **)(local_98 + 0x10) = local_a8;
    *(float *)(local_98 + 0x18) = local_64;
    lVar10 = *(long *)(local_b0 + 0x10);
    pbVar16 = local_98;
    if ((ulong)(*(long *)local_b0 - lVar10) < 0x18) {
      local_80 = lVar23;
      local_70 = lVar24;
      func_0x000145bfa970(lVar10,local_98,lVar10,local_b0,0x18,1);
      lVar23 = local_80;
      lVar14 = local_b8;
      lVar24 = local_70;
      pbVar17 = local_88;
    }
    lVar6 = *(long *)(local_b0 + 8);
    *(undefined8 *)(lVar6 + lVar10) = 0x1409e9120;
    *(ulong *)(lVar6 + 8 + lVar10) = uVar18;
    *(float *)(lVar6 + 0x10 + lVar10) = fVar28;
    *(undefined1 *)(lVar6 + 0x14 + lVar10) = 0;
    *(long *)(local_b0 + 0x10) = lVar10 + 0x18;
    uVar15 = uVar18;
  } while ((char)local_c0 != '\0');
LAB_140c0475b:
  do {
    if ((uint)uVar20 == uVar26) {
      if (puVar9 == puVar13) {
        uVar18 = uVar15 & 0xffffffff00000000;
        uVar20 = (ulong)uVar26;
        goto LAB_140c047b6;
      }
      while( true ) {
        lVar10 = *(long *)(*(long *)(lVar14 + 0x108) + 0x58 + (ulong)*puVar9 * 0xa0);
        if (lVar10 != 0) break;
        puVar9 = puVar9 + 1;
        if (puVar9 == puVar13) {
          uVar18 = uVar15 & 0xffffffff00000000;
          uVar20 = (ulong)uVar26;
          goto LAB_140c047b6;
        }
      }
      lVar6 = *(long *)(lVar14 + 0x108) + (ulong)*puVar9 * 0xa0;
      uVar20 = (ulong)*(uint *)(lVar6 + 0x94);
      lVar24 = *(long *)(*(long *)(lVar14 + 0x1a8) + 0x18 + uVar20 * 0x48);
      lVar14 = ~*(ulong *)(*(long *)(*(long *)(lVar14 + 0x1a8) + 0x38 + uVar20 * 0x48) +
                          *(long *)(local_e0 + 0x110) * 8) * 0x30;
      local_78 = *(long *)(lVar24 + 0x10 + lVar14);
      local_a0 = *(long *)(lVar24 + 0x28 + lVar14);
      lVar24 = *(long *)(lVar6 + 0x50);
      puVar9 = puVar9 + 1;
      uVar20 = 0;
      uVar26 = (uint)lVar10;
      lVar14 = local_b8;
    }
    lVar10 = uVar20 * 0x10;
    uVar20 = (ulong)((int)uVar20 + 1);
    uVar18 = *(ulong *)(lVar24 + lVar10);
  } while ((int)uVar18 == 0);
  uVar15 = (ulong)~*(uint *)(lVar10 + lVar24 + 8);
  local_90 = (undefined4 *)(local_a0 + uVar15 * 4);
  pbVar16 = (byte *)(uVar15 * 0x20 + local_78);
  goto LAB_140c047b6;
}
