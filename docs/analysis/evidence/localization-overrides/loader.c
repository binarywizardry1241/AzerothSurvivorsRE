undefined4 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4,undefined8 param_5)

{
  undefined8 uVar1;
  long lVar2;
  long *plVar3;
  ulong uVar4;
  long *plVar5;
  undefined4 *puVar6;
  long *plVar7;
  undefined4 local_1e8;
  undefined4 uStack_1e4;
  undefined4 uStack_1e0;
  undefined4 uStack_1dc;
  long *local_1d0;
  undefined8 local_1c8;
  long *local_1c0;
  long *local_1b8;
  long local_1b0;
  long *local_1a8;
  long local_1a0;
  undefined8 local_198;
  long local_190;
  long *local_188;
  undefined8 local_180;
  long local_170;
  long local_168;
  long local_160;
  undefined4 *local_158;
  long local_150;
  long *local_148;
  long local_140 [3];
  undefined4 local_128;
  undefined4 uStack_124;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  ulong local_118;
  int local_108;
  undefined8 local_100;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  ulong local_f0;
  undefined8 local_e8;
  long local_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  long local_c8;
  long *local_c0;
  long local_b8;
  long local_b0;
  long *local_a8;
  long local_a0;
  long *local_98;
  long *local_90;
  long local_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  long *local_60;
  long *local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_80 = (long **)&local_1a0;
  uStack_78 = (long *)0x1400020c0;
  local_1a0 = param_3;
  local_198 = param_5;
  func_0x000145bc5690(param_4,param_2,0x146beb1c1,local_140,&local_80);
  local_b0 = 0;
  local_a8 = (long *)&DAT_00000008;
  local_a0 = 0;
  local_49 = 1;
  func_0x000145bacbe0();
  if (local_80 == (long **)0xffffffffffffffff) {
    if ((1 < ((uint)uStack_78 & 3) - 2) && (((ulong)uStack_78 & 3) != 0)) {
      local_100 = (undefined4 *)((long)uStack_78 + -1);
      local_108 = CONCAT31(local_108._1_3_,3);
      local_49 = 1;
      func_0x000145bd8020();
    }
  }
  else {
    local_58 = (long *)local_80;
    local_60 = uStack_78;
    lVar2 = func_0x000145b9f6d0();
    if (lVar2 == 0) {
      plVar5 = (long *)0xffffffffffffffff;
    }
    else {
      func_0x000145bc4e10();
      plVar5 = (long *)local_80;
      local_98 = uStack_78;
      local_1e8 = (undefined4)local_70;
      uStack_1e4 = local_70._4_4_;
      uStack_1e0 = (undefined4)uStack_68;
      uStack_1dc = uStack_68._4_4_;
    }
    if (local_58 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (plVar5 != (long *)0xffffffffffffffff) {
      local_58 = plVar5;
      if (local_a0 == local_b0) {
        func_0x000145bf4ee0();
      }
      local_a8[local_a0 * 4] = (long)local_58;
      local_a8[local_a0 * 4 + 1] = (long)local_98;
      plVar5 = local_a8 + local_a0 * 4 + 2;
      *(undefined4 *)plVar5 = local_1e8;
      *(undefined4 *)((long)plVar5 + 4) = uStack_1e4;
      *(undefined4 *)(plVar5 + 1) = uStack_1e0;
      *(undefined4 *)((long)plVar5 + 0xc) = uStack_1dc;
      local_a0 = local_a0 + 1;
    }
  }
  local_49 = 1;
  func_0x0001458e8400();
  lVar2 = local_a0;
  local_158 = param_4;
  if (local_80 != (long **)0xffffffffffffffff) {
    local_58 = (long *)local_80;
    if (local_a0 == local_b0) {
      local_60 = uStack_78;
      func_0x000145bf4ee0();
    }
    local_a8[lVar2 * 4 + 2] = (long)local_70;
    (local_a8 + lVar2 * 4 + 2)[1] = (long)uStack_68;
    plVar5 = local_a8 + lVar2 * 4;
    *(undefined4 *)plVar5 = (undefined4)local_80;
    *(undefined4 *)((long)plVar5 + 4) = local_80._4_4_;
    *(undefined4 *)(plVar5 + 1) = (undefined4)uStack_78;
    *(undefined4 *)((long)plVar5 + 0xc) = uStack_78._4_4_;
    local_a0 = lVar2 + 1;
  }
  local_d8 = 0;
  uStack_d0 = 8;
  local_c8 = 0;
  plVar3 = local_a8 + local_a0 * 4;
  local_1c0 = local_a8;
  local_1b8 = local_a8;
  local_150 = local_b0;
  local_1b0 = local_b0;
  local_e8 = 8;
  local_b8 = 0;
  local_148 = local_a8;
  plVar5 = local_a8;
  local_1a8 = plVar3;
  while (plVar7 = plVar5, plVar5 != plVar3) {
    plVar7 = plVar5 + 4;
    local_1b8 = plVar7;
    if ((long *)*plVar5 == (long *)0xffffffffffffffff) break;
    local_98 = (long *)plVar5[1];
    local_58 = (long *)*plVar5;
    func_0x000145b9f5a0();
    local_60 = uStack_78;
    func_0x000145b9f5a0();
    if (local_80 != (long **)0x0) {
      func_0x0001400021d0();
    }
    uVar1 = local_180;
    local_60 = local_188;
    func_0x000145bb5af0();
    if (local_80 == (long **)0xffffffffffffffff) {
      if ((1 < ((uint)uStack_78 & 3) - 2) && (((ulong)uStack_78 & 3) != 0)) {
        local_100 = (undefined4 *)((long)uStack_78 + -1);
        local_108 = CONCAT31(local_108._1_3_,3);
        func_0x000145bd8020();
      }
      plVar5 = plVar7;
      if (local_190 != 0) {
        func_0x0001400021d0();
        plVar5 = plVar7;
      }
    }
    else {
      local_90 = (long *)local_80;
      local_c0 = uStack_78;
      func_0x0001458e6a10();
      uVar4 = local_f0;
      puVar6 = local_100;
      if (local_108 == 1) {
        local_118 = local_f0;
        local_128 = (undefined4)local_100;
        uStack_124 = local_100._4_4_;
        uStack_120 = uStack_f8;
        uStack_11c = uStack_f4;
        local_1d0 = local_60;
        local_1c8 = uVar1;
        local_80 = &local_1d0;
        uStack_78 = (long *)0x145bb8540;
        local_70 = &local_128;
        uStack_68 = (long *)0x1400020e0;
        plVar5 = &local_170;
        func_0x000145bc5690();
        local_88 = local_170;
        local_e0 = local_168;
        local_170 = local_168;
        local_168 = local_160;
        uStack_78 = (long *)0x1400020c0;
        local_80 = (long **)plVar5;
        func_0x000145baedf0();
        if (local_88 != 0) {
          func_0x0001400021d0();
        }
        puVar6 = (undefined4 *)CONCAT44(uStack_124,local_128);
      }
      else {
        local_80 = (long **)CONCAT44(uStack_f4,uStack_f8);
        local_88 = local_f0 * 0x30;
        uStack_68 = (long *)(local_80 + local_f0 * 6);
        local_70 = local_100;
        uStack_78 = (long *)local_80;
        if ((ulong)(local_d8 - local_b8) < local_f0) {
          func_0x000145bf4a90();
          local_e8 = uStack_d0;
          local_b8 = local_c8;
LAB_1458e50cd:
          func_0x000145bf293b();
        }
        else if (local_f0 != 0) goto LAB_1458e50cd;
        local_c8 = local_b8 + uVar4;
        local_b8 = local_c8;
      }
      if (puVar6 != (undefined4 *)0x0) {
        func_0x0001400021d0();
      }
      if (local_90 != (long *)0x0) {
        func_0x0001400021d0();
      }
      plVar5 = plVar7;
      if (local_190 != 0) {
        func_0x0001400021d0();
        plVar5 = plVar7;
      }
    }
    if (local_58 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  puVar6 = local_158;
  if ((long)plVar3 - (long)plVar7 != 0) {
    uVar4 = (ulong)((long)plVar3 - (long)plVar7) >> 5;
    plVar7 = plVar7 + 1;
    do {
      if (plVar7[-1] != 0) {
        func_0x0001400021d0();
      }
      plVar7 = plVar7 + 4;
      uVar4 = uVar4 - 1;
    } while (uVar4 != 0);
  }
  if (local_150 != 0) {
    func_0x0001400021d0();
  }
  *(long *)(puVar6 + 4) = local_c8;
  *puVar6 = (undefined4)local_d8;
  puVar6[1] = local_d8._4_4_;
  puVar6[2] = (undefined4)uStack_d0;
  puVar6[3] = uStack_d0._4_4_;
  if (local_140[0] != 0) {
    func_0x0001400021d0();
  }
  return puVar6;
}
