/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  double dVar2;
  double dVar3;
  int iVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  int *piVar9;
  long lVar10;
  uint *puVar11;
  ulong uVar12;
  long lVar13;
  float *pfVar14;
  uint uVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  ulong uVar20;
  ulong unaff_R12;
  ulong uVar21;
  uint uVar22;
  bool bVar23;
  bool bVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  long *in_stack_00000030;
  long *in_stack_00000040;
  char local_3d8;
  int *piStack_3d0;
  undefined4 uStack_1e4;
  int local_b8;
  ulong local_a0;
  ulong local_98;
  long local_80;
  long local_78;

  local_98 = *(ulong *)(param_3 + 8);
  lVar13 = *param_5;
  lVar6 = param_5[1];
  lVar10 = *param_6;
  lVar18 = param_6[1];
  lVar7 = *in_stack_00000040;
  if (*(char *)(*in_stack_00000030 + 0x72) == '\x01') {
    puVar11 = *(uint **)(lVar13 + 0xf8);
    puVar1 = puVar11 + *(long *)(lVar13 + 0x100);
    if (*(char *)(lVar13 + 0x108) == '\0') {
      lVar16 = 8;
      lVar19 = 0;
      lVar17 = 0;
      uVar15 = 0;
      do {
        while( true ) {
          uVar22 = uVar15;
          if (uVar15 == (uint)lVar17) {
            do {
              if (puVar11 == puVar1) goto LAB_1401634a1;
              uVar15 = *puVar11;
              puVar11 = puVar11 + 1;
              lVar17 = *(long *)(*(long *)(lVar6 + 0x108) + 0x58 + (ulong)uVar15 * 0xa0);
            } while (lVar17 == 0);
            lVar16 = *(long *)(lVar6 + 0x108) + (ulong)uVar15 * 0xa0;
            uVar20 = (ulong)*(uint *)(lVar16 + 0x94);
            lVar19 = *(long *)(lVar6 + 0x1a8) + uVar20 * 0x48;
            if ((*(ulong *)(lVar13 + 0x110) <
                 *(ulong *)(*(long *)(lVar6 + 0x1a8) + 0x40 + uVar20 * 0x48)) &&
               (uVar20 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(lVar13 + 0x110) * 8),
               uVar20 != 0)) {
              lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar20 * 0x30);
            }
            else {
              lVar19 = 0;
            }
            lVar16 = *(long *)(lVar16 + 0x50);
            uVar22 = 0;
          }
          uVar20 = *(ulong *)(lVar16 + (ulong)uVar22 * 0x10);
          if ((int)uVar20 != 0) break;
          uVar15 = uVar22 + 1;
        }
        unaff_R12 = uVar20 >> 0x20;
        uVar15 = uVar22 + 1;
      } while (((int)uVar20 == 0) ||
              (uVar15 = uVar22 + 1,
              *(char *)(lVar19 + (ulong)~*(uint *)((ulong)uVar22 * 0x10 + lVar16 + 8)) == '\x02'));
    }
    else {
      lVar17 = 0;
      lVar16 = 8;
      lVar19 = 0;
      uVar15 = 0;
      do {
        while( true ) {
          uVar22 = uVar15;
          if (uVar15 == (uint)lVar17) {
            do {
              if (puVar11 == puVar1) goto LAB_1401634a1;
              uVar15 = *puVar11;
              puVar11 = puVar11 + 1;
              lVar17 = *(long *)(*(long *)(lVar6 + 0x1a8) + 0x10 + (ulong)uVar15 * 0x48);
            } while (lVar17 == 0);
            lVar16 = *(long *)(lVar6 + 0x1a8) + (ulong)uVar15 * 0x48;
            if ((*(ulong *)(lVar13 + 0x110) < *(ulong *)(lVar16 + 0x40)) &&
               (uVar20 = *(ulong *)(*(long *)(lVar16 + 0x38) + *(ulong *)(lVar13 + 0x110) * 8),
               uVar20 != 0)) {
              lVar19 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar20 * 0x30);
            }
            else {
              lVar19 = 0;
            }
            lVar16 = *(long *)(lVar16 + 8);
            uVar22 = 0;
          }
          uVar20 = *(ulong *)(lVar16 + (ulong)uVar22 * 8);
          if ((int)uVar20 != 0) break;
          uVar15 = uVar22 + 1;
        }
        unaff_R12 = uVar20 >> 0x20;
        uVar15 = uVar22 + 1;
      } while (((int)uVar20 == 0) ||
              (uVar15 = uVar22 + 1, *(char *)(lVar19 + (ulong)uVar22) == '\x02'));
    }
  }
  else {
LAB_1401634a1:
    uVar20 = 0;
  }
  uStack_1e4 = (undefined4)((ulong)param_6[2] >> 0x20);
  puVar11 = *(uint **)(lVar10 + 0xf8);
  puVar1 = puVar11 + *(long *)(lVar10 + 0x100);
  uVar21 = unaff_R12 << 0x20 | uVar20 & 0xffffffff;
  local_b8 = (int)uVar20;
  if (*(char *)(lVar10 + 0x108) == '\0') {
    local_a0 = 0;
LAB_1401638a0:
    if (puVar11 != puVar1) {
      while( true ) {
        uVar20 = *(ulong *)(*(long *)(lVar18 + 0x108) + 0x58 + (ulong)*puVar11 * 0xa0);
        if (uVar20 != 0) break;
        puVar11 = puVar11 + 1;
        if (puVar11 == puVar1) goto LAB_14016394e;
      }
      lVar13 = *(long *)(lVar18 + 0x108) + (ulong)*puVar11 * 0xa0;
      uVar8 = (ulong)*(uint *)(lVar13 + 0x94);
      if (*(ulong *)(lVar10 + 0x110) < *(ulong *)(*(long *)(lVar18 + 0x1a8) + 0x40 + uVar8 * 0x48))
      {
        lVar6 = *(long *)(lVar18 + 0x1a8) + uVar8 * 0x48;
        uVar8 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(lVar10 + 0x110) * 8);
        if (uVar8 == 0) goto LAB_140163775;
        local_78 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar8 * 0x30);
      }
      else {
LAB_140163775:
        local_78 = 0;
      }
      puVar11 = puVar11 + 1;
      lVar13 = *(long *)(lVar13 + 0x50);
      uVar15 = 0;
      uVar8 = uVar20;
      do {
        while( true ) {
          uVar12 = (ulong)uVar15;
          uVar15 = uVar15 + 1;
          uVar5 = *(ulong *)(lVar13 + uVar12 * 0x10);
          if ((int)uVar5 != 0) break;
          uVar22 = (uint)uVar8;
joined_r0x000140163943:
          if (uVar15 == uVar22) goto LAB_1401638a0;
        }
        if ((int)uVar5 == 0) goto LAB_14016394e;
        uVar22 = (uint)uVar20;
        uVar8 = uVar20 & 0xffffffff;
        if ((local_b8 != 0) &&
           (uVar21 == *(ulong *)(local_78 + (ulong)~*(uint *)(uVar12 * 0x10 + lVar13 + 8) * 8))) {
          local_98 = uVar5 >> 0x20;
          local_a0 = uVar5 & 0xffffffff;
          goto joined_r0x000140163943;
        }
        func_0x000144e7f8d0();
      } while (uVar15 != uVar22);
      goto LAB_1401638a0;
    }
  }
  else {
    local_a0 = 0;
LAB_140163696:
    if (puVar11 != puVar1) {
      while( true ) {
        lVar13 = *(long *)(*(long *)(lVar18 + 0x1a8) + 0x10 + (ulong)*puVar11 * 0x48);
        if (lVar13 != 0) break;
        puVar11 = puVar11 + 1;
        if (puVar11 == puVar1) goto LAB_14016394e;
      }
      lVar6 = *(long *)(lVar18 + 0x1a8) + (ulong)*puVar11 * 0x48;
      if ((*(ulong *)(lVar10 + 0x110) < *(ulong *)(lVar6 + 0x40)) &&
         (uVar20 = *(ulong *)(*(long *)(lVar6 + 0x38) + *(ulong *)(lVar10 + 0x110) * 8), uVar20 != 0
         )) {
        local_80 = *(long *)(*(long *)(lVar6 + 0x18) + 0x10 + ~uVar20 * 0x30);
      }
      else {
        local_80 = 0;
      }
      puVar11 = puVar11 + 1;
      lVar6 = *(long *)(lVar6 + 8);
      uVar22 = 0;
      uVar15 = (uint)lVar13;
      do {
        while( true ) {
          uVar8 = (ulong)uVar22;
          uVar22 = uVar22 + 1;
          uVar20 = *(ulong *)(lVar6 + uVar8 * 8);
          if ((int)uVar20 != 0) break;
          if (uVar22 == uVar15) goto LAB_140163696;
        }
        if ((int)uVar20 == 0) goto LAB_14016394e;
        if ((local_b8 == 0) || (uVar21 != *(ulong *)(local_80 + uVar8 * 8))) {
          func_0x000144e7f8d0(lVar13);
        }
        else {
          local_98 = uVar20 >> 0x20;
          local_a0 = uVar20 & 0xffffffff;
        }
      } while (uVar22 != uVar15);
      goto LAB_140163696;
    }
  }
