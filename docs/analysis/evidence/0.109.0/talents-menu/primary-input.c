void FUN_140117cf0(undefined8 param_1,undefined8 param_2,long *param_3)

{
  uint *puVar1;
  char cVar2;
  int iVar3;
  long lVar4;
  uint uVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  uint *puVar10;
  undefined8 uVar11;
  undefined8 *puVar12;
  long lVar13;
  long lVar14;
  uint uVar15;
  long local_68;
  long local_60;

  lVar4 = *param_3;
  lVar13 = param_3[1];
  iVar3 = *(int *)((long)param_3 + 0x14);
  uVar5 = iVar3 - (int)param_3[2];
  uVar15 = 0xc233b000;
  if (uVar5 < 0xc233b000) {
    uVar15 = uVar5;
  }
  puVar10 = *(uint **)(lVar4 + 0xf8);
  puVar1 = puVar10 + *(long *)(lVar4 + 0x100);
  cVar2 = *(char *)(lVar4 + 0x108);
  lVar7 = 0;
  lVar14 = 8;
  uVar11 = 0;
  uVar9 = 0;
  local_60 = 0;
  local_68 = 0;
  do {
    if (cVar2 == '\0') {
      do {
        if ((int)uVar9 == (int)uVar11) {
          if (puVar10 == puVar1) {
            return;
          }
          uVar5 = *puVar10;
          puVar10 = puVar10 + 1;
          if (*(long *)(*(long *)(lVar13 + 0x108) + 0x58 + (ulong)uVar5 * 0xa0) == 0) {
            do {
              if (puVar10 == puVar1) {
                return;
              }
              uVar5 = *puVar10;
              puVar10 = puVar10 + 1;
            } while (*(long *)(*(long *)(lVar13 + 0x108) + 0x58 + (ulong)uVar5 * 0xa0) == 0);
            lVar14 = *(long *)(lVar13 + 0x108) + (ulong)uVar5 * 0xa0;
          }
          else {
            lVar14 = *(long *)(lVar13 + 0x108) + (ulong)uVar5 * 0xa0;
          }
          puVar12 = (undefined8 *)(lVar14 + 0x58);
          lVar7 = *(long *)(lVar13 + 0x1a8) + (ulong)*(uint *)(lVar14 + 0x94) * 0x48;
          uVar9 = *(ulong *)(*(long *)(lVar13 + 0x1a8) + 0x40 +
                            (ulong)*(uint *)(lVar14 + 0x94) * 0x48);
          if ((*(ulong *)(lVar4 + 0x110) < uVar9) &&
             (uVar8 = *(ulong *)(*(long *)(lVar7 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar8 != 0)) {
            local_68 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar8 * 0x30);
            uVar8 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 <= uVar8) goto LAB_140117e40;
LAB_140117f7c:
            uVar9 = *(ulong *)(*(long *)(lVar7 + 0x38) + uVar8 * 8);
            if (uVar9 == 0) goto LAB_140117e40;
            local_60 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            local_68 = 0;
            uVar8 = *(ulong *)(lVar4 + 0x118);
            if (uVar8 < uVar9) goto LAB_140117f7c;
LAB_140117e40:
            local_60 = 0;
          }
          lVar7 = FUN_144e4f270();
          lVar14 = *(long *)(lVar14 + 0x50);
          uVar11 = *puVar12;
          uVar9 = 0;
        }
        lVar6 = uVar9 * 0x10;
        uVar9 = (ulong)((int)uVar9 + 1);
        uVar8 = (ulong)~*(uint *)(lVar14 + 8 + lVar6);
      } while (uVar15 <= (uint)(iVar3 - *(int *)(lVar7 + uVar8 * 4)));
    }
    else {
      do {
        uVar8 = uVar9;
        if ((int)uVar8 == (int)uVar11) {
          if (puVar10 == puVar1) {
            return;
          }
          uVar9 = (ulong)*puVar10;
          puVar10 = puVar10 + 1;
          lVar7 = *(long *)(lVar13 + 0x1a8);
          if (*(long *)(lVar7 + 0x10 + uVar9 * 0x48) == 0) {
            do {
              if (puVar10 == puVar1) {
                return;
              }
              uVar5 = *puVar10;
              puVar10 = puVar10 + 1;
            } while (*(long *)(*(long *)(lVar13 + 0x1a8) + 0x10 + (ulong)uVar5 * 0x48) == 0);
            lVar6 = *(long *)(lVar13 + 0x1a8) + (ulong)uVar5 * 0x48;
            puVar12 = (undefined8 *)(lVar6 + 0x10);
            uVar9 = *(ulong *)(lVar4 + 0x110);
            uVar8 = *(ulong *)(lVar6 + 0x40);
            if (uVar9 < uVar8) goto LAB_14011807b;
LAB_1401180c0:
            local_68 = 0;
            uVar9 = *(ulong *)(lVar4 + 0x118);
            if (uVar8 <= uVar9) goto LAB_140117fb0;
LAB_1401180dc:
            uVar9 = *(ulong *)(*(long *)(lVar6 + 0x38) + uVar9 * 8);
            if (uVar9 == 0) goto LAB_140117fb0;
            local_60 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar6 = lVar7 + uVar9 * 0x48;
            puVar12 = (undefined8 *)(lVar7 + uVar9 * 0x48 + 0x10);
            uVar9 = *(ulong *)(lVar4 + 0x110);
            uVar8 = *(ulong *)(lVar6 + 0x40);
            if (uVar8 <= uVar9) goto LAB_1401180c0;
LAB_14011807b:
            uVar9 = *(ulong *)(*(long *)(lVar6 + 0x38) + uVar9 * 8);
            if (uVar9 == 0) goto LAB_1401180c0;
            local_68 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar9 * 0x30);
            uVar9 = *(ulong *)(lVar4 + 0x118);
            if (uVar9 < uVar8) goto LAB_1401180dc;
LAB_140117fb0:
            local_60 = 0;
          }
          lVar7 = FUN_144e4f270();
          uVar11 = *puVar12;
          uVar8 = 0;
        }
        uVar9 = (ulong)((int)uVar8 + 1);
      } while (uVar15 <= (uint)(iVar3 - *(int *)(lVar7 + uVar8 * 4)));
    }
    if ((char *)(local_68 + uVar8) == (char *)0x0) {
      return;
    }
    if (*(char *)(local_68 + uVar8) == '\0') {
      FUN_14589e020();
      FUN_14589d0d0();
                    /* WARNING: Could not recover jumptable at 0x0001401181ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)(*(long *)(local_60 + uVar8 * 0x18) * 4 + 0x145dd8320) + 0x145dd8320)
      )();
      return;
    }
  } while( true );
}
