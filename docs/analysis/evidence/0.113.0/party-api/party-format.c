
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  undefined8 uVar1;
  double dVar2;
  double *pdVar3;
  byte bVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 in_XMM6_Da;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 in_XMM7_Da;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 local_1a0;
  undefined4 uStack_19c;
  undefined4 uStack_198;
  undefined4 uStack_194;
  undefined8 local_190;
  double local_188;
  double local_180;
  double local_178;
  undefined8 local_170;
  double *local_168;
  double *local_160;
  long local_158;
  undefined8 local_150;
  undefined8 local_148;
  undefined8 uStack_140;
  long local_138;
  undefined8 local_130;
  undefined8 *local_128;
  undefined8 local_120;
  double *local_118;
  undefined8 local_110;
  double *local_108;
  undefined8 local_100;
  undefined4 *local_f8;
  undefined8 local_f0;
  double *local_e8;
  undefined8 local_e0;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined8 local_c8;
  long local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  ulong local_98;
  long *local_90;
  long local_88;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;

  local_80 = 0xfffffffffffffffe;
  lVar7 = *param_4;
  local_90 = (long *)*param_3;
  local_88 = param_3[1];
  if (lVar7 != param_4[1]) {
    local_160 = (double *)param_4[2];
    local_168 = (double *)param_4[3];
    uVar8 = (ulong)(param_4[1] - lVar7) >> 3;
    puVar5 = (undefined4 *)(param_3[2] + local_88 * 0x18);
    local_98 = 0;
    uVar14 = (undefined4)_DAT_145e9e170;
    uVar15 = (undefined4)((ulong)_DAT_145e9e170 >> 0x20);
    local_158 = lVar7;
    local_78 = in_XMM6_Da;
    local_68 = in_XMM7_Da;
    do {
      lVar7 = *(long *)(lVar7 + local_98 * 8);
      if (*(long *)(lVar7 + 0x28) == 0) {
        uVar16 = 0;
        uVar17 = 0;
        lVar9 = 0;
      }
      else {
        lVar9 = *(long *)(*(long *)(lVar7 + 0x20) + 0x10);
        uVar1 = *(undefined8 *)(*(long *)(lVar7 + 0x20) + 0x28);
        uVar16 = (undefined4)uVar1;
        uVar17 = (undefined4)((ulong)uVar1 >> 0x20);
      }
      local_148 = (long *)0x0;
      uStack_140 = 1;
      local_138 = 0;
      if (*(long *)(lVar7 + 0x10) != 0) {
        local_150 = *(undefined8 *)(lVar7 + 8);
        func_0x000145cfd5e0();
      }
      FUN_1459b04e0();
      local_a8 = local_138;
      local_b8 = (long)local_148;
      uStack_b0 = uStack_140;
      bVar4 = *(char *)(lVar7 + 0x38) - 2;
      lVar6 = 0x146fdcfc0;
      if (bVar4 < 10) {
        lVar6 = *(long *)((ulong)bVar4 * 8 + 0x14731ba48);
      }
      uVar12 = (undefined4)*(undefined8 *)(lVar7 + 0x30);
      uVar13 = (undefined4)((ulong)*(undefined8 *)(lVar7 + 0x30) >> 0x20);
      local_170 = func_0x000145cf86fd(uVar12);
      pdVar3 = local_160;
      local_178 = (double)CONCAT44(uVar13,uVar12) / *local_160;
      dVar2 = *local_168;
      uVar10 = SUB84(dVar2,0);
      uVar11 = (int)((ulong)dVar2 >> 0x20);
      if (dVar2 <= (double)CONCAT44(uVar15,uVar14)) {
        uVar10 = uVar14;
        uVar11 = uVar15;
      }
      local_180 = (double)CONCAT44(uVar13,uVar12) / (double)CONCAT44(uVar11,uVar10);
      local_148 = (long *)0x0;
      uStack_140 = 1;
      local_138 = 0;
      if (lVar9 != 0) {
        func_0x000145cfd5e0();
      }
      FUN_1459b04e0();
      local_c8 = local_138;
      local_d8 = (undefined4)local_148;
      uStack_d4 = local_148._4_4_;
      uStack_d0 = (undefined4)uStack_140;
      uStack_cc = uStack_140._4_4_;
      local_188 = (double)CONCAT44(uVar17,uVar16) / *pdVar3;
      local_138 = lVar6 + 0x10;
      local_148 = &local_b8;
      uStack_140 = 0x1400020e0;
      local_130 = 0x1400020c0;
      local_128 = &local_170;
      local_120 = 0x145cdca20;
      local_118 = &local_178;
      local_110 = 0x145cdca20;
      local_108 = &local_180;
      local_100 = 0x145cdca20;
      local_f8 = &local_d8;
      local_f0 = 0x1400020e0;
      local_e8 = &local_188;
      local_e0 = 0x145cdca20;
      func_0x000145ccb3e0();
      lVar7 = local_158;
      if (CONCAT44(uStack_d4,local_d8) != 0) {
        func_0x0001400021d0();
      }
      if (local_b8 != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(puVar5 + 4) = local_190;
      *puVar5 = local_1a0;
      puVar5[1] = uStack_19c;
      puVar5[2] = uStack_198;
      puVar5[3] = uStack_194;
      local_98 = local_98 + 1;
      puVar5 = puVar5 + 6;
    } while (uVar8 != local_98);
    local_88 = local_88 + local_98;
  }
  *local_90 = local_88;
  return;
}
