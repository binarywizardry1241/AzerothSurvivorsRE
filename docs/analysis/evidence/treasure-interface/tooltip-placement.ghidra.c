
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  ulong *puVar2;
  float fVar3;
  double dVar4;
  double dVar5;
  char cVar6;
  uint uVar7;
  ulong uVar8;
  long lVar9;
  undefined1 auVar10 [16];
  long lVar11;
  long lVar12;
  ulong uVar13;
  int iVar14;
  uint *puVar15;
  long lVar16;
  ulong uVar17;
  ulong uVar18;
  float *pfVar19;
  uint uVar20;
  long lVar21;
  long lVar22;
  ulong uVar23;
  int *piVar24;
  long lVar25;
  long lVar26;
  long lVar27;
  ulong unaff_R13;
  long lVar28;
  bool bVar29;
  bool bVar30;
  uint uVar31;
  float fVar32;
  float fVar33;
  float fVar34;
  undefined1 in_XMM3 [16];
  undefined1 auVar38 [12];
  undefined1 auVar35 [16];
  undefined1 auVar37 [16];
  float fVar39;
  undefined8 in_XMM4_Qa;
  undefined4 uVar40;
  long *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long *in_stack_00000040;
  undefined4 uStack_1a4;
  int local_c8;
  ulong local_b8;
  ulong local_a8;
  ulong local_a0;
  long local_80;
  undefined1 auVar36 [16];

  uVar40 = (undefined4)((ulong)in_XMM4_Qa >> 0x20);
  local_b8 = *(ulong *)(param_3 + 0x10);
  lVar28 = *param_5;
  lVar21 = param_5[1];
  lVar27 = *param_6;
  lVar11 = param_6[1];
  lVar26 = *in_stack_00000028;
  lVar12 = in_stack_00000028[1];
  lVar9 = *in_stack_00000040;
  local_a0 = 0;
  if ((*(char *)(*in_stack_00000030 + 0xd) == '\x01') &&
     (*(char *)(*in_stack_00000038 + 0x72) == '\0')) {
    puVar15 = *(uint **)(lVar28 + 0xf8);
    puVar1 = puVar15 + *(long *)(lVar28 + 0x100);
    if (*(char *)(lVar28 + 0x108) == '\0') {
      lVar22 = 8;
      lVar25 = 0;
      lVar16 = 0;
      uVar31 = 0;
      do {
        while( true ) {
          uVar20 = uVar31;
          if (uVar31 == (uint)lVar16) {
            do {
              if (puVar15 == puVar1) goto LAB_1400c6bc9;
              uVar31 = *puVar15;
              puVar15 = puVar15 + 1;
              lVar16 = *(long *)(*(long *)(lVar21 + 0x108) + 0x58 + (ulong)uVar31 * 0xa0);
            } while (lVar16 == 0);
            lVar22 = *(long *)(lVar21 + 0x108) + (ulong)uVar31 * 0xa0;
            uVar23 = (ulong)*(uint *)(lVar22 + 0x94);
            lVar25 = *(long *)(lVar21 + 0x1a8) + uVar23 * 0x48;
            if ((*(ulong *)(lVar28 + 0x110) <
                 *(ulong *)(*(long *)(lVar21 + 0x1a8) + 0x40 + uVar23 * 0x48)) &&
               (uVar23 = *(ulong *)(*(long *)(lVar25 + 0x38) + *(ulong *)(lVar28 + 0x110) * 8),
               uVar23 != 0)) {
              lVar25 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar23 * 0x30);
            }
            else {
              lVar25 = 0;
            }
            lVar22 = *(long *)(lVar22 + 0x50);
            uVar20 = 0;
          }
          uVar23 = *(ulong *)(lVar22 + (ulong)uVar20 * 0x10);
          if ((int)uVar23 != 0) break;
          uVar31 = uVar20 + 1;
        }
        unaff_R13 = uVar23 >> 0x20;
        uVar31 = uVar20 + 1;
      } while (((int)uVar23 == 0) ||
              (uVar31 = uVar20 + 1,
              *(char *)(lVar25 + (ulong)~*(uint *)((ulong)uVar20 * 0x10 + lVar22 + 8)) == '\x02'));
    }
    else {
      lVar16 = 0;
      lVar22 = 8;
      lVar25 = 0;
      uVar31 = 0;
      do {
        while( true ) {
          uVar20 = uVar31;
          if (uVar31 == (uint)lVar16) {
            do {
              if (puVar15 == puVar1) goto LAB_1400c6bc9;
              uVar31 = *puVar15;
              puVar15 = puVar15 + 1;
              lVar16 = *(long *)(*(long *)(lVar21 + 0x1a8) + 0x10 + (ulong)uVar31 * 0x48);
            } while (lVar16 == 0);
            lVar22 = *(long *)(lVar21 + 0x1a8) + (ulong)uVar31 * 0x48;
            if ((*(ulong *)(lVar28 + 0x110) < *(ulong *)(lVar22 + 0x40)) &&
               (uVar23 = *(ulong *)(*(long *)(lVar22 + 0x38) + *(ulong *)(lVar28 + 0x110) * 8),
               uVar23 != 0)) {
              lVar25 = *(long *)(*(long *)(lVar22 + 0x18) + 0x10 + ~uVar23 * 0x30);
            }
            else {
              lVar25 = 0;
            }
            lVar22 = *(long *)(lVar22 + 8);
            uVar20 = 0;
          }
          uVar23 = *(ulong *)(lVar22 + (ulong)uVar20 * 8);
          if ((int)uVar23 != 0) break;
          uVar31 = uVar20 + 1;
        }
        unaff_R13 = uVar23 >> 0x20;
        uVar31 = uVar20 + 1;
      } while (((int)uVar23 == 0) ||
              (uVar31 = uVar20 + 1, *(char *)(lVar25 + (ulong)uVar20) == '\x02'));
    }
  }
  else {
    uVar23 = 0;
  }
