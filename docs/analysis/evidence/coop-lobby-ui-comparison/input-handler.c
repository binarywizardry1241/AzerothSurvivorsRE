
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long param_5)

{
  uint *puVar1;
  char cVar2;
  int iVar3;
  long lVar4;
  long lVar5;
  undefined8 uVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  uint uVar11;
  uint *puVar12;
  undefined8 *puVar13;
  uint uVar14;
  long lVar15;
  long local_130;
  undefined8 local_98;
  long local_90;
  long local_88;
  uint local_5c;
  
  lVar4 = *param_3;
  lVar5 = param_3[1];
  iVar3 = *(int *)((long)param_3 + 0x14);
  uVar6 = *(undefined8 *)(param_5 + 0x10);
  uVar14 = iVar3 - (int)param_3[2];
  uVar11 = 0xc233b000;
  if (uVar14 < 0xc233b000) {
    uVar11 = uVar14;
  }
  puVar12 = *(uint **)(lVar4 + 0xf8);
  puVar1 = puVar12 + *(long *)(lVar4 + 0x100);
  cVar2 = *(char *)(lVar4 + 0x108);
  local_130 = 0;
  lVar15 = 8;
  local_98 = 0;
  local_5c = 0;
  local_88 = 0;
  local_90 = 0;
  do {
    if (cVar2 == '\0') {
      do {
        uVar9 = (ulong)local_5c;
        if (local_5c == (uint)local_98) {
          if (puVar12 == puVar1) {
            return;
          }
          uVar14 = *puVar12;
          puVar12 = puVar12 + 1;
          if (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0) {
            do {
              if (puVar12 == puVar1) {
                return;
              }
              uVar14 = *puVar12;
              puVar12 = puVar12 + 1;
            } while (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0);
            lVar15 = *(long *)(lVar5 + 0x108) + (ulong)uVar14 * 0xa0;
          }
          else {
            lVar15 = *(long *)(lVar5 + 0x108) + (ulong)uVar14 * 0xa0;
          }
          puVar13 = (undefined8 *)(lVar15 + 0x58);
          lVar7 = *(long *)(lVar5 + 0x1a8) + (ulong)*(uint *)(lVar15 + 0x94) * 0x48;
          uVar9 = *(ulong *)(*(long *)(lVar5 + 0x1a8) + 0x40 +
                            (ulong)*(uint *)(lVar15 + 0x94) * 0x48);
          if ((*(ulong *)(lVar4 + 0x110) < uVar9) &&
             (uVar8 = *(ulong *)(*(long *)(lVar7 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar8 != 0)) {
            local_90 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar8 * 0x30);
            uVar8 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 <= uVar8) goto LAB_14015fcc0;
LAB_14015fc87:
            uVar9 = *(ulong *)(*(long *)(lVar7 + 0x38) + uVar8 * 8);
            if (uVar9 == 0) goto LAB_14015fcc0;
            local_88 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            local_90 = 0;
            uVar8 = *(ulong *)(lVar4 + 0x118);
            if (uVar8 < uVar9) goto LAB_14015fc87;
LAB_14015fcc0:
            local_88 = 0;
          }
          local_130 = func_0x00014502d4a0(lVar15,puVar12,*(undefined8 *)(lVar4 + 0x120));
          lVar15 = *(long *)(lVar15 + 0x50);
          local_98 = *puVar13;
          uVar9 = 0;
        }
        local_5c = (int)uVar9 + 1;
        uVar9 = (ulong)~*(uint *)(lVar15 + 8 + uVar9 * 0x10);
      } while (uVar11 <= (uint)(iVar3 - *(int *)(local_130 + uVar9 * 4)));
    }
    else {
      do {
        uVar9 = (ulong)local_5c;
        if (local_5c == (uint)local_98) {
          if (puVar12 == puVar1) {
            return;
          }
          uVar9 = (ulong)*puVar12;
          puVar12 = puVar12 + 1;
          lVar7 = *(long *)(lVar5 + 0x1a8);
          if (*(long *)(lVar7 + 0x10 + uVar9 * 0x48) == 0) {
            do {
              if (puVar12 == puVar1) {
                return;
              }
              uVar14 = *puVar12;
              puVar12 = puVar12 + 1;
            } while (*(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) == 0);
            lVar10 = *(long *)(lVar5 + 0x1a8) + (ulong)uVar14 * 0x48;
            puVar13 = (undefined8 *)(lVar10 + 0x10);
            uVar9 = *(ulong *)(lVar4 + 0x110);
            uVar8 = *(ulong *)(lVar10 + 0x40);
            if (uVar9 < uVar8) goto LAB_14015fa7f;
LAB_14015fac0:
            local_90 = 0;
            uVar9 = *(ulong *)(lVar4 + 0x118);
            if (uVar8 <= uVar9) goto LAB_14015fb10;
LAB_14015fad7:
            uVar9 = *(ulong *)(*(long *)(lVar10 + 0x38) + uVar9 * 8);
            if (uVar9 == 0) goto LAB_14015fb10;
            local_88 = *(long *)(*(long *)(lVar10 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar10 = lVar7 + uVar9 * 0x48;
            puVar13 = (undefined8 *)(lVar7 + uVar9 * 0x48 + 0x10);
            uVar9 = *(ulong *)(lVar4 + 0x110);
            uVar8 = *(ulong *)(lVar10 + 0x40);
            if (uVar8 <= uVar9) goto LAB_14015fac0;
LAB_14015fa7f:
            uVar9 = *(ulong *)(*(long *)(lVar10 + 0x38) + uVar9 * 8);
            if (uVar9 == 0) goto LAB_14015fac0;
            local_90 = *(long *)(*(long *)(lVar10 + 0x18) + 0x10 + ~uVar9 * 0x30);
            uVar9 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 < uVar8) goto LAB_14015fad7;
LAB_14015fb10:
            local_88 = 0;
          }
          local_130 = func_0x00014502d4a0(puVar13,puVar12,*(undefined8 *)(lVar4 + 0x120));
          local_98 = *puVar13;
          uVar9 = 0;
        }
        local_5c = (int)uVar9 + 1;
      } while (uVar11 <= (uint)(iVar3 - *(int *)(local_130 + uVar9 * 4)));
    }
    if ((char *)(local_90 + uVar9) == (char *)0x0) {
      return;
    }
    if (*(char *)(local_90 + uVar9) == '\0') {
                    /* WARNING: Could not emulate address calculation at 0x00014015fd80 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((ulong)*(byte *)(uVar9 * 0x10 + local_88) * 4 + 0x1461c7a8c) +
                0x1461c7a8c))(uVar6);
      return;
    }
  } while( true );
}

