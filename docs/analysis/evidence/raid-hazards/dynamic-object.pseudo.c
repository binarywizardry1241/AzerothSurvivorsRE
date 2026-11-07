/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,long param_4,
           undefined4 *param_5,ulong param_6)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  ushort uVar3;
  uint uVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  byte bVar11;
  bool bVar12;
  float extraout_XMM0_Da;
  float in_XMM3_Da;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  float fVar13;
  uint uStack_d4;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  long local_b0;
  long local_a8;
  undefined8 local_a0;
  long *local_98;
  long lStack_90;
  undefined8 local_88;
  ulong uStack_80;
  undefined8 local_78;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;
  undefined4 local_48;

  local_60 = 0xfffffffffffffffe;
  uVar4 = *(int *)(param_4 + 0xa78) + 1;
  *(uint *)(param_4 + 0xa78) = uVar4;
  uVar8 = (ulong)uVar4 | 0xf100000000000000;
  local_58 = in_XMM6_Da;
  local_48 = in_XMM7_Da;
  uVar5 = func_0x00014596ca90();
  fVar13 = _DAT_145dad260;
  if ((uVar5 & 1) != 0) {
    fVar13 = in_XMM3_Da / extraout_XMM0_Da;
  }
  local_b0 = 0;
  local_a0 = 0;
  uVar5 = uVar8;
  func_0x0001458c19b0();
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar5 = param_6;
        if (uVar10 == 0) goto LAB_14592bdb3;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar9 * 2);
        bVar11 = (uVar3 < 2) - (2 < uVar3);
        uVar5 = uVar9 + 1;
        uVar10 = uVar10 - 2;
        uVar9 = uVar5;
      } while (bVar11 == 1);
      param_6 = (ulong)bVar11;
      if (bVar11 == 0) {
        *(undefined4 *)(lVar6 + 8 + uVar5 * 4) = 0x41;
        goto LAB_14592bdfd;
      }
LAB_14592bdb3:
      if (lVar7 == 0) goto LAB_14592bdcd;
      lVar6 = *(long *)(lVar6 + 0x50 + uVar5 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592bdcd:
  local_88 = 0;
  local_78 = 2;
  uVar9 = 0x41;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = uVar5;
  func_0x0001458de1f0();
  uVar5 = uVar9;
LAB_14592bdfd:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar5 = param_6;
        if (uVar10 == 0) goto LAB_14592be53;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar9 * 2);
        bVar11 = (uVar3 < 3) - (3 < uVar3);
        uVar5 = uVar9 + 1;
        uVar10 = uVar10 - 2;
        uVar9 = uVar5;
      } while (bVar11 == 1);
      param_6 = (ulong)bVar11;
      if (bVar11 == 0) {
        *(undefined4 *)(lVar6 + 8 + uVar5 * 4) = param_3;
        goto LAB_14592be96;
      }
LAB_14592be53:
      if (lVar7 == 0) goto LAB_14592be69;
      lVar6 = *(long *)(lVar6 + 0x50 + uVar5 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592be69:
  local_88 = 0;
  local_78 = 3;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = uVar5;
  func_0x0001458de1f0();
LAB_14592be96:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar5 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
        if (uVar9 == 0) goto LAB_14592bef3;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar5 * 2);
        param_6 = uVar5 + 1;
        uVar9 = uVar9 - 2;
        uVar5 = param_6;
      } while ((char)((uVar3 < 4) - (4 < uVar3)) == '\x01');
      if (uVar3 < 4 == 4 < uVar3) {
        *(float *)(lVar6 + 8 + param_6 * 4) = fVar13;
        goto LAB_14592bf3a;
      }
