/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  long lVar1;
  long lVar2;
  long lVar3;
  ulong uVar4;
  ulong unaff_RBX;
  long unaff_RBP;
  long lVar5;
  ulong unaff_R12;

  lVar1 = *(long *)(unaff_RBP + 0x238);
  lVar2 = *(long *)(lVar1 + 0x578);
  lVar3 = *(long *)(lVar1 + 0x580);
  uVar4 = *(ulong *)(lVar1 + 0x5b0);
  lVar1 = *(long *)(lVar1 + 0x5a8);
  *(bool *)(unaff_RBP + 0x108) = unaff_R12 < unaff_RBX;
  if (unaff_R12 >= unaff_RBX) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  if (lVar3 != 0) {
    if (uVar4 <= unaff_R12) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    lVar5 = 0;
    do {
      if ((*(long *)(lVar2 + 0xf0 + lVar5) == *(long *)(lVar1 + 0x20 + unaff_R12 * 0x80)) &&
         (*(int *)(lVar2 + 0xb0 + lVar5) != 1)) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      lVar5 = lVar5 + 0x1e0;
    } while (lVar3 * 0x1e0 - lVar5 != 0);
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
