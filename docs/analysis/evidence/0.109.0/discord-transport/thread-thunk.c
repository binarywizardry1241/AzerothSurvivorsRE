void entry(void)

{
  long *plVar1;
  undefined8 *puVar2;
  code *pcVar3;
  long in_RCX;
  long lVar4;
  long lVar5;

  lVar5 = *(long *)(in_RCX + 8);
  FUN_14008ee00();
  FUN_140090800();
  lVar4 = 0;
  plVar1 = *(long **)(in_RCX + 0x30);
  if ((plVar1[3] != 0) && (plVar1[4] != 0)) {
    puVar2 = (undefined8 *)plVar1[5];
    pcVar3 = (code *)*puVar2;
    if (pcVar3 != (code *)0x0) {
      (*pcVar3)();
    }
    lVar4 = 0;
    if (puVar2[1] != 0) {
      func_0x0001400021d0();
    }
  }
  plVar1[3] = 1;
  plVar1[4] = lVar4;
  plVar1[5] = lVar5;
  LOCK();
  *plVar1 = *plVar1 + -1;
  UNLOCK();
  if (*plVar1 == 0) {
    func_0x000145bb2690();
  }
  return;
}
