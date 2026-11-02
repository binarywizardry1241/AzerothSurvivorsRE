/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1458eded0(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined4 *param_4,
                  undefined8 param_5)

{
  float fVar1;
  float fVar2;
  int iVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  int *piVar7;
  int *piVar8;
  undefined4 uVar9;
  ulong uVar10;
  int *piVar11;
  int *piVar12;
  long lVar13;
  float fVar14;
  float fVar15;
  undefined1 auVar16 [16];

  lVar6 = func_0x0001458753b0(param_1,param_4,param_5);
  auVar16 = func_0x0001458c0f00();
  piVar7 = auVar16._0_8_;
  uVar9 = 0;
  if ((piVar7 != (int *)0x0) && (auVar16._8_8_ != 0)) {
    lVar6 = lVar6 * 0xf0;
    lVar4 = auVar16._8_8_ * 0x18;
    iVar3 = *(int *)(lVar6 + 0x146ba9510);
    piVar11 = piVar7;
    lVar13 = lVar4;
    do {
      if ((*piVar11 == iVar3) && (piVar11[1] == *(int *)(lVar6 + 0x146ba9514))) goto LAB_1458edf45;
      piVar11 = piVar11 + 6;
      lVar13 = lVar13 + -0x18;
    } while (lVar13 != 0);
    fVar1 = *(float *)(lVar6 + 0x146ba9518);
    fVar2 = *(float *)(lVar6 + 0x146ba951c);
    lVar6 = 0;
    do {
      if ((((*(int *)((long)piVar7 + lVar6) == iVar3) &&
           (*(float *)((long)piVar7 + lVar6 + 0xc) <= fVar2)) &&
          (fVar2 <= *(float *)((long)piVar7 + lVar6 + 8))) &&
         ((*(float *)((long)piVar7 + lVar6 + 0x14) <= fVar1 &&
          (fVar1 <= *(float *)((long)piVar7 + lVar6 + 0x10))))) {
        piVar11 = (int *)((long)piVar7 + lVar6);
        if (lVar4 + -0x18 != lVar6) {
          uVar10 = ((lVar4 - lVar6) - 0x18U) / 0x18;
          piVar12 = piVar11;
          piVar7 = (int *)((long)piVar7 + lVar6);
          do {
            piVar8 = piVar7 + 6;
            piVar11 = piVar12;
            if ((*piVar8 == iVar3) && ((float)piVar7[9] <= fVar2)) {
              fVar14 = (float)*(undefined8 *)(piVar7 + 8);
              if ((fVar2 <= fVar14) && ((float)piVar7[0xb] <= fVar1)) {
                fVar15 = (float)*(undefined8 *)(piVar7 + 10);
                if ((fVar1 <= fVar15) &&
                   (piVar11 = piVar8,
                   ((uint)(((float)*(undefined8 *)(piVar12 + 4) -
                           (float)((ulong)*(undefined8 *)(piVar12 + 4) >> 0x20)) *
                          ((float)*(undefined8 *)(piVar12 + 2) -
                          (float)((ulong)*(undefined8 *)(piVar12 + 2) >> 0x20))) & _DAT_145d9af40)
                   <= ((uint)((fVar15 - (float)((ulong)*(undefined8 *)(piVar7 + 10) >> 0x20)) *
                             (fVar14 - (float)((ulong)*(undefined8 *)(piVar7 + 8) >> 0x20))) &
                      uRam0000000145d9af44))) {
                  piVar11 = piVar12;
                }
              }
            }
            uVar10 = uVar10 - 1;
            piVar12 = piVar11;
            piVar7 = piVar8;
          } while (uVar10 != 0);
        }
LAB_1458edf45:
        uVar5 = *(undefined8 *)(piVar11 + 4);
        *(undefined8 *)(param_4 + 1) = *(undefined8 *)(piVar11 + 2);
        *(undefined8 *)(param_4 + 3) = uVar5;
        uVar9 = 1;
        goto LAB_1458edfe5;
      }
      lVar6 = lVar6 + 0x18;
    } while (lVar4 != lVar6);
    uVar9 = 0;
  }
LAB_1458edfe5:
  *param_4 = uVar9;
  return;
}
