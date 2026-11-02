
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  char *pcVar1;
  uint *puVar2;
  char cVar3;
  undefined4 uVar4;
  uint uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  bool bVar12;
  code *pcVar13;
  bool bVar14;
  int iVar15;
  long lVar16;
  ulong uVar17;
  long lVar18;
  int *piVar19;
  ulong uVar20;
  long lVar21;
  ulong uVar22;
  long lVar23;
  long lVar24;
  long lVar25;
  long lVar26;
  long *plVar27;
  undefined8 uVar28;
  undefined8 *puVar29;
  uint *puVar30;
  ulong uVar31;
  ulong uVar32;
  ulong uVar33;
  float fVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long local_1c8;
  long local_1c0;
  long *local_1b8;
  long local_188;
  long local_180;
  long local_168;
  long local_160;
  long local_158;
  undefined4 *local_f8;
  long local_f0;
  undefined4 *local_e8;
  undefined8 *local_b0;
  
  if (*param_6 == 0) {
    return;
  }
  lVar6 = *param_5;
  uVar4 = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  lVar7 = *in_stack_00000038;
  lVar8 = in_stack_00000038[1];
  lVar9 = *in_stack_00000030;
  lVar10 = in_stack_00000030[1];
  puVar30 = *(uint **)(lVar9 + 0xf8);
  plVar27 = *(long **)(param_3 + 0x10);
  if (*(long **)(param_3 + 0x10) == (long *)0x0) {
    plVar27 = *(long **)(param_3 + 0x18);
  }
  puVar2 = puVar30 + *(long *)(lVar9 + 0x100);
  fVar36 = 0.0;
  cVar3 = *(char *)(lVar9 + 0x108);
  lVar23 = 8;
  local_188 = 0;
  local_180 = 0;
  bVar14 = false;
  local_1c0 = 0;
  lVar25 = 8;
  lVar21 = 0;
  iVar15 = 0;
  uVar22 = 0;
  fVar37 = _DAT_1462777ec;
  fVar38 = _DAT_146233134;
