
undefined8 * entry(void)

{
  code *pcVar1;
  undefined4 *puVar2;
  undefined8 *in_RCX;
  long lVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  int local_d0;
  undefined4 local_c8;
  undefined8 local_c0;
  int local_b8;
  undefined4 uStack_b0;
  undefined8 local_a8;
  long local_68;
  
  func_0x0001455149f0();
  if (local_b8 == 1) {
    func_0x000140002200();
    puVar2 = (undefined4 *)func_0x0001400021c0();
    if (puVar2 == (undefined4 *)0x0) {
      func_0x0001458e721b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    *puVar2 = uStack_b0;
    *(undefined8 *)(puVar2 + 2) = local_a8;
    local_68 = 1;
    lVar3 = 0x18;
    puVar4 = puVar2;
    while( true ) {
      func_0x0001455149f0();
      if (local_d0 != 1) break;
      uVar5 = local_c8;
      if (local_68 == 4) {
        func_0x000145757d40();
        puVar4 = puVar2;
      }
      *(undefined4 *)((long)puVar4 + lVar3 + -8) = uVar5;
      *(undefined8 *)((long)puVar4 + lVar3) = local_c0;
      local_68 = local_68 + 1;
      lVar3 = lVar3 + 0x10;
    }
    in_RCX[2] = local_68;
    *in_RCX = 4;
    in_RCX[1] = puVar2;
  }
  else {
    *in_RCX = 0;
    in_RCX[1] = 8;
    in_RCX[2] = 0;
  }
  return in_RCX;
}

