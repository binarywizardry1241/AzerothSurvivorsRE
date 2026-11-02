
void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  byte bVar1;
  uint uVar2;
  ulong *puVar3;
  ulong uVar4;
  code *pcVar5;
  ulong uVar6;
  ulong uVar7;
  undefined8 uVar8;
  char cVar9;
  ulong uVar10;
  uint *puVar11;
  int iVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  ulong uVar16;
  uint *puVar17;
  long lVar18;
  long lVar19;
  uint uVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  long lVar24;
  uint *puVar25;
  long *in_stack_00000028;
  long *in_stack_00000030;
  undefined8 *in_stack_00000038;
  undefined8 *in_stack_00000040;
  uint local_2f0 [38];
  uint auStack_258 [20];
  undefined4 local_208;
  undefined4 uStack_204;
  undefined4 local_200;
  undefined4 uStack_1fc;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 local_1f0;
  undefined4 uStack_1ec;
  undefined4 uStack_1e8;
  undefined4 uStack_1e4;
  undefined4 local_1e0;
  undefined4 uStack_1dc;
  undefined4 uStack_1d8;
  undefined4 uStack_1d4;
  undefined4 local_1d0;
  undefined4 uStack_1cc;
  undefined4 uStack_1c8;
  undefined4 uStack_1c4;
  undefined8 local_1c0;
  undefined8 uStack_1b8;
  undefined8 local_1b0;
  undefined8 uStack_1a8;
  ulong local_1a0;
  long local_120;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined4 local_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  ulong local_b8;
  undefined8 local_b0;
  undefined4 *local_a8;
  long local_a0;
  uint local_98;
  undefined4 local_94;
  undefined8 local_90;
  uint *local_88;
  long local_80;
  long local_78;
  long local_70;
  long local_68;
  uint local_5c;
  uint local_58;
  uint local_54;
  uint local_50;
  char local_4a;
  byte local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  puVar3 = (ulong *)*param_3;
  lVar23 = param_3[1];
  uVar16 = *puVar3;
  uVar10 = 0;
  uVar14 = uVar16 - *(ulong *)(lVar23 + 0x18);
  if (uVar16 < *(ulong *)(lVar23 + 0x18)) {
    uVar14 = uVar10;
  }
  uVar15 = uVar16 - *(ulong *)(lVar23 + 0x38);
  if (uVar16 < *(ulong *)(lVar23 + 0x38)) {
    uVar15 = uVar10;
  }
  lVar18 = uVar14 * 0x18 + *(long *)(lVar23 + 8);
  uVar16 = *(ulong *)(lVar23 + 0x10);
  uVar4 = *(ulong *)(lVar23 + 0x30);
  lVar21 = uVar15 * 0x18 + *(long *)(lVar23 + 0x28);
  uVar6 = uVar16 - uVar14;
  if (uVar16 < uVar14) {
    lVar18 = 8;
    uVar14 = uVar16;
    uVar6 = uVar10;
  }
  uVar7 = uVar4 - uVar15;
  if (uVar4 < uVar15) {
    lVar21 = 8;
    uVar15 = uVar4;
    uVar7 = uVar10;
  }
  lVar23 = *(long *)(lVar23 + 0x40);
  local_78 = *param_5;
  local_68 = *param_6;
  local_80 = param_6[1];
  lVar13 = *in_stack_00000028;
  local_70 = *in_stack_00000030;
  local_90 = *in_stack_00000038;
  local_a8 = (undefined4 *)in_stack_00000038[2];
  local_94 = *(undefined4 *)((long)in_stack_00000038 + 0x1c);
  local_b0 = *in_stack_00000040;
  *puVar3 = (lVar23 - uVar7) - uVar6;
  uVar16 = ((uVar15 + lVar23 + uVar14) - uVar4) - uVar16;
  lVar23 = lVar21 + uVar7 * 0x18;
  lVar22 = 0;
  lVar19 = lVar18;
  do {
    uVar16 = uVar16 + 1;
    if ((lVar19 == 0) || (lVar19 == lVar18 + uVar6 * 0x18)) {
      if ((lVar21 == 0) || (lVar21 == lVar23)) break;
      lVar24 = 0;
      lVar19 = lVar21;
      lVar21 = lVar21 + 0x18;
    }
    else {
      lVar24 = lVar19 + 0x18;
    }
    *puVar3 = uVar16;
    uVar14 = (ulong)*(byte *)(lVar19 + 0x14) ^ 1;
    if (*(short *)(lVar19 + 0x10) != 1) {
      uVar14 = uVar10;
    }
    lVar22 = lVar22 + uVar14;
    lVar19 = lVar24;
  } while( true );
  if ((lVar22 == 0) || (*(char *)(lVar13 + 0x72) != '\x01')) {
    return;
  }
  local_208 = 0x3d;
  uStack_1fc = 0x3e;
  local_4a = func_0x0001400320d0(local_a8,lVar19,&local_208,local_78);
  func_0x000145436120();
  puVar25 = *(uint **)(local_68 + 0xf8);
  puVar17 = puVar25 + *(long *)(local_68 + 0x100);
  uVar20 = (uint)*(byte *)(local_68 + 0x108);
  local_a0 = 8;
  local_50 = 0;
  local_54 = 0;
  local_58 = 0;
  uVar16 = 0;
  uVar14 = 0;
  local_88 = puVar17;
  local_49 = *(byte *)(local_68 + 0x108);
  lVar21 = local_80;
  lVar18 = 0;
  lVar23 = 0;
