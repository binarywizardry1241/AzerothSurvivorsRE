
long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  code *pcVar1;
  long lVar2;
  long extraout_RDX;
  long lVar3;
  long local_108;
  long local_e8;
  undefined4 local_c8;
  undefined4 uStack_c4;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  long local_b8;
  undefined8 uStack_b0;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  long local_98;
  undefined8 uStack_90;
  long local_88;
  ulong local_80;
  undefined1 local_70;
  undefined7 uStack_6f;
  long local_68;
  undefined8 local_50;
  ulong local_48;
  long local_40;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  func_0x000145cd3d10(param_1,param_4,0x14732ead0,&local_c8,0x13);
  if (CONCAT44(uStack_c4,local_c8) == -1) {
    func_0x000145cd3d10();
    local_40 = CONCAT71(uStack_6f,local_70);
    if (local_40 == -1) {
      func_0x000145cd3d10();
      local_40 = CONCAT71(uStack_6f,local_70);
      if (local_40 == -1) {
        func_0x000145cd3d10();
        if (local_e8 == -1) {
LAB_1458e28f3:
          *param_4 = 0;
          param_4[1] = 1;
          param_4[2] = 0;
          return param_4;
        }
        local_40 = local_e8;
        func_0x000145cc0e20();
        local_50 = local_68;
        func_0x000145cc0e20();
        if (CONCAT71(uStack_6f,local_70) != 0) {
          func_0x0001400021d0();
        }
        if (local_40 != 0) {
          func_0x0001400021d0();
        }
        if (local_108 == -1) goto LAB_1458e28f3;
        local_40 = local_108;
      }
    }
    func_0x000145cc0e20();
    local_50 = local_68;
    func_0x000145cc0e20();
    if (CONCAT71(uStack_6f,local_70) != 0) {
      func_0x0001400021d0();
    }
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    if ((local_b8 == 4) && (*(int *)CONCAT44(uStack_bc,uStack_c0) == 0x656e6f6e)) {
      *param_4 = 0;
      param_4[1] = 1;
      param_4[2] = 0;
      if (CONCAT44(uStack_c4,local_c8) == 0) {
        return param_4;
      }
      func_0x0001400021d0();
      return param_4;
    }
    local_98 = local_b8;
    uStack_90 = uStack_b0;
    local_a8 = local_c8;
    uStack_a4 = uStack_c4;
    uStack_a0 = uStack_c0;
    uStack_9c = uStack_bc;
  }
  local_40 = CONCAT44(uStack_9c,uStack_a0);
  func_0x000145cd7790();
  if (CONCAT44(uStack_a4,local_a8) != 0) {
    func_0x0001400021d0();
  }
  if (local_88 == -1) {
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
    if ((1 < ((uint)local_80 & 3) - 2) && ((local_80 & 3) != 0)) {
      local_68 = local_80 - 1;
      local_70 = 3;
      func_0x000145cf9ce0();
    }
  }
  else {
    local_40 = local_88;
    local_48 = local_80;
    func_0x0001401edaa0();
    if (extraout_RDX < 0) {
LAB_1458e271e:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    lVar3 = extraout_RDX;
    if (extraout_RDX == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458e271e;
      func_0x000145d145fb();
    }
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
    param_4[2] = lVar3;
    *param_4 = lVar3;
    param_4[1] = lVar2;
  }
  return param_4;
}
