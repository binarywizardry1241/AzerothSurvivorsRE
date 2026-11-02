/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  undefined8 *puVar1;
  code *pcVar2;
  long *plVar3;
  long in_RCX;
  long lVar4;
  long lVar5;
  long local_38;

  func_0x0001459cc440();
  lVar4 = in_RCX;
  if (*(long *)(in_RCX + 0xaf0) != 0) {
    func_0x0001400021d0();
  }
  func_0x0001459cc220();
  lVar5 = in_RCX;
  if (*(long *)(lVar4 + 0xb08) != 0) {
    func_0x0001400021d0();
  }
  func_0x0001459cc0a0();
  lVar4 = in_RCX;
  if (*(long *)(lVar5 + 0xb20) != 0) {
    func_0x0001400021d0();
  }
  func_0x000140009eb0();
  if ((*(long *)(lVar4 + 0xef8) != -1) && (*(long *)(lVar4 + 0xef8) != 0)) {
    func_0x0001400021d0();
  }
  if (*(long *)(lVar4 + 0xd08) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(lVar4 + 0xd20) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(lVar4 + 0xf30) != -1) {
    if (*(long *)(lVar4 + 0xf30) != 0) {
      func_0x0001400021d0();
    }
    if (*(long *)(lVar4 + 0xf48) != 0) {
      func_0x0001400021d0();
    }
  }
  if (*(int *)(lVar4 + 0x28) != 2) {
    FUN_1458ab8e0();
  }
  puVar1 = *(undefined8 **)(in_RCX + 0x10b0);
  pcVar2 = (code *)*puVar1;
  if (pcVar2 != (code *)0x0) {
    (*pcVar2)();
  }
  if (puVar1[1] != 0) {
    func_0x0001400021d0();
  }
  lVar4 = *(long *)(in_RCX + 0xd58);
  local_38 = 0;
  while (lVar4 != local_38) {
    local_38 = local_38 + 1;
    func_0x00014005eb60();
  }
  if (*(long *)(in_RCX + 0xd48) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xd60) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xd78) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xd90) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xda8) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xdc0) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xdd8) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xdf0) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe08) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe20) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe38) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe50) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe68) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe80) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xe98) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xeb0) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xec8) != 0) {
    func_0x0001400021d0();
  }
  if (*(long *)(in_RCX + 0xee0) != 0) {
    func_0x0001400021d0();
  }
  plVar3 = *(long **)(in_RCX + 0x1118);
  if (plVar3 != (long *)0x0) {
    LOCK();
    *plVar3 = *plVar3 + -1;
    UNLOCK();
    if (*plVar3 == 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
  }
  return;
}
