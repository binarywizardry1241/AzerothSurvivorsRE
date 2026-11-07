void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,long param_6)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  ulong uVar4;
  uint uVar5;
  long *plVar6;
  undefined4 in_XMM6_Da;
  undefined4 uVar7;
  undefined4 uVar8;
  long local_d20;
  undefined8 local_ac8;
  ulong local_ac0;
  undefined8 local_868;
  long *local_398;
  ulong local_390;
  undefined8 local_37c;
  uint local_36c;
  long local_128;
  long local_120;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  long local_e8;
  long *local_e0;
  long local_d8;
  undefined4 local_c8;
  undefined4 uStack_c4;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined8 local_a8;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  long local_80;
  long *local_78;
  long local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_a8 = param_5;
  local_58 = in_XMM6_Da;
  func_0x000145cb6440(param_1,param_6,param_4,&local_ac8,param_3);
  if ((int)local_ac8 == 2) {
    local_390 = local_ac0;
    local_398 = (long *)0x2;
  }
  else {
    func_0x000145cf998b();
    if (local_398 != (long *)0x2) {
      func_0x000145cf998b();
      local_ac8 = 0;
      local_868 = 0;
      do {
        func_0x00014001d220();
        if (local_d20 == 0) {
          func_0x0001400046d0();
          return;
        }
        func_0x000145cf998b();
        uVar5 = local_36c;
        uVar4 = local_390;
        uVar7 = (undefined4)local_37c;
        uVar8 = (undefined4)((ulong)local_37c >> 0x20);
        func_0x000145cad730();
        lVar2 = local_d8;
        local_78 = local_e0;
        func_0x000145ca61b0();
        if (((uVar4 & 0x400) != 0) && ((uVar5 & 0x20000000) != 0)) goto LAB_14001781f;
        if ((uVar4 & 0x10) == 0) {
          local_b8 = local_90;
          uStack_b4 = uStack_8c;
          uStack_b0 = uStack_88;
          uStack_ac = uStack_84;
          local_c8 = local_a0;
          uStack_c4 = uStack_9c;
          uStack_c0 = uStack_98;
          uStack_bc = uStack_94;
          local_61 = 0;
          func_0x00014011d790();
          local_61 = 0;
          plVar6 = (long *)func_0x00014011cd60();
          local_61 = 0;
          func_0x000145cad620();
          local_70 = local_128;
          local_80 = local_120;
          local_c8 = local_118;
          uStack_c4 = uStack_114;
          uStack_c0 = uStack_110;
          uStack_bc = uStack_10c;
          lVar2 = plVar6[2];
          if (lVar2 == *plVar6) {
            func_0x000145cfa150();
          }
          lVar3 = plVar6[1];
          *(ulong *)(lVar3 + lVar2 * 0x28) = CONCAT44(uVar8,uVar7);
          *(long *)(lVar3 + 8 + lVar2 * 0x28) = local_70;
          *(long *)(lVar3 + 0x10 + lVar2 * 0x28) = local_80;
          puVar1 = (undefined4 *)(lVar3 + 0x18 + lVar2 * 0x28);
          *puVar1 = local_c8;
          puVar1[1] = uStack_c4;
          puVar1[2] = uStack_c0;
          puVar1[3] = uStack_bc;
          plVar6[2] = lVar2 + 1;
        }
        else {
          if (param_6 == 0) {
            if (lVar2 == 5) {
              if (*(char *)((long)local_78 + 4) != 'e' || (int)*local_78 != 0x68636163)
              goto LAB_1400177b9;
            }
            else if ((lVar2 != 0xb) ||
                    (*(long *)((long)local_78 + 3) != 0x73636974736f6e67 ||
                     *local_78 != 0x74736f6e67616944)) goto LAB_1400177b9;
          }
          else {
LAB_1400177b9:
            local_61 = 1;
            func_0x000145cad620();
            local_70 = local_120;
            entry();
            if (local_128 != 0) {
              func_0x0001400021d0();
            }
          }
LAB_14001781f:
          if (CONCAT44(uStack_9c,local_a0) != 0) {
            func_0x0001400021d0();
          }
        }
        if (local_e8 != 0) {
          func_0x0001400021d0();
        }
        LOCK();
        *local_398 = *local_398 + -1;
        UNLOCK();
        if (*local_398 == 0) {
          func_0x0001434f8460();
        }
      } while( true );
    }
  }
  func_0x0001400031a0();
  return;
}
