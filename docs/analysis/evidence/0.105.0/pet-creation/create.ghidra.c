
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,undefined8 param_5
     ,long param_6,long param_7,undefined8 param_8,undefined8 *param_9)

{
  float *pfVar1;
  ushort uVar2;
  int iVar3;
  uint uVar4;
  undefined8 uVar5;
  uint uVar6;
  undefined4 uVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  undefined4 uVar12;
  undefined8 *puVar13;
  undefined8 *puVar14;
  undefined8 *puVar15;
  byte bVar16;
  undefined8 *puVar17;
  bool bVar18;
  float extraout_XMM0_Da;
  float fVar19;
  float extraout_XMM0_Db;
  undefined8 uVar20;
  undefined8 extraout_XMM0_Qa;
  float fVar22;
  undefined1 auVar21 [16];
  undefined8 extraout_XMM0_Qb;
  float fVar23;
  undefined8 extraout_XMM1_Qa;
  undefined4 in_XMM6_Da;
  undefined8 in_XMM7_Qa;
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  float fVar27;
  undefined1 auVar28 [16];
  int *in_stack_00000028;
  uint uStack_104;
  undefined8 local_100;
  undefined8 uStack_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  long local_e0;
  long local_d8;
  undefined8 local_d0;
  long *local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 *puStack_b0;
  undefined8 local_a8;
  undefined1 local_91;
  undefined8 local_90;
  undefined4 local_88;
  undefined8 local_78;

  local_90 = 0xfffffffffffffffe;
  puVar15 = param_9;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Qa;
  func_0x000145bc97c3();
  fVar27 = extraout_XMM0_Da;
  fVar19 = extraout_XMM0_Db;
  uVar20 = func_0x000145bc97bd();
  auVar25._0_4_ = fVar27 * _DAT_146e785b0 + (float)*(undefined8 *)(param_7 + 0x4c8);
  auVar25._4_4_ =
       (float)uVar20 * fRam0000000146e785b4 +
       (float)((ulong)*(undefined8 *)(param_7 + 0x4c8) >> 0x20);
  auVar25._8_4_ = fVar19 * fRam0000000146e785b8 + 0.0;
  auVar25._12_4_ = (float)((ulong)uVar20 >> 0x20) * fRam0000000146e785bc + 0.0;
  auVar21._8_8_ = 0;
  auVar21._0_8_ = *(ulong *)(in_stack_00000028 + 1);
  iVar3 = *in_stack_00000028;
  auVar24._0_4_ = (iVar3 << 0x1f) >> 0x1f;
  auVar24._4_4_ = (iVar3 << 0x1f) >> 0x1f;
  auVar24._8_4_ = (iVar3 << 0x1f) >> 0x1f;
  auVar24._12_4_ = (iVar3 << 0x1f) >> 0x1f;
  auVar25 = ~auVar24 & auVar25 | auVar21 & auVar24;
  auVar28._0_8_ = CONCAT44(auVar25._4_4_,auVar25._4_4_);
  auVar28._8_4_ = auVar25._12_4_;
  auVar28._12_4_ = auVar25._12_4_;
  lVar9 = *(long *)(param_7 + 0x950);
  uVar8 = func_0x0001458c7b60(SUB168(auVar21 & auVar24,0),auVar25._0_8_,auVar28._0_8_);
  auVar26._8_8_ = extraout_XMM0_Qb;
  auVar26._0_8_ = extraout_XMM0_Qa;
  if ((uVar8 & 1) == 0) {
    if (*(long *)(lVar9 + 0x68) != -1) {
      func_0x0001458cc950(extraout_XMM0_Qa,extraout_XMM1_Qa,auVar25._0_8_,auVar28._0_8_);
      if ((int)local_c8 == 1) {
        auVar26 = ZEXT416(uStack_c0._4_4_);
        goto LAB_145928ce9;
      }
    }
    auVar26 = ZEXT416(*(uint *)(lVar9 + 0xb8));
  }
LAB_145928ce9:
  uVar4 = *(uint *)(param_6 + 0x20);
  uVar6 = *(int *)(param_7 + 0xa0c) + 1;
  *(uint *)(param_7 + 0xa0c) = uVar6;
  puVar17 = (undefined8 *)
            ((ulong)(uVar6 & 0xffffff) | (ulong)(uVar4 & 0xffffff) << 0x18 | 0xf130000000000000);
  local_e0 = 0;
  local_d0 = 0;
  puVar14 = puVar17;
  func_0x0001458a8ba0();
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_145928da3;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar2 < 2) - (2 < uVar2);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 9;
        goto LAB_145928ded;
      }
