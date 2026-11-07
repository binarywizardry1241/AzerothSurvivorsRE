/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined4 *param_4,
          undefined8 param_5,undefined1 param_6)

{
  char cVar1;
  uint uVar2;
  undefined4 in_stack_00000028;
  undefined4 in_stack_00000030;
  undefined4 in_stack_00000038;
  undefined4 local_78;
  undefined4 local_74;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 *local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 **local_48;
  undefined8 *local_40;
  undefined8 local_38;
  undefined4 *local_30;
  undefined8 local_28;
  undefined8 local_20;
  undefined8 **local_18;
  undefined8 local_10;
  long local_8;

  local_78 = in_stack_00000028;
  local_74 = in_stack_00000030;
  *(undefined1 *)(param_4 + 0x12) = 1;
  *(undefined1 *)((long)param_4 + 0x4b) = 0;
  *(undefined1 *)((long)param_4 + 0x49) = param_6;
  *param_4 = in_stack_00000028;
  param_4[1] = in_stack_00000030;
  *(undefined8 *)(param_4 + 0xe) = 0;
  param_4[0x10] = in_stack_00000038;
  param_4[0x11] = in_stack_00000038;
  if ((*_DAT_1480b0fa8 < 3) &&
     (((uVar2 = (uint)DAT_148078cf8, local_70 = param_3, local_68 = param_5, uVar2 - 1 < 2 ||
       ((uVar2 != 0 && (uVar2 = func_0x000145d6a190(), (char)uVar2 != '\0')))) &&
      (cVar1 = func_0x000144c7d510(param_1,param_2,uVar2,_DAT_148078ce8), cVar1 != '\0')))) {
    local_8 = _DAT_148078ce8 + 0x30;
    local_40 = &local_70;
    local_38 = 0x1400020c0;
    local_30 = &local_78;
    local_28 = 0x1409a7070;
    local_50 = 0x145f08818;
    local_48 = &local_40;
    local_60 = &local_50;
    local_58 = 0x145f06870;
    local_20 = 1;
    local_18 = &local_60;
    local_10 = 1;
    func_0x000144c7ed30(param_1,param_2,&local_20);
    return;
  }
  return;
}
