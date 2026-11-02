void FUN_14590e600(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;

  if ((ulong)*param_3 < 0x23) {
                    /* WARNING: Could not emulate address calculation at 0x00014590e61a */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*param_3 * 4 + 0x147229430) + 0x147229430))();
    return;
  }
  uVar1 = *(undefined8 *)param_3;
  uVar2 = *(undefined8 *)(param_3 + 8);
  uVar3 = *(undefined8 *)(param_3 + 0x10);
  uVar4 = *(undefined8 *)(param_3 + 0x18);
  uVar5 = *(undefined8 *)(param_3 + 0x20);
  uVar6 = *(undefined8 *)(param_3 + 0x28);
  uVar7 = *(undefined8 *)(param_3 + 0x38);
  param_4[6] = *(undefined8 *)(param_3 + 0x30);
  param_4[7] = uVar7;
  param_4[4] = uVar5;
  param_4[5] = uVar6;
  param_4[2] = uVar3;
  param_4[3] = uVar4;
  *param_4 = uVar1;
  param_4[1] = uVar2;
  return;
}
