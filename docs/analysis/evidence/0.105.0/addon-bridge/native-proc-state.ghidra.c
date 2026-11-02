/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined4 uVar1;
  long *plVar2;
  undefined8 uVar3;
  long *plVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;

  if (*(long *)(param_3 + 800) != 0) {
    lVar6 = *(long *)(param_3 + 0x318);
    lVar5 = *(long *)(param_3 + 800) * 0x68;
    lVar7 = 0;
    do {
      if (((*(long **)(lVar6 + lVar7))[1] == 9) &&
         (plVar2 = (long *)**(long **)(lVar6 + lVar7),
         (char)plVar2[1] == 'e' && *plVar2 == 0x676172646f6f6c62)) {
        uVar1 = *(undefined4 *)(param_3 + 0x88c);
        *param_4 = 0x146e79df3;
        param_4[1] = 9;
        param_4[2] = CONCAT44(uRam00000001463542e4,uVar1);
        return;
      }
      lVar7 = lVar7 + 0x68;
    } while (lVar5 - lVar7 != 0);
    lVar7 = 0;
    do {
      if (((*(long **)(lVar6 + lVar7))[1] == 9) &&
         (plVar2 = (long *)**(long **)(lVar6 + lVar7),
         (char)plVar2[1] == 'e' && *plVar2 == 0x7461665f6c616573)) {
        fVar8 = (float)*(uint *)(param_3 + 0x898);
        uVar3 = 0x146e79dfc;
        goto LAB_145946775;
      }
      lVar7 = lVar7 + 0x68;
    } while (lVar5 - lVar7 != 0);
    lVar7 = 0;
    do {
      if (((*(long **)(lVar6 + lVar7))[1] == 9) &&
         (plVar2 = (long *)**(long **)(lVar6 + lVar7),
         (char)plVar2[1] == 'e' && *plVar2 == 0x7269665f6c756f73)) {
        fVar8 = (float)*(uint *)(param_3 + 0x8a0) + *(float *)(param_3 + 0x8a8);
        uVar3 = 0x146e79e05;
LAB_145946775:
        *param_4 = uVar3;
        param_4[1] = 9;
        *(float *)(param_4 + 2) = fVar8;
        *(undefined4 *)((long)param_4 + 0x14) = 0x40a00000;
        return;
      }
      lVar7 = lVar7 + 0x68;
    } while (lVar5 - lVar7 != 0);
    lVar7 = 0;
    do {
      plVar2 = *(long **)(lVar6 + lVar7);
      if ((plVar2[1] == 9) &&
         (plVar4 = (long *)*plVar2, (char)plVar4[1] == 'l' && *plVar4 == 0x6c6577746867696c)) {
        fVar8 = *(float *)(param_3 + 0x9ec);
        if (*(long *)(param_3 + 0x858) != 0) {
          lVar6 = *(long *)(param_3 + 0x858) * 0x20;
          fVar9 = *(float *)(*(long *)(param_3 + 0x850) + -4 + lVar6);
          if (fVar9 <= _DAT_145d70c34) {
            fVar9 = _DAT_145d70c34;
          }
          fVar9 = (*(float *)(*(long *)(param_3 + 0x850) + -0xc + lVar6) - fVar8) / fVar9;
          goto LAB_145946913;
        }
        fVar9 = *(float *)(lVar6 + 0x5c + lVar7);
        fVar11 = *(float *)(plVar2 + 9) * _DAT_145d73d40 * *(float *)(lVar6 + 0x2c + lVar7) *
                 *(float *)(lVar6 + 0x48 + lVar7) * *(float *)(param_3 + 0x480) *
                 *(float *)(lVar6 + 100 + lVar7);
        if (fVar11 <= _DAT_145d73d44) {
          fVar11 = _DAT_145d73d44;
        }
        fVar10 = (float)func_0x000145882c60(param_4,plVar4,9,plVar4);
        if (fVar10 <= fVar11) {
          fVar10 = fVar11;
        }
        if (fVar9 <= _DAT_145d70c34) {
          fVar9 = _DAT_145d70c34;
        }
        fVar11 = _DAT_145e81d10;
        if (*(long *)(param_3 + 0x7e0) == 0) goto LAB_1459468f8;
        lVar6 = *(long *)(param_3 + 0x7d8);
        lVar5 = 0;
        goto LAB_1459468c9;
      }
      lVar7 = lVar7 + 0x68;
    } while (lVar5 - lVar7 != 0);
  }
  *param_4 = 0;
  return;
LAB_1459468c9:
  if ((*(long *)(lVar6 + 8 + lVar5) == 9) &&
     ((char)(*(long **)(lVar6 + lVar5))[1] == (char)plVar4[1] &&
      **(long **)(lVar6 + lVar5) == *plVar4)) {
    fVar11 = *(float *)(lVar6 + 0x10 + lVar5);
    goto LAB_1459468f8;
  }
  lVar5 = lVar5 + 0x18;
  if (*(long *)(param_3 + 0x7e0) * 0x18 == lVar5) {
LAB_1459468f8:
    fVar11 = fVar11 - fVar8;
    if (fVar11 <= 0.0) {
      fVar11 = 0.0;
    }
    fVar9 = _DAT_145d6d36c - fVar11 / (fVar10 / fVar9);
LAB_145946913:
    fVar8 = 0.0;
    if (0.0 <= fVar9) {
      fVar8 = fVar9;
    }
    fVar9 = _DAT_145d6d36c;
    if (fVar8 <= _DAT_145d6d36c) {
      fVar9 = fVar8;
    }
    *param_4 = 0x146e79e0e;
    param_4[1] = 9;
    *(float *)(param_4 + 2) = fVar9;
    *(undefined4 *)((long)param_4 + 0x14) = 0x3f800000;
    return;
  }
  goto LAB_1459468c9;
}
