
/* WARNING: Removing unreachable block (ram,0x0001402ded30) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  uint *puVar1;
  long lVar2;
  undefined4 *puVar3;
  bool bVar4;
  long lVar5;
  ulong uVar6;
  uint uVar7;
  long lVar8;
  long lVar9;
  undefined8 *in_R8;
  long *in_R9;
  long lVar10;
  uint *puVar11;
  long *in_stack_00000028;
  undefined4 uStack_264;
  
  lVar2 = *in_R9;
  puVar3 = (undefined4 *)in_R9[2];
  lVar8 = *in_stack_00000028;
  lVar5 = in_stack_00000028[1];
  uStack_264 = (undefined4)((ulong)in_R9[3] >> 0x20);
  if (*(char *)(lVar2 + 0x1b4) == '\0') {
LAB_1402dec58:
    bVar4 = false;
  }
  else {
    if ((*(char *)((long)*in_R8 + 0xd) == '\0') || (*(int *)*in_R8 != 0)) {
      *puVar3 = uStack_264;
      *(undefined1 *)(lVar2 + 0x1b4) = 0;
      goto LAB_1402dec58;
    }
    bVar4 = true;
  }
  puVar11 = *(uint **)(lVar8 + 0xf8);
  lVar9 = *(long *)(lVar8 + 0x100) * 4;
  lVar10 = 0;
  if (*(char *)(lVar8 + 0x108) == '\0') {
    do {
      if (lVar9 - lVar10 == 0) goto LAB_1402deced;
      puVar1 = (uint *)((long)puVar11 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)*puVar1 * 0xa0) == 0);
  }
  else {
    do {
      if (lVar9 - lVar10 == 0) goto LAB_1402deced;
      puVar1 = (uint *)((long)puVar11 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) == 0);
  }
  if (bVar4) {
    return;
  }
LAB_1402decf5:
  puVar1 = puVar11 + *(long *)(lVar8 + 0x100);
  if (*(char *)(lVar8 + 0x108) == '\0') {
LAB_1402dee50:
    if (puVar11 != puVar1) {
      uVar7 = *puVar11;
      puVar11 = puVar11 + 1;
      lVar8 = *(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar7 * 0xa0);
      if (lVar8 != 0) {
        lVar9 = *(long *)(*(long *)(lVar5 + 0x108) + (ulong)uVar7 * 0xa0 + 0x50);
        uVar7 = 0;
        do {
          while (uVar6 = (ulong)uVar7, uVar7 = uVar7 + 1,
                (int)*(undefined8 *)(lVar9 + uVar6 * 0x10) == 0) {
            if (uVar7 == (uint)lVar8) goto LAB_1402dee50;
          }
          func_0x0001450b3990();
        } while (uVar7 != (uint)lVar8);
      }
      goto LAB_1402dee50;
    }
  }
  else {
LAB_1402ded70:
    if (puVar11 != puVar1) {
      uVar7 = *puVar11;
      puVar11 = puVar11 + 1;
      lVar8 = *(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar7 * 0x48);
      if (lVar8 != 0) {
        lVar9 = *(long *)(*(long *)(lVar5 + 0x1a8) + (ulong)uVar7 * 0x48 + 8);
        uVar7 = 0;
        do {
          while (uVar6 = (ulong)uVar7, uVar7 = uVar7 + 1,
                (int)*(undefined8 *)(lVar9 + uVar6 * 8) == 0) {
            if (uVar7 == (uint)lVar8) goto LAB_1402ded70;
          }
          func_0x0001450b3990();
        } while (uVar7 != (uint)lVar8);
      }
      goto LAB_1402ded70;
    }
  }
  if (*(char *)(lVar2 + 0x1b4) == '\x01') {
    *(undefined8 *)(lVar2 + 0x1a0) = 0;
    *puVar3 = uStack_264;
    *(long *)(lVar2 + 0x1a8) = *(long *)(lVar2 + 0x1a8) + 1;
    func_0x00014030e4a0();
    func_0x0001403358e0();
  }
  return;
LAB_1402deced:
  if (!bVar4) {
    return;
  }
  goto LAB_1402decf5;
}

