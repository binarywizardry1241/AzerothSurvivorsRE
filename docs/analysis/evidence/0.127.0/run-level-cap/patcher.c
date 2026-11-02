
void entry(void)

{
  long *plVar1;
  long lVar2;
  undefined8 *puVar3;
  long lVar4;
  undefined8 *local_d0;
  undefined8 local_c8;
  long local_c0;
  undefined8 *local_b8;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined8 *local_88;
  undefined8 *local_80;
  undefined8 local_78;
  undefined8 local_70;
  undefined8 uStack_68;
  undefined8 local_60;
  undefined8 uStack_58;
  undefined8 local_50;
  undefined8 *local_48;
  undefined8 *local_40;
  long local_38;
  undefined8 **local_30;
  undefined8 local_28;

  local_28 = 0xfffffffffffffffe;
  func_0x000145ec8320();
  if (local_70 != (undefined8 **)0xffffffffffffffff) {
    local_30 = local_70;
    local_50 = uStack_68;
    func_0x000145f3f790();
    if (local_70 == (undefined8 **)0xffffffffffffffff) {
      func_0x000146003f70();
    }
    else {
      local_98 = (undefined4)local_60;
      uStack_94 = local_60._4_4_;
      uStack_90 = (undefined4)uStack_58;
      uStack_8c = uStack_58._4_4_;
      local_a8 = (undefined4)local_70;
      uStack_a4 = local_70._4_4_;
      uStack_a0 = (undefined4)uStack_68;
      uStack_9c = uStack_68._4_4_;
      func_0x000145f409b0();
      if (local_c0 == -1) {
        local_70 = &local_88;
        local_88 = local_b8;
        uStack_68 = 0x146003f50;
        func_0x00014601d930();
        func_0x000146003f70();
      }
      else {
        local_38 = local_c0;
        local_40 = local_b8;
        func_0x000146031e70();
        local_48 = local_80;
        local_d0 = local_80;
        local_c8 = local_78;
        local_70 = &local_d0;
        uStack_68 = 0x1400020c0;
        local_60 = 0x14707f7d4;
        uStack_58 = 0x146045f20;
        func_0x000146034470();
        if (0 < (long)local_88) {
          func_0x0001400021d0();
        }
        func_0x000145f432c0();
        if (local_38 != 0) {
          func_0x0001400021d0();
        }
      }
      local_40 = (undefined8 *)CONCAT44(uStack_94,local_98);
      if (local_40 != (undefined8 *)0x0) {
        puVar3 = (undefined8 *)CONCAT44(uStack_9c,uStack_a0);
        lVar4 = -(long)local_40;
        lVar2 = 1;
        local_48 = puVar3;
        do {
          plVar1 = (long *)*puVar3;
          LOCK();
          *plVar1 = *plVar1 + -1;
          UNLOCK();
          local_38 = lVar2;
          if (*plVar1 == 0) {
            func_0x000145f61880();
          }
          lVar2 = local_38 + 1;
          puVar3 = puVar3 + 1;
        } while (lVar4 + local_38 != 0);
      }
      if (CONCAT44(uStack_a4,local_a8) != 0) {
        func_0x0001400021d0();
      }
    }
    if (local_30 != (undefined8 **)0x0) {
      func_0x0001400021d0();
    }
  }
  return;
}
