
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,uint *param_3,long param_4,undefined4 *param_5,
           undefined4 param_6)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  ushort uVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  long lVar11;
  byte bVar12;
  ulong uVar13;
  bool bVar14;
  undefined4 uVar15;
  uint uVar16;
  uint uVar17;
  undefined8 in_XMM6_Qa;
  float fVar18;
  undefined8 in_XMM7_Qa;
  undefined4 in_stack_00000028;
  uint uStack_ec;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  long local_c0;
  long local_b8;
  undefined8 local_b0;
  long *local_a8;
  long lStack_a0;
  undefined8 local_98;
  ulong uStack_90;
  undefined8 local_88;
  undefined1 local_71;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 local_58;
  undefined1 auVar19 [16];
  
  local_70 = 0xfffffffffffffffe;
  uVar16 = *param_3;
  uVar4 = param_3[1];
  uVar17 = param_3[2];
  uVar5 = *(int *)(param_4 + 0x904) + 1;
  *(uint *)(param_4 + 0x904) = uVar5;
  uVar9 = *(ulong *)(param_4 + 0x880);
  uVar6 = *(ulong *)(param_4 + 0x888);
  uVar10 = *(ulong *)(param_4 + 0x898);
  uVar8 = *(ulong *)(param_4 + 0x890);
  do {
    lVar11 = ((uVar9 + uVar10) * 0x800000 | uVar9 + uVar10 >> 0x29) + uVar9;
    uVar13 = uVar6 << 0x11;
    uVar8 = uVar8 ^ uVar9;
    uVar10 = uVar10 ^ uVar6;
    uVar6 = uVar6 ^ uVar8;
    uVar9 = uVar9 ^ uVar10;
    uVar10 = uVar10 << 0x2d | uVar10 >> 0x13;
    uVar8 = uVar8 ^ uVar13;
    fVar18 = ((float)((uint)((ulong)lVar11 >> 0x29) | 0x3f800000) + _DAT_1458eb4fc) * _DAT_1458ed014
    ;
    auVar19 = ZEXT416((uint)fVar18);
  } while (_DAT_1458ed014 <= fVar18);
  uVar13 = (ulong)(uVar5 & 0xffffff) | (ulong)(uVar16 & 0xffffff) << 0x18 | 0xf110000000000000;
  *(ulong *)(param_4 + 0x880) = uVar9;
  *(ulong *)(param_4 + 0x898) = uVar10;
  *(ulong *)(param_4 + 0x888) = uVar6;
  *(ulong *)(param_4 + 0x890) = uVar8;
  local_c0 = 0;
  local_b0 = 0;
  uVar9 = uVar13;
  local_68 = in_XMM6_Qa;
  local_58 = in_XMM7_Qa;
  func_0x0001455002f0(param_5,param_4,0,&local_c0);
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454d29e3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 2) - (2 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x21;
        goto LAB_1454d2a2d;
      }
LAB_1454d29e3:
      if (lVar7 == 0) goto LAB_1454d29fd;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d29fd:
  local_98 = 0;
  local_88 = 2;
  uVar6 = 0x21;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
  uVar9 = uVar6;
LAB_1454d2a2d:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454d2a83;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 3) - (3 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar16;
        goto LAB_1454d2ac6;
      }
LAB_1454d2a83:
      if (lVar7 == 0) goto LAB_1454d2a99;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2a99:
  local_98 = 0;
  local_88 = 3;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
LAB_1454d2ac6:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d2b23;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 4) - (4 < uVar3)) == '\x01');
      if (uVar3 < 4 == 4 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar17;
        uVar9 = 0;
        goto LAB_1454d2b6a;
      }
LAB_1454d2b23:
      if (lVar7 == 0) goto LAB_1454d2b3b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2b3b:
  uVar9 = (ulong)uVar17;
  local_98 = 0;
  local_88 = 4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d2b6a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454d2bc3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 8) - (8 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar4;
        goto LAB_1454d2c06;
      }
LAB_1454d2bc3:
      if (lVar7 == 0) goto LAB_1454d2bd9;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2bd9:
  local_98 = 0;
  local_88 = 8;
  uVar6 = (ulong)uVar4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
  uVar9 = uVar6;
LAB_1454d2c06:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454d2c63;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 9) - (9 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = in_stack_00000028;
        goto LAB_1454d2ca6;
      }
LAB_1454d2c63:
      if (lVar7 == 0) goto LAB_1454d2c79;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2c79:
  local_98 = 0;
  local_88 = 9;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
LAB_1454d2ca6:
  auVar19._0_4_ = auVar19._0_4_ + 0.0;
  uVar15 = func_0x000145756e2b();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d2d23;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xc) - (0xc < uVar3)) == '\x01');
      if (uVar3 < 0xc == 0xc < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = uVar15;
        goto LAB_1454d2d6a;
      }