LAB_14592bef3:
      if (lVar7 == 0) goto LAB_14592bf0b;
      lVar6 = *(long *)(lVar6 + 0x50 + param_6 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592bf0b:
  local_88 = 0;
  local_78 = 4;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = param_6;
  func_0x0001458de1f0();
LAB_14592bf3a:
  uVar5 = *(ulong *)(param_4 + 0x468);
  func_0x0001458c19b0();
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar5 = param_6;
        if (uVar10 == 0) goto LAB_14592bfb3;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar9 * 2);
        bVar11 = (uVar3 < 8) - (8 < uVar3);
        uVar5 = uVar9 + 1;
        uVar10 = uVar10 - 2;
        uVar9 = uVar5;
      } while (bVar11 == 1);
      param_6 = (ulong)bVar11;
      if (bVar11 == 0) {
        *(undefined4 *)(lVar6 + 8 + uVar5 * 4) = 1;
        goto LAB_14592bffd;
      }
LAB_14592bfb3:
      if (lVar7 == 0) goto LAB_14592bfcd;
      lVar6 = *(long *)(lVar6 + 0x50 + uVar5 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592bfcd:
  local_88 = 0;
  local_78 = 8;
  uVar9 = 1;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = uVar5;
  func_0x0001458de1f0();
  uVar5 = uVar9;
LAB_14592bffd:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
      uVar10 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar5 = param_6;
        if (uVar10 == 0) goto LAB_14592c053;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar9 * 2);
        bVar11 = (uVar3 < 9) - (9 < uVar3);
        uVar5 = uVar9 + 1;
        uVar10 = uVar10 - 2;
        uVar9 = uVar5;
      } while (bVar11 == 1);
      param_6 = (ulong)bVar11;
      if (bVar11 == 0) {
        *(undefined4 *)(lVar6 + 8 + uVar5 * 4) = param_3;
        goto LAB_14592c096;
      }
LAB_14592c053:
      if (lVar7 == 0) goto LAB_14592c069;
      lVar6 = *(long *)(lVar6 + 0x50 + uVar5 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592c069:
  local_88 = 0;
  local_78 = 9;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = uVar5;
  func_0x0001458de1f0();
LAB_14592c096:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar5 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
        if (uVar9 == 0) goto LAB_14592c0f3;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar5 * 2);
        param_6 = uVar5 + 1;
        uVar9 = uVar9 - 2;
        uVar5 = param_6;
      } while ((char)((uVar3 < 10) - (10 < uVar3)) == '\x01');
      if (uVar3 < 10 == 10 < uVar3) {
        *(float *)(lVar6 + 8 + param_6 * 4) = in_XMM3_Da;
        goto LAB_14592c13a;
      }
LAB_14592c0f3:
      if (lVar7 == 0) goto LAB_14592c10b;
      lVar6 = *(long *)(lVar6 + 0x50 + param_6 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592c10b:
  local_88 = 0;
  local_78 = 10;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = param_6;
  func_0x0001458de1f0();
LAB_14592c13a:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar5 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
        if (uVar9 == 0) goto LAB_14592c1a3;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar5 * 2);
        param_6 = uVar5 + 1;
        uVar9 = uVar9 - 2;
        uVar5 = param_6;
      } while ((char)((uVar3 < 0xb) - (0xb < uVar3)) == '\x01');
      if (uVar3 < 0xb == 0xb < uVar3) {
        *(undefined4 *)(lVar6 + 8 + param_6 * 4) = *param_5;
        goto LAB_14592c1ea;
      }
LAB_14592c1a3:
      if (lVar7 == 0) goto LAB_14592c1bb;
      lVar6 = *(long *)(lVar6 + 0x50 + param_6 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592c1bb:
  local_88 = 0;
  local_78 = 0xb;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = param_6;
  func_0x0001458de1f0();
LAB_14592c1ea:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar5 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
        if (uVar9 == 0) goto LAB_14592c253;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar5 * 2);
        param_6 = uVar5 + 1;
        uVar9 = uVar9 - 2;
        uVar5 = param_6;
      } while ((char)((uVar3 < 0xc) - (0xc < uVar3)) == '\x01');
      if (uVar3 < 0xc == 0xc < uVar3) {
        *(undefined4 *)(lVar6 + 8 + param_6 * 4) = param_5[1];
        goto LAB_14592c29a;
      }
