void FUN_14078a8d0(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  long *param_5,undefined8 *param_6)

{
  long lVar1;
  undefined8 uVar2;
  undefined8 *in_stack_00000028;
  long in_stack_00000030;
  long in_stack_00000038;
  long in_stack_00000040;
  long local_110;
  byte *local_108;
  long local_100;
  undefined8 local_a0;
  undefined8 local_98;
  undefined4 local_90;
  undefined4 local_8c;
  long local_88;
  byte *local_80;
  long local_78;
  long local_70;
  long local_68;
  undefined4 local_4c;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  lVar1 = *param_3;
  if (lVar1 != 0) {
    local_68 = *param_5;
    local_78 = param_5[2];
    local_4c = *(undefined4 *)((long)param_5 + 0x1c);
    local_98 = *param_6;
    uVar2 = *in_stack_00000028;
    local_a0 = *(undefined8 *)(in_stack_00000030 + 0x10);
    local_90 = *(undefined4 *)(in_stack_00000038 + 0x1c);
    local_8c = *(undefined4 *)(in_stack_00000040 + 0x1c);
    *(undefined4 *)param_3[2] = *(undefined4 *)((long)param_3 + 0x1c);
    func_0x000145040a20(local_78,uVar2,lVar1,&local_110);
    local_88 = local_110;
    local_80 = local_108;
    if (local_100 != 0) {
      local_70 = local_68 + 0x18;
                    /* WARNING: Could not emulate address calculation at 0x00014078a9ec */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((ulong)*local_108 * 4 + 0x145ebeeb8) + 0x145ebeeb8))();
      return;
    }
    if (local_110 != 0) {
      func_0x0001400021d0();
    }
  }
  return;
}