LAB_1400c6bcc:
  uStack_1a4 = (undefined4)((ulong)param_6[2] >> 0x20);
  puVar15 = *(uint **)(lVar27 + 0xf8);
  puVar1 = puVar15 + *(long *)(lVar27 + 0x100);
  cVar6 = *(char *)(lVar27 + 0x108);
  lVar28 = 8;
  local_80 = 0;
  lVar21 = 8;
  uVar17 = 0;
  local_a8 = 0;
  local_c8 = (int)uVar23;
  if (cVar6 != '\0') goto LAB_1400c6df4;
  do {
    auVar38 = in_XMM3._4_12_;
    uVar13 = local_a0;
    do {
      if ((int)uVar17 == (int)uVar13) {
        if (puVar15 == puVar1) goto LAB_1400c6f27;
        while( true ) {
          uVar13 = *(ulong *)(*(long *)(lVar11 + 0x108) + 0x58 + (ulong)*puVar15 * 0xa0);
          if (uVar13 != 0) break;
          puVar15 = puVar15 + 1;
          if (puVar15 == puVar1) goto LAB_1400c6f27;
        }
        lVar28 = *(long *)(lVar11 + 0x108) + (ulong)*puVar15 * 0xa0;
        uVar17 = (ulong)*(uint *)(lVar28 + 0x94);
        if (*(ulong *)(lVar27 + 0x110) <
            *(ulong *)(*(long *)(lVar11 + 0x1a8) + 0x40 + uVar17 * 0x48)) {
          lVar16 = *(long *)(lVar11 + 0x1a8) + uVar17 * 0x48;
          uVar17 = *(ulong *)(*(long *)(lVar16 + 0x38) + *(ulong *)(lVar27 + 0x110) * 8);
          if (uVar17 == 0) goto LAB_1400c6ca9;
          local_80 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar17 * 0x30);
        }
        else {
LAB_1400c6ca9:
          local_80 = 0;
        }
        puVar15 = puVar15 + 1;
        lVar28 = *(long *)(lVar28 + 0x50);
        uVar17 = 0;
        local_a0 = uVar13 & 0xffffffff;
      }
      lVar16 = (uVar17 & 0xffffffff) * 0x10;
      uVar17 = (ulong)((int)uVar17 + 1);
      uVar8 = *(ulong *)(lVar28 + lVar16);
      iVar14 = (int)uVar8;
    } while (iVar14 == 0);
    puVar2 = (ulong *)(local_80 + (ulong)~*(uint *)(lVar16 + lVar28 + 8) * 8);
    while( true ) {
      if (iVar14 == 0) goto LAB_1400c6f27;
      if ((local_c8 == 0) || ((unaff_R13 << 0x20 | uVar23 & 0xffffffff) != *puVar2)) {
        func_0x000144e74f30();
      }
      else {
        local_b8 = uVar8 >> 0x20;
        local_a8 = uVar8 & 0xffffffff;
      }
      if (cVar6 == '\0') break;
LAB_1400c6df4:
      auVar38 = in_XMM3._4_12_;
      uVar13 = local_a0;
      do {
        if ((int)uVar17 == (int)uVar13) {
          if (puVar15 == puVar1) goto LAB_1400c6f27;
          while( true ) {
            uVar13 = *(ulong *)(*(long *)(lVar11 + 0x1a8) + 0x10 + (ulong)*puVar15 * 0x48);
            if (uVar13 != 0) break;
            puVar15 = puVar15 + 1;
            if (puVar15 == puVar1) goto LAB_1400c6f27;
          }
          lVar21 = *(long *)(lVar11 + 0x1a8) + (ulong)*puVar15 * 0x48;
          if ((*(ulong *)(lVar27 + 0x110) < *(ulong *)(lVar21 + 0x40)) &&
             (uVar17 = *(ulong *)(*(long *)(lVar21 + 0x38) + *(ulong *)(lVar27 + 0x110) * 8),
             uVar17 != 0)) {
            local_80 = *(long *)(*(long *)(lVar21 + 0x18) + 0x10 + ~uVar17 * 0x30);
          }
          else {
            local_80 = 0;
          }
          puVar15 = puVar15 + 1;
          lVar21 = *(long *)(lVar21 + 8);
          uVar17 = 0;
          local_a0 = uVar13 & 0xffffffff;
        }
        uVar18 = uVar17 & 0xffffffff;
        uVar17 = (ulong)((int)uVar17 + 1);
        uVar8 = *(ulong *)(lVar21 + uVar18 * 8);
        iVar14 = (int)uVar8;
      } while (iVar14 == 0);
      puVar2 = (ulong *)(local_80 + uVar18 * 8);
    }
  } while( true );
