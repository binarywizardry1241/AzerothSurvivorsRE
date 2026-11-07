void FUN_1459aff60(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  undefined4 in_XMM6_Da;
  float fVar8;
  undefined1 auVar9 [16];
  undefined4 local_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined8 local_120;
  undefined8 local_118;
  ulong local_110;
  undefined8 *local_108;
  undefined8 uStack_100;
  undefined4 *local_f8;
  undefined8 local_f0;
  long *local_e8;
  undefined8 local_e0;
  float *local_d8;
  undefined8 local_d0;
  long local_c8;
  undefined8 local_c0;
  undefined1 *local_b8;
  undefined8 local_b0;
  long local_a8;
  undefined8 local_a0;
  long local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  long local_80;
  long *local_78;
  float local_6c;
  undefined4 local_68;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_78 = (long *)*param_3;
  local_80 = param_3[1];
  lVar2 = param_3[2];
  lVar3 = *param_4;
  uVar7 = (ulong)(param_4[1] - lVar3) >> 3;
  if ((ulong)param_4[2] <= uVar7) {
    uVar7 = param_4[2];
  }
  fVar8 = 0.0;
  local_58 = in_XMM6_Da;
  for (uVar6 = 0; uVar6 < uVar7; uVar6 = uVar6 + 1) {
    lVar4 = *(long *)(lVar3 + uVar6 * 8);
    if (*(long *)(lVar4 + 0x18) == -1) {
      local_110 = 8;
      local_118 = 0x1471b5b51;
      if (*(long *)(lVar4 + 0x40) == -1) {
        local_118 = 0x1471b5b59;
        if ((ulong)*(byte *)(lVar4 + 0x15c) != 0) {
          local_118 = 0x1471b5b5f;
        }
        local_110 = 6 - (ulong)*(byte *)(lVar4 + 0x15c);
      }
    }
    else {
      local_110 = (ulong)*(byte *)(*(long *)(lVar4 + 0x30) + 0x54);
      local_118 = 0x1471b5b64;
      if (local_110 != 0) {
        local_118 = 0x1471b5b68;
      }
      local_110 = local_110 | 4;
    }
    local_68 = *(undefined4 *)(lVar4 + 0x88);
    auVar9 = FUN_1458dfb70();
    local_108 = (undefined8 *)0x0;
    uStack_100 = 1;
    local_f8 = (undefined4 *)0x0;
    if (auVar9._8_8_ != 0) {
      local_a8 = auVar9._8_8_;
      local_a0 = auVar9._0_8_;
      func_0x000145bcb2d0();
    }
    func_0x0001459b9b70();
    local_88 = local_f8;
    local_98 = (long)local_108;
    uStack_90 = uStack_100;
    local_6c = *(float *)(lVar4 + 0xf0);
    if (*(float *)(lVar4 + 0xf0) <= fVar8) {
      local_6c = fVar8;
    }
    local_c8 = lVar4 + 0xf4;
    lVar5 = 0x38;
    if ((*(long *)(lVar4 + 0x18) == -1) && (lVar5 = 0x60, *(long *)(lVar4 + 0x40) == -1)) {
      local_61 = 0;
    }
    else {
      local_61 = *(undefined1 *)(lVar4 + lVar5);
    }
    local_108 = &local_118;
    uStack_100 = 0x1400020c0;
    local_f8 = &local_68;
    local_f0 = 0x145badf80;
    local_e8 = &local_98;
    local_e0 = 0x1400020e0;
    local_d8 = &local_6c;
    local_d0 = 0x145bad280;
    local_c0 = 0x145bad280;
    local_b8 = &local_61;
    local_b0 = 0x145baa8b0;
    func_0x000145b9c4d0();
    if (local_98 != 0) {
      func_0x0001400021d0();
    }
    *(undefined8 *)(lVar2 + 0x10 + local_80 * 0x18) = local_120;
    puVar1 = (undefined4 *)(lVar2 + local_80 * 0x18);
    *puVar1 = local_130;
    puVar1[1] = uStack_12c;
    puVar1[2] = uStack_128;
    puVar1[3] = uStack_124;
    local_80 = local_80 + 1;
  }
  *local_78 = local_80;
  return;
}
