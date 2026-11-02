void FUN_145afd100(longlong param_1,ulonglong param_2,ulonglong param_3,longlong *param_4)

{
  code *pcVar1;
  longlong lStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;
  longlong *plStack_20;
  undefined8 uStack_18;

  uStack_18 = 0xfffffffffffffffe;
  plStack_20 = param_4;
  if (param_3 < param_2) {
    param_1 = param_1 + param_3 * 0xb0;
    lStack_38 = 0;
    uStack_30 = 1;
    uStack_28 = 0;
    FUN_145b5b2a0(param_1,param_4,&lStack_38);
    FUN_145c7e1b0(*(longlong *)(param_1 + 0x90) + 0x10,uStack_30,uStack_28);
    if (lStack_38 != 0) {
      func_0x0001400021d0(uStack_30,lStack_38,1);
    }
    if (*plStack_20 != 0) {
      func_0x0001400021d0(plStack_20[1],*plStack_20,1);
    }
    return;
  }
  FUN_14613b553(param_3,param_2,&DAT_1472db198);
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
