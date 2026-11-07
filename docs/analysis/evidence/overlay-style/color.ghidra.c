void entry(undefined8 param_1,undefined8 param_2,uint *param_3,undefined8 param_4)

{
  code *UNRECOVERED_JUMPTABLE;

  UNRECOVERED_JUMPTABLE = (code *)((long)*(int *)((ulong)*param_3 * 4 + 0x146af06d8) + 0x146af06d8);
                    /* WARNING: Could not recover jumptable at 0x000144c85c54. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_4,param_3,UNRECOVERED_JUMPTABLE);
  return;
}
