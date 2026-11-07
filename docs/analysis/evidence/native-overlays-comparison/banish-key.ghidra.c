
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,long param_5)

{
  long lVar1;

  lVar1 = 1;
  if (*(long *)(param_5 + 0x78) < 0) {
    lVar1 = *(long *)(param_5 + 0x78);
  }
                    /* WARNING: Could not recover jumptable at 0x0001454da40b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(lVar1 * 4 + 0x1469acdf8) + 0x1469acdf8))(param_1,param_4);
  return;
}
