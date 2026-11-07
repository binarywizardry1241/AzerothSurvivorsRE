long entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,ulong param_4)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  undefined1 auVar4 [16];
  ulong *local_60;
  undefined8 local_58;
  long local_50;
  undefined8 local_48;
  undefined8 local_40;
  ulong local_38 [2];

  local_38[1] = 0xfffffffffffffffe;
  local_38[0] = 5;
  if (param_4 < 5) {
    local_38[0] = param_4;
  }
  local_60 = local_38;
  local_58 = 0x145bdf7d0;
  func_0x000145bcce30(param_1,param_2,0x14722e1dc,&local_50,&local_60);
  if (local_38[0] < 6) {
    lVar3 = *(long *)(local_38[0] * 0x10 + 0x14722e208);
    auVar4 = func_0x0001458ec500(local_48,lVar3,local_40,local_48);
    lVar2 = auVar4._0_8_;
    if (local_50 != 0) {
      func_0x0001400021d0(auVar4._8_8_);
    }
    if (lVar2 == 0) {
      lVar2 = lVar3;
    }
    return lVar2;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
