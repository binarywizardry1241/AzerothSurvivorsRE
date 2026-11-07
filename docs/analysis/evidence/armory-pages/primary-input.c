void entry(undefined8 param_1,undefined8 param_2,long *param_3)

{
  uint *puVar1;
  char cVar2;
  int iVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  uint uVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  undefined8 *puVar11;
  uint *puVar12;
  uint *puVar13;
  uint uVar14;
  long lVar15;
  undefined8 uVar16;
  long lVar17;
  long local_98;

  lVar4 = *param_3;
  lVar5 = param_3[1];
  iVar3 = *(int *)((long)param_3 + 0x14);
  uVar7 = iVar3 - (int)param_3[2];
  uVar14 = 0xc233b000;
  if (uVar7 < 0xc233b000) {
    uVar14 = uVar7;
  }
  puVar13 = *(uint **)(lVar4 + 0xf8);
  puVar1 = puVar13 + *(long *)(lVar4 + 0x100);
  cVar2 = *(char *)(lVar4 + 0x108);
  lVar6 = 0;
  lVar15 = 8;
  uVar16 = 0;
  uVar9 = 0;
  local_98 = 0;
  lVar17 = 0;
  do {
    if (cVar2 == '\0') {
      do {
        if ((int)uVar9 == (int)uVar16) {
          if (puVar13 == puVar1) {
            return;
          }
          uVar7 = *puVar13;
          puVar13 = puVar13 + 1;
          if (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar7 * 0xa0) == 0) {
            do {
              if (puVar13 == puVar1) {
                return;
              }
              uVar7 = *puVar13;
              puVar13 = puVar13 + 1;
            } while (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar7 * 0xa0) == 0);
            lVar15 = *(long *)(lVar5 + 0x108) + (ulong)uVar7 * 0xa0;
          }
          else {
            lVar15 = *(long *)(lVar5 + 0x108) + (ulong)uVar7 * 0xa0;
          }
          puVar11 = (undefined8 *)(lVar15 + 0x58);
          lVar6 = *(long *)(lVar5 + 0x1a8) + (ulong)*(uint *)(lVar15 + 0x94) * 0x48;
          uVar9 = *(ulong *)(*(long *)(lVar5 + 0x1a8) + 0x40 +
                            (ulong)*(uint *)(lVar15 + 0x94) * 0x48);
          if ((*(ulong *)(lVar4 + 0x110) < uVar9) &&
             (uVar10 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar10 != 0)) {
            lVar17 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar10 * 0x30);
            uVar10 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 <= uVar10) goto LAB_140161d60;
LAB_140161e93:
            uVar9 = *(ulong *)(*(long *)(lVar6 + 0x38) + uVar10 * 8);
            if (uVar9 == 0) goto LAB_140161d60;
            local_98 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar17 = 0;
            uVar10 = *(ulong *)(lVar4 + 0x118);
            if (uVar10 < uVar9) goto LAB_140161e93;
LAB_140161d60:
            local_98 = 0;
          }
          lVar6 = func_0x000144e4f270(puVar13,lVar15,*(undefined8 *)(lVar4 + 0x120));
          lVar15 = *(long *)(lVar15 + 0x50);
          uVar16 = *puVar11;
          uVar9 = 0;
        }
        lVar8 = uVar9 * 0x10;
        uVar9 = (ulong)((int)uVar9 + 1);
        uVar10 = (ulong)~*(uint *)(lVar15 + 8 + lVar8);
      } while (uVar14 <= (uint)(iVar3 - *(int *)(lVar6 + uVar10 * 4)));
    }
    else {
      do {
        uVar10 = uVar9;
        if ((int)uVar10 == (int)uVar16) {
          if (puVar13 == puVar1) {
            return;
          }
          uVar9 = (ulong)*puVar13;
          puVar13 = puVar13 + 1;
          lVar17 = *(long *)(lVar5 + 0x1a8);
          if (*(long *)(lVar17 + 0x10 + uVar9 * 0x48) == 0) {
            do {
              if (puVar13 == puVar1) {
                return;
              }
              uVar7 = *puVar13;
              puVar13 = puVar13 + 1;
            } while (*(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar7 * 0x48) == 0);
            lVar6 = *(long *)(lVar5 + 0x1a8) + (ulong)uVar7 * 0x48;
            lVar17 = lVar6;
          }
          else {
            lVar6 = lVar17 + uVar9 * 0x48;
            lVar17 = lVar17 + uVar9 * 0x48;
          }
          puVar11 = (undefined8 *)(lVar17 + 0x10);
          uVar9 = *(ulong *)(lVar6 + 0x40);
          if ((*(ulong *)(lVar4 + 0x110) < uVar9) &&
             (uVar10 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar10 != 0)) {
            lVar17 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar10 * 0x30);
            uVar10 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 <= uVar10) goto LAB_140161ed0;
LAB_140161ff3:
            uVar9 = *(ulong *)(*(long *)(lVar6 + 0x38) + uVar10 * 8);
            if (uVar9 == 0) goto LAB_140161ed0;
            local_98 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar17 = 0;
            uVar10 = *(ulong *)(lVar4 + 0x118);
            if (uVar10 < uVar9) goto LAB_140161ff3;
LAB_140161ed0:
            local_98 = 0;
          }
          lVar6 = func_0x000144e4f270(puVar13,puVar11,*(undefined8 *)(lVar4 + 0x120));
          uVar16 = *puVar11;
          uVar10 = 0;
        }
        uVar9 = (ulong)((int)uVar10 + 1);
      } while (uVar14 <= (uint)(iVar3 - *(int *)(lVar6 + uVar10 * 4)));
    }
    puVar12 = (uint *)(uVar10 * 0x10 + local_98);
    if ((char *)(lVar17 + uVar10) == (char *)0x0) {
      return;
    }
    if (*(char *)(lVar17 + uVar10) == '\0') {
      func_0x0001458a3e40();
      uVar9 = (ulong)(*puVar12 - 2);
      if (*puVar12 < 2) {
        uVar9 = 8;
      }
                    /* WARNING: Could not recover jumptable at 0x0001401620a6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)(uVar9 * 4 + 0x145de4bf4) + 0x145de4bf4))();
      return;
    }
  } while( true );
}
