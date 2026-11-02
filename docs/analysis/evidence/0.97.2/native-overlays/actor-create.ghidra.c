
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,undefined4 param_5,
          ulong param_6)

{
  undefined4 *puVar1;
  ushort uVar2;
  uint uVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  byte bVar12;
  uint uVar13;
  bool bVar14;
  float fVar15;
  undefined8 in_XMM6_Qa;
  undefined1 auVar16 [16];
  uint in_stack_00000028;
  undefined4 in_stack_00000030;
  byte in_stack_00000038;
  float *in_stack_00000040;
  uint uStack_c4;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 local_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  long local_a0;
  long local_98;
  undefined8 local_90;
  long *local_88;
  long lStack_80;
  undefined8 local_78;
  ulong uStack_70;
  undefined8 local_68;
  undefined1 local_51;
  undefined8 local_50;
  undefined8 local_48;

  local_50 = 0xfffffffffffffffe;
  uVar7 = param_6 & 0xffffffff;
  uVar3 = (uint)in_stack_00000038 + (uint)in_stack_00000038 * 2 + *(int *)(param_4 + 0x3f8);
  uVar13 = 0x3f;
  if (uVar3 < 0x3f) {
    uVar13 = uVar3;
  }
  local_a0 = 0;
  local_90 = 0;
  uVar8 = param_6;
  local_48 = in_XMM6_Qa;
  func_0x0001455002f0(param_3,param_4,0,&local_a0);
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        param_3 = uVar8;
        if (uVar9 == 0) goto LAB_1454c08f3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        bVar12 = (uVar2 < 2) - (2 < uVar2);
        param_3 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = param_3;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + param_3 * 4) = 9;
        goto LAB_1454c093d;
      }
LAB_1454c08f3:
      if (lVar5 == 0) goto LAB_1454c090d;
      lVar4 = *(long *)(lVar4 + 0x50 + param_3 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c090d:
  local_78 = 0;
  local_68 = 2;
  uVar6 = 9;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = param_3;
  func_0x000145427a50();
  param_3 = uVar6;
LAB_1454c093d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        param_3 = uVar8;
        if (uVar9 == 0) goto LAB_1454c0993;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        bVar12 = (uVar2 < 3) - (3 < uVar2);
        param_3 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = param_3;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + param_3 * 4) = param_5;
        goto LAB_1454c09d6;
      }
LAB_1454c0993:
      if (lVar5 == 0) goto LAB_1454c09a9;
      lVar4 = *(long *)(lVar4 + 0x50 + param_3 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c09a9:
  local_78 = 0;
  local_68 = 3;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = param_3;
  func_0x000145427a50();
LAB_1454c09d6:
  auVar16 = ZEXT416(in_stack_00000028);
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_1454c0a43;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 4) - (4 < uVar2)) == '\x01');
      if (uVar2 < 4 == 4 < uVar2) {
        *(uint *)(lVar4 + 8 + uVar8 * 4) = in_stack_00000028;
        uVar6 = 0;
        goto LAB_1454c0a8a;
      }
LAB_1454c0a43:
      if (lVar5 == 0) goto LAB_1454c0a5b;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0a5b:
  uVar6 = (ulong)in_stack_00000028;
  local_78 = 0;
  local_68 = 4;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x000145427a50();
LAB_1454c0a8a:
  fVar15 = (float)func_0x000145756e6d(in_stack_00000030);
  uVar3 = (uint)(long)fVar15;
  if (fVar15 < 0.0) {
    uVar3 = 0;
  }
  uVar9 = 0xffffffff;
  if (fVar15 <= _DAT_1458eb51c) {
    uVar9 = (ulong)uVar3;
  }
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar11 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar10 == 0) goto LAB_1454c0b13;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar11 * 2);
        bVar12 = (uVar2 < 0x16) - (0x16 < uVar2);
        uVar6 = uVar11 + 1;
        uVar10 = uVar10 - 2;
        uVar11 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)uVar9;
        goto LAB_1454c0b56;
      }
LAB_1454c0b13:
      if (lVar5 == 0) goto LAB_1454c0b29;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0b29:
  local_78 = 0;
  local_68 = 0x16;
  uVar11 = uVar9;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar11;
