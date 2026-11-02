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
  uVar5 = *(int *)(param_4 + 0xa78) + 1;
  *(uint *)(param_4 + 0xa78) = uVar5;
  uVar9 = *(ulong *)(param_4 + 0x9b8);
  uVar6 = *(ulong *)(param_4 + 0x9c0);
  uVar10 = *(ulong *)(param_4 + 0x9d0);
  uVar8 = *(ulong *)(param_4 + 0x9c8);
  do {
    lVar11 = ((uVar9 + uVar10) * 0x800000 | uVar9 + uVar10 >> 0x29) + uVar9;
    uVar13 = uVar6 << 0x11;
    uVar8 = uVar8 ^ uVar9;
    uVar10 = uVar10 ^ uVar6;
    uVar6 = uVar6 ^ uVar8;
    uVar9 = uVar9 ^ uVar10;
    uVar10 = uVar10 << 0x2d | uVar10 >> 0x13;
    uVar8 = uVar8 ^ uVar13;
    fVar18 = ((float)((uint)((ulong)lVar11 >> 0x29) | 0x3f800000) + _DAT_145db1368) * _DAT_145db17a0
    ;
    auVar19 = ZEXT416((uint)fVar18);
  } while (_DAT_145db17a0 <= fVar18);
  uVar13 = (ulong)(uVar5 & 0xffffff) | (ulong)(uVar16 & 0xffffff) << 0x18 | 0xf110000000000000;
  *(ulong *)(param_4 + 0x9b8) = uVar9;
  *(ulong *)(param_4 + 0x9d0) = uVar10;
  *(ulong *)(param_4 + 0x9c0) = uVar6;
  *(ulong *)(param_4 + 0x9c8) = uVar8;
  local_c0 = 0;
  local_b0 = 0;
  uVar9 = uVar13;
  local_68 = in_XMM6_Qa;
  local_58 = in_XMM7_Qa;
  func_0x0001458c19b0(param_5,param_4,0,&local_c0);
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_14594f1b3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 2) - (2 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x21;
        goto LAB_14594f1fd;
      }
LAB_14594f1b3:
      if (lVar7 == 0) goto LAB_14594f1cd;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f1cd:
  local_98 = 0;
  local_88 = 2;
  uVar6 = 0x21;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
  uVar9 = uVar6;
LAB_14594f1fd:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_14594f253;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 3) - (3 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar16;
        goto LAB_14594f296;
      }
LAB_14594f253:
      if (lVar7 == 0) goto LAB_14594f269;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f269:
  local_98 = 0;
  local_88 = 3;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
LAB_14594f296:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f2f3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 4) - (4 < uVar3)) == '\x01');
      if (uVar3 < 4 == 4 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar17;
        uVar9 = 0;
        goto LAB_14594f33a;
      }
LAB_14594f2f3:
      if (lVar7 == 0) goto LAB_14594f30b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f30b:
  uVar9 = (ulong)uVar17;
  local_98 = 0;
  local_88 = 4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f33a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_14594f393;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 8) - (8 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar4;
        goto LAB_14594f3d6;
      }
LAB_14594f393:
      if (lVar7 == 0) goto LAB_14594f3a9;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f3a9:
  local_98 = 0;
  local_88 = 8;
  uVar6 = (ulong)uVar4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
  uVar9 = uVar6;
LAB_14594f3d6:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_14594f433;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 9) - (9 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = in_stack_00000028;
        goto LAB_14594f476;
      }
LAB_14594f433:
      if (lVar7 == 0) goto LAB_14594f449;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f449:
  local_98 = 0;
  local_88 = 9;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
LAB_14594f476:
  auVar19._0_4_ = auVar19._0_4_ + 0.0;
  uVar15 = func_0x000145c0a411();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f4f3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xc) - (0xc < uVar3)) == '\x01');
      if (uVar3 < 0xc == 0xc < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = uVar15;
        goto LAB_14594f53a;
      }
LAB_14594f4f3:
      if (lVar7 == 0) goto LAB_14594f50b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f50b:
  local_98 = 0;
  local_88 = 0xc;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f53a:
  uVar16 = func_0x000145c0a417();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f5a3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xd) - (0xd < uVar3)) == '\x01');
      if (uVar3 < 0xd == 0xd < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_14594f5ea;
      }
LAB_14594f5a3:
      if (lVar7 == 0) goto LAB_14594f5bb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f5bb:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0xd;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f5ea:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_14594f643;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 0xe) - (0xe < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 1;
        goto LAB_14594f68d;
      }
