
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1)

{
  undefined1 auVar1 [16];
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  undefined2 *puVar6;
  ulong uVar7;
  undefined8 in_stack_00000038;
  ulong in_stack_00000040;
  long in_stack_00000050;
  char in_stack_00000058;

  if (in_stack_00000040 == 0) {
    if (-1 < in_stack_00000050) {
      if (in_stack_00000050 != 0) {
        func_0x000140002200();
        lVar5 = func_0x0001400021c0(1);
        if (lVar5 == 0) goto LAB_14020cc6b;
        func_0x000145d145fb();
      }
LAB_14020cd8a:
      func_0x000145d145fb();
      func_0x0001402b57b0();
      func_0x0001402ee800();
      return;
    }
  }
  else {
    if (in_stack_00000058 == '\0') {
      if (-1 < (long)in_stack_00000040) {
        func_0x000140002200();
        lVar5 = func_0x0001400021c0(1);
        if (lVar5 != 0) {
          func_0x000145d145fb();
          goto LAB_14020cd8a;
        }
      }
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (in_stack_00000040 < 0x20) {
      uVar3 = func_0x000145cefab0();
    }
    else {
      uVar3 = func_0x000145cef490(param_1,in_stack_00000040,in_stack_00000040,in_stack_00000038);
    }
    if (uVar3 == 0) goto LAB_14020cd8a;
    auVar1._8_8_ = 0;
    auVar1._0_8_ = uVar3;
    uVar4 = SUB168(auVar1 * ZEXT816(3),0);
    if (SUB168(auVar1 * ZEXT816(3),8) != 0) {
      func_0x000145eb7280();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (-1 < (long)uVar4) {
      func_0x000140002200();
      puVar6 = (undefined2 *)func_0x0001400021c0();
      if (puVar6 != (undefined2 *)0x0) {
        if (uVar4 < 3) {
          func_0x000145d14a10();
        }
        *(undefined1 *)(puVar6 + 1) = 0xa2;
        *puVar6 = 0x80e2;
        uVar7 = 3;
        while (uVar3 = uVar3 >> 1, uVar3 != 0) {
          func_0x000145d145fb();
          uVar7 = uVar7 * 2;
        }
        if (uVar4 != uVar7) {
          func_0x000145d145fb();
        }
        goto LAB_14020cd8a;
      }
    }
  }
LAB_14020cc6b:
  func_0x000145eb6fcb();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
