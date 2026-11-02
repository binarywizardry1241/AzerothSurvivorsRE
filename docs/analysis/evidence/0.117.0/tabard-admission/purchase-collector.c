
undefined8 * entry(void)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined8 *in_RCX;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 uVar4;
  long local_48;

  iVar2 = func_0x000145c382a0();
  if (iVar2 == 1) {
    uVar4 = extraout_EDX;
    func_0x000140002200();
    puVar3 = (undefined4 *)func_0x0001400021c0();
    if (puVar3 == (undefined4 *)0x0) {
      func_0x00014613acbb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    *puVar3 = uVar4;
    local_48 = 1;
    func_0x000145f93cdb();
    while( true ) {
      iVar2 = func_0x000145c382a0();
      if (iVar2 != 1) break;
      if (local_48 == 4) {
        func_0x000145f940f0();
      }
      puVar3[local_48] = extraout_EDX_00;
      local_48 = local_48 + 1;
    }
    in_RCX[2] = local_48;
    *in_RCX = 4;
    in_RCX[1] = puVar3;
  }
  else {
    *in_RCX = 0;
    in_RCX[1] = 4;
    in_RCX[2] = 0;
  }
  return in_RCX;
}
