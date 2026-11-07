/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(void)

{
  long lVar1;
  long *plVar2;
  long lVar3;
  undefined8 *puVar4;
  long lVar5;
  long local_420;
  undefined4 local_418;
  undefined4 uStack_414;
  undefined4 uStack_410;
  undefined4 uStack_40c;
  long local_240;

  if (_DAT_14808a7b8 == 0) {
LAB_1459a2b88:
    if (_DAT_14808a7b8 == 0) {
      return 0x14808a5d8;
    }
    return 0;
  }
  func_0x000145a67850();
  if (local_240 == -1) {
    local_240 = 0;
  }
  func_0x000145ac7450();
  if (local_420 == -1) {
    func_0x000145b9d070();
    if (local_240 == 0) {
      return 0;
    }
  }
  else {
    if (local_240 != 0) {
      func_0x0001400021d0();
    }
    func_0x000145a7d0b0();
    if (local_420 != -1) {
      lVar3 = local_420;
      func_0x000145bfa0e7();
      if (_DAT_14808a7b8 != 0) {
        func_0x000145d7e2c4();
      }
      if (lVar3 != -1) {
        func_0x000145bfa0e7();
        func_0x00014091e930();
      }
      if (CONCAT44(uStack_40c,uStack_410) != 0) {
        puVar4 = (undefined8 *)CONCAT44(uStack_414,local_418);
        lVar5 = -CONCAT44(uStack_40c,uStack_410);
        lVar3 = 1;
        do {
          plVar2 = (long *)*puVar4;
          LOCK();
          *plVar2 = *plVar2 + -1;
          UNLOCK();
          if (*plVar2 == 0) {
            func_0x000145a71530();
          }
          lVar1 = lVar5 + lVar3;
          lVar3 = lVar3 + 1;
          puVar4 = puVar4 + 1;
        } while (lVar1 != 0);
      }
      if (local_420 != 0) {
        func_0x0001400021d0();
      }
      goto LAB_1459a2b88;
    }
    func_0x000145b9d070();
    if (CONCAT44(uStack_40c,uStack_410) != 0) {
      puVar4 = (undefined8 *)CONCAT44(uStack_414,local_418);
      lVar5 = -CONCAT44(uStack_40c,uStack_410);
      lVar3 = 1;
      do {
        plVar2 = (long *)*puVar4;
        LOCK();
        *plVar2 = *plVar2 + -1;
        UNLOCK();
        if (*plVar2 == 0) {
          func_0x000145a71530();
        }
        lVar1 = lVar5 + lVar3;
        lVar3 = lVar3 + 1;
        puVar4 = puVar4 + 1;
      } while (lVar1 != 0);
    }
  }
  func_0x0001400021d0();
  return 0;
}
