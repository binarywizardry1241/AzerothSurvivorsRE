
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,long param_5)

{
  code *UNRECOVERED_JUMPTABLE;

  UNRECOVERED_JUMPTABLE =
       (code *)((long)*(int *)((ulong)*(byte *)(param_5 + 0x48) * 4 + 0x146d35dcc) + 0x146d35dcc);
                    /* WARNING: Could not emulate address calculation at 0x00014552e121 */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_3,0x146d35dcc,UNRECOVERED_JUMPTABLE);
  return;
}
