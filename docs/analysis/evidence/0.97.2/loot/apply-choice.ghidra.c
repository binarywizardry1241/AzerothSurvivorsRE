
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  long lVar1;
  long lVar2;
  code *UNRECOVERED_JUMPTABLE;

  if (((*(char *)(param_4 + 0x95f) == '\x02') && (param_3 < *(ulong *)(param_4 + 0x578))) &&
     (*(char *)(param_4 + 0x95d) != -1)) {
    lVar1 = *(long *)(*(long *)(param_4 + 0x570) + 0x78 + param_3 * 0xa0);
    lVar2 = 1;
    if (lVar1 < 0) {
      lVar2 = lVar1;
    }
    UNRECOVERED_JUMPTABLE = (code *)((long)*(int *)(lVar2 * 4 + 0x1469aceb8) + 0x1469aceb8);
                    /* WARNING: Could not recover jumptable at 0x0001454e4164. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)
              (*(long *)(param_4 + 0x570) + param_3 * 0xa0,0x8000000000000000,UNRECOVERED_JUMPTABLE)
    ;
    return;
  }
  return;
}
