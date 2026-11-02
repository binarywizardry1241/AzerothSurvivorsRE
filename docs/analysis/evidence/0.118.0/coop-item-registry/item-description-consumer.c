/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,undefined4 param_5,
          undefined8 param_6)

{
  long lVar1;
  undefined8 in_stack_00000028;
  undefined4 in_stack_00000030;
  undefined4 in_stack_00000038;
  undefined8 in_stack_00000040;
  undefined8 in_stack_00000048;
  undefined8 in_stack_00000050;
  undefined8 in_stack_00000058;
  undefined8 in_stack_00000060;
  long local_108;
  undefined4 *local_100;
  long local_f8;
  long local_f0;
  long local_e8;
  long local_e0;
  long local_d8;
  undefined8 local_d0;
  undefined8 local_c8;
  long *local_c0;
  undefined8 local_b8;
  undefined8 local_b0;
  undefined8 local_a8;
  undefined4 **local_a0;
  undefined8 local_98;
  undefined8 local_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 local_78;
  long local_70;
  undefined8 local_68;
  undefined8 local_60;
  undefined1 local_58;
  undefined4 local_50 [2];
  undefined4 uStack_48;

  local_50[0] = in_stack_00000030;
  uStack_48 = in_stack_00000038;
  if ((_DAT_1484cf7a8 != 0) || ((*_DAT_1484cf7a0)(param_6,param_4,param_5,param_4), *param_4 == -1))
  {
    if ((param_3 != 0) &&
       (((lVar1 = func_0x000145e17cd0(), lVar1 != 0 && (*(long *)(lVar1 + 0x78) != -1)) &&
        (*(long *)(lVar1 + 0x88) != 0)))) {
      local_e0 = param_3 + 0x1b0;
      local_d8 = param_3 + 0x1e0;
      local_70 = param_3 + 0x150;
      local_100 = local_50;
      local_c8 = in_stack_00000028;
      local_c0 = &local_108;
      local_b8 = 0x146275e10;
      local_68 = in_stack_00000050;
      local_60 = 0x146275e40;
      local_58 = 0;
      local_b0 = in_stack_00000040;
      local_a8 = in_stack_00000048;
      local_a0 = &local_100;
      local_98 = 0x146275e70;
      local_90 = in_stack_00000058;
      local_88 = in_stack_00000060;
      local_80 = 1;
      local_78 = 0x146275ea0;
      local_108 = param_3;
      local_d0 = param_6;
      func_0x000145e72030();
      if (local_f8 != -1) {
        if (local_e8 != 0) {
          *param_4 = local_f8;
          param_4[1] = local_f0;
          param_4[2] = local_e8;
          return;
        }
        if (local_f8 != 0) {
          func_0x0001400021d0();
        }
      }
    }
    *param_4 = -1;
  }
  return;
}
