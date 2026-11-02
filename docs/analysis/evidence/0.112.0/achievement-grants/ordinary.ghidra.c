
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,long param_5)

{
  code *UNRECOVERED_JUMPTABLE;

  UNRECOVERED_JUMPTABLE =
       (code *)((long)*(int *)((ulong)*(byte *)(param_5 + 0x48) * 4 + 0x1472434fc) + 0x1472434fc);
                    /* WARNING: Could not emulate address calculation at 0x0001459b47f1 */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(param_1,param_3,0x1472434fc,UNRECOVERED_JUMPTABLE);
  return;
}
