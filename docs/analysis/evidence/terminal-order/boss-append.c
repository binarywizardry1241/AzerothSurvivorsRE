/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,long param_2)

{
  long lVar1;

  lVar1 = *(long *)(param_2 + 0x568);
  if (lVar1 == *(long *)(param_2 + 0x558)) {
    func_0x000145d7e400();
  }
  func_0x000145bfa0e7();
  *(long *)(param_2 + 0x568) = lVar1 + 1;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
