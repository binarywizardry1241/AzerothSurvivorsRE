
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong * entry(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4)

{
  uint *puVar1;
  undefined4 *puVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  ulong uVar9;
  code *pcVar10;
  undefined4 uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  ulong uVar16;
  ulong uVar17;
  ulong uVar18;
  undefined8 *puVar19;
  uint *puVar20;
  ulong uVar21;
  long lVar22;
  ulong uVar23;
  undefined8 *puVar24;
  long lVar25;
  long lVar26;
  ulong local_50;
  
  uVar9 = *(ulong *)(param_3 + 0x5c0);
  if (uVar9 == 0) {
    uVar16 = 8;
  }
  else {
    lVar26 = *(long *)(param_3 + 0x5b8);
    func_0x000140002200();
    uVar16 = func_0x0001400021c0();
    if (uVar16 == 0) {
      func_0x0001461add5b();
                    /* WARNING: Does not return */
      pcVar10 = (code *)invalidInstructionException();
      (*pcVar10)();
    }
    uVar17 = (ulong)((uint)uVar9 & 3);
    if (uVar9 < 4) {
      uVar18 = 0;
    }
    else {
      puVar19 = (undefined8 *)(lVar26 + 0x690);
      uVar18 = 0;
      do {
        *(undefined8 *)(uVar16 + uVar18 * 8) = puVar19[-0xb4];
        *(undefined8 *)(uVar16 + 8 + uVar18 * 8) = puVar19[-0x78];
        *(undefined8 *)(uVar16 + 0x10 + uVar18 * 8) = puVar19[-0x3c];
        *(undefined8 *)(uVar16 + 0x18 + uVar18 * 8) = *puVar19;
        uVar18 = uVar18 + 4;
        puVar19 = puVar19 + 0xf0;
      } while ((uVar9 & 0xfffffffffffffffc) != uVar18);
      if (uVar17 == 0) goto LAB_145b1de86;
    }
    puVar19 = (undefined8 *)(uVar18 * 0x1e0 + lVar26 + 0xf0);
    uVar23 = 0;
    do {
      *(undefined8 *)(uVar16 + uVar18 * 8 + uVar23 * 8) = *puVar19;
      uVar23 = uVar23 + 1;
      puVar19 = puVar19 + 0x3c;
    } while (uVar17 != uVar23);
  }
LAB_145b1de86:
  lVar26 = *(long *)(param_3 + 0x660);
  uVar17 = *(ulong *)(param_3 + 0x668);
  local_50 = uVar9;
  if (uVar17 != 0) {
    func_0x000146005df0();
    if ((uVar17 < 0x12) ||
       ((uVar16 + uVar9 * 8 < (lVar26 + uVar17 * 0x48) - 0x18 &&
        (lVar26 + 0x28U < uVar16 + (uVar17 + uVar9) * 8)))) {
      uVar18 = 0;
    }
    else {
      uVar18 = uVar17 & 0xfffffffffffffffc;
      local_50 = uVar9 + uVar18;
      lVar25 = uVar9 * 8 + uVar16;
      puVar19 = (undefined8 *)(lVar26 + 0x100);
      uVar23 = 0;
      do {
        uVar6 = puVar19[-0x12];
        uVar11 = *(undefined4 *)((long)puVar19 + -0xd4);
        uVar7 = *puVar19;
        uVar8 = puVar19[-9];
        puVar2 = (undefined4 *)(lVar25 + uVar23 * 8);
        *puVar2 = *(undefined4 *)(puVar19 + -0x1b);
        puVar2[1] = uVar11;
        puVar2[2] = (int)uVar6;
        puVar2[3] = (int)((ulong)uVar6 >> 0x20);
        puVar24 = (undefined8 *)(lVar25 + 0x10 + uVar23 * 8);
        *puVar24 = uVar8;
        puVar24[1] = uVar7;
        uVar23 = uVar23 + 4;
        puVar19 = puVar19 + 0x24;
      } while (uVar18 != uVar23);
      if (uVar17 == uVar18) goto LAB_145b1dead;
    }
    uVar23 = uVar18;
    if ((uVar17 & 3) != 0) {
      puVar19 = (undefined8 *)(uVar16 + local_50 * 8);
      puVar24 = (undefined8 *)(lVar26 + uVar18 * 0x48 + 0x28);
      lVar25 = 0;
      do {
        *puVar19 = *puVar24;
        lVar25 = lVar25 + -1;
        puVar19 = puVar19 + 1;
        puVar24 = puVar24 + 9;
      } while (-lVar25 != (uVar17 & 3));
      local_50 = local_50 - lVar25;
      uVar23 = uVar18 - lVar25;
    }
    if (uVar18 - uVar17 < 0xfffffffffffffffd) {
      puVar19 = (undefined8 *)(lVar26 + uVar23 * 0x48 + 0x100);
      lVar26 = uVar17 - uVar23;
      do {
        *(undefined8 *)(uVar16 + local_50 * 8) = puVar19[-0x1b];
        *(undefined8 *)(uVar16 + 8 + local_50 * 8) = puVar19[-0x12];
        *(undefined8 *)(uVar16 + 0x10 + local_50 * 8) = puVar19[-9];
        *(undefined8 *)(uVar16 + 0x18 + local_50 * 8) = *puVar19;
        local_50 = local_50 + 4;
        puVar19 = puVar19 + 0x24;
        lVar26 = lVar26 + -4;
      } while (lVar26 != 0);
    }
  }
LAB_145b1dead:
  func_0x000145c8c6a0();
  lVar26 = *(long *)(param_3 + 0x5d0);
  lVar25 = *(long *)(param_3 + 0x5d8) * 0x58 + lVar26;
  while (lVar26 != lVar25) {
    lVar22 = *(long *)(lVar26 + 0x18);
    lVar26 = lVar26 + 0x58;
    if (lVar22 != 0) {
      if (local_50 == uVar9) {
        func_0x000146005df0();
      }
      *(long *)(uVar16 + local_50 * 8) = lVar22;
      local_50 = local_50 + 1;
    }
  }
  lVar26 = *(long *)(param_3 + 0x648);
  uVar17 = *(ulong *)(param_3 + 0x650);
  if (uVar9 - local_50 < uVar17) {
    func_0x000146005df0();
    if (uVar17 < 0x12) {
LAB_145b1dfb0:
      uVar18 = 0;
    }
    else {
LAB_145b1df83:
      if ((uVar16 + local_50 * 8 < (uVar17 * 0x78 + lVar26) - 0x18) &&
         (lVar26 + 0x58U < uVar16 + (local_50 + uVar17) * 8)) goto LAB_145b1dfb0;
      lVar25 = local_50 * 8;
      uVar18 = uVar17 & 0xfffffffffffffffc;
      local_50 = local_50 + uVar18;
      lVar25 = lVar25 + uVar16;
      puVar19 = (undefined8 *)(lVar26 + 0x1c0);
      uVar23 = 0;
      do {
        uVar6 = puVar19[-0x1e];
        uVar11 = *(undefined4 *)((long)puVar19 + -0x164);
        uVar7 = *puVar19;
        uVar8 = puVar19[-0xf];
        puVar2 = (undefined4 *)(lVar25 + uVar23 * 8);
        *puVar2 = *(undefined4 *)(puVar19 + -0x2d);
        puVar2[1] = uVar11;
        puVar2[2] = (int)uVar6;
        puVar2[3] = (int)((ulong)uVar6 >> 0x20);
        puVar24 = (undefined8 *)(lVar25 + 0x10 + uVar23 * 8);
        *puVar24 = uVar8;
        puVar24[1] = uVar7;
        uVar23 = uVar23 + 4;
        puVar19 = puVar19 + 0x3c;
      } while (uVar18 != uVar23);
      if (uVar17 == uVar18) goto LAB_145b1e0d7;
    }
    uVar23 = uVar18;
    if ((uVar17 & 3) != 0) {
      puVar19 = (undefined8 *)(uVar16 + local_50 * 8);
      puVar24 = (undefined8 *)(uVar18 * 0x78 + lVar26 + 0x58);
      lVar25 = 0;
      do {
        *puVar19 = *puVar24;
        lVar25 = lVar25 + -1;
        puVar19 = puVar19 + 1;
        puVar24 = puVar24 + 0xf;
      } while (-lVar25 != (uVar17 & 3));
      local_50 = local_50 - lVar25;
      uVar23 = uVar18 - lVar25;
    }
    if (uVar18 - uVar17 < 0xfffffffffffffffd) {
      puVar19 = (undefined8 *)(uVar23 * 0x78 + lVar26 + 0x1c0);
      lVar26 = uVar17 - uVar23;
      do {
        *(undefined8 *)(uVar16 + local_50 * 8) = puVar19[-0x2d];
        *(undefined8 *)(uVar16 + 8 + local_50 * 8) = puVar19[-0x1e];
        *(undefined8 *)(uVar16 + 0x10 + local_50 * 8) = puVar19[-0xf];
        *(undefined8 *)(uVar16 + 0x18 + local_50 * 8) = *puVar19;
        local_50 = local_50 + 4;
        puVar19 = puVar19 + 0x3c;
        lVar26 = lVar26 + -4;
      } while (lVar26 != 0);
    }
  }
  else if (uVar17 != 0) {
    if (0x11 < uVar17) goto LAB_145b1df83;
    goto LAB_145b1dfb0;
  }
LAB_145b1e0d7:
  lVar26 = *(long *)(param_3 + 0xd0);
  uVar17 = *(ulong *)(param_3 + 0xd8);
  if (uVar9 - local_50 < uVar17) {
    func_0x000146005df0();
    if (uVar17 < 0x10) {
LAB_145b1e13c:
      uVar18 = 0;
    }
    else {
LAB_145b1e10c:
      if ((uVar16 + local_50 * 8 < (uVar17 * 0x80 + lVar26) - 0x58) &&
         (lVar26 + 0x20U < uVar16 + (local_50 + uVar17) * 8)) goto LAB_145b1e13c;
      lVar25 = local_50 * 8;
      uVar18 = uVar17 & 0xfffffffffffffffc;
      local_50 = local_50 + uVar18;
      lVar25 = lVar25 + uVar16;
      puVar19 = (undefined8 *)(lVar26 + 0x1a0);
      uVar23 = 0;
      do {
        uVar6 = puVar19[-0x20];
        uVar11 = *(undefined4 *)((long)puVar19 + -0x17c);
        uVar7 = *puVar19;
        uVar8 = puVar19[-0x10];
        puVar2 = (undefined4 *)(lVar25 + uVar23 * 8);
        *puVar2 = *(undefined4 *)(puVar19 + -0x30);
        puVar2[1] = uVar11;
        puVar2[2] = (int)uVar6;
        puVar2[3] = (int)((ulong)uVar6 >> 0x20);
        puVar24 = (undefined8 *)(lVar25 + 0x10 + uVar23 * 8);
        *puVar24 = uVar8;
        puVar24[1] = uVar7;
        uVar23 = uVar23 + 4;
        puVar19 = puVar19 + 0x40;
      } while (uVar18 != uVar23);
      if (uVar17 == uVar18) goto LAB_145b1e257;
    }
    uVar23 = uVar18;
    if ((uVar17 & 3) != 0) {
      puVar19 = (undefined8 *)(uVar16 + local_50 * 8);
      puVar24 = (undefined8 *)(uVar18 * 0x80 + lVar26 + 0x20);
      lVar25 = 0;
      do {
        *puVar19 = *puVar24;
        lVar25 = lVar25 + -1;
        puVar19 = puVar19 + 1;
        puVar24 = puVar24 + 0x10;
      } while (-lVar25 != (uVar17 & 3));
      local_50 = local_50 - lVar25;
      uVar23 = uVar18 - lVar25;
    }
    if (uVar18 - uVar17 < 0xfffffffffffffffd) {
      lVar25 = uVar17 - uVar23;
      puVar19 = (undefined8 *)(uVar23 * 0x80 + lVar26 + 0x1a0);
      do {
        *(undefined8 *)(uVar16 + local_50 * 8) = puVar19[-0x30];
        *(undefined8 *)(uVar16 + 8 + local_50 * 8) = puVar19[-0x20];
        *(undefined8 *)(uVar16 + 0x10 + local_50 * 8) = puVar19[-0x10];
        *(undefined8 *)(uVar16 + 0x18 + local_50 * 8) = *puVar19;
        local_50 = local_50 + 4;
        puVar19 = puVar19 + 0x40;
        lVar25 = lVar25 + -4;
      } while (lVar25 != 0);
    }
  }
  else if (uVar17 != 0) {
    if (0xf < uVar17) goto LAB_145b1e10c;
    goto LAB_145b1e13c;
  }
LAB_145b1e257:
  uVar17 = *(ulong *)(param_3 + 0x960);
  if (uVar17 != 0) {
    lVar26 = *(long *)(param_3 + 0x958);
    func_0x000140002200();
    lVar25 = func_0x0001400021c0();
    if (lVar25 == 0) {
      func_0x0001461add5b();
                    /* WARNING: Does not return */
      pcVar10 = (code *)invalidInstructionException();
      (*pcVar10)();
    }
    if (uVar17 < 4) {
      uVar18 = 0;
LAB_145b1e304:
      uVar23 = 0;
      do {
        *(undefined8 *)(lVar25 + uVar18 * 8 + uVar23) =
             *(undefined8 *)(lVar26 + uVar18 * 0x20 + uVar23 * 4);
        uVar23 = uVar23 + 8;
      } while (((uint)uVar17 & 3) << 3 != uVar23);
    }
    else {
      puVar19 = (undefined8 *)(lVar26 + 0x60);
      uVar18 = 0;
      do {
        *(undefined8 *)(lVar25 + uVar18 * 8) = puVar19[-0xc];
        *(undefined8 *)(lVar25 + 8 + uVar18 * 8) = puVar19[-8];
        *(undefined8 *)(lVar25 + 0x10 + uVar18 * 8) = puVar19[-4];
        *(undefined8 *)(lVar25 + 0x18 + uVar18 * 8) = *puVar19;
        uVar18 = uVar18 + 4;
        puVar19 = puVar19 + 0x10;
      } while ((uVar17 & 0xfffffffffffffffc) != uVar18);
      if ((uVar17 & 3) != 0) goto LAB_145b1e304;
    }
    if (uVar9 - local_50 < uVar17) {
      func_0x000146005df0();
    }
    func_0x00014600504b();
    local_50 = local_50 + uVar17;
    if (uVar17 != 0) {
      func_0x0001400021d0();
    }
  }
  lVar26 = *(long *)(param_3 + 0x3a8);
  uVar17 = *(ulong *)(param_3 + 0x3b0);
  if (uVar9 - local_50 < uVar17) {
    func_0x000146005df0();
    if (uVar17 < 0x12) {
LAB_145b1e3dc:
      uVar18 = 0;
    }
    else {
LAB_145b1e3ae:
      uVar15 = uRam000000014732a81c;
      uVar14 = uRam000000014732a818;
      uVar13 = uRam000000014732a814;
      uVar12 = _DAT_14732a810;
      if ((uVar16 + local_50 * 8 < (lVar26 + uVar17 * 0x48) - 0xc) &&
         (lVar26 + 0x38U < uVar16 + (local_50 + uVar17) * 8)) goto LAB_145b1e3dc;
      uVar18 = uVar17 & 0xfffffffffffffffc;
      lVar25 = uVar16 + local_50 * 8;
      local_50 = local_50 + uVar18;
      puVar20 = (uint *)(lVar26 + 0x110);
      uVar23 = 0;
      do {
        uVar3 = puVar20[-0x24];
        uVar4 = *puVar20;
        uVar5 = puVar20[-0x12];
        puVar1 = (uint *)(lVar25 + uVar23 * 8);
        *puVar1 = puVar20[-0x36] | uVar12;
        puVar1[1] = uVar13;
        puVar1[2] = uVar3 | uVar14;
        puVar1[3] = uVar15;
        puVar1 = (uint *)(lVar25 + 0x10 + uVar23 * 8);
        *puVar1 = uVar5 | uVar12;
        puVar1[1] = uVar13;
        puVar1[2] = uVar4 | uVar14;
        puVar1[3] = uVar15;
        uVar23 = uVar23 + 4;
        puVar20 = puVar20 + 0x48;
      } while (uVar18 != uVar23);
      if (uVar17 == uVar18) goto LAB_145b1e4cd;
    }
    uVar23 = uVar18;
    if ((uVar17 & 1) != 0) {
      *(ulong *)(uVar16 + local_50 * 8) =
           (ulong)*(uint *)(lVar26 + 0x38 + uVar18 * 0x48) | 0x4000000000000000;
      local_50 = local_50 + 1;
      uVar23 = uVar18 | 1;
    }
    if (uVar17 != (uVar18 | 1)) {
      puVar20 = (uint *)(lVar26 + uVar23 * 0x48 + 0x80);
      lVar26 = uVar17 - uVar23;
      do {
        *(ulong *)(uVar16 + local_50 * 8) = (ulong)puVar20[-0x12] | 0x4000000000000000;
        *(ulong *)(uVar16 + 8 + local_50 * 8) = (ulong)*puVar20 | 0x4000000000000000;
        local_50 = local_50 + 2;
        puVar20 = puVar20 + 0x24;
        lVar26 = lVar26 + -2;
      } while (lVar26 != 0);
    }
  }
  else if (uVar17 != 0) {
    if (0x11 < uVar17) goto LAB_145b1e3ae;
    goto LAB_145b1e3dc;
  }
LAB_145b1e4cd:
  lVar26 = *(long *)(param_3 + 0x9f8);
  uVar17 = *(ulong *)(param_3 + 0xa00);
  if (uVar9 - local_50 < uVar17) {
    func_0x000146005df0();
    if (uVar17 < 0x12) {
LAB_145b1e52f:
      uVar18 = 0;
    }
    else {
LAB_145b1e502:
      if ((uVar16 + local_50 * 8 < (uVar17 * 0x70 + lVar26) - 0x30) &&
         (lVar26 + 0x38U < uVar16 + (local_50 + uVar17) * 8)) goto LAB_145b1e52f;
      lVar25 = local_50 * 8;
      uVar18 = uVar17 & 0xfffffffffffffffc;
      local_50 = local_50 + uVar18;
      lVar25 = lVar25 + uVar16;
      puVar19 = (undefined8 *)(lVar26 + 0x188);
      uVar23 = 0;
      do {
        uVar6 = puVar19[-0x1c];
        uVar11 = *(undefined4 *)((long)puVar19 + -0x14c);
        uVar7 = *puVar19;
        uVar8 = puVar19[-0xe];
        puVar2 = (undefined4 *)(lVar25 + uVar23 * 8);
        *puVar2 = *(undefined4 *)(puVar19 + -0x2a);
        puVar2[1] = uVar11;
        puVar2[2] = (int)uVar6;
        puVar2[3] = (int)((ulong)uVar6 >> 0x20);
        puVar24 = (undefined8 *)(lVar25 + 0x10 + uVar23 * 8);
        *puVar24 = uVar8;
        puVar24[1] = uVar7;
        uVar23 = uVar23 + 4;
        puVar19 = puVar19 + 0x38;
      } while (uVar18 != uVar23);
      if (uVar17 == uVar18) goto LAB_145b1e647;
    }
    uVar23 = uVar18;
    if ((uVar17 & 3) != 0) {
      puVar19 = (undefined8 *)(uVar16 + local_50 * 8);
      puVar24 = (undefined8 *)(uVar18 * 0x70 + lVar26 + 0x38);
      lVar25 = 0;
      do {
        *puVar19 = *puVar24;
        lVar25 = lVar25 + -1;
        puVar19 = puVar19 + 1;
        puVar24 = puVar24 + 0xe;
      } while (-lVar25 != (uVar17 & 3));
      local_50 = local_50 - lVar25;
      uVar23 = uVar18 - lVar25;
    }
    if (uVar18 - uVar17 < 0xfffffffffffffffd) {
      puVar19 = (undefined8 *)(uVar23 * 0x70 + lVar26 + 0x188);
      lVar26 = uVar17 - uVar23;
      do {
        *(undefined8 *)(uVar16 + local_50 * 8) = puVar19[-0x2a];
        *(undefined8 *)(uVar16 + 8 + local_50 * 8) = puVar19[-0x1c];
        *(undefined8 *)(uVar16 + 0x10 + local_50 * 8) = puVar19[-0xe];
        *(undefined8 *)(uVar16 + 0x18 + local_50 * 8) = *puVar19;
        local_50 = local_50 + 4;
        puVar19 = puVar19 + 0x38;
        lVar26 = lVar26 + -4;
      } while (lVar26 != 0);
    }
  }
  else if (uVar17 != 0) {
    if (0x11 < uVar17) goto LAB_145b1e502;
    goto LAB_145b1e52f;
  }
LAB_145b1e647:
  lVar26 = *(long *)(param_3 + 0xa10);
  uVar17 = *(ulong *)(param_3 + 0xa18);
  if (uVar9 - local_50 < uVar17) {
    func_0x000146005df0();
    if (uVar17 < 8) goto LAB_145b1e68d;
LAB_145b1e67c:
    if ((uVar16 + local_50 * 8) - lVar26 < 0x20) goto LAB_145b1e68d;
    lVar25 = local_50 * 8;
    uVar18 = uVar17 & 0xfffffffffffffffc;
    local_50 = local_50 + uVar18;
    lVar25 = lVar25 + uVar16;
    uVar23 = 0;
    do {
      puVar19 = (undefined8 *)(lVar26 + uVar23 * 8);
      uVar6 = puVar19[1];
      puVar24 = (undefined8 *)(lVar26 + 0x10 + uVar23 * 8);
      uVar7 = *puVar24;
      uVar8 = puVar24[1];
      puVar24 = (undefined8 *)(lVar25 + uVar23 * 8);
      *puVar24 = *puVar19;
      puVar24[1] = uVar6;
      puVar19 = (undefined8 *)(lVar25 + 0x10 + uVar23 * 8);
      *puVar19 = uVar7;
      puVar19[1] = uVar8;
      uVar23 = uVar23 + 4;
    } while (uVar18 != uVar23);
    if (uVar17 == uVar18) goto LAB_145b1e758;
  }
  else {
    if (uVar17 == 0) goto LAB_145b1e758;
    if (7 < uVar17) goto LAB_145b1e67c;
LAB_145b1e68d:
    uVar18 = 0;
  }
  uVar21 = uVar18;
  for (uVar23 = uVar17 & 3; uVar23 != 0; uVar23 = uVar23 - 1) {
    *(undefined8 *)(uVar16 + local_50 * 8) = *(undefined8 *)(lVar26 + uVar21 * 8);
    local_50 = local_50 + 1;
    uVar21 = uVar21 + 1;
  }
  if (uVar18 - uVar17 < 0xfffffffffffffffd) {
    lVar25 = uVar16 + local_50 * 8;
    lVar26 = lVar26 + uVar21 * 8;
    lVar22 = 0;
    do {
      *(undefined8 *)(lVar25 + lVar22 * 8) = *(undefined8 *)(lVar26 + lVar22 * 8);
      *(undefined8 *)(lVar25 + 8 + lVar22 * 8) = *(undefined8 *)(lVar26 + 8 + lVar22 * 8);
      *(undefined8 *)(lVar25 + 0x10 + lVar22 * 8) = *(undefined8 *)(lVar26 + 0x10 + lVar22 * 8);
      *(undefined8 *)(lVar25 + 0x18 + lVar22 * 8) = *(undefined8 *)(lVar26 + 0x18 + lVar22 * 8);
      lVar22 = lVar22 + 4;
    } while (uVar17 - uVar21 != lVar22);
    local_50 = local_50 + lVar22;
  }
LAB_145b1e758:
  param_4[2] = local_50;
  *param_4 = uVar9;
  param_4[1] = uVar16;
  return param_4;
}

