
void entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 param_4)

{
  ulong uVar1;
  
  uVar1 = 3;
  if ((long)*param_3 < 0) {
    uVar1 = *param_3 ^ 0x8000000000000000;
  }
  if (uVar1 - 1 < 0x14) {
                    /* WARNING: Could not emulate address calculation at 0x000145c2f713 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((uVar1 - 1) * 4 + 0x1476acce4) + 0x1476acce4))();
    return;
  }
  func_0x000145c03d60(param_1,param_4,param_3,param_3);
  return;
}

