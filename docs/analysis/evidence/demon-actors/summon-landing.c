
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,int param_5)

{
  long *plVar1;
  ulong *puVar2;
  uint *puVar3;
  long *plVar4;
  undefined4 *puVar5;
  byte bVar6;
  undefined8 uVar7;
  long lVar8;
  undefined8 uVar9;
  code *pcVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  bool bVar18;
  ulong uVar19;
  ulong uVar20;
  long lVar21;
  long lVar22;
  long *plVar23;
  undefined1 uVar24;
  ulong uVar25;
  ulong uVar26;
  ulong uVar27;
  ulong uVar28;
  ulong uVar29;
  long lVar30;
  float fVar31;
  float fVar32;
  float fVar33;
  float fVar34;
  undefined1 auVar36 [16];
  float in_XMM3_Da;
  long in_stack_00000028;
  undefined4 in_stack_00000030;
  uint local_d8;
  undefined4 uStack_d4;
  float fStack_d0;
  uint uStack_cc;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined1 auVar35 [16];

  fVar31 = _DAT_145db17a0;
  fVar33 = *(float *)(param_4 + 0xa4c);
  bVar6 = *(byte *)(param_3 + 0x39);
  if (bVar6 == 6) {
    fVar31 = *(float *)(param_4 + 0x4a8) * _DAT_145db14e0;
    if (_DAT_1460b3fa8 < fVar31) {
      func_0x000145c0a53d((fVar31 + _DAT_146c08c20) / _DAT_145db14c0);
    }
    func_0x00014592cd30();
  }
  else if (bVar6 < 5) {
    uVar26 = *(ulong *)(param_4 + 0x9b8);
    uVar20 = *(ulong *)(param_4 + 0x9c0);
    uVar27 = *(ulong *)(param_4 + 0x9d0);
    uVar19 = *(ulong *)(param_4 + 0x9c8);
    do {
      lVar30 = ((uVar26 + uVar27) * 0x800000 | uVar26 + uVar27 >> 0x29) + uVar26;
      uVar25 = uVar20 << 0x11;
      uVar19 = uVar19 ^ uVar26;
      uVar27 = uVar27 ^ uVar20;
      uVar20 = uVar20 ^ uVar19;
      uVar26 = uVar26 ^ uVar27;
      uVar27 = uVar27 << 0x2d | uVar27 >> 0x13;
      uVar19 = uVar19 ^ uVar25;
      fVar34 = ((float)((uint)((ulong)lVar30 >> 0x29) | 0x3f800000) + _DAT_145db1368) *
               _DAT_145db17a0;
    } while (_DAT_145db17a0 <= fVar34);
    fVar32 = 0.0;
    uVar25 = (ulong)(uint)(fVar34 + 0.0);
    *(ulong *)(param_4 + 0x9b8) = uVar26;
    *(ulong *)(param_4 + 0x9d0) = uVar27;
    *(ulong *)(param_4 + 0x9c0) = uVar20;
    *(ulong *)(param_4 + 0x9c8) = uVar19;
    goto joined_r0x000145959db8;
  }
  uVar26 = *(ulong *)(param_4 + 0x9b8);
  uVar20 = *(ulong *)(param_4 + 0x9c0);
  uVar27 = *(ulong *)(param_4 + 0x9d0);
  uVar25 = *(ulong *)(param_4 + 0x9c8) ^ uVar26;
  uVar28 = uVar25 ^ uVar20;
  uVar19 = uVar20 ^ uVar27;
  *(ulong *)(param_4 + 0x9c0) = uVar28;
  uVar29 = uVar19 ^ uVar26;
  *(ulong *)(param_4 + 0x9b8) = uVar29;
  uVar25 = uVar25 ^ uVar20 << 0x11;
  *(ulong *)(param_4 + 0x9c8) = uVar25;
  uVar20 = uVar19 << 0x2d | uVar19 >> 0x13;
  *(ulong *)(param_4 + 0x9d0) = uVar20;
  fVar31 = _DAT_146c08ec8;
  fVar32 = _DAT_145db1368;
  do {
    lVar30 = ((uVar29 + uVar20) * 0x800000 | uVar29 + uVar20 >> 0x29) + uVar29;
    uVar19 = uVar28 << 0x11;
    uVar25 = uVar25 ^ uVar29;
    uVar20 = uVar20 ^ uVar28;
    uVar28 = uVar28 ^ uVar25;
    uVar29 = uVar29 ^ uVar20;
    uVar25 = uVar25 ^ uVar19;
    uVar20 = uVar20 << 0x2d | uVar20 >> 0x13;
    fVar34 = ((float)((uint)((ulong)lVar30 >> 0x29) | 0x3f800000) + _DAT_145db1368) * _DAT_146c08ec8
             + _DAT_145db6b3c;
    auVar35 = ZEXT416((uint)fVar34);
  } while (_DAT_145f4bd88 <= fVar34);
  uVar27 = uVar27 + uVar26;
  *(ulong *)(param_4 + 0x9b8) = uVar29;
  *(ulong *)(param_4 + 0x9d0) = uVar20;
  *(ulong *)(param_4 + 0x9c0) = uVar28;
  *(ulong *)(param_4 + 0x9c8) = uVar25;
  if (-1 < (long)((uVar27 * 0x800000 | uVar27 >> 0x29) + uVar26)) {
    auVar35._0_4_ = (uint)fVar34 ^ _DAT_145dad550;
    auVar35._4_4_ = uRam0000000145dad554;
    auVar35._8_4_ = uRam0000000145dad558;
    auVar35._12_4_ = uRam0000000145dad55c;
  }
  auVar36._4_12_ = auVar35._4_12_;
  auVar36._0_4_ = auVar35._0_4_ * _DAT_145dbaea0;
  uVar25 = auVar36._0_8_;
joined_r0x000145959db8:
  bVar18 = param_5 == 1;
  if (bVar18) {
    fStack_d0 = in_XMM3_Da + fVar33;
    local_c8 = in_stack_00000028;
  }
  func_0x00014592e380(fVar32,fVar31,uVar25);
  if (*(long *)(param_4 + 0xd8) != 0) {
    lVar30 = *(long *)(param_4 + 0xd0);
    lVar21 = *(long *)(param_4 + 0xd8) * 0x80;
    *(undefined4 *)(lVar30 + -0x10 + lVar21) = in_stack_00000030;
    *(float *)(lVar30 + -8 + lVar21) = _DAT_145dad260 + fVar33;
  }
  if (bVar6 == 6) {
    func_0x0001458ce7d0();
    lVar30 = *(long *)(param_4 + 0x630);
    if (lVar30 == *(long *)(param_4 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar21 = *(long *)(param_4 + 0x628);
    local_d8 = (uint)bVar18;
    puVar5 = (undefined4 *)(lVar21 + 0x10 + lVar30 * 0x20);
    *puVar5 = (undefined4)local_c8;
    puVar5[1] = local_c8._4_4_;
    puVar5[2] = (undefined4)uStack_c0;
    puVar5[3] = uStack_c0._4_4_;
    puVar3 = (uint *)(lVar21 + lVar30 * 0x20);
    *puVar3 = local_d8;
    puVar3[1] = 0;
    puVar3[2] = (uint)fStack_d0;
    puVar3[3] = uStack_cc;
    *(long *)(param_4 + 0x630) = lVar30 + 1;
    lVar30 = *(long *)(param_4 + 0xd8) + -1;
    if (*(long *)(param_4 + 0xd8) == 0) {
      func_0x000145da9883();
                    /* WARNING: Does not return */
      pcVar10 = (code *)invalidInstructionException();
      (*pcVar10)();
    }
    uVar7 = *(undefined8 *)(*(long *)(param_4 + 0xd0) + 0x18 + lVar30 * 0x80);
    fVar33 = *(float *)(param_4 + 0x4a8) * _DAT_145db14e0;
    if (_DAT_1460b3fa8 < fVar33) {
      func_0x000145c0a53d((fVar33 + _DAT_146c08c20) / _DAT_145db14c0,lVar30);
    }
    func_0x00014592b2f0();
    plVar23 = (long *)CONCAT44(uStack_cc,fStack_d0);
    if (local_c8 != 0) {
      plVar4 = plVar23 + local_c8;
      lVar30 = param_4;
      do {
        lVar8 = *plVar23;
        func_0x00014595c200();
        uVar24 = *(undefined1 *)(lVar30 + 0x1ad);
        *(undefined1 *)(lVar30 + 0x1ad) = 2;
        uVar9 = *(undefined8 *)(lVar30 + 0x188);
        *(undefined8 *)(lVar30 + 0x188) = uVar7;
        uVar15 = *(undefined8 *)(param_4 + 0x158);
        uVar11 = *(undefined4 *)(param_4 + 0x160);
        uVar12 = *(undefined4 *)(param_4 + 0x164);
        uVar13 = *(undefined8 *)(param_4 + 0x168);
        uVar14 = *(undefined8 *)(param_4 + 0x170);
        uVar16 = *(undefined8 *)(param_4 + 0x178);
        uVar17 = *(undefined8 *)(param_4 + 0x180);
        *(undefined8 *)(lVar30 + 0x158) = 0x146c0b790;
        *(undefined8 *)(lVar30 + 0x160) = 7;
        *(undefined8 *)(lVar30 + 0x168) = 0;
        *(undefined2 *)(lVar30 + 0x180) = 0;
        func_0x00014593ec90();
        plVar23 = plVar23 + 1;
        local_d8 = (uint)uVar15;
        uStack_d4 = (undefined4)((ulong)uVar15 >> 0x20);
        local_c8._0_4_ = (undefined4)uVar13;
        local_c8._4_4_ = (undefined4)((ulong)uVar13 >> 0x20);
        uStack_c0._0_4_ = (undefined4)uVar14;
        uStack_c0._4_4_ = (undefined4)((ulong)uVar14 >> 0x20);
        *(undefined8 *)(param_4 + 0x178) = uVar16;
        *(undefined8 *)(param_4 + 0x180) = uVar17;
        *(undefined4 *)(param_4 + 0x168) = (undefined4)local_c8;
        *(undefined4 *)(param_4 + 0x16c) = local_c8._4_4_;
        *(undefined4 *)(param_4 + 0x170) = (undefined4)uStack_c0;
        *(undefined4 *)(param_4 + 0x174) = uStack_c0._4_4_;
        *(uint *)(param_4 + 0x158) = local_d8;
        *(undefined4 *)(param_4 + 0x15c) = uStack_d4;
        *(undefined4 *)(param_4 + 0x160) = uVar11;
        *(undefined4 *)(param_4 + 0x164) = uVar12;
        *(undefined8 *)(lVar30 + 0x188) = uVar9;
        *(undefined1 *)(lVar30 + 0x1ad) = uVar24;
        lVar21 = *(long *)(lVar30 + 0x568);
        lVar22 = 0;
        do {
          if (*(long *)(lVar30 + 0x570) * 0x1d8 - lVar22 == 0) goto LAB_14595a137;
          lVar22 = lVar22 + 0x1d8;
          plVar1 = (long *)(lVar21 + 0xf0);
          lVar21 = lVar21 + 0x1d8;
        } while (*plVar1 != lVar8);
        func_0x00014592a820();
LAB_14595a137:
      } while (plVar23 != plVar4);
    }
    if ((ulong)bVar18 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    func_0x0001458ce7d0();
    lVar30 = *(long *)(param_4 + 0x630);
    if (lVar30 == *(long *)(param_4 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar21 = *(long *)(param_4 + 0x628);
    plVar23 = (long *)(lVar21 + 0x10 + lVar30 * 0x20);
    *plVar23 = local_c8;
    plVar23[1] = uStack_c0;
    puVar2 = (ulong *)(lVar21 + lVar30 * 0x20);
    *puVar2 = (ulong)bVar18;
    puVar2[1] = CONCAT44(uStack_cc,fStack_d0);
    *(long *)(param_4 + 0x630) = lVar30 + 1;
  }
  return;
}
