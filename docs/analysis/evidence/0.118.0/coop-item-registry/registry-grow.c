void entry(void)

{
  code *pcVar1;
  ulong *in_RCX;
  ulong uVar2;
  int local_28;
  ulong local_20;

  uVar2 = 4;
  if (4 < *in_RCX * 2) {
    uVar2 = *in_RCX * 2;
  }
  func_0x000145f94600();
  if (local_28 != 1) {
    in_RCX[1] = local_20;
    *in_RCX = uVar2;
    return;
  }
  func_0x00014613ad3b();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