LAB_1454c0b56:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar11 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar10 == 0) goto LAB_1454c0bb3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar11 * 2);
        bVar12 = (uVar2 < 0x1c) - (0x1c < uVar2);
        uVar6 = uVar11 + 1;
        uVar10 = uVar10 - 2;
        uVar11 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)uVar9;
        goto LAB_1454c0bf6;
      }
LAB_1454c0bb3:
      if (lVar5 == 0) goto LAB_1454c0bc9;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0bc9:
  local_78 = 0;
  local_68 = 0x1c;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0bf6:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0c53;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x22) - (0x22 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar4 + 8 + uVar6 * 4) = uVar13;
        goto LAB_1454c0c96;
      }
LAB_1454c0c53:
      if (lVar5 == 0) goto LAB_1454c0c69;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0c69:
  local_78 = 0;
  local_68 = 0x22;
  uVar9 = (ulong)uVar13;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0c96:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0cf3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x23) - (0x23 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0xe;
        goto LAB_1454c0d3d;
      }
LAB_1454c0cf3:
      if (lVar5 == 0) goto LAB_1454c0d0d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0d0d:
  local_78 = 0;
  local_68 = 0x23;
  uVar9 = 0xe;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0d3d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0d93;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x24) - (0x24 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x100;
        goto LAB_1454c0ddd;
      }
LAB_1454c0d93:
      if (lVar5 == 0) goto LAB_1454c0dad;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0dad:
  local_78 = 0;
  local_68 = 0x24;
  uVar9 = 0x100;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0ddd:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0e33;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x2e) - (0x2e < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0;
        goto LAB_1454c0e7a;
      }
LAB_1454c0e33:
      if (lVar5 == 0) goto LAB_1454c0e4d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0e4d:
  local_78 = 0;
  local_68 = 0x2e;
  uVar9 = 0;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0e7a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0ed3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x7e) - (0x7e < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 2000;
        goto LAB_1454c0f1d;
      }
LAB_1454c0ed3:
      if (lVar5 == 0) goto LAB_1454c0eed;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0eed:
  local_78 = 0;
  local_68 = 0x7e;
  uVar9 = 2000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar9;
LAB_1454c0f1d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_1454c0f73;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x7f) - (0x7f < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 2000;
        goto LAB_1454c0fbd;
      }
LAB_1454c0f73:
      if (lVar5 == 0) goto LAB_1454c0f8d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c0f8d:
  local_78 = 0;
  local_68 = 0x7f;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
LAB_1454c0fbd:
  fVar15 = auVar16._0_4_;
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_1454c1023;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 0x81) - (0x81 < uVar2)) == '\x01');
      if (uVar2 < 0x81 == 0x81 < uVar2) {
        *(float *)(lVar4 + 8 + uVar8 * 4) = _DAT_1458eb488 * fVar15;
        goto LAB_1454c106a;
      }
LAB_1454c1023:
      if (lVar5 == 0) goto LAB_1454c103b;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c103b:
  local_78 = 0;
  local_68 = 0x81;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x000145427a50();
  fVar15 = auVar16._0_4_;
LAB_1454c106a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_1454c10d3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 0x82) - (0x82 < uVar2)) == '\x01');
      if (uVar2 < 0x82 == 0x82 < uVar2) {
        *(float *)(lVar4 + 8 + uVar8 * 4) = fVar15 * _DAT_1458fcc38;
        uVar6 = 0;
        goto LAB_1454c111a;
      }
LAB_1454c10d3:
      if (lVar5 == 0) goto LAB_1454c10eb;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c10eb:
  uVar6 = (ulong)(uint)(fVar15 * _DAT_1458fcc38);
  local_78 = 0;
  local_68 = 0x82;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x000145427a50();
LAB_1454c111a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar8 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_1454c1173;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar8 * 2);
        uVar6 = uVar8 + 1;
        uVar9 = uVar9 - 2;
        uVar8 = uVar6;
      } while ((char)((uVar2 < 0x83) - (0x83 < uVar2)) == '\x01');
      if (uVar2 < 0x83 == 0x83 < uVar2) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)param_6;
        goto LAB_1454c11b6;
      }
LAB_1454c1173:
      if (lVar5 == 0) goto LAB_1454c1189;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c1189:
  local_78 = 0;
  local_68 = 0x83;
  uVar8 = uVar7;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar8;
