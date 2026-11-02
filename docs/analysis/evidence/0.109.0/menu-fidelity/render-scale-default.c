/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140beb6a0(undefined8 param_1,undefined8 param_2)

{
  undefined4 in_XMM6_Da;
  long local_60;
  long local_58;
  undefined8 local_50;
  undefined8 local_40;
  long local_38;
  undefined8 local_30;
  undefined4 local_28;
  undefined8 uStack_10;

  local_30 = 0xfffffffffffffffe;
  local_28 = in_XMM6_Da;
  uStack_10 = param_2;
  func_0x000145bbd970(param_1,param_2,0x145f99da0,&local_60,0x10);
  if (local_60 == -2) {
    if (local_58 != -1) {
      local_38 = local_58;
      local_40 = local_50;
      func_0x000145bdb8d0();
      if (local_38 != 0) {
        func_0x0001400021d0();
      }
    }
  }
  else if ((local_60 != -1) && (local_60 != 0)) {
    func_0x0001400021d0();
  }
  return;
}
