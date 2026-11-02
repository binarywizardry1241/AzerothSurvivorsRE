
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4)

{
  long lVar1;

  lVar1 = 2;
  if (*param_3 < 0) {
    lVar1 = *param_3;
  }
                    /* WARNING: Could not recover jumptable at 0x000145b7a7a1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(lVar1 * 4 + 0x1473ad390) + 0x1473ad390))(param_3,param_4);
  return;
}
