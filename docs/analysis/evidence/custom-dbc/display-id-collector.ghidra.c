/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 uVar1;
  uint uVar2;
  bool bVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  undefined8 *in_RCX;
  long lVar9;
  uint *puVar10;
  ulong uVar11;
  int *piVar12;
  long lVar13;
  long lVar14;
  undefined4 *puVar15;
  uint *puVar16;
  ulong uVar17;
  int iVar18;
  uint *puVar19;
  uint *puVar20;
  uint uVar21;
  long lVar22;
  bool bVar23;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  long local_70;
  uint *puStack_58;
  ulong local_50;

  puStack_58 = (uint *)&DAT_00000004;
  local_50 = 0;
  uVar11 = 0;
  lVar9 = 0;
  while (lVar9 != 0xab0) {
    lVar13 = lVar9 + 0x146bbd128;
    lVar9 = lVar9 + 0x130;
    lVar22 = 0x88;
    while (lVar22 != 0x128) {
      piVar12 = (int *)(lVar13 + lVar22);
      lVar14 = lVar13 + lVar22;
      lVar22 = lVar22 + 0x20;
      while (piVar12 != (int *)(lVar14 + 0x20)) {
        iVar18 = *piVar12;
        piVar12 = piVar12 + 1;
        if (iVar18 != 0) {
          if (uVar11 == 0) {
            func_0x000145bcb2d0();
          }
          *(int *)(uVar11 * 4 + 4) = iVar18;
          uVar11 = uVar11 + 1;
          local_50 = uVar11;
        }
      }
    }
    lVar22 = *(long *)(lVar13 + 0x78);
    lVar13 = *(long *)(lVar13 + 0x80) * 0x90 + lVar22;
    if (lVar22 != lVar13) {
      do {
        uVar1 = *(undefined4 *)(lVar22 + 0x88);
        uVar4 = *(undefined8 *)(lVar22 + 0x78);
        uVar5 = *(undefined8 *)(lVar22 + 0x80);
        if (-uVar11 < 5) {
          func_0x000145bcb2d0();
          uVar11 = local_50;
        }
        *(undefined4 *)(uVar11 * 4 + 0x14) = uVar1;
        local_a8 = (undefined4)uVar4;
        uStack_a4 = (undefined4)((ulong)uVar4 >> 0x20);
        uStack_a0 = (undefined4)uVar5;
        uStack_9c = (undefined4)((ulong)uVar5 >> 0x20);
        lVar14 = uVar11 * 4;
        *(undefined4 *)(lVar14 + 4) = local_a8;
        *(undefined4 *)(lVar14 + 8) = uStack_a4;
        *(undefined4 *)(lVar14 + 0xc) = uStack_a0;
        *(undefined4 *)(lVar14 + 0x10) = uStack_9c;
        uVar11 = uVar11 + 5;
        lVar22 = lVar22 + 0x90;
        local_50 = uVar11;
      } while (lVar22 != lVar13);
    }
  }
  local_70 = 0;
  while (local_70 != 0x438) {
    lVar9 = 0x30;
    while (lVar9 != 0x70) {
      piVar12 = (int *)(local_70 + 0x146bbe098 + lVar9);
      lVar13 = local_70 + 0x146bbe098 + lVar9;
      lVar9 = lVar9 + 0x20;
      while (piVar12 != (int *)(lVar13 + 0x20)) {
        iVar18 = *piVar12;
        piVar12 = piVar12 + 1;
        if (iVar18 != 0) {
          if (local_50 == 0) {
            func_0x000145bcb2d0();
          }
          *(int *)(local_50 * 4 + 4) = iVar18;
          local_50 = local_50 + 1;
        }
      }
    }
    if (-local_50 < (ulong)(*(long *)(local_70 + 0x146bbe0c0) * 2)) {
      func_0x000145bcb2d0();
    }
    func_0x0001459b0ea0();
    local_70 = local_70 + 0x78;
  }
  if (-local_50 < 0x42) {
    func_0x000145bcb2d0();
  }
  uVar4 = uRam0000000146bb9208;
  bVar23 = local_50 * 4 + 4 < 0x146bbaf30;
  bVar3 = &DAT_146bba504 < (undefined1 *)(local_50 * 4 + 0x10c);
  if (bVar3 && bVar23) {
    lVar9 = 0;
  }
  else {
    *(undefined8 *)(local_50 * 4 + 4) = _DAT_146bb9200;
    *(undefined8 *)(local_50 * 4 + 0xc) = uVar4;
    uVar4 = uRam0000000146bb9218;
    *(undefined8 *)(local_50 * 4 + 0x14) = _DAT_146bb9210;
    *(undefined8 *)(local_50 * 4 + 0x1c) = uVar4;
    uVar4 = uRam0000000146bb9228;
    *(undefined8 *)(local_50 * 4 + 0x24) = _DAT_146bb9220;
    *(undefined8 *)(local_50 * 4 + 0x2c) = uVar4;
    uVar4 = uRam0000000146bb9238;
    *(undefined8 *)(local_50 * 4 + 0x34) = _DAT_146bb9230;
    *(undefined8 *)(local_50 * 4 + 0x3c) = uVar4;
    uVar4 = uRam0000000146bb9248;
    *(undefined8 *)(local_50 * 4 + 0x44) = _DAT_146bb9240;
    *(undefined8 *)(local_50 * 4 + 0x4c) = uVar4;
    uVar4 = uRam0000000146bb9258;
    *(undefined8 *)(local_50 * 4 + 0x54) = _DAT_146bb9250;
    *(undefined8 *)(local_50 * 4 + 0x5c) = uVar4;
    uVar4 = uRam0000000146bb9268;
    *(undefined8 *)(local_50 * 4 + 100) = _DAT_146bb9260;
    *(undefined8 *)(local_50 * 4 + 0x6c) = uVar4;
    uVar4 = uRam0000000146bb9278;
    *(undefined8 *)(local_50 * 4 + 0x74) = _DAT_146bb9270;
    *(undefined8 *)(local_50 * 4 + 0x7c) = uVar4;
    uVar4 = uRam0000000146bb9288;
    *(undefined8 *)(local_50 * 4 + 0x84) = _DAT_146bb9280;
    *(undefined8 *)(local_50 * 4 + 0x8c) = uVar4;
    uVar4 = uRam0000000146bb9298;
    *(undefined8 *)(local_50 * 4 + 0x94) = _DAT_146bb9290;
    *(undefined8 *)(local_50 * 4 + 0x9c) = uVar4;
    uVar4 = uRam0000000146bb92a8;
    *(undefined8 *)(local_50 * 4 + 0xa4) = _DAT_146bb92a0;
    *(undefined8 *)(local_50 * 4 + 0xac) = uVar4;
    uVar4 = uRam0000000146bb92b8;
    *(undefined8 *)(local_50 * 4 + 0xb4) = _DAT_146bb92b0;
    *(undefined8 *)(local_50 * 4 + 0xbc) = uVar4;
    uVar4 = uRam0000000146bb92c8;
    *(undefined8 *)(local_50 * 4 + 0xc4) = _DAT_146bb92c0;
    *(undefined8 *)(local_50 * 4 + 0xcc) = uVar4;
    uVar4 = uRam0000000146bb92d8;
    *(undefined8 *)(local_50 * 4 + 0xd4) = _DAT_146bb92d0;
    *(undefined8 *)(local_50 * 4 + 0xdc) = uVar4;
    uVar4 = uRam0000000146bb92e8;
    *(undefined8 *)(local_50 * 4 + 0xe4) = _DAT_146bb92e0;
    *(undefined8 *)(local_50 * 4 + 0xec) = uVar4;
    uVar7 = uRam0000000146bb92fc;
    uVar6 = uRam0000000146bb92f8;
    uVar1 = uRam0000000146bb92f4;
    lVar9 = local_50 * 4;
    *(undefined4 *)(lVar9 + 0xf4) = _DAT_146bb92f0;
    *(undefined4 *)(lVar9 + 0xf8) = uVar1;
    *(undefined4 *)(lVar9 + 0xfc) = uVar6;
    *(undefined4 *)(lVar9 + 0x100) = uVar7;
    local_50 = local_50 + 0x40;
    lVar9 = 0x40;
  }
  puVar15 = (undefined4 *)(lVar9 * 0x28 + 0x146bba57c);
  lVar14 = -0xc;
  lVar22 = 0;
  lVar13 = local_50;
  do {
    *(undefined4 *)(local_50 * 4 + 4 + lVar22 * 4) = puVar15[-0x1e];
    lVar13 = lVar13 + 1;
    lVar22 = lVar22 + 1;
    puVar15 = puVar15 + 10;
    lVar14 = lVar14 + -4;
  } while (lVar22 != 2);
  if (bVar3 && bVar23) {
    puVar8 = (undefined4 *)((local_50 * 4 + 4) - lVar14);
    lVar22 = 0;
    do {
      uVar1 = puVar15[-0x14];
      puVar8[-3] = puVar15[-0x1e];
      puVar8[-2] = uVar1;
      puVar8[-1] = puVar15[-10];
      *puVar8 = *puVar15;
      puVar8 = puVar8 + 4;
      lVar22 = lVar22 + -4;
      puVar15 = puVar15 + 0x28;
    } while (lVar9 + -0x40 != lVar22);
    lVar13 = lVar13 - lVar22;
  }
  else {
    lVar13 = local_50 + 2;
  }
  if ((ulong)-lVar13 < 0x14) {
    func_0x000145bcb2d0();
  }
  uVar4 = uRam0000000146bb9308;
  *(undefined8 *)(lVar13 * 4 + 4) = _DAT_146bb9300;
  *(undefined8 *)(lVar13 * 4 + 0xc) = uVar4;
  uVar4 = uRam0000000146bb9318;
  *(undefined8 *)(lVar13 * 4 + 0x14) = _DAT_146bb9310;
  *(undefined8 *)(lVar13 * 4 + 0x1c) = uVar4;
  uVar4 = uRam0000000146bb9328;
  *(undefined8 *)(lVar13 * 4 + 0x24) = _DAT_146bb9320;
  *(undefined8 *)(lVar13 * 4 + 0x2c) = uVar4;
  uVar4 = uRam0000000146bb9338;
  *(undefined8 *)(lVar13 * 4 + 0x34) = _DAT_146bb9330;
  *(undefined8 *)(lVar13 * 4 + 0x3c) = uVar4;
  uVar7 = uRam0000000146bb934c;
  uVar6 = uRam0000000146bb9348;
  uVar1 = uRam0000000146bb9344;
  lVar9 = lVar13 * 4;
  *(undefined4 *)(lVar9 + 0x44) = _DAT_146bb9340;
  *(undefined4 *)(lVar9 + 0x48) = uVar1;
  *(undefined4 *)(lVar9 + 0x4c) = uVar6;
  *(undefined4 *)(lVar9 + 0x50) = uVar7;
  uVar11 = lVar13 + 0x14;
  local_50 = uVar11;
  if (1 < uVar11) {
    if (uVar11 < 0x15) {
      puVar10 = (uint *)&DAT_00000008;
      puVar16 = (uint *)&DAT_00000004;
      do {
        uVar21 = puVar10[-1];
        uVar2 = *puVar10;
        puVar20 = puVar16;
        if (uVar2 < uVar21) {
          do {
            puVar20[1] = uVar21;
            puVar19 = puStack_58;
            if (puVar20 == (uint *)&DAT_00000004) break;
            uVar21 = puVar20[-1];
            puVar19 = puVar20;
            puVar20 = puVar20 + -1;
          } while (uVar2 < uVar21);
          *puVar19 = uVar2;
        }
        puVar10 = puVar10 + 1;
        puVar16 = puVar16 + 1;
      } while (puVar10 != (uint *)(uVar11 * 4 + 4));
    }
    else {
      func_0x000145ae9780();
    }
    if (1 < uVar11) {
      lVar9 = 0;
      do {
        if (*(int *)(lVar9 * 4 + 8) == *(int *)(lVar9 * 4 + 4)) {
          uVar17 = lVar9 + 2;
          local_50 = lVar9 + 1;
          if (uVar17 < uVar11) {
            if (((int)uVar11 - (int)lVar9 & 1U) != 0) {
              iVar18 = *(int *)(lVar9 * 4 + 0xc);
              if (iVar18 != *(int *)(lVar9 * 4 + 4)) {
                *(int *)(lVar9 * 4 + 8) = iVar18;
                local_50 = lVar9 + 2;
              }
              uVar17 = lVar9 + 3;
            }
            if (lVar13 + 0x11 != lVar9) goto LAB_1458bc941;
          }
          break;
        }
        lVar9 = lVar9 + 1;
      } while (lVar13 + 0x13 != lVar9);
    }
  }
  goto LAB_1458bc7ea;
LAB_1458bc941:
  do {
    iVar18 = *(int *)(uVar17 * 4 + 4);
    if (iVar18 == *(int *)(local_50 * 4)) {
      iVar18 = *(int *)(uVar17 * 4 + 8);
      if (iVar18 != *(int *)(local_50 * 4)) {
LAB_1458bc96d:
        *(int *)(local_50 * 4 + 4) = iVar18;
        local_50 = local_50 + 1;
      }
    }
    else {
      *(int *)(local_50 * 4 + 4) = iVar18;
      local_50 = local_50 + 1;
      iVar18 = *(int *)(uVar17 * 4 + 8);
      if (iVar18 != *(int *)(local_50 * 4)) goto LAB_1458bc96d;
    }
    uVar17 = uVar17 + 2;
  } while (uVar11 != uVar17);
LAB_1458bc7ea:
  in_RCX[2] = local_50;
  *in_RCX = 0;
  in_RCX[1] = 4;
  return;
}
