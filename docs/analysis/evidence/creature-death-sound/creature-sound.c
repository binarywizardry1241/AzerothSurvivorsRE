void entry(undefined8 param_1,undefined8 param_2)

{
  int local_70 [2];
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined8 local_58;
  undefined8 *local_50;
  undefined8 uStack_48;
  undefined8 local_40;
  undefined8 *local_30;
  undefined8 local_28;
  undefined8 uStack_20;
  undefined8 local_18;
  undefined8 local_10;

  local_10 = 0xfffffffffffffffe;
  func_0x000145aa7e60(param_1,param_2,0x1475df48a,local_70,0x23);
  if (local_70[0] == 1) {
    local_18 = local_58;
    local_28 = (undefined8 *)CONCAT44(uStack_64,local_68);
    uStack_20 = CONCAT44(uStack_5c,uStack_60);
    local_50 = &local_28;
    uStack_48 = 0x1400020e0;
    func_0x000145f503f0(param_1,param_2,&local_50,0x1475df4da);
    local_30 = local_28;
  }
  else {
    local_30 = (undefined8 *)CONCAT44(uStack_64,local_68);
    func_0x000145b45bf0();
    if (local_50 == (undefined8 *)0xffffffffffffffff) {
      local_28 = (undefined8 *)0x1475df4b0;
      uStack_20 = 0x1400020c0;
      func_0x000145f503f0(param_1,param_2,&local_28,0x1475df4c0);
    }
    else {
      local_18 = local_40;
      local_28 = local_50;
      uStack_20 = uStack_48;
      func_0x000145e6fd70(param_1,param_2,0x23,0x1475df48a,&local_28);
    }
  }
  if (local_30 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  return;
}