LAB_1402e569a:
  do {
    if (cVar3 == '\0') {
      do {
        do {
          do {
            if ((int)uVar22 == iVar15) {
              do {
                if (puVar30 == puVar2) {
                  return;
                }
                uVar5 = *puVar30;
                puVar30 = puVar30 + 1;
                lVar18 = *(long *)(*(long *)(lVar10 + 0x108) + 0x58 + (ulong)uVar5 * 0xa0);
              } while (lVar18 == 0);
              lVar24 = *(long *)(lVar10 + 0x108) + (ulong)uVar5 * 0xa0;
              uVar33 = (ulong)*(uint *)(lVar24 + 0x94);
              lVar23 = *(long *)(lVar10 + 0x1a8);
              uVar22 = *(ulong *)(lVar23 + 0x40 + uVar33 * 0x48);
              lVar16 = *(long *)(lVar23 + 0x18 + uVar33 * 0x48);
              lVar23 = *(long *)(lVar23 + 0x38 + uVar33 * 0x48);
              uVar33 = *(ulong *)(lVar9 + 0x118);
              if (uVar33 < *(ulong *)(lVar24 + 0x88)) {
                if (*(long *)(*(long *)(lVar24 + 0x80) + uVar33 * 8) == 0) {
                  uVar33 = *(ulong *)(lVar9 + 0x128);
                  goto joined_r0x0001402e5801;
                }
                bVar14 = true;
                if ((uVar33 < uVar22) && (uVar33 = *(ulong *)(lVar23 + uVar33 * 8), uVar33 != 0)) {
                  local_1c0 = *(long *)(lVar16 + 0x10 + ~uVar33 * 0x30);
                  uVar33 = *(ulong *)(lVar9 + 0x128);
                  goto joined_r0x0001402e5801;
                }
                local_1c0 = 0;
                uVar33 = *(ulong *)(lVar9 + 0x128);
                if (uVar33 < uVar22) goto LAB_1402e5833;
LAB_1402e584e:
                lVar21 = 0;
              }
              else {
                uVar33 = *(ulong *)(lVar9 + 0x128);
joined_r0x0001402e5801:
                bVar14 = false;
joined_r0x0001402e5801:
                if (uVar22 <= uVar33) goto LAB_1402e584e;
LAB_1402e5833:
                uVar22 = *(ulong *)(lVar23 + uVar33 * 8);
                if (uVar22 == 0) goto LAB_1402e584e;
                lVar21 = *(long *)(lVar16 + 0x10 + ~uVar22 * 0x30);
              }
              lVar26 = ~*(ulong *)(lVar23 + *(long *)(lVar9 + 0x110) * 8) * 0x30;
              local_180 = *(long *)(lVar16 + 0x10 + lVar26);
              local_158 = *(long *)(lVar16 + 0x28 + lVar26);
              lVar23 = ~*(ulong *)(lVar23 + *(long *)(lVar9 + 0x120) * 8) * 0x30;
              local_188 = *(long *)(lVar16 + 0x10 + lVar23);
              param_5 = *(long **)(lVar16 + 0x28 + lVar23);
              lVar23 = *(long *)(lVar24 + 0x50);
              uVar22 = 0;
              iVar15 = (int)lVar18;
            }
            lVar18 = (uVar22 & 0xffffffff) * 0x10;
            uVar22 = (ulong)((int)uVar22 + 1);
            uVar28 = *(undefined8 *)(lVar23 + lVar18);
          } while ((int)uVar28 == 0);
          uVar33 = (ulong)~*(uint *)(lVar18 + lVar23 + 8);
          local_1b8 = (long *)(uVar33 * 0x10 + local_180);
          local_e8 = (undefined4 *)(local_158 + uVar33 * 4);
          local_160 = local_1c0 + uVar33 * 0x18;
          if (!bVar14) {
            local_160 = 0;
          }
          local_168 = local_188 + uVar33 * 8;
          local_f8 = (undefined4 *)((long)param_5 + uVar33 * 4);
          local_f0 = uVar33 * 0x68 + lVar21;
          if ((int)uVar28 == 0) {
            return;
          }
        } while (*local_1b8 != *(long *)(lVar6 + 0x198));
        lVar18 = local_1b8[1];
        lVar16 = *(long *)(lVar6 + 400);
      } while (lVar18 == lVar16);
    }
    else {
      do {
        do {
          do {
            if ((int)uVar22 == iVar15) {
              do {
                if (puVar30 == puVar2) {
                  return;
                }
                uVar5 = *puVar30;
                puVar30 = puVar30 + 1;
                lVar18 = *(long *)(*(long *)(lVar10 + 0x1a8) + 0x10 + (ulong)uVar5 * 0x48);
              } while (lVar18 == 0);
              lVar25 = *(long *)(lVar10 + 0x1a8) + (ulong)uVar5 * 0x48;
              uVar22 = *(ulong *)(lVar25 + 0x40);
              lVar16 = *(long *)(lVar25 + 0x18);
              lVar24 = *(long *)(lVar25 + 0x38);
              if ((*(ulong *)(lVar9 + 0x118) < uVar22) &&
                 (uVar33 = *(ulong *)(lVar24 + *(ulong *)(lVar9 + 0x118) * 8), uVar33 != 0)) {
                local_1c0 = *(long *)(lVar16 + 0x10 + ~uVar33 * 0x30);
                bVar14 = true;
                uVar33 = *(ulong *)(lVar9 + 0x128);
                bVar12 = true;
                if (uVar22 <= uVar33) goto LAB_1402e595d;
LAB_1402e5ac3:
                bVar14 = bVar12;
                uVar22 = *(ulong *)(lVar24 + uVar33 * 8);
                if (uVar22 == 0) goto LAB_1402e595d;
                lVar21 = *(long *)(lVar16 + 0x10 + ~uVar22 * 0x30);
              }
              else {
                bVar14 = false;
                uVar33 = *(ulong *)(lVar9 + 0x128);
                bVar12 = bVar14;
                if (uVar33 < uVar22) goto LAB_1402e5ac3;
LAB_1402e595d:
                lVar21 = 0;
              }
              lVar26 = ~*(ulong *)(lVar24 + *(long *)(lVar9 + 0x110) * 8) * 0x30;
              local_180 = *(long *)(lVar16 + 0x10 + lVar26);
              local_158 = *(long *)(lVar16 + 0x28 + lVar26);
              lVar24 = ~*(ulong *)(lVar24 + *(long *)(lVar9 + 0x120) * 8) * 0x30;
              local_188 = *(long *)(lVar16 + 0x10 + lVar24);
              param_5 = *(long **)(lVar16 + 0x28 + lVar24);
              lVar25 = *(long *)(lVar25 + 8);
              uVar22 = 0;
              iVar15 = (int)lVar18;
            }
            uVar33 = uVar22 & 0xffffffff;
            uVar22 = (ulong)((int)uVar22 + 1);
            uVar28 = *(undefined8 *)(lVar25 + uVar33 * 8);
          } while ((int)uVar28 == 0);
          local_1b8 = (long *)(uVar33 * 0x10 + local_180);
          local_e8 = (undefined4 *)(local_158 + uVar33 * 4);
          local_160 = local_1c0 + uVar33 * 0x18;
          if (!bVar14) {
            local_160 = 0;
          }
          local_168 = local_188 + uVar33 * 8;
          local_f8 = (undefined4 *)((long)param_5 + uVar33 * 4);
          local_f0 = uVar33 * 0x68 + lVar21;
          if ((int)uVar28 == 0) {
            return;
          }
        } while (*local_1b8 != *(long *)(lVar6 + 0x198));
        lVar18 = local_1b8[1];
        lVar16 = *(long *)(lVar6 + 400);
      } while (lVar18 == lVar16);
    }
    uVar31 = lVar16 - lVar18;
    uVar33 = *(ulong *)(lVar6 + 0x158);
    uVar32 = uVar31;
    if (uVar33 < uVar31) {
      uVar32 = uVar33;
    }
    *local_e8 = uVar4;
    local_1b8[1] = lVar16;
    if (*(ulong *)(lVar6 + 0x158) < uVar32) {
      func_0x000146208f10();
                    /* WARNING: Does not return */
      pcVar13 = (code *)invalidInstructionException();
      (*pcVar13)();
    }
    bVar12 = true;
    lVar18 = (*(ulong *)(lVar6 + 0x158) - uVar32) * 0x40 + *(long *)(lVar6 + 0x150);
    if (fVar36 < *(float *)(local_f0 + 0x34)) {
      fVar35 = *(float *)(local_f0 + 0x3c) - *(float *)(local_f0 + 0x34);
      if (fVar35 <= fVar36) {
        fVar35 = fVar36;
      }
      if (*(float *)(local_168 + 4) < fVar35 * *(float *)(local_f0 + 100) + fVar37) {
        lVar16 = uVar32 << 6;
        do {
          bVar12 = lVar16 != 0;
          if (lVar16 == 0) break;
          lVar16 = lVar16 + -0x40;
          pcVar1 = (char *)(lVar18 + 0x38);
          lVar18 = lVar18 + 0x40;
        } while (*pcVar1 != '\x01');
      }
    }
    if (uVar32 != 0) {
      lVar16 = uVar32 * -0x40;
      lVar18 = lVar6;
      do {
        func_0x0001402c08e0(lVar18);
        lVar16 = lVar16 + 0x40;
      } while (lVar16 != 0);
    }
    if (local_160 == 0) {
      uVar17 = 0;
    }
    else {
      uVar17 = *(ulong *)(local_160 + 0x10);
    }
    uVar11 = *(ulong *)(lVar6 + 0x158);
    uVar20 = 0;
    if (uVar11 <= uVar32 + uVar17) {
      uVar20 = (uVar32 + uVar17) - uVar11;
    }
    if (uVar17 < uVar20) {
      uVar20 = uVar17;
    }
    if (uVar20 == 0) break;
    if (uVar33 < uVar31) {
      uVar31 = uVar33;
    }
    uVar33 = (uVar31 + uVar17) - uVar11;
    if (uVar31 + uVar17 < uVar11) {
      uVar33 = 0;
    }
    if (uVar17 < uVar33) {
      uVar33 = uVar17;
    }
    lVar18 = -uVar33;
    fVar35 = 0.0;
    local_1c8 = local_160;
    puVar29 = (undefined8 *)0x0;
    do {
      if ((puVar29 == (undefined8 *)0x0) || (puVar29 == local_b0)) {
        if (local_1c8 == 0) break;
        puVar29 = *(undefined8 **)(local_1c8 + 8);
        local_b0 = puVar29 + *(long *)(local_1c8 + 0x10);
        if (*(long *)(local_1c8 + 0x10) == 0) break;
        local_1c8 = 0;
      }
      uVar33 = (ulong)~(uint)*puVar29;
      piVar19 = (int *)(uVar33 * 0x18 + *(long *)(lVar8 + 8));
      if (*(ulong *)(lVar8 + 0x10) <= uVar33) {
        piVar19 = (int *)&DAT_146278588;
      }
      fVar34 = fVar38;
      if ((piVar19[4] == (int)((ulong)*puVar29 >> 0x20)) && (*piVar19 != 0)) {
        uVar33 = *(ulong *)(piVar19 + 1);
        if ((uVar33 >> 0x20 < *(ulong *)(lVar7 + 0x38)) &&
           ((*(ulong *)(*(long *)(lVar7 + 0x28) + (uVar33 >> 0x26) * 8) >> (uVar33 >> 0x20 & 0x3f) &
            1) != 0)) {
          lVar16 = *(long *)(*(long *)(*(long *)(lVar8 + 0x1a8) + 0x18 +
                                      (ulong)(uint)piVar19[3] * 0x48) + 0x10 +
                            ~*(ulong *)(*(long *)(*(long *)(lVar8 + 0x1a8) + 0x38 +
                                                 (ulong)(uint)piVar19[3] * 0x48) +
                                       *(long *)(lVar7 + 0x110) * 8) * 0x30);
          lVar24 = (ulong)~(uint)uVar33 * 0x68;
          fVar34 = *(float *)(lVar16 + 0x34 + lVar24) * *(float *)(lVar16 + 100 + lVar24) + fVar38;
        }
      }
      puVar29 = puVar29 + 1;
      fVar35 = fVar35 + fVar34;
      func_0x0001450b3990();
      lVar18 = lVar18 + 1;
    } while (lVar18 != 0);
    if (bVar12) goto LAB_1402e600b;
    if (fVar36 < fVar35) {
      fVar35 = *(float *)(local_168 + 4) - fVar35;
      if (fVar35 <= fVar36) {
        fVar35 = fVar36;
      }
      *local_f8 = uVar4;
      *(float *)(local_168 + 4) = fVar35;
    }
  } while( true );
  if (bVar12) {
LAB_1402e600b:
    lVar18 = plVar27[2];
    if ((ulong)(*plVar27 - lVar18) < 0x18) {
      func_0x000146061b30();
    }
    lVar16 = plVar27[1];
    *(undefined8 *)(lVar16 + lVar18) = 0x1403c30c0;
    *(undefined8 *)(lVar16 + 8 + lVar18) = uVar28;
    *(undefined1 *)(lVar16 + 0x10 + lVar18) = 0;
    plVar27[2] = lVar18 + 0x18;
  }
  goto LAB_1402e569a;
}

