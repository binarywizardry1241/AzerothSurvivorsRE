undefined8
FUN_1458ea070(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,
             undefined4 param_5)

{
  byte *pbVar1;
  byte bVar2;
  long lVar3;
  uint uVar4;
  uint uVar5;
  byte *pbVar6;
  byte *pbVar7;
  byte *pbVar8;
  ulong uVar9;
  byte *pbVar10;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  long local_e8;
  undefined8 local_dc;
  undefined4 local_d4;
  byte *local_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  long local_b8;
  undefined8 local_b0;
  undefined1 *local_a8;
  undefined8 local_a0;
  undefined4 *local_98;
  undefined8 local_90;
  long *local_88;
  undefined8 local_80;
  long local_78;
  byte *local_70;
  byte *local_68;
  undefined4 local_5c;
  byte *local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_dc = 0xa00000009;
  local_d4 = 0xd;
  local_5c = param_5;
  entry(param_1,param_2,*(undefined8 *)(param_3 + 0x20),&local_78,*(undefined8 *)(param_3 + 0x28),
        &local_dc);
  local_c8 = (undefined4 *)0x0;
  uStack_c0 = 1;
  local_b8 = 0;
  local_d0 = local_68;
  pbVar1 = local_70 + (long)local_68;
  local_58 = local_70;
  pbVar7 = (byte *)0x0;
  pbVar10 = (byte *)0x0;
  while (pbVar6 = pbVar7, local_70 != pbVar1) {
    bVar2 = *local_70;
    uVar4 = (uint)bVar2;
    if ((char)bVar2 < '\0') {
      uVar5 = bVar2 & 0x1f;
      if (bVar2 < 0xe0) {
        pbVar8 = local_70 + 2;
        uVar4 = uVar5 << 6 | local_70[1] & 0x3f;
      }
      else {
        uVar4 = local_70[2] & 0x3f | (local_70[1] & 0x3f) << 6;
        if (bVar2 < 0xf0) {
          pbVar8 = local_70 + 3;
          uVar4 = uVar4 | uVar5 << 0xc;
        }
        else {
          pbVar8 = local_70 + 4;
          uVar4 = local_70[3] & 0x3f | uVar4 << 6 | (bVar2 & 7) << 0x12;
        }
      }
    }
    else {
      pbVar8 = local_70 + 1;
    }
    pbVar7 = pbVar8 + ((long)pbVar6 - (long)local_70);
    if ((uVar4 == 0x3b) || (local_70 = pbVar8, uVar4 == 0x3d)) {
      uVar9 = (long)pbVar6 - (long)pbVar10;
      lVar3 = local_b8;
      if ((ulong)((long)local_c8 - local_b8) < uVar9) {
        func_0x000145bfa970(pbVar8,pbVar7,local_b8,&local_c8,uVar9,1);
        lVar3 = local_b8;
      }
      if (pbVar6 != pbVar10) {
        local_b8 = lVar3;
        func_0x000145bfa0e7();
      }
      local_b8 = lVar3 + uVar9;
      local_70 = pbVar8;
      if (local_c8 == (undefined4 *)local_b8) {
        func_0x000145bfa970();
        local_70 = pbVar8;
      }
      *(undefined1 *)(uStack_c0 + local_b8) = 0x20;
      local_b8 = local_b8 + 1;
      pbVar10 = pbVar7;
    }
  }
  uVar9 = (long)local_d0 - (long)pbVar10;
  local_e8 = local_b8;
  if ((ulong)((long)local_c8 - local_b8) < uVar9) {
    func_0x000145bfa970();
    local_e8 = local_b8;
  }
  local_b8 = local_e8;
  if (local_d0 != pbVar10) {
    func_0x000145bfa0e7();
  }
  local_e8 = local_e8 + uVar9;
  local_f8 = (undefined4)local_c8;
  uStack_f4 = local_c8._4_4_;
  uStack_f0 = (undefined4)uStack_c0;
  uStack_ec = uStack_c0._4_4_;
  if (local_78 != 0) {
    func_0x0001400021d0();
  }
  local_49 = *(undefined1 *)(param_3 + 0x40);
  entry();
  local_b8 = param_3 + 0x30;
  local_c8 = &local_5c;
  uStack_c0 = 0x145bde8e0;
  local_b0 = 0x1400020c0;
  local_a8 = &local_49;
  local_a0 = 0x145bdb210;
  local_98 = &local_f8;
  local_90 = 0x1400020e0;
  local_80 = 0x1400020e0;
  local_88 = &local_78;
  func_0x000145bcce30();
  if (local_78 != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_f4,local_f8) != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
