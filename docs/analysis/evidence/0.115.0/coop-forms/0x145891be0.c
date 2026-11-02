
undefined8
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,undefined8 *param_5)

{
  code *pcVar1;
  long lVar2;
  undefined8 uVar3;
  long in_stack_00000028;

  if ((*(int *)(param_4 + 0x10) == 2) && (*(int *)(param_4 + 0xc58) == 2)) {
    if (in_stack_00000028 < 0) {
LAB_145891c1a:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (in_stack_00000028 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_145891c1a;
      func_0x000145d145fb();
    }
    *(undefined8 *)(param_4 + 0xc58) = 3;
    *(undefined8 *)(param_4 + 0xc60) = 0;
    *(long *)(param_4 + 0xc70) = in_stack_00000028;
    *(long *)(param_4 + 0xc78) = lVar2;
    *(long *)(param_4 + 0xc80) = in_stack_00000028;
    *(undefined8 *)(param_4 + 0xc88) = 0;
    *(undefined8 *)(param_4 + 0xc90) = 8;
    *(undefined8 *)(param_4 + 0xc98) = 0;
    *(undefined8 *)(param_4 + 0xca0) = 0;
    *(undefined8 *)(param_4 + 0xca8) = 8;
    *(undefined8 *)(param_4 + 0xcb0) = 0;
    *(undefined8 *)(param_4 + 0xcb8) = param_3;
    *(undefined8 **)(param_4 + 0xcc0) = param_5;
    *(undefined8 *)(param_4 + 0xcc8) = 0;
    *(undefined8 *)(param_4 + 0xcd0) = 0;
    *(undefined1 *)(param_4 + 0xcd8) = 1;
    func_0x000145893140();
    uVar3 = 1;
  }
  else {
    if ((code *)*param_5 != (code *)0x0) {
      (*(code *)*param_5)();
    }
    if (param_5[1] != 0) {
      func_0x0001400021d0();
    }
    uVar3 = 0;
  }
  return uVar3;
}
