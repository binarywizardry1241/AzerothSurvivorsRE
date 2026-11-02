
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  ulong *puVar1;
  ulong uVar2;
  code *pcVar3;

  puVar1 = (ulong *)*param_4;
  if (puVar1 == (ulong *)param_4[1]) {
    *(undefined8 *)*param_3 = param_3[1];
    return;
  }
  uVar2 = *(ulong *)param_4[2];
  if (uVar2 < 6) {
                    /* WARNING: Could not recover jumptable at 0x00014554c873. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((*puVar1 & 0xffffffff) * 4 + 0x146d37570) + 0x146d37570))
              (*(float *)(uVar2 * 4 + 0x146d36b40) * _DAT_145947ed4);
    return;
  }
  func_0x000145903b33((ulong)(param_4[1] - (long)puVar1) >> 3,puVar1,6,uVar2,0x146d36b80);
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
