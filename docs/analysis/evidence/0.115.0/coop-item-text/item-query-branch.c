/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  ulong uVar2;
  long lVar3;
  code *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 uVar8;
  int iVar9;
  ulong uVar10;
  byte bVar11;
  undefined4 uVar12;
  uint uVar13;
  undefined8 unaff_RBX;
  long lVar14;
  long unaff_RBP;
  uint uVar15;
  long lVar16;
  int iVar17;
  ulong unaff_R12;
  long lVar18;
  undefined8 unaff_R13;
  byte *unaff_R14;
  float fVar19;
  float fVar20;
  undefined8 uVar21;

  uVar15 = 0;
  if (unaff_R12 == 0) {
    bVar11 = 0;
    uVar13 = 0;
  }
  else {
    bVar11 = *unaff_R14;
    if (unaff_R12 == 1) {
      uVar13 = 0;
    }
    else {
      uVar13 = (uint)unaff_R14[1] << 8;
      if ((2 < unaff_R12) && (uVar15 = (uint)unaff_R14[2] << 0x10, unaff_R12 != 3)) {
        uVar15 = uVar15 | (uint)unaff_R14[3] << 0x18;
      }
    }
  }
  uVar15 = (uint)bVar11 | uVar15 | uVar13;
  *(uint *)(unaff_RBP + 0x2a0) = uVar15;
  func_0x0001458cfdf0(uVar15,param_2,uVar15,unaff_RBP + 0x1b0);
  if (*(long *)(unaff_RBP + 0x1b0) == -1) {
    func_0x00014586e360();
    if (*(long *)(unaff_RBP + 0xc0) == -2) {
      *(undefined8 *)(unaff_RBP + 0x70) = 0xffffffffffffffff;
    }
    else {
      *(undefined8 *)(unaff_RBP + 0xb0) = *(undefined8 *)(unaff_RBP + 0x100);
      *(undefined8 *)(unaff_RBP + 0xa0) = *(undefined8 *)(unaff_RBP + 0xf0);
      *(undefined8 *)(unaff_RBP + 0xa8) = *(undefined8 *)(unaff_RBP + 0xf8);
      *(undefined8 *)(unaff_RBP + 0x90) = *(undefined8 *)(unaff_RBP + 0xe0);
      *(undefined8 *)(unaff_RBP + 0x98) = *(undefined8 *)(unaff_RBP + 0xe8);
      *(undefined8 *)(unaff_RBP + 0x80) = *(undefined8 *)(unaff_RBP + 0xd0);
      *(undefined8 *)(unaff_RBP + 0x88) = *(undefined8 *)(unaff_RBP + 0xd8);
      *(undefined4 *)(unaff_RBP + 0x70) = *(undefined4 *)(unaff_RBP + 0xc0);
      *(undefined4 *)(unaff_RBP + 0x74) = *(undefined4 *)(unaff_RBP + 0xc4);
      *(undefined4 *)(unaff_RBP + 0x78) = *(undefined4 *)(unaff_RBP + 200);
      *(undefined4 *)(unaff_RBP + 0x7c) = *(undefined4 *)(unaff_RBP + 0xcc);
    }
    func_0x00014586e2c0();
    if (*(long *)(unaff_RBP + 0x10) == -1) {
      func_0x0001459aeda0();
    }
    else {
      *(uint *)(unaff_RBP + 0xf0) = uVar15;
      *(undefined8 *)(unaff_RBP + 0xf4) = 4;
      *(undefined4 *)(unaff_RBP + 0xc0) = *(undefined4 *)(unaff_RBP + 0x18);
      *(undefined4 *)(unaff_RBP + 0xc4) = *(undefined4 *)(unaff_RBP + 0x1c);
      *(undefined4 *)(unaff_RBP + 200) = *(undefined4 *)(unaff_RBP + 0x20);
      *(undefined4 *)(unaff_RBP + 0xcc) = *(undefined4 *)(unaff_RBP + 0x24);
      *(undefined4 *)(unaff_RBP + 0xfc) = *(undefined4 *)(unaff_RBP + 0x54);
      *(undefined8 *)(unaff_RBP + 0x100) = *(undefined8 *)(unaff_RBP + 0x4c);
      *(undefined8 *)(unaff_RBP + 0x108) = 0;
      *(undefined4 *)(unaff_RBP + 0x110) = 0;
      *(undefined4 *)(unaff_RBP + 0xd0) = *(undefined4 *)(unaff_RBP + 0x30);
      *(undefined4 *)(unaff_RBP + 0xd4) = *(undefined4 *)(unaff_RBP + 0x34);
      *(undefined4 *)(unaff_RBP + 0xd8) = *(undefined4 *)(unaff_RBP + 0x38);
      *(undefined4 *)(unaff_RBP + 0xdc) = *(undefined4 *)(unaff_RBP + 0x3c);
      *(undefined8 *)(unaff_RBP + 0xe0) = 1;
      *(undefined8 *)(unaff_RBP + 0xe8) = 0;
      func_0x0001459b1d90();
    }
    func_0x00014586e670();
    goto LAB_145875108;
  }
  *(undefined8 *)(unaff_RBP + 0x2c8) = unaff_RBX;
  *(undefined8 *)(unaff_RBP + 0x2c0) = unaff_R13;
  uVar1 = *(undefined8 *)(unaff_RBP + 0x1b0);
  *(undefined8 *)(unaff_RBP + 0x2b8) = *(undefined8 *)(unaff_RBP + 0x1b8);
  *(undefined8 *)(unaff_RBP + 0x58) = *(undefined8 *)(unaff_RBP + 0x1c0);
  lVar18 = *(long *)(unaff_RBP + 0x1c8);
  lVar16 = *(long *)(unaff_RBP + 0x1d0);
  uVar2 = *(ulong *)(unaff_RBP + 0x1e0);
  iVar17 = *(int *)(unaff_RBP + 0x200);
  *(undefined4 *)(unaff_RBP + 0x2a4) = *(undefined4 *)(unaff_RBP + 0x204);
  *(undefined4 *)(unaff_RBP + 0x2d0) = *(undefined4 *)(unaff_RBP + 0x208);
  *(undefined4 *)(unaff_RBP + 0x2b4) = *(undefined4 *)(unaff_RBP + 0x20c);
  uVar21 = *(undefined8 *)(unaff_RBP + 0x210);
  *(undefined8 *)(unaff_RBP + 0x298) = *(undefined8 *)(unaff_RBP + 0x1d8);
  func_0x0001459c1380();
  iVar7 = 4;
  *(uint *)(unaff_RBP + 0x2a8) = uVar15;
  if (uVar2 == 4) {
    if (*(int *)(unaff_RBP + 0x2d0) == 2) goto LAB_145874609;
  }
  else if (uVar2 != 5) {
LAB_145874609:
    iVar7 = (int)uVar2 + 1;
  }
  *(int *)(unaff_RBP + 0x2ac) = iVar7;
  uVar6 = uRam000000014702c5bc;
  uVar5 = uRam000000014702c5b8;
  uVar12 = uRam000000014702c5b4;
  iVar7 = 0;
  uVar8 = 0;
  if ((*(int *)(unaff_RBP + 0x2d0) == 4) && (0x1869e < iVar17 - 1U)) {
    *(undefined4 *)(unaff_RBP + 0xc0) = _DAT_14702c5b0;
    *(undefined4 *)(unaff_RBP + 0xc4) = uVar12;
    *(undefined4 *)(unaff_RBP + 200) = uVar5;
    *(undefined4 *)(unaff_RBP + 0xcc) = uVar6;
    *(undefined4 *)(unaff_RBP + 0xd0) = 0x42200000;
    uVar15 = *(uint *)(unaff_RBP + 0x2b4);
    uVar10 = 4;
    if (uVar15 < 4) {
      uVar10 = (ulong)uVar15;
    }
    if (uVar15 == 6) {
      if (5 < uVar2) {
        func_0x000145eb7363();
LAB_1458763a7:
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      fVar19 = *(float *)(uVar2 * 4 + 0x147034d60) * _DAT_14702c5c0;
    }
    else {
      if (5 < uVar2) {
        func_0x000145eb7363();
        goto LAB_1458763a7;
      }
      fVar19 = *(float *)(unaff_RBP + 0xc0 + uVar10 * 4) * *(float *)(uVar2 * 4 + 0x147034d60) *
               _DAT_145ee55c0;
    }
    uVar12 = 0;
    if (0.0 <= fVar19) {
      uVar12 = (undefined4)(long)fVar19;
    }
    uVar8 = 0xffffffff;
    if (fVar19 <= _DAT_145f00bb4) {
      uVar8 = uVar12;
    }
  }
  *(undefined4 *)(unaff_RBP + 0x2b0) = uVar8;
  *(undefined8 *)(unaff_RBP + 0x60) = uVar1;
  uVar2 = *(ulong *)(unaff_RBP + 0x298);
  if (uVar2 != 0) {
    if (uVar2 == 1) {
      uVar10 = 0;
      iVar7 = 0;
    }
    else {
      *(long *)(unaff_RBP + 0x68) = lVar18;
      uVar10 = 0;
      iVar7 = 0;
      fVar19 = _DAT_145f6d320;
      do {
        iVar17 = 0;
        if (*(int *)(lVar16 + uVar10 * 8) == 2) {
          fVar20 = (float)func_0x000145d1463d(*(undefined4 *)(lVar16 + 4 + uVar10 * 8));
          iVar17 = 0x7fffffff;
          if (fVar20 <= fVar19) {
            iVar17 = (int)fVar20;
          }
          if (NAN(fVar20)) {
            iVar17 = 0;
          }
        }
        iVar9 = 0;
        if (*(int *)(lVar16 + 8 + uVar10 * 8) == 2) {
          fVar20 = (float)func_0x000145d1463d(*(undefined4 *)(lVar16 + 0xc + uVar10 * 8));
          iVar9 = 0x7fffffff;
          if (fVar20 <= fVar19) {
            iVar9 = (int)fVar20;
          }
          if (NAN(fVar20)) {
            iVar9 = 0;
          }
        }
        iVar7 = iVar7 + iVar17 + iVar9;
        uVar10 = uVar10 + 2;
      } while ((uVar2 & 0xfffffffffffffffe) != uVar10);
      lVar18 = *(long *)(unaff_RBP + 0x68);
      if ((*(byte *)(unaff_RBP + 0x298) & 1) == 0) goto LAB_145874f8e;
    }
    iVar17 = 0;
    if (*(int *)(lVar16 + uVar10 * 8) == 2) {
      fVar19 = (float)func_0x000145d1463d(*(undefined4 *)(lVar16 + 4 + uVar10 * 8));
      iVar9 = 0x7fffffff;
      if (fVar19 <= _DAT_145f6d320) {
        iVar9 = (int)fVar19;
      }
      iVar17 = 0;
      if (!NAN(fVar19)) {
        iVar17 = iVar9;
      }
    }
    iVar7 = iVar17 + iVar7;
  }
LAB_145874f8e:
  lVar16 = *(long *)(unaff_RBP + 0x78);
  lVar14 = *(long *)(unaff_RBP + 0x80);
  *(undefined4 *)(unaff_RBP + 0xf0) = *(undefined4 *)(unaff_RBP + 0x2a8);
  *(undefined4 *)(unaff_RBP + 0xf4) = *(undefined4 *)(unaff_RBP + 0x2d0);
  *(undefined4 *)(unaff_RBP + 0xf8) = *(undefined4 *)(unaff_RBP + 0x2b4);
  *(undefined8 *)(unaff_RBP + 0xc0) = *(undefined8 *)(unaff_RBP + 0x2b8);
  *(undefined8 *)(unaff_RBP + 200) = *(undefined8 *)(unaff_RBP + 0x58);
  *(undefined4 *)(unaff_RBP + 0xfc) = *(undefined4 *)(unaff_RBP + 0x2a4);
  *(undefined4 *)(unaff_RBP + 0x100) = *(undefined4 *)(unaff_RBP + 0x2ac);
  *(undefined8 *)(unaff_RBP + 0x104) = uVar21;
  *(undefined4 *)(unaff_RBP + 0x10c) = *(undefined4 *)(unaff_RBP + 0x2b0);
  *(int *)(unaff_RBP + 0x110) = iVar7;
  *(long *)(unaff_RBP + 0xd0) = lVar16;
  *(long *)(unaff_RBP + 0xd8) = lVar14;
  *(undefined8 *)(unaff_RBP + 0xe0) = 1;
  *(undefined8 *)(unaff_RBP + 0xe8) = 0;
  func_0x0001459b1d90();
  lVar3 = *(long *)(unaff_RBP + 0x60);
  if (lVar14 != 0) {
    lVar16 = lVar16 + 8;
    do {
      if (*(long *)(lVar16 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar16 = lVar16 + 0x18;
      lVar14 = lVar14 + -1;
    } while (lVar14 != 0);
  }
  if (*(long *)(unaff_RBP + 0x70) != 0) {
    func_0x0001400021d0();
  }
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  if (lVar18 != 0) {
    func_0x0001400021d0();
  }
LAB_145875108:
  func_0x000145894b80();
  return;
}
