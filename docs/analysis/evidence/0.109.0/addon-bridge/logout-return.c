void FUN_1458b8300(void)

{
  code *pcVar1;
  undefined1 *puVar2;
  long in_RCX;
  long lVar3;
  ulong uVar4;
  long local_78;
  long local_70;
  long local_68;

  if (*(long *)(in_RCX + 0xb18) != 0) {
    uVar4 = 0;
    lVar3 = 0;
    do {
      if (*(char *)(*(long *)(in_RCX + 0xb10) + 0xa8 + lVar3) != '\0') {
        FUN_1458b8620();
        if (*(int *)(in_RCX + 0x10) != 2) {
          entry();
        }
        *(undefined8 *)(in_RCX + 0x10) = 2;
        if (*(long *)(in_RCX + 0xf18) != -1) {
          if (*(long *)(in_RCX + 0xf18) != 0) {
            func_0x0001400021d0();
          }
          if (*(long *)(in_RCX + 0xf30) != 0) {
            func_0x0001400021d0();
          }
        }
        *(undefined8 *)(in_RCX + 0xf18) = 0xffffffffffffffff;
        if (*(ulong *)(in_RCX + 0xb18) <= uVar4) {
          func_0x000145d99653();
                    /* WARNING: Does not return */
          pcVar1 = (code *)invalidInstructionException();
          (*pcVar1)();
        }
        *(undefined1 *)(*(long *)(in_RCX + 0xb10) + 0xa8 + lVar3) = 0;
        func_0x000140002200();
        lVar3 = func_0x0001400021c0();
        if (lVar3 == 0) {
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar1 = (code *)invalidInstructionException();
          (*pcVar1)();
        }
        FUN_1458ad5e0();
        lVar3 = *(long *)(in_RCX + 0x1098);
        func_0x000140002200(*(undefined8 *)(in_RCX + 0x1090));
        puVar2 = (undefined1 *)func_0x0001400021c0();
        if (puVar2 != (undefined1 *)0x0) {
          *puVar2 = 0x7b;
          func_0x0001458eb720();
          if (local_78 == local_68) {
            func_0x000145bfa970();
          }
          *(undefined1 *)(local_70 + local_68) = 0x7d;
          (**(code **)(lVar3 + 0x18))();
          if (local_78 == 0) {
            return;
          }
          func_0x0001400021d0();
          return;
        }
        func_0x000145d992bb();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      uVar4 = uVar4 + 1;
      lVar3 = lVar3 + 0xb0;
    } while (*(long *)(in_RCX + 0xb18) * 0xb0 - lVar3 != 0);
  }
  return;
}
