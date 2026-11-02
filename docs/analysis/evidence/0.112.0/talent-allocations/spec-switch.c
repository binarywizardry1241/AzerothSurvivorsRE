ulong FUN_1458d2770(undefined8 param_1,undefined8 param_2,byte param_3,long param_4,ulong param_5)

{
  byte *pbVar1;
  undefined4 *puVar2;
  undefined8 *puVar3;
  ulong uVar4;
  code *pcVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  undefined8 unaff_R14;
  ulong uVar11;
  bool bVar12;
  bool bVar13;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  ulong uStack_88;
  ulong uStack_70;
  long lStack_68;
  long lStack_60;
  ulong uStack_58;

  uVar11 = 0;
  lVar6 = 0;
  do {
    if (*(long *)(param_4 + 0x88) * 0x50 == lVar6) goto LAB_1458d27d7;
    lVar8 = lVar6 + 0x50;
    pbVar1 = (byte *)(*(long *)(param_4 + 0x80) + lVar6);
    lVar6 = lVar8;
  } while (*pbVar1 != param_3);
  uVar11 = (ulong)*(byte *)(*(long *)(param_4 + 0x80) + -0x4f + lVar8);
LAB_1458d27d7:
  bVar12 = param_5 < 3;
  bVar13 = param_5 != uVar11;
  if (!bVar13 || !bVar12) goto LAB_1458d2b46;
  uVar10 = 0;
  lVar8 = 0;
  lVar6 = *(long *)(param_4 + 0x68);
  do {
    if (*(long *)(param_4 + 0x70) << 5 == lVar8) {
      lStack_68 = 8;
      uStack_58 = 0;
      goto LAB_1458d28dd;
    }
    lVar8 = lVar8 + 0x20;
    pbVar1 = (byte *)(lVar6 + 4);
    lVar6 = lVar6 + 0x20;
  } while (*pbVar1 != param_3);
  uVar10 = *(ulong *)(*(long *)(param_4 + 0x68) + -8 + lVar8);
  if (0x7ffffffffffffff8 < uVar10 << 4 || uVar10 >> 0x3c != 0) {
LAB_1458d2852:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (uVar10 << 4 == 0) {
    lStack_68 = 8;
    uStack_58 = 0;
    if (uVar10 != 0) goto LAB_1458d28b6;
LAB_1458d28da:
    uVar10 = 0;
  }
  else {
    func_0x000140002200();
    lStack_68 = func_0x0001400021c0();
    if (lStack_68 == 0) goto LAB_1458d2852;
    uStack_58 = uVar10;
    if (uVar10 == 0) goto LAB_1458d28da;
LAB_1458d28b6:
    func_0x000145c0a3db();
  }
LAB_1458d28dd:
  entry();
  lVar6 = *(long *)(param_4 + 0x80);
  uVar4 = *(ulong *)(param_4 + 0x88);
  if (uVar4 != 0) {
    uVar9 = 0;
    lVar8 = 0;
    do {
      if (*(byte *)(lVar6 + lVar8) == param_3) {
        if (uVar9 < uVar4) goto LAB_1458d29cf;
        goto LAB_1458d2b6c;
      }
      uVar9 = uVar9 + 1;
      lVar8 = lVar8 + 0x50;
    } while (uVar4 * 0x50 != lVar8);
  }
  uStack_e8._0_2_ = (ushort)param_3;
  if (uVar4 == *(ulong *)(param_4 + 0x78)) {
    func_0x000145c16860();
    lVar6 = *(long *)(param_4 + 0x80);
  }
  lVar8 = uVar4 * 0x50;
  puVar3 = (undefined8 *)(lVar6 + 0x40 + lVar8);
  *puVar3 = 8;
  puVar3[1] = 0;
  puVar3 = (undefined8 *)(lVar6 + 0x30 + lVar8);
  *puVar3 = 0;
  puVar3[1] = 0;
  puVar3 = (undefined8 *)(lVar6 + 0x20 + lVar8);
  *puVar3 = 0;
  puVar3[1] = 8;
  puVar3 = (undefined8 *)(lVar6 + 0x10 + lVar8);
  *puVar3 = 8;
  puVar3[1] = 0;
  puVar2 = (undefined4 *)(lVar6 + lVar8);
  *puVar2 = uStack_e8;
  puVar2[1] = uStack_e4;
  puVar2[2] = 0;
  puVar2[3] = 0;
  *(ulong *)(param_4 + 0x88) = uVar4 + 1;
  uVar9 = uVar4;
  if (uVar4 + 1 <= uVar4) {
LAB_1458d2b6c:
    func_0x000145da9883();
    goto LAB_1458d2bde;
  }
LAB_1458d29cf:
  if (2 < (uint)uVar11) {
    func_0x000145da9883();
    goto LAB_1458d2bde;
  }
  lVar8 = uVar9 * 0x50;
  lVar7 = *(long *)(param_4 + 0x80) + lVar8;
  lVar6 = lVar7 + uVar11 * 0x18;
  if (*(long *)(lVar7 + 8 + uVar11 * 0x18) != 0) {
    func_0x0001400021d0();
  }
  *(ulong *)(lVar6 + 8) = uStack_58;
  *(long *)(lVar6 + 0x10) = lStack_68;
  *(ulong *)(lVar6 + 0x18) = uVar10;
  if (uStack_88 << 4 < 0x7ffffffffffffff9 && uStack_88 >> 0x3c == 0) {
    if (uStack_88 << 4 == 0) {
      lStack_60 = 8;
      uStack_70 = 0;
    }
    else {
      func_0x000140002200();
      lStack_60 = func_0x0001400021c0();
      uStack_70 = uStack_88;
      if (lStack_60 == 0) goto LAB_1458d2a56;
    }
    if (uStack_88 != 0) {
      func_0x000145c0a3db();
    }
    if (uVar9 < *(ulong *)(param_4 + 0x88)) {
      lVar7 = *(long *)(param_4 + 0x80) + lVar8;
      lVar6 = lVar7 + param_5 * 0x18;
      if (*(long *)(lVar7 + 8 + param_5 * 0x18) != 0) {
        func_0x0001400021d0();
      }
      *(ulong *)(lVar6 + 8) = uStack_70;
      *(long *)(lVar6 + 0x10) = lStack_60;
      *(ulong *)(lVar6 + 0x18) = uStack_88;
      if (uVar9 < *(ulong *)(param_4 + 0x88)) {
        *(char *)(*(long *)(param_4 + 0x80) + 1 + lVar8) = (char)param_5;
        FUN_1458dda90();
LAB_1458d2b46:
        return CONCAT71((int7)((ulong)unaff_R14 >> 8),bVar13 && bVar12) & 0xffffffff;
      }
      func_0x000145da9883();
    }
    else {
      func_0x000145da9883();
    }
  }
  else {
LAB_1458d2a56:
    func_0x000145da94eb();
  }
LAB_1458d2bde:
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
