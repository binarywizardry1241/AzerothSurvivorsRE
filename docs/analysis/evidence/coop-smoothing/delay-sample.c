
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145be08a0(undefined8 param_1,undefined8 param_2,double param_3,undefined8 param_4,
                  undefined8 param_5,uint param_6,ulong *param_7)

{
  ulong uVar1;
  ulong uVar2;
  ulong uVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  double dVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  double dVar11;
  
  dVar8 = _DAT_146333590;
  uVar9 = SUB84(param_3,0);
  uVar10 = (undefined4)((ulong)param_3 >> 0x20);
  dVar11 = _DAT_1461bb888 * param_3 - (double)param_6;
  uVar2 = *param_7;
  uVar6 = param_7[3];
  if (uVar6 == 0) {
    uVar3 = 0;
    if (uVar2 != 0) goto LAB_145be09d6;
  }
  else {
    uVar1 = param_7[1];
    uVar5 = param_7[2];
    uVar3 = 0;
    if (uVar2 <= uVar5) {
      uVar3 = uVar2;
    }
    if (_DAT_146333590 < param_3 - *(double *)(uVar1 + (uVar5 - uVar3) * 0x10)) {
      uVar3 = 0;
      do {
        uVar6 = uVar6 - 1;
        uVar7 = 0;
        if (uVar2 <= uVar5 + 1) {
          uVar7 = uVar2;
        }
        uVar5 = (uVar5 + 1) - uVar7;
        param_7[2] = uVar5;
        param_7[3] = uVar6;
        if (uVar6 == 0) goto LAB_145be09c2;
        uVar7 = uVar2;
        if (uVar5 < uVar2) {
          uVar7 = 0;
        }
      } while (dVar8 < param_3 - *(double *)(uVar1 + (uVar5 - uVar7) * 0x10));
    }
    uVar3 = uVar6;
    lVar4 = uVar1 + (uVar5 + uVar3) * 0x10 + -8;
    do {
      uVar6 = uVar2;
      if ((uVar5 - 1) + uVar3 < uVar2) {
        uVar6 = 0;
      }
      if (*(double *)(lVar4 + uVar6 * -0x10) < dVar11) goto LAB_145be09c2;
      lVar4 = lVar4 + -0x10;
      uVar3 = uVar3 - 1;
      param_7[3] = uVar3;
    } while (uVar3 != 0);
    uVar3 = 0;
LAB_145be09c2:
    if (uVar3 != uVar2) goto LAB_145be09d6;
  }
  func_0x000140759070();
  uVar2 = *param_7;
  uVar3 = param_7[3];
LAB_145be09d6:
  param_7[3] = uVar3 + 1;
  uVar6 = 0;
  if (uVar2 <= uVar3 + param_7[2]) {
    uVar6 = uVar2;
  }
  uVar2 = param_7[1];
  lVar4 = ((uVar3 + param_7[2]) - uVar6) * 0x10;
  *(ulong *)(uVar2 + lVar4) = CONCAT44(uVar10,uVar9);
  *(double *)(uVar2 + 8 + lVar4) = dVar11;
  dVar8 = dVar11;
  if (param_7[3] != 0) {
    uVar2 = 0;
    if (*param_7 <= param_7[2]) {
      uVar2 = *param_7;
    }
    dVar8 = *(double *)(param_7[1] + 8 + (param_7[2] - uVar2) * 0x10);
  }
  dVar11 = dVar11 - dVar8;
  if (dVar11 <= 0.0) {
    dVar11 = 0.0;
  }
  param_7[10] = (ulong)dVar11;
  return;
}

