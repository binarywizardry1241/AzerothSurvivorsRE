void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  uint *puVar1;
  int iVar2;
  undefined4 uVar3;
  long *plVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  uint uVar8;
  int iVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  long lVar13;
  undefined8 *puVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long *plVar18;
  uint *puVar19;
  uint uVar20;
  undefined8 uVar21;
  long local_98;
  long local_88;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;

  lVar16 = *param_3;
  lVar17 = param_3[1];
  iVar2 = *(int *)((long)param_3 + 0x14);
  plVar4 = (long *)*param_5;
  puVar5 = (undefined4 *)param_5[2];
  uVar3 = *(undefined4 *)((long)param_5 + 0x1c);
  puVar19 = *(uint **)(lVar16 + 0xf8);
  puVar1 = puVar19 + *(long *)(lVar16 + 0x100);
  uVar8 = iVar2 - (int)param_3[2];
  uVar20 = 0xc233b000;
  if (uVar8 < 0xc233b000) {
    uVar20 = uVar8;
  }
  if (*(char *)(lVar16 + 0x108) == '\0') {
    lVar10 = 0;
    lVar15 = 8;
    uVar21 = 0;
    uVar12 = 0;
    local_88 = 0;
    local_98 = 0;
LAB_14037d7b0:
    do {
      do {
        if ((int)uVar12 == (int)uVar21) {
          if (puVar19 == puVar1) {
            return;
          }
          uVar8 = *puVar19;
          puVar19 = puVar19 + 1;
          if (*(long *)(*(long *)(lVar17 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0) == 0) {
            do {
              if (puVar19 == puVar1) {
                return;
              }
              uVar8 = *puVar19;
              puVar19 = puVar19 + 1;
            } while (*(long *)(*(long *)(lVar17 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0) == 0);
            lVar13 = *(long *)(lVar17 + 0x108) + (ulong)uVar8 * 0xa0;
          }
          else {
            lVar13 = *(long *)(lVar17 + 0x108) + (ulong)uVar8 * 0xa0;
          }
          lVar15 = *(long *)(lVar17 + 0x1a8) + (ulong)*(uint *)(lVar13 + 0x94) * 0x48;
          uVar12 = *(ulong *)(*(long *)(lVar17 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar13 + 0x94) * 0x48);
          if ((*(ulong *)(lVar16 + 0x110) < uVar12) &&
             (uVar11 = *(ulong *)(*(long *)(lVar15 + 0x38) + *(ulong *)(lVar16 + 0x110) * 8),
             uVar11 != 0)) {
            local_98 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar11 * 0x30);
            uVar11 = *(ulong *)(lVar16 + 0x118);
            if (uVar12 <= uVar11) goto LAB_14037d770;
LAB_14037d899:
            uVar12 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar11 * 8);
            if (uVar12 == 0) goto LAB_14037d770;
            local_88 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar12 * 0x30);
          }
          else {
            local_98 = 0;
            uVar11 = *(ulong *)(lVar16 + 0x118);
            if (uVar11 < uVar12) goto LAB_14037d899;
LAB_14037d770:
            local_88 = 0;
          }
          lVar10 = func_0x000144e4f270();
          lVar15 = *(long *)(lVar13 + 0x50);
          uVar21 = *(undefined8 *)(lVar13 + 0x58);
          uVar12 = 0;
        }
        lVar13 = uVar12 * 0x10;
        uVar12 = (ulong)((int)uVar12 + 1);
        uVar11 = (ulong)~*(uint *)(lVar15 + 8 + lVar13);
      } while (uVar20 <= (uint)(iVar2 - *(int *)(lVar10 + uVar11 * 4)));
      plVar18 = (long *)(local_88 + uVar11 * 0x18);
      if ((char *)(local_98 + uVar11) == (char *)0x0) {
        return;
      }
    } while (*(char *)(local_98 + uVar11) != '\0');
    lVar13 = *plVar4;
    if ((lVar13 != -1) && (lVar13 == *plVar18)) {
      if ((lVar13 == 0) || ((int)lVar13 == 1)) {
        if (plVar4[1] == plVar18[1]) goto LAB_14037d7b0;
      }
      else if ((plVar4[2] == plVar18[2]) && (iVar9 = func_0x000145bfa0e1(), iVar9 == 0))
      goto LAB_14037d7b0;
    }
    lVar13 = plVar18[2];
    lVar6 = *plVar18;
    lVar7 = plVar18[1];
    *puVar5 = uVar3;
    plVar4[2] = lVar13;
    local_68 = (undefined4)lVar6;
    uStack_64 = (undefined4)((ulong)lVar6 >> 0x20);
    uStack_60 = (undefined4)lVar7;
    uStack_5c = (undefined4)((ulong)lVar7 >> 0x20);
    *(undefined4 *)plVar4 = local_68;
    *(undefined4 *)((long)plVar4 + 4) = uStack_64;
    *(undefined4 *)(plVar4 + 1) = uStack_60;
    *(undefined4 *)((long)plVar4 + 0xc) = uStack_5c;
    goto LAB_14037d7b0;
  }
  lVar10 = 0;
  uVar21 = 0;
  lVar15 = 0;
  local_98 = 0;
  uVar12 = 0;
