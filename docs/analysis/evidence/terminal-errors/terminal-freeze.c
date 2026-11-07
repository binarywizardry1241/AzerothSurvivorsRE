/* WARNING: Removing unreachable block (ram,0x00014591ded8) */
/* WARNING: Removing unreachable block (ram,0x00014591dca8) */
/* WARNING: Removing unreachable block (ram,0x00014591e118) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  ulong uVar6;
  long in_RCX;
  long lVar7;
  long lVar9;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float extraout_XMM0_Da_01;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  undefined4 local_160;
  undefined4 uStack_15c;
  undefined4 uStack_158;
  undefined4 uStack_154;
  undefined8 local_150;
  undefined8 uStack_148;
  long local_128;
  long local_120;
  long local_100;
  long local_f8;
  long lVar8;

  fVar15 = *(float *)(in_RCX + 0xa34);
  uVar16 = *(undefined4 *)(in_RCX + 0xa34);
  uVar17 = 0;
  local_128 = 8;
  local_120 = 0;
  lVar3 = *(long *)(in_RCX + 0x560);
  lVar4 = *(long *)(in_RCX + 0x568);
  lVar9 = 0;
  fVar18 = 0.0;
  lVar7 = lVar3;
  fVar14 = _DAT_145d97610;
  while (lVar8 = lVar7, lVar7 = lVar8 + 0x1d8, lVar8 != lVar4 * 0x1d8 + lVar3) {
    if (((*(int *)(lVar8 + 0xb0) == 0) && (fVar10 = *(float *)(lVar8 + 400), fVar18 < fVar10)) &&
       (fVar15 < fVar10 + *(float *)(lVar8 + 0x18c))) {
      fVar10 = (fVar15 - *(float *)(lVar8 + 0x18c)) / fVar10;
      fVar20 = 0.0;
      if (0.0 <= fVar10) {
        fVar20 = fVar10;
      }
      fVar10 = fVar14;
      if (fVar20 <= fVar14) {
        fVar10 = fVar20;
      }
      fVar19 = (float)*(undefined8 *)(lVar8 + 0x174);
      fVar13 = (float)((ulong)*(undefined8 *)(lVar8 + 0x174) >> 0x20);
      fVar11 = fVar10 * ((float)*(undefined8 *)(lVar8 + 0x180) - fVar19) + fVar19;
      fVar13 = fVar10 * ((float)((ulong)*(undefined8 *)(lVar8 + 0x180) >> 0x20) - fVar13) + fVar13;
      fVar20 = *(float *)(lVar8 + 0x17c);
      fVar12 = *(float *)(lVar8 + 0x188);
      uVar6 = func_0x0001458d0220(fVar19,fVar11,CONCAT44(fVar13,fVar13));
      fVar19 = extraout_XMM0_Da;
      if ((uVar6 & 1) == 0) {
        fVar19 = fVar10 * (fVar12 - fVar20) + fVar20;
      }
      *(ulong *)(lVar8 + 0x174) = CONCAT44(fVar13,fVar11);
      *(float *)(lVar8 + 0x17c) = fVar19;
      *(ulong *)(lVar8 + 0x180) = CONCAT44(fVar13,fVar11);
      *(float *)(lVar8 + 0x188) = fVar19;
      *(ulong *)(lVar8 + 0x18c) = CONCAT44(uVar17,uVar16);
      uVar5 = *(undefined8 *)(lVar8 + 0xf0);
      if (local_120 == 0) {
        func_0x000145bf4cb0();
      }
      *(undefined8 *)(local_120 * 0x18 + 8) = uVar5;
      *(ulong *)(local_120 * 0x18 + 0x10) = CONCAT44(fVar13,fVar11);
      *(float *)(local_120 * 0x18 + 0x18) = fVar19;
      lVar9 = local_120 + 1;
      local_120 = lVar9;
    }
  }
  for (; local_128 != lVar9 * 0x18 + 8; local_128 = local_128 + 0x18) {
    *(int *)(in_RCX + 0xa64) = *(int *)(in_RCX + 0xa64) + 1;
    func_0x0001458bfdd0();
    lVar3 = *(long *)(in_RCX + 0x628);
    if (lVar3 == *(long *)(in_RCX + 0x618)) {
      func_0x000145bf4ee0();
    }
    lVar4 = *(long *)(in_RCX + 0x620);
    puVar2 = (undefined8 *)(lVar4 + 0x10 + lVar3 * 0x20);
    *puVar2 = local_150;
    puVar2[1] = uStack_148;
    puVar1 = (undefined4 *)(lVar4 + lVar3 * 0x20);
    *puVar1 = local_160;
    puVar1[1] = uStack_15c;
    puVar1[2] = uStack_158;
    puVar1[3] = uStack_154;
    *(long *)(in_RCX + 0x628) = lVar3 + 1;
  }
  fVar15 = *(float *)(in_RCX + 0xa34);
  uVar16 = *(undefined4 *)(in_RCX + 0xa34);
  uVar17 = 0;
  local_100 = 8;
  local_f8 = 0;
  lVar3 = *(long *)(in_RCX + 0xd0);
  lVar4 = *(long *)(in_RCX + 0xd8);
  lVar9 = 0;
  fVar18 = 0.0;
  lVar7 = lVar3;
  while (lVar8 = lVar7, lVar7 = lVar8 + 0x78, lVar8 != lVar4 * 0x78 + lVar3) {
    fVar10 = *(float *)(lVar8 + 0x5c);
    if ((fVar18 < fVar10) && (fVar15 < fVar10 + *(float *)(lVar8 + 0x58))) {
      fVar10 = (fVar15 - *(float *)(lVar8 + 0x58)) / fVar10;
      fVar20 = 0.0;
      if (0.0 <= fVar10) {
        fVar20 = fVar10;
      }
      fVar10 = fVar14;
      if (fVar20 <= fVar14) {
        fVar10 = fVar20;
      }
      fVar19 = (float)*(undefined8 *)(lVar8 + 0x40);
      fVar13 = (float)((ulong)*(undefined8 *)(lVar8 + 0x40) >> 0x20);
      fVar11 = fVar10 * ((float)*(undefined8 *)(lVar8 + 0x4c) - fVar19) + fVar19;
      fVar13 = fVar10 * ((float)((ulong)*(undefined8 *)(lVar8 + 0x4c) >> 0x20) - fVar13) + fVar13;
      fVar20 = *(float *)(lVar8 + 0x48);
      fVar12 = *(float *)(lVar8 + 0x54);
      uVar6 = func_0x0001458d0220(fVar19,fVar11,CONCAT44(fVar13,fVar13));
      fVar19 = extraout_XMM0_Da_00;
      if ((uVar6 & 1) == 0) {
        fVar19 = fVar10 * (fVar12 - fVar20) + fVar20;
      }
      *(ulong *)(lVar8 + 0x40) = CONCAT44(fVar13,fVar11);
      *(float *)(lVar8 + 0x48) = fVar19;
      *(ulong *)(lVar8 + 0x4c) = CONCAT44(fVar13,fVar11);
      *(float *)(lVar8 + 0x54) = fVar19;
      *(ulong *)(lVar8 + 0x58) = CONCAT44(uVar17,uVar16);
      *(float *)(lVar8 + 100) = fVar15;
      uVar5 = *(undefined8 *)(lVar8 + 0x20);
      if (local_f8 == 0) {
        func_0x000145bf4cb0();
      }
      *(undefined8 *)(local_f8 * 0x18 + 8) = uVar5;
      *(ulong *)(local_f8 * 0x18 + 0x10) = CONCAT44(fVar13,fVar11);
      *(float *)(local_f8 * 0x18 + 0x18) = fVar19;
      lVar9 = local_f8 + 1;
      local_f8 = lVar9;
    }
  }
  for (; local_100 != lVar9 * 0x18 + 8; local_100 = local_100 + 0x18) {
    *(int *)(in_RCX + 0xa64) = *(int *)(in_RCX + 0xa64) + 1;
    func_0x0001458bfdd0();
    lVar3 = *(long *)(in_RCX + 0x628);
    if (lVar3 == *(long *)(in_RCX + 0x618)) {
      func_0x000145bf4ee0();
    }
    lVar4 = *(long *)(in_RCX + 0x620);
    puVar2 = (undefined8 *)(lVar4 + 0x10 + lVar3 * 0x20);
    *puVar2 = local_150;
    puVar2[1] = uStack_148;
    puVar1 = (undefined4 *)(lVar4 + lVar3 * 0x20);
    *puVar1 = local_160;
    puVar1[1] = uStack_15c;
    puVar1[2] = uStack_158;
    puVar1[3] = uStack_154;
    *(long *)(in_RCX + 0x628) = lVar3 + 1;
  }
  fVar15 = *(float *)(in_RCX + 0xa34);
  uVar16 = *(undefined4 *)(in_RCX + 0xa34);
  uVar17 = 0;
  local_100 = 8;
  local_f8 = 0;
  lVar3 = *(long *)(in_RCX + 0x940);
  lVar4 = *(long *)(in_RCX + 0x948);
  lVar9 = 0;
  fVar18 = 0.0;
  lVar7 = lVar3;
  while (lVar8 = lVar7, lVar8 != lVar4 * 0x70 + lVar3) {
    fVar10 = *(float *)(lVar8 + 0x5c);
    lVar7 = lVar8 + 0x70;
    if (fVar15 < *(float *)(lVar8 + 0x58) + fVar10) {
      if (fVar10 <= fVar18) {
        fVar12 = (float)*(undefined8 *)(lVar8 + 0x4c);
        fVar19 = (float)((ulong)*(undefined8 *)(lVar8 + 0x4c) >> 0x20);
        fVar20 = *(float *)(lVar8 + 0x54);
      }
      else {
        fVar10 = (fVar15 - *(float *)(lVar8 + 0x58)) / fVar10;
        fVar20 = 0.0;
        if (0.0 <= fVar10) {
          fVar20 = fVar10;
        }
        fVar13 = fVar14;
        if (fVar20 <= fVar14) {
          fVar13 = fVar20;
        }
        fVar12 = (float)*(undefined8 *)(lVar8 + 0x40);
        fVar19 = (float)((ulong)*(undefined8 *)(lVar8 + 0x40) >> 0x20);
        fVar12 = fVar13 * ((float)*(undefined8 *)(lVar8 + 0x4c) - fVar12) + fVar12;
        fVar19 = fVar13 * ((float)((ulong)*(undefined8 *)(lVar8 + 0x4c) >> 0x20) - fVar19) + fVar19;
        fVar10 = *(float *)(lVar8 + 0x48);
        fVar20 = (*(float *)(lVar8 + 0x54) - fVar10) * fVar13 + fVar10;
      }
      uVar6 = func_0x0001458d0220(fVar10,fVar12,CONCAT44(fVar19,fVar19));
      fVar10 = extraout_XMM0_Da_01;
      if ((uVar6 & 1) == 0) {
        fVar10 = fVar20;
      }
      *(ulong *)(lVar8 + 0x40) = CONCAT44(fVar19,fVar12);
      *(float *)(lVar8 + 0x48) = fVar10;
      *(ulong *)(lVar8 + 0x4c) = CONCAT44(fVar19,fVar12);
      *(float *)(lVar8 + 0x54) = fVar10;
      *(ulong *)(lVar8 + 0x58) = CONCAT44(uVar17,uVar16);
      *(float *)(lVar8 + 0x60) = fVar15;
      uVar5 = *(undefined8 *)(lVar8 + 0x38);
      if (local_f8 == 0) {
        func_0x000145bf4cb0();
      }
      *(undefined8 *)(local_f8 * 0x18 + 8) = uVar5;
      *(ulong *)(local_f8 * 0x18 + 0x10) = CONCAT44(fVar19,fVar12);
      *(float *)(local_f8 * 0x18 + 0x18) = fVar10;
      lVar9 = local_f8 + 1;
      local_f8 = lVar9;
    }
  }
  for (; local_100 != lVar9 * 0x18 + 8; local_100 = local_100 + 0x18) {
    *(int *)(in_RCX + 0xa64) = *(int *)(in_RCX + 0xa64) + 1;
    func_0x0001458bfdd0();
    lVar3 = *(long *)(in_RCX + 0x628);
    if (lVar3 == *(long *)(in_RCX + 0x618)) {
      func_0x000145bf4ee0();
    }
    lVar4 = *(long *)(in_RCX + 0x620);
    puVar2 = (undefined8 *)(lVar4 + 0x10 + lVar3 * 0x20);
    *puVar2 = local_150;
    puVar2[1] = uStack_148;
    puVar1 = (undefined4 *)(lVar4 + lVar3 * 0x20);
    *puVar1 = local_160;
    puVar1[1] = uStack_15c;
    puVar1[2] = uStack_158;
    puVar1[3] = uStack_154;
    *(long *)(in_RCX + 0x628) = lVar3 + 1;
  }
  return;
}
