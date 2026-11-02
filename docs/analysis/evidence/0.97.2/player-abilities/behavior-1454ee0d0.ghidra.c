
void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,undefined8 param_5)

{
  ulong uVar1;
  undefined8 *puVar2;
  ulong uVar3;
  float in_XMM3_Da;
  undefined4 in_stack_00000028;
  undefined4 in_stack_00000030;
  undefined1 *local_88;
  undefined1 *local_80;
  undefined4 local_78;
  undefined4 uStack_70;
  undefined4 *local_68;
  undefined8 local_60;
  float *local_58;
  long local_50;
  long local_48;
  ulong local_40;
  long local_38;
  float local_2c;
  undefined4 local_28;
  undefined1 local_21;
  undefined8 local_20;
  undefined8 uStack_18;
  undefined8 uStack_10;
  
  local_68 = &local_28;
  local_20 = 0xfffffffffffffffe;
  local_28 = *(undefined4 *)(param_3 + 0x8e4);
  local_2c = in_XMM3_Da * in_XMM3_Da;
  local_88 = *(undefined1 **)(param_3 + 0x4c8);
  local_80 = local_88 + *(long *)(param_3 + 0x4d0) * 0x160;
  local_78 = in_stack_00000028;
  uStack_70 = in_stack_00000030;
  local_58 = &local_2c;
  local_60 = param_5;
  uStack_18 = param_1;
  uStack_10 = param_2;
  func_0x00014552b8f0(param_1,param_4,&local_88,&local_50);
  local_88 = &local_21;
  if (local_40 < 2) {
    if (local_40 == 0) goto LAB_1454ee201;
  }
  else {
    local_38 = local_48;
    if (local_40 < 0x15) {
      func_0x000141929100();
      local_48 = local_38;
    }
    else {
      func_0x0001455396b0();
      local_48 = local_38;
    }
  }
  if (local_40 - 1 < 3) {
    uVar1 = 0;
  }
  else {
    puVar2 = (undefined8 *)(local_48 + 0x38);
    uVar1 = 0;
    do {
      *(undefined8 *)(local_48 + uVar1 * 8) = puVar2[-6];
      *(undefined8 *)(local_48 + 8 + uVar1 * 8) = puVar2[-4];
      *(undefined8 *)(local_48 + 0x10 + uVar1 * 8) = puVar2[-2];
      *(undefined8 *)(local_48 + 0x18 + uVar1 * 8) = *puVar2;
      uVar1 = uVar1 + 4;
      puVar2 = puVar2 + 8;
    } while ((local_40 & 0xfffffffffffffffc) != uVar1);
    if ((local_40 & 3) == 0) goto LAB_1454ee201;
  }
  uVar3 = 0;
  do {
    *(undefined8 *)(local_48 + uVar1 * 8 + uVar3) =
         *(undefined8 *)(uVar1 * 0x10 + local_48 + 8 + uVar3 * 2);
    uVar3 = uVar3 + 8;
  } while (((uint)local_40 & 3) << 3 != uVar3);
LAB_1454ee201:
  *param_4 = local_50 * 2;
  param_4[1] = local_48;
  param_4[2] = local_40;
  return;
}

