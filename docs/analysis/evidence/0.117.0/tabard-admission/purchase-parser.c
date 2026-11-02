
undefined8 entry(void)

{
  ulong uVar1;
  long in_RCX;
  undefined8 *puVar2;
  int local_58;
  undefined8 local_48;

  puVar2 = (undefined8 *)(in_RCX + 0x48);
  if (*(int *)(in_RCX + 0x7c) == -1) {
LAB_145c38360:
    *(undefined4 *)(in_RCX + 0x7c) = 0xffffffff;
    if ((*(int *)(in_RCX + 0x34) == -1) || (uVar1 = func_0x000145c0e3e0(), (uVar1 & 1) == 0)) {
      *(undefined4 *)(in_RCX + 0x7c) = 0xffffffff;
      if (*(int *)(in_RCX + 0xc4) == -1) {
LAB_145c3843e:
        *(undefined4 *)(in_RCX + 0xc4) = 0xffffffff;
        return 0;
      }
      do {
        if (*(char *)(in_RCX + 0xd1) != '\0') goto LAB_145c3843e;
        func_0x000145c38cb0();
        if (local_58 == 1) {
          *(undefined8 *)(in_RCX + 0x90) = local_48;
        }
        else if ((*(char *)(in_RCX + 0xd1) != '\0') ||
                (*(undefined1 *)(in_RCX + 0xd1) = 1,
                (*(long *)(in_RCX + 0x98) != *(long *)(in_RCX + 0x90) | *(byte *)(in_RCX + 0xd0)) !=
                1)) goto LAB_145c3843e;
        uVar1 = func_0x000145b2bbd0();
      } while ((uVar1 & 1) == 0);
    }
  }
  else {
    do {
      if (*(char *)(in_RCX + 0x89) != '\0') goto LAB_145c38360;
      func_0x000145c38cb0();
      if (local_58 == 1) {
        *puVar2 = local_48;
      }
      else if ((*(char *)(in_RCX + 0x89) != '\0') ||
              (*(undefined1 *)(in_RCX + 0x89) = 1,
              (*(long *)(in_RCX + 0x50) != *(long *)(in_RCX + 0x48) | *(byte *)(in_RCX + 0x88)) != 1
              )) goto LAB_145c38360;
      uVar1 = func_0x000145b2bbd0();
    } while ((uVar1 & 1) == 0);
  }
  return 1;
}
