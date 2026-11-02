/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2)

{
  code *pcVar1;
  undefined8 *puVar2;
  long *plVar3;
  long *local_50;
  long *local_48;
  undefined8 local_40;
  undefined1 local_28;
  undefined1 local_19;
  undefined8 local_18;
  undefined8 uStack_10;

  local_18 = 0xfffffffffffffffe;
  local_40 = 0xffffffffffffffff;
  local_50 = (long *)0x0;
  local_28 = 0;
  uStack_10 = param_2;
  func_0x000140002200();
  puVar2 = (undefined8 *)func_0x0001400021c0();
  if (puVar2 == (undefined8 *)0x0) {
    func_0x000145d934fb();
  }
  else {
    *puVar2 = 0x65732d6575676f72;
    *(undefined4 *)(puVar2 + 1) = 0x72657672;
    func_0x000145b9d380();
    local_19 = 0;
    func_0x0001458e04f0();
    if (local_50 != (long *)0x0) {
      plVar3 = local_50;
      (*_DAT_145d948c0)();
      LOCK();
      *plVar3 = *plVar3 + -1;
      UNLOCK();
      if (*plVar3 == 0) {
        func_0x000145bab030();
      }
      LOCK();
      *local_48 = *local_48 + -1;
      UNLOCK();
      if (*local_48 == 0) {
        local_19 = 0;
        func_0x000145baaef0();
      }
      return;
    }
    local_50 = local_48;
    func_0x000145d93810(param_1,0,0x1d,0x146e96438,&local_50,0x146beb0c8);
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
