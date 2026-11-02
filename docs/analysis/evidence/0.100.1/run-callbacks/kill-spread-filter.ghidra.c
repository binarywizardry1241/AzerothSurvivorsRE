
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  long *plVar1;
  long *plVar2;
  long lVar3;
  long *plVar4;
  long lVar5;
  long *plVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long *plVar10;
  long *plVar11;
  long lVar12;
  long lVar13;

  plVar2 = (long *)*param_3;
  lVar3 = param_3[2];
  lVar9 = param_3[6];
  plVar10 = plVar2;
  if (lVar9 != 0) {
    plVar11 = (long *)param_3[1];
    plVar4 = (long *)param_3[3];
    if (plVar11 != plVar4) {
      lVar5 = param_3[4];
      plVar6 = (long *)param_3[5];
      do {
        lVar7 = *plVar11;
        plVar11 = plVar11 + 1;
        lVar8 = *(long *)(lVar5 + 8);
        lVar13 = 0;
        lVar12 = lVar8;
        do {
          if (*(long *)(lVar5 + 0x10) * 0x160 - lVar13 == 0) goto LAB_145558d20;
          lVar13 = lVar13 + 0x160;
          plVar1 = (long *)(lVar12 + 0x88);
          lVar12 = lVar12 + 0x160;
        } while (*plVar1 != lVar7);
        lVar12 = *(long *)(lVar8 + -0x150 + lVar13);
        if (lVar12 != 0) {
          lVar8 = *(long *)(lVar8 + -0x158 + lVar13);
          lVar12 = lVar12 * 0x30;
          if (*plVar6 == 0) {
            lVar13 = 0;
            do {
              if (((*(int *)(lVar8 + 0x10 + lVar13) == (int)plVar6[2]) &&
                  (*(char *)(lVar8 + lVar13) == '\0')) && (*(int *)(lVar8 + 0x20 + lVar13) != 0))
              goto LAB_145558d20;
              lVar13 = lVar13 + 0x30;
            } while (lVar12 != lVar13);
          }
          else {
            lVar13 = 0;
            do {
              if (((*(int *)(lVar8 + 0x10 + lVar13) == (int)plVar6[2]) &&
                  (*(int *)(lVar8 + lVar13) == 1)) &&
                 ((*(long *)(lVar8 + 8 + lVar13) == plVar6[1] &&
                  (*(int *)(lVar8 + 0x20 + lVar13) != 0)))) goto LAB_145558d20;
              lVar13 = lVar13 + 0x30;
            } while (lVar12 != lVar13);
          }
        }
        *plVar10 = lVar7;
        plVar10 = plVar10 + 1;
        lVar9 = lVar9 + -1;
        if (lVar9 == 0) break;
LAB_145558d20:
      } while (plVar11 != plVar4);
    }
  }
  *param_4 = lVar3;
  param_4[1] = (long)plVar2;
  param_4[2] = (ulong)((long)plVar10 - (long)plVar2) >> 3;
  return;
}
