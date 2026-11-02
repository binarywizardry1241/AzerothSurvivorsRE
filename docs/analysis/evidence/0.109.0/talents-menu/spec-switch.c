ulong FUN_14589c630(undefined8 param_1,undefined8 param_2,byte param_3,long param_4,ulong param_5)

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
  undefined4 local_e8;
  undefined4 uStack_e4;
  ulong local_88;
  ulong local_70;
  long local_68;
  long local_60;
  ulong local_58;

  uVar11 = 0;
  lVar6 = 0;
  do {
    if (*(long *)(param_4 + 0x88) * 0x50 == lVar6) goto LAB_14589c697;
    lVar8 = lVar6 + 0x50;
    pbVar1 = (byte *)(*(long *)(param_4 + 0x80) + lVar6);
    lVar6 = lVar8;
  } while (*pbVar1 != param_3);
  uVar11 = (ulong)*(byte *)(*(long *)(param_4 + 0x80) + -0x4f + lVar8);
LAB_14589c697:
  bVar12 = param_5 < 3;
  bVar13 = param_5 != uVar11;
  if (!bVar13 || !bVar12) goto LAB_14589ca06;
  uVar10 = 0;
  lVar8 = 0;
  lVar6 = *(long *)(param_4 + 0x68);
  do {
    if (*(long *)(param_4 + 0x70) << 5 == lVar8) {
      local_68 = 8;
      local_58 = 0;
      goto LAB_14589c79d;
    }
    lVar8 = lVar8 + 0x20;
    pbVar1 = (byte *)(lVar6 + 4);
    lVar6 = lVar6 + 0x20;
  } while (*pbVar1 != param_3);
  uVar10 = *(ulong *)(*(long *)(param_4 + 0x68) + -8 + lVar8);
  if (0x7ffffffffffffff8 < uVar10 << 4 || uVar10 >> 0x3c != 0) {
LAB_14589c712:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (uVar10 << 4 == 0) {
    local_68 = 8;
    local_58 = 0;
    if (uVar10 != 0) goto LAB_14589c776;
LAB_14589c79a:
    uVar10 = 0;
  }
  else {
    func_0x000140002200();
    local_68 = func_0x0001400021c0();
    if (local_68 == 0) goto LAB_14589c712;
    local_58 = uVar10;
    if (uVar10 == 0) goto LAB_14589c79a;
LAB_14589c776:
    func_0x000145bfa0e7();
  }
LAB_14589c79d:
  FUN_14589c200();
  lVar6 = *(long *)(param_4 + 0x80);
  uVar4 = *(ulong *)(param_4 + 0x88);
  if (uVar4 != 0) {
    uVar9 = 0;
    lVar8 = 0;
    do {
      if (*(byte *)(lVar6 + lVar8) == param_3) {
        if (uVar9 < uVar4) goto LAB_14589c88f;
        goto LAB_14589ca2c;
      }
      uVar9 = uVar9 + 1;
      lVar8 = lVar8 + 0x50;
    } while (uVar4 * 0x50 != lVar8);
  }
  local_e8._0_2_ = (ushort)param_3;
  if (uVar4 == *(ulong *)(param_4 + 0x78)) {
    func_0x000145c26910();
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
  *puVar2 = local_e8;
  puVar2[1] = uStack_e4;
  puVar2[2] = 0;
  puVar2[3] = 0;
  *(ulong *)(param_4 + 0x88) = uVar4 + 1;
  uVar9 = uVar4;
  if (uVar4 + 1 <= uVar4) {
LAB_14589ca2c:
    func_0x000145d99653();
    goto LAB_14589ca9e;
  }
LAB_14589c88f:
  if (2 < (uint)uVar11) {
    func_0x000145d99653();
    goto LAB_14589ca9e;
  }
  lVar8 = uVar9 * 0x50;
  lVar7 = *(long *)(param_4 + 0x80) + lVar8;
  lVar6 = lVar7 + uVar11 * 0x18;
  if (*(long *)(lVar7 + 8 + uVar11 * 0x18) != 0) {
    func_0x0001400021d0();
  }
  *(ulong *)(lVar6 + 8) = local_58;
  *(long *)(lVar6 + 0x10) = local_68;
  *(ulong *)(lVar6 + 0x18) = uVar10;
  if (local_88 << 4 < 0x7ffffffffffffff9 && local_88 >> 0x3c == 0) {
    if (local_88 << 4 == 0) {
      local_60 = 8;
      local_70 = 0;
    }
    else {
      func_0x000140002200();
      local_60 = func_0x0001400021c0();
      local_70 = local_88;
      if (local_60 == 0) goto LAB_14589c916;
    }
    if (local_88 != 0) {
      func_0x000145bfa0e7();
    }
    if (uVar9 < *(ulong *)(param_4 + 0x88)) {
      lVar7 = *(long *)(param_4 + 0x80) + lVar8;
      lVar6 = lVar7 + param_5 * 0x18;
      if (*(long *)(lVar7 + 8 + param_5 * 0x18) != 0) {
        func_0x0001400021d0();
      }
      *(ulong *)(lVar6 + 8) = local_70;
      *(long *)(lVar6 + 0x10) = local_60;
      *(ulong *)(lVar6 + 0x18) = local_88;
      if (uVar9 < *(ulong *)(param_4 + 0x88)) {
        *(char *)(*(long *)(param_4 + 0x80) + 1 + lVar8) = (char)param_5;
        FUN_1458a7b80();
LAB_14589ca06:
        return CONCAT71((int7)((ulong)unaff_R14 >> 8),bVar13 && bVar12) & 0xffffffff;
      }
      func_0x000145d99653();
    }
    else {
      func_0x000145d99653();
    }
  }
  else {
LAB_14589c916:
    func_0x000145d992bb();
  }
LAB_14589ca9e:
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
