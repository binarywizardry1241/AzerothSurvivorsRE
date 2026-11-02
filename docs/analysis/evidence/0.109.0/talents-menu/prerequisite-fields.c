undefined8 *
FUN_14590ea90(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;

  uVar1 = *param_3;
  uVar2 = param_3[1];
  uVar3 = param_3[2];
  uVar4 = param_3[3];
  *param_4 = 1;
  param_4[1] = uVar1;
  param_4[2] = uVar2;
  param_4[3] = 1;
  param_4[4] = uVar3;
  param_4[5] = uVar4;
  return param_4;
}
