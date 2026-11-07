
/* WARNING: Removing unreachable block (ram,0x000140164c7f) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  uint *puVar1;
  char *pcVar2;
  bool bVar3;
  long lVar4;
  ulong uVar5;
  uint uVar6;
  long lVar7;
  long lVar8;
  undefined8 *in_R8;
  undefined8 *in_R9;
  long lVar9;
  uint *puVar10;
  long *in_stack_00000028;
  undefined4 uStack_204;
  
  pcVar2 = (char *)*in_R9;
  lVar7 = *in_stack_00000028;
  lVar4 = in_stack_00000028[1];
  if (*pcVar2 == '\0') {
LAB_140164b8f:
    bVar3 = false;
  }
  else {
    if ((*(char *)((long)*in_R8 + 0xd) == '\0') || (*(int *)*in_R8 != 0)) {
      uStack_204 = (undefined4)((ulong)in_R9[3] >> 0x20);
      *(undefined4 *)in_R9[2] = uStack_204;
      *pcVar2 = '\0';
      goto LAB_140164b8f;
    }
    bVar3 = true;
  }
  puVar10 = *(uint **)(lVar7 + 0xf8);
  lVar8 = *(long *)(lVar7 + 0x100) * 4;
  lVar9 = 0;
  if (*(char *)(lVar7 + 0x108) == '\0') {
    do {
      if (lVar8 - lVar9 == 0) goto LAB_140164c2d;
      puVar1 = (uint *)((long)puVar10 + lVar9);
      lVar9 = lVar9 + 4;
    } while (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)*puVar1 * 0xa0) == 0);
  }
  else {
    do {
      if (lVar8 - lVar9 == 0) goto LAB_140164c2d;
      puVar1 = (uint *)((long)puVar10 + lVar9);
      lVar9 = lVar9 + 4;
    } while (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) == 0);
  }
  if (bVar3) {
    return;
  }
LAB_140164c35:
  puVar1 = puVar10 + *(long *)(lVar7 + 0x100);
  if (*(char *)(lVar7 + 0x108) == '\0') {
LAB_140164da0:
    if (puVar10 != puVar1) {
      uVar6 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar7 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar6 * 0xa0);
      if (lVar7 != 0) {
        lVar8 = *(long *)(*(long *)(lVar4 + 0x108) + (ulong)uVar6 * 0xa0 + 0x50);
        uVar6 = 0;
        do {
          while (uVar5 = (ulong)uVar6, uVar6 = uVar6 + 1,
                (int)*(undefined8 *)(lVar8 + uVar5 * 0x10) == 0) {
            if (uVar6 == (uint)lVar7) goto LAB_140164da0;
          }
          func_0x0001450592f0();
        } while (uVar6 != (uint)lVar7);
      }
      goto LAB_140164da0;
    }
  }
  else {
LAB_140164cc0:
    if (puVar10 != puVar1) {
      uVar6 = *puVar10;
      puVar10 = puVar10 + 1;
      lVar7 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar6 * 0x48);
      if (lVar7 != 0) {
        lVar8 = *(long *)(*(long *)(lVar4 + 0x1a8) + (ulong)uVar6 * 0x48 + 8);
        uVar6 = 0;
        do {
          while (uVar5 = (ulong)uVar6, uVar6 = uVar6 + 1,
                (int)*(undefined8 *)(lVar8 + uVar5 * 8) == 0) {
            if (uVar6 == (uint)lVar7) goto LAB_140164cc0;
          }
          func_0x0001450592f0();
        } while (uVar6 != (uint)lVar7);
      }
      goto LAB_140164cc0;
    }
  }
  if (*pcVar2 == '\x01') {
    func_0x000140260700();
    func_0x0001402ec670();
  }
  return;
LAB_140164c2d:
  if (!bVar3) {
    return;
  }
  goto LAB_140164c35;
}

