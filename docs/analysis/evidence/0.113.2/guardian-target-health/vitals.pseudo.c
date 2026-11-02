/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  long unaff_RBX;
  long unaff_RBP;
  undefined4 uVar1;

  uVar1 = *(undefined4 *)(unaff_RBX + 0x160);
  func_0x000145cf99f7(*(undefined4 *)(unaff_RBX + 0x164));
  *(undefined8 *)(unaff_RBP + 0xa8) = 0;
  *(undefined8 *)(unaff_RBP + 0xb8) = 0;
  func_0x0001459a18c0();
  func_0x000145cf99f7(uVar1);
  func_0x0001459a18c0();
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
