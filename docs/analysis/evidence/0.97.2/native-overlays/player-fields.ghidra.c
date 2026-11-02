
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,undefined8 param_5,
          ulong param_6)

{
  undefined4 *puVar1;
  int *piVar2;
  char cVar3;
  int iVar4;
  byte bVar5;
  ushort uVar6;
  ushort uVar7;
  undefined4 uVar8;
  int iVar9;
  uint uVar10;
  long lVar11;
  long lVar12;
  ulong extraout_RDX;
  ulong extraout_RDX_00;
  ulong extraout_RDX_01;
  byte bVar13;
  long lVar14;
  undefined4 uVar15;
  uint uVar16;
  uint uVar17;
  int iVar18;
  ulong uVar19;
  ulong uVar20;
  ulong uVar21;
  ulong uVar22;
  byte bVar23;
  short sVar24;
  bool bVar25;
  float fVar26;
  long *local_b0;
  long local_a8;
  undefined8 local_a0;
  ulong local_98;
  ulong local_90;
  long local_60;
  long lStack_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  bVar5 = *(char *)(param_3 + 0x284) - 2;
  if (bVar5 < 10) {
    lVar14 = *(long *)((ulong)bVar5 * 8 + 0x1469aca28);
  }
  else {
    lVar14 = 0x146718768;
  }
  local_60 = 0;
  local_50 = 0;
  uVar19 = *(ulong *)(param_3 + 0x3d0);
  func_0x0001455002f0(param_3,param_2,0,&local_60);
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491213;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 2) - (2 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 0x19;
        goto LAB_14549125d;
      }
LAB_145491213:
      if (lVar11 == 0) goto LAB_14549122d;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_14549122d:
  local_a0 = 0;
  local_90 = 2;
  uVar20 = 0x19;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549125d:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_1454912b3;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 4) - (4 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 0x3f800000;
        goto LAB_1454912fd;
      }
LAB_1454912b3:
      if (lVar11 == 0) goto LAB_1454912cd;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_1454912cd:
  local_a0 = 0;
  local_90 = 4;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
LAB_1454912fd:
  fVar26 = (float)func_0x000145756e6d(*(undefined4 *)(param_3 + 0x400));
  uVar8 = (int)(long)fVar26;
  if (fVar26 < 0.0) {
    uVar8 = 0;
  }
  uVar15 = 0xffffffff;
  if (fVar26 <= _DAT_1458eb51c) {
    uVar15 = uVar8;
  }
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
        if (uVar20 == 0) goto LAB_145491383;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x16) - (0x16 < uVar7)) == '\x01');
      if (uVar7 < 0x16 == 0x16 < uVar7) {
        *(undefined4 *)(lVar12 + 8 + param_6 * 4) = uVar15;
        goto LAB_1454913c3;
      }
LAB_145491383:
      if (lVar11 == 0) goto LAB_145491399;
      lVar12 = *(long *)(lVar12 + 0x50 + param_6 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_145491399:
  local_a0 = 0;
  local_90 = 0x16;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = param_6;
  func_0x000145427a50();
LAB_1454913c3:
  fVar26 = (float)func_0x000145756e6d(*(undefined4 *)(param_3 + 0x458));
  uVar17 = (uint)(long)fVar26;
  if (fVar26 < 0.0) {
    uVar17 = 0;
  }
  uVar19 = 0xffffffff;
  if (fVar26 <= _DAT_1458eb51c) {
    uVar19 = (ulong)uVar17;
  }
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
        if (uVar21 == 0) goto LAB_145491453;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        param_6 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = param_6;
      } while ((char)((uVar7 < 0x1c) - (0x1c < uVar7)) == '\x01');
      if (uVar7 < 0x1c == 0x1c < uVar7) {
        *(int *)(lVar12 + 8 + param_6 * 4) = (int)uVar19;
        goto LAB_145491493;
      }
LAB_145491453:
      if (lVar11 == 0) goto LAB_145491469;
      lVar12 = *(long *)(lVar12 + 0x50 + param_6 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_145491469:
  local_a0 = 0;
  local_90 = 0x1c;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145491493:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_1454914f3;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x17) - (0x17 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 100;
        goto LAB_14549153d;
      }
LAB_1454914f3:
      if (lVar11 == 0) goto LAB_14549150d;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_14549150d:
  local_a0 = 0;
  local_90 = 0x17;
  uVar20 = 100;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549153d:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491593;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x18) - (0x18 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 0;
        goto LAB_1454915da;
      }
