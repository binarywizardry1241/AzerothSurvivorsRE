
void entry(undefined8 param_1,undefined8 param_2,ulong *param_3,ulong *param_4)

{
  long lVar1;
  long lVar2;
  undefined1 auVar3 [16];
  code *pcVar4;
  long *plVar5;
  undefined4 *puVar6;
  ulong uVar7;
  undefined8 uVar8;
  ulong uVar9;
  undefined4 *puVar10;
  undefined4 in_XMM6_Da;
  float fVar11;
  undefined4 in_XMM7_Da;
  float fVar12;
  long local_168;
  undefined4 local_160;
  undefined4 uStack_15c;
  undefined4 uStack_158;
  undefined4 uStack_154;
  undefined4 local_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  long local_140;
  ulong local_138;
  ulong local_130;
  ulong local_128;
  ulong *local_120;
  undefined8 local_118;
  long local_110;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined8 local_f8;
  undefined8 local_e8;
  undefined8 uStack_e0;
  long *local_d8;
  undefined8 local_d0;
  undefined4 *local_c8;
  undefined8 local_c0;
  float *local_b8;
  undefined8 local_b0;
  undefined4 *local_a8;
  undefined8 local_a0;
  float local_90;
  undefined4 local_8c;
  long *local_88;
  ulong *local_80;
  long *local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;
  
  local_70 = 0xfffffffffffffffe;
  local_128 = param_3[2];
  local_88 = (long *)*param_3;
  puVar10 = (undefined4 *)param_3[1];
  local_130 = local_128 << 5;
  auVar3._8_8_ = 0;
  auVar3._0_8_ = local_130;
  local_138 = SUB168(auVar3 * ZEXT816(0xaaaaaaaaaaaaaaab),8);
  puVar6 = (undefined4 *)param_3[3];
  local_120 = param_4;
  local_80 = param_3;
  local_78 = local_88;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (puVar10 != puVar6) {
    uVar7 = param_3[4];
    fVar11 = 0.0;
    uVar8 = 0x145cf8100;
    do {
      local_150 = *puVar10;
      uStack_14c = puVar10[1];
      uStack_148 = puVar10[2];
      uStack_144 = puVar10[3];
      uVar9 = *(ulong *)(puVar10 + 4);
      fVar12 = (float)puVar10[6];
      local_8c = puVar10[7];
      if (uVar9 < *(ulong *)(uVar7 + 0x858)) {
        lVar1 = *(long *)(uVar7 + 0x850);
        local_140 = lVar1 + uVar9 * 0x28 + 0x18;
        lVar2 = *(long *)(lVar1 + 0x10 + uVar9 * 0x28);
        local_e8 = (long *)0x0;
        uStack_e0 = 1;
        local_d8 = (long *)0x0;
        if (lVar2 != 0) {
          local_118 = *(undefined8 *)(lVar1 + 8 + uVar9 * 0x28);
          local_110 = lVar2;
          func_0x000145d14a10();
        }
        func_0x0001459e6cb0();
        local_f8 = local_d8;
        local_108 = (undefined4)local_e8;
        uStack_104 = local_e8._4_4_;
        uStack_100 = (undefined4)uStack_e0;
        uStack_fc = uStack_e0._4_4_;
        local_90 = fVar12;
        if (fVar12 <= fVar11) {
          local_90 = fVar11;
        }
        local_e8 = (long *)&local_108;
        uStack_e0 = 0x1400020e0;
        local_d8 = &local_140;
        local_d0 = 0x140c911a0;
        local_c8 = &local_150;
        local_c0 = 0x1400020c0;
        local_b8 = &local_90;
        local_a8 = &local_8c;
        local_b0 = uVar8;
        local_a0 = uVar8;
        func_0x000145ce7350();
        if (CONCAT44(uStack_104,local_108) != 0) {
          func_0x0001400021d0();
        }
        if (local_168 != -1) {
          *local_78 = local_168;
          *(undefined4 *)(local_78 + 1) = local_160;
          *(undefined4 *)((long)local_78 + 0xc) = uStack_15c;
          *(undefined4 *)(local_78 + 2) = uStack_158;
          *(undefined4 *)((long)local_78 + 0x14) = uStack_154;
          local_78 = local_78 + 3;
        }
      }
      puVar10 = puVar10 + 8;
    } while (puVar10 != puVar6);
  }
  uVar9 = local_138 >> 4;
  uVar7 = ((ulong)((long)local_78 - (long)local_88) >> 3) * -0x5555555555555555;
  local_e8 = local_88;
  local_d8 = (long *)local_128;
  *local_80 = 8;
  plVar5 = local_88;
  if (local_128 != 0 && local_130 != uVar9 * 0x18) {
    if (local_130 == 0) {
      plVar5 = (long *)0x8;
    }
    else {
      uStack_e0 = uVar7;
      plVar5 = (long *)func_0x0001400021e0();
      if (plVar5 == (long *)0x0) {
        func_0x000145eb6fb1();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
    }
  }
  *local_120 = uVar9;
  local_120[1] = (ulong)plVar5;
  local_120[2] = uVar7;
  return;
}

