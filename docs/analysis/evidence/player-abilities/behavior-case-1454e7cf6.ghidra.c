
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  ushort uVar3;
  int iVar4;
  undefined4 uVar5;
  long *plVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  uint uVar11;
  ulong uVar12;
  long lVar13;
  undefined8 uVar14;
  long lVar15;
  long unaff_RBX;
  long unaff_RBP;
  long lVar16;
  undefined4 uVar17;
  ulong uVar18;
  ulong uVar19;
  ulong uVar20;
  byte bVar21;
  undefined8 *unaff_R14;
  ulong uVar22;
  bool bVar23;
  float fVar24;
  undefined4 extraout_XMM0_Da;
  float fVar25;
  float fVar26;
  undefined4 uVar27;
  undefined4 in_XMM9_Da;
  float fVar28;
  float fVar29;
  float fVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  undefined4 uVar33;
  long lStack0000000000000020;
  ulong uStack0000000000000028;
  
  *(undefined4 *)(unaff_RBP + 0xc0) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0xb8) = *unaff_R14;
  uStack0000000000000028 = 0;
  lStack0000000000000020 = 8;
  func_0x0001454ee0d0(param_1,param_2,param_1,unaff_RBP + 0xe0,unaff_RBP + 0xb8U);
  if (*(long *)(unaff_RBP + 0xf0) == 0) {
    if (*(long *)(unaff_RBP + 0xe0) != 0) {
      func_0x0001400021d0();
    }
    uVar14 = 0;
  }
  else {
    if (*(long *)(unaff_RBP + 0xe0) != 0) {
      func_0x0001400021d0();
    }
    *(undefined4 *)(unaff_RBP + 0xb8) = 2;
    *(undefined4 *)(unaff_RBP + 0x50) = 0;
    lStack0000000000000020 = 0;
    uVar19 = 8;
    uStack0000000000000028 = unaff_RBP + 0xb8U;
    func_0x00014544b1a0();
    lVar16 = *(long *)(param_1 + 0x548);
    if (lVar16 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar13 = *(long *)(param_1 + 0x540);
    uVar14 = *(undefined8 *)(unaff_RBP + 0xe0);
    uVar9 = *(undefined8 *)(unaff_RBP + 0xe8);
    uVar27 = *(undefined4 *)(unaff_RBP + 0xf4);
    uVar33 = *(undefined4 *)(unaff_RBP + 0xf8);
    uVar31 = *(undefined4 *)(unaff_RBP + 0xfc);
    puVar2 = (undefined4 *)(lVar13 + 0x10 + lVar16 * 0x20);
    *puVar2 = *(undefined4 *)(unaff_RBP + 0xf0);
    puVar2[1] = uVar27;
    puVar2[2] = uVar33;
    puVar2[3] = uVar31;
    puVar1 = (undefined8 *)(lVar13 + lVar16 * 0x20);
    *puVar1 = uVar14;
    puVar1[1] = uVar9;
    *(long *)(param_1 + 0x548) = lVar16 + 1;
    fVar28 = *(float *)(*(long *)(unaff_RBP + 0x88) + 0x58);
    fVar29 = *(float *)(unaff_RBX + 0x20);
    iVar4 = *(int *)(*(long *)(unaff_RBP + 0x88) + 0x5c);
    fVar26 = 0.0;
    if (*(int *)(param_1 + 0x104) != 0) {
      fVar26 = _DAT_1459c7f74;
    }
    fVar30 = _DAT_1458f8d40 * fVar28 * fVar29 * *(float *)(unaff_RBX + 0x48);
    fVar26 = fVar26 + *(float *)(param_1 + 0x3f4);
    fVar24 = (float)func_0x000145756e31(fVar26);
    fVar26 = (float)func_0x000145756e2b(fVar26);
    fVar24 = fVar24 * _DAT_1469aa620 + (float)*(undefined8 *)(unaff_RBP + 8);
    fVar25 = fVar26 * fRam00000001469aa624 + (float)((ulong)*(undefined8 *)(unaff_RBP + 8) >> 0x20);
    lVar16 = *(long *)(param_1 + 0x878);
    uVar12 = func_0x0001454627f0(fVar26,fVar24,fVar25);
    uVar27 = extraout_XMM0_Da;
    if ((uVar12 & 1) == 0) {
      if ((*(long *)(lVar16 + 0x68) == -1) ||
         (func_0x000145467bf0(), *(int *)(unaff_RBP + 0xe0) != 1)) {
        uVar27 = *(undefined4 *)(lVar16 + 0x90);
      }
      else {
        uVar27 = *(undefined4 *)(unaff_RBP + 0xec);
      }
    }
    *(undefined4 *)(unaff_RBP + 0x118) = 0x11eb;
    if ((*(long **)(unaff_RBP + 0x88))[1] == 0xb) {
      plVar6 = (long *)**(long **)(unaff_RBP + 0x88);
      *(uint *)(unaff_RBP + 0x118) =
           (uint)(*(long *)((long)plVar6 + 3) == 0x6d65746f745f616d && *plVar6 == 0x6f745f616d67616d
                 ) * 2 + 0x11eb;
    }
    *(ulong *)(unaff_RBP + 0x18) = CONCAT44(fVar25,fVar24);
    *(undefined4 *)(unaff_RBP + 0x20) = uVar27;
    uVar11 = *(int *)(param_1 + 0x904) + 1;
    *(uint *)(param_1 + 0x904) = uVar11;
    uVar22 = (ulong)(uVar11 & 0xffffff) | 0xf13000251c000000;
    *(undefined8 *)(unaff_RBP + 0x90) = 0;
    *(undefined8 *)(unaff_RBP + 0xa0) = 0;
    lVar16 = unaff_RBP + 0x90;
    uVar12 = uVar22;
    func_0x0001455002f0();
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar12 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar20 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar18 = 0xffffffffffffffff;
        do {
          uVar19 = uVar12;
          if (uVar20 == 0) goto LAB_1454e9e7e;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar18 * 2);
          bVar21 = (uVar3 < 2) - (2 < uVar3);
          uVar18 = uVar18 + 1;
          uVar20 = uVar20 - 2;
        } while (bVar21 == 1);
        uVar19 = (ulong)bVar21;
        uVar12 = uVar18;
        if (bVar21 == 0) {
          *(undefined4 *)(lVar13 + 8 + uVar18 * 4) = 9;
          goto LAB_1454e9edd;
        }
LAB_1454e9e7e:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454e9e98;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar12 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454e9e98:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar12;
    *(undefined8 *)(unaff_RBP + 0x100) = 2;
    uVar18 = 9;
    func_0x000145427a50();
LAB_1454e9edd:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar18 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar20 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          uVar19 = uVar18;
          if (uVar20 == 0) goto LAB_1454e9f3e;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          bVar21 = (uVar3 < 3) - (3 < uVar3);
          uVar12 = uVar12 + 1;
          uVar20 = uVar20 - 2;
        } while (bVar21 == 1);
        uVar19 = (ulong)bVar21;
        uVar18 = uVar12;
        if (bVar21 == 0) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = 0x251c;
          goto LAB_1454e9f9d;
        }
