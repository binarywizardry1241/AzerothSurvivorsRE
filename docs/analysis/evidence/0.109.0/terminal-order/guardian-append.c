/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  long lVar1;
  long unaff_R13;

  lVar1 = *(long *)(unaff_R13 + 0x568);
  if (lVar1 == *(long *)(unaff_R13 + 0x558)) {
    func_0x000145d7e400();
  }
  func_0x000145bfa0e7();
  *(long *)(unaff_R13 + 0x568) = lVar1 + 1;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
