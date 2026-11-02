
/* WARNING: Removing unreachable block (ram,0x00014021d21f) */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5)

{
  char *pcVar1;
  ulong *puVar2;
  long lVar3;
  int *piVar4;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;

  puVar2 = (ulong *)*param_3;
  lVar10 = param_3[1];
  lVar3 = *param_5;
  if ((*(char *)(lVar3 + 300) == '\0') || (*(char *)(lVar3 + 0x132) == '\0')) goto LAB_14021d238;
  if (*(long *)(lVar3 + 0x40) != 0) {
    piVar4 = *(int **)(lVar3 + 8);
    lVar11 = *(long *)(lVar3 + 0x10);
    if (lVar11 == 4) {
      if (*piVar4 == 0x7466656c) goto LAB_14021d238;
    }
    else if (lVar11 == 6) {
      if ((short)piVar4[1] == 0x6465 && *piVar4 == 0x6e696f6a) goto LAB_14021d238;
    }
    else if ((lVar11 == 7) &&
            ((*(int *)((long)piVar4 + 3) == 0x676e6974 && *piVar4 == 0x74736f68 ||
             (*(int *)((long)piVar4 + 3) == 0x676e696e && *piVar4 == 0x6e696f6a)))) {
LAB_14021d238:
      *puVar2 = *(ulong *)(lVar10 + 0x40);
      return;
    }
  }
  uVar5 = *puVar2;
  uVar12 = 0;
  uVar8 = uVar5 - *(ulong *)(lVar10 + 0x18);
  if (uVar5 < *(ulong *)(lVar10 + 0x18)) {
    uVar8 = uVar12;
  }
  uVar6 = uVar5 - *(ulong *)(lVar10 + 0x38);
  if (uVar5 < *(ulong *)(lVar10 + 0x38)) {
    uVar6 = uVar12;
  }
  lVar11 = uVar8 * 0x58 + *(long *)(lVar10 + 8);
  uVar5 = *(ulong *)(lVar10 + 0x10) - uVar8;
  if (*(ulong *)(lVar10 + 0x10) < uVar8) {
    lVar11 = 8;
    uVar5 = uVar12;
  }
  lVar9 = uVar6 * 0x58 + *(long *)(lVar10 + 0x28);
  uVar8 = *(ulong *)(lVar10 + 0x30) - uVar6;
  if (*(ulong *)(lVar10 + 0x30) < uVar6) {
    lVar9 = 8;
    uVar8 = uVar12;
  }
  *puVar2 = (*(long *)(lVar10 + 0x40) - uVar8) - uVar5;
  lVar10 = lVar9;
  lVar7 = lVar11;
  do {
    while ((lVar7 == 0 || (lVar7 == uVar5 * 0x58 + lVar11))) {
      if (lVar10 == 0) {
        return;
      }
      if (lVar10 == uVar8 * 0x58 + lVar9) {
        return;
      }
      lVar7 = 0;
      *puVar2 = *puVar2 + 1;
      pcVar1 = (char *)(lVar10 + 0x54);
      lVar10 = lVar10 + 0x58;
      if (*pcVar1 == '\0') goto LAB_14021cc38;
    }
    *puVar2 = *puVar2 + 1;
    pcVar1 = (char *)(lVar7 + 0x54);
    lVar7 = lVar7 + 0x58;
  } while (*pcVar1 != '\0');
LAB_14021cc38:
                    /* WARNING: Could not emulate address calculation at 0x00014021cc44 */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)*(byte *)(lVar3 + 0x132) * 4 + 0x145f14588) + 0x145f14588))();
  return;
}