LAB_1454e9f3e:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454e9f58;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar18 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454e9f58:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar18;
    *(undefined8 *)(unaff_RBP + 0x100) = 3;
    uVar12 = 0x251c;
    func_0x000145427a50();
LAB_1454e9f9d:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar12 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar20 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar18 = 0xffffffffffffffff;
        do {
          uVar19 = uVar12;
          if (uVar20 == 0) goto LAB_1454e9ffe;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar18 * 2);
          bVar21 = (uVar3 < 4) - (4 < uVar3);
          uVar18 = uVar18 + 1;
          uVar20 = uVar20 - 2;
        } while (bVar21 == 1);
        uVar19 = (ulong)bVar21;
        uVar12 = uVar18;
        if (bVar21 == 0) {
          *(undefined4 *)(lVar13 + 8 + uVar18 * 4) = 0x3f800000;
          goto LAB_1454ea05d;
        }
LAB_1454e9ffe:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea018;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar12 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea018:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar12;
    *(undefined8 *)(unaff_RBP + 0x100) = 4;
    uVar18 = 0x3f800000;
    func_0x000145427a50();
LAB_1454ea05d:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar18 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar20 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          uVar19 = uVar18;
          if (uVar20 == 0) goto LAB_1454ea0be;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          bVar21 = (uVar3 < 0x16) - (0x16 < uVar3);
          uVar12 = uVar12 + 1;
          uVar20 = uVar20 - 2;
        } while (bVar21 == 1);
        uVar19 = (ulong)bVar21;
        uVar18 = uVar12;
        if (bVar21 == 0) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = 5;
          goto LAB_1454ea11d;
        }