LAB_1400c6bc9:
  uVar23 = 0;
  goto LAB_1400c6bcc;
LAB_1400c7072:
  lVar21 = 0;
  iVar14 = 0;
  piVar24 = (int *)0x0;
  puVar15 = puVar1;
  goto joined_r0x0001400c70c4;
LAB_1400c6f27:
  if (local_c8 == 0) {
    return;
  }
  puVar15 = *(uint **)(lVar26 + 0xf8);
  puVar1 = puVar15 + *(long *)(lVar26 + 0x100);
  lVar28 = *(long *)(lVar26 + 0x100) << 2;
  if (*(char *)(lVar26 + 0x108) == '\0') {
    do {
      if (lVar28 == 0) goto LAB_1400c7072;
      uVar31 = *puVar15;
      puVar15 = puVar15 + 1;
      lVar21 = *(long *)(*(long *)(lVar12 + 0x108) + 0x58 + (ulong)uVar31 * 0xa0);
      lVar28 = lVar28 + -4;
    } while (lVar21 == 0);
    lVar28 = *(long *)(lVar12 + 0x108) + (ulong)uVar31 * 0xa0;
    uVar23 = (ulong)*(uint *)(lVar28 + 0x94);
    if (*(ulong *)(lVar26 + 0x110) < *(ulong *)(*(long *)(lVar12 + 0x1a8) + 0x40 + uVar23 * 0x48)) {
      lVar16 = *(long *)(lVar12 + 0x1a8) + uVar23 * 0x48;
      uVar23 = *(ulong *)(*(long *)(lVar16 + 0x38) + *(ulong *)(lVar26 + 0x110) * 8);
      if (uVar23 == 0) goto LAB_1400c70c8;
      lVar26 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar23 * 0x30);
    }
    else {
LAB_1400c70c8:
      lVar26 = 0;
    }
    piVar24 = (int *)((ulong)~*(uint *)(*(long *)(lVar28 + 0x50) + 8) * 0xf8 + lVar26);
    iVar14 = 1;
    goto LAB_1400c70eb;
  }
  do {
    if (lVar28 == 0) goto LAB_1400c7072;
    uVar31 = *puVar15;
    puVar15 = puVar15 + 1;
    lVar21 = *(long *)(*(long *)(lVar12 + 0x1a8) + 0x10 + (ulong)uVar31 * 0x48);
    lVar28 = lVar28 + -4;
  } while (lVar21 == 0);
  lVar28 = *(long *)(lVar12 + 0x1a8) + (ulong)uVar31 * 0x48;
  if ((*(ulong *)(lVar26 + 0x110) < *(ulong *)(lVar28 + 0x40)) &&
     (uVar23 = *(ulong *)(*(long *)(lVar28 + 0x38) + *(ulong *)(lVar26 + 0x110) * 8), uVar23 != 0))
  {
    piVar24 = *(int **)(*(long *)(lVar28 + 0x18) + 0x10 + ~uVar23 * 0x30);
    iVar14 = 1;
  }
  else {
    piVar24 = (int *)0x0;
    iVar14 = 1;
  }