LAB_14592c253:
      if (lVar7 == 0) goto LAB_14592c26b;
      lVar6 = *(long *)(lVar6 + 0x50 + param_6 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592c26b:
  local_88 = 0;
  local_78 = 0xc;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = param_6;
  func_0x0001458de1f0();
LAB_14592c29a:
  lVar6 = local_b0;
  lVar7 = local_a8;
  if (local_b0 != 0) {
    do {
      uVar9 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
      uVar5 = 0xffffffffffffffff;
      do {
        param_6 = (ulong)*(ushort *)(lVar6 + 0x36);
        if (uVar9 == 0) goto LAB_14592c303;
        uVar3 = *(ushort *)(lVar6 + 0x3a + uVar5 * 2);
        param_6 = uVar5 + 1;
        uVar9 = uVar9 - 2;
        uVar5 = param_6;
      } while ((char)((uVar3 < 0xd) - (0xd < uVar3)) == '\x01');
      if (uVar3 < 0xd == 0xd < uVar3) {
        *(undefined4 *)(lVar6 + 8 + param_6 * 4) = param_5[2];
        uVar5 = 0;
        goto LAB_14592c34a;
      }
LAB_14592c303:
      if (lVar7 == 0) goto LAB_14592c31b;
      lVar6 = *(long *)(lVar6 + 0x50 + param_6 * 8);
      lVar7 = lVar7 + -1;
    } while( true );
  }
  lVar6 = 0;
LAB_14592c31b:
  uVar5 = (ulong)(uint)param_5[2];
  local_88 = 0;
  local_78 = 0xd;
  local_98 = &local_b0;
  lStack_90 = lVar6;
  uStack_80 = param_6;
  func_0x0001458de1f0();
LAB_14592c34a:
  lVar6 = local_b0;
  if (local_b0 == 0) {
    lVar6 = 0;
LAB_14592c3bd:
    local_88 = 0;
    local_78 = 0xe;
    local_98 = &local_b0;
    lStack_90 = lVar6;
    uStack_80 = uVar5;
    func_0x0001458de1f0();
LAB_14592c3ea:
    local_61 = 1;
    func_0x0001458c0f20();
    local_88 = 0;
    uStack_80 = (ulong)uStack_d4 << 0x20;
    local_98 = (long *)0x0;
    lStack_90 = 1;
    local_61 = 0;
    func_0x0001458c1180();
    lVar6 = *(long *)(param_4 + 0x630);
    if (lVar6 == *(long *)(param_4 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar7 = *(long *)(param_4 + 0x628);
    puVar2 = (undefined4 *)(lVar7 + 0x10 + lVar6 * 0x20);
    *puVar2 = local_c0;
    puVar2[1] = uStack_bc;
    puVar2[2] = uStack_b8;
    puVar2[3] = uStack_b4;
    puVar1 = (undefined8 *)(lVar7 + lVar6 * 0x20);
    *puVar1 = local_d0;
    puVar1[1] = uStack_c8;
    *(long *)(param_4 + 0x630) = lVar6 + 1;
    func_0x0001459c3ba0();
    return uVar8;
  }
  do {
    uVar10 = (ulong)((uint)*(ushort *)(lVar6 + 0x36) * 2);
    uVar9 = 0xffffffffffffffff;
    do {
      uVar5 = (ulong)*(ushort *)(lVar6 + 0x36);
      if (uVar10 == 0) goto LAB_14592c3a3;
      uVar3 = *(ushort *)(lVar6 + 0x3a + uVar9 * 2);
      uVar5 = uVar9 + 1;
      uVar10 = uVar10 - 2;
      uVar9 = uVar5;
    } while ((char)((uVar3 < 0xe) - (0xe < uVar3)) == '\x01');
    if (uVar3 < 0xe == 0xe < uVar3) {
      *(undefined4 *)(lVar6 + 8 + uVar5 * 4) = 0;
      goto LAB_14592c3ea;
    }
LAB_14592c3a3:
    bVar12 = local_a8 == 0;
    local_a8 = local_a8 + -1;
    if (bVar12) goto LAB_14592c3bd;
    lVar6 = *(long *)(lVar6 + 0x50 + uVar5 * 8);
  } while( true );
}
