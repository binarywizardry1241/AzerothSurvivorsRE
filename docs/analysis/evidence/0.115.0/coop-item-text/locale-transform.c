/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,short *param_3,undefined8 param_4,long param_5,
     undefined8 *param_6)

{
  long lVar1;
  ulong uVar2;
  long lVar3;
  undefined8 uVar4;
  undefined4 *puVar5;
  undefined8 uVar6;
  long in_GS_OFFSET;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;

  uVar4 = CONCAT71((int7)((ulong)param_4 >> 8),param_5 == 2 && param_3 != (short *)0x0);
  if (param_5 == 2 && param_3 != (short *)0x0) {
    if (*param_3 == 0x6e65) {
      uVar2 = 1;
      uVar4 = 0;
    }
    else {
      uVar2 = 1;
      if (*param_3 == 0x6c70) {
        uVar4 = 1;
      }
      else if (*param_3 == 0x7363) {
        uVar4 = 2;
      }
      else if (*param_3 == 0x6564) {
        uVar4 = 3;
      }
      else if (*param_3 == 0x7470) {
        uVar4 = 4;
      }
      else if (*param_3 == 0x7365) {
        uVar4 = 5;
      }
      else if (*param_3 == 0x7266) {
        uVar4 = 6;
      }
      else if (*param_3 == 0x6f72) {
        uVar4 = 7;
      }
      else if (*param_3 == 0x7274) {
        uVar4 = 8;
      }
      else if (*param_3 == 0x7572) {
        uVar4 = 9;
      }
      else if (*param_3 == 0x6b75) {
        uVar4 = 10;
      }
      else if (*param_3 == 0x687a) {
        uVar4 = 0xb;
      }
      else if (*param_3 == 0x616a) {
        uVar4 = 0xc;
      }
      else {
        uVar2 = (ulong)(*param_3 == 0x6f6b);
        uVar4 = 0xd;
      }
    }
  }
  else {
    uVar2 = 0;
  }
  lVar1 = *(long *)(*(long *)(in_GS_OFFSET + 0x58) + (ulong)_DAT_1482172f0 * 8);
  puVar5 = (undefined4 *)(lVar1 + 0x330);
  uVar7 = *(undefined4 *)(lVar1 + 0x330);
  uVar8 = *(undefined4 *)(lVar1 + 0x334);
  uVar9 = *(undefined4 *)(lVar1 + 0x338);
  uVar10 = *(undefined4 *)(lVar1 + 0x33c);
  *(ulong *)(lVar1 + 0x330) = uVar2;
  *(undefined8 *)(lVar1 + 0x338) = uVar4;
  uVar4 = *param_6;
  if (*(ulong *)param_6[2] < *(ulong *)(*(long *)param_6[1] + 0x10)) {
    lVar1 = *(long *)(*(long *)param_6[1] + 8);
    lVar3 = *(ulong *)param_6[2] * 0x10;
    uVar6 = *(undefined8 *)(lVar1 + lVar3);
    param_6 = *(undefined8 **)(lVar1 + 8 + lVar3);
  }
  else {
    uVar6 = 0;
  }
  func_0x0001459b0520(puVar5,param_4,uVar4,param_4,uVar6,param_6);
  *puVar5 = uVar7;
  puVar5[1] = uVar8;
  puVar5[2] = uVar9;
  puVar5[3] = uVar10;
  return param_4;
}
