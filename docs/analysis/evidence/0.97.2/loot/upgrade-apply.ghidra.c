
void entry(void)

{
  long lVar1;
  long *in_R8;

  lVar1 = 1;
  if (*in_R8 < 0) {
    lVar1 = *in_R8;
  }
                    /* WARNING: Could not recover jumptable at 0x0001454dedef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(lVar1 * 4 + 0x1469ace58) + 0x1469ace58))();
  return;
}