LAB_1454ea0be:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea0d8;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar18 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea0d8:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar18;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x16;
    uVar12 = 5;
    func_0x000145427a50();
LAB_1454ea11d:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar12 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar20 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar18 = 0xffffffffffffffff;
        do {
          uVar19 = uVar12;
          if (uVar20 == 0) goto LAB_1454ea17e;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar18 * 2);
          bVar21 = (uVar3 < 0x1c) - (0x1c < uVar3);
          uVar18 = uVar18 + 1;
          uVar20 = uVar20 - 2;
        } while (bVar21 == 1);
        uVar19 = (ulong)bVar21;
        uVar12 = uVar18;
        if (bVar21 == 0) {
          *(undefined4 *)(lVar13 + 8 + uVar18 * 4) = 5;
          goto LAB_1454ea1dd;
        }
LAB_1454ea17e:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea198;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar12 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea198:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar12;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x1c;
    func_0x000145427a50();
LAB_1454ea1dd:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar19 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea23e;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          uVar12 = uVar12 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x22) - (0x22 < uVar3)) == '\x01');
        uVar19 = uVar12;
        if (uVar3 < 0x22 == 0x22 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = *(undefined4 *)(param_1 + 0x3f8);
          goto LAB_1454ea293;
        }
LAB_1454ea23e:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea254;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar19 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea254:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar19;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x22;
    func_0x000145427a50();
LAB_1454ea293:
    bVar21 = *(char *)(param_1 + 0x285) - 2;
    uVar33 = 1;
    if (bVar21 < 7) {
      uVar33 = *(undefined4 *)((ulong)bVar21 * 4 + 0x1469acab8);
    }
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar19 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea30e;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          uVar12 = uVar12 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x23) - (0x23 < uVar3)) == '\x01');
        uVar19 = uVar12;
        if (uVar3 < 0x23 == 0x23 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = uVar33;
          goto LAB_1454ea363;
        }
LAB_1454ea30e:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea324;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar19 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea324:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar19;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x23;
    func_0x000145427a50();
LAB_1454ea363:
    uVar19 = *(ulong *)(param_1 + 0x3d0);
    func_0x0001455002f0();
    lVar16 = unaff_RBP + 0x90;
    func_0x0001455002f0();
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar19 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea3ee;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          uVar12 = uVar12 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x2e) - (0x2e < uVar3)) == '\x01');
        uVar19 = uVar12;
        if (uVar3 < 0x2e == 0x2e < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = 2;
          goto LAB_1454ea44d;
        }
LAB_1454ea3ee:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea408;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar19 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea408:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar19;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x2e;
    uVar12 = 2;
    func_0x000145427a50();
LAB_1454ea44d:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar12 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar19 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea4b1;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar19 * 2);
          uVar19 = uVar19 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x81) - (0x81 < uVar3)) == '\x01');
        uVar12 = uVar19;
        if (uVar3 < 0x81 == 0x81 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar19 * 4) = 0x3ecccccd;
          goto LAB_1454ea510;
        }
LAB_1454ea4b1:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea4cb;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar12 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea4cb:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar12;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x81;
    uVar19 = 0x3ecccccd;
    func_0x000145427a50();
LAB_1454ea510:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar19 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea571;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          uVar12 = uVar12 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x82) - (0x82 < uVar3)) == '\x01');
        uVar19 = uVar12;
        if (uVar3 < 0x82 == 0x82 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = 0x3f800000;
          goto LAB_1454ea5d0;
        }
LAB_1454ea571:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea58b;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar19 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea58b:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar19;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x82;
    uVar12 = 0x3f800000;
    func_0x000145427a50();
