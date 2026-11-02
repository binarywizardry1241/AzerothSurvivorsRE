
void entry(undefined8 param_1,undefined8 param_2,long *param_3)

{
  uint *puVar1;
  char cVar2;
  int iVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  long lVar8;
  uint uVar9;
  ulong uVar10;
  long lVar11;
  uint *puVar12;
  uint uVar13;
  undefined8 uVar14;
  long lVar15;
  long local_1d8;
  long local_118;
  long local_a0;
  
  lVar4 = *param_3;
  lVar5 = param_3[1];
  iVar3 = *(int *)((long)param_3 + 0x14);
  uVar13 = iVar3 - (int)param_3[2];
  uVar9 = 0xc233b000;
  if (uVar13 < 0xc233b000) {
    uVar9 = uVar13;
  }
  puVar12 = *(uint **)(lVar4 + 0xf8);
  puVar1 = puVar12 + *(long *)(lVar4 + 0x100);
  cVar2 = *(char *)(lVar4 + 0x108);
  local_1d8 = 8;
  local_a0 = 0;
  local_118 = 0;
  uVar14 = 0;
  uVar10 = 0;
  lVar8 = 0;
  do {
    if (cVar2 == '\0') {
      do {
        lVar15 = lVar8;
        if ((int)uVar10 == (int)uVar14) {
          do {
            if (puVar12 == puVar1) {
              return;
            }
            uVar13 = *puVar12;
            puVar12 = puVar12 + 1;
          } while (*(long *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar13 * 0xa0) == 0);
          lVar11 = *(long *)(lVar5 + 0x108) + (ulong)uVar13 * 0xa0;
          lVar8 = *(long *)(lVar5 + 0x1a8) + (ulong)*(uint *)(lVar11 + 0x94) * 0x48;
          uVar10 = *(ulong *)(*(long *)(lVar5 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar11 + 0x94) * 0x48);
          if ((*(ulong *)(lVar4 + 0x110) < uVar10) &&
             (uVar6 = *(ulong *)(*(long *)(lVar8 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar6 != 0)) {
            lVar15 = *(long *)(*(long *)(lVar8 + 0x18) + 0x10 + ~uVar6 * 0x30);
            uVar6 = *(ulong *)(lVar4 + 0x118);
            if (uVar10 <= uVar6) goto LAB_1402dfabe;
LAB_1402dfa94:
            uVar10 = *(ulong *)(*(long *)(lVar8 + 0x38) + uVar6 * 8);
            if (uVar10 == 0) goto LAB_1402dfabe;
            local_a0 = *(long *)(*(long *)(lVar8 + 0x18) + 0x10 + ~uVar10 * 0x30);
          }
          else {
            lVar15 = 0;
            uVar6 = *(ulong *)(lVar4 + 0x118);
            if (uVar6 < uVar10) goto LAB_1402dfa94;
LAB_1402dfabe:
            local_a0 = 0;
          }
          local_118 = func_0x0001450755e0(puVar12,lVar11,*(undefined8 *)(lVar4 + 0x120));
          local_1d8 = *(long *)(lVar11 + 0x50);
          uVar14 = *(undefined8 *)(lVar11 + 0x58);
          uVar10 = 0;
        }
        lVar8 = uVar10 * 0x10;
        uVar10 = (ulong)((int)uVar10 + 1);
        uVar6 = (ulong)~*(uint *)(local_1d8 + 8 + lVar8);
        lVar8 = lVar15;
      } while ((uVar9 <= (uint)(iVar3 - *(int *)(local_118 + uVar6 * 4))) ||
              (lVar8 = 0, lVar15 == 0));
    }
    else {
      do {
        uVar6 = uVar10;
        lVar15 = lVar8;
        if ((int)uVar6 == (int)uVar14) {
          do {
            if (puVar12 == puVar1) {
              return;
            }
            uVar13 = *puVar12;
            puVar12 = puVar12 + 1;
          } while (*(long *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar13 * 0x48) == 0);
          lVar8 = *(long *)(lVar5 + 0x1a8) + (ulong)uVar13 * 0x48;
          uVar10 = *(ulong *)(lVar8 + 0x40);
          if ((*(ulong *)(lVar4 + 0x110) < uVar10) &&
             (uVar7 = *(ulong *)(*(long *)(lVar8 + 0x38) + *(ulong *)(lVar4 + 0x110) * 8),
             uVar7 != 0)) {
            lVar15 = *(long *)(*(long *)(lVar8 + 0x18) + 0x10 + ~uVar7 * 0x30);
            uVar7 = *(ulong *)(lVar4 + 0x118);
            if (uVar10 <= uVar7) goto LAB_1402df990;
LAB_1402df964:
            uVar10 = *(ulong *)(*(long *)(lVar8 + 0x38) + uVar7 * 8);
            if (uVar10 == 0) goto LAB_1402df990;
            local_a0 = *(long *)(*(long *)(lVar8 + 0x18) + 0x10 + ~uVar10 * 0x30);
          }
          else {
            lVar15 = 0;
            uVar7 = *(ulong *)(lVar4 + 0x118);
            if (uVar7 < uVar10) goto LAB_1402df964;
LAB_1402df990:
            local_a0 = 0;
          }
          local_118 = func_0x0001450755e0(puVar12,uVar6,*(undefined8 *)(lVar4 + 0x120),lVar8);
          uVar14 = *(undefined8 *)(lVar8 + 0x10);
          uVar6 = 0;
        }
        uVar10 = (ulong)((int)uVar6 + 1);
        lVar8 = lVar15;
      } while ((uVar9 <= (uint)(iVar3 - *(int *)(local_118 + uVar6 * 4))) ||
              (lVar8 = 0, lVar15 == 0));
    }
    lVar8 = lVar15;
    if (*(char *)(lVar15 + uVar6) == '\0') {
                    /* WARNING: Could not emulate address calculation at 0x0001402dfb59 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((ulong)*(byte *)(uVar6 * 0x10 + local_a0) * 4 + 0x14627a9d4) +
                0x14627a9d4))();
      return;
    }
  } while( true );
}

