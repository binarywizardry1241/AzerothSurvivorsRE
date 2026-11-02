/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3)

{
  uint *puVar1;
  float fVar2;
  char cVar3;
  char cVar4;
  int iVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  bool bVar9;
  ulong uVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  uint uVar14;
  long lVar15;
  byte *pbVar16;
  undefined8 *puVar17;
  uint *puVar18;
  int *piVar19;
  uint uVar20;
  undefined8 uVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  long *in_stack_00000038;
  int *local_118;
  int *local_110;
  long local_100;
  long local_d0;
  long local_b0;
  long local_a0;
  long local_98;

  lVar6 = *param_3;
  lVar7 = param_3[1];
  iVar5 = *(int *)((long)param_3 + 0x14);
  uVar14 = iVar5 - (int)param_3[2];
  uVar20 = 0xc233b000;
  if (uVar14 < 0xc233b000) {
    uVar20 = uVar14;
  }
  lVar8 = *in_stack_00000038;
  puVar18 = *(uint **)(lVar6 + 0xf8);
  puVar1 = puVar18 + *(long *)(lVar6 + 0x100);
  cVar3 = *(char *)(lVar6 + 0x108);
  uVar21 = 0;
  local_100 = 8;
  local_b0 = 0;
  bVar9 = false;
  lVar11 = 0;
  uVar12 = 0;
  local_98 = 0;
  local_a0 = 0;
  fVar23 = _DAT_145d6d878;
  fVar24 = _DAT_145d70c3c;
LAB_140279f24:
  do {
    while (cVar3 != '\0') {
      do {
        if ((int)uVar12 == (int)uVar21) {
          if (puVar18 == puVar1) {
            return;
          }
          uVar12 = (ulong)*puVar18;
          puVar18 = puVar18 + 1;
          lVar11 = *(long *)(lVar7 + 0x1a8);
          if (*(long *)(lVar11 + 0x10 + uVar12 * 0x48) == 0) {
            do {
              if (puVar18 == puVar1) {
                return;
              }
              uVar14 = *puVar18;
              puVar18 = puVar18 + 1;
            } while (*(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) == 0);
            lVar15 = *(long *)(lVar7 + 0x1a8) + (ulong)uVar14 * 0x48;
            puVar17 = (undefined8 *)(lVar15 + 0x10);
            uVar12 = *(ulong *)(lVar6 + 0x110);
            uVar10 = *(ulong *)(lVar15 + 0x40);
            if (uVar12 < uVar10) goto LAB_14027a00b;
LAB_14027a050:
            local_a0 = 0;
            uVar12 = *(ulong *)(lVar6 + 0x118);
            if (uVar10 <= uVar12) goto LAB_14027a0b0;
LAB_14027a067:
            uVar12 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar12 * 8);
            if (uVar12 == 0) goto LAB_14027a0b0;
            local_98 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar12 * 0x30);
            uVar12 = *(ulong *)(lVar6 + 0x120);
            if (uVar12 < uVar10) goto LAB_14027a0cd;
LAB_140279f40:
            bVar9 = false;
          }
          else {
            lVar15 = lVar11 + uVar12 * 0x48;
            puVar17 = (undefined8 *)(lVar11 + uVar12 * 0x48 + 0x10);
            uVar12 = *(ulong *)(lVar6 + 0x110);
            uVar10 = *(ulong *)(lVar15 + 0x40);
            if (uVar10 <= uVar12) goto LAB_14027a050;
LAB_14027a00b:
            uVar12 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar12 * 8);
            if (uVar12 == 0) goto LAB_14027a050;
            local_a0 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar12 * 0x30);
            uVar12 = *(ulong *)(lVar6 + 0x118);
            if (uVar12 < uVar10) goto LAB_14027a067;
LAB_14027a0b0:
            local_98 = 0;
            uVar12 = *(ulong *)(lVar6 + 0x120);
            if (uVar10 <= uVar12) goto LAB_140279f40;
LAB_14027a0cd:
            uVar12 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar12 * 8);
            if (uVar12 == 0) goto LAB_140279f40;
            lVar11 = ~uVar12 * 0x30;
            local_b0 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + lVar11);
            local_d0 = *(long *)(*(long *)(lVar15 + 0x18) + 0x28 + lVar11);
            bVar9 = true;
          }
          uVar12 = 0;
          lVar11 = func_0x000144e38680(puVar18,0,*(undefined8 *)(lVar6 + 0x128));
          uVar21 = *puVar17;
        }
        uVar10 = uVar12 & 0xffffffff;
        uVar12 = (ulong)((int)uVar12 + 1);
      } while (uVar20 <= (uint)(iVar5 - *(int *)(lVar11 + uVar10 * 4)));
      pbVar16 = (byte *)(local_98 + uVar10);
      if (!bVar9) {
        bVar9 = false;
        lVar15 = 0;
        cVar4 = *(char *)(local_a0 + uVar10);
        piVar19 = local_118;
        goto joined_r0x00014027a3f8;
      }
      local_118 = (int *)(local_d0 + uVar10 * 4);
      lVar15 = uVar10 * 0x20 + local_b0;
      bVar9 = true;
      cVar4 = *(char *)(local_a0 + uVar10);
      piVar19 = local_118;
