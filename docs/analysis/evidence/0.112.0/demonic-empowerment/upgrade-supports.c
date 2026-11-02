
undefined8 FUN_1458967f0(undefined8 param_1,undefined8 param_2,byte param_3,long param_4)

{
  byte *pbVar1;
  undefined7 uVar3;
  undefined8 uVar2;
  long lVar4;

  if (*(char *)(param_4 + 0x75) != '\v') {
                    /* WARNING: Could not emulate address calculation at 0x000145896842 */
                    /* WARNING: Treating indirect jump as call */
    uVar2 = (*(code *)((long)*(int *)((ulong)param_3 * 4 + 0x146bfec98) + 0x146bfec98))();
    return uVar2;
  }
  lVar4 = 0;
  do {
    if (*(long *)(param_4 + 0x38) == lVar4) {
      return 0;
    }
    pbVar1 = (byte *)(*(long *)(param_4 + 0x30) + lVar4);
    lVar4 = lVar4 + 1;
  } while (*pbVar1 != param_3);
  uVar3 = (undefined7)((ulong)*(long *)(param_4 + 0x30) >> 8);
  if (param_3 == 2) {
    return CONCAT71(uVar3,*(int *)(param_4 + 0x54) != 0);
  }
  return CONCAT71(uVar3,1);
}
