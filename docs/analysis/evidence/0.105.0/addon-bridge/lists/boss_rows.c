/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1459b14e0(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  undefined8 *puVar1;
  long lVar2;
  ulong **ppuVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  undefined4 in_XMM6_Da;
  float fVar7;
  undefined1 auVar8 [16];
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 local_130;
  undefined8 local_128;
  ulong local_120;
  long local_118;
  long local_110;
  long local_108;
  ulong *local_100;
  ulong uStack_f8;
  float *local_f0;
  undefined8 local_e8;
  undefined8 **local_e0;
  undefined8 local_d8;
  undefined1 *local_d0;
  undefined8 local_c8;
  undefined8 *local_c0;
  undefined8 local_b8;
  long local_b0;
  long local_a8;
  long *local_a0;
  ulong *local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  float local_7c;
  long local_78;
  ulong local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_a0 = (long *)*param_3;
  local_b0 = param_3[1];
  local_a8 = *param_4;
  if (local_a8 != param_4[1]) {
    local_78 = param_4[3];
    local_110 = param_3[2];
    uVar6 = param_4[2];
    local_108 = ((ulong)(param_4[1] - local_a8) >> 3) * 0x2e8ba2e8ba2e8ba3;
    local_118 = 0;
    ppuVar3 = &local_100;
    fVar7 = _DAT_145dbf580;
    local_58 = in_XMM6_Da;
    do {
      lVar4 = local_118 * 0x58 + local_a8;
      local_128 = 3;
      local_130 = 0x1471b5ba6;
      if (uVar6 < *(ulong *)(local_78 + 0x988)) {
        local_128 = 4;
        if (*(long *)(local_78 + 0x568) != 0) {
          lVar2 = *(long *)(local_78 + 0x560);
          lVar5 = 0;
          do {
            if (((*(char *)(lVar2 + 0x68 + lVar5) == '\0') &&
                (*(long *)(lVar2 + 0x18 + lVar5) != -1)) &&
               (*(int *)(*(long *)(lVar2 + 0x30 + lVar5) + 0x30) == *(int *)(lVar4 + 0x30))) {
              local_128 = 2;
              local_130 = 0x1471b5ba4;
              goto LAB_1459b1667;
            }
            lVar5 = lVar5 + 0x160;
          } while (*(long *)(local_78 + 0x568) * 0x160 - lVar5 != 0);
        }
        local_130 = 0x1471b5ba0;
      }
LAB_1459b1667:
      uVar6 = uVar6 + 1;
      local_7c = *(float *)(lVar4 + 0x40) * fVar7;
      local_98 = (ulong *)(lVar4 + 0x30);
      uStack_90 = 0x145badf80;
      local_120 = uVar6;
      func_0x000145b9c4d0(lVar4,ppuVar3,0x146ba0d69,ppuVar3,&local_98);
      lVar2 = *(long *)(lVar4 + 8);
      local_70 = uStack_f8;
      auVar8 = func_0x0001458da590();
      lVar5 = auVar8._8_8_;
      if (local_100 != (ulong *)0x0) {
        local_70 = uVar6;
        func_0x0001400021d0();
        uVar6 = local_70;
      }
      if (auVar8._0_8_ == 0) {
        lVar5 = lVar2;
      }
      local_100 = (ulong *)0x0;
      uStack_f8 = 1;
      local_f0 = (float *)0x0;
      if (lVar5 != 0) {
        func_0x000145bcb2d0();
      }
      func_0x0001459b9b70();
      local_88 = local_f0;
      local_98 = local_100;
      uStack_90 = uStack_f8;
      local_61 = *(undefined1 *)(lVar4 + 0x54);
      local_100 = &local_120;
      uStack_f8 = 0x145baee70;
      local_f0 = &local_7c;
      local_e8 = 0x145bad280;
      local_d8 = 0x1400020e0;
      local_d0 = &local_61;
      local_c8 = 0x145baa8b0;
      local_c0 = &local_130;
      local_b8 = 0x1400020c0;
      local_e0 = &local_98;
      func_0x000145b9c4d0();
      if (local_98 != (ulong *)0x0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(local_110 + 0x10 + local_b0 * 0x18) = local_138;
      puVar1 = (undefined8 *)(local_110 + local_b0 * 0x18);
      *puVar1 = local_148;
      puVar1[1] = uStack_140;
      local_b0 = local_b0 + 1;
      local_118 = local_118 + 1;
    } while (local_118 != local_108);
  }
  *local_a0 = local_b0;
  return;
}