joined_r0x00014027a370:
      if (cVar4 == '\0') goto LAB_14027a41e;
    }
    do {
      if ((int)uVar12 == (int)uVar21) {
        if (puVar18 == puVar1) {
          return;
        }
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
        if (*(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0) {
          do {
            if (puVar18 == puVar1) {
              return;
            }
            uVar14 = *puVar18;
            puVar18 = puVar18 + 1;
          } while (*(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0);
          lVar15 = *(long *)(lVar7 + 0x108) + (ulong)uVar14 * 0xa0;
        }
        else {
          lVar15 = *(long *)(lVar7 + 0x108) + (ulong)uVar14 * 0xa0;
        }
        lVar11 = *(long *)(lVar7 + 0x1a8) + (ulong)*(uint *)(lVar15 + 0x94) * 0x48;
        uVar12 = *(ulong *)(*(long *)(lVar7 + 0x1a8) + 0x40 + (ulong)*(uint *)(lVar15 + 0x94) * 0x48
                           );
        if ((*(ulong *)(lVar6 + 0x110) < uVar12) &&
           (uVar10 = *(ulong *)(*(long *)(lVar11 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
           uVar10 != 0)) {
          local_a0 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar10 * 0x30);
          uVar10 = *(ulong *)(lVar6 + 0x118);
          if (uVar12 <= uVar10) goto LAB_14027a2a0;
LAB_14027a257:
          uVar12 = *(ulong *)(*(long *)(lVar11 + 0x38) + uVar10 * 8);
          if (uVar12 == 0) goto LAB_14027a2a0;
          local_98 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar12 * 0x30);
          uVar12 = *(ulong *)(lVar6 + 0x120);
          if (uVar12 < *(ulong *)(lVar15 + 0x88)) goto LAB_14027a2c1;
LAB_14027a120:
          bVar9 = false;
        }
        else {
          local_a0 = 0;
          uVar10 = *(ulong *)(lVar6 + 0x118);
          if (uVar10 < uVar12) goto LAB_14027a257;
LAB_14027a2a0:
          local_98 = 0;
          uVar12 = *(ulong *)(lVar6 + 0x120);
          if (*(ulong *)(lVar15 + 0x88) <= uVar12) goto LAB_14027a120;
LAB_14027a2c1:
          if (*(long *)(*(long *)(lVar15 + 0x80) + uVar12 * 8) == 0) goto LAB_14027a120;
          lVar13 = ~*(ulong *)(*(long *)(lVar11 + 0x38) + uVar12 * 8) * 0x30;
          local_b0 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + lVar13);
          local_d0 = *(long *)(*(long *)(lVar11 + 0x18) + 0x28 + lVar13);
          bVar9 = true;
        }
        uVar12 = 0;
        lVar11 = func_0x000144e38680(puVar18,0,*(undefined8 *)(lVar6 + 0x128));
        local_100 = *(long *)(lVar15 + 0x50);
        uVar21 = *(undefined8 *)(lVar15 + 0x58);
      }
      uVar10 = uVar12 & 0xffffffff;
      uVar12 = (ulong)((int)uVar12 + 1);
      uVar10 = (ulong)~*(uint *)(local_100 + 8 + uVar10 * 0x10);
    } while (uVar20 <= (uint)(iVar5 - *(int *)(lVar11 + uVar10 * 4)));
    pbVar16 = (byte *)(local_98 + uVar10);
    if (!bVar9) {
      bVar9 = false;
      lVar15 = 0;
      cVar4 = *(char *)(local_a0 + uVar10);
      piVar19 = local_110;
      goto joined_r0x00014027a370;
    }
    piVar19 = (int *)(local_d0 + uVar10 * 4);
    lVar15 = uVar10 * 0x20 + local_b0;
    bVar9 = true;
    cVar4 = *(char *)(local_a0 + uVar10);
    local_110 = piVar19;
joined_r0x00014027a3f8:
  } while (cVar4 != '\0');
LAB_14027a41e:
  if (lVar15 == 0) {
LAB_14027a452:
                    /* WARNING: Could not emulate address calculation at 0x00014027a45c */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*pbVar16 * 4 + 0x145dc19f4) + 0x145dc19f4))();
    return;
  }
  *piVar19 = iVar5;
  fVar2 = *(float *)(lVar8 + 0x8c);
  if (*(int *)(lVar15 + 0x18) == 1) {
    fVar22 = fVar2 - *(float *)(lVar15 + 0x1c);
    if (fVar22 < fVar23) goto LAB_140279f24;
    if (fVar22 < fVar24) goto LAB_14027a452;
  }
  *(undefined4 *)(lVar15 + 0x18) = 1;
  *(float *)(lVar15 + 0x1c) = fVar2;
  goto LAB_140279f24;
}