LAB_145491593:
      if (lVar11 == 0) goto LAB_1454915ad;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_1454915ad:
  local_a0 = 0;
  local_90 = 0x18;
  uVar20 = 0;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_1454915da:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491633;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x1a) - (0x1a < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 100;
        goto LAB_14549167d;
      }
LAB_145491633:
      if (lVar11 == 0) goto LAB_14549164d;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_14549164d:
  local_a0 = 0;
  local_90 = 0x1a;
  uVar20 = 100;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549167d:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_1454916d3;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x1d) - (0x1d < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 100;
        goto LAB_14549171d;
      }
LAB_1454916d3:
      if (lVar11 == 0) goto LAB_1454916ed;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_1454916ed:
  local_a0 = 0;
  local_90 = 0x1d;
  uVar20 = 100;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549171d:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491773;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x1e) - (0x1e < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 1000;
        goto LAB_1454917bd;
      }
LAB_145491773:
      if (lVar11 == 0) goto LAB_14549178d;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_14549178d:
  local_a0 = 0;
  local_90 = 0x1e;
  uVar20 = 1000;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_1454917bd:
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491813;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x20) - (0x20 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar12 + 8 + uVar19 * 4) = 100;
        goto LAB_14549185d;
      }
LAB_145491813:
      if (lVar11 == 0) goto LAB_14549182d;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_14549182d:
  local_a0 = 0;
  local_90 = 0x20;
  uVar20 = 100;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549185d:
  iVar4 = *(int *)(param_3 + 0x3f8);
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_1454918c3;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x22) - (0x22 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(int *)(lVar12 + 8 + uVar19 * 4) = iVar4;
        goto LAB_145491906;
      }
LAB_1454918c3:
      if (lVar11 == 0) goto LAB_1454918d9;
      lVar12 = *(long *)(lVar12 + 0x50 + uVar19 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_1454918d9:
  local_a0 = 0;
  local_90 = 0x22;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = uVar19;
  func_0x000145427a50();
LAB_145491906:
  cVar3 = *(char *)(param_3 + 0x285);
  bVar5 = cVar3 - 2;
  uVar8 = 1;
  if (bVar5 < 7) {
    uVar8 = *(undefined4 *)((ulong)bVar5 * 4 + 0x1469acab8);
  }
  lVar12 = local_60;
  lVar11 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar12 + 0x36);
        if (uVar20 == 0) goto LAB_145491983;
        uVar7 = *(ushort *)(lVar12 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x23) - (0x23 < uVar7)) == '\x01');
      if (uVar7 < 0x23 == 0x23 < uVar7) {
        *(undefined4 *)(lVar12 + 8 + param_6 * 4) = uVar8;
        goto LAB_1454919c3;
      }
LAB_145491983:
      if (lVar11 == 0) goto LAB_145491999;
      lVar12 = *(long *)(lVar12 + 0x50 + param_6 * 8);
      lVar11 = lVar11 + -1;
    } while( true );
  }
  lVar12 = 0;
LAB_145491999:
  local_a0 = 0;
  local_90 = 0x23;
  local_b0 = &local_60;
  local_a8 = lVar12;
  local_98 = param_6;
  func_0x000145427a50();
LAB_1454919c3:
  bVar13 = *(byte *)(param_3 + 0x286);
  uVar17 = (uint)bVar13;
  uVar16 = CONCAT13(*(undefined1 *)(lVar14 + 0x8d),
                    CONCAT12(bVar13,CONCAT11(*(undefined1 *)(lVar14 + 0x8c),cVar3)));
  uVar19 = (ulong)uVar16;
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar21 == 0) goto LAB_145491a53;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        param_6 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = param_6;
      } while ((char)((uVar7 < 0x24) - (0x24 < uVar7)) == '\x01');
      if (uVar7 < 0x24 == 0x24 < uVar7) {
        *(uint *)(lVar14 + 8 + param_6 * 4) = uVar16;
        goto LAB_145491a93;
      }
LAB_145491a53:
      if (lVar12 == 0) goto LAB_145491a69;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491a69:
  local_a0 = 0;
  local_90 = 0x24;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145491a93:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491af3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar23 = (uVar7 < 0x2e) - (0x2e < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar23 == 1);
      param_6 = (ulong)bVar23;
      if (bVar23 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 8;
        goto LAB_145491b3d;
      }
