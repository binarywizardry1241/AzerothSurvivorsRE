void entry(ulong param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  uint uVar1;
  int iVar2;
  long lVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  uint uVar8;
  uint uVar9;
  uint *puVar10;
  long lVar11;
  int iVar12;
  ulong uVar13;
  uint *puVar14;
  uint *puVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  bool bVar19;

  lVar16 = *param_3;
  lVar7 = param_3[1];
  lVar3 = *param_5;
  lVar4 = param_5[1];
  uVar1 = *(uint *)((long)param_5 + 0x14);
  puVar15 = *(uint **)(lVar16 + 0xf8);
  puVar10 = puVar15 + *(long *)(lVar16 + 0x100);
  if (*(char *)(lVar16 + 0x108) == '\0') {
    uVar13 = 0;
    lVar18 = 8;
    lVar6 = 0;
    lVar11 = 0;
    uVar8 = 0;
LAB_140c0371e:
    do {
      uVar9 = uVar8;
      if (uVar8 == (uint)lVar11) {
        do {
          if (puVar15 == puVar10) goto LAB_140c037fd;
          uVar8 = *puVar15;
          puVar15 = puVar15 + 1;
          lVar11 = *(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0);
        } while (lVar11 == 0);
        lVar18 = *(long *)(lVar7 + 0x108) + (ulong)uVar8 * 0xa0;
        uVar5 = (ulong)*(uint *)(lVar18 + 0x94);
        if (*(ulong *)(lVar16 + 0x110) < *(ulong *)(*(long *)(lVar7 + 0x1a8) + 0x40 + uVar5 * 0x48))
        {
          lVar6 = *(long *)(lVar7 + 0x1a8) + uVar5 * 0x48;
          uVar5 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(lVar16 + 0x110) * 8);
          if (uVar5 == 0) goto LAB_140c037a5;
          lVar6 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar5 * 0x30);
        }
        else {
LAB_140c037a5:
          lVar6 = 0;
        }
        lVar18 = *(long *)(lVar18 + 0x50);
        uVar9 = 0;
      }
      uVar5 = *(ulong *)(lVar18 + (ulong)uVar9 * 0x10);
      if ((int)uVar5 == 0) {
        uVar8 = uVar9 + 1;
        goto LAB_140c0371e;
      }
      param_1 = uVar5 >> 0x20;
      uVar8 = uVar9 + 1;
    } while (((int)uVar5 == 0) ||
            (uVar8 = uVar9 + 1,
            *(char *)((ulong)~*(uint *)((ulong)uVar9 * 0x10 + lVar18 + 8) * 0x110 + lVar6 + 0x100)
            != '\x01'));
  }
  else {
    uVar13 = 0;
    lVar18 = 8;
    lVar6 = 0;
    lVar11 = 0;
    uVar8 = 0;
    do {
      if (uVar8 == (uint)lVar11) {
        do {
          if (puVar15 == puVar10) goto LAB_140c037fd;
          uVar8 = *puVar15;
          puVar15 = puVar15 + 1;
          lVar11 = *(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + (ulong)uVar8 * 0x48);
        } while (lVar11 == 0);
        lVar18 = *(long *)(lVar7 + 0x1a8) + (ulong)uVar8 * 0x48;
        if ((*(ulong *)(lVar16 + 0x110) < *(ulong *)(lVar18 + 0x40)) &&
           (uVar5 = *(ulong *)(*(long *)(lVar18 + 0x38) + *(ulong *)(lVar16 + 0x110) * 8),
           uVar5 != 0)) {
          lVar6 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar5 * 0x30);
        }
        else {
          lVar6 = 0;
        }
        lVar18 = *(long *)(lVar18 + 8);
        uVar8 = 0;
      }
      uVar17 = (ulong)uVar8;
      uVar8 = uVar8 + 1;
      uVar5 = *(ulong *)(lVar18 + uVar17 * 8);
      bVar19 = (int)uVar5 == 0;
      if (!bVar19) {
        param_1 = uVar5 >> 0x20;
      }
      param_1 = param_1 & 0xffffffff;
    } while ((bVar19) || (*(char *)(lVar6 + 0x100 + uVar17 * 0x110) == '\0'));
  }
  param_1 = param_1 << 0x20;
  uVar13 = uVar5 & 0xffffffff | param_1;
