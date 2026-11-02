
long FUN_1459f0270(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4,
                  long *param_5)

{
  long *plVar1;
  byte bVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  byte *pbVar10;
  long lVar11;

  lVar6 = param_4[2];
  if ((lVar6 != 0) && (lVar6 != param_4[3])) {
    do {
      lVar9 = *(long *)(lVar6 + 0x30);
      plVar1 = (long *)(lVar6 + 0x38);
      lVar6 = lVar6 + 0x40;
      lVar5 = *plVar1 * 0xa0 + lVar9;
      if (*plVar1 != 0) {
        lVar3 = lVar9;
        do {
          lVar4 = lVar3 + 0xa0;
          if (*(long *)(lVar3 + 0x68) != 0) {
            pbVar10 = *(byte **)(lVar3 + 0x60);
            lVar9 = *(long *)(lVar3 + 0x68) << 6;
            do {
              bVar2 = *pbVar10;
              if (bVar2 < 0x24) {
                lVar7 = 0x10;
                if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                  if (bVar2 != 0x1d) goto LAB_1459f02fa;
                  lVar7 = 8;
                }
                if (*(long *)(pbVar10 + lVar7) == *(long *)*param_3) {
                  param_4[2] = lVar6;
                  param_5[1] = lVar5;
                  goto LAB_1459f066b;
                }
              }
LAB_1459f02fa:
              pbVar10 = pbVar10 + 0x40;
              lVar9 = lVar9 + -0x40;
            } while (lVar9 != 0);
          }
          lVar9 = lVar5;
          lVar3 = lVar4;
        } while (lVar4 != lVar5);
      }
    } while (lVar6 != param_4[3]);
    *param_5 = lVar9;
    param_5[1] = lVar5;
  }
  lVar6 = *param_4;
  if ((lVar6 != 0) && (lVar9 = param_4[1], lVar6 != lVar9)) {
    plVar1 = (long *)*param_3;
    do {
      lVar5 = lVar6;
      lVar6 = lVar5 + 200;
      if (*(long *)(lVar5 + 0x38) != 0) {
        lVar7 = *(long *)(lVar5 + 0x38) * 0xa0 + *(long *)(lVar5 + 0x30);
        lVar3 = *(long *)(lVar5 + 0x30);
        do {
          lVar4 = lVar3 + 0xa0;
          if (*(long *)(lVar3 + 0x68) != 0) {
            pbVar10 = *(byte **)(lVar3 + 0x60);
            lVar11 = *(long *)(lVar3 + 0x68) << 6;
            do {
              bVar2 = *pbVar10;
              if (bVar2 < 0x24) {
                lVar8 = 0x10;
                if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                  if (bVar2 != 0x1d) goto LAB_1459f03da;
                  lVar8 = 8;
                }
                if (*(long *)(pbVar10 + lVar8) == *plVar1) {
                  lVar9 = lVar5 + 0x40;
                  goto LAB_1459f065c;
                }
              }
LAB_1459f03da:
              pbVar10 = pbVar10 + 0x40;
              lVar11 = lVar11 + -0x40;
            } while (lVar11 != 0);
          }
          lVar3 = lVar4;
        } while (lVar4 != lVar7);
        *param_5 = lVar7;
      }
      if (*(long *)(lVar5 + 0x78) != 0) {
        lVar7 = *(long *)(lVar5 + 0x78) * 0xa0 + *(long *)(lVar5 + 0x70);
        lVar3 = *(long *)(lVar5 + 0x70);
        do {
          lVar4 = lVar3 + 0xa0;
          if (*(long *)(lVar3 + 0x68) != 0) {
            pbVar10 = *(byte **)(lVar3 + 0x60);
            lVar11 = *(long *)(lVar3 + 0x68) << 6;
            do {
              bVar2 = *pbVar10;
              if (bVar2 < 0x24) {
                lVar8 = 0x10;
                if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                  if (bVar2 != 0x1d) goto LAB_1459f047a;
                  lVar8 = 8;
                }
                if (*(long *)(pbVar10 + lVar8) == *plVar1) {
                  lVar9 = lVar5 + 0x80;
LAB_1459f065c:
                  *param_4 = lVar6;
                  param_4[3] = lVar5 + 0xc0;
                  goto LAB_1459f0663;
                }
              }
LAB_1459f047a:
              pbVar10 = pbVar10 + 0x40;
              lVar11 = lVar11 + -0x40;
            } while (lVar11 != 0);
          }
          lVar3 = lVar4;
        } while (lVar4 != lVar7);
      }
      lVar3 = *(long *)(lVar5 + 0xb0);
      lVar4 = *(long *)(lVar5 + 0xb8);
      lVar7 = lVar4 * 0xa0 + lVar3;
      *param_5 = lVar3;
      if (lVar4 != 0) {
        do {
          lVar4 = lVar3 + 0xa0;
          if (*(long *)(lVar3 + 0x68) != 0) {
            pbVar10 = *(byte **)(lVar3 + 0x60);
            lVar11 = *(long *)(lVar3 + 0x68) << 6;
            do {
              bVar2 = *pbVar10;
              if (bVar2 < 0x24) {
                lVar8 = 0x10;
                if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                  if (bVar2 != 0x1d) goto LAB_1459f050a;
                  lVar8 = 8;
                }
                if (*(long *)(pbVar10 + lVar8) == *plVar1) {
                  lVar9 = lVar5 + 0xc0;
                  *param_4 = lVar6;
                  param_4[3] = lVar9;
LAB_1459f0663:
                  param_4[2] = lVar9;
                  param_5[1] = lVar7;
LAB_1459f066b:
                  *param_5 = lVar4;
                  return lVar3;
                }
              }
LAB_1459f050a:
              pbVar10 = pbVar10 + 0x40;
              lVar11 = lVar11 + -0x40;
            } while (lVar11 != 0);
          }
          lVar3 = lVar4;
        } while (lVar4 != lVar7);
        *param_5 = lVar7;
      }
    } while (lVar6 != lVar9);
    *param_4 = lVar6;
    param_4[3] = lVar5 + 0xc0;
    param_5[1] = lVar7;
  }
  param_4[2] = 0;
  lVar6 = param_4[4];
  if ((lVar6 != 0) && (lVar6 != param_4[5])) {
    do {
      lVar9 = *(long *)(lVar6 + 0x30);
      plVar1 = (long *)(lVar6 + 0x38);
      lVar6 = lVar6 + 0x40;
      lVar5 = *plVar1 * 0xa0 + lVar9;
      if (*plVar1 != 0) {
        lVar3 = lVar9;
        do {
          lVar4 = lVar3 + 0xa0;
          if (*(long *)(lVar3 + 0x68) != 0) {
            pbVar10 = *(byte **)(lVar3 + 0x60);
            lVar9 = *(long *)(lVar3 + 0x68) << 6;
            do {
              bVar2 = *pbVar10;
              if (bVar2 < 0x24) {
                lVar7 = 0x10;
                if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                  if (bVar2 != 0x1d) goto LAB_1459f05d6;
                  lVar7 = 8;
                }
                if (*(long *)(pbVar10 + lVar7) == *(long *)*param_3) {
                  param_4[4] = lVar6;
                  param_5[1] = lVar5;
                  *param_5 = lVar4;
                  return lVar3;
                }
              }
LAB_1459f05d6:
              pbVar10 = pbVar10 + 0x40;
              lVar9 = lVar9 + -0x40;
            } while (lVar9 != 0);
          }
          lVar9 = lVar5;
          lVar3 = lVar4;
        } while (lVar4 != lVar5);
      }
    } while (lVar6 != param_4[5]);
    *param_5 = lVar9;
    param_5[1] = lVar5;
  }
  param_4[4] = 0;
  return 0;
}
