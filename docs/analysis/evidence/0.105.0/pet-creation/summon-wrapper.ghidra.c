
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,int param_5)

{
  long *plVar1;
  ulong *puVar2;
  uint *puVar3;
  long *plVar4;
  undefined4 *puVar5;
  char cVar6;
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
  ulong uVar18;
  long lVar19;
  long lVar20;
  long *plVar21;
  undefined1 uVar22;
  ulong uVar23;
  ulong uVar24;
  ulong uVar25;
  long lVar26;
  ulong uVar27;
  bool bVar28;
  float fVar29;
  float fVar30;
  float fVar31;
  float in_XMM3_Da;
  long in_stack_00000028;
  undefined4 in_stack_00000030;
  uint local_d8;
  undefined4 uStack_d4;
  float fStack_d0;
  uint uStack_cc;
  undefined8 local_c8;
  undefined8 uStack_c0;

  fVar30 = *(float *)(param_4 + 0x9ec);
  cVar6 = *(char *)(param_3 + 0x39);
  if (cVar6 == '\x06') {
    fVar29 = *(float *)(param_4 + 0x4a0) * _DAT_145d6d5c0;
    if (_DAT_146066890 < fVar29) {
      func_0x000145bc98dd((fVar29 + _DAT_146e78468) / _DAT_145d6d650);
    }
    func_0x000145927830();
  }
  fVar29 = _DAT_145d74048;
  uVar24 = *(ulong *)(param_4 + 0x958);
  uVar18 = *(ulong *)(param_4 + 0x960);
  uVar25 = *(ulong *)(param_4 + 0x970);
  uVar23 = *(ulong *)(param_4 + 0x968);
  do {
    lVar26 = ((uVar24 + uVar25) * 0x800000 | uVar24 + uVar25 >> 0x29) + uVar24;
    uVar27 = uVar18 << 0x11;
    uVar23 = uVar23 ^ uVar24;
    uVar25 = uVar25 ^ uVar18;
    uVar18 = uVar18 ^ uVar23;
    uVar24 = uVar24 ^ uVar25;
    uVar25 = uVar25 << 0x2d | uVar25 >> 0x13;
    uVar23 = uVar23 ^ uVar27;
    fVar31 = ((float)((uint)((ulong)lVar26 >> 0x29) | 0x3f800000) + _DAT_145d73d14) * _DAT_145d74048
    ;
  } while (_DAT_145d74048 <= fVar31);
  *(ulong *)(param_4 + 0x958) = uVar24;
  *(ulong *)(param_4 + 0x970) = uVar25;
  *(ulong *)(param_4 + 0x960) = uVar18;
  *(ulong *)(param_4 + 0x968) = uVar23;
  bVar28 = param_5 == 1;
  if (bVar28) {
    fStack_d0 = in_XMM3_Da + fVar30;
    local_c8 = in_stack_00000028;
  }
  func_0x000145928bd0(0,fVar29,fVar31 + 0.0);
  if (*(long *)(param_4 + 0xd8) != 0) {
    lVar26 = *(long *)(param_4 + 0xd0);
    lVar19 = *(long *)(param_4 + 0xd8) * 0x78;
    *(undefined4 *)(lVar26 + -0xc + lVar19) = in_stack_00000030;
    *(float *)(lVar26 + -4 + lVar19) = _DAT_145d6d36c + fVar30;
  }
  if (cVar6 == '\x06') {
    func_0x0001458b5100();
    lVar26 = *(long *)(param_4 + 0x5e0);
    if (lVar26 == *(long *)(param_4 + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar19 = *(long *)(param_4 + 0x5d8);
    local_d8 = (uint)bVar28;
    puVar5 = (undefined4 *)(lVar19 + 0x10 + lVar26 * 0x20);
    *puVar5 = (undefined4)local_c8;
    puVar5[1] = local_c8._4_4_;
    puVar5[2] = (undefined4)uStack_c0;
    puVar5[3] = uStack_c0._4_4_;
    puVar3 = (uint *)(lVar19 + lVar26 * 0x20);
    *puVar3 = local_d8;
    puVar3[1] = 0;
    puVar3[2] = (uint)fStack_d0;
    puVar3[3] = uStack_cc;
    *(long *)(param_4 + 0x5e0) = lVar26 + 1;
    lVar26 = *(long *)(param_4 + 0xd8) + -1;
    if (*(long *)(param_4 + 0xd8) == 0) {
      func_0x000145d697e3();
                    /* WARNING: Does not return */
      pcVar10 = (code *)invalidInstructionException();
      (*pcVar10)();
    }
    uVar7 = *(undefined8 *)(*(long *)(param_4 + 0xd0) + 0x18 + lVar26 * 0x78);
    fVar30 = *(float *)(param_4 + 0x4a0) * _DAT_145d6d5c0;
    if (_DAT_146066890 < fVar30) {
      func_0x000145bc98dd((fVar30 + _DAT_146e78468) / _DAT_145d6d650,lVar26);
    }
    func_0x000145925c80();
    plVar21 = (long *)CONCAT44(uStack_cc,fStack_d0);
    if (local_c8 != 0) {
      plVar4 = plVar21 + local_c8;
      lVar26 = param_4;
      do {
        lVar8 = *plVar21;
        func_0x000145950e90();
        uVar22 = *(undefined1 *)(lVar26 + 0x195);
        *(undefined1 *)(lVar26 + 0x195) = 2;
        uVar9 = *(undefined8 *)(lVar26 + 0x170);
        *(undefined8 *)(lVar26 + 0x170) = uVar7;
        uVar15 = *(undefined8 *)(param_4 + 0x140);
        uVar11 = *(undefined4 *)(param_4 + 0x148);
        uVar12 = *(undefined4 *)(param_4 + 0x14c);
        uVar13 = *(undefined8 *)(param_4 + 0x150);
        uVar14 = *(undefined8 *)(param_4 + 0x158);
        uVar16 = *(undefined8 *)(param_4 + 0x160);
        uVar17 = *(undefined8 *)(param_4 + 0x168);
        *(undefined8 *)(lVar26 + 0x140) = 0x146e7a9d0;
        *(undefined8 *)(lVar26 + 0x148) = 7;
        *(undefined8 *)(lVar26 + 0x150) = 0;
        *(undefined1 *)(lVar26 + 0x168) = 0;
        func_0x000145933ec0();
        plVar21 = plVar21 + 1;
        local_d8 = (uint)uVar15;
        uStack_d4 = (undefined4)((ulong)uVar15 >> 0x20);
        local_c8._0_4_ = (undefined4)uVar13;
        local_c8._4_4_ = (undefined4)((ulong)uVar13 >> 0x20);
        uStack_c0._0_4_ = (undefined4)uVar14;
        uStack_c0._4_4_ = (undefined4)((ulong)uVar14 >> 0x20);
        *(undefined8 *)(param_4 + 0x160) = uVar16;
        *(undefined8 *)(param_4 + 0x168) = uVar17;
        *(undefined4 *)(param_4 + 0x150) = (undefined4)local_c8;
        *(undefined4 *)(param_4 + 0x154) = local_c8._4_4_;
        *(undefined4 *)(param_4 + 0x158) = (undefined4)uStack_c0;
        *(undefined4 *)(param_4 + 0x15c) = uStack_c0._4_4_;
        *(uint *)(param_4 + 0x140) = local_d8;
        *(undefined4 *)(param_4 + 0x144) = uStack_d4;
        *(undefined4 *)(param_4 + 0x148) = uVar11;
        *(undefined4 *)(param_4 + 0x14c) = uVar12;
        *(undefined8 *)(lVar26 + 0x170) = uVar9;
        *(undefined1 *)(lVar26 + 0x195) = uVar22;
        lVar19 = *(long *)(lVar26 + 0x560);
        lVar20 = 0;
        do {
          if (*(long *)(lVar26 + 0x568) * 0x160 - lVar20 == 0) goto LAB_14594e9e7;
          lVar20 = lVar20 + 0x160;
          plVar1 = (long *)(lVar19 + 0x88);
          lVar19 = lVar19 + 0x160;
        } while (*plVar1 != lVar8);
        func_0x0001459251b0();
LAB_14594e9e7:
      } while (plVar21 != plVar4);
    }
    if ((ulong)bVar28 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    func_0x0001458b5100();
    lVar26 = *(long *)(param_4 + 0x5e0);
    if (lVar26 == *(long *)(param_4 + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar19 = *(long *)(param_4 + 0x5d8);
    plVar21 = (long *)(lVar19 + 0x10 + lVar26 * 0x20);
    *plVar21 = local_c8;
    plVar21[1] = uStack_c0;
    puVar2 = (ulong *)(lVar19 + lVar26 * 0x20);
    *puVar2 = (ulong)bVar28;
    puVar2[1] = CONCAT44(uStack_cc,fStack_d0);
    *(long *)(param_4 + 0x5e0) = lVar26 + 1;
  }
  return;
}
