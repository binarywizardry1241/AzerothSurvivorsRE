
void entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 param_4)

{
  ulong uVar1;
  
  uVar1 = 3;
  if ((long)*param_3 < 0) {
    uVar1 = *param_3 ^ 0x8000000000000000;
  }
  if (uVar1 - 1 < 0x18) {
                    /* WARNING: Could not emulate address calculation at 0x000145bd7bb3 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((uVar1 - 1) * 4 + 0x147085ea0) + 0x147085ea0))();
    return;
  }
  func_0x000145baa5d0(param_1,param_4,param_3,param_3);
  return;
}