LAB_1454ea5d0:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar12 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar19 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea631;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar19 * 2);
          uVar19 = uVar19 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x83) - (0x83 < uVar3)) == '\x01');
        uVar12 = uVar19;
        if (uVar3 < 0x83 == 0x83 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar19 * 4) = *(undefined4 *)(unaff_RBP + 0x118);
          goto LAB_1454ea693;
        }
LAB_1454ea631:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea64d;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar12 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea64d:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar12;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x83;
    uVar19 = (ulong)*(uint *)(unaff_RBP + 0x118);
    func_0x000145427a50();
LAB_1454ea693:
    lVar13 = *(long *)(unaff_RBP + 0x90);
    if (lVar13 != 0) {
      lVar15 = *(long *)(unaff_RBP + 0x98);
      do {
        uVar19 = (ulong)*(ushort *)(lVar13 + 0x36);
        uVar18 = (ulong)((uint)*(ushort *)(lVar13 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          if (uVar18 == 0) goto LAB_1454ea6f1;
          uVar3 = *(ushort *)(lVar13 + 0x3a + uVar12 * 2);
          uVar12 = uVar12 + 1;
          uVar18 = uVar18 - 2;
        } while ((char)((uVar3 < 0x84) - (0x84 < uVar3)) == '\x01');
        uVar19 = uVar12;
        if (uVar3 < 0x84 == 0x84 < uVar3) {
          *(undefined4 *)(lVar13 + 8 + uVar12 * 4) = *(undefined4 *)(unaff_RBP + 0x118);
          goto LAB_1454ea753;
        }
LAB_1454ea6f1:
        bVar23 = lVar15 == 0;
        lVar15 = lVar15 + -1;
        if (bVar23) goto LAB_1454ea70d;
        lVar13 = *(long *)(lVar13 + 0x50 + uVar19 * 8);
      } while( true );
    }
    lVar13 = 0;
LAB_1454ea70d:
    *(long *)(unaff_RBP + 0xe0) = lVar16;
    *(long *)(unaff_RBP + 0xe8) = lVar13;
    *(undefined8 *)(unaff_RBP + 0xf0) = 0;
    *(ulong *)(unaff_RBP + 0xf8) = uVar19;
    *(undefined8 *)(unaff_RBP + 0x100) = 0x84;
    func_0x000145427a50();
LAB_1454ea753:
    *(undefined4 *)(unaff_RBP + 0x68) = 0;
    *(undefined8 *)(unaff_RBP + 0x50) = 0;
    *(undefined8 *)(unaff_RBP + 0x58) = 1;
    *(undefined8 *)(unaff_RBP + 0x60) = 0;
    *(undefined1 *)(unaff_RBP + 0xb6) = 1;
    lStack0000000000000020 = unaff_RBP + 0x18;
    uStack0000000000000028 = uStack0000000000000028 & 0xffffffff00000000;
    func_0x0001454ff300();
    *(undefined4 *)(unaff_RBP + 0xf0) = *(undefined4 *)(unaff_RBP + 0x60);
    *(undefined4 *)(unaff_RBP + 0xf4) = *(undefined4 *)(unaff_RBP + 100);
    *(undefined4 *)(unaff_RBP + 0xf8) = *(undefined4 *)(unaff_RBP + 0x68);
    *(undefined4 *)(unaff_RBP + 0xfc) = *(undefined4 *)(unaff_RBP + 0x6c);
    *(undefined4 *)(unaff_RBP + 0xe0) = *(undefined4 *)(unaff_RBP + 0x50);
    *(undefined4 *)(unaff_RBP + 0xe4) = *(undefined4 *)(unaff_RBP + 0x54);
    *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_RBP + 0x58);
    *(undefined4 *)(unaff_RBP + 0xec) = *(undefined4 *)(unaff_RBP + 0x5c);
    *(undefined1 *)(unaff_RBP + 0xb6) = 0;
    func_0x0001454ffad0();
    lVar16 = *(long *)(param_1 + 0x548);
    if (lVar16 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    fVar28 = fVar28 / (float)(iVar4 + (uint)(iVar4 == 0));
    lVar13 = *(long *)(param_1 + 0x540);
    uVar33 = *(undefined4 *)(unaff_RBP + 0xb8);
    uVar31 = *(undefined4 *)(unaff_RBP + 0xbc);
    uVar32 = *(undefined4 *)(unaff_RBP + 0xc0);
    uVar5 = *(undefined4 *)(unaff_RBP + 0xc4);
    uVar17 = *(undefined4 *)(unaff_RBP + 0xcc);
    uVar7 = *(undefined4 *)(unaff_RBP + 0xd0);
    uVar8 = *(undefined4 *)(unaff_RBP + 0xd4);
    puVar2 = (undefined4 *)(lVar13 + 0x10 + lVar16 * 0x20);
    *puVar2 = *(undefined4 *)(unaff_RBP + 200);
    puVar2[1] = uVar17;
    puVar2[2] = uVar7;
    puVar2[3] = uVar8;
    puVar2 = (undefined4 *)(lVar13 + lVar16 * 0x20);
    *puVar2 = uVar33;
    puVar2[1] = uVar31;
    puVar2[2] = uVar32;
    puVar2[3] = uVar5;
    *(long *)(param_1 + 0x548) = lVar16 + 1;
    func_0x0001455127d0();
    fVar30 = *(float *)(param_1 + 0x8e4) + fVar30;
    fVar26 = *(float *)(param_1 + 0x8e4) + fRam0000000145a116e4;
    uVar5 = *(undefined4 *)(unaff_RBX + 8);
    uVar33 = *(undefined4 *)(unaff_RBX + 0xc);
    uVar31 = *(undefined4 *)(unaff_RBX + 0x14);
    uVar17 = *(undefined4 *)(unaff_RBX + 0x18);
    uVar32 = *(undefined4 *)(unaff_RBX + 0x1c);
    lVar16 = *(long *)(param_1 + 0x518);
    if (lVar16 == *(long *)(param_1 + 0x508)) {
      func_0x000145763f30();
    }
    lVar13 = *(long *)(param_1 + 0x510);
    lVar15 = lVar16 * 0x78;
    *(undefined8 *)(lVar13 + lVar15) = *(undefined8 *)(unaff_RBP + 0x88);
    *(undefined4 *)(lVar13 + 8 + lVar15) = uVar5;
    *(undefined4 *)(lVar13 + 0xc + lVar15) = uVar33;
    *(undefined4 *)(lVar13 + 0x10 + lVar15) = in_XMM9_Da;
    *(undefined4 *)(lVar13 + 0x14 + lVar15) = uVar31;
    *(undefined4 *)(lVar13 + 0x18 + lVar15) = uVar17;
    *(undefined4 *)(lVar13 + 0x1c + lVar15) = uVar32;
    *(float *)(lVar13 + 0x20 + lVar15) = fVar29;
    uVar14 = *(undefined8 *)(unaff_RBX + 0x2c);
    puVar1 = (undefined8 *)(lVar13 + 0x24 + lVar15);
    *puVar1 = *(undefined8 *)(unaff_RBX + 0x24);
    puVar1[1] = uVar14;
    *(undefined4 *)(lVar13 + 0x34 + lVar15) = *(undefined4 *)(unaff_RBX + 0x34);
    uVar14 = *(undefined8 *)(unaff_RBX + 0x40);
    uVar9 = *(undefined8 *)(unaff_RBX + 0x44);
    uVar10 = *(undefined8 *)(unaff_RBX + 0x4c);
    puVar1 = (undefined8 *)(lVar13 + 0x38 + lVar15);
    *puVar1 = *(undefined8 *)(unaff_RBX + 0x38);
    puVar1[1] = uVar14;
    puVar1 = (undefined8 *)(lVar13 + 0x44 + lVar15);
    *puVar1 = uVar9;
    puVar1[1] = uVar10;
    *(ulong *)(lVar13 + 0x58 + lVar15) = uVar22;
    *(ulong *)(lVar13 + 0x60 + lVar15) = CONCAT44(fVar25,fVar24);
    *(undefined4 *)(lVar13 + 0x68 + lVar15) = uVar27;
    *(ulong *)(lVar13 + 0x6c + lVar15) = CONCAT44(fVar26,fVar30);
    *(float *)(lVar13 + 0x74 + lVar15) = fVar28;
    *(long *)(param_1 + 0x518) = lVar16 + 1;
    uVar14 = CONCAT71((int7)((ulong)lVar13 >> 8),1);
  }
  return uVar14;
}

