
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5
          ,long param_6,long param_7,undefined8 param_8,undefined8 *param_9)

{
  undefined4 *puVar1;
  float *pfVar2;
  ushort uVar3;
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
  float fVar19;
  undefined4 extraout_XMM0_Da;
  float fVar20;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  float fVar21;
  float fVar22;
  undefined4 uVar23;
  uint uStack_104;
  undefined4 local_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 local_f0;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
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
  undefined4 local_78;

  local_90 = 0xfffffffffffffffe;
  fVar22 = param_3 + *(float *)(param_7 + 0x40c);
  puVar15 = param_9;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  fVar19 = (float)func_0x000145773247(fVar22);
  fVar22 = (float)func_0x000145773235(fVar22);
  fVar19 = fVar19 * _DAT_1469f5e30 + (float)*(undefined8 *)(param_7 + 0x400);
  fVar21 = fVar22 * fRam00000001469f5e34 + (float)((ulong)*(undefined8 *)(param_7 + 0x400) >> 0x20);
  lVar9 = *(long *)(param_7 + 0x898);
  uVar8 = func_0x00014552a140(fVar22,fVar19,fVar21);
  uVar23 = extraout_XMM0_Da;
  if ((uVar8 & 1) == 0) {
    if (*(long *)(lVar9 + 0x68) != -1) {
      func_0x00014552d220();
      if ((int)local_c8 == 1) {
        uVar23 = uStack_c0._4_4_;
        goto LAB_1454cab84;
      }
    }
    uVar23 = *(undefined4 *)(lVar9 + 0xb8);
  }
LAB_1454cab84:
  uVar4 = *(uint *)(param_6 + 0x10);
  uVar6 = *(int *)(param_7 + 0x954) + 1;
  *(uint *)(param_7 + 0x954) = uVar6;
  puVar17 = (undefined8 *)
            ((ulong)(uVar6 & 0xffffff) | (ulong)(uVar4 & 0xffffff) << 0x18 | 0xf130000000000000);
  local_e0 = 0;
  local_d0 = 0;
  puVar14 = puVar17;
  func_0x000145513710();
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_1454cac33;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar3 < 2) - (2 < uVar3);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 9;
        goto LAB_1454cac7d;
      }
LAB_1454cac33:
      if (lVar10 == 0) goto LAB_1454cac4d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cac4d:
  local_b8 = 0;
  local_a8 = 2;
  puVar13 = (undefined8 *)0x9;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x00014552a730();
LAB_1454cac7d:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar13 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar13;
        if (uVar8 == 0) goto LAB_1454cacd3;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        bVar16 = (uVar3 < 3) - (3 < uVar3);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar13 = puVar14;
      if (bVar16 == 0) {
        *(uint *)(lVar9 + 8 + (long)puVar14 * 4) = uVar4;
        goto LAB_1454cad16;
      }
LAB_1454cacd3:
      if (lVar10 == 0) goto LAB_1454cace9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar13 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cace9:
  local_b8 = 0;
  local_a8 = 3;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar13;
  func_0x00014552a730();
LAB_1454cad16:
  fVar22 = *(float *)(param_6 + 0x18);
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cad73;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 4) - (4 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 4 == 4 < uVar3) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = fVar22;
        puVar14 = (undefined8 *)0x0;
        goto LAB_1454cadba;
      }
LAB_1454cad73:
      if (lVar10 == 0) goto LAB_1454cad8b;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cad8b:
  puVar14 = (undefined8 *)(ulong)(uint)fVar22;
  local_b8 = 0;
  local_a8 = 4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cadba:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_1454cae13;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar3 < 0x16) - (0x16 < uVar3);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 100;
        goto LAB_1454cae5d;
      }
LAB_1454cae13:
      if (lVar10 == 0) goto LAB_1454cae2d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cae2d:
  local_b8 = 0;
  local_a8 = 0x16;
  puVar13 = (undefined8 *)0x64;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x00014552a730();
LAB_1454cae5d:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar13 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar13;
        if (uVar8 == 0) goto LAB_1454caeb3;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        bVar16 = (uVar3 < 0x1c) - (0x1c < uVar3);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar13 = puVar14;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = 100;
        goto LAB_1454caefd;
      }
LAB_1454caeb3:
      if (lVar10 == 0) goto LAB_1454caecd;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar13 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454caecd:
  local_b8 = 0;
  local_a8 = 0x1c;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar13;
  func_0x00014552a730();
LAB_1454caefd:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454caf63;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x22) - (0x22 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x22 == 0x22 < uVar3) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = *(undefined4 *)(param_7 + 0x410);
        goto LAB_1454cafa3;
      }
LAB_1454caf63:
      if (lVar10 == 0) goto LAB_1454caf79;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454caf79:
  local_b8 = 0;
  local_a8 = 0x22;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cafa3:
  bVar16 = *(char *)(param_7 + 0x29d) - 2;
  uVar7 = 1;
  if (bVar16 < 7) {
    uVar7 = *(undefined4 *)((ulong)bVar16 * 4 + 0x1469f8550);
  }
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cb023;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x23) - (0x23 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x23 == 0x23 < uVar3) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = uVar7;
        goto LAB_1454cb063;
      }
