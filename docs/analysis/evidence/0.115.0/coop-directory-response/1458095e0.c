
undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  undefined8 uVar1;
  code *UNRECOVERED_JUMPTABLE;

  if (param_3 - 2U < 7) {
    UNRECOVERED_JUMPTABLE = (code *)((long)*(int *)((param_3 - 2U) * 4 + 0x146cca80c) + 0x146cca80c)
    ;
                    /* WARNING: Could not emulate address calculation at 0x0001458095f5 */
                    /* WARNING: Treating indirect jump as call */
    uVar1 = (*UNRECOVERED_JUMPTABLE)(param_1,param_2,UNRECOVERED_JUMPTABLE);
    return uVar1;
  }
  return 0;
}
