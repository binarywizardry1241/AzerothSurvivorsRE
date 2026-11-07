
/* WARNING: Removing unreachable block (ram,0x000145c6aa43) */
/* WARNING: Removing unreachable block (ram,0x000145c6aa6b) */

undefined8 * entry(void)

{
  code *pcVar1;
  undefined8 uVar2;
  undefined4 *puVar3;
  undefined8 *in_RCX;
  undefined4 in_R8D;
  undefined4 in_XMM3_Da;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  
  uVar2 = _uStack_50;
  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 == (undefined4 *)0x0) {
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  _uStack_50 = CONCAT62(stack0xffffffffffffffb2,0xe2);
  func_0x000145aaeb70();
  uStack_4c = SUB84(uVar2,4);
  *puVar3 = in_R8D;
  puVar3[1] = in_XMM3_Da;
  *in_RCX = 0x20;
  in_RCX[1] = puVar3;
  in_RCX[2] = 8;
  in_RCX[3] = CONCAT44(uStack_4c,uStack_50);
  return in_RCX;
}

