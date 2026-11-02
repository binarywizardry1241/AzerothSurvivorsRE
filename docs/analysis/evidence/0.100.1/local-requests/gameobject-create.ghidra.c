
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
  uVar5 = *(int *)(param_4 + 0x954) + 1;
  *(uint *)(param_4 + 0x954) = uVar5;
  uVar9 = *(ulong *)(param_4 + 0x8a0);
  uVar6 = *(ulong *)(param_4 + 0x8a8);
  uVar10 = *(ulong *)(param_4 + 0x8b8);
  uVar8 = *(ulong *)(param_4 + 0x8b0);
  do {
    lVar11 = ((uVar9 + uVar10) * 0x800000 | uVar9 + uVar10 >> 0x29) + uVar9;
    uVar13 = uVar6 << 0x11;
    uVar8 = uVar8 ^ uVar9;
    uVar10 = uVar10 ^ uVar6;
    uVar6 = uVar6 ^ uVar8;
    uVar9 = uVar9 ^ uVar10;
    uVar10 = uVar10 << 0x2d | uVar10 >> 0x13;
    uVar8 = uVar8 ^ uVar13;
    fVar18 = ((float)((uint)((ulong)lVar11 >> 0x29) | 0x3f800000) + _DAT_14590750c) * _DAT_1459095e4
    ;
    auVar19 = ZEXT416((uint)fVar18);
  } while (_DAT_1459095e4 <= fVar18);
  uVar13 = (ulong)(uVar5 & 0xffffff) | (ulong)(uVar16 & 0xffffff) << 0x18 | 0xf110000000000000;
  *(ulong *)(param_4 + 0x8a0) = uVar9;
  *(ulong *)(param_4 + 0x8b8) = uVar10;
  *(ulong *)(param_4 + 0x8a8) = uVar6;
  *(ulong *)(param_4 + 0x8b0) = uVar8;
  local_c0 = 0;
  local_b0 = 0;
  uVar9 = uVar13;
  local_68 = in_XMM6_Qa;
  local_58 = in_XMM7_Qa;
  func_0x000145513710(param_5,param_4,0,&local_c0);
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454e4b93;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 2) - (2 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x21;
        goto LAB_1454e4bdd;
      }
LAB_1454e4b93:
      if (lVar7 == 0) goto LAB_1454e4bad;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4bad:
  local_98 = 0;
  local_88 = 2;
  uVar6 = 0x21;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
  uVar9 = uVar6;
LAB_1454e4bdd:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454e4c33;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 3) - (3 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar16;
        goto LAB_1454e4c76;
      }
LAB_1454e4c33:
      if (lVar7 == 0) goto LAB_1454e4c49;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4c49:
  local_98 = 0;
  local_88 = 3;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
LAB_1454e4c76:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e4cd3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 4) - (4 < uVar3)) == '\x01');
      if (uVar3 < 4 == 4 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar17;
        uVar9 = 0;
        goto LAB_1454e4d1a;
      }
LAB_1454e4cd3:
      if (lVar7 == 0) goto LAB_1454e4ceb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4ceb:
  uVar9 = (ulong)uVar17;
  local_98 = 0;
  local_88 = 4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e4d1a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454e4d73;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 8) - (8 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar11 + 8 + uVar9 * 4) = uVar4;
        goto LAB_1454e4db6;
      }
LAB_1454e4d73:
      if (lVar7 == 0) goto LAB_1454e4d89;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4d89:
  local_98 = 0;
  local_88 = 8;
  uVar6 = (ulong)uVar4;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
  uVar9 = uVar6;
LAB_1454e4db6:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454e4e13;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 9) - (9 < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = in_stack_00000028;
        goto LAB_1454e4e56;
      }
LAB_1454e4e13:
      if (lVar7 == 0) goto LAB_1454e4e29;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4e29:
  local_98 = 0;
  local_88 = 9;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
LAB_1454e4e56:
  auVar19._0_4_ = auVar19._0_4_ + 0.0;
  uVar15 = func_0x000145773235();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e4ed3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xc) - (0xc < uVar3)) == '\x01');
      if (uVar3 < 0xc == 0xc < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = uVar15;
        goto LAB_1454e4f1a;
      }
LAB_1454e4ed3:
      if (lVar7 == 0) goto LAB_1454e4eeb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4eeb:
  local_98 = 0;
  local_88 = 0xc;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e4f1a:
  uVar16 = func_0x000145773247();
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e4f83;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xd) - (0xd < uVar3)) == '\x01');
      if (uVar3 < 0xd == 0xd < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_1454e4fca;
      }
LAB_1454e4f83:
      if (lVar7 == 0) goto LAB_1454e4f9b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e4f9b:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0xd;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e4fca:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = uVar10;
        if (uVar8 == 0) goto LAB_1454e5023;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        bVar12 = (uVar3 < 0xe) - (0xe < uVar3);
        uVar9 = uVar6 + 1;
        uVar8 = uVar8 - 2;
        uVar6 = uVar9;
      } while (bVar12 == 1);
      uVar10 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 1;
        goto LAB_1454e506d;
      }
LAB_1454e5023:
      if (lVar7 == 0) goto LAB_1454e503d;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e503d:
  local_98 = 0;
  local_88 = 0xe;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
