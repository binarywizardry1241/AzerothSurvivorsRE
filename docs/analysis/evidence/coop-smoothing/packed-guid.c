
/* WARNING: Type propagation algorithm not settling */

void entry(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 *param_4,ulong param_5)

{
  byte bVar1;
  ulong uVar2;
  ulong uVar3;
  
  if (param_5 != 0) {
    bVar1 = *param_3;
    if ((bVar1 & 1) == 0) {
      uVar3 = 1;
      uVar2 = 0;
    }
    else {
      if (param_5 == 1) goto LAB_145be1af3;
      uVar2 = (ulong)param_3[1];
      uVar3 = 2;
    }
    if ((bVar1 & 2) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 8;
      uVar3 = uVar3 + 1;
    }
    if ((bVar1 & 4) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x10;
      uVar3 = uVar3 + 1;
    }
    if ((bVar1 & 8) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x18;
      uVar3 = uVar3 + 1;
    }
    if ((bVar1 & 0x10) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x20;
      uVar3 = uVar3 + 1;
    }
    if ((bVar1 & 0x20) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x28;
      uVar3 = uVar3 + 1;
    }
    if ((bVar1 & 0x40) != 0) {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x30;
      uVar3 = uVar3 + 1;
    }
    if ((char)bVar1 < '\0') {
      if (param_5 <= uVar3) goto LAB_145be1af3;
      uVar2 = uVar2 | (ulong)param_3[uVar3] << 0x38;
      uVar3 = uVar3 + 1;
    }
    param_4[1] = uVar2;
    param_4[2] = uVar3;
    *param_4 = 1;
    return;
  }
LAB_145be1af3:
  *param_4 = 0;
  return;
}

