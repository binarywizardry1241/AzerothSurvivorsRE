undefined8 * entry(void)

{
  undefined4 *puVar1;
  code *pcVar2;
  undefined4 *puVar3;
  undefined8 *in_RCX;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  long local_68;

  func_0x000140085700();
  if (CONCAT44(uStack_94,local_98) == -1) {
    *in_RCX = 0;
    in_RCX[1] = 8;
    in_RCX[2] = 0;
    func_0x000140067f90();
  }
  else {
    func_0x000140002200();
    puVar3 = (undefined4 *)func_0x0001400021c0();
    if (puVar3 == (undefined4 *)0x0) {
      func_0x000145e9bd8b();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    puVar3[4] = local_88;
    puVar3[5] = uStack_84;
    puVar3[6] = uStack_80;
    puVar3[7] = uStack_7c;
    *puVar3 = local_98;
    puVar3[1] = uStack_94;
    puVar3[2] = uStack_90;
    puVar3[3] = uStack_8c;
    local_68 = 1;
    func_0x000145cf998b();
    while( true ) {
      func_0x000140085700();
      if (CONCAT44(uStack_b4,local_b8) == -1) break;
      if (local_68 == 4) {
        func_0x000145cf9da0();
      }
      *(undefined8 *)(puVar3 + local_68 * 8 + 4) = local_a8;
      *(undefined8 *)((long)(puVar3 + local_68 * 8 + 4) + 8) = uStack_a0;
      puVar1 = puVar3 + local_68 * 8;
      *puVar1 = local_b8;
      puVar1[1] = uStack_b4;
      puVar1[2] = uStack_b0;
      puVar1[3] = uStack_ac;
      local_68 = local_68 + 1;
    }
    func_0x000140067f90();
    in_RCX[2] = local_68;
    *in_RCX = 4;
    in_RCX[1] = puVar3;
  }
  return in_RCX;
}