LAB_1402554e5:
  do {
    do {
      if ((char)uVar20 == '\0') {
        if ((int)uVar14 == (int)uVar16) {
          do {
            if (puVar25 == puVar17) goto LAB_1402559f5;
            uVar2 = *puVar25;
            puVar25 = puVar25 + 1;
            uVar16 = *(ulong *)(*(long *)(lVar21 + 0x108) + 0x58 + (ulong)uVar2 * 0xa0);
          } while (uVar16 == 0);
          lVar13 = *(long *)(lVar21 + 0x108) + (ulong)uVar2 * 0xa0;
          uVar14 = (ulong)*(uint *)(lVar13 + 0x94);
          lVar18 = *(long *)(lVar21 + 0x1a8) + uVar14 * 0x48;
          uVar14 = *(ulong *)(*(long *)(lVar21 + 0x1a8) + 0x40 + uVar14 * 0x48);
          if ((*(ulong *)(local_68 + 0x110) < uVar14) &&
             (uVar10 = *(ulong *)(*(long *)(lVar18 + 0x38) + *(ulong *)(local_68 + 0x110) * 8),
             uVar10 != 0)) {
            lVar23 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar10 * 0x30);
            uVar10 = *(ulong *)(local_68 + 0x118);
            if (uVar14 <= uVar10) goto LAB_1402556dc;
LAB_1402556a2:
            uVar14 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar10 * 8);
            if (uVar14 == 0) goto LAB_1402556dc;
            lVar18 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar14 * 0x30);
          }
          else {
            lVar23 = 0;
            uVar10 = *(ulong *)(local_68 + 0x118);
            if (uVar10 < uVar14) goto LAB_1402556a2;
LAB_1402556dc:
            lVar18 = 0;
          }
          local_a0 = *(long *)(lVar13 + 0x50);
          uVar14 = 0;
          local_54 = (uint)uVar16;
          uVar16 = uVar16 & 0xffffffff;
        }
        iVar12 = (int)uVar14;
        uVar10 = (ulong)~*(uint *)(local_a0 + 8 + uVar14 * 0x10);
      }
      else {
        uVar10 = uVar14;
        if ((int)uVar14 == (int)uVar16) {
          do {
            if (puVar25 == puVar17) goto LAB_1402559f5;
            uVar2 = *puVar25;
            puVar25 = puVar25 + 1;
            uVar16 = *(ulong *)(*(long *)(lVar21 + 0x1a8) + 0x10 + (ulong)uVar2 * 0x48);
          } while (uVar16 == 0);
          lVar18 = *(long *)(lVar21 + 0x1a8) + (ulong)uVar2 * 0x48;
          uVar14 = *(ulong *)(lVar18 + 0x40);
          if ((*(ulong *)(local_68 + 0x110) < uVar14) &&
             (uVar10 = *(ulong *)(*(long *)(lVar18 + 0x38) + *(ulong *)(local_68 + 0x110) * 8),
             uVar10 != 0)) {
            lVar23 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar10 * 0x30);
            uVar10 = *(ulong *)(local_68 + 0x118);
            if (uVar14 <= uVar10) goto LAB_1402556c5;
LAB_140255669:
            uVar14 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar10 * 8);
            if (uVar14 == 0) goto LAB_1402556c5;
            lVar18 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar14 * 0x30);
          }
          else {
            lVar23 = 0;
            uVar10 = *(ulong *)(local_68 + 0x118);
            if (uVar10 < uVar14) goto LAB_140255669;
LAB_1402556c5:
            lVar18 = 0;
          }
          uVar10 = 0;
          local_54 = (uint)uVar16;
          uVar16 = uVar16 & 0xffffffff;
        }
        iVar12 = (int)uVar10;
      }
      uVar14 = (ulong)(iVar12 + 1U);
      puVar11 = (uint *)(uVar10 * 0x10 + lVar18);
      local_58 = iVar12 + 1U;
      if ((char *)(lVar23 + uVar10) == (char *)0x0) {
LAB_1402559f5:
        if ((local_50 & 1) == 0) {
          return;
        }
        *local_a8 = local_94;
        func_0x0001457731ed();
        func_0x00014542e950();
        func_0x0001457731ed();
        func_0x000140044cc0();
        return;
      }
    } while (*(char *)(lVar23 + uVar10) != '\x01');
    iVar12 = *puVar11 - 2;
    if (*puVar11 < 2) {
      iVar12 = 8;
    }
    if (iVar12 == 4) {
      local_98 = (uint)uVar16;
      uVar2 = puVar11[1];
      local_78 = lVar23;
      local_70 = lVar18;
      func_0x00014546f110();
      lVar13 = CONCAT44(uStack_204,local_208);
      if (lVar13 != -1) {
        lVar19 = CONCAT44(uStack_204,local_208);
        lVar22 = CONCAT44(uStack_1ec,local_1f0);
        uVar8 = CONCAT44(uStack_1e4,uStack_1e8);
        local_5c = uVar2;
        cVar9 = func_0x00014542f520();
        bVar1 = local_49;
        lVar18 = local_70;
        lVar23 = local_78;
        lVar21 = local_80;
        puVar17 = local_88;
        if (cVar9 != '\0') {
          local_b8 = local_1a0;
          uVar16 = local_b8;
          local_c8 = local_1b0;
          uStack_c0 = uStack_1a8;
          local_d8 = local_1c0;
          uStack_d0 = uStack_1b8;
          local_e8 = local_1d0;
          uStack_e4 = uStack_1cc;
          uStack_e0 = uStack_1c8;
          uStack_dc = uStack_1c4;
          local_f8 = local_1e0;
          uStack_f4 = uStack_1dc;
          uStack_f0 = uStack_1d8;
          uStack_ec = uStack_1d4;
          local_108 = local_1f0;
          uStack_104 = uStack_1ec;
          uStack_100 = uStack_1e8;
          uStack_fc = uStack_1e4;
          local_118 = local_200;
          uStack_114 = uStack_1fc;
          uStack_110 = uStack_1f8;
          uStack_10c = uStack_1f4;
          local_120 = lVar13;
          local_b8._0_1_ = (byte)local_1a0;
          uVar14 = local_1a0 & 0xff;
          local_b8 = uVar16;
          if (local_4a == '\0') {
            if (0x12 < (byte)local_b8) {
              func_0x000145903b33(local_49,local_80,0x13,uVar14,0x14594f868);
              goto LAB_140255ab9;
            }
            uVar16 = (ulong)local_5c;
            if (auStack_258[uVar14] == local_5c) {
              auStack_258[uVar14] = 0;
            }
            else {
              auStack_258[uVar14] = local_5c;
            }
          }
          else {
            if (0x12 < (byte)local_b8) {
              func_0x000145903b33(local_49,local_80,0x13,uVar14,0x14594f880);
LAB_140255ab9:
                    /* WARNING: Does not return */
              pcVar5 = (code *)invalidInstructionException();
              (*pcVar5)();
            }
            uVar20 = 1;
            if ((char)local_2f0[uVar14 * 2] != '\0') {
              uVar20 = (uint)(local_2f0[uVar14 * 2 + 1] != local_5c);
            }
            local_2f0[uVar14 * 2] = uVar20;
            uVar16 = (ulong)local_5c;
            local_2f0[uVar14 * 2 + 1] = local_5c;
          }
          uVar20 = (uint)bVar1;
          if (lVar13 != 0) {
            uVar20 = (uint)bVar1;
            uVar16 = func_0x0001400021d0();
          }
          if (CONCAT44(uStack_104,local_108) != 0) {
            uVar16 = func_0x0001400021d0();
          }
          local_50 = (uint)CONCAT71((int7)(uVar16 >> 8),1);
          uVar16 = (ulong)local_54;
          uVar14 = (ulong)local_58;
          goto LAB_1402554e5;
        }
        if (lVar19 != 0) {
          func_0x0001400021d0();
        }
        puVar17 = local_88;
        lVar21 = local_80;
        uVar20 = (uint)local_49;
        if (lVar22 != 0) {
          uVar20 = (uint)local_49;
          func_0x0001400021d0((uint)local_49,local_80,lVar22 << 3,uVar8,4);
        }
      }
      uVar16 = (ulong)local_98;
      lVar18 = local_70;
      lVar23 = local_78;
      goto LAB_1402554e5;
    }
    if (iVar12 == 5) {
      bVar1 = (byte)puVar11[1];
      uVar16 = (ulong)bVar1;
      if (local_4a == '\0') {
        if (0x12 < bVar1) {
          func_0x000145903b33();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        uVar2 = auStack_258[uVar16];
        auStack_258[uVar16] = 0;
        local_50 = local_50 & 0xff;
        if (uVar2 != 0) {
          local_50 = 1;
        }
      }
      else {
        if (0x12 < bVar1) {
          func_0x000145903b33();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        uVar2 = local_2f0[uVar16 * 2];
        local_2f0[uVar16 * 2] = 0;
        local_50 = CONCAT31((int3)(local_50 >> 8),(byte)local_50 | (byte)uVar2) & 0xffffff01;
      }
    }
    uVar16 = (ulong)local_54;
    uVar14 = (ulong)local_58;
  } while( true );
}