LAB_145928da3:
      if (lVar10 == 0) goto LAB_145928dbd;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145928dbd:
  local_b8 = 0;
  local_a8 = 2;
  puVar13 = (undefined8 *)0x9;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x0001458e1710();
LAB_145928ded:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar13 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar13;
        if (uVar8 == 0) goto LAB_145928e43;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        bVar16 = (uVar2 < 3) - (3 < uVar2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar13 = puVar14;
      if (bVar16 == 0) {
        *(uint *)(lVar9 + 8 + (long)puVar14 * 4) = uVar4;
        goto LAB_145928e86;
      }
LAB_145928e43:
      if (lVar10 == 0) goto LAB_145928e59;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar13 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145928e59:
  local_b8 = 0;
  local_a8 = 3;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar13;
  func_0x0001458e1710();
LAB_145928e86:
  fVar27 = *(float *)(param_6 + 0x28);
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_145928ee3;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 4) - (4 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 4 == 4 < uVar2) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = fVar27;
        puVar14 = (undefined8 *)0x0;
        goto LAB_145928f2a;
      }
LAB_145928ee3:
      if (lVar10 == 0) goto LAB_145928efb;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145928efb:
  puVar14 = (undefined8 *)(ulong)(uint)fVar27;
  local_b8 = 0;
  local_a8 = 4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_145928f2a:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_145928f83;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar2 < 0x16) - (0x16 < uVar2);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 100;
        goto LAB_145928fcd;
      }
LAB_145928f83:
      if (lVar10 == 0) goto LAB_145928f9d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145928f9d:
  local_b8 = 0;
  local_a8 = 0x16;
  puVar13 = (undefined8 *)0x64;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x0001458e1710();
LAB_145928fcd:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar13 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar13;
        if (uVar8 == 0) goto LAB_145929023;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        bVar16 = (uVar2 < 0x1c) - (0x1c < uVar2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar13 = puVar14;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = 100;
        goto LAB_14592906d;
      }
LAB_145929023:
      if (lVar10 == 0) goto LAB_14592903d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar13 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_14592903d:
  local_b8 = 0;
  local_a8 = 0x1c;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar13;
  func_0x0001458e1710();
LAB_14592906d:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1459290d3;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x22) - (0x22 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x22 == 0x22 < uVar2) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = *(undefined4 *)(param_7 + 0x4d8);
        goto LAB_145929113;
      }
LAB_1459290d3:
      if (lVar10 == 0) goto LAB_1459290e9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1459290e9:
  local_b8 = 0;
  local_a8 = 0x22;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_145929113:
  bVar16 = *(char *)(param_7 + 0x305) - 2;
  uVar7 = 1;
  if (bVar16 < 7) {
    uVar7 = *(undefined4 *)((ulong)bVar16 * 4 + 0x146e7b158);
  }
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_145929193;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x23) - (0x23 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x23 == 0x23 < uVar2) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = uVar7;
        goto LAB_1459291d3;
      }
LAB_145929193:
      if (lVar10 == 0) goto LAB_1459291a9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1459291a9:
  local_b8 = 0;
  local_a8 = 0x23;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_1459291d3:
  puVar14 = *(undefined8 **)(param_7 + 0x460);
  func_0x0001458a8ba0();
  func_0x0001458a8ba0();
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_145929263;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar2 < 0x2e) - (0x2e < uVar2);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 2;
        goto LAB_1459292ad;
      }