LAB_1454cb023:
      if (lVar10 == 0) goto LAB_1454cb039;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb039:
  local_b8 = 0;
  local_a8 = 0x23;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cb063:
  puVar14 = *(undefined8 **)(param_7 + 1000);
  func_0x000145513710();
  func_0x000145513710();
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar13 = (undefined8 *)0xffffffffffffffff;
      do {
        puVar15 = puVar14;
        if (uVar8 == 0) goto LAB_1454cb0f3;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar13 * 2);
        bVar16 = (uVar3 < 0x2e) - (0x2e < uVar3);
        puVar13 = (undefined8 *)((long)puVar13 + 1);
        uVar8 = uVar8 - 2;
      } while (bVar16 == 1);
      puVar15 = (undefined8 *)(ulong)bVar16;
      puVar14 = puVar13;
      if (bVar16 == 0) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar13 * 4) = 2;
        goto LAB_1454cb13d;
      }
LAB_1454cb0f3:
      if (lVar10 == 0) goto LAB_1454cb10d;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb10d:
  local_b8 = 0;
  local_a8 = 0x2e;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x00014552a730();
LAB_1454cb13d:
  fVar20 = *(float *)(param_6 + 0x20) * _DAT_145915918;
  uVar7 = (int)(long)fVar20;
  if (fVar20 < 0.0) {
    uVar7 = 0;
  }
  uVar12 = 0xffffffff;
  if (fVar20 <= _DAT_14590752c) {
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
        if (uVar8 == 0) goto LAB_1454cb1c3;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x7e) - (0x7e < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x7e == 0x7e < uVar3) {
        *(undefined4 *)(lVar9 + 8 + (long)puVar14 * 4) = uVar12;
        goto LAB_1454cb203;
      }
LAB_1454cb1c3:
      if (lVar10 == 0) goto LAB_1454cb1d9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb1d9:
  local_b8 = 0;
  local_a8 = 0x7e;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cb203:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cb273;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x81) - (0x81 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x81 == 0x81 < uVar3) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = _DAT_145907498 * fVar22;
        goto LAB_1454cb2ba;
      }
LAB_1454cb273:
      if (lVar10 == 0) goto LAB_1454cb28b;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb28b:
  local_b8 = 0;
  local_a8 = 0x81;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cb2ba:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cb323;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x82) - (0x82 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x82 == 0x82 < uVar3) {
        *(float *)(lVar9 + 8 + (long)puVar14 * 4) = fVar22 * _DAT_14594b3d8;
        puVar14 = (undefined8 *)0x0;
        goto LAB_1454cb36a;
      }
LAB_1454cb323:
      if (lVar10 == 0) goto LAB_1454cb33b;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb33b:
  puVar14 = (undefined8 *)(ulong)(uint)(fVar22 * _DAT_14594b3d8);
  local_b8 = 0;
  local_a8 = 0x82;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cb36a:
  uVar4 = *(uint *)(param_6 + 0x14);
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar15 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cb3d3;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar15 * 2);
        puVar15 = (undefined8 *)((long)puVar15 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x83) - (0x83 < uVar3)) == '\x01');
      puVar14 = puVar15;
      if (uVar3 < 0x83 == 0x83 < uVar3) {
        *(uint *)(lVar9 + 8 + (long)puVar15 * 4) = uVar4;
        goto LAB_1454cb416;
      }
LAB_1454cb3d3:
      if (lVar10 == 0) goto LAB_1454cb3e9;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb3e9:
  local_b8 = 0;
  local_a8 = 0x83;
  puVar15 = (undefined8 *)(ulong)uVar4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar14;
  func_0x00014552a730();
LAB_1454cb416:
  lVar9 = local_e0;
  lVar10 = local_d8;
  if (local_e0 != 0) {
    do {
      puVar15 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
      uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
      puVar14 = (undefined8 *)0xffffffffffffffff;
      do {
        if (uVar8 == 0) goto LAB_1454cb473;
        uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar14 * 2);
        puVar14 = (undefined8 *)((long)puVar14 + 1);
        uVar8 = uVar8 - 2;
      } while ((char)((uVar3 < 0x84) - (0x84 < uVar3)) == '\x01');
      puVar15 = puVar14;
      if (uVar3 < 0x84 == 0x84 < uVar3) {
        *(uint *)(lVar9 + 8 + (long)puVar14 * 4) = uVar4;
        goto LAB_1454cb4b6;
      }
LAB_1454cb473:
      if (lVar10 == 0) goto LAB_1454cb489;
      lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar15 * 8);
      lVar10 = lVar10 + -1;
    } while( true );
  }
  lVar9 = 0;
