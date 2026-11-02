
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  undefined4 *puVar1;
  double dVar2;
  long lVar3;
  double *pdVar4;
  ulong uVar5;
  byte bVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 in_XMM6_Da;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 in_XMM7_Da;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 local_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined8 local_1a0;
  double local_198;
  double local_190;
  double local_188;
  undefined8 local_180;
  double *local_178;
  long local_170;
  ulong local_168;
  undefined8 local_160;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined8 local_148;
  long local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined8 local_110;
  undefined8 uStack_108;
  undefined8 *local_100;
  undefined8 local_f8;
  double *local_f0;
  undefined8 local_e8;
  double *local_e0;
  undefined8 local_d8;
  undefined4 *local_d0;
  undefined8 local_c8;
  double *local_c0;
  undefined8 local_b8;
  long local_b0;
  long *local_a8;
  undefined8 local_a0;
  long *local_98;
  undefined8 local_90;
  undefined4 local_88;
  undefined4 local_78;

  local_90 = 0xfffffffffffffffe;
  lVar3 = *param_4;
  local_a8 = (long *)*param_3;
  local_b0 = param_3[1];
  if (lVar3 != param_4[1]) {
    pdVar4 = (double *)param_4[2];
    local_178 = (double *)param_4[3];
    local_170 = param_3[2];
    local_168 = (ulong)(param_4[1] - lVar3) >> 3;
    uVar10 = 0;
    uVar15 = 0;
    uVar16 = 0;
    uVar17 = 0;
    uVar18 = 0;
    uVar19 = (undefined4)_DAT_145ebb170;
    uVar20 = (undefined4)((ulong)_DAT_145ebb170 >> 0x20);
    local_88 = in_XMM6_Da;
    local_78 = in_XMM7_Da;
    do {
      lVar9 = *(long *)(lVar3 + uVar10 * 8);
      if (*(long *)(lVar9 + 0x28) == 0) {
        local_110 = CONCAT44(uVar16,uVar15);
        uStack_108 = CONCAT44(uVar18,uVar17);
        uVar21 = 0;
        uVar22 = 0;
        local_a0 = 1;
        local_98 = (long *)0x0;
      }
      else {
        lVar7 = *(long *)(lVar9 + 0x20);
        func_0x0001458de3d0(uVar10,lVar7,*(undefined8 *)(lVar7 + 8),&local_120,
                            *(undefined8 *)(lVar7 + 0x10),*(undefined8 *)(lVar9 + 0x38));
        uVar21 = (undefined4)*(undefined8 *)(lVar7 + 0x28);
        uVar22 = (undefined4)((ulong)*(undefined8 *)(lVar7 + 0x28) >> 0x20);
        local_98 = local_120;
        local_a0 = uStack_118;
      }
      lVar7 = local_110;
      local_120 = (long *)0x0;
      uStack_118 = 1;
      local_110 = 0;
      if (*(long *)(lVar9 + 0x10) != 0) {
        local_160 = *(undefined8 *)(lVar9 + 8);
        func_0x000145d14a10();
      }
      func_0x0001459e6cb0();
      local_128 = local_110;
      local_138 = (long)local_120;
      uStack_130 = uStack_118;
      bVar6 = *(char *)(lVar9 + 0x48) - 2;
      lVar8 = 0x146cc3058;
      if (bVar6 < 10) {
        lVar8 = *(long *)((ulong)bVar6 * 8 + 0x14733bef8);
      }
      uVar13 = (undefined4)*(undefined8 *)(lVar9 + 0x30);
      uVar14 = (undefined4)((ulong)*(undefined8 *)(lVar9 + 0x30) >> 0x20);
      local_180 = func_0x000145d14667(uVar13);
      local_188 = (double)CONCAT44(uVar14,uVar13) / *pdVar4;
      dVar2 = *local_178;
      uVar11 = SUB84(dVar2,0);
      uVar12 = (int)((ulong)dVar2 >> 0x20);
      if (dVar2 <= (double)CONCAT44(uVar20,uVar19)) {
        uVar11 = uVar19;
        uVar12 = uVar20;
      }
      local_190 = (double)CONCAT44(uVar14,uVar13) / (double)CONCAT44(uVar12,uVar11);
      local_120 = (long *)0x0;
      uStack_118 = 1;
      local_110 = 0;
      if (lVar7 != 0) {
        func_0x000145d14a10();
      }
      func_0x0001459e6cb0();
      local_148 = local_110;
      local_158 = (undefined4)local_120;
      uStack_154 = local_120._4_4_;
      uStack_150 = (undefined4)uStack_118;
      uStack_14c = uStack_118._4_4_;
      local_198 = (double)CONCAT44(uVar22,uVar21) / *pdVar4;
      local_110 = lVar8 + 0x10;
      local_120 = &local_138;
      uStack_118 = 0x1400020e0;
      uStack_108 = 0x1400020c0;
      local_100 = &local_180;
      local_f8 = 0x145cf8990;
      local_f0 = &local_188;
      local_e8 = 0x145cf8990;
      local_e0 = &local_190;
      local_d8 = 0x145cf8990;
      local_c8 = 0x1400020e0;
      local_c0 = &local_198;
      local_b8 = 0x145cf8990;
      local_d0 = &local_158;
      func_0x000145ce7350();
      uVar5 = local_168;
      if (CONCAT44(uStack_154,local_158) != 0) {
        func_0x0001400021d0();
      }
      lVar9 = local_b0;
      if (local_138 != 0) {
        func_0x0001400021d0();
      }
      if (local_98 != (long *)0x0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(local_170 + 0x10 + lVar9 * 0x18) = local_1a0;
      puVar1 = (undefined4 *)(local_170 + lVar9 * 0x18);
      *puVar1 = local_1b0;
      puVar1[1] = uStack_1ac;
      puVar1[2] = uStack_1a8;
      puVar1[3] = uStack_1a4;
      local_b0 = lVar9 + 1;
      uVar10 = uVar10 + 1;
    } while (uVar10 != uVar5);
  }
  *local_a8 = local_b0;
  return;
}
