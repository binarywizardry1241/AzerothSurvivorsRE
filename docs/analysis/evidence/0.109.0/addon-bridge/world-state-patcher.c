void FUN_1459a7290(void)

{
  long *plVar1;
  long lVar2;
  undefined8 **ppuVar3;
  undefined8 *puVar4;
  long lVar5;
  undefined8 *local_f8;
  undefined8 local_f0;
  long local_e8;
  undefined8 *local_e0;
  undefined8 local_d8;
  long local_d0;
  undefined8 *local_c8;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined8 *local_98 [3];
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  long *local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 *local_48;
  undefined8 *local_40;
  long local_38;
  undefined8 **local_30;
  undefined8 local_28;

  local_28 = 0xfffffffffffffffe;
  func_0x000145a67850();
  if (local_80 != (undefined8 **)0xffffffffffffffff) {
    local_30 = local_80;
    local_50 = uStack_78;
    func_0x000145ac7450();
    if (local_80 == (undefined8 **)0xffffffffffffffff) {
      func_0x000145b9d070();
    }
    else {
      local_a8 = (undefined4)local_70;
      uStack_a4 = local_70._4_4_;
      uStack_a0 = (undefined4)uStack_68;
      uStack_9c = uStack_68._4_4_;
      local_b8 = (undefined4)local_80;
      uStack_b4 = local_80._4_4_;
      uStack_b0 = (undefined4)uStack_78;
      uStack_ac = uStack_78._4_4_;
      func_0x000145ac87e0();
      if (local_d0 == -1) {
        local_98[0] = local_c8;
        local_80 = local_98;
        uStack_78 = 0x145b9d050;
        func_0x000145bb6590();
        func_0x000145b9d070();
      }
      else {
        local_38 = local_d0;
        local_40 = local_c8;
        func_0x000145bca830();
        local_48 = local_e0;
        local_f8 = local_e0;
        local_f0 = local_d8;
        ppuVar3 = local_98;
        FUN_145913300();
        local_80 = &local_f8;
        uStack_78 = 0x1400020c0;
        local_70 = 0x147234d68;
        uStack_68 = 0x1400020c0;
        local_58 = 0x1400020e0;
        local_60 = (long *)ppuVar3;
        func_0x000145bcce30();
        if (local_98[0] != (undefined8 *)0x0) {
          func_0x0001400021d0();
        }
        if (0 < local_e8) {
          func_0x0001400021d0();
        }
        func_0x000145acb540();
        if (local_38 != 0) {
          func_0x0001400021d0();
        }
      }
      local_40 = (undefined8 *)CONCAT44(uStack_a4,local_a8);
      if (local_40 != (undefined8 *)0x0) {
        puVar4 = (undefined8 *)CONCAT44(uStack_ac,uStack_b0);
        lVar5 = -(long)local_40;
        lVar2 = 1;
        local_48 = puVar4;
        do {
          plVar1 = (long *)*puVar4;
          LOCK();
          *plVar1 = *plVar1 + -1;
          UNLOCK();
          local_38 = lVar2;
          if (*plVar1 == 0) {
            func_0x000145a71530();
          }
          lVar2 = local_38 + 1;
          puVar4 = puVar4 + 1;
        } while (lVar5 + local_38 != 0);
      }
      if (CONCAT44(uStack_b4,local_b8) != 0) {
        func_0x0001400021d0();
      }
    }
    if (local_30 != (undefined8 **)0x0) {
      func_0x0001400021d0();
    }
  }
  return;
}
