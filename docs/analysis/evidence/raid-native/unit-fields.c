
void entry(long param_1,undefined8 param_2,long param_3,long param_4,int *param_5)

{
  long *plVar1;
  undefined8 *puVar2;
  ulong *puVar3;
  undefined4 *puVar4;
  int iVar5;
  undefined8 uVar6;
  ushort uVar7;
  ushort uVar8;
  uint uVar9;
  uint *puVar10;
  long lVar11;
  long lVar12;
  int *piVar13;
  int *extraout_RDX;
  int *extraout_RDX_00;
  int *piVar14;
  ulong uVar15;
  long lVar16;
  int *piVar17;
  long lVar18;
  ulong uVar19;
  ulong uVar20;
  byte bVar21;
  undefined4 uVar22;
  uint uVar23;
  long lVar24;
  bool bVar25;
  undefined4 in_XMM6_Da;
  float fVar26;
  undefined4 in_XMM7_Da;
  int local_128;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  long local_f8;
  long local_f0;
  int local_e4;
  long *local_e0;
  undefined1 *local_d8;
  undefined8 local_d0;
  int local_c8;
  undefined4 local_c4;
  long local_c0;
  long local_b8;
  long local_b0;
  long *local_a8;
  undefined1 *local_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  ulong local_88;
  undefined1 local_71;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;
  
  local_70 = 0xfffffffffffffffe;
  lVar12 = *(long *)(param_4 + 0x560);
  lVar18 = 0;
  lVar11 = lVar12;
  do {
    if (*(long *)(param_4 + 0x568) * 0x1d8 - lVar18 == 0) {
      return;
    }
    lVar18 = lVar18 + 0x1d8;
    plVar1 = (long *)(lVar11 + 0xf0);
    lVar11 = lVar11 + 0x1d8;
  } while (*plVar1 != param_3);
  if (*(long *)(lVar12 + -0x1c0 + lVar18) == -1) {
    lVar11 = *(long *)(lVar12 + -0xe0 + lVar18);
    if (lVar11 == 0) {
      return;
    }
    piVar17 = (int *)(lVar11 + 0x24);
    puVar10 = (uint *)(lVar12 + lVar18 + -0x68);
  }
  else {
    lVar11 = *(long *)(lVar12 + -0x1a8 + lVar18);
    piVar17 = (int *)(lVar11 + 0x44);
    puVar10 = (uint *)(lVar11 + 0x48);
  }
  iVar5 = *param_5;
  if (iVar5 == 0) {
    iVar5 = *piVar17;
  }
  uVar23 = *puVar10;
  fVar26 = (float)param_5[1];
  local_c0 = 0;
  local_b0 = 0;
  local_a8 = &local_c0;
  local_a0 = (undefined1 *)0x0;
  uStack_98 = 0;
  local_88 = 0x83;
  local_f0 = param_4;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  func_0x0001458d9620(param_1,param_2,&local_a8,&local_118,iVar5);
  lVar11 = local_c0;
  lVar12 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar19 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      piVar13 = (int *)0xffffffffffffffff;
      do {
        piVar17 = (int *)(ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar19 == 0) goto LAB_14594d5f3;
        uVar7 = *(ushort *)(lVar11 + 0x3a + (long)piVar13 * 2);
        piVar17 = (int *)((long)piVar13 + 1);
        uVar19 = uVar19 - 2;
        piVar13 = piVar17;
      } while ((char)((uVar7 < 4) - (4 < uVar7)) == '\x01');
      if (uVar7 < 4 == 4 < uVar7) {
        *(uint *)(lVar11 + 8 + (long)piVar17 * 4) =
             ~-(uint)(0.0 < fVar26) & uVar23 | (uint)fVar26 & -(uint)(0.0 < fVar26);
        goto LAB_14594d63e;
      }
LAB_14594d5f3:
      if (lVar12 == 0) goto LAB_14594d60b;
      lVar11 = *(long *)(lVar11 + 0x50 + (long)piVar17 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594d60b:
  local_a8 = &local_c0;
  uStack_98 = 0;
  local_88 = 4;
  local_a0 = (undefined1 *)lVar11;
  local_90 = piVar17;
  func_0x0001458d9620();
LAB_14594d63e:
  lVar11 = local_c0;
  lVar12 = local_b8;
  if (local_c0 == 0) {
    lVar11 = 0;
LAB_14594d6b9:
    local_a8 = &local_c0;
    uStack_98 = 0;
    local_88 = 0x85;
    local_a0 = (undefined1 *)lVar11;
    local_90 = piVar17;
    func_0x0001458d9620();
LAB_14594d6e7:
    uVar6 = *(undefined8 *)(param_5 + 5);
    uVar19 = *(ulong *)(param_5 + 3);
    local_e4 = param_5[3];
    local_108 = uVar19;
    uStack_100 = uVar6;
    local_f8 = 0;
    uVar15 = 0x20000000000;
    lVar11 = 0;
    lVar12 = 0;
    do {
      puVar3 = &local_108 + lVar11;
      lVar18 = lVar11 + 1;
      piVar13 = (int *)0xff0000000000;
      lVar24 = lVar12;
      if ((*puVar3 & 0xff0000000000) != uVar15) {
        lVar24 = lVar12 + 1;
        local_f8 = lVar24;
        lVar11 = lVar18;
        uVar19 = *puVar3;
        goto LAB_14594d796;
      }
      do {
        piVar13 = (int *)0xffff00ffffffffff;
        lVar11 = lVar18;
        lVar12 = param_1;
        uVar19 = uVar19 & 0xffff00ffffffffff | uVar15;
LAB_14594d796:
        if ((uVar19 & 0xff0000000000) == uVar15) {
          local_128 = (int)uVar6;
          lVar11 = local_c0;
          if (local_c0 != 0) goto LAB_14594da5c;
          lVar11 = 0;
          goto LAB_14594dab9;
        }
        if ((int)uVar19 == 0) {
          uVar23 = 0;
          uVar22 = 0;
        }
        else {
          uVar23 = (uint)(uVar19 >> 0x18) & 0xff00;
          if ((uVar19 >> 0x28 & 1) == 0) {
            uVar23 = uVar23 | 0xd010002;
            uVar22 = 3;
          }
          else {
            uVar23 = uVar23 | 0x11010002;
            uVar22 = 1;
          }
        }
        if (local_c0 != 0) {
          uVar7 = (short)lVar12 + 0x25;
          lVar18 = local_c0;
          lVar16 = local_b8;
          do {
            piVar17 = (int *)(ulong)*(ushort *)(lVar18 + 0x36);
            uVar20 = (ulong)((uint)*(ushort *)(lVar18 + 0x36) * 2);
            piVar14 = (int *)0xffffffffffffffff;
            do {
              piVar13 = piVar17;
              if (uVar20 == 0) goto joined_r0x00014594d857;
              uVar8 = *(ushort *)(lVar18 + 0x3a + (long)piVar14 * 2);
              bVar21 = (uVar8 < uVar7) - (uVar7 < uVar8);
              piVar14 = (int *)((long)piVar14 + 1);
              uVar20 = uVar20 - 2;
            } while (bVar21 == 1);
            piVar17 = (int *)(ulong)bVar21;
            piVar13 = piVar14;
            if (bVar21 == 0) {
              *(int *)(lVar18 + 8 + (long)piVar14 * 4) = (int)uVar19;
              goto LAB_14594d8bf;
            }
joined_r0x00014594d857:
            if (lVar16 == 0) goto LAB_14594d88f;
            lVar16 = lVar16 + -1;
            lVar18 = *(long *)(lVar18 + 0x50 + (long)piVar13 * 8);
          } while( true );
        }
        lVar18 = 0;
LAB_14594d88f:
        local_88 = (ulong)((int)lVar12 + 0x25U & 0xffff);
        local_a8 = &local_c0;
        uStack_98 = 0;
        local_a0 = (undefined1 *)lVar18;
        local_90 = piVar13;
        func_0x0001458d9620();
        piVar14 = extraout_RDX;
LAB_14594d8bf:
        uVar9 = (int)lVar12 * 2 + 0x28;
        lVar18 = local_c0;
        lVar16 = local_b8;
        if (local_c0 != 0) {
          do {
            piVar17 = (int *)(ulong)*(ushort *)(lVar18 + 0x36);
            uVar20 = (ulong)((uint)*(ushort *)(lVar18 + 0x36) * 2);
            piVar13 = (int *)0xffffffffffffffff;
            do {
              piVar14 = piVar17;
              if (uVar20 == 0) goto joined_r0x00014594d927;
              uVar7 = *(ushort *)(lVar18 + 0x3a + (long)piVar13 * 2);
              uVar8 = (ushort)uVar9;
              bVar21 = (uVar7 < uVar8) - (uVar8 < uVar7);
              piVar13 = (int *)((long)piVar13 + 1);
              uVar20 = uVar20 - 2;
            } while (bVar21 == 1);
            piVar17 = (int *)(ulong)bVar21;
            piVar14 = piVar13;
            if (bVar21 == 0) {
              *(uint *)(lVar18 + 8 + (long)piVar13 * 4) = uVar23;
              goto LAB_14594d972;
            }
joined_r0x00014594d927:
            if (lVar16 == 0) goto LAB_14594d942;
            lVar18 = *(long *)(lVar18 + 0x50 + (long)piVar14 * 8);
            lVar16 = lVar16 + -1;
          } while( true );
        }
        lVar18 = 0;
LAB_14594d942:
        local_88 = (ulong)(uVar9 & 0xffff);
        local_a8 = &local_c0;
        uStack_98 = 0;
        local_a0 = (undefined1 *)lVar18;
        local_90 = piVar14;
        func_0x0001458d9620();
        piVar13 = extraout_RDX_00;
LAB_14594d972:
        uVar23 = (int)lVar12 * 2 + 0x29;
        lVar18 = local_c0;
        lVar16 = local_b8;
        if (local_c0 != 0) {
          do {
            piVar17 = (int *)(ulong)*(ushort *)(lVar18 + 0x36);
            uVar20 = (ulong)((uint)*(ushort *)(lVar18 + 0x36) * 2);
            piVar14 = (int *)0xffffffffffffffff;
            do {
              piVar13 = piVar17;
              if (uVar20 == 0) goto joined_r0x00014594d9e7;
              uVar7 = *(ushort *)(lVar18 + 0x3a + (long)piVar14 * 2);
              uVar8 = (ushort)uVar23;
              bVar21 = (uVar7 < uVar8) - (uVar8 < uVar7);
              piVar14 = (int *)((long)piVar14 + 1);
              uVar20 = uVar20 - 2;
            } while (bVar21 == 1);
            piVar17 = (int *)(ulong)bVar21;
            piVar13 = piVar14;
            if (bVar21 == 0) {
              *(undefined4 *)(lVar18 + 8 + (long)piVar14 * 4) = uVar22;
              param_1 = lVar12;
              goto joined_r0x00014594d741;
            }
joined_r0x00014594d9e7:
            if (lVar16 == 0) goto LAB_14594d9f2;
            lVar18 = *(long *)(lVar18 + 0x50 + (long)piVar13 * 8);
            lVar16 = lVar16 + -1;
          } while( true );
        }
        lVar18 = 0;
LAB_14594d9f2:
        local_88 = (ulong)(uVar23 & 0xffff);
        local_a8 = &local_c0;
        uStack_98 = 0;
        local_a0 = (undefined1 *)lVar18;
        local_90 = piVar13;
        func_0x0001458d9620();
        param_1 = lVar12;
joined_r0x00014594d741:
        lVar18 = 2;
        lVar12 = lVar24;
      } while (lVar11 == 2);
    } while( true );
  }
  do {
    uVar19 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
    piVar13 = (int *)0xffffffffffffffff;
    do {
      piVar17 = (int *)(ulong)*(ushort *)(lVar11 + 0x36);
      if (uVar19 == 0) goto LAB_14594d6a3;
      uVar7 = *(ushort *)(lVar11 + 0x3a + (long)piVar13 * 2);
      piVar17 = (int *)((long)piVar13 + 1);
      uVar19 = uVar19 - 2;
      piVar13 = piVar17;
    } while ((char)((uVar7 < 0x85) - (0x85 < uVar7)) == '\x01');
    if (uVar7 < 0x85 == 0x85 < uVar7) {
      *(int *)(lVar11 + 8 + (long)piVar17 * 4) = param_5[2];
      goto LAB_14594d6e7;
    }
LAB_14594d6a3:
    if (lVar12 == 0) goto LAB_14594d6b9;
    lVar11 = *(long *)(lVar11 + 0x50 + (long)piVar17 * 8);
    lVar12 = lVar12 + -1;
  } while( true );
LAB_14594da5c:
  uVar19 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
  piVar13 = (int *)0xffffffffffffffff;
  do {
    piVar17 = (int *)(ulong)*(ushort *)(lVar11 + 0x36);
    if (uVar19 == 0) goto LAB_14594daa3;
    uVar7 = *(ushort *)(lVar11 + 0x3a + (long)piVar13 * 2);
    piVar17 = (int *)((long)piVar13 + 1);
    uVar19 = uVar19 - 2;
    piVar13 = piVar17;
  } while ((char)((uVar7 < 0xa4) - (0xa4 < uVar7)) == '\x01');
  if (uVar7 < 0xa4 == 0xa4 < uVar7) {
    *(uint *)(lVar11 + 8 + (long)piVar17 * 4) = (uint)(local_e4 != 0 || local_128 != 0);
    goto LAB_14594daeb;
  }
LAB_14594daa3:
  bVar25 = local_b8 == 0;
  local_b8 = local_b8 + -1;
  if (bVar25) {
LAB_14594dab9:
    local_a8 = &local_c0;
    uStack_98 = 0;
    local_88 = 0xa4;
    local_a0 = (undefined1 *)lVar11;
    local_90 = piVar17;
    func_0x0001458d9620();
LAB_14594daeb:
    local_c8 = 0;
    local_e0 = (long *)0x0;
    local_d8 = (undefined1 *)0x1;
    local_d0 = 0;
    lVar11 = local_f0;
    if (local_b0 != 0) {
      local_71 = 1;
      func_0x000145d991b0();
      *local_d8 = 0;
      local_d0 = 1;
      local_71 = 1;
      func_0x0001458cf2e0();
      local_71 = 1;
      func_0x0001458c0170();
      local_c8 = local_c8 + 1;
    }
    uStack_98 = local_d0;
    local_90 = (int *)CONCAT44(local_c4,local_c8);
    local_a8 = local_e0;
    local_a0 = local_d8;
    local_71 = 0;
    func_0x0001458bf760();
    lVar12 = *(long *)(lVar11 + 0x628);
    if (lVar12 == *(long *)(lVar11 + 0x618)) {
      func_0x000145bfae10();
    }
    lVar18 = *(long *)(lVar11 + 0x620);
    puVar4 = (undefined4 *)(lVar18 + 0x10 + lVar12 * 0x20);
    *puVar4 = (undefined4)local_108;
    puVar4[1] = local_108._4_4_;
    puVar4[2] = (undefined4)uStack_100;
    puVar4[3] = uStack_100._4_4_;
    puVar2 = (undefined8 *)(lVar18 + lVar12 * 0x20);
    *puVar2 = local_118;
    puVar2[1] = uStack_110;
    *(long *)(lVar11 + 0x628) = lVar12 + 1;
    func_0x0001459b47a0();
    return;
  }
  lVar11 = *(long *)(lVar11 + 0x50 + (long)piVar17 * 8);
  goto LAB_14594da5c;
}