joined_r0x0001400c70c4:
  if (*(char *)(lVar26 + 0x108) == '\0') {
LAB_1400c70eb:
    if (iVar14 == (int)lVar21) {
      do {
        if (puVar15 == puVar1) goto LAB_1400c7128;
        uVar31 = *puVar15;
        puVar15 = puVar15 + 1;
      } while (*(long *)(*(long *)(lVar12 + 0x108) + 0x58 + (ulong)uVar31 * 0xa0) == 0);
    }
    return;
  }
  if (iVar14 != (int)lVar21) {
    return;
  }
  while (puVar15 != puVar1) {
    uVar31 = *puVar15;
    puVar15 = puVar15 + 1;
    if (*(long *)(*(long *)(lVar12 + 0x1a8) + 0x10 + (ulong)uVar31 * 0x48) != 0) {
      return;
    }
  }
LAB_1400c7128:
  if (piVar24 == (int *)0x0) {
    return;
  }
  if (*piVar24 != 1) {
    return;
  }
  dVar4 = *(double *)(piVar24 + 2);
  if (dVar4 < 0.0) {
    return;
  }
  dVar5 = *(double *)(piVar24 + 4);
  if (dVar5 < 0.0) {
    return;
  }
  if ((double)(uint)piVar24[0x30] <= dVar4) {
    return;
  }
  if ((double)(uint)piVar24[0x31] <= dVar5) {
    return;
  }
  auVar37._0_4_ = (float)dVar5;
  auVar37._4_12_ = auVar38;
  pfVar19 = (float *)(piVar24 + 0x32);
  if ((char)piVar24[0x2e] != '\0') {
    pfVar19 = (float *)(piVar24 + 0x2f);
  }
  fVar3 = *pfVar19;
  auVar36._0_8_ = auVar37._0_8_;
  auVar36._8_4_ = auVar38._0_4_;
  auVar36._12_4_ = uVar40;
  auVar35._8_8_ = auVar36._8_8_;
  auVar35._4_4_ = (float)(uint)piVar24[0x31];
  auVar35._0_4_ = auVar37._0_4_;
  auVar10._4_4_ = fVar3;
  auVar10._0_4_ = fVar3;
  auVar10._8_8_ = 0;
  auVar37 = divps(auVar35,auVar10);
  fVar33 = _DAT_145918a80 + (float)dVar4 / fVar3;
  fVar32 = (float)dVar4 / fVar3 + _DAT_145918a88 + _DAT_145918a8c;
  if (fVar32 <= 0.0) {
    fVar32 = 0.0;
  }
  uVar31 = -(uint)((float)(uint)piVar24[0x30] / fVar3 < _DAT_145918a84 + fVar33);
  fVar3 = (float)(~uVar31 & (uint)fVar33 | (uint)fVar32 & uVar31);
  fVar32 = auVar37._4_4_;
  fVar39 = _DAT_145907534 * fVar32;
  fVar34 = auVar37._0_4_;
  bVar29 = fVar39 < fVar34;
  if (bVar29) {
    fVar32 = (fVar32 - fVar34) + _DAT_1459158d4;
  }
  else {
    fVar33 = _DAT_1459158d8 + fVar34;
  }
  uVar31 = (uint)bVar29;
  uVar20 = (uint)!bVar29;
  if ((uint)local_a8 != 0) {
    piVar24 = (int *)&DAT_14593cb28;
    if ((ulong)~(uint)local_a8 < *(ulong *)(lVar11 + 0x10)) {
      piVar24 = (int *)((ulong)~(uint)local_a8 * 0x18 + *(long *)(lVar11 + 8));
    }
    if ((piVar24[4] == (int)local_b8) && (*piVar24 != 0)) {
      uVar23 = *(ulong *)(piVar24 + 1);
      if ((uVar23 >> 0x20 < *(ulong *)(lVar27 + 0x38)) &&
         ((*(ulong *)(*(long *)(lVar27 + 0x28) + (uVar23 >> 0x26) * 8) >> (uVar23 >> 0x20 & 0x3f) &
          1) != 0)) {
        lVar9 = *(long *)(*(long *)(lVar11 + 0x1a8) + 0x18 + (ulong)(uint)piVar24[3] * 0x48);
        lVar21 = ~*(ulong *)(*(long *)(*(long *)(lVar11 + 0x1a8) + 0x38 +
                                      (ulong)(uint)piVar24[3] * 0x48) +
                            *(long *)(lVar27 + 0x118) * 8) * 0x30;
        lVar28 = *(long *)(lVar9 + 0x10 + lVar21);
        lVar21 = *(long *)(lVar9 + 0x28 + lVar21);
        lVar27 = (ulong)~(uint)uVar23 * 0x180;
        lVar9 = lVar28 + lVar27;
        iVar14 = *(int *)(lVar28 + 0x68 + lVar27);
        if (iVar14 != 0) {
          if (iVar14 == 1) {
            bVar29 = NAN(*(float *)(lVar9 + 0x6c)) || NAN(fVar3);
            bVar30 = *(float *)(lVar9 + 0x6c) == fVar3;
          }
          else {
            if ((fVar3 != 0.0) || (NAN(fVar3))) goto LAB_1400c7772;
            bVar29 = NAN(*(float *)(lVar9 + 0x6c));
            bVar30 = *(float *)(lVar9 + 0x6c) == 0.0;
          }
          if ((bVar30) && (!bVar29)) {
            uVar7 = *(uint *)(lVar9 + 0x78);
            if (fVar39 < fVar34) {
              if (uVar7 == 0 && uVar20 == 0) {
                fVar34 = *(float *)(lVar9 + 0x84);
                if (uVar31 == *(uint *)(lVar9 + 0x80)) {
                  bVar29 = NAN(fVar34) || NAN(fVar32);
                  bVar30 = fVar34 == fVar32;
                }
                else {
                  if (((fVar32 != 0.0) || (NAN(fVar32))) || (*(uint *)(lVar9 + 0x80) == 0))
                  goto LAB_1400c7772;
                  bVar29 = NAN(fVar34);
                  bVar30 = fVar34 == 0.0;
                }
                if ((bVar30) && (!bVar29)) {
                  return;
                }
              }
            }
            else {
              if (uVar20 == uVar7) {
                if (uVar7 == 0) goto LAB_1400c7772;
                bVar29 = NAN(*(float *)(lVar9 + 0x7c)) || NAN(fVar33);
                bVar30 = *(float *)(lVar9 + 0x7c) == fVar33;
              }
              else {
                if (((uVar7 == 0) || (fVar33 != 0.0)) || (NAN(fVar33))) goto LAB_1400c7772;
                bVar29 = NAN(*(float *)(lVar9 + 0x7c));
                bVar30 = *(float *)(lVar9 + 0x7c) == 0.0;
              }
              if (((bVar30) && (!bVar29)) && (uVar31 == *(uint *)(lVar9 + 0x80))) {
                return;
              }
            }
          }
        }
LAB_1400c7772:
        *(undefined4 *)(lVar9 + 0x68) = 1;
        *(float *)(lVar9 + 0x6c) = fVar3;
        *(uint *)(lVar9 + 0x78) = uVar20;
        *(float *)(lVar9 + 0x7c) = fVar33;
        *(undefined4 *)(lVar21 + (ulong)~(uint)uVar23 * 4) = uStack_1a4;
        *(uint *)(lVar9 + 0x80) = uVar31;
        *(float *)(lVar9 + 0x84) = fVar32;
        return;
      }
    }
  }
  if (lVar9 == 0) {
    return;
  }
  func_0x000144c8c290();
  func_0x00014265f6a0();
  func_0x0001457731ed();
  func_0x0001400ef480();
  func_0x00014014a730();
  return;
}
