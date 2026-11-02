
/* WARNING: Removing unreachable block (ram,0x0001458c1e56) */
/* WARNING: Removing unreachable block (ram,0x0001458c1e7e) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(void)

{
  code *pcVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined4 *puVar4;
  undefined8 *in_RCX;
  long lVar5;
  undefined4 in_R8D;
  undefined4 uVar6;
  undefined4 in_XMM3_Da;
  undefined4 in_stack_00000028;
  uint in_stack_00000030;
  undefined2 uStack_70;
  undefined6 uStack_6e;
  undefined4 uStack_6c;
  
  uVar2 = _uStack_70;
  func_0x000140002200();
  puVar4 = (undefined4 *)func_0x0001400021c0();
  if (puVar4 == (undefined4 *)0x0) {
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  _uStack_70 = CONCAT62(uStack_6e,0xef);
  uVar3 = _uStack_70;
  func_0x0001458cf2e0();
  uStack_6c = SUB84(uVar2,4);
  *puVar4 = in_R8D;
  lVar5 = 4;
  uVar6 = func_0x000145bfa11d(in_XMM3_Da);
  *(undefined4 *)((long)puVar4 + lVar5) = uVar6;
  lVar5 = lVar5 + 4;
  if (0x20U - lVar5 < 4) {
    func_0x000145bfa970();
  }
  uVar6 = func_0x000145bfa117(in_XMM3_Da);
  *(undefined4 *)((long)puVar4 + lVar5) = uVar6;
  if (0x20U - (lVar5 + 4) < 4) {
    func_0x000145bfa970();
  }
  *(undefined4 *)((long)puVar4 + lVar5 + 4) = in_stack_00000028;
  if (0x20U - (lVar5 + 8) < 4) {
    func_0x000145bfa970();
  }
  *(uint *)((long)puVar4 + lVar5 + 8) = in_stack_00000030 ^ _DAT_145dcd0a0;
  *in_RCX = 0x20;
  in_RCX[1] = puVar4;
  in_RCX[2] = lVar5 + 0xc;
  in_RCX[3] = CONCAT44(uStack_6c,(int)uVar3);
  return in_RCX;
}