LAB_14016394e:
  if (local_b8 == 0) {
    return;
  }
  func_0x0001400bfb90();
  if (local_3d8 == '\x01') {
    return;
  }
  if (*piStack_3d0 != 1) {
    return;
  }
  dVar2 = *(double *)(piStack_3d0 + 2);
  if (dVar2 < 0.0) {
    return;
  }
  dVar3 = *(double *)(piStack_3d0 + 4);
  if (dVar3 < 0.0) {
    return;
  }
  if ((double)(uint)piStack_3d0[0x30] <= dVar2) {
    return;
  }
  if ((double)(uint)piStack_3d0[0x31] <= dVar3) {
    return;
  }
  pfVar14 = (float *)(piStack_3d0 + 0x32);
  if ((char)piStack_3d0[0x2e] != '\0') {
    pfVar14 = (float *)(piStack_3d0 + 0x2f);
  }
  fVar27 = *pfVar14;
  fVar26 = _DAT_145d9d4c0 + (float)dVar2 / fVar27;
  fVar25 = (float)dVar2 / fVar27 + _DAT_145dccf50 + _DAT_145de24ac;
  if (fVar25 <= 0.0) {
    fVar25 = 0.0;
  }
  uVar15 = -(uint)((float)(uint)piStack_3d0[0x30] / fVar27 < _DAT_145de24a8 + fVar26);
  fVar25 = (float)(~uVar15 & (uint)fVar26 | (uint)fVar25 & uVar15);
  fVar27 = (float)dVar3 / fVar27 + _DAT_145d9d220;
  if ((uint)local_a0 != 0) {
    piVar9 = (int *)&DAT_145de2f48;
    if ((ulong)~(uint)local_a0 < *(ulong *)(lVar18 + 0x10)) {
      piVar9 = (int *)((ulong)~(uint)local_a0 * 0x18 + *(long *)(lVar18 + 8));
    }
    if ((piVar9[4] == (int)local_98) && (*piVar9 != 0)) {
      uVar20 = *(ulong *)(piVar9 + 1);
      if ((uVar20 >> 0x20 < *(ulong *)(lVar10 + 0x38)) &&
         ((*(ulong *)(*(long *)(lVar10 + 0x28) + (uVar20 >> 0x26) * 8) >> (uVar20 >> 0x20 & 0x3f) &
          1) != 0)) {
        lVar13 = *(long *)(*(long *)(lVar18 + 0x1a8) + 0x18 + (ulong)(uint)piVar9[3] * 0x48);
        lVar10 = ~*(ulong *)(*(long *)(*(long *)(lVar18 + 0x1a8) + 0x38 +
                                      (ulong)(uint)piVar9[3] * 0x48) + *(long *)(lVar10 + 0x118) * 8
                            ) * 0x30;
        lVar6 = *(long *)(lVar13 + 0x10 + lVar10);
        lVar10 = *(long *)(lVar13 + 0x28 + lVar10);
        lVar18 = (ulong)~(uint)uVar20 * 0x180;
        lVar13 = lVar6 + lVar18;
        iVar4 = *(int *)(lVar6 + 0x68 + lVar18);
        if (iVar4 != 0) {
          if (iVar4 == 1) {
            bVar23 = NAN(*(float *)(lVar13 + 0x6c)) || NAN(fVar25);
            bVar24 = *(float *)(lVar13 + 0x6c) == fVar25;
          }
          else {
            if ((*(float *)(lVar13 + 0x6c) != 0.0) || (NAN(*(float *)(lVar13 + 0x6c))))
            goto LAB_140163f84;
            bVar23 = NAN(fVar25);
            bVar24 = fVar25 == 0.0;
          }
          if (((bVar24) && (!bVar23)) && (*(int *)(lVar13 + 0x78) != 0)) {
            if (*(int *)(lVar13 + 0x78) == 1) {
              bVar23 = NAN(*(float *)(lVar13 + 0x7c)) || NAN(fVar27);
              bVar24 = *(float *)(lVar13 + 0x7c) == fVar27;
            }
            else {
              if ((*(float *)(lVar13 + 0x7c) != 0.0) || (NAN(*(float *)(lVar13 + 0x7c))))
              goto LAB_140163f84;
              bVar23 = NAN(fVar27);
              bVar24 = fVar27 == 0.0;
            }
            if ((bVar24) && (!bVar23)) {
              return;
            }
          }
        }
LAB_140163f84:
        *(undefined4 *)(lVar13 + 0x68) = 1;
        *(float *)(lVar13 + 0x6c) = fVar25;
        *(undefined4 *)(lVar10 + (ulong)~(uint)uVar20 * 4) = uStack_1e4;
        *(undefined4 *)(lVar13 + 0x78) = 1;
        *(float *)(lVar13 + 0x7c) = fVar27;
        return;
      }
    }
  }
  if (lVar7 != 0) {
    func_0x00014588d770();
    func_0x0001401017b0();
    func_0x000145bfa0e7();
    func_0x0001401f6440();
    func_0x000140238eb0();
  }
  return;
}
