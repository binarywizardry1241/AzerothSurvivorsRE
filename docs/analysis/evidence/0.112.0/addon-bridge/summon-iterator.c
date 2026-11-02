
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1459f8900(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  byte bVar1;
  undefined8 uVar2;
  undefined1 auVar3 [16];
  ulong uVar4;
  long lVar5;
  byte *pbVar6;
  uint uVar7;
  uint uVar8;
  ulong uVar9;
  long lVar10;
  undefined8 *puVar11;
  byte *pbVar12;
  long lVar13;
  undefined8 uVar14;
  byte *pbVar15;
  byte *pbVar16;
  byte *pbVar17;
  byte *pbVar18;
  undefined4 in_XMM6_Da;
  float fVar19;
  undefined1 auVar20 [16];
  undefined8 local_1c0;
  undefined8 uStack_1b8;
  undefined8 local_1b0;
  undefined8 local_1a8;
  undefined8 local_1a0;
  undefined1 local_198 [16];
  long local_188 [3];
  ulong local_170;
  undefined8 *local_168;
  long local_160;
  ulong local_158;
  long local_150;
  undefined8 *local_148;
  long lStack_140;
  undefined8 *local_138;
  undefined8 local_130;
  long *local_128;
  undefined8 local_120;
  undefined8 *local_118;
  undefined8 local_110;
  float *local_108;
  undefined8 local_100;
  float *local_f8;
  undefined8 local_f0;
  undefined4 **local_e8;
  undefined8 local_e0;
  undefined8 **local_d8;
  undefined8 local_d0;
  byte *local_c8;
  undefined8 local_c0;
  long local_b8;
  long *local_b0;
  undefined8 *local_a8;
  long lStack_a0;
  undefined1 *local_98;
  undefined4 *local_88;
  undefined8 uStack_80;
  undefined8 *local_78;
  undefined4 local_6c;
  float local_68;
  float local_64;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  lVar5 = *param_4;
  local_b0 = (long *)*param_3;
  local_b8 = param_3[1];
  if (lVar5 != param_4[1]) {
    local_150 = param_3[2];
    local_158 = (ulong)(param_4[1] - lVar5) >> 7;
    uVar9 = 0;
    fVar19 = _DAT_145db1368;
    local_160 = lVar5;
    local_58 = in_XMM6_Da;
    do {
      lVar10 = uVar9 * 0x80;
      local_68 = fVar19;
      local_64 = fVar19;
      if (*(char *)(lVar5 + lVar10) != '\0') {
        local_64 = *(float *)(lVar5 + 8 + lVar10);
        local_68 = local_64 - *(float *)(lVar5 + 0x6c + lVar10);
      }
      puVar11 = *(undefined8 **)(lVar5 + 0x18 + lVar10);
      auVar20 = FUN_14599e770();
      lVar13 = auVar20._8_8_;
      local_6c = *(undefined4 *)(lVar10 + lVar5 + 0x20);
      local_198 = auVar20;
      FUN_14599e3d0(lVar13,lVar10 + lVar5,puVar11,local_188);
      lVar5 = (ulong)*(byte *)((long)puVar11 + 0x39) * 8;
      local_1a8 = *(undefined8 *)(lVar5 + 0x147246728);
      local_1a0 = *(undefined8 *)(lVar5 + 0x147246770);
      if (lVar13 == 0) {
        local_88 = (undefined4 *)0x0;
        uStack_80 = 1;
        local_78 = (undefined8 *)0x0;
      }
      else {
        local_a8 = (undefined8 *)local_198;
        lStack_a0 = 0x1400020c0;
        func_0x000145bdd130();
        local_88 = (undefined4 *)local_148;
        uStack_80 = lStack_140;
        local_78 = local_138;
      }
      uVar2 = *puVar11;
      uVar14 = puVar11[1];
      local_170 = uVar9;
      auVar20 = func_0x00014598ddd0();
      auVar3._8_8_ = uVar14;
      auVar3._0_8_ = uVar2;
      local_168 = puVar11 + 4;
      if (auVar20._0_8_ == 0) {
        auVar20 = auVar3;
      }
      local_148 = (undefined8 *)0x0;
      lStack_140 = 1;
      local_138 = (undefined8 *)0x0;
      pbVar12 = auVar20._0_8_ + auVar20._8_8_;
      pbVar6 = auVar20._0_8_;
      pbVar17 = (byte *)0x0;
      pbVar15 = (byte *)0x0;
      while( true ) {
        pbVar16 = pbVar17;
        local_c8 = auVar20._8_8_;
        local_c0 = auVar20._0_8_;
        if (pbVar6 == pbVar12) break;
        bVar1 = *pbVar6;
        uVar7 = (uint)bVar1;
        if ((char)bVar1 < '\0') {
          uVar8 = bVar1 & 0x1f;
          if (bVar1 < 0xe0) {
            pbVar18 = pbVar6 + 2;
            uVar7 = uVar8 << 6 | pbVar6[1] & 0x3f;
          }
          else {
            uVar7 = pbVar6[2] & 0x3f | (pbVar6[1] & 0x3f) << 6;
            if (bVar1 < 0xf0) {
              pbVar18 = pbVar6 + 3;
              uVar7 = uVar7 | uVar8 << 0xc;
            }
            else {
              pbVar18 = pbVar6 + 4;
              uVar7 = pbVar6[3] & 0x3f | uVar7 << 6 | (bVar1 & 7) << 0x12;
            }
          }
        }
        else {
          pbVar18 = pbVar6 + 1;
        }
        pbVar17 = pbVar18 + ((long)pbVar16 - (long)pbVar6);
        pbVar6 = pbVar18;
        if ((uVar7 == 0x2c) || (uVar7 == 0x3b)) {
          uVar9 = (long)pbVar16 - (long)pbVar15;
          puVar11 = local_138;
          if ((ulong)((long)local_148 - (long)local_138) < uVar9) {
            func_0x000145c0d470();
            auVar20._8_8_ = local_c8;
            auVar20._0_8_ = local_c0;
            puVar11 = local_138;
          }
          if (pbVar16 != pbVar15) {
            local_c8 = auVar20._8_8_;
            local_c0 = auVar20._0_8_;
            local_138 = puVar11;
            func_0x000145c0a3db();
            auVar20._8_8_ = local_c8;
            auVar20._0_8_ = local_c0;
          }
          local_c8 = auVar20._8_8_;
          local_c0 = auVar20._0_8_;
          local_138 = (undefined8 *)((long)puVar11 + uVar9);
          if (local_148 == local_138) {
            func_0x000145c0d470();
            auVar20._8_8_ = local_c8;
            auVar20._0_8_ = local_c0;
          }
          *(undefined1 *)(lStack_140 + (long)local_138) = 0x20;
          local_138 = (undefined8 *)((long)local_138 + 1);
          pbVar15 = pbVar17;
        }
      }
      uVar9 = (long)local_c8 - (long)pbVar15;
      if ((ulong)((long)local_148 - (long)local_138) < uVar9) {
        func_0x000145c0d470();
        auVar20._8_8_ = local_c8;
        auVar20._0_8_ = local_c0;
        if (local_c8 != pbVar15) goto LAB_1459f8c83;
      }
      else if (local_c8 != pbVar15) {
LAB_1459f8c83:
        puVar11 = local_138;
        local_c8 = auVar20._8_8_;
        local_c0 = auVar20._0_8_;
        func_0x000145c0a3db();
        auVar20._8_8_ = local_c8;
        auVar20._0_8_ = local_c0;
        local_138 = puVar11;
      }
      lStack_a0 = lStack_140;
      local_c8 = auVar20._8_8_;
      local_c0 = auVar20._0_8_;
      local_98 = (undefined1 *)((long)local_138 + uVar9);
      lStack_140 = 0x145beebe0;
      local_138 = local_168;
      local_a8 = local_148;
      local_130 = 0x145beebe0;
      local_128 = local_188;
      local_120 = 0x1400020e0;
      local_118 = &local_1a8;
      local_110 = 0x1400020c0;
      local_108 = &local_64;
      local_100 = 0x145bedee0;
      local_f8 = &local_68;
      local_f0 = 0x145bedee0;
      local_e8 = &local_88;
      local_e0 = 0x1400020e0;
      local_d8 = &local_a8;
      local_d0 = 0x1400020e0;
      local_148 = (undefined8 *)&local_6c;
      func_0x000145bdd130();
      uVar4 = local_158;
      lVar5 = local_160;
      uVar9 = local_170;
      if (local_a8 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
      if (local_88 != (undefined4 *)0x0) {
        func_0x0001400021d0();
      }
      if (local_188[0] != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(local_150 + 0x10 + local_b8 * 0x18) = local_1b0;
      puVar11 = (undefined8 *)(local_150 + local_b8 * 0x18);
      *puVar11 = local_1c0;
      puVar11[1] = uStack_1b8;
      local_b8 = local_b8 + 1;
      uVar9 = uVar9 + 1;
    } while (uVar9 != uVar4);
  }
  *local_b0 = local_b8;
  return;
}
