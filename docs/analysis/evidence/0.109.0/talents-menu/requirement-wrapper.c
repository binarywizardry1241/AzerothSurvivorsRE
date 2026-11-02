undefined8
FUN_145910580(undefined8 param_1,undefined8 param_2,undefined1 param_3,undefined8 param_4,
             long *param_5)

{
  undefined8 uVar1;
  undefined1 local_31;
  undefined8 local_30;
  long local_28;
  long local_20;
  undefined8 local_18;
  undefined4 local_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  undefined4 uStack_4;

  local_28 = *param_5;
  if (local_28 != 0) {
    local_20 = param_5[1];
    local_10 = (undefined4)param_5[2];
    uStack_c = *(undefined4 *)((long)param_5 + 0x14);
    uStack_8 = (undefined4)param_5[3];
    uStack_4 = *(undefined4 *)((long)param_5 + 0x1c);
    local_30 = 1;
    local_18 = 1;
    local_31 = param_3;
    uVar1 = FUN_1459a00c0(param_1,param_2,&local_31,&local_30,param_4);
    return uVar1;
  }
  return 1;
}