LAB_145491af3:
      if (lVar12 == 0) goto LAB_145491b0d;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491b0d:
  local_a0 = 0;
  local_90 = 0x2e;
  uVar20 = 8;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_145491b3d:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491b93;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar23 = (uVar7 < 0x7e) - (0x7e < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar23 == 1);
      param_6 = (ulong)bVar23;
      if (bVar23 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 2000;
        goto LAB_145491bdd;
      }
LAB_145491b93:
      if (lVar12 == 0) goto LAB_145491bad;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491bad:
  local_a0 = 0;
  local_90 = 0x7e;
  uVar20 = 2000;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_145491bdd:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491c33;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar23 = (uVar7 < 0x7f) - (0x7f < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar23 == 1);
      param_6 = (ulong)bVar23;
      if (bVar23 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 2000;
        goto LAB_145491c7d;
      }
LAB_145491c33:
      if (lVar12 == 0) goto LAB_145491c4d;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491c4d:
  local_a0 = 0;
  local_90 = 0x7f;
  uVar20 = 2000;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_145491c7d:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491ce3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar23 = (uVar7 < 0x81) - (0x81 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar23 == 1);
      param_6 = (ulong)bVar23;
      if (bVar23 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x3ec72b02;
        goto LAB_145491d2d;
      }
LAB_145491ce3:
      if (lVar12 == 0) goto LAB_145491cfd;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491cfd:
  local_a0 = 0;
  local_90 = 0x81;
  uVar20 = 0x3ec72b02;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_145491d2d:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145491d93;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar23 = (uVar7 < 0x82) - (0x82 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar23 == 1);
      param_6 = (ulong)bVar23;
      if (bVar23 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x3fc00000;
        goto LAB_145491ddd;
      }
LAB_145491d93:
      if (lVar12 == 0) goto LAB_145491dad;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491dad:
  local_a0 = 0;
  local_90 = 0x82;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
LAB_145491ddd:
  if (*(long *)(param_3 + 0x700) != 0) {
    lVar14 = 0;
    do {
      if (*(char *)(*(long *)(param_3 + 0x6f8) + lVar14) == '\x19') {
        iVar18 = *(int *)(*(long *)(param_3 + 0x6f8) + 4 + lVar14);
        if (iVar18 == 0x25a2) {
          iVar18 = (uint)(cVar3 == '\x06') * 8 + 0x8e9;
          goto LAB_145491e86;
        }
        if (iVar18 == 0x300) {
          iVar18 = 0x37c;
          if (cVar3 == '\x06') {
            iVar18 = 0x217b;
          }
          goto LAB_145491e86;
        }
      }
      lVar14 = lVar14 + 0x40;
    } while (*(long *)(param_3 + 0x700) << 6 != lVar14);
  }
  if (bVar5 < 7) {
    iVar18 = *(int *)((ulong)bVar5 * 4 + 0x1469ac954);
    iVar9 = *(int *)((ulong)bVar5 * 4 + 0x1469ac970);
  }
  else {
    iVar9 = 0x31;
    iVar18 = 0x32;
  }
  if (bVar13 == 0) {
    iVar18 = iVar9;
  }
LAB_145491e86:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar20 == 0) goto LAB_145491ee3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x83) - (0x83 < uVar7)) == '\x01');
      if (uVar7 < 0x83 == 0x83 < uVar7) {
        *(int *)(lVar14 + 8 + param_6 * 4) = iVar18;
        goto LAB_145491f23;
      }
LAB_145491ee3:
      if (lVar12 == 0) goto LAB_145491ef9;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491ef9:
  local_a0 = 0;
  local_90 = 0x83;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145491f23:
  if (bVar5 < 7) {
    uVar16 = *(uint *)((ulong)bVar5 * 4 + 0x1469ac954);
    uVar10 = *(uint *)((ulong)bVar5 * 4 + 0x1469ac970);
  }
  else {
    uVar10 = 0x31;
    uVar16 = 0x32;
  }
  if (bVar13 == 0) {
    uVar16 = uVar10;
  }
  uVar19 = (ulong)uVar16;
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar21 == 0) goto LAB_145491fb3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        param_6 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = param_6;
      } while ((char)((uVar7 < 0x84) - (0x84 < uVar7)) == '\x01');
      if (uVar7 < 0x84 == 0x84 < uVar7) {
        *(uint *)(lVar14 + 8 + param_6 * 4) = uVar16;
        goto LAB_145491ff3;
      }
