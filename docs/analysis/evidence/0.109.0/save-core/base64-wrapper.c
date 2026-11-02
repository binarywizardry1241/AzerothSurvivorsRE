ulong * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,ulong *param_4,
             undefined8 param_5,long param_6)

{
  code *pcVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  int local_70;
  byte local_68;
  uint local_67;
  uint3 local_63;
  ulong local_60;

  uVar4 = param_6 + 3U >> 2;
  uVar2 = uVar4 * 3;
  if (uVar4 == 0) {
    uVar3 = 1;
  }
  else {
    func_0x000140002200(param_3);
    uVar3 = func_0x0001400021f0();
    if (uVar3 == 0) {
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
  }
  func_0x0001459f8370();
  if (local_70 == 2) {
    if ((ulong)local_68 == 0xff) {
      func_0x000145d99830();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    param_4[1] = (ulong)local_67 << 8 | (ulong)local_63 << 0x28 | (ulong)local_68;
    param_4[2] = local_60;
    *param_4 = 0xffffffffffffffff;
    if (uVar4 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    if (uVar2 <= local_60) {
      local_60 = uVar2;
    }
    *param_4 = uVar2;
    param_4[1] = uVar3;
    param_4[2] = local_60;
  }
  return param_4;
}
