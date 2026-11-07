void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  uint *puVar1;
  uint uVar2;
  undefined4 uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  undefined4 *puVar7;
  uint uVar8;
  int iVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  ulong uVar13;
  long lVar14;
  ulong uVar15;
  undefined8 uVar16;
  undefined8 *puVar17;
  undefined8 uVar18;
  uint uVar19;
  uint *puVar20;
  long local_80;
  long local_78;

  lVar4 = *param_3;
  lVar5 = param_3[1];
  uVar2 = *(uint *)((long)param_3 + 0x14);
  lVar6 = *param_5;
  puVar7 = (undefined4 *)param_5[2];
  uVar3 = *(undefined4 *)((long)param_5 + 0x1c);
  puVar20 = *(uint **)(lVar4 + 0xf8);
  puVar1 = puVar20 + *(long *)(lVar4 + 0x100);
  uVar8 = uVar2 - (int)param_3[2];
  uVar19 = 0xc233b000;
  if (uVar8 < 0xc233b000) {
    uVar19 = uVar8;
  }
  if (*(char *)(lVar4 + 0x108) != '\0') {
    lVar10 = 0;
    uVar16 = 0;
    uVar13 = 0;
    local_80 = 0;
    local_78 = 0;
    do {
      uVar15 = (ulong)uVar2;
      do {
        uVar11 = uVar13;
        if ((int)uVar11 == (int)uVar16) {
          if (puVar20 == puVar1) {
            return;
          }
          uVar13 = (ulong)*puVar20;
          puVar20 = puVar20 + 1;
          lVar10 = *(long *)(lVar5 + 0x1a8);
          if (*(long *)(lVar10 + 0x10 + uVar13 * 0x48) == 0) {
            do {
              if (puVar20 == puVar1) {
                return;
              }
              uVar8 = *puVar20;
              puVar20 = puVar20 + 1;
            } while (*(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar8 * 0x48) == 0);
            lVar12 = *(long *)(lVar5 + 0x1a8) + (ulong)uVar8 * 0x48;
            puVar17 = (undefined8 *)(lVar12 + 0x10);
            uVar13 = *(ulong *)(lVar4 + 0x110);
            uVar11 = *(ulong *)(lVar12 + 0x40);
            if (uVar13 < uVar11) goto LAB_14011865c;
LAB_1401186a0:
            local_78 = 0;
            uVar13 = *(ulong *)(lVar4 + 0x118);
            if (uVar11 <= uVar13) goto LAB_1401185a0;
LAB_1401186b9:
            uVar13 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar13 * 8);
            if (uVar13 == 0) goto LAB_1401185a0;
            local_80 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar13 * 0x30);
          }
          else {
            lVar12 = lVar10 + uVar13 * 0x48;
            puVar17 = (undefined8 *)(lVar10 + uVar13 * 0x48 + 0x10);
            uVar13 = *(ulong *)(lVar4 + 0x110);
            uVar11 = *(ulong *)(lVar12 + 0x40);
            if (uVar11 <= uVar13) goto LAB_1401186a0;
LAB_14011865c:
            uVar13 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar13 * 8);
            if (uVar13 == 0) goto LAB_1401186a0;
            local_78 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar13 * 0x30);
            uVar13 = *(ulong *)(lVar4 + 0x118);
            if (uVar13 < uVar11) goto LAB_1401186b9;
LAB_1401185a0:
            local_80 = 0;
          }
          lVar10 = func_0x000144e4f270();
          uVar16 = *puVar17;
          uVar11 = 0;
        }
        uVar13 = (ulong)((int)uVar11 + 1);
      } while (uVar19 <= (uint)((int)uVar15 - *(int *)(lVar10 + uVar11 * 4)));
      puVar17 = (undefined8 *)(uVar11 * 0x10 + local_80);
      if ((char *)(local_78 + uVar11) == (char *)0x0) {
        return;
      }
      if (*(char *)(local_78 + uVar11) != '\x02') {
        uVar18 = *puVar17;
        lVar12 = puVar17[1];
        if (((*(long *)(lVar6 + 0x58) == 0) || (*(long *)(lVar6 + 0x60) != lVar12)) ||
           (iVar9 = func_0x000145bfa0e1(lVar12,uVar18,uVar18,*(long *)(lVar6 + 0x58),lVar12),
           iVar9 != 0)) {
          *puVar7 = uVar3;
          *(undefined8 *)(lVar6 + 0x58) = uVar18;
          *(long *)(lVar6 + 0x60) = lVar12;
        }
      }
    } while( true );
  }
  lVar12 = 0;
  lVar10 = 8;
  uVar16 = 0;
  uVar13 = 0;
  local_80 = 0;
  local_78 = 0;
  do {
    if ((int)uVar13 == (int)uVar16) {
      if (puVar20 == puVar1) {
        return;
      }
      uVar8 = *puVar20;
      puVar20 = puVar20 + 1;
      if (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0) == 0) {
        do {
          if (puVar20 == puVar1) {
            return;
          }
          uVar8 = *puVar20;
          puVar20 = puVar20 + 1;
        } while (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar8 * 0xa0) == 0);
        lVar10 = *(long *)(lVar5 + 0x108) + (ulong)uVar8 * 0xa0;
      }
      else {
        lVar10 = *(long *)(lVar5 + 0x108) + (ulong)uVar8 * 0xa0;
      }
      puVar17 = (undefined8 *)(lVar10 + 0x58);
      lVar12 = *(long *)(lVar5 + 0x1a8) + (ulong)*(uint *)(lVar10 + 0x94) * 0x48;
      uVar13 = *(ulong *)(*(long *)(lVar5 + 0x1a8) + 0x40 + (ulong)*(uint *)(lVar10 + 0x94) * 0x48);
      if ((*(ulong *)(lVar4 + 0x110) < uVar13) &&
         (uVar15 = *(ulong *)(*(long *)(lVar12 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8), uVar15 != 0
         )) {
        local_78 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar15 * 0x30);
        uVar15 = *(ulong *)(lVar4 + 0x118);
        if (uVar13 <= uVar15) goto LAB_1401187d0;
LAB_140118909:
        uVar13 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar15 * 8);
        if (uVar13 == 0) goto LAB_1401187d0;
        local_80 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar13 * 0x30);
      }
      else {
        local_78 = 0;
        uVar15 = *(ulong *)(lVar4 + 0x118);
        if (uVar15 < uVar13) goto LAB_140118909;
LAB_1401187d0:
        local_80 = 0;
      }
      lVar12 = func_0x000144e4f270();
      lVar10 = *(long *)(lVar10 + 0x50);
      uVar16 = *puVar17;
      uVar13 = 0;
    }
    lVar14 = uVar13 * 0x10;
    uVar13 = (ulong)((int)uVar13 + 1);
    uVar15 = (ulong)~*(uint *)(lVar10 + 8 + lVar14);
    if (uVar2 - *(int *)(lVar12 + uVar15 * 4) < uVar19) {
      puVar17 = (undefined8 *)(uVar15 * 0x10 + local_80);
      if ((char *)(local_78 + uVar15) == (char *)0x0) {
        return;
      }
      if (*(char *)(local_78 + uVar15) != '\x02') {
        uVar18 = *puVar17;
        lVar14 = puVar17[1];
        if (((*(long *)(lVar6 + 0x58) == 0) || (*(long *)(lVar6 + 0x60) != lVar14)) ||
           (iVar9 = func_0x000145bfa0e1(), iVar9 != 0)) {
          *puVar7 = uVar3;
          *(undefined8 *)(lVar6 + 0x58) = uVar18;
          *(long *)(lVar6 + 0x60) = lVar14;
        }
      }
    }
  } while( true );
}
