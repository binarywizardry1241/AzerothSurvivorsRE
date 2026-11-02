long * FUN_1401a5860(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  long lStack_48;
  long lStack_40;
  long lStack_38;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined8 uStack_18;
  undefined8 uStack_8;

  uStack_18 = param_3[4];
  uStack_28 = *(undefined4 *)(param_3 + 2);
  uStack_24 = *(undefined4 *)((long)param_3 + 0x14);
  uStack_20 = *(undefined4 *)(param_3 + 3);
  uStack_1c = *(undefined4 *)((long)param_3 + 0x1c);
  uStack_8 = param_2;
  entry(param_1,param_4,&uStack_28,&lStack_48,*param_3,param_3[1]);
  if (lStack_48 != 0) {
    param_4[2] = lStack_38;
  }
  *param_4 = lStack_48;
  param_4[1] = lStack_40;
  return param_4;
}
