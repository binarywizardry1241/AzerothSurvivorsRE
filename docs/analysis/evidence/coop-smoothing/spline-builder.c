
/* WARNING: Removing unreachable block (ram,0x000145c67e8c) */
/* WARNING: Removing unreachable block (ram,0x000145c67d26) */
/* WARNING: Removing unreachable block (ram,0x000145c67e3c) */
/* WARNING: Removing unreachable block (ram,0x000145c67e64) */
/* WARNING: Removing unreachable block (ram,0x000145c67eb4) */

undefined8 entry(void)

{
  code *pcVar1;
  undefined4 *puVar2;
  undefined8 in_RCX;
  undefined8 in_R9;
  undefined4 in_stack_00000028;
  int in_stack_00000030;
  
  func_0x000140002200(in_R9,in_RCX);
  puVar2 = (undefined4 *)func_0x0001400021c0();
  if (puVar2 == (undefined4 *)0x0) {
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000145aaeb70();
  func_0x000145aa4130();
  *puVar2 = in_stack_00000028;
  *(undefined1 *)(puVar2 + 1) = 0;
  *(undefined4 *)((long)puVar2 + 5) = 0x100;
  *(uint *)((long)puVar2 + 9) = in_stack_00000030 + (uint)(in_stack_00000030 == 0);
  *(undefined4 *)((long)puVar2 + 0xd) = 1;
  func_0x000145aa4130();
  return in_RCX;
}