LAB_145929263:
      if (lVar10 == 0) goto LAB_14592927d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_14592927d:
  local_b8 = 0;
  local_a8 = 0x2e;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x0001458e1710();
LAB_1459292ad:
  fVar19 = *(float *)(param_6 + 0x30) * _DAT_145dbf5a4;
  uVar7 = (int)(long)fVar19;
  if (fVar19 < 0.0) {
    uVar7 = 0;
  }
  uVar12 = 0xffffffff;
  if (fVar19 <= _DAT_145d6d874) {
    uVar12 = uVar7;
  }
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_145929333;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x7e) - (0x7e < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x7e == 0x7e < uVar2) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = uVar12;
        goto LAB_145929373;
      }
LAB_145929333:
      if (lVar10 == 0) goto LAB_145929349;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145929349:
  local_b8 = 0;
  local_a8 = 0x7e;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_145929373:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1459293e3;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x81) - (0x81 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x81 == 0x81 < uVar2) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = _DAT_145d6d754 * fVar27;
        goto LAB_14592942a;
      }
LAB_1459293e3:
      if (lVar10 == 0) goto LAB_1459293fb;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1459293fb:
  local_b8 = 0;
  local_a8 = 0x81;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_14592942a:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_145929493;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x82) - (0x82 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x82 == 0x82 < uVar2) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = fVar27 * _DAT_145d9ae9c;
        puVar14 = (undefined8 *)0x0;
        goto LAB_1459294da;
      }
LAB_145929493:
      if (lVar10 == 0) goto LAB_1459294ab;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1459294ab:
  puVar14 = (undefined8 *)(ulong)(uint)(fVar27 * _DAT_145d9ae9c);
  local_b8 = 0;
  local_a8 = 0x82;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_1459294da:
  uVar4 = *(uint *)(param_6 + 0x24);
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar15 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_145929543;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar15 * 2);
        puVar15 = (undefined8 *)((long)puVar15 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x83) - (0x83 < uVar2)) == '\x01');
      puVar14 = puVar15;
      if (uVar2 < 0x83 == 0x83 < uVar2) {
        *(uint *)(lVar9 + 8 + (long)puVar15 * 4) = uVar4;
        goto LAB_145929586;
      }
LAB_145929543:
      if (lVar10 == 0) goto LAB_145929559;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_145929559:
  local_b8 = 0;
  local_a8 = 0x83;
  puVar15 = (undefined8 *)(ulong)uVar4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x0001458e1710();
LAB_145929586:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1459295e3;
        uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar2 < 0x84) - (0x84 < uVar2)) == '\x01');
      puVar15 = puVar14;
      if (uVar2 < 0x84 == 0x84 < uVar2) {
        *(uint *)(lVar9 + 8 + (long)puVar14 * 4) = uVar4;
        goto LAB_145929626;
      }
LAB_1459295e3:
      if (lVar10 == 0) goto LAB_1459295f9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1459295f9:
  local_b8 = 0;
  local_a8 = 0x84;
  puVar14 = (undefined8 *)(ulong)uVar4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x0001458e1710();
