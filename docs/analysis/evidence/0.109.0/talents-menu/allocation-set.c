void FUN_1458a7b80(undefined8 param_1,undefined8 param_2,undefined4 param_3,long param_4,
                  undefined4 *param_5)

{
  byte *pbVar1;
  byte bVar2;
  code *pcVar3;
  ulong uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  long lVar9;
  uint uVar10;
  long lVar11;
  long lVar12;
  byte bVar13;
  undefined8 *puVar14;
  ulong uVar15;
  int iVar16;
  long lVar17;
  long lVar18;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined8 local_98;
  undefined8 local_90;
  long lStack_88;
  ulong local_80;
  long local_78;
  long local_70;
  ulong local_68;
  long local_60;
  long local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_98 = *(undefined8 *)(param_5 + 4);
  local_a8 = *param_5;
  uStack_a4 = param_5[1];
  uStack_a0 = param_5[2];
  uStack_9c = param_5[3];
  lVar17 = *(long *)(param_4 + 0x68);
  lVar12 = *(long *)(param_4 + 0x70);
  lVar18 = lVar12 * 0x20;
  uVar7 = 0;
  lVar11 = 0;
  do {
    bVar13 = (byte)param_3;
    if (lVar18 == lVar11) goto LAB_1458a7be8;
    lVar9 = lVar11 + 0x20;
    pbVar1 = (byte *)(lVar17 + 4 + lVar11);
    lVar11 = lVar9;
  } while (*pbVar1 != bVar13);
  uVar7 = *(uint *)(lVar17 + -0x20 + lVar9);
LAB_1458a7be8:
  uVar10 = 0x6e;
  iVar16 = 2;
  do {
    uVar5 = uVar7 - (uVar10 - 0x1e);
    if (uVar7 < uVar10 - 0x1e) {
      iVar16 = iVar16 + -2;
      goto LAB_1458a7c32;
    }
    uVar6 = uVar5 - (uVar10 - 0xf);
    if (uVar5 < uVar10 - 0xf) {
      iVar16 = iVar16 + -1;
      goto LAB_1458a7c32;
    }
    uVar7 = uVar6 - uVar10;
    if (uVar6 < uVar10) goto LAB_1458a7c32;
    uVar10 = uVar10 + 0x2d;
    iVar16 = iVar16 + 3;
  } while (uVar10 != 0x36b);
  iVar16 = 0x33;
LAB_1458a7c32:
  func_0x0001459106e0(param_1,param_4,&local_a8,&local_90,param_3,iVar16);
  uVar4 = local_80;
  lVar11 = *(long *)(param_4 + 0x88) * 0x50;
  pbVar1 = (byte *)(*(long *)(param_4 + 0x80) + -0x4f);
  do {
    pbVar8 = pbVar1;
    if (lVar11 == 0) goto LAB_1458a7d6e;
    lVar11 = lVar11 + -0x50;
    pbVar1 = pbVar8 + 0x50;
  } while (pbVar8[0x4f] != bVar13);
  local_58 = lStack_88;
  local_60 = lVar12;
  if (local_80 << 4 < 0x7ffffffffffffff9 && local_80 >> 0x3c == 0) {
    if (local_80 << 4 == 0) {
      local_70 = 8;
      local_68 = 0;
      uVar15 = local_68;
    }
    else {
      func_0x000140002200();
      local_70 = func_0x0001400021c0();
      uVar15 = uVar4;
      if (local_70 == 0) goto LAB_1458a7cb0;
    }
    local_68 = uVar15;
    if (uVar4 != 0) {
      func_0x000145bfa0e7();
    }
    bVar2 = pbVar8[0x50];
    uVar15 = (ulong)bVar2;
    if (uVar15 < 3) {
      lVar12 = (ulong)((uint)bVar2 * 8) * 3;
      if (*(long *)(pbVar8 + lVar12 + 0x57) != 0) {
        local_58 = lVar12;
        func_0x0001400021d0();
        lVar12 = local_58;
      }
      *(ulong *)(pbVar8 + lVar12 + 0x57) = local_68;
      *(long *)(pbVar8 + uVar15 * 0x18 + 0x5f) = local_70;
      *(ulong *)(pbVar8 + uVar15 * 0x18 + 0x67) = uVar4;
      lVar12 = local_60;
LAB_1458a7d6e:
      lVar9 = 0;
      lVar11 = lVar17;
      do {
        if (lVar18 == lVar9) {
          if (lVar12 == *(long *)(param_4 + 0x60)) {
            local_60 = local_90;
            local_58 = lStack_88;
            func_0x000145bfae10();
            lVar17 = *(long *)(param_4 + 0x68);
            lStack_88 = local_58;
            local_90 = local_60;
          }
          *(undefined4 *)(lVar17 + lVar18) = 0;
          *(byte *)(lVar17 + 4 + lVar18) = bVar13;
          *(long *)(lVar17 + 8 + lVar18) = local_90;
          *(long *)(lVar17 + 0x10 + lVar18) = lStack_88;
          *(ulong *)(lVar17 + 0x18 + lVar18) = local_80;
          *(long *)(param_4 + 0x70) = lVar12 + 1;
          return;
        }
        lVar9 = lVar9 + 0x20;
        pbVar1 = (byte *)(lVar11 + 4);
        lVar11 = lVar11 + 0x20;
      } while (*pbVar1 != bVar13);
      puVar14 = (undefined8 *)(lVar17 + lVar9 + -0x18);
      if (*(long *)(lVar17 + -0x18 + lVar9) != 0) {
        func_0x0001400021d0();
      }
      puVar14[2] = local_80;
      *puVar14 = local_90;
      puVar14[1] = lStack_88;
      return;
    }
    func_0x000145d99653();
  }
  else {
LAB_1458a7cb0:
    local_78 = local_58;
    local_49 = 1;
    func_0x000145d992bb();
  }
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
