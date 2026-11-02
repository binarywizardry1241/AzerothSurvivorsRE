
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ward_presentation(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,
                      undefined4 param_5,ulong param_6)

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
  uVar3 = (uint)in_stack_00000038 + (uint)in_stack_00000038 * 2 + *(int *)(param_4 + 0x4d8);
  uVar13 = 0x3f;
  if (uVar3 < 0x3f) {
    uVar13 = uVar3;
  }
  local_a0 = 0;
  local_90 = 0;
  uVar8 = param_6;
  local_48 = in_XMM6_Qa;
  func_0x0001458c0000(param_3,param_4,0,&local_a0);
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        param_3 = uVar8;
        if (uVar9 == 0) goto LAB_14596ee13;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        bVar12 = (uVar2 < 2) - (2 < uVar2);
        param_3 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = param_3;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + param_3 * 4) = 9;
        goto LAB_14596ee5d;
      }
LAB_14596ee13:
      if (lVar5 == 0) goto LAB_14596ee2d;
      lVar4 = *(long *)(lVar4 + 0x50 + param_3 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596ee2d:
  local_78 = 0;
  local_68 = 2;
  uVar6 = 9;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = param_3;
  func_0x0001458d9620();
  param_3 = uVar6;
LAB_14596ee5d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        param_3 = uVar8;
        if (uVar9 == 0) goto LAB_14596eeb3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        bVar12 = (uVar2 < 3) - (3 < uVar2);
        param_3 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = param_3;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + param_3 * 4) = param_5;
        goto LAB_14596eef6;
      }
LAB_14596eeb3:
      if (lVar5 == 0) goto LAB_14596eec9;
      lVar4 = *(long *)(lVar4 + 0x50 + param_3 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596eec9:
  local_78 = 0;
  local_68 = 3;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = param_3;
  func_0x0001458d9620();
LAB_14596eef6:
  auVar16 = ZEXT416(in_stack_00000028);
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_14596ef63;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 4) - (4 < uVar2)) == '\x01');
      if (uVar2 < 4 == 4 < uVar2) {
        *(uint *)(lVar4 + 8 + uVar8 * 4) = in_stack_00000028;
        uVar6 = 0;
        goto LAB_14596efaa;
      }
LAB_14596ef63:
      if (lVar5 == 0) goto LAB_14596ef7b;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596ef7b:
  uVar6 = (ulong)in_stack_00000028;
  local_78 = 0;
  local_68 = 4;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x0001458d9620();
LAB_14596efaa:
  fVar15 = (float)func_0x000145bfa141(in_stack_00000030);
  uVar3 = (uint)(long)fVar15;
  if (fVar15 < 0.0) {
    uVar3 = 0;
  }
  uVar9 = 0xffffffff;
  if (fVar15 <= _DAT_145dd2e40) {
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
        if (uVar10 == 0) goto LAB_14596f033;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar11 * 2);
        bVar12 = (uVar2 < 0x16) - (0x16 < uVar2);
        uVar6 = uVar11 + 1;
        uVar10 = uVar10 - 2;
        uVar11 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)uVar9;
        goto LAB_14596f076;
      }
LAB_14596f033:
      if (lVar5 == 0) goto LAB_14596f049;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f049:
  local_78 = 0;
  local_68 = 0x16;
  uVar11 = uVar9;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar11;
LAB_14596f076:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar11 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar10 == 0) goto LAB_14596f0d3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar11 * 2);
        bVar12 = (uVar2 < 0x1c) - (0x1c < uVar2);
        uVar6 = uVar11 + 1;
        uVar10 = uVar10 - 2;
        uVar11 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)uVar9;
        goto LAB_14596f116;
      }
LAB_14596f0d3:
      if (lVar5 == 0) goto LAB_14596f0e9;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f0e9:
  local_78 = 0;
  local_68 = 0x1c;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f116:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f173;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x22) - (0x22 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(uint *)(lVar4 + 8 + uVar6 * 4) = uVar13;
        goto LAB_14596f1b6;
      }
LAB_14596f173:
      if (lVar5 == 0) goto LAB_14596f189;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f189:
  local_78 = 0;
  local_68 = 0x22;
  uVar9 = (ulong)uVar13;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f1b6:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f213;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x23) - (0x23 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0xe;
        goto LAB_14596f25d;
      }