LAB_145929626:
  lVar9 = local_e0;
  if (local_e0 == 0) {
    lVar9 = 0;
LAB_14592969d:
    local_b8 = 0;
    local_a8 = 0x91;
    local_c8 = &local_e0;
    uStack_c0 = lVar9;
    puStack_b0 = puVar14;
    func_0x0001458e1710();
LAB_1459296cd:
    local_c8 = auVar25._0_8_;
    uStack_c0 = CONCAT44(uStack_c0._4_4_,auVar26._0_4_);
    local_91 = 1;
    func_0x0001458a7bf0();
    puStack_b0 = (undefined8 *)((ulong)uStack_104 << 0x20);
    local_b8 = 0;
    local_c8 = (long *)0x0;
    uStack_c0 = 1;
    local_91 = 0;
    func_0x0001458a83c0();
    lVar9 = *(long *)(param_7 + 0x5e0);
    if (lVar9 == *(long *)(param_7 + 0x5d0)) {
      func_0x000145bcb530();
    }
    uVar7 = auVar26._0_4_;
    uVar20 = auVar25._0_8_;
    lVar10 = *(long *)(param_7 + 0x5d8);
    puVar15 = (undefined8 *)(lVar10 + 0x10 + lVar9 * 0x20);
    *puVar15 = local_f0;
    puVar15[1] = uStack_e8;
    puVar15 = (undefined8 *)(lVar10 + lVar9 * 0x20);
    *puVar15 = local_100;
    puVar15[1] = uStack_f8;
    *(long *)(param_7 + 0x5e0) = lVar9 + 1;
    fVar27 = *(float *)(param_7 + 0x9ec);
    lVar9 = *(long *)(param_7 + 0xd8);
    if (lVar9 == *(long *)(param_7 + 200)) {
      local_91 = 0;
      func_0x000145bfb200();
      uVar7 = auVar26._0_4_;
      uVar20 = auVar25._0_8_;
    }
    lVar10 = *(long *)(param_7 + 0xd0);
    lVar11 = lVar9 * 0x78;
    *(undefined8 *)(lVar10 + 0x10 + lVar11) = param_9[2];
    uVar5 = param_9[1];
    *(undefined8 *)(lVar10 + lVar11) = *param_9;
    ((undefined8 *)(lVar10 + lVar11))[1] = uVar5;
    *(long *)(lVar10 + 0x18 + lVar11) = param_6;
    *(undefined8 **)(lVar10 + 0x20 + lVar11) = puVar17;
    puVar15 = (undefined8 *)(lVar10 + 0x28 + lVar11);
    *puVar15 = 0;
    puVar15[1] = 0;
    *(undefined4 *)(lVar10 + 0x38 + lVar11) = 0;
    *(undefined8 *)(lVar10 + 0x40 + lVar11) = uVar20;
    *(undefined4 *)(lVar10 + 0x48 + lVar11) = uVar7;
    *(undefined8 *)(lVar10 + 0x4c + lVar11) = uVar20;
    *(undefined4 *)(lVar10 + 0x54 + lVar11) = uVar7;
    fVar19 = fRam000000014603e774 + fRam0000000146e785c4;
    fVar22 = fVar27 + fRam0000000146e785c8;
    fVar23 = fVar27 + fRam0000000146e785cc;
    pfVar1 = (float *)(lVar10 + 0x58 + lVar11);
    *pfVar1 = fVar27 + _DAT_146e785c0;
    pfVar1[1] = fVar19;
    pfVar1[2] = fVar22;
    pfVar1[3] = fVar23;
    *(undefined4 *)(lVar10 + 0x68 + lVar11) = param_3;
    *(undefined8 *)(lVar10 + 0x6c + lVar11) = 0x3f800000;
    *(undefined4 *)(lVar10 + 0x74 + lVar11) = 0;
    *(long *)(param_7 + 0xd8) = lVar9 + 1;
    func_0x000145994a00();
    return puVar17;
  }
  do {
    puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
    uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
    puVar15 = (undefined8 *)0xffffffffffffffff;
    do {
      if (uVar8 == 0) goto LAB_145929683;
      uVar2 = *(ushort *)(lVar9 + 0x3a + (long)puVar15 * 2);
      puVar15 = (undefined8 *)((long)puVar15 + 1);
      uVar8 = uVar8 - 2;
    } while ((char)((uVar2 < 0x91) - (0x91 < uVar2)) == '\x01');
    puVar14 = puVar15;
    if (uVar2 < 0x91 == 0x91 < uVar2) {
      *(undefined4 *)(lVar9 + 8 + (long)puVar15 * 4) = 0x3f800000;
      goto LAB_1459296cd;
    }
LAB_145929683:
    bVar18 = local_d8 == 0;
    local_d8 = local_d8 + -1;
    if (bVar18) goto LAB_14592969d;
    lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
  } while( true );
}
