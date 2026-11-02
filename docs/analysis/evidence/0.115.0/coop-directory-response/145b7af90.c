
undefined8 *
entry(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 *param_4,long param_5)

{
  undefined8 *puVar1;

  if (param_5 != 0) {
    if (*param_3 - 0x14 < 0xb) {
                    /* WARNING: Could not emulate address calculation at 0x000145b7aff0 */
                    /* WARNING: Treating indirect jump as call */
      puVar1 = (undefined8 *)
               (*(code *)((long)*(int *)((ulong)(*param_3 - 0x14) * 4 + 0x1473ad3bc) + 0x1473ad3bc))
                         ();
      return puVar1;
    }
  }
  *param_4 = 0xffffffffffffffff;
  return param_4;
}
