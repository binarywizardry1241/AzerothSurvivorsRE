void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  ulong uVar1;
  code *UNRECOVERED_JUMPTABLE;
  ulong uVar2;

  if (((*(char *)(param_4 + 0xf4b) == '\x02') && (param_3 < *(ulong *)(param_4 + 0x740))) &&
     (*(char *)(param_4 + 0xf49) != -1)) {
    uVar1 = *(ulong *)(*(long *)(param_4 + 0x738) + 0x78 + param_3 * 0xa0);
    uVar2 = 1;
    if ((long)uVar1 < 0) {
      uVar2 = uVar1 ^ 0x8000000000000000;
    }
    UNRECOVERED_JUMPTABLE = (code *)((long)*(int *)(uVar2 * 4 + 0x147a1f7f8) + 0x147a1f7f8);
                    /* WARNING: Could not recover jumptable at 0x000145f50ed4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)
              (*(long *)(param_4 + 0x738) + param_3 * 0xa0,param_2,uVar2,UNRECOVERED_JUMPTABLE);
    return;
  }
  return;
}
