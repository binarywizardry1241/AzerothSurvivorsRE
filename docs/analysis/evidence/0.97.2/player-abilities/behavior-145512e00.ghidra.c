
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4,ulong *param_5)

{
  long *plVar1;
  float fVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  float *pfVar9;
  ulong uVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  long lVar14;
  undefined8 *puVar15;
  ulong *puVar16;
  ulong uVar17;
  long lVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  long lVar24;
  long lVar25;
  ulong local_158;
  ulong uStack_150;
  ulong local_148;
  ulong local_138;
  ulong uStack_130;
  ulong local_128;
  ulong local_118;
  ulong uStack_110;
  ulong local_108;
  ulong local_100;
  undefined8 local_f8;
  float local_f0;
  
  lVar5 = param_3[3];
  lVar6 = param_3[4];
  local_148 = param_5[2];
  local_158 = *param_5;
  uStack_150 = param_5[1];
  uVar8 = (ulong)(param_3[1] - *param_3) >> 3;
  if ((ulong)param_3[2] <= uVar8) {
    uVar8 = param_3[2];
  }
  if (uVar8 != 0) {
    fVar2 = *(float *)(lVar5 + 0x8e4);
    lVar7 = *(long *)(lVar5 + 0x4c8);
    uVar10 = 0;
    do {
      lVar18 = uVar10 * 8;
      uVar10 = uVar10 + 1;
      lVar13 = 0;
      lVar11 = lVar7;
      do {
        if (*(long *)(lVar5 + 0x4d0) * 0x160 - lVar13 == 0) {
          local_128 = local_148;
          local_138 = local_158;
          uStack_130 = uStack_150;
          goto LAB_145512ef3;
        }
        lVar13 = lVar13 + 0x160;
        plVar1 = (long *)(lVar11 + 0x88);
        lVar11 = lVar11 + 0x160;
      } while (*plVar1 != *(long *)(*param_3 + lVar18));
      fVar21 = *(float *)(lVar7 + -0x38 + lVar13);
      if (fVar21 <= 0.0) {
        local_f8 = *(undefined8 *)(lVar7 + -0x48 + lVar13);
        local_f0 = *(float *)(lVar7 + -0x40 + lVar13);
        uVar17 = *(ulong *)(lVar6 + 0x10);
        if (uVar17 == 0) goto LAB_145512fe7;
LAB_145512fad:
        fVar21 = *(float *)param_3[5];
        fVar22 = (float)local_f8;
        fVar23 = (float)((ulong)local_f8 >> 0x20);
        if (uVar17 < 5) {
          lVar14 = 0;
          local_100 = 0;
        }
        else {
          uVar12 = (ulong)((uint)uVar17 & 3);
          if ((uVar17 & 3) == 0) {
            uVar12 = 4;
          }
          lVar14 = uVar17 - uVar12;
          pfVar9 = (float *)(*(long *)(lVar6 + 8) + 0x28);
          lVar18 = 0;
          lVar11 = 0;
          lVar24 = 0;
          lVar25 = 0;
          lVar13 = lVar14;
          do {
            lVar24 = lVar24 + CONCAT44((uint)fVar2 & uRam00000001458fcae4,
                                       -(uint)((pfVar9[-9] - fVar23) * (pfVar9[-9] - fVar23) +
                                               (pfVar9[-10] - fVar22) * (pfVar9[-10] - fVar22) <=
                                              fVar21) & _DAT_1458fcae0);
            lVar25 = lVar25 + (ulong)(-(uint)((pfVar9[-6] - fVar23) * (pfVar9[-6] - fVar23) +
                                              (pfVar9[-7] - fVar22) * (pfVar9[-7] - fVar22) <=
                                             fVar21) & uRam00000001458fcae8);
            lVar18 = lVar18 + CONCAT44((uint)fVar2 & uRam00000001458fcae4,
                                       -(uint)((pfVar9[-3] - fVar23) * (pfVar9[-3] - fVar23) +
                                               (pfVar9[-4] - fVar22) * (pfVar9[-4] - fVar22) <=
                                              fVar21) & _DAT_1458fcae0);
            lVar11 = lVar11 + (ulong)(-(uint)((*pfVar9 - fVar23) * (*pfVar9 - fVar23) +
                                              (pfVar9[-1] - fVar22) * (pfVar9[-1] - fVar22) <=
                                             fVar21) & uRam00000001458fcae8);
            pfVar9 = pfVar9 + 0xc;
            lVar13 = lVar13 + -4;
          } while (lVar13 != 0);
          local_100 = lVar11 + lVar25 + lVar18 + lVar24;
        }
        lVar18 = uVar17 - lVar14;
        puVar15 = (undefined8 *)(*(long *)(lVar6 + 8) + lVar14 * 0xc);
        do {
          fVar19 = (float)*puVar15 - fVar22;
          fVar20 = (float)((ulong)*puVar15 >> 0x20) - fVar23;
          local_100 = (local_100 + 1) - (ulong)(fVar21 < fVar20 * fVar20 + fVar19 * fVar19);
          puVar15 = (undefined8 *)((long)puVar15 + 0xc);
          lVar18 = lVar18 + -1;
        } while (lVar18 != 0);
      }
      else {
        fVar21 = (fVar2 - *(float *)(lVar7 + -0x3c + lVar13)) / fVar21;
        fVar22 = 0.0;
        if (0.0 <= fVar21) {
          fVar22 = fVar21;
        }
        fVar21 = _DAT_1458eb480;
        if (fVar22 <= _DAT_1458eb480) {
          fVar21 = fVar22;
        }
        uVar3 = *(undefined8 *)(lVar7 + -0x54 + lVar13);
        uVar4 = *(undefined8 *)(lVar7 + -0x48 + lVar13);
        fVar22 = (float)uVar3;
        fVar23 = (float)((ulong)uVar3 >> 0x20);
        local_f8 = CONCAT44(fVar21 * ((float)((ulong)uVar4 >> 0x20) - fVar23) + fVar23,
                            fVar21 * ((float)uVar4 - fVar22) + fVar22);
        local_f0 = *(float *)(lVar7 + -0x4c + lVar13);
        local_f0 = (*(float *)(lVar7 + -0x40 + lVar13) - local_f0) * fVar21 + local_f0;
        uVar17 = *(ulong *)(lVar6 + 0x10);
        if (uVar17 != 0) goto LAB_145512fad;
LAB_145512fe7:
        local_100 = 0;
      }
      local_118 = local_158;
      uStack_110 = uStack_150;
      local_108 = local_148;
      puVar16 = &local_100;
      if (local_100 < local_158) {
        puVar16 = &local_118;
      }
      local_138 = *puVar16;
      uStack_130 = puVar16[1];
      local_128 = puVar16[2];
LAB_145512ef3:
      local_148 = local_128;
      local_158 = local_138;
      uStack_150 = uStack_130;
    } while (uVar10 != uVar8);
  }
  param_4[2] = local_148;
  *param_4 = local_158;
  param_4[1] = uStack_150;
  return;
}

