
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,
          undefined8 *param_5)

{
  long lVar1;
  long lVar2;
  ulong uVar3;
  long lVar4;
  uint uVar5;
  long lVar6;
  long lVar7;
  undefined8 uVar8;
  ulong uVar9;
  ulong uVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  
  if (*param_3 != param_3[1]) {
    lVar2 = param_3[2];
    uVar3 = param_3[3];
    uVar9 = uVar3 & 0xffffffffffffff8;
    uVar5 = (uint)uVar3 & 7;
    lVar6 = *param_3;
    do {
      lVar7 = lVar6 + 0x160;
      if (*(char *)(lVar6 + 0x68) == '\0') {
        lVar4 = *(long *)(lVar6 + 0x88);
        uVar10 = 0;
        while (uVar9 != uVar10) {
          if (((((*(long *)(lVar2 + uVar10 * 8) == lVar4) ||
                (*(long *)(lVar2 + 8 + uVar10 * 8) == lVar4)) ||
               (*(long *)(lVar2 + 0x10 + uVar10 * 8) == lVar4)) ||
              ((*(long *)(lVar2 + 0x18 + uVar10 * 8) == lVar4 ||
               (*(long *)(lVar2 + 0x20 + uVar10 * 8) == lVar4)))) ||
             ((*(long *)(lVar2 + 0x28 + uVar10 * 8) == lVar4 ||
              ((*(long *)(lVar2 + 0x30 + uVar10 * 8) == lVar4 ||
               (lVar1 = uVar10 * 8, uVar10 = uVar10 + 8, *(long *)(lVar2 + 0x38 + lVar1) == lVar4)))
              ))) goto LAB_145514a70;
        }
        if (((uVar3 & 7) == 0) ||
           ((*(long *)(lVar2 + uVar9 * 8) != lVar4 &&
            ((uVar5 == 1 ||
             ((*(long *)(lVar2 + 8 + uVar9 * 8) != lVar4 &&
              ((uVar5 == 2 ||
               ((*(long *)(lVar2 + 0x10 + uVar9 * 8) != lVar4 &&
                ((uVar5 == 3 ||
                 ((*(long *)(lVar2 + 0x18 + uVar9 * 8) != lVar4 &&
                  ((uVar5 == 4 ||
                   ((*(long *)(lVar2 + 0x20 + uVar9 * 8) != lVar4 &&
                    ((uVar5 == 5 ||
                     ((*(long *)(lVar2 + 0x28 + uVar9 * 8) != lVar4 &&
                      ((uVar5 == 6 ||
                       ((*(long *)(lVar2 + 0x30 + uVar9 * 8) != lVar4 && (uVar5 == 7))))))))))))))))
                )))))))))))) {
          if (*(float *)(lVar6 + 0x128) <= 0.0) {
            uVar8 = *(undefined8 *)(lVar6 + 0x118);
          }
          else {
            fVar12 = (*(float *)param_3[4] - *(float *)(lVar6 + 0x124)) / *(float *)(lVar6 + 0x128);
            fVar11 = 0.0;
            if (0.0 <= fVar12) {
              fVar11 = fVar12;
            }
            fVar12 = _DAT_1458eb480;
            if (fVar11 <= _DAT_1458eb480) {
              fVar12 = fVar11;
            }
            fVar11 = (float)*(undefined8 *)(lVar6 + 0x10c);
            fVar13 = (float)((ulong)*(undefined8 *)(lVar6 + 0x10c) >> 0x20);
            uVar8 = CONCAT44(fVar12 * ((float)((ulong)*(undefined8 *)(lVar6 + 0x118) >> 0x20) -
                                      fVar13) + fVar13,
                             fVar12 * ((float)*(undefined8 *)(lVar6 + 0x118) - fVar11) + fVar11);
          }
          fVar11 = (float)uVar8 - (float)*(undefined8 *)param_3[5];
          fVar12 = (float)((ulong)uVar8 >> 0x20) - (float)((ulong)*(undefined8 *)param_3[5] >> 0x20)
          ;
          fVar11 = fVar12 * fVar12 + fVar11 * fVar11;
          if (fVar11 <= *(float *)*param_5) {
            *param_3 = lVar7;
            *(float *)(param_4 + 1) = fVar11;
            param_4[2] = lVar4;
            uVar8 = 1;
            goto LAB_145514bc9;
          }
        }
      }
LAB_145514a70:
      lVar6 = lVar7;
    } while (lVar7 != param_3[1]);
    *param_3 = lVar7;
  }
  uVar8 = 0;
LAB_145514bc9:
  *param_4 = uVar8;
  return;
}

