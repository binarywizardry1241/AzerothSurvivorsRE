/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,undefined8 param_5
     ,ulong param_6)

{
  ulong uVar1;
  float fVar2;
  undefined4 uVar3;

  uVar3 = (undefined4)((ulong)param_1 >> 0x20);
  fVar2 = (float)param_1;
  if (param_6 < 0x20) {
    uVar1 = func_0x000145bd5590();
  }
  else {
    uVar1 = func_0x000145bd4f70(param_2,param_3,param_6,param_4);
  }
  if (uVar1 < 0xd) {
    return CONCAT44(uVar3,fVar2);
  }
  return CONCAT44(uVar3,fVar2 * (((float)uVar1 + _DAT_145dccf50) * _DAT_145dccf54 + _DAT_145d9d2a0))
  ;
}
