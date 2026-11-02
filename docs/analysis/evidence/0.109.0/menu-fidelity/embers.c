/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140078780(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  long *param_5)

{
  uint *puVar1;
  undefined4 *puVar2;
  float fVar3;
  char cVar4;
  undefined4 uVar5;
  long lVar6;
  uint uVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  long lVar11;
  uint uVar12;
  long lVar13;
  float *pfVar14;
  long lVar15;
  long lVar16;
  uint *puVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  undefined4 uVar28;
  undefined4 uVar29;
  long local_138;
  long local_128;
  long local_120;
  long local_118;
  long local_110;
  long local_100;

  lVar6 = *param_5;
  lVar15 = param_5[1];
  uVar5 = *(undefined4 *)((long)param_5 + 0x14);
  fVar20 = *(float *)(*param_3 + 0x5c);
  puVar17 = *(uint **)(lVar6 + 0xf8);
  puVar1 = puVar17 + *(long *)(lVar6 + 0x100);
  cVar4 = *(char *)(lVar6 + 0x108);
  local_128 = 0;
  local_100 = 8;
  uVar28 = (undefined4)_DAT_145dcd0e0;
  uVar29 = (undefined4)((ulong)_DAT_145dcd0e0 >> 0x20);
  local_120 = 0;
  lVar16 = 0;
  uVar12 = 0;
  local_138 = 0;
  fVar21 = _DAT_145dcd0c8;
  fVar22 = _DAT_145dcd0cc;
  fVar23 = _DAT_145dcd0d0;
  fVar24 = _DAT_145dcd0d4;
  fVar25 = _DAT_145dcd0d8;
  fVar26 = _DAT_145d9d2a0;
  fVar27 = _DAT_145dcd0dc;
  do {
    if (cVar4 == '\0') {
      if (uVar12 == (uint)lVar16) {
        do {
          if (puVar17 == puVar1) {
            return;
          }
          uVar12 = *puVar17;
          puVar17 = puVar17 + 1;
          lVar16 = *(long *)(*(long *)(lVar15 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0);
        } while (lVar16 == 0);
        lVar8 = *(long *)(lVar15 + 0x108) + (ulong)uVar12 * 0xa0;
        uVar10 = (ulong)*(uint *)(lVar8 + 0x94);
        lVar9 = *(long *)(lVar15 + 0x1a8);
        lVar13 = lVar9 + uVar10 * 0x48;
        lVar11 = *(long *)(lVar9 + 0x38 + uVar10 * 0x48);
        if (*(ulong *)(lVar6 + 0x110) < *(ulong *)(lVar9 + 0x40 + uVar10 * 0x48)) {
          uVar10 = *(ulong *)(lVar11 + *(ulong *)(lVar6 + 0x110) * 8);
          lVar13 = *(long *)(lVar13 + 0x18);
          if (uVar10 == 0) goto LAB_140078a58;
          local_138 = *(long *)(lVar13 + 0x10 + ~uVar10 * 0x30);
        }
        else {
          lVar13 = *(long *)(lVar13 + 0x18);
LAB_140078a58:
          local_138 = 0;
        }
        lVar9 = ~*(ulong *)(lVar11 + *(long *)(lVar6 + 0x118) * 8) * 0x30;
        local_120 = *(long *)(lVar13 + 0x10 + lVar9);
        local_110 = *(long *)(lVar13 + 0x28 + lVar9);
        lVar9 = ~*(ulong *)(lVar11 + *(long *)(lVar6 + 0x120) * 8) * 0x30;
        local_128 = *(long *)(lVar13 + 0x10 + lVar9);
        local_118 = *(long *)(lVar13 + 0x28 + lVar9);
        local_100 = *(long *)(lVar8 + 0x50);
        uVar12 = 0;
      }
      uVar7 = ~*(uint *)(local_100 + 8 + (ulong)uVar12 * 0x10);
    }
    else {
      uVar7 = uVar12;
      if (uVar12 == (uint)lVar16) {
        do {
          if (puVar17 == puVar1) {
            return;
          }
          uVar12 = *puVar17;
          puVar17 = puVar17 + 1;
          lVar16 = *(long *)(*(long *)(lVar15 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48);
        } while (lVar16 == 0);
        lVar13 = *(long *)(lVar15 + 0x1a8) + (ulong)uVar12 * 0x48;
        lVar9 = *(long *)(lVar13 + 0x38);
        if (*(ulong *)(lVar6 + 0x110) < *(ulong *)(lVar13 + 0x40)) {
          uVar10 = *(ulong *)(lVar9 + *(ulong *)(lVar6 + 0x110) * 8);
          lVar13 = *(long *)(lVar13 + 0x18);
          if (uVar10 == 0) goto LAB_1400789e9;
          local_138 = *(long *)(lVar13 + 0x10 + ~uVar10 * 0x30);
        }
        else {
          lVar13 = *(long *)(lVar13 + 0x18);
LAB_1400789e9:
          local_138 = 0;
        }
        lVar11 = ~*(ulong *)(lVar9 + *(long *)(lVar6 + 0x118) * 8) * 0x30;
        local_120 = *(long *)(lVar13 + 0x10 + lVar11);
        local_110 = *(long *)(lVar13 + 0x28 + lVar11);
        lVar9 = ~*(ulong *)(lVar9 + *(long *)(lVar6 + 0x120) * 8) * 0x30;
        local_128 = *(long *)(lVar13 + 0x10 + lVar9);
        local_118 = *(long *)(lVar13 + 0x28 + lVar9);
        uVar12 = 0;
        uVar7 = uVar12;
      }
    }
    uVar10 = (ulong)uVar7;
    pfVar14 = (float *)(uVar10 * 0x10 + local_138);
    lVar13 = uVar10 * 0x180 + local_120;
    puVar2 = (undefined4 *)(local_128 + uVar10 * 0x14);
    fVar19 = pfVar14[1] * fVar20 + pfVar14[3];
    fVar18 = (float)func_0x000145bfa111(fVar19);
    fVar19 = fVar19 - fVar18;
    fVar18 = pfVar14[2];
    fVar3 = *pfVar14;
    *(undefined4 *)(lVar13 + 0x68) = 2;
    *(float *)(lVar13 + 0x6c) = fVar18 * fVar19 + fVar3;
    *(undefined4 *)(local_110 + uVar10 * 4) = uVar5;
    *(undefined4 *)(lVar13 + 0x78) = 2;
    *(float *)(lVar13 + 0x7c) = fVar19 * fVar21 + fVar22;
    fVar18 = (fVar19 + fVar24) / fVar25 + fVar26;
    if (fVar19 < fVar23) {
      fVar18 = fVar19 / fVar23;
    }
    uVar12 = uVar12 + 1;
    *(undefined4 *)(local_118 + uVar10 * 4) = uVar5;
    *puVar2 = 0;
    *(ulong *)(puVar2 + 1) = CONCAT44(uVar29,uVar28);
    puVar2[3] = 0x3e8f5c29;
    puVar2[4] = fVar18 * fVar27;
  } while( true );
}