LAB_14596f213:
      if (lVar5 == 0) goto LAB_14596f22d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f22d:
  local_78 = 0;
  local_68 = 0x23;
  uVar9 = 0xe;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f25d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f2b3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x24) - (0x24 < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x100;
        goto LAB_14596f2fd;
      }
LAB_14596f2b3:
      if (lVar5 == 0) goto LAB_14596f2cd;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f2cd:
  local_78 = 0;
  local_68 = 0x24;
  uVar9 = 0x100;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f2fd:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f353;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x2e) - (0x2e < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0;
        goto LAB_14596f39a;
      }
LAB_14596f353:
      if (lVar5 == 0) goto LAB_14596f36d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f36d:
  local_78 = 0;
  local_68 = 0x2e;
  uVar9 = 0;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f39a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f3f3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x7e) - (0x7e < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 2000;
        goto LAB_14596f43d;
      }
LAB_14596f3f3:
      if (lVar5 == 0) goto LAB_14596f40d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f40d:
  local_78 = 0;
  local_68 = 0x7e;
  uVar9 = 2000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar9;
LAB_14596f43d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
      uVar11 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar6 = uVar8;
        if (uVar11 == 0) goto LAB_14596f493;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar9 * 2);
        bVar12 = (uVar2 < 0x7f) - (0x7f < uVar2);
        uVar6 = uVar9 + 1;
        uVar11 = uVar11 - 2;
        uVar9 = uVar6;
      } while (bVar12 == 1);
      uVar8 = (ulong)bVar12;
      if (bVar12 == 0) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 2000;
        goto LAB_14596f4dd;
      }
LAB_14596f493:
      if (lVar5 == 0) goto LAB_14596f4ad;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f4ad:
  local_78 = 0;
  local_68 = 0x7f;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
LAB_14596f4dd:
  fVar15 = auVar16._0_4_;
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_14596f543;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 0x81) - (0x81 < uVar2)) == '\x01');
      if (uVar2 < 0x81 == 0x81 < uVar2) {
        *(float *)(lVar4 + 8 + uVar8 * 4) = _DAT_145d9d2a4 * fVar15;
        goto LAB_14596f58a;
      }
LAB_14596f543:
      if (lVar5 == 0) goto LAB_14596f55b;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f55b:
  local_78 = 0;
  local_68 = 0x81;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x0001458d9620();
  fVar15 = auVar16._0_4_;
LAB_14596f58a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar6 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_14596f5f3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar6 * 2);
        uVar8 = uVar6 + 1;
        uVar9 = uVar9 - 2;
        uVar6 = uVar8;
      } while ((char)((uVar2 < 0x82) - (0x82 < uVar2)) == '\x01');
      if (uVar2 < 0x82 == 0x82 < uVar2) {
        *(float *)(lVar4 + 8 + uVar8 * 4) = fVar15 * _DAT_145dd4cc8;
        uVar6 = 0;
        goto LAB_14596f63a;
      }
LAB_14596f5f3:
      if (lVar5 == 0) goto LAB_14596f60b;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar8 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f60b:
  uVar6 = (ulong)(uint)(fVar15 * _DAT_145dd4cc8);
  local_78 = 0;
  local_68 = 0x82;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar8;
  func_0x0001458d9620();
LAB_14596f63a:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar8 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_14596f693;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar8 * 2);
        uVar6 = uVar8 + 1;
        uVar9 = uVar9 - 2;
        uVar8 = uVar6;
      } while ((char)((uVar2 < 0x83) - (0x83 < uVar2)) == '\x01');
      if (uVar2 < 0x83 == 0x83 < uVar2) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)param_6;
        goto LAB_14596f6d6;
      }
LAB_14596f693:
      if (lVar5 == 0) goto LAB_14596f6a9;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f6a9:
  local_78 = 0;
  local_68 = 0x83;
  uVar8 = uVar7;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar8;
LAB_14596f6d6:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar8 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar9 == 0) goto LAB_14596f733;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar8 * 2);
        uVar6 = uVar8 + 1;
        uVar9 = uVar9 - 2;
        uVar8 = uVar6;
      } while ((char)((uVar2 < 0x84) - (0x84 < uVar2)) == '\x01');
      if (uVar2 < 0x84 == 0x84 < uVar2) {
        *(int *)(lVar4 + 8 + uVar6 * 4) = (int)param_6;
        goto LAB_14596f776;
      }
