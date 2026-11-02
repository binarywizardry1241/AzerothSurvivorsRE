undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5,
     long param_6)

{
  code *pcVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  long lVar6;
  long in_stack_00000028;
  long local_60;
  long local_58;
  long local_50;

  func_0x000140002200();
  puVar2 = (undefined8 *)func_0x0001400021c0();
  if (puVar2 == (undefined8 *)0x0) {
    func_0x000145d936f1();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 == (undefined4 *)0x0) {
    func_0x000145d9370b();
    goto LAB_145889460;
  }
  *puVar3 = 0x4f524548;
  func_0x000140002200();
  puVar4 = (undefined8 *)func_0x0001400021c0();
  if (puVar4 == (undefined8 *)0x0) {
    func_0x000145d9370b();
    goto LAB_145889460;
  }
  *puVar4 = 0x726f766976727573;
  func_0x000140002200();
  puVar5 = (undefined8 *)func_0x0001400021c0();
  if (puVar5 == (undefined8 *)0x0) {
    func_0x000145d9370b();
    goto LAB_145889460;
  }
  *(undefined8 *)((long)puVar5 + 5) = 0x6c61636f6c2e6874;
  *puVar5 = 0x2e68746f72657a61;
  *puVar2 = 0x146be377a;
  puVar2[1] = 8;
  puVar2[2] = 4;
  puVar2[3] = puVar3;
  puVar2[4] = 4;
  puVar2[5] = 0x146be3782;
  puVar2[6] = 8;
  puVar2[7] = 8;
  puVar2[8] = puVar4;
  puVar2[9] = 8;
  puVar2[10] = 0x146be378a;
  puVar2[0xb] = 8;
  puVar2[0xc] = 0xd;
  puVar2[0xd] = puVar5;
  puVar2[0xe] = 0xd;
  local_60 = 3;
  if (param_3 == 0) {
    lVar6 = 3;
  }
  else {
    if (param_5 < 0) {
LAB_14588927a:
      func_0x000145d9370b();
      goto LAB_145889460;
    }
    if (param_5 == 0) {
      local_58 = 1;
    }
    else {
      func_0x000140002200();
      local_58 = func_0x0001400021c0();
      if (local_58 == 0) goto LAB_14588927a;
      func_0x000145bf1d41();
    }
    func_0x000145bf3cf0();
    puVar2[0xf] = 0x146be3792;
    puVar2[0x10] = 9;
    puVar2[0x11] = param_5;
    puVar2[0x12] = local_58;
    puVar2[0x13] = param_5;
    local_60 = 4;
    lVar6 = 4;
  }
  if (param_6 == 0) goto LAB_1458893e0;
  if (in_stack_00000028 < 0) {
LAB_145889340:
    func_0x000145d9370b();
LAB_145889460:
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (in_stack_00000028 == 0) {
    local_50 = 1;
    local_60 = lVar6;
  }
  else {
    func_0x000140002200();
    local_50 = func_0x0001400021c0();
    if (local_50 == 0) goto LAB_145889340;
    func_0x000145bf1d41();
  }
  if (local_60 == 3) {
    func_0x000145bf3cf0();
  }
  puVar2[local_60 * 5] = 0x146be379b;
  puVar2[local_60 * 5 + 1] = 8;
  puVar2[local_60 * 5 + 2] = in_stack_00000028;
  puVar2[local_60 * 5 + 3] = local_50;
  puVar2[local_60 * 5 + 4] = in_stack_00000028;
  local_60 = local_60 + 1;
LAB_1458893e0:
  param_4[2] = local_60;
  *param_4 = 3;
  param_4[1] = puVar2;
  return param_4;
}
