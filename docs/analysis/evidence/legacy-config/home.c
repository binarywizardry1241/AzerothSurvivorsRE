/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  long lVar1;
  long local_58;
  ulong uStack_50;
  long local_48;
  long lStack_40;
  long local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  func_0x000145cb90a0(param_1,param_4,0x14602b06d,&local_58,0xb);
  if (local_58 != -1) {
    if (local_58 != 0) {
      func_0x0001400021d0();
    }
    *param_4 = -1;
    return param_4;
  }
  func_0x000145cb90a0();
  if (local_58 == -1) {
    func_0x000145cb90a0();
    if (((local_58 != -1) || (func_0x000145cb90a0(), local_58 != -1)) ||
       (func_0x000145cb90a0(), local_58 != -1)) {
      if (local_58 != 0) {
        func_0x0001400021d0();
      }
      if (_DAT_1481a60b8 != 0) {
        func_0x000145d23d58();
      }
      func_0x000145ca5b40();
      return param_4;
    }
    *param_4 = -1;
    func_0x000145cb3990();
    if (local_58 == -1) {
      if (((uint)uStack_50 & 3) - 2 < 2) {
        return param_4;
      }
      if ((uStack_50 & 3) != 0) {
        func_0x000145cdf070();
        return param_4;
      }
      return param_4;
    }
    local_38 = local_58;
    lVar1 = func_0x000145ca62e0();
    if (lVar1 == 0) {
      lVar1 = -1;
    }
    else {
      func_0x000145ca5b40();
      lVar1 = local_58;
    }
    if (local_38 != 0) {
      func_0x0001400021d0();
    }
    if (lVar1 == -1) {
      return param_4;
    }
    local_38 = lVar1;
    func_0x000145ca61b0();
    if (local_38 != 0) {
      func_0x0001400021d0();
    }
  }
  param_4[2] = local_48;
  param_4[3] = lStack_40;
  *param_4 = local_58;
  param_4[1] = uStack_50;
  return param_4;
}