LAB_14596f733:
      if (lVar5 == 0) goto LAB_14596f749;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f749:
  local_78 = 0;
  local_68 = 0x84;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar7;
LAB_14596f776:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar7 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar8 == 0) goto LAB_14596f7d3;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
        uVar6 = uVar7 + 1;
        uVar8 = uVar8 - 2;
        uVar7 = uVar6;
      } while ((char)((uVar2 < 0x86) - (0x86 < uVar2)) == '\x01');
      if (uVar2 < 0x86 == 0x86 < uVar2) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x40a00000;
        goto LAB_14596f81d;
      }
LAB_14596f7d3:
      if (lVar5 == 0) goto LAB_14596f7ed;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f7ed:
  local_78 = 0;
  local_68 = 0x86;
  uVar7 = 0x40a00000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar7;
LAB_14596f81d:
  lVar4 = local_a0;
  lVar5 = local_98;
  if (local_a0 != 0) {
    do {
      uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
      uVar7 = 0xffffffffffffffff;
      do {
        uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
        if (uVar8 == 0) goto LAB_14596f883;
        uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
        uVar6 = uVar7 + 1;
        uVar8 = uVar8 - 2;
        uVar7 = uVar6;
      } while ((char)((uVar2 < 0x87) - (0x87 < uVar2)) == '\x01');
      if (uVar2 < 0x87 == 0x87 < uVar2) {
        *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x41200000;
        goto LAB_14596f8cd;
      }
LAB_14596f883:
      if (lVar5 == 0) goto LAB_14596f89d;
      lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
      lVar5 = lVar5 + -1;
    } while( true );
  }
  lVar4 = 0;
LAB_14596f89d:
  local_78 = 0;
  local_68 = 0x87;
  uVar7 = 0x41200000;
  local_88 = &local_a0;
  lStack_80 = lVar4;
  uStack_70 = uVar6;
  func_0x0001458d9620();
  uVar6 = uVar7;
LAB_14596f8cd:
  lVar4 = local_a0;
  if (local_a0 == 0) {
    lVar4 = 0;
LAB_14596f94d:
    local_78 = 0;
    local_68 = 0x91;
    local_88 = &local_a0;
    lStack_80 = lVar4;
    uStack_70 = uVar6;
    func_0x0001458d9620();
LAB_14596f97d:
    func_0x0001458c0000();
    func_0x000145bfa123(*(float *)(param_4 + 0x4cc) - in_stack_00000040[1],
                        *(float *)(param_4 + 0x4c8) - *in_stack_00000040);
    local_51 = 1;
    func_0x0001458bef90();
    local_78 = 0;
    uStack_70 = (ulong)uStack_c4 << 0x20;
    local_88 = (long *)0x0;
    lStack_80 = 1;
    local_51 = 0;
    func_0x0001458bf760();
    lVar4 = *(long *)(param_4 + 0x628);
    if (lVar4 == *(long *)(param_4 + 0x618)) {
      func_0x000145bfae10();
    }
    lVar5 = *(long *)(param_4 + 0x620);
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
    *(long *)(param_4 + 0x628) = lVar4 + 1;
    func_0x0001459b47a0();
    return;
  }
  do {
    uVar8 = (ulong)((uint)*(ushort *)(lVar4 + 0x36) * 2);
    uVar7 = 0xffffffffffffffff;
    do {
      uVar6 = (ulong)*(ushort *)(lVar4 + 0x36);
      if (uVar8 == 0) goto LAB_14596f933;
      uVar2 = *(ushort *)(lVar4 + 0x3a + uVar7 * 2);
      uVar6 = uVar7 + 1;
      uVar8 = uVar8 - 2;
      uVar7 = uVar6;
    } while ((char)((uVar2 < 0x91) - (0x91 < uVar2)) == '\x01');
    if (uVar2 < 0x91 == 0x91 < uVar2) {
      *(undefined4 *)(lVar4 + 8 + uVar6 * 4) = 0x3f800000;
      goto LAB_14596f97d;
    }
LAB_14596f933:
    bVar14 = local_98 == 0;
    local_98 = local_98 + -1;
    if (bVar14) goto LAB_14596f94d;
    lVar4 = *(long *)(lVar4 + 0x50 + uVar6 * 8);
  } while( true );
}