LAB_1454c11b6:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar8 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_1454c1213;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar8 * 2);
        uVar6 = uVar8 + 1;
        uVar9 = uVar9 - 2;
        uVar8 = uVar6;
      } while ((char)((uVar2 < 0x84) - (0x84 < uVar2)) == '\x01');
      if (uVar2 < 0x84 == 0x84 < uVar2) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)param_6;
        goto LAB_1454c1256;
      }
LAB_1454c1213:
      if (lVar5 == 0) goto LAB_1454c1229;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c1229:
  local_78 = 0;
  local_68 = 0x84;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar7;
LAB_1454c1256:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar7 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar8 == 0) goto LAB_1454c12b3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
        uVar6 = uVar7 + 1;
        uVar8 = uVar8 - 2;
        uVar7 = uVar6;
      } while ((char)((uVar2 < 0x86) - (0x86 < uVar2)) == '\x01');
      if (uVar2 < 0x86 == 0x86 < uVar2) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x40a00000;
        goto LAB_1454c12fd;
      }
LAB_1454c12b3:
      if (lVar5 == 0) goto LAB_1454c12cd;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c12cd:
  local_78 = 0;
  local_68 = 0x86;
  uVar7 = 0x40a00000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar7;
LAB_1454c12fd:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar7 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar8 == 0) goto LAB_1454c1363;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
        uVar6 = uVar7 + 1;
        uVar8 = uVar8 - 2;
        uVar7 = uVar6;
      } while ((char)((uVar2 < 0x87) - (0x87 < uVar2)) == '\x01');
      if (uVar2 < 0x87 == 0x87 < uVar2) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x41200000;
        goto LAB_1454c13ad;
      }
LAB_1454c1363:
      if (lVar5 == 0) goto LAB_1454c137d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_1454c137d:
  local_78 = 0;
  local_68 = 0x87;
  uVar7 = 0x41200000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x000145427a50();
  uVar6 = uVar7;
LAB_1454c13ad:
  lVar4 = local_a0;
  if (local_a0 == 0) {
    lVar4 = 0;
LAB_1454c142d:
    local_78 = 0;
    local_68 = 0x91;
    local_88 = &local_a0;
    lStack_80 = lVar4;
    uStack_70 = uVar6;
    func_0x000145427a50();
LAB_1454c145d:
    func_0x0001455002f0();
    func_0x000145756e37(*(float *)(param_4 + 0x3ec) - in_stack_00000040[1],
                        *(float *)(param_4 + 1000) - *in_stack_00000040);
    local_51 = 1;
    func_0x0001454ff300();
    local_78 = 0;
    uStack_70 = (ulong)uStack_c4 << 0x20;
    local_88 = (long *)0x0;
    lStack_80 = 1;
    local_51 = 0;
    func_0x0001454ffad0();
    lVar4 = *(long *)(param_4 + 0x548);
    if (lVar4 == *(long *)(param_4 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar5 = *(long *)(param_4 + 0x540);
    puVar1 = (undefined4 *)(lVar5 + 0x10 + lVar4 * 0x20);
    *puVar1 = local_b0;
    puVar1[1] = uStack_ac;
    puVar1[2] = uStack_a8;
    puVar1[3] = uStack_a4;
    puVar1 = (undefined4 *)(lVar5 + lVar4 * 0x20);
    *puVar1 = local_c0;
    puVar1[1] = uStack_bc;
    puVar1[2] = uStack_b8;
    puVar1[3] = uStack_b4;
    *(long *)(param_4 + 0x548) = lVar4 + 1;
    func_0x0001455127d0();
    return;
  }
  do {
    uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
    uVar7 = 0xffffffffffffffff;
    do {
      uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
      if (uVar8 == 0) goto LAB_1454c1413;
      uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
      uVar6 = uVar7 + 1;
      uVar8 = uVar8 - 2;
      uVar7 = uVar6;
    } while ((char)((uVar2 < 0x91) - (0x91 < uVar2)) == '\x01');
    if (uVar2 < 0x91 == 0x91 < uVar2) {
      *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x3f800000;
      goto LAB_1454c145d;
    }
LAB_1454c1413:
    bVar14 = local_98 == 0;
    local_98 = local_98 + -1;
    if (bVar14) goto LAB_1454c142d;
    lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
  } while( true );
}
