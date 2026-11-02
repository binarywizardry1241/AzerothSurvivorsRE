/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * entry(void)

{
  undefined4 *in_RCX;
  ulong uVar1;
  ulong uVar2;
  ulong uVar3;
  float in_XMM3_Da;
  undefined4 in_XMM6_Da;
  long local_b0;
  long local_a8;
  long local_a0;
  double local_98;
  double local_90;
  long local_88;
  long local_80;
  ulong local_78;
  undefined8 local_70;
  undefined8 uStack_68;
  double *local_60;
  double *local_58;
  long local_50;
  undefined1 local_41;
  undefined8 local_40;
  undefined4 local_38;

  local_40 = 0xfffffffffffffffe;
  local_38 = in_XMM6_Da;
  func_0x00014599cbe0();
  local_70 = &local_41;
  local_50 = local_80;
  if (local_78 < 2) {
    uStack_68 = local_80 + local_78 * 8;
    local_90 = _DAT_145dac578;
    if (local_78 == 0) goto LAB_1458c0082;
  }
  else {
    if (local_78 < 0x15) {
      func_0x000145981c90();
    }
    else {
      func_0x0001459876b0();
    }
    uStack_68 = local_50 + local_78 * 8;
  }
  uVar3 = (ulong)((uint)local_78 & 3);
  local_90 = _DAT_145dac578;
  if (local_78 - 1 < 3) {
    uVar1 = 0;
  }
  else {
    uVar1 = 0;
    do {
      local_90 = local_90 + *(double *)(*(long *)(local_50 + uVar1 * 8) + 0x40) +
                 *(double *)(*(long *)(local_50 + 8 + uVar1 * 8) + 0x40) +
                 *(double *)(*(long *)(local_50 + 0x10 + uVar1 * 8) + 0x40) +
                 *(double *)(*(long *)(local_50 + 0x18 + uVar1 * 8) + 0x40);
      uVar1 = uVar1 + 4;
    } while ((local_78 & 0xfffffffffffffffc) != uVar1);
    if (uVar3 == 0) goto LAB_1458c0082;
  }
  uVar2 = 0;
  do {
    local_90 = local_90 + *(double *)(*(long *)(local_50 + uVar1 * 8 + uVar2 * 8) + 0x40);
    uVar2 = uVar2 + 1;
  } while (uVar3 != uVar2);
LAB_1458c0082:
  if (in_XMM3_Da <= _DAT_145d6d36c) {
    in_XMM3_Da = _DAT_145d6d36c;
  }
  local_98 = (double)in_XMM3_Da;
  local_60 = &local_98;
  local_58 = &local_90;
  local_70 = (undefined1 *)local_50;
  func_0x0001459a79e0();
  func_0x0001458b82d0();
  *(double **)(in_RCX + 4) = local_60;
  *in_RCX = (undefined4)local_70;
  in_RCX[1] = local_70._4_4_;
  in_RCX[2] = (undefined4)uStack_68;
  in_RCX[3] = uStack_68._4_4_;
  if (local_88 != 0) {
    func_0x0001400021d0();
  }
  if (local_a0 != 0) {
    local_a8 = local_a8 + 8;
    do {
      if (*(long *)(local_a8 + -8) != 0) {
        func_0x0001400021d0();
      }
      local_a8 = local_a8 + 0x18;
      local_a0 = local_a0 + -1;
    } while (local_a0 != 0);
  }
  if (local_b0 != 0) {
    func_0x0001400021d0();
  }
  return in_RCX;
}
