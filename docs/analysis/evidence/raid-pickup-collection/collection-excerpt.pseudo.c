fVar27 = *(float *)(unaff_R13 + 0x498);
  *(undefined8 *)(unaff_RBP + 0x360) = 0;
  *(undefined8 *)(unaff_RBP + 0x368) = 8;
  *(undefined8 *)(unaff_RBP + 0x370) = 0;
  lVar19 = *(long *)(unaff_R13 + 0x610);
  lVar17 = *(long *)(unaff_R13 + 0x618);
  *(long *)(unaff_RBP + 0xa0) = lVar19;
  *(long *)(unaff_RBP + 0xa8) = lVar19 + lVar17 * 0x48;
  *(long *)(unaff_RBP + 0xb0) = unaff_R13;
  *(undefined1 *)(unaff_RBP + 0x3d7) = 1;
  func_0x0001459d4d20(param_1,param_2,unaff_RBP + 0xa0);
  *(long *)(unaff_RBP + 0x3c8) = unaff_R13 + 0x4d0;
  fVar29 = _DAT_145eab1d0;
  fVar22 = _DAT_145e06064;
  fVar24 = _DAT_145dbad34;
  fVar28 = _DAT_145db6b48;
  lVar19 = *(long *)(unaff_R13 + 0x610);
  lVar17 = lVar19 + *(long *)(unaff_R13 + 0x618) * 0x48;
  lVar16 = *(long *)(unaff_RBP + 0x398);
  uVar6 = *(ulong *)(unaff_RBP + 0x3a0);
  uVar20 = uVar6 & 0xffffffffffffff8;
  uVar5 = (uint)uVar6 & 7;
  *(long *)(unaff_RBP + 0x3f8) = lVar16;
  while (lVar15 = lVar19, lVar15 != lVar17) {
    if (fVar26 - *(float *)(lVar15 + 0x40) <= fVar24) {
      bVar12 = false;
    }
    else {
      lVar19 = *(long *)(lVar15 + 0x28);
      uVar18 = 0;
      while (uVar20 != uVar18) {
        bVar12 = false;
        bVar13 = false;
        if ((((((*(long *)(lVar16 + uVar18 * 8) == lVar19) ||
               (*(long *)(lVar16 + 8 + uVar18 * 8) == lVar19)) ||
              (*(long *)(lVar16 + 0x10 + uVar18 * 8) == lVar19)) ||
             ((bVar12 = bVar13, *(long *)(lVar16 + 0x18 + uVar18 * 8) == lVar19 ||
              (*(long *)(lVar16 + 0x20 + uVar18 * 8) == lVar19)))) ||
            (*(long *)(lVar16 + 0x28 + uVar18 * 8) == lVar19)) ||
           ((*(long *)(lVar16 + 0x30 + uVar18 * 8) == lVar19 ||
            (lVar3 = uVar18 * 8, uVar18 = uVar18 + 8, *(long *)(lVar16 + 0x38 + lVar3) == lVar19))))
        goto LAB_145902ab2;
      }
      if ((uVar6 & 7) == 0) {
        bVar12 = true;
      }
      else {
        lVar3 = *(long *)(lVar16 + uVar20 * 8);
        bVar12 = lVar3 != lVar19;
        if (((((lVar3 != lVar19) && (uVar5 != 1)) &&
             (lVar3 = *(long *)(lVar16 + 8 + uVar20 * 8), bVar12 = lVar3 != lVar19, lVar3 != lVar19)
             ) && (((uVar5 != 2 &&
                    (lVar3 = *(long *)(lVar16 + 0x10 + uVar20 * 8), bVar12 = lVar3 != lVar19,
                    lVar3 != lVar19)) &&
                   ((uVar5 != 3 &&
                    ((lVar3 = *(long *)(lVar16 + 0x18 + uVar20 * 8), bVar12 = lVar3 != lVar19,
                     lVar3 != lVar19 && (uVar5 != 4)))))))) &&
           ((lVar3 = *(long *)(lVar16 + 0x20 + uVar20 * 8), bVar12 = lVar3 != lVar19,
            lVar3 != lVar19 &&
            (((uVar5 != 5 &&
              (lVar3 = *(long *)(lVar16 + 0x28 + uVar20 * 8), bVar12 = lVar3 != lVar19,
              lVar3 != lVar19)) && (uVar5 != 6)))))) {
          bVar12 = *(long *)(lVar16 + 0x30 + uVar20 * 8) != lVar19 && uVar5 == 7;
        }
      }
    }
LAB_145902ab2:
    lVar19 = lVar15 + 0x48;
    if (((*(int *)(lVar15 + 0x20) == 0) && (*(char *)(lVar15 + 0x18) == '\0')) &&
       (fVar21 = (float)*(undefined8 *)(lVar15 + 0x34) - (float)uVar25,
       fVar23 = (float)((ulong)*(undefined8 *)(lVar15 + 0x34) >> 0x20) -
                (float)((ulong)uVar25 >> 0x20), fVar21 = SQRT(fVar23 * fVar23 + fVar21 * fVar21),
       !(bool)(~bVar12 & fVar27 < fVar21))) {
      *(undefined1 *)(unaff_RBP + 0x408) = 1;
      fVar23 = fVar29;
      if (!bVar12) {
        fVar23 = fVar22;
      }
      fVar21 = fVar21 / fVar23;
      if (fVar21 <= fVar28) {
        fVar21 = fVar28;
      }
      *(undefined4 *)(lVar15 + 0x18) = 1;
      *(float *)(lVar15 + 0x1c) = fVar26 + fVar21;
      uVar7 = *(undefined8 *)(lVar15 + 0x28);
      *(undefined4 *)(unaff_RBP + 0xa8) = *(undefined4 *)(lVar15 + 0x3c);
      *(undefined8 *)(unaff_RBP + 0xa0) = *(undefined8 *)(lVar15 + 0x34);
      lVar16 = *(long *)(unaff_RBP + 0x370);
      if (lVar16 == *(long *)(unaff_RBP + 0x360)) {
        func_0x000145c0d9a0();
      }
      lVar15 = *(long *)(unaff_RBP + 0x368);
      *(undefined8 *)(lVar15 + lVar16 * 0x18) = uVar7;
      *(undefined8 *)(lVar15 + 8 + lVar16 * 0x18) = *(undefined8 *)(unaff_RBP + 0xa0);
      *(undefined4 *)(lVar15 + 0x10 + lVar16 * 0x18) = *(undefined4 *)(unaff_RBP + 0xa8);
      *(float *)(lVar15 + 0x14 + lVar16 * 0x18) = fVar21;
      *(long *)(unaff_RBP + 0x370) = lVar16 + 1;
      lVar16 = *(long *)(unaff_RBP + 0x3f8);
    }
  }
  *(undefined1 *)(unaff_RBP + 0x408) = 0;
  *(undefined8 *)(unaff_RBP + 0x380) = *(undefined8 *)(unaff_RBP + 0x360);
  lVar19 = *(long *)(unaff_RBP + 0x368);
  lVar17 = *(long *)(unaff_RBP + 0x370) * 0x18 + lVar19;
  *(long *)(unaff_RBP + 0x3d8) = lVar19;
  for (; lVar19 != lVar17; lVar19 = lVar19 + 0x18) {
    *(undefined4 *)(unaff_RBP + 0x288) = *(undefined4 *)(lVar19 + 0x10);
    *(undefined8 *)(unaff_RBP + 0x280) = *(undefined8 *)(lVar19 + 8);
    *(int *)(*(long *)(unaff_RBP + 0x438) + 0xa7c) =
         *(int *)(*(long *)(unaff_RBP + 0x438) + 0xa7c) + 1;
    *(undefined8 *)(unaff_RBP + 0x300) = uVar25;
    *(undefined4 *)(unaff_RBP + 0x308) = *(undefined4 *)(unaff_RBP + 0x410);
    func_0x0001458c3bf0();
    lVar16 = *(long *)(*(long *)(unaff_RBP + 0x438) + 0x630);
    if (lVar16 == *(long *)(*(long *)(unaff_RBP + 0x438) + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar15 = *(long *)(unaff_RBP + 0x438);
    lVar3 = *(long *)(lVar15 + 0x628);
    uVar8 = *(undefined4 *)(unaff_RBP + 0xa0);
    uVar9 = *(undefined4 *)(unaff_RBP + 0xa4);
    uVar10 = *(undefined4 *)(unaff_RBP + 0xa8);
    uVar11 = *(undefined4 *)(unaff_RBP + 0xac);
    uVar7 = *(undefined8 *)(unaff_RBP + 0xb8);
    puVar4 = (undefined8 *)(lVar3 + 0x10 + lVar16 * 0x20);
    *puVar4 = *(undefined8 *)(unaff_RBP + 0xb0);
    puVar4[1] = uVar7;
    puVar2 = (undefined4 *)(lVar3 + lVar16 * 0x20);
    *puVar2 = uVar8;
    puVar2[1] = uVar9;
    puVar2[2] = uVar10;
    puVar2[3] = uVar11;
    *(long *)(lVar15 + 0x630) = lVar16 + 1;
  }
  if (*(long *)(unaff_RBP + 0x380) != 0) {
    func_0x0001400021d0();
  }
  *(undefined8 *)(unaff_RBP + 0x280) = 0;
  *(undefined8 *)(unaff_RBP + 0x288) = 8;
  *(undefined8 *)(unaff_RBP + 0x290) = 0;
  fVar28 = _DAT_145dad480;
  lVar17 = *(long *)(*(long *)(unaff_RBP + 0x438) + 0x610);
  lVar19 = lVar17 + *(long *)(*(long *)(unaff_RBP + 0x438) + 0x618) * 0x48;
  lVar16 = 0;
  lVar15 = 0;
  *(long *)(unaff_RBP + 0x3d8) = lVar19;
  if (lVar17 != lVar19) {
LAB_145902e70:
    do {
      if (*(int *)(lVar17 + 0x20) == 0) {
LAB_145902e9c:
        if ((*(int *)(lVar17 + 0x18) != 1) || (fVar26 < *(float *)(lVar17 + 0x1c))) {
LAB_145902e60:
          lVar17 = lVar17 + 0x48;
          lVar15 = lVar15 + 1;
          if (lVar17 == lVar19) break;
          goto LAB_145902e70;
        }
      }
      else {
        fVar24 = (float)((ulong)uVar25 >> 0x20);
        if (*(int *)(lVar17 + 0x20) == 1) {
          fVar22 = (float)*(undefined8 *)(lVar17 + 0x34) - (float)uVar25;
          fVar24 = (float)((ulong)*(undefined8 *)(lVar17 + 0x34) >> 0x20) - fVar24;
          if (fVar27 < SQRT(fVar24 * fVar24 + fVar22 * fVar22)) goto LAB_145902e9c;
        }
        else {
          fVar22 = (float)*(undefined8 *)(lVar17 + 0x34) - (float)uVar25;
          fVar24 = (float)((ulong)*(undefined8 *)(lVar17 + 0x34) >> 0x20) - fVar24;
          if (fVar28 < SQRT(fVar24 * fVar24 + fVar22 * fVar22)) goto LAB_145902e60;
        }
      }
      *(long *)(unaff_RBP + 0x380) = lVar17;
      if (lVar16 == *(long *)(unaff_RBP + 0x280)) {
        func_0x000145c0d930();
      }
      lVar17 = *(long *)(unaff_RBP + 0x380) + 0x48;
      *(long *)(*(long *)(unaff_RBP + 0x288) + lVar16 * 8) = lVar15;
      lVar15 = lVar15 + 1;
      lVar16 = lVar16 + 1;
      *(long *)(unaff_RBP + 0x290) = lVar16;
      lVar19 = *(long *)(unaff_RBP + 0x3d8);
    } while (lVar17 != lVar19);
  }
  *(long *)(unaff_RBP + 0x380) = lVar17;
  *(undefined8 *)(unaff_RBP + 0x3e0) = *(undefined8 *)(unaff_RBP + 0x280);
  *(long *)(unaff_RBP + 0x410) = *(long *)(unaff_RBP + 0x288);
  lVar19 = *(long *)(unaff_RBP + 0x288) + lVar16 * 8;
  lVar17 = 0x1e;
  do {
    while( true ) {
      if (*(long *)(unaff_RBP + 0x410) == lVar19) {
        if (*(long *)(unaff_RBP + 0x3e0) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(unaff_RBP + 0x390) != 0) {
          func_0x0001400021d0();
        }
                    /* WARNING: Bad instruction - Truncating control flow here */
