
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4,long param_5)

{
  long *plVar1;
  undefined4 *puVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  int iVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  long *plVar21;
  ulong uVar22;
  long lVar23;

  uVar3 = *(ulong *)(param_4 + 0x10);
  if (uVar3 != 0) {
    lVar4 = *(long *)(param_4 + 8);
    lVar5 = *param_3;
    lVar19 = *(long *)(param_5 + 8);
    lVar6 = *(long *)(param_5 + 0x10);
    lVar7 = param_3[2];
    lVar20 = lVar6 * 0x18;
    if (lVar5 == -1) {
      if (lVar6 != 0) {
        uVar22 = 0;
        do {
          lVar23 = *(long *)(lVar4 + 0x10 + uVar22 * 0x70);
          lVar18 = 0;
          do {
            if ((*(long *)(lVar19 + 0x10 + lVar18) == lVar23) &&
               (iVar15 = func_0x000145756dd7(), iVar15 == 0)) goto LAB_1455234b4;
            lVar18 = lVar18 + 0x18;
          } while (lVar20 != lVar18);
          uVar22 = uVar22 + 1;
        } while (uVar22 != uVar3);
      }
    }
    else {
      uVar22 = 0;
      lVar23 = lVar4;
      if (lVar6 == 0) {
        do {
          if ((*(long *)(lVar23 + 0x10) == lVar7) && (iVar15 = func_0x000145756dd7(), iVar15 == 0))
          {
LAB_1455234b4:
            func_0x000140272770();
            uVar17 = uVar22 + 1;
            if (uVar17 < uVar3) {
              do {
                plVar21 = (long *)(uVar17 * 0x70 + lVar4);
                if (((lVar5 == -1) || (plVar21[2] != lVar7)) ||
                   (iVar15 = func_0x000145756dd7(), iVar15 != 0)) {
                  if (lVar6 != 0) {
                    lVar23 = plVar21[2];
                    lVar18 = 0;
                    do {
                      if ((*(long *)(lVar19 + 0x10 + lVar18) == lVar23) &&
                         (iVar15 = func_0x000145756dd7(), iVar15 == 0)) goto LAB_1455235dd;
                      lVar18 = lVar18 + 0x18;
                    } while (lVar20 != lVar18);
                  }
                  lVar16 = uVar22 * 0x70;
                  lVar23 = plVar21[0xd];
                  plVar1 = (long *)(lVar4 + 0x60 + lVar16);
                  *plVar1 = plVar21[0xc];
                  plVar1[1] = lVar23;
                  lVar23 = plVar21[0xb];
                  plVar1 = (long *)(lVar4 + 0x50 + lVar16);
                  *plVar1 = plVar21[10];
                  plVar1[1] = lVar23;
                  lVar23 = plVar21[9];
                  plVar1 = (long *)(lVar4 + 0x40 + lVar16);
                  *plVar1 = plVar21[8];
                  plVar1[1] = lVar23;
                  lVar13 = *plVar21;
                  uVar8 = *(undefined4 *)((long)plVar21 + 4);
                  lVar14 = plVar21[1];
                  uVar9 = *(undefined4 *)((long)plVar21 + 0xc);
                  lVar23 = plVar21[2];
                  lVar18 = plVar21[3];
                  lVar10 = plVar21[4];
                  lVar11 = plVar21[5];
                  lVar12 = plVar21[7];
                  plVar1 = (long *)(lVar4 + 0x30 + lVar16);
                  *plVar1 = plVar21[6];
                  plVar1[1] = lVar12;
                  plVar21 = (long *)(lVar4 + 0x20 + lVar16);
                  *plVar21 = lVar10;
                  plVar21[1] = lVar11;
                  plVar21 = (long *)(lVar4 + 0x10 + lVar16);
                  *plVar21 = lVar23;
                  plVar21[1] = lVar18;
                  puVar2 = (undefined4 *)(lVar4 + lVar16);
                  *puVar2 = (int)lVar13;
                  puVar2[1] = uVar8;
                  puVar2[2] = (int)lVar14;
                  puVar2[3] = uVar9;
                  uVar22 = uVar22 + 1;
                }
                else {
LAB_1455235dd:
                  if (*plVar21 != 0) {
                    func_0x0001400021d0();
                  }
                  if (plVar21[3] != 0) {
                    func_0x0001400021d0();
                  }
                  if (plVar21[6] != 0) {
                    func_0x0001400021d0();
                  }
                }
                uVar17 = uVar17 + 1;
              } while (uVar17 != uVar3);
            }
            *(ulong *)(param_4 + 0x10) = uVar22;
            return;
          }
          uVar22 = uVar22 + 1;
          lVar23 = lVar23 + 0x70;
        } while (uVar3 != uVar22);
      }
      else {
        do {
          lVar23 = *(long *)(lVar4 + 0x10 + uVar22 * 0x70);
          if ((lVar23 == lVar7) && (iVar15 = func_0x000145756dd7(), iVar15 == 0))
          goto LAB_1455234b4;
          lVar18 = 0;
          do {
            if ((*(long *)(lVar19 + 0x10 + lVar18) == lVar23) &&
               (iVar15 = func_0x000145756dd7(), iVar15 == 0)) goto LAB_1455234b4;
            lVar18 = lVar18 + 0x18;
          } while (lVar20 != lVar18);
          uVar22 = uVar22 + 1;
        } while (uVar22 != uVar3);
      }
    }
  }
  return;
}