LAB_145491fb3:
      if (lVar12 == 0) goto LAB_145491fc9;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145491fc9:
  local_a0 = 0;
  local_90 = 0x84;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145491ff3:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145492053;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x86) - (0x86 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x41200000;
        goto LAB_14549209d;
      }
LAB_145492053:
      if (lVar12 == 0) goto LAB_14549206d;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_14549206d:
  local_a0 = 0;
  local_90 = 0x86;
  uVar20 = 0x41200000;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549209d:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145492103;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x87) - (0x87 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x41a00000;
        goto LAB_14549214d;
      }
LAB_145492103:
      if (lVar12 == 0) goto LAB_14549211d;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_14549211d:
  local_a0 = 0;
  local_90 = 0x87;
  uVar20 = 0x41a00000;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_14549214d:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_1454921b3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0x91) - (0x91 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x3f800000;
        goto LAB_1454921fd;
      }
LAB_1454921b3:
      if (lVar12 == 0) goto LAB_1454921cd;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_1454921cd:
  local_a0 = 0;
  local_90 = 0x91;
  uVar20 = 0x3f800000;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
  uVar19 = uVar20;
LAB_1454921fd:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145492263;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0xa4) - (0xa4 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0x2800;
        goto LAB_1454922ad;
      }
LAB_145492263:
      if (lVar12 == 0) goto LAB_14549227d;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_14549227d:
  local_a0 = 0;
  local_90 = 0xa4;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
LAB_1454922ad:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar20 == 0) goto LAB_145492313;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0xc1) - (0xc1 < uVar7)) == '\x01');
      if (uVar7 < 0xc1 == 0xc1 < uVar7) {
        *(undefined4 *)(lVar14 + 8 + param_6 * 4) = *(undefined4 *)(param_3 + 0x287);
        goto LAB_145492353;
      }
LAB_145492313:
      if (lVar12 == 0) goto LAB_145492329;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145492329:
  local_a0 = 0;
  local_90 = 0xc1;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145492353:
  uVar16 = *(byte *)(param_3 + 0x28b) | 0x2000000;
  uVar19 = (ulong)uVar16;
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar21 == 0) goto LAB_1454923c3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        param_6 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = param_6;
      } while ((char)((uVar7 < 0xc2) - (0xc2 < uVar7)) == '\x01');
      if (uVar7 < 0xc2 == 0xc2 < uVar7) {
        *(uint *)(lVar14 + 8 + param_6 * 4) = uVar16;
        goto LAB_145492403;
      }
LAB_1454923c3:
      if (lVar12 == 0) goto LAB_1454923d9;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_1454923d9:
  local_a0 = 0;
  local_90 = 0xc2;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145492403:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        uVar19 = param_6;
        if (uVar21 == 0) goto LAB_145492463;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        bVar5 = (uVar7 < 0xc3) - (0xc3 < uVar7);
        uVar19 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = uVar19;
      } while (bVar5 == 1);
      param_6 = (ulong)bVar5;
      if (bVar5 == 0) {
        *(uint *)(lVar14 + 8 + uVar19 * 4) = uVar17;
        goto LAB_1454924aa;
      }
LAB_145492463:
      if (lVar12 == 0) goto LAB_14549247c;
      lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_14549247c:
  local_a0 = 0;
  local_90 = 0xc3;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = uVar19;
  func_0x000145427a50();
LAB_1454924aa:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar20 == 0) goto LAB_145492513;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x2cc) - (0x2cc < uVar7)) == '\x01');
      if (uVar7 < 0x2cc == 0x2cc < uVar7) {
        *(undefined4 *)(lVar14 + 8 + param_6 * 4) = *(undefined4 *)(param_3 + 0x3fc);
        goto LAB_145492553;
      }
