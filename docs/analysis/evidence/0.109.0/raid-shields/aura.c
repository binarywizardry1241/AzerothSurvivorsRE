
void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,int param_5,char param_6)

{
  undefined8 *puVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  ushort uVar12;
  int iVar13;
  uint uVar14;
  undefined4 uVar15;
  uint uVar16;
  ulong uVar17;
  ulong extraout_RDX;
  long lVar18;
  ushort uVar19;
  uint uVar20;
  ulong uVar21;
  long lVar22;
  long lVar23;
  ulong uVar24;
  ulong uVar25;
  long lVar26;
  bool bVar27;
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  long local_c0;
  long local_b8;
  ulong *local_b0;
  undefined1 *local_a8;
  undefined8 local_a0;
  int local_98;
  undefined4 local_94;
  ulong local_90;
  long local_88;
  long local_80;
  ulong *local_78;
  undefined1 local_70 [16];
  undefined8 local_60;
  ulong local_58;
  undefined1 local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  if (*(long *)(param_4 + 0x568) == 0) {
    return;
  }
  lVar18 = *(long *)(param_4 + 0x560);
  lVar26 = 0;
  while ((*(long *)(lVar18 + 0xf0 + lVar26) != param_3 || (*(int *)(lVar18 + 0xb0 + lVar26) == 1)))
  {
    lVar26 = lVar26 + 0x1d8;
    if (*(long *)(param_4 + 0x568) * 0x1d8 - lVar26 == 0) {
      return;
    }
  }
  iVar4 = *(int *)(lVar18 + 0x118 + lVar26);
  if (param_6 == '\0') {
    iVar13 = 0;
    if (iVar4 == param_5) {
      uVar21 = 0;
    }
    else {
      uVar21 = 1;
      if (((((*(int *)(lVar18 + 0x11c + lVar26) != param_5) &&
            (uVar21 = 2, *(int *)(lVar18 + 0x120 + lVar26) != param_5)) &&
           (uVar21 = 3, *(int *)(lVar18 + 0x124 + lVar26) != param_5)) &&
          (((uVar21 = 4, *(int *)(lVar18 + 0x128 + lVar26) != param_5 &&
            (uVar21 = 5, *(int *)(lVar18 + 300 + lVar26) != param_5)) &&
           ((uVar21 = 6, *(int *)(lVar18 + 0x130 + lVar26) != param_5 &&
            ((uVar21 = 7, *(int *)(lVar18 + 0x134 + lVar26) != param_5 &&
             (uVar21 = 8, *(int *)(lVar18 + 0x138 + lVar26) != param_5)))))))) &&
         ((uVar21 = 9, *(int *)(lVar18 + 0x13c + lVar26) != param_5 &&
          (((((uVar21 = 10, *(int *)(lVar18 + 0x140 + lVar26) != param_5 &&
              (uVar21 = 0xb, *(int *)(lVar18 + 0x144 + lVar26) != param_5)) &&
             (uVar21 = 0xc, *(int *)(lVar18 + 0x148 + lVar26) != param_5)) &&
            ((uVar21 = 0xd, *(int *)(lVar18 + 0x14c + lVar26) != param_5 &&
             (uVar21 = 0xe, *(int *)(lVar18 + 0x150 + lVar26) != param_5)))) &&
           (uVar21 = 0xf, *(int *)(lVar18 + 0x154 + lVar26) != param_5)))))) {
        return;
      }
    }
  }
  else {
    piVar2 = (int *)(lVar18 + 0x11c + lVar26);
    piVar3 = (int *)(lVar18 + 300 + lVar26);
    auVar29._0_4_ = -(uint)(*piVar3 == param_5);
    auVar29._4_4_ = -(uint)(piVar3[1] == param_5);
    auVar29._8_4_ = -(uint)(piVar3[2] == param_5);
    auVar29._12_4_ = -(uint)(piVar3[3] == param_5);
    auVar28._0_4_ = -(uint)(param_5 == *piVar2);
    auVar28._4_4_ = -(uint)(param_5 == piVar2[1]);
    auVar28._8_4_ = -(uint)(param_5 == piVar2[2]);
    auVar28._12_4_ = -(uint)(param_5 == piVar2[3]);
    auVar28 = packssdw(auVar28,auVar29);
    if ((((((((((((((((SUB161(auVar28 >> 7,0) & 1) != 0 || (SUB161(auVar28 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar28 >> 0x17,0) & 1) != 0) || (SUB161(auVar28 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar28 >> 0x27,0) & 1) != 0) || (SUB161(auVar28 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar28 >> 0x37,0) & 1) != 0) || (SUB161(auVar28 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar28 >> 0x47,0) & 1) != 0) || (SUB161(auVar28 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar28 >> 0x57,0) & 1) != 0) || (SUB161(auVar28 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar28 >> 0x67,0) & 1) != 0) || (SUB161(auVar28 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar28 >> 0x77,0) & 1) != 0) || auVar28[0xf] < '\0') {
      return;
    }
    iVar5 = *(int *)(lVar18 + 0x13c + lVar26);
    if (iVar5 == param_5) {
      return;
    }
    iVar6 = *(int *)(lVar18 + 0x140 + lVar26);
    if (iVar6 == param_5) {
      return;
    }
    iVar7 = *(int *)(lVar18 + 0x144 + lVar26);
    if (iVar7 == param_5) {
      return;
    }
    iVar8 = *(int *)(lVar18 + 0x148 + lVar26);
    if (iVar8 == param_5) {
      return;
    }
    iVar9 = *(int *)(lVar18 + 0x14c + lVar26);
    if (iVar9 == param_5) {
      return;
    }
    iVar10 = *(int *)(lVar18 + 0x150 + lVar26);
    if (iVar10 == param_5) {
      return;
    }
    iVar11 = *(int *)(lVar18 + 0x154 + lVar26);
    if (iVar11 == param_5) {
      return;
    }
    if (iVar4 == param_5) {
      return;
    }
    iVar13 = param_5;
    if (iVar4 == 0) {
      uVar21 = 0;
    }
    else if (*piVar2 == 0) {
      uVar21 = 1;
    }
    else if (piVar2[1] == 0) {
      uVar21 = 2;
    }
    else if (piVar2[2] == 0) {
      uVar21 = 3;
    }
    else if (piVar2[3] == 0) {
      uVar21 = 4;
    }
    else if (*piVar3 == 0) {
      uVar21 = 5;
    }
    else if (piVar3[1] == 0) {
      uVar21 = 6;
    }
    else if (piVar3[2] == 0) {
      uVar21 = 7;
    }
    else if (piVar3[3] == 0) {
      uVar21 = 8;
    }
    else if (iVar5 == 0) {
      uVar21 = 9;
    }
    else if (iVar6 == 0) {
      uVar21 = 10;
    }
    else if (iVar7 == 0) {
      uVar21 = 0xb;
    }
    else if (iVar8 == 0) {
      uVar21 = 0xc;
    }
    else if (iVar9 == 0) {
      uVar21 = 0xd;
    }
    else if (iVar10 == 0) {
      uVar21 = 0xe;
    }
    else {
      if (iVar11 != 0) {
        return;
      }
      uVar21 = 0xf;
    }
  }
  *(int *)(lVar26 + 0x118 + lVar18 + uVar21 * 4) = iVar13;
  local_90 = 0;
  local_80 = 0;
  local_58 = uVar21 + 0x4f;
  local_78 = &local_90;
  local_70 = (undefined1  [16])0x0;
  local_c0 = param_3;
  local_b8 = param_4;
  func_0x0001458d9620(uVar21,lVar18,&local_78,&local_e0,iVar13);
  uVar20 = (uint)uVar21;
  uVar14 = (uint)(uVar21 >> 3);
  lVar22 = (ulong)(uVar14 << 5) + lVar18;
  uVar16 = (uint)(*(int *)(lVar26 + 0x130 + lVar22) != 0) << 0x19;
  uVar17 = (ulong)uVar16;
  uVar14 = (uVar14 & 0x1fffffff) + 99;
  uVar21 = local_90;
  lVar23 = local_88;
  if (local_90 != 0) {
    do {
      uVar25 = (ulong)((uint)*(ushort *)(uVar21 + 0x36) * 2);
      uVar24 = 0xffffffffffffffff;
      do {
        uVar17 = (ulong)*(ushort *)(uVar21 + 0x36);
        if (uVar25 == 0) goto LAB_145980a5a;
        uVar19 = *(ushort *)(uVar21 + 0x3a + uVar24 * 2);
        uVar12 = (ushort)uVar14;
        uVar17 = uVar24 + 1;
        uVar25 = uVar25 - 2;
        uVar24 = uVar17;
      } while ((char)((uVar19 < uVar12) - (uVar12 < uVar19)) == '\x01');
      if (uVar19 < uVar12 == uVar12 < uVar19) {
        *(uint *)(uVar21 + 8 + uVar17 * 4) =
             ((uint)(*(int *)(lVar26 + 300 + lVar22) != 0) << 0x15 | uVar16 |
              (uint)(*(int *)(lVar26 + 0x128 + lVar22) != 0) << 0x11 |
              (uint)(*(int *)(lVar26 + 0x124 + lVar22) != 0) << 0xd |
              (uint)(*(int *)(lVar26 + 0x120 + lVar22) != 0) << 9 |
             (uint)(*(int *)(lVar26 + 0x11c + lVar22) != 0) << 5) +
             (uint)(*(int *)(lVar26 + 0x118 + lVar22) != 0) * 2 |
             (uint)(*(int *)(lVar26 + 0x118 + (ulong)(uVar20 * 4 | 0x1c) + lVar18) != 0) << 0x1d;
        goto LAB_145980a9d;
      }
LAB_145980a5a:
      if (lVar23 == 0) goto LAB_145980a70;
      uVar21 = *(ulong *)(uVar21 + 0x50 + uVar17 * 8);
      lVar23 = lVar23 + -1;
    } while( true );
  }
  uVar21 = 0;
LAB_145980a70:
  local_58 = (ulong)(uVar14 & 0xffff);
  local_78 = &local_90;
  local_70._8_8_ = 0;
  local_70._0_8_ = uVar21;
  local_60 = uVar17;
  func_0x0001458d9620();
LAB_145980a9d:
  uVar20 = uVar20 >> 2;
  uVar15 = func_0x00014590d560(uVar20,lVar18 + lVar26,uVar20,lVar18 + lVar26);
  uVar19 = (short)uVar20 + 0x79;
  uVar21 = local_90;
  if (local_90 == 0) {
    uVar21 = 0;
    uVar25 = extraout_RDX;
LAB_145980b22:
    local_58 = (ulong)uVar19;
    local_78 = &local_90;
    local_70._8_8_ = 0;
    local_70._0_8_ = uVar21;
    local_60 = uVar25;
    func_0x0001458d9620();
LAB_145980b53:
    local_98 = 0;
    local_b0 = (ulong *)0x0;
    local_a8 = (undefined1 *)0x1;
    local_a0 = 0;
    if (local_80 != 0) {
      local_49 = 1;
      func_0x000145d991b0();
      *local_a8 = 0;
      local_a0 = 1;
      local_49 = 1;
      func_0x0001458cf2e0();
      local_49 = 1;
      func_0x0001458c0170();
      local_98 = local_98 + 1;
    }
    local_60 = CONCAT44(local_94,local_98);
    local_78 = local_b0;
    local_70._8_8_ = local_a0;
    local_70._0_8_ = local_a8;
    local_49 = 0;
    func_0x0001458bf760();
    lVar18 = *(long *)(local_b8 + 0x628);
    if (lVar18 == *(long *)(local_b8 + 0x618)) {
      func_0x000145bfae10();
    }
    lVar26 = *(long *)(local_b8 + 0x620);
    puVar1 = (undefined8 *)(lVar26 + 0x10 + lVar18 * 0x20);
    *puVar1 = local_d0;
    puVar1[1] = uStack_c8;
    puVar1 = (undefined8 *)(lVar26 + lVar18 * 0x20);
    *puVar1 = local_e0;
    puVar1[1] = uStack_d8;
    *(long *)(local_b8 + 0x628) = lVar18 + 1;
    func_0x0001459b47a0();
    return;
  }
  do {
    uVar24 = (ulong)((uint)*(ushort *)(uVar21 + 0x36) * 2);
    uVar17 = 0xffffffffffffffff;
    do {
      uVar25 = (ulong)*(ushort *)(uVar21 + 0x36);
      if (uVar24 == 0) goto LAB_145980b0d;
      uVar12 = *(ushort *)(uVar21 + 0x3a + uVar17 * 2);
      uVar25 = uVar17 + 1;
      uVar24 = uVar24 - 2;
      uVar17 = uVar25;
    } while ((char)((uVar12 < uVar19) - (uVar19 < uVar12)) == '\x01');
    if (uVar12 < uVar19 == uVar19 < uVar12) {
      *(undefined4 *)(uVar21 + 8 + uVar25 * 4) = uVar15;
      goto LAB_145980b53;
    }
LAB_145980b0d:
    bVar27 = local_88 == 0;
    local_88 = local_88 + -1;
    if (bVar27) goto LAB_145980b22;
    uVar21 = *(ulong *)(uVar21 + 0x50 + uVar25 * 8);
  } while( true );
}