LAB_14037d54b:
  do {
    do {
      uVar11 = uVar12;
      if ((int)uVar11 == (int)uVar21) {
        if (puVar19 == puVar1) {
          return;
        }
        uVar12 = (ulong)*puVar19;
        puVar19 = puVar19 + 1;
        lVar15 = *(long *)(lVar17 + 0x1a8);
        if (*(long *)(lVar15 + 0x10 + uVar12 * 0x48) == 0) {
          do {
            if (puVar19 == puVar1) {
              return;
            }
            uVar8 = *puVar19;
            puVar19 = puVar19 + 1;
          } while (*(long *)(*(long *)(lVar17 + 0x1a8) + 0x10 + (ulong)uVar8 * 0x48) == 0);
          lVar10 = *(long *)(lVar17 + 0x1a8) + (ulong)uVar8 * 0x48;
          puVar14 = (undefined8 *)(lVar10 + 0x10);
          uVar12 = *(ulong *)(lVar16 + 0x110);
          uVar11 = *(ulong *)(lVar10 + 0x40);
          if (uVar12 < uVar11) goto LAB_14037d5dc;
LAB_14037d620:
          local_98 = 0;
          uVar12 = *(ulong *)(lVar16 + 0x118);
          if (uVar11 <= uVar12) goto LAB_14037d520;
LAB_14037d639:
          uVar12 = *(ulong *)(*(long *)(lVar10 + 0x38) + uVar12 * 8);
          if (uVar12 == 0) goto LAB_14037d520;
          lVar15 = *(long *)(*(long *)(lVar10 + 0x18) + 0x10 + ~uVar12 * 0x30);
        }
        else {
          lVar10 = lVar15 + uVar12 * 0x48;
          puVar14 = (undefined8 *)(lVar15 + uVar12 * 0x48 + 0x10);
          uVar12 = *(ulong *)(lVar16 + 0x110);
          uVar11 = *(ulong *)(lVar10 + 0x40);
          if (uVar11 <= uVar12) goto LAB_14037d620;
LAB_14037d5dc:
          uVar12 = *(ulong *)(*(long *)(lVar10 + 0x38) + uVar12 * 8);
          if (uVar12 == 0) goto LAB_14037d620;
          local_98 = *(long *)(*(long *)(lVar10 + 0x18) + 0x10 + ~uVar12 * 0x30);
          uVar12 = *(ulong *)(lVar16 + 0x118);
          if (uVar12 < uVar11) goto LAB_14037d639;
LAB_14037d520:
          lVar15 = 0;
        }
        lVar10 = func_0x000144e4f270();
        uVar21 = *puVar14;
        uVar11 = 0;
      }
      uVar12 = (ulong)((int)uVar11 + 1);
    } while (uVar20 <= (uint)(iVar2 - *(int *)(lVar10 + uVar11 * 4)));
    plVar18 = (long *)(uVar11 * 0x18 + lVar15);
    if ((char *)(local_98 + uVar11) == (char *)0x0) {
      return;
    }
  } while (*(char *)(local_98 + uVar11) != '\0');
  lVar13 = *plVar4;
  if ((lVar13 != -1) && (lVar13 == *plVar18)) {
    if ((lVar13 == 0) || ((int)lVar13 == 1)) {
      if (plVar4[1] == plVar18[1]) goto LAB_14037d54b;
    }
    else if ((plVar4[2] == plVar18[2]) && (iVar9 = func_0x000145bfa0e1(), iVar9 == 0))
    goto LAB_14037d54b;
  }
  lVar13 = plVar18[2];
  lVar6 = *plVar18;
  lVar7 = plVar18[1];
  *puVar5 = uVar3;
  plVar4[2] = lVar13;
  local_68 = (undefined4)lVar6;
  uStack_64 = (undefined4)((ulong)lVar6 >> 0x20);
  uStack_60 = (undefined4)lVar7;
  uStack_5c = (undefined4)((ulong)lVar7 >> 0x20);
  *(undefined4 *)plVar4 = local_68;
  *(undefined4 *)((long)plVar4 + 4) = uStack_64;
  *(undefined4 *)(plVar4 + 1) = uStack_60;
  *(undefined4 *)((long)plVar4 + 0xc) = uStack_5c;
  goto LAB_14037d54b;
}