LAB_145492513:
      if (lVar12 == 0) goto LAB_145492529;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145492529:
  local_a0 = 0;
  local_90 = 0x2cc;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145492553:
  fVar26 = (float)(iVar4 + -1 + (uint)(iVar4 == 0));
  fVar26 = (float)func_0x000145756e1f(_DAT_1458eb508 * fVar26 * fVar26 +
                                      _DAT_1458eb4f8 * fVar26 + _DAT_1458f8de4);
  uVar8 = (int)(long)fVar26;
  if (fVar26 < 0.0) {
    uVar8 = 0;
  }
  uVar15 = 0xffffffff;
  if (fVar26 <= _DAT_1458eb51c) {
    uVar15 = uVar8;
  }
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar20 == 0) goto LAB_145492613;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x2cd) - (0x2cd < uVar7)) == '\x01');
      if (uVar7 < 0x2cd == 0x2cd < uVar7) {
        *(undefined4 *)(lVar14 + 8 + param_6 * 4) = uVar15;
        goto LAB_145492653;
      }
LAB_145492613:
      if (lVar12 == 0) goto LAB_145492629;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145492629:
  local_a0 = 0;
  local_90 = 0x2cd;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_145492653:
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar20 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar19 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar20 == 0) goto LAB_1454926c3;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar19 * 2);
        param_6 = uVar19 + 1;
        uVar20 = uVar20 - 2;
        uVar19 = param_6;
      } while ((char)((uVar7 < 0x455) - (0x455 < uVar7)) == '\x01');
      if (uVar7 < 0x455 == 0x455 < uVar7) {
        *(float *)(lVar14 + 8 + param_6 * 4) = *(float *)(param_3 + 0x464) * _DAT_1458eb52c;
        goto LAB_14549270a;
      }
LAB_1454926c3:
      if (lVar12 == 0) goto LAB_1454926db;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_1454926db:
  local_a0 = 0;
  local_90 = 0x455;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_14549270a:
  uVar17 = *(int *)(param_3 + 0x408) * 10000;
  uVar19 = (ulong)uVar17;
  lVar14 = local_60;
  lVar12 = lStack_58;
  if (local_60 != 0) {
    do {
      uVar21 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
      uVar20 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar14 + 0x36);
        if (uVar21 == 0) goto LAB_145492773;
        uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
        param_6 = uVar20 + 1;
        uVar21 = uVar21 - 2;
        uVar20 = param_6;
      } while ((char)((uVar7 < 0x498) - (0x498 < uVar7)) == '\x01');
      if (uVar7 < 0x498 == 0x498 < uVar7) {
        *(uint *)(lVar14 + 8 + param_6 * 4) = uVar17;
        goto LAB_1454927b3;
      }
LAB_145492773:
      if (lVar12 == 0) goto LAB_145492789;
      lVar14 = *(long *)(lVar14 + 0x50 + param_6 * 8);
      lVar12 = lVar12 + -1;
    } while( true );
  }
  lVar14 = 0;
LAB_145492789:
  local_a0 = 0;
  local_90 = 0x498;
  local_b0 = &local_60;
  local_a8 = lVar14;
  local_98 = param_6;
  func_0x000145427a50();