LAB_1454d2d23:
      if (lVar7 == 0) goto LAB_1454d2d3b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2d3b:
  local_98 = 0;
  local_88 = 0xc;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d2d6a:
  uVar16 = func_0x000145756e31();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d2dd3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xd) - (0xd < uVar3)) == '\x01');
      if (uVar3 < 0xd == 0xd < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_1454d2e1a;
      }
LAB_1454d2dd3:
      if (lVar7 == 0) goto LAB_1454d2deb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2deb:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0xd;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d2e1a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454d2e73;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 0xe) - (0xe < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 1;
        goto LAB_1454d2ebd;
      }
LAB_1454d2e73:
      if (lVar7 == 0) goto LAB_1454d2e8d;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2e8d:
  local_98 = 0;
  local_88 = 0xe;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
LAB_1454d2ebd:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d2f23;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xf) - (0xf < uVar3)) == '\x01');
      if (uVar3 < 0xf == 0xf < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = *param_5;
        goto LAB_1454d2f6a;
      }
LAB_1454d2f23:
      if (lVar7 == 0) goto LAB_1454d2f3b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2f3b:
  local_98 = 0;
  local_88 = 0xf;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d2f6a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d2fd3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x10) - (0x10 < uVar3)) == '\x01');
      if (uVar3 < 0x10 == 0x10 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[1];
        goto LAB_1454d301a;
      }
LAB_1454d2fd3:
      if (lVar7 == 0) goto LAB_1454d2feb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d2feb:
  local_98 = 0;
  local_88 = 0x10;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d301a:
  uVar16 = auVar19._0_4_;
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d3083;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x11) - (0x11 < uVar3)) == '\x01');
      if (uVar3 < 0x11 == 0x11 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[2];
        goto LAB_1454d30ca;
      }
LAB_1454d3083:
      if (lVar7 == 0) goto LAB_1454d309b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d309b:
  local_98 = 0;
  local_88 = 0x11;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
  uVar16 = auVar19._0_4_;
LAB_1454d30ca:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454d3123;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x12) - (0x12 < uVar3)) == '\x01');
      if (uVar3 < 0x12 == 0x12 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_1454d316a;
      }
LAB_1454d3123:
      if (lVar7 == 0) goto LAB_1454d313b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d313b:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0x12;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x000145427a50();
LAB_1454d316a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar10 == 0) goto LAB_1454d31c3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        uVar9 = uVar6 + 1;
        uVar10 = uVar10 - 2;
        uVar6 = uVar9;
      } while ((char)((uVar3 < 0x14) - (0x14 < uVar3)) == '\x01');
      if (uVar3 < 0x14 == 0x14 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x23;
        goto LAB_1454d320d;
      }
LAB_1454d31c3:
      if (lVar7 == 0) goto LAB_1454d31dd;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454d31dd:
  local_98 = 0;
  local_88 = 0x14;
  uVar6 = 0x23;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x000145427a50();
  uVar9 = uVar6;
LAB_1454d320d:
  lVar11 = local_c0;
  if (local_c0 == 0) {
    lVar11 = 0;
LAB_1454d327c:
    local_98 = 0;
    local_88 = 0x15;
    local_a8 = &local_c0;
    lStack_a0 = lVar11;
    uStack_90 = uVar9;
    func_0x000145427a50();
LAB_1454d32aa:
    local_71 = 1;
    func_0x0001454ff870();
    local_98 = 0;
    uStack_90 = (ulong)uStack_ec << 0x20;
    local_a8 = (long *)0x0;
    lStack_a0 = 1;
    local_71 = 0;
    func_0x0001454ffad0();
    lVar11 = *(long *)(param_4 + 0x548);
    if (lVar11 == *(long *)(param_4 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar7 = *(long *)(param_4 + 0x540);
    puVar2 = (undefined4 *)(lVar7 + 0x10 + lVar11 * 0x20);
    *puVar2 = local_d8;
    puVar2[1] = uStack_d4;
    puVar2[2] = uStack_d0;
    puVar2[3] = uStack_cc;
    puVar1 = (undefined8 *)(lVar7 + lVar11 * 0x20);
    *puVar1 = local_e8;
    puVar1[1] = uStack_e0;
    *(long *)(param_4 + 0x548) = lVar11 + 1;
    func_0x0001455127d0();
    return uVar13;
  }
  do {
    uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
    uVar6 = 0xffffffffffffffff;
    do {
      uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
      if (uVar10 == 0) goto LAB_1454d3263;
      uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
      uVar9 = uVar6 + 1;
      uVar10 = uVar10 - 2;
      uVar6 = uVar9;
    } while ((char)((uVar3 < 0x15) - (0x15 < uVar3)) == '\x01');
    if (uVar3 < 0x15 == 0x15 < uVar3) {
      *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = param_6;
      goto LAB_1454d32aa;
    }
LAB_1454d3263:
    bVar14 = local_b8 == 0;
    local_b8 = local_b8 + -1;
    if (bVar14) goto LAB_1454d327c;
    lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
  } while( true );
}

