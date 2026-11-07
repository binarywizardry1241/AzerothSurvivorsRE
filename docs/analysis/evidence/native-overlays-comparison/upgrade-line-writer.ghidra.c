
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  ulong uVar1;

  if ((undefined1 *)*param_4 != (undefined1 *)param_4[1]) {
    uVar1 = CONCAT71((int7)((ulong)param_1 >> 8),*(undefined1 *)*param_4);
    func_0x0001454f94c0(uVar1,param_4[2],uVar1 & 0xffffffff,param_4[2],*(undefined8 *)param_4[3]);
                    /* WARNING: Could not emulate address calculation at 0x0001455188a8 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((uVar1 & 0xff) * 4 + 0x146cea26c) + 0x146cea26c))();
    return;
  }
  *(undefined8 *)*param_3 = param_3[1];
  return;
}
