
/* WARNING: Control flow encountered bad instruction data */

void entry(long param_1,undefined8 param_2)

{
  long lVar1;
  long unaff_RBP;
  long lVar2;
  
  func_0x000145ec0be0(param_1,param_2,0x19,unaff_RBP + 0x58);
  func_0x000145ec0c80();
  lVar1 = *(long *)(param_1 + 0x30);
  func_0x000145ec0d80();
  lVar2 = *(long *)(param_1 + 0x28);
  lVar1 = lVar2 + lVar1 * 0x18;
  for (; lVar2 != lVar1; lVar2 = lVar2 + 0x18) {
    func_0x000145ec0c80();
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