LAB_1454e506d:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e50d3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0xf) - (0xf < uVar3)) == '\x01');
      if (uVar3 < 0xf == 0xf < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = *param_5;
        goto LAB_1454e511a;
      }
LAB_1454e50d3:
      if (lVar7 == 0) goto LAB_1454e50eb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e50eb:
  local_98 = 0;
  local_88 = 0xf;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e511a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e5183;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x10) - (0x10 < uVar3)) == '\x01');
      if (uVar3 < 0x10 == 0x10 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[1];
        goto LAB_1454e51ca;
      }
LAB_1454e5183:
      if (lVar7 == 0) goto LAB_1454e519b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e519b:
  local_98 = 0;
  local_88 = 0x10;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e51ca:
  uVar16 = auVar19._0_4_;
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e5233;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x11) - (0x11 < uVar3)) == '\x01');
      if (uVar3 < 0x11 == 0x11 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar10 * 4) = param_5[2];
        goto LAB_1454e527a;
      }
LAB_1454e5233:
      if (lVar7 == 0) goto LAB_1454e524b;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e524b:
  local_98 = 0;
  local_88 = 0x11;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
  uVar16 = auVar19._0_4_;
LAB_1454e527a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar6 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar10 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar6 == 0) goto LAB_1454e52d3;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar9 * 2);
        uVar10 = uVar9 + 1;
        uVar6 = uVar6 - 2;
        uVar9 = uVar10;
      } while ((char)((uVar3 < 0x12) - (0x12 < uVar3)) == '\x01');
      if (uVar3 < 0x12 == 0x12 < uVar3) {
        *(uint *)(lVar11 + 8 + uVar10 * 4) = uVar16;
        uVar9 = 0;
        goto LAB_1454e531a;
      }
LAB_1454e52d3:
      if (lVar7 == 0) goto LAB_1454e52eb;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar10 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e52eb:
  uVar9 = (ulong)uVar16;
  local_98 = 0;
  local_88 = 0x12;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar10;
  func_0x00014552a730();
LAB_1454e531a:
  lVar11 = local_c0;
  lVar7 = local_b8;
  if (local_c0 != 0) {
    do {
      uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
        if (uVar10 == 0) goto LAB_1454e5373;
        uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
        uVar9 = uVar6 + 1;
        uVar10 = uVar10 - 2;
        uVar6 = uVar9;
      } while ((char)((uVar3 < 0x14) - (0x14 < uVar3)) == '\x01');
      if (uVar3 < 0x14 == 0x14 < uVar3) {
        *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = 0x23;
        goto LAB_1454e53bd;
      }
LAB_1454e5373:
      if (lVar7 == 0) goto LAB_1454e538d;
      lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar11 = 0;
LAB_1454e538d:
  local_98 = 0;
  local_88 = 0x14;
  uVar6 = 0x23;
  local_a8 = &local_c0;
  lStack_a0 = lVar11;
  uStack_90 = uVar9;
  func_0x00014552a730();
  uVar9 = uVar6;
LAB_1454e53bd:
  lVar11 = local_c0;
  if (local_c0 == 0) {
    lVar11 = 0;
LAB_1454e542c:
    local_98 = 0;
    local_88 = 0x15;
    local_a8 = &local_c0;
    lStack_a0 = lVar11;
    uStack_90 = uVar9;
    func_0x00014552a730();
LAB_1454e545a:
    local_71 = 1;
    func_0x000145512c90();
    local_98 = 0;
    uStack_90 = (ulong)uStack_ec << 0x20;
    local_a8 = (long *)0x0;
    lStack_a0 = 1;
    local_71 = 0;
    func_0x000145512ef0();
    lVar11 = *(long *)(param_4 + 0x560);
    if (lVar11 == *(long *)(param_4 + 0x550)) {
      func_0x000145774710();
    }
    lVar7 = *(long *)(param_4 + 0x558);
    puVar2 = (undefined4 *)(lVar7 + 0x10 + lVar11 * 0x20);
    *puVar2 = local_d8;
    puVar2[1] = uStack_d4;
    puVar2[2] = uStack_d0;
    puVar2[3] = uStack_cc;
    puVar1 = (undefined8 *)(lVar7 + lVar11 * 0x20);
    *puVar1 = local_e8;
    puVar1[1] = uStack_e0;
    *(long *)(param_4 + 0x560) = lVar11 + 1;
    func_0x00014550cd20();
    return uVar13;
  }
  do {
    uVar10 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
    uVar6 = 0xffffffffffffffff;
    do {
      uVar9 = (ulong)*(ushort *)(lVar11 + 0x36);
      if (uVar10 == 0) goto LAB_1454e5413;
      uVar3 = *(ushort *)(lVar11 + 0x3a + uVar6 * 2);
      uVar9 = uVar6 + 1;
      uVar10 = uVar10 - 2;
      uVar6 = uVar9;
    } while ((char)((uVar3 < 0x15) - (0x15 < uVar3)) == '\x01');
    if (uVar3 < 0x15 == 0x15 < uVar3) {
      *(undefined4 *)(lVar11 + 8 + uVar9 * 4) = param_6;
      goto LAB_1454e545a;
    }
LAB_1454e5413:
    bVar14 = local_b8 == 0;
    local_b8 = local_b8 + -1;
    if (bVar14) goto LAB_1454e542c;
    lVar11 = *(long *)(lVar11 + 0x50 + uVar9 * 8);
  } while( true );
}