LAB_1454cb489:
  local_b8 = 0;
  local_a8 = 0x84;
  puVar14 = (undefined8 *)(ulong)uVar4;
  local_c8 = &local_e0;
  uStack_c0 = lVar9;
  puStack_b0 = puVar15;
  func_0x00014552a730();
LAB_1454cb4b6:
  lVar9 = local_e0;
  if (local_e0 == 0) {
    lVar9 = 0;
LAB_1454cb52d:
    local_b8 = 0;
    local_a8 = 0x91;
    local_c8 = &local_e0;
    uStack_c0 = lVar9;
    puStack_b0 = puVar14;
    func_0x00014552a730();
LAB_1454cb55d:
    local_c8 = (long *)CONCAT44(fVar21,fVar19);
    uStack_c0 = CONCAT44(uStack_c0._4_4_,uVar23);
    local_91 = 1;
    func_0x000145512720();
    local_b8 = 0;
    puStack_b0 = (undefined8 *)((ulong)uStack_104 << 0x20);
    local_c8 = (long *)0x0;
    uStack_c0 = 1;
    local_91 = 0;
    func_0x000145512ef0();
    lVar9 = *(long *)(param_7 + 0x560);
    if (lVar9 == *(long *)(param_7 + 0x550)) {
      func_0x000145774710();
    }
    lVar10 = *(long *)(param_7 + 0x558);
    puVar1 = (undefined4 *)(lVar10 + 0x10 + lVar9 * 0x20);
    *puVar1 = local_f0;
    puVar1[1] = uStack_ec;
    puVar1[2] = uStack_e8;
    puVar1[3] = uStack_e4;
    puVar1 = (undefined4 *)(lVar10 + lVar9 * 0x20);
    *puVar1 = local_100;
    puVar1[1] = uStack_fc;
    puVar1[2] = uStack_f8;
    puVar1[3] = uStack_f4;
    *(long *)(param_7 + 0x560) = lVar9 + 1;
    fVar22 = *(float *)(param_7 + 0x934);
    lVar9 = *(long *)(param_7 + 0xd8);
    if (lVar9 == *(long *)(param_7 + 200)) {
      local_91 = 0;
      func_0x000145780110();
    }
    lVar10 = *(long *)(param_7 + 0xd0);
    lVar11 = lVar9 * 0x60;
    *(undefined8 *)(lVar10 + 0x10 + lVar11) = param_9[2];
    uVar5 = param_9[1];
    *(undefined8 *)(lVar10 + lVar11) = *param_9;
    ((undefined8 *)(lVar10 + lVar11))[1] = uVar5;
    *(long *)(lVar10 + 0x18 + lVar11) = param_6;
    *(undefined8 **)(lVar10 + 0x20 + lVar11) = puVar17;
    *(undefined8 *)(lVar10 + 0x28 + lVar11) = 0;
    *(ulong *)(lVar10 + 0x30 + lVar11) = CONCAT44(fVar21,fVar19);
    *(undefined4 *)(lVar10 + 0x38 + lVar11) = uVar23;
    *(ulong *)(lVar10 + 0x3c + lVar11) = CONCAT44(fVar21,fVar19);
    *(undefined4 *)(lVar10 + 0x44 + lVar11) = uVar23;
    fVar19 = fRam0000000145a08224 + fRam00000001469f5e44;
    fVar21 = fVar22 + fRam00000001469f5e48;
    fVar20 = fVar22 + fRam00000001469f5e4c;
    pfVar2 = (float *)(lVar10 + 0x48 + lVar11);
    *pfVar2 = fVar22 + _DAT_1469f5e40;
    pfVar2[1] = fVar19;
    pfVar2[2] = fVar21;
    pfVar2[3] = fVar20;
    *(float *)(lVar10 + 0x58 + lVar11) = param_3;
    *(long *)(param_7 + 0xd8) = lVar9 + 1;
    func_0x00014550cd20();
    return;
  }
  do {
    puVar14 = (undefined8 *)(ulong)*(ushort *)(lVar9 + 0x36);
    uVar8 = (ulong)((uint)*(ushort *)(lVar9 + 0x36) * 2);
    puVar15 = (undefined8 *)0xffffffffffffffff;
    do {
      if (uVar8 == 0) goto LAB_1454cb513;
      uVar3 = *(ushort *)(lVar9 + 0x3a + (long)puVar15 * 2);
      puVar15 = (undefined8 *)((long)puVar15 + 1);
      uVar8 = uVar8 - 2;
    } while ((char)((uVar3 < 0x91) - (0x91 < uVar3)) == '\x01');
    puVar14 = puVar15;
    if (uVar3 < 0x91 == 0x91 < uVar3) {
      *(undefined4 *)(lVar9 + 8 + (long)puVar15 * 4) = 0x3f800000;
      goto LAB_1454cb55d;
    }
LAB_1454cb513:
    bVar18 = local_d8 == 0;
    local_d8 = local_d8 + -1;
    if (bVar18) goto LAB_1454cb52d;
    lVar9 = *(long *)(lVar9 + 0x50 + (long)puVar14 * 8);
  } while( true );
}