LAB_14594f643:
      if (lVar7 == 0) goto LAB_14594f65d;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f65d:
  local_98 = 0;
  local_88 = 0xe;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
LAB_14594f68d:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f6f3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xf) - (0xf < uVar3)) == '\x01');
      if (uVar3 < 0xf == 0xf < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = *param_5;
        goto LAB_14594f73a;
      }
LAB_14594f6f3:
      if (lVar7 == 0) goto LAB_14594f70b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f70b:
  local_98 = 0;
  local_88 = 0xf;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f73a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f7a3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x10) - (0x10 < uVar3)) == '\x01');
      if (uVar3 < 0x10 == 0x10 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[1];
        goto LAB_14594f7ea;
      }
LAB_14594f7a3:
      if (lVar7 == 0) goto LAB_14594f7bb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f7bb:
  local_98 = 0;
  local_88 = 0x10;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f7ea:
  uVar16 = auVar19._0_4_;
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f853;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x11) - (0x11 < uVar3)) == '\x01');
      if (uVar3 < 0x11 == 0x11 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[2];
        goto LAB_14594f89a;
      }
LAB_14594f853:
      if (lVar7 == 0) goto LAB_14594f86b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f86b:
  local_98 = 0;
  local_88 = 0x11;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
  uVar16 = auVar19._0_4_;
LAB_14594f89a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_14594f8f3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x12) - (0x12 < uVar3)) == '\x01');
      if (uVar3 < 0x12 == 0x12 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_14594f93a;
      }
LAB_14594f8f3:
      if (lVar7 == 0) goto LAB_14594f90b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f90b:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0x12;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x0001458de1f0();
LAB_14594f93a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar10 == 0) goto LAB_14594f993;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        uVar9 = uVar6 + 1;
        uVar10 = uVar10 - 2;
        uVar6 = uVar9;
      } while ((char)((uVar3 < 0x14) - (0x14 < uVar3)) == '\x01');
      if (uVar3 < 0x14 == 0x14 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x23;
        goto LAB_14594f9dd;
      }
LAB_14594f993:
      if (lVar7 == 0) goto LAB_14594f9ad;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_14594f9ad:
  local_98 = 0;
  local_88 = 0x14;
  uVar6 = 0x23;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x0001458de1f0();
  uVar9 = uVar6;
LAB_14594f9dd:
  lVar11 = local_c0;
  if (local_c0 == 0) {
    lVar11 = 0;
LAB_14594fa4c:
    local_98 = 0;
    local_88 = 0x15;
    local_a8 = &local_c0;
    lStack_a0 = lVar11;
    uStack_90 = uVar9;
    func_0x0001458de1f0();
LAB_14594fa7a:
    local_71 = 1;
    func_0x0001458c0f20();
    local_98 = 0;
    uStack_90 = (ulong)uStack_ec << 0x20;
    local_a8 = (long *)0x0;
    lStack_a0 = 1;
    local_71 = 0;
    func_0x0001458c1180();
    lVar11 = *(long *)(param_4 + 0x630);
    if (lVar11 == *(long *)(param_4 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar7 = *(long *)(param_4 + 0x628);
    puVar2 = (undefined4 *)(lVar7 + 0x10 + lVar11 * 0x20);
    *puVar2 = local_d8;
    puVar2[1] = uStack_d4;
    puVar2[2] = uStack_d0;
    puVar2[3] = uStack_cc;
    puVar1 = (undefined8 *)(lVar7 + lVar11 * 0x20);
    *puVar1 = local_e8;
    puVar1[1] = uStack_e0;
    *(long *)(param_4 + 0x630) = lVar11 + 1;
    func_0x0001459c3ba0();
    return uVar13;
  }
  do {
    uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
    uVar6 = 0xffffffffffffffff;
    do {
      uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
      if (uVar10 == 0) goto LAB_14594fa33;
      uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
      uVar9 = uVar6 + 1;
      uVar10 = uVar10 - 2;
      uVar6 = uVar9;
    } while ((char)((uVar3 < 0x15) - (0x15 < uVar3)) == '\x01');
    if (uVar3 < 0x15 == 0x15 < uVar3) {
      *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = param_6;
      goto LAB_14594fa7a;
    }
LAB_14594fa33:
    bVar14 = local_b8 == 0;
    local_b8 = local_b8 + -1;
    if (bVar14) goto LAB_14594fa4c;
    lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
  } while( true );
}
