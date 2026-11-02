/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  long *plVar1;
  long lVar2;
  ulong uVar3;
  code *pcVar4;
  float fVar5;
  float fVar6;
  long lVar7;
  long lVar8;
  long extraout_RDX;
  long lVar9;
  long lVar10;
  long lVar11;
  bool bVar12;
  undefined8 uVar13;
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined4 in_XMM6_Da;
  float fVar16;
  undefined4 in_XMM7_Da;
  undefined4 uVar17;
  undefined4 uVar18;
  long local_1a0;
  long local_198;
  long local_190;
  long local_188;
  long local_180;
  long *local_178;
  undefined8 uStack_170;
  undefined8 local_168;
  undefined8 local_160;
  long local_158;
  long *local_150;
  undefined8 uStack_148;
  undefined8 *local_140;
  undefined8 local_138;
  undefined8 **local_130;
  undefined8 local_128;
  undefined4 *local_120;
  undefined8 local_118;
  float *local_110;
  undefined8 local_108;
  long *local_100;
  undefined8 local_f8;
  undefined4 *local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined8 local_d0;
  long local_c8 [3];
  int *local_b0;
  long local_a8;
  int *local_a0;
  undefined8 local_98;
  ulong local_90;
  long *local_88;
  undefined4 local_80;
  float local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  local_88 = (long *)*param_3;
  local_a8 = param_3[1];
  local_198 = *param_4;
  if (local_198 != param_4[1]) {
    local_b0 = (int *)param_4[3];
    local_190 = param_4[4];
    local_90 = param_4[5];
    local_a0 = (int *)param_4[6];
    local_188 = param_3[2];
    local_180 = ((ulong)(param_4[1] - local_198) >> 3) * -0x3333333333333333;
    lVar11 = 0;
    fVar16 = 0.0;
    lVar9 = param_4[2];
    uVar17 = _DAT_145db5dd0;
    uVar18 = uRam0000000145db5dd4;
    local_68 = in_XMM6_Da;
    local_58 = in_XMM7_Da;
    do {
      lVar2 = local_198 + lVar11 * 0x28;
      if ((*(int *)(local_198 + lVar11 * 0x28) == 1) && (*(long *)(local_b0 + 0x15a) != 0)) {
        lVar7 = *(long *)(local_b0 + 0x158);
        lVar8 = *(long *)(local_b0 + 0x15a) * 0x160;
        do {
          if ((*(long *)(lVar7 + 0x88) == *(long *)(lVar2 + 8)) && (*(int *)(lVar7 + 0x68) != 1)) {
            if (*(long *)(lVar7 + 0x40) == -1) {
              local_158 = 6;
              local_160 = 0x1471b5b25;
            }
            else {
              local_158 = 6 - (ulong)*(byte *)(lVar7 + 0x60);
              local_160 = 0x1471b5b25;
              if ((ulong)*(byte *)(lVar7 + 0x60) != 0) {
                local_160 = 0x1471b5b2b;
              }
            }
            local_78 = (undefined4)*(long *)(lVar2 + 8);
            local_7c = -1.0;
            func_0x0001458dfb70();
            lVar7 = extraout_RDX;
            goto LAB_1459b1de2;
          }
          lVar7 = lVar7 + 0x160;
          lVar8 = lVar8 + -0x160;
        } while (lVar8 != 0);
      }
      local_7c = *(float *)(lVar2 + 0x24) - (float)local_b0[0x27b];
      if (local_7c <= fVar16) {
        local_7c = fVar16;
      }
      local_160 = 0x1471b5b20;
      local_158 = 5;
      local_78 = 0;
      uVar3 = *(ulong *)(lVar2 + 0x10);
      if (local_90 <= uVar3) {
        func_0x000145d697e3(local_190,local_a8,local_90,uVar3,0x1471b5240);
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      lVar10 = uVar3 * 0x50;
      local_c8[0] = local_190 + lVar10 + 0x20;
      local_c8[1] = 0x145badf80;
      lVar8 = local_190;
      func_0x000145b9c4d0(local_190,lVar10,0x146ba0d60,&local_150,local_c8);
      lVar7 = *(long *)(lVar10 + lVar8 + 0x18);
      local_98 = uStack_148;
      auVar15 = func_0x0001458da590(*(undefined8 *)(lVar10 + lVar8 + 0x10),lVar7,local_140);
      if (local_150 != (long *)0x0) {
        func_0x0001400021d0();
      }
      if (auVar15._0_8_ != 0) {
        lVar7 = auVar15._8_8_;
      }
LAB_1459b1de2:
      lVar8 = lVar9 + 1;
      local_150 = (long *)0x0;
      uStack_148 = 1;
      local_140 = (undefined8 *)0x0;
      local_1a0 = lVar8;
      if (lVar7 != 0) {
        func_0x000145bcb2d0();
      }
      func_0x0001459b9b70();
      local_168 = local_140;
      local_178 = local_150;
      uStack_170 = uStack_148;
      uStack_d8 = *(undefined4 *)(lVar2 + 0x20);
      local_e0 = *(long *)(lVar2 + 0x18);
      uVar13 = CONCAT44(uVar18,uVar17);
      if (*local_a0 == 1) {
        fVar5 = (float)local_a0[3];
        fVar6 = (float)local_a0[4];
        auVar14._0_4_ = fVar5 - (float)local_e0;
        auVar14._4_4_ = (float)local_a0[1] - (float)((ulong)local_e0 >> 0x20);
        auVar14._8_4_ = fVar5 - 0.0;
        auVar14._12_4_ = fVar6 - 0.0;
        auVar15._4_4_ = (float)local_a0[1] - (float)local_a0[2];
        auVar15._0_4_ = fVar5 - fVar6;
        auVar15._8_4_ = fVar5 - fVar5;
        auVar15._12_4_ = fVar6 - fVar6;
        auVar15 = divps(auVar14,auVar15);
        uVar13 = auVar15._0_8_;
      }
      local_80 = (undefined4)((ulong)uVar13 >> 0x20);
      local_74 = (undefined4)uVar13;
      local_150 = &local_e0;
      uStack_148 = 0x145bad280;
      local_140 = (undefined8 *)((long)&local_e0 + 4);
      local_138 = 0x145bad280;
      local_130 = (undefined8 **)&uStack_d8;
      local_128 = 0x145bad280;
      local_120 = &local_80;
      local_118 = 0x145bad280;
      local_110 = (float *)&local_74;
      local_108 = 0x145bad280;
      func_0x000145b9c4d0();
      if (*local_b0 == 1) {
        bVar12 = *(long *)(local_b0 + 2) == lVar9;
      }
      else {
        bVar12 = false;
      }
      local_74 = CONCAT31(local_74._1_3_,bVar12);
      local_150 = &local_1a0;
      uStack_148 = 0x145baee70;
      local_140 = &local_160;
      local_138 = 0x1400020c0;
      local_130 = &local_178;
      local_128 = 0x1400020e0;
      local_120 = &local_78;
      local_118 = 0x145badf80;
      local_110 = &local_7c;
      local_108 = 0x145bad280;
      local_100 = local_c8;
      local_f8 = 0x1400020e0;
      local_f0 = &local_74;
      local_e8 = 0x145baa8b0;
      func_0x000145b9c4d0();
      if (local_c8[0] != 0) {
        func_0x0001400021d0();
      }
      if (local_178 != (long *)0x0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(local_188 + 0x10 + local_a8 * 0x18) = local_d0;
      plVar1 = (long *)(local_188 + local_a8 * 0x18);
      *plVar1 = local_e0;
      plVar1[1] = CONCAT44(uStack_d4,uStack_d8);
      local_a8 = local_a8 + 1;
      lVar11 = lVar11 + 1;
      lVar9 = lVar8;
    } while (lVar11 != local_180);
  }
  *local_88 = local_a8;
  return;
}