LAB_140c037fd:
  puVar14 = *(uint **)(lVar3 + 0xf8);
  puVar15 = puVar14 + *(long *)(lVar3 + 0x100);
  iVar12 = (int)uVar13;
  if (*(char *)(lVar3 + 0x108) == '\0') {
    lVar16 = 0;
    lVar11 = 8;
    lVar7 = 0;
    uVar8 = 0;
LAB_140c03901:
    do {
      if (uVar8 == (uint)lVar16) {
        do {
          if (puVar14 == puVar15) {
            return;
          }
          uVar8 = *puVar14;
          puVar14 = puVar14 + 1;
          lVar16 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0);
        } while (lVar16 == 0);
        lVar18 = *(long *)(lVar4 + 0x108) + (ulong)uVar8 * 0xa0;
        uVar5 = (ulong)*(uint *)(lVar18 + 0x94);
        lVar11 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x18 + uVar5 * 0x48);
        lVar6 = ~*(ulong *)(*(long *)(*(long *)(lVar4 + 0x1a8) + 0x38 + uVar5 * 0x48) +
                           *(long *)(lVar3 + 0x110) * 8) * 0x30;
        lVar7 = *(long *)(lVar11 + 0x10 + lVar6);
        param_1 = *(ulong *)(lVar11 + 0x28 + lVar6);
        lVar11 = *(long *)(lVar18 + 0x50);
        uVar8 = 0;
      }
      uVar5 = (ulong)uVar8;
      uVar8 = uVar8 + 1;
      uVar5 = (ulong)~*(uint *)(lVar11 + 8 + uVar5 * 0x10);
      iVar2 = *(int *)(lVar7 + uVar5 * 8);
      if (iVar2 == 0) goto LAB_140c038f0;
    } while ((iVar12 != 0) && (CONCAT44(*(undefined4 *)(lVar7 + 4 + uVar5 * 8),iVar2) == uVar13));
    goto LAB_140c038f5;
  }
  lVar16 = 0;
  lVar7 = 0;
  uVar8 = 0;
LAB_140c03841:
  do {
    if (uVar8 == (uint)lVar16) {
      do {
        if (puVar14 == puVar15) {
          return;
        }
        uVar8 = *puVar14;
        puVar14 = puVar14 + 1;
        lVar16 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar8 * 0x48);
      } while (lVar16 == 0);
      lVar7 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar8 * 0x48;
      lVar11 = *(long *)(lVar7 + 0x18);
      lVar6 = ~*(ulong *)(*(long *)(lVar7 + 0x38) + *(long *)(lVar3 + 0x110) * 8) * 0x30;
      lVar7 = *(long *)(lVar11 + 0x10 + lVar6);
      puVar10 = *(uint **)(lVar11 + 0x28 + lVar6);
      uVar8 = 0;
    }
    uVar5 = (ulong)uVar8;
    uVar8 = uVar8 + 1;
    iVar2 = *(int *)(lVar7 + uVar5 * 8);
    if (iVar2 == 0) goto LAB_140c03830;
  } while ((iVar12 != 0) && (CONCAT44(*(undefined4 *)(lVar7 + 4 + uVar5 * 8),iVar2) == uVar13));
  goto LAB_140c03835;
LAB_140c038f0:
  if (iVar12 != 0) {
LAB_140c038f5:
    *(uint *)(param_1 + uVar5 * 4) = uVar1;
    *(ulong *)(lVar7 + uVar5 * 8) = uVar13;
  }
  goto LAB_140c03901;
LAB_140c03830:
  if (iVar12 != 0) {
LAB_140c03835:
    puVar10[uVar5] = uVar1;
    *(ulong *)(lVar7 + uVar5 * 8) = uVar13;
  }
  goto LAB_140c03841;
}
