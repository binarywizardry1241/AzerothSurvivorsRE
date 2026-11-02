undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4,
     undefined4 param_5)

{
  code *pcVar1;
  undefined8 uVar2;
  undefined4 *puVar3;
  undefined4 in_XMM3_Da;
  undefined4 in_stack_00000028;
  undefined4 in_stack_00000030;
  undefined4 in_stack_00000038;
  undefined4 in_stack_00000040;
  undefined4 in_stack_00000048;
  undefined4 in_stack_00000050;

  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 != (undefined4 *)0x0) {
    *puVar3 = param_5;
    puVar3[1] = in_XMM3_Da;
    puVar3[2] = in_stack_00000028;
    puVar3[3] = in_stack_00000030;
    puVar3[4] = in_stack_00000038;
    puVar3[5] = in_stack_00000040;
    puVar3[6] = in_stack_00000048;
    puVar3[7] = in_stack_00000050;
    uVar2 = param_3[1];
    *(undefined8 *)(puVar3 + 8) = *param_3;
    *(undefined8 *)(puVar3 + 10) = uVar2;
    puVar3[0xc] = *(undefined4 *)(param_3 + 2);
    *param_4 = 1;
    param_4[1] = puVar3;
    param_4[2] = 1;
    return param_4;
  }
  func_0x000145d992a1();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
