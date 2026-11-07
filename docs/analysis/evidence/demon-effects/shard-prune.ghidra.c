
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float *param_3,long param_4)

{
  float fVar1;
  float fVar2;
  ulong uVar3;
  long lVar4;
  float fVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;

  fVar5 = _DAT_145d6d36c;
  uVar3 = *(ulong *)(param_4 + 0x10);
  if (uVar3 != 0) {
    lVar4 = *(long *)(param_4 + 8);
    fVar1 = *param_3;
    uVar6 = 0;
    do {
      if (_DAT_145d6d36c <= fVar1 - *(float *)(lVar4 + uVar6 * 8)) {
        uVar8 = uVar6 + 1;
        uVar7 = uVar6;
        if (uVar8 < uVar3) {
          if (((int)uVar3 + (int)uVar6 & 1U) == 0) {
            if (fVar1 - *(float *)(lVar4 + 8 + uVar6 * 8) < _DAT_145d6d36c) {
              *(undefined8 *)(lVar4 + uVar6 * 8) = *(undefined8 *)(lVar4 + 8 + uVar6 * 8);
              uVar7 = uVar6 + 1;
            }
            uVar8 = uVar6 + 2;
          }
          if (uVar3 - 2 != uVar6) {
            do {
              if (fVar1 - *(float *)(lVar4 + uVar8 * 8) < fVar5) {
                *(undefined8 *)(lVar4 + uVar7 * 8) = *(undefined8 *)(lVar4 + uVar8 * 8);
                uVar7 = uVar7 + 1;
                fVar2 = *(float *)(lVar4 + 8 + uVar8 * 8);
              }
              else {
                fVar2 = *(float *)(lVar4 + 8 + uVar8 * 8);
              }
              if (fVar1 - fVar2 < fVar5) {
                *(undefined8 *)(lVar4 + uVar7 * 8) = *(undefined8 *)(lVar4 + 8 + uVar8 * 8);
                uVar7 = uVar7 + 1;
              }
              uVar8 = uVar8 + 2;
            } while (uVar3 != uVar8);
          }
        }
        *(ulong *)(param_4 + 0x10) = uVar7;
        return;
      }
      uVar6 = uVar6 + 1;
    } while (uVar3 != uVar6);
  }
  return;
}