LAB_1454927b3:
  if (local_60 == 0) {
    lVar14 = 0;
LAB_14549282d:
    local_a0 = 0;
    local_90 = 0x4ed;
    local_b0 = &local_60;
    local_a8 = lVar14;
    local_98 = uVar19;
    func_0x000145427a50();
    uVar20 = extraout_RDX;
LAB_14549285d:
    uVar19 = 0;
LAB_145492878:
    do {
      if (4 < uVar19) {
        lVar14 = 0x40c;
        sVar24 = 0;
LAB_145492945:
        do {
          if (lVar14 == 0x458) {
            func_0x0001454b7280();
            lVar14 = 0;
            while (lVar14 != 0x4c) {
              lVar12 = lVar14 + 4;
              piVar2 = (int *)((long)&local_b0 + lVar14);
              lVar14 = lVar12;
              if (*piVar2 != 0) {
                func_0x0001455002f0();
              }
            }
            lVar12 = *(long *)(param_3 + 0x2c8);
            lVar14 = lVar12 + *(long *)(param_3 + 0x2d0) * 0x48;
            for (; lVar12 != lVar14; lVar12 = lVar12 + 0x48) {
              func_0x0001455002f0();
            }
            param_4[2] = local_50;
            *param_4 = local_60;
            param_4[1] = lStack_58;
            return;
          }
          puVar1 = (undefined4 *)(param_3 + lVar14);
          lVar14 = lVar14 + 4;
          uVar7 = sVar24 * 0xc + 0x104;
          lVar12 = local_60;
          lVar11 = lStack_58;
          if (local_60 != 0) {
            do {
              uVar19 = (ulong)((uint)*(ushort *)(lVar12 + 0x36) * 2);
              uVar20 = 0xffffffffffffffff;
              do {
                uVar21 = (ulong)*(ushort *)(lVar12 + 0x36);
                if (uVar19 == 0) goto joined_r0x0001454929c7;
                uVar6 = *(ushort *)(lVar12 + 0x3a + uVar20 * 2);
                uVar20 = uVar20 + 1;
                uVar19 = uVar19 - 2;
              } while ((char)((uVar6 < uVar7) - (uVar7 < uVar6)) == '\x01');
              uVar21 = uVar20;
              if (uVar6 < uVar7 == uVar7 < uVar6) {
                *(undefined4 *)(lVar12 + 8 + uVar20 * 4) = *puVar1;
                sVar24 = sVar24 + 1;
                goto LAB_145492945;
              }
joined_r0x0001454929c7:
              uVar20 = uVar21;
              if (lVar11 == 0) goto LAB_1454929d2;
              lVar12 = *(long *)(lVar12 + 0x50 + uVar20 * 8);
              lVar11 = lVar11 + -1;
            } while( true );
          }
          lVar12 = 0;
LAB_1454929d2:
          local_90 = (ulong)uVar7;
          local_a0 = 0;
          local_b0 = &local_60;
          local_a8 = lVar12;
          local_98 = uVar20;
          func_0x000145427a50();
          uVar20 = extraout_RDX_01;
          sVar24 = sVar24 + 1;
        } while( true );
      }
      uVar21 = uVar19 + 1;
      uVar17 = (int)uVar19 + 0x96;
      lVar14 = local_60;
      lVar12 = lStack_58;
      if (local_60 != 0) {
        do {
          uVar19 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
          uVar20 = 0xffffffffffffffff;
          do {
            uVar22 = (ulong)*(ushort *)(lVar14 + 0x36);
            if (uVar19 == 0) goto joined_r0x0001454928e7;
            uVar7 = *(ushort *)(lVar14 + 0x3a + uVar20 * 2);
            uVar6 = (ushort)uVar17;
            uVar20 = uVar20 + 1;
            uVar19 = uVar19 - 2;
          } while ((char)((uVar7 < uVar6) - (uVar6 < uVar7)) == '\x01');
          uVar22 = uVar20;
          if (uVar7 < uVar6 == uVar6 < uVar7) {
            *(undefined4 *)(lVar14 + 8 + uVar20 * 4) = 0x32;
            uVar19 = uVar21;
            goto LAB_145492878;
          }
joined_r0x0001454928e7:
          uVar20 = uVar22;
          if (lVar12 == 0) goto LAB_1454928f2;
          lVar14 = *(long *)(lVar14 + 0x50 + uVar20 * 8);
          lVar12 = lVar12 + -1;
        } while( true );
      }
      lVar14 = 0;
LAB_1454928f2:
      local_90 = (ulong)(uVar17 & 0xffff);
      local_a0 = 0;
      local_b0 = &local_60;
      local_a8 = lVar14;
      local_98 = uVar20;
      func_0x000145427a50();
      uVar20 = extraout_RDX_00;
      uVar19 = uVar21;
    } while( true );
  }
  uVar20 = 0x4ed;
  lVar14 = local_60;
  lVar12 = lStack_58;
  do {
    uVar22 = (ulong)((uint)*(ushort *)(lVar14 + 0x36) * 2);
    uVar21 = 0xffffffffffffffff;
    do {
      uVar19 = (ulong)*(ushort *)(lVar14 + 0x36);
      if (uVar22 == 0) goto LAB_145492813;
      uVar7 = *(ushort *)(lVar14 + 0x3a + uVar21 * 2);
      uVar19 = uVar21 + 1;
      uVar22 = uVar22 - 2;
      uVar21 = uVar19;
    } while ((char)((uVar7 < 0x4ed) - (0x4ed < uVar7)) == '\x01');
    if (uVar7 < 0x4ed == 0x4ed < uVar7) {
      *(undefined4 *)(lVar14 + 8 + uVar19 * 4) = 0xffffffff;
      goto LAB_14549285d;
    }
LAB_145492813:
    bVar25 = lVar12 == 0;
    lVar12 = lVar12 + -1;
    if (bVar25) goto LAB_14549282d;
    lVar14 = *(long *)(lVar14 + 0x50 + uVar19 * 8);
  } while( true );
}
