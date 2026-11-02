undefined8 * entry(void)

{
  code *pcVar1;
  ulong uVar2;
  undefined1 *puVar3;
  undefined8 *in_RCX;
  undefined1 extraout_DL;
  undefined1 extraout_DL_00;
  long lVar4;
  long local_48;

  uVar2 = func_0x000145c48790();
  if ((uVar2 & 1) == 0) {
    *in_RCX = 0;
    in_RCX[1] = 1;
    in_RCX[2] = 0;
  }
  else {
    func_0x000140002200();
    lVar4 = 1;
    puVar3 = (undefined1 *)func_0x0001400021c0();
    if (puVar3 == (undefined1 *)0x0) {
      func_0x00014614ad6b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    *puVar3 = extraout_DL;
    local_48 = 1;
    func_0x000145fa3aab();
    while( true ) {
      uVar2 = func_0x000145c48790();
      if ((uVar2 & 1) == 0) break;
      if (lVar4 == 8) {
        func_0x000145fa3ec0();
      }
      puVar3[lVar4] = extraout_DL_00;
      lVar4 = lVar4 + 1;
      local_48 = lVar4;
    }
    in_RCX[2] = local_48;
    *in_RCX = 8;
    in_RCX[1] = puVar3;
  }
  return in_RCX;
}
