/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  ulong uVar7;
  float fVar8;

  uVar6 = uRam000000014722d5bc;
  uVar5 = uRam000000014722d5b8;
  uVar4 = uRam000000014722d5b4;
  uVar3 = _DAT_14722d4b0;
  uVar2 = _DAT_145de4d14;
  uVar1 = *(undefined4 *)(param_3 + 0xd0);
  uVar7 = *(long *)(param_3 + 0x10) - 2;
  if (uVar7 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x0001459a77ec */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)(uVar7 * 4 + 0x147236248) + 0x147236248))();
    return;
  }
  fVar8 = *(float *)(param_3 + 0xd8) * _DAT_145dcd0fc;
  *param_4 = *(undefined8 *)(param_3 + 200);
  *(undefined4 *)(param_4 + 1) = uVar1;
  *(float *)((long)param_4 + 0xc) = fVar8;
  *(undefined4 *)(param_4 + 2) = uVar4;
  *(undefined4 *)((long)param_4 + 0x14) = uVar5;
  *(undefined4 *)(param_4 + 3) = uVar6;
  *(undefined8 *)((long)param_4 + 0x1c) = uVar3;
  *(undefined8 *)((long)param_4 + 0x24) = 0;
  *(undefined4 *)((long)param_4 + 0x2c) = uVar2;
  return;
}
