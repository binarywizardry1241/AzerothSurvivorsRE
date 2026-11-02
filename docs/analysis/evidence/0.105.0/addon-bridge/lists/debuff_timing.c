/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,float param_4,undefined8 param_5,
     undefined8 param_6,long param_7,undefined4 *param_8,int param_9)

{
  undefined1 auVar1 [12];
  undefined4 uVar2;
  ulong uVar3;
  int *piVar4;
  float fVar5;
  int iVar6;
  float fVar7;
  float fVar8;
  undefined1 auVar9 [12];

  iVar6 = (int)((ulong)param_1 >> 0x20);
  if (*(long *)(param_7 + 0x10) != 0) {
    uVar3 = *(long *)(param_7 + 0x10) * 0x30 - 0x30;
    piVar4 = (int *)(*(long *)(param_7 + 8) + 0x54);
    do {
      if ((piVar4[-0x11] == param_9) && (piVar4[-0xd] != 0)) {
        fVar5 = (float)(piVar4[-0xd] - 1) * (float)piVar4[-0xf] + (float)piVar4[-0xe];
        fVar7 = (float)(piVar4[-0xc] + -1 + (uint)(piVar4[-0xc] == 0)) * (float)piVar4[-0xf];
        if (uVar3 != 0) {
          uVar3 = uVar3 / 0x30;
          do {
            if (piVar4[-1] != 0 && piVar4[-5] == param_9) {
              fVar8 = (float)(piVar4[-1] - 1) * (float)piVar4[-3] + (float)piVar4[-2];
              auVar9._0_4_ = (uint)((int)fVar5 >> 0x1f) >> 1;
              auVar9._4_4_ = (uint)((int)fVar8 >> 0x1f) >> 1;
              auVar9._8_4_ = (uint)(iVar6 >> 0x1f) >> 1;
              auVar1._4_4_ = fVar8;
              auVar1._0_4_ = fVar5;
              auVar1._8_4_ = iVar6;
              if (SUB124(auVar9 ^ auVar1,0) <= SUB124(auVar9 ^ auVar1,4)) {
                fVar7 = (float)piVar4[-3] * (float)(*piVar4 + -1 + (uint)(*piVar4 == 0));
                fVar5 = fVar8;
                iVar6 = 0;
              }
            }
            piVar4 = piVar4 + 0xc;
            uVar3 = uVar3 - 1;
          } while (uVar3 != 0);
        }
        goto LAB_1458df714;
      }
      uVar3 = uVar3 - 0x30;
      piVar4 = piVar4 + 0xc;
    } while (uVar3 != 0xffffffffffffffd0);
  }
  if ((param_9 != *(int *)(param_7 + 0x134)) ||
     (fVar5 = *(float *)(param_7 + 0xa4), fVar5 <= param_4)) {
    if ((param_9 != 0x76) ||
       (fVar5 = *(float *)(param_7 + 0x140), fVar7 = _DAT_145d6d650, fVar5 <= param_4)) {
      fVar5 = *(float *)(param_7 + 0x144);
      uVar2 = 0;
      if (fVar5 <= param_4) goto LAB_1458df723;
      fVar7 = fVar5 - *(float *)(param_7 + 0x148);
    }
  }
  else {
    fVar7 = *(float *)(param_7 + 0x138);
  }
LAB_1458df714:
  param_8[1] = fVar5;
  param_8[2] = fVar7;
  uVar2 = 1;
LAB_1458df723:
  *param_8 = uVar2;
  return param_8;
}
