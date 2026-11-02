void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,ulong param_5,
          long *param_6)

{
  code *pcVar1;
  long local_38 [3];
  long *local_20;
  undefined8 local_18;
  undefined8 uStack_10;

  local_18 = 0xfffffffffffffffe;
  local_20 = param_6;
  uStack_10 = param_2;
  if (param_5 < param_3) {
    param_4 = param_4 + param_5 * 0xb0;
    local_38[0] = 0;
    local_38[1] = 1;
    local_38[2] = 0;
    func_0x000145b5b1f0(param_1,param_4,param_6,param_4,local_38);
    func_0x000145c7dd30();
    if (local_38[0] != 0) {
      func_0x0001400021d0();
    }
    if (*local_20 != 0) {
      func_0x0001400021d0();
    }
    return;
  }
  func_0x00014613b0d3();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
