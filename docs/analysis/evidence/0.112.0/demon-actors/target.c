
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  undefined8 uVar1;
  code *pcVar2;
  bool bVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  ulong uVar7;
  byte *pbVar8;
  long lVar9;
  float fVar10;
  uint uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  long *plVar15;
  long *plVar16;
  long lVar17;
  ulong uVar18;
  ulong uVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  undefined4 in_XMM6_Da;
  float fVar23;
  undefined4 in_XMM7_Da;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  undefined8 local_1a8;
  undefined8 local_1a0;
  float local_198;
  int local_194;
  long local_190;
  long *local_188;
  undefined8 *local_180;
  undefined8 *local_178;
  long local_170;
  ulong local_168;
  long local_160;
  long local_158;
  long local_150;
  undefined8 local_148;
  byte *local_140;
  long local_138;
  long local_130;
  long *local_128;
  long local_120;
  long local_118;
  ulong local_110;
  long local_108;
  long *local_100;
  ulong local_f8;
  ulong local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  uVar19 = *(ulong *)(param_4 + 0xd8);
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  if (uVar19 <= param_3) {
    func_0x000145da9883(param_1,param_3,uVar19,param_3,0x146c0b6e0);
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  fVar23 = *(float *)(param_4 + 0xa4c);
  local_160 = *(long *)(param_4 + 0xd0);
  lVar6 = param_3 * 0x80;
  lVar9 = local_160 + lVar6;
  local_158 = *(long *)(local_160 + 0x18 + lVar6);
  fVar22 = *(float *)(local_160 + 0x5c + lVar6);
  if (fVar22 <= 0.0) {
    uVar5 = *(undefined8 *)(lVar9 + 0x4c);
    fVar26 = (float)uVar5;
    fVar27 = (float)((ulong)uVar5 >> 0x20);
    fVar28 = *(float *)(lVar9 + 0x54);
    fVar20 = fVar28;
  }
  else {
    fVar20 = (fVar23 - *(float *)(lVar9 + 0x58)) / fVar22;
    fVar28 = 0.0;
    if (0.0 <= fVar20) {
      fVar28 = fVar20;
    }
    fVar20 = _DAT_145dad260;
    if (fVar28 <= _DAT_145dad260) {
      fVar20 = fVar28;
    }
    uVar5 = *(undefined8 *)(lVar9 + 0x4c);
    fVar26 = (float)*(undefined8 *)(lVar9 + 0x40);
    fVar27 = (float)((ulong)*(undefined8 *)(lVar9 + 0x40) >> 0x20);
    fVar26 = fVar20 * ((float)uVar5 - fVar26) + fVar26;
    fVar27 = fVar20 * ((float)((ulong)uVar5 >> 0x20) - fVar27) + fVar27;
    fVar28 = (*(float *)(lVar9 + 0x54) - *(float *)(lVar9 + 0x48)) * fVar20 +
             *(float *)(lVar9 + 0x48);
    fVar20 = *(float *)(lVar9 + 0x54);
  }
  fVar24 = (float)*(undefined8 *)(param_4 + 0x4d0);
  fVar25 = (float)((ulong)*(undefined8 *)(param_4 + 0x4d0) >> 0x20);
  fVar10 = *(float *)(param_4 + 0x4d8);
  lVar6 = *(long *)(lVar9 + 0x28);
  if (*(char *)(local_158 + 0x39) != '\x05') {
    if (*(char *)(local_158 + 0x39) == '\a') {
      if (fVar22 <= 0.0) {
        local_198 = *(float *)(lVar9 + 0x54);
        local_1a0 = *(undefined8 *)(lVar9 + 0x4c);
      }
      else {
        fVar22 = (fVar23 - *(float *)(lVar9 + 0x58)) / fVar22;
        fVar21 = 0.0;
        if (0.0 <= fVar22) {
          fVar21 = fVar22;
        }
        fVar22 = _DAT_145dad260;
        if (fVar21 <= _DAT_145dad260) {
          fVar22 = fVar21;
        }
        local_198 = (fVar20 - *(float *)(lVar9 + 0x48)) * fVar22 + *(float *)(lVar9 + 0x48);
        fVar20 = (float)*(undefined8 *)(lVar9 + 0x40);
        fVar21 = (float)((ulong)*(undefined8 *)(lVar9 + 0x40) >> 0x20);
        local_1a0 = CONCAT44(fVar22 * ((float)((ulong)uVar5 >> 0x20) - fVar21) + fVar21,
                             fVar22 * ((float)uVar5 - fVar20) + fVar20);
      }
      lVar9 = *(long *)(lVar9 + 0x30);
      func_0x00014592b2f0(fVar10,param_3,param_4,&local_190);
      uVar7 = (ulong)local_180 & 0xffffffffffffff8;
      uVar18 = 0;
      while (uVar7 != uVar18) {
        if ((((((local_188[uVar18] == lVar9) || (local_188[uVar18 + 1] == lVar9)) ||
              (local_188[uVar18 + 2] == lVar9)) ||
             ((local_188[uVar18 + 3] == lVar9 || (local_188[uVar18 + 4] == lVar9)))) ||
            (local_188[uVar18 + 5] == lVar9)) ||
           ((local_188[uVar18 + 6] == lVar9 ||
            (lVar13 = uVar18 + 7, uVar18 = uVar18 + 8, local_188[lVar13] == lVar9))))
        goto LAB_145958afe;
      }
      uVar11 = (int)local_180 * 8 & 0x38;
      if ((uVar11 == 0) ||
         ((local_188[uVar7] != lVar9 &&
          ((uVar11 == 8 ||
           ((local_188[uVar7 + 1] != lVar9 &&
            ((uVar11 == 0x10 ||
             ((local_188[uVar7 + 2] != lVar9 &&
              ((uVar11 == 0x18 ||
               ((local_188[uVar7 + 3] != lVar9 &&
                ((uVar11 == 0x20 ||
                 ((local_188[uVar7 + 4] != lVar9 &&
                  ((uVar11 == 0x28 ||
                   ((local_188[uVar7 + 5] != lVar9 &&
                    ((uVar11 == 0x30 || ((local_188[uVar7 + 6] != lVar9 && (uVar11 == 0x38))))))))))
                 )))))))))))))))))) goto LAB_145958c79;
LAB_145958afe:
      if (*(long *)(param_4 + 0x570) != 0) {
        lVar13 = *(long *)(param_4 + 0x568);
        lVar12 = *(long *)(param_4 + 0x570) * 0x1d8;
        lVar17 = 0;
        do {
          if (((*(long *)(lVar13 + 0xf0 + lVar17) == lVar9) &&
              (*(char *)(lVar13 + 0xb0 + lVar17) == '\0')) &&
             ((lVar14 = lVar12, lVar4 = lVar13, *(long *)(lVar13 + 0x18 + lVar17) != -1 ||
              (*(char *)(lVar13 + 0x1d0 + lVar17) != '\0')))) goto LAB_145958b70;
          lVar17 = lVar17 + 0x1d8;
        } while (lVar12 - lVar17 != 0);
      }
LAB_145958c79:
      if ((local_180 == (undefined8 *)0x0) || (*(long *)(param_4 + 0x570) == 0)) {
        bVar3 = false;
      }
      else {
        lVar9 = *(long *)(param_4 + 0x568);
        lVar13 = *(long *)(param_4 + 0x570) * 0x1d8;
        plVar15 = local_188;
        do {
          lVar12 = *plVar15;
          plVar15 = plVar15 + 1;
          lVar17 = 0;
          do {
            if (((*(long *)(lVar9 + 0xf0 + lVar17) == lVar12) &&
                (*(int *)(lVar9 + 0xb0 + lVar17) == 0)) && (*(long *)(lVar9 + 0x18 + lVar17) != -1))
            {
              bVar3 = true;
              goto LAB_145958d06;
            }
            lVar17 = lVar17 + 0x1d8;
          } while (lVar13 - lVar17 != 0);
          plVar16 = local_188;
        } while (plVar15 != local_188 + (long)local_180);
        do {
          plVar15 = plVar16 + 1;
          lVar12 = 0;
          do {
            if (((*(long *)(lVar9 + 0xf0 + lVar12) == *plVar16) &&
                (*(int *)(lVar9 + 0xb0 + lVar12) == 0)) &&
               (*(char *)(lVar9 + 0x1d0 + lVar12) != '\0')) {
              bVar3 = true;
              goto LAB_145958d06;
            }
            lVar12 = lVar12 + 0x1d8;
          } while (lVar13 - lVar12 != 0);
          bVar3 = false;
          plVar16 = plVar15;
        } while (plVar15 != local_188 + (long)local_180);
      }
LAB_145958d06:
      if (local_190 != 0) {
        func_0x0001400021d0();
      }
      if (bVar3) {
        return 1;
      }
    }
    local_194 = *(int *)(local_158 + 0x34);
    if (local_194 == 0) {
      local_1a0 = CONCAT44(fVar25,fVar24);
      local_198 = fVar10;
    }
    else {
      local_1a0 = CONCAT44(fVar27,fVar26);
      local_198 = fVar28;
    }
    func_0x00014592b2f0();
    if (local_180 == (undefined8 *)0x0) {
      if (local_190 != 0) {
        func_0x0001400021d0();
      }
      return 0;
    }
    local_120 = local_190;
    local_100 = local_188 + (long)local_180;
    lVar9 = *(long *)(param_4 + 0x568);
    local_130 = *(long *)(param_4 + 0x570);
    local_138 = *(long *)(param_4 + 0x5e0);
    local_168 = *(ulong *)(param_4 + 0x5e8);
    local_148 = *(undefined8 *)(param_4 + 0x118);
    local_f8 = local_168 & 0xfffffffffffffffe;
    local_f0 = uVar19 & 0xfffffffffffffffe;
    local_140 = (byte *)(local_138 + 0xf9);
    local_118 = local_160 + 0xa8;
    local_150 = *(long *)(param_4 + 0x120) << 4;
    lVar13 = 0x20;
    local_128 = local_188;
    do {
      local_110 = uVar19;
      local_108 = lVar6;
      if (local_188 == local_100) break;
      lVar13 = lVar13 + -1;
      lVar17 = *local_188;
      local_188 = local_188 + 1;
      lVar14 = 0;
      lVar12 = lVar9;
      do {
        if (local_130 * 0x1d8 - lVar14 == 0) goto LAB_145958ef0;
        lVar14 = lVar14 + 0x1d8;
        plVar15 = (long *)(lVar12 + 0xf0);
        lVar12 = lVar12 + 0x1d8;
      } while (*plVar15 != lVar17);
      fVar22 = *(float *)(lVar9 + -0x48 + lVar14);
      if (fVar22 <= 0.0) {
        uVar5 = *(undefined8 *)(lVar9 + -0x58 + lVar14);
        if (local_194 == 0) goto LAB_145958f9b;
LAB_145958fc8:
        if (*(float *)(lVar9 + -0x30 + lVar14) <= fVar23) {
          if ((*(long *)(lVar9 + -0x1c0 + lVar14) != -1) ||
             (*(char *)(lVar9 + -8 + lVar14) == '\x01')) goto LAB_1459591a8;
          fVar22 = _DAT_145dad4e0;
          if (local_168 != 0) {
            if (local_168 == 1) {
              uVar18 = 0;
            }
            else {
              uVar18 = 0;
              pbVar8 = local_140;
              do {
                if ((pbVar8[-0x80] & 1) == 0) {
                  fVar28 = *(float *)(pbVar8 + -0x85) + fVar22;
                  if (*(long *)(pbVar8 + -0xa9) != lVar17) goto LAB_145959086;
LAB_1459590b9:
                  fVar22 = fVar28;
                  if ((*pbVar8 & 1) != 0) goto LAB_1459590c7;
LAB_145959090:
                  fVar28 = *(float *)(pbVar8 + -5) + fVar22;
                  lVar12 = *(long *)(pbVar8 + -0x29);
                }
                else {
                  fVar28 = fVar22;
                  if (*(long *)(pbVar8 + -0xa9) == lVar17) goto LAB_1459590b9;
LAB_145959086:
                  if ((*pbVar8 & 1) == 0) goto LAB_145959090;
LAB_1459590c7:
                  lVar12 = *(long *)(pbVar8 + -0x29);
                  fVar28 = fVar22;
                }
                if (lVar12 == lVar17) {
                  fVar22 = fVar28;
                }
                uVar18 = uVar18 + 2;
                pbVar8 = pbVar8 + 0x100;
              } while (local_f8 != uVar18);
              if ((local_168 & 1) == 0) goto LAB_14595910f;
            }
            lVar12 = uVar18 * 0x80;
            fVar28 = fVar22;
            if ((*(byte *)(local_138 + 0x79 + lVar12) & 1) == 0) {
              fVar28 = *(float *)(local_138 + 0x74 + lVar12) + fVar22;
            }
            if (*(long *)(local_138 + 0x50 + lVar12) == lVar17) {
              fVar22 = fVar28;
            }
          }
LAB_14595910f:
          if (fVar22 < *(float *)(lVar9 + -0x80 + lVar14)) {
LAB_1459591a8:
            if (uVar19 != 1) {
              uVar19 = 0;
              do {
                uVar19 = uVar19 + 2;
              } while (uVar19 != local_f0);
            }
                    /* WARNING: Could not emulate address calculation at 0x000145959331 */
                    /* WARNING: Treating indirect jump as call */
            uVar5 = (*(code *)((long)*(int *)((ulong)*(byte *)(local_158 + 0x39) * 4 + 0x146c0c690)
                              + 0x146c0c690))(local_194);
            return uVar5;
          }
        }
      }
      else {
        fVar22 = (fVar23 - *(float *)(lVar9 + -0x4c + lVar14)) / fVar22;
        fVar28 = 0.0;
        if (0.0 <= fVar22) {
          fVar28 = fVar22;
        }
        fVar22 = _DAT_145dad260;
        if (fVar28 <= _DAT_145dad260) {
          fVar22 = fVar28;
        }
        uVar5 = *(undefined8 *)(lVar9 + -100 + lVar14);
        fVar28 = (float)uVar5;
        fVar20 = (float)((ulong)uVar5 >> 0x20);
        uVar5 = *(undefined8 *)(lVar9 + -0x58 + lVar14);
        uVar5 = CONCAT44(fVar22 * ((float)((ulong)uVar5 >> 0x20) - fVar20) + fVar20,
                         fVar22 * ((float)uVar5 - fVar28) + fVar28);
        if (local_194 != 0) goto LAB_145958fc8;
LAB_145958f9b:
        fVar22 = (float)uVar5 - fVar26;
        fVar28 = (float)((ulong)uVar5 >> 0x20) - fVar27;
        if (SQRT(fVar28 * fVar28 + fVar22 * fVar22) <= _DAT_145e060a0) goto LAB_145958fc8;
      }
LAB_145958ef0:
    } while (lVar13 != 0);
    if (local_190 != 0) {
      func_0x0001400021d0();
      return 0;
    }
    return 0;
  }
  local_1a0 = CONCAT44(local_1a0._4_4_,fVar23);
  lVar9 = *(long *)(param_4 + 0x568);
  lVar13 = *(long *)(param_4 + 0x570);
  if (lVar13 == 0) goto LAB_1459596cd;
  lVar14 = lVar13 * 0x1d8;
  lVar17 = lVar14;
  lVar12 = lVar9;
  do {
    fVar28 = _DAT_145dbe3e0;
    fVar22 = _DAT_145dad260;
    if ((*(char *)(lVar12 + 0xb0) == '\0') &&
       (((*(long *)(lVar12 + 0x18) != -1 || (*(char *)(lVar12 + 0x1d0) != '\0')) &&
        (*(float *)(lVar12 + 0x1a8) <= fVar23)))) {
      if (*(float *)(lVar12 + 400) <= 0.0) {
        uVar5 = *(undefined8 *)(lVar12 + 0x180);
      }
      else {
        fVar26 = (fVar23 - *(float *)(lVar12 + 0x18c)) / *(float *)(lVar12 + 400);
        fVar20 = 0.0;
        if (0.0 <= fVar26) {
          fVar20 = fVar26;
        }
        fVar26 = _DAT_145dad260;
        if (fVar20 <= _DAT_145dad260) {
          fVar26 = fVar20;
        }
        fVar20 = (float)*(undefined8 *)(lVar12 + 0x174);
        fVar27 = (float)((ulong)*(undefined8 *)(lVar12 + 0x174) >> 0x20);
        uVar5 = CONCAT44(fVar26 * ((float)((ulong)*(undefined8 *)(lVar12 + 0x180) >> 0x20) - fVar27)
                         + fVar27,fVar26 * ((float)*(undefined8 *)(lVar12 + 0x180) - fVar20) +
                                  fVar20);
      }
      fVar20 = (float)uVar5 - fVar24;
      fVar26 = (float)((ulong)uVar5 >> 0x20) - fVar25;
      fVar20 = SQRT(fVar26 * fVar26 + fVar20 * fVar20);
      if (fVar20 <= _DAT_145dbe3e0) {
        fVar26 = *(float *)(lVar12 + 0x15c);
        if (*(float *)(lVar12 + 0x15c) <= _DAT_145dad260) {
          fVar26 = _DAT_145dad260;
        }
        local_180 = &local_1a0;
        local_190 = lVar12 + 0x1d8;
        local_188 = (long *)(lVar9 + lVar14);
        local_178 = local_180;
        local_170 = param_4;
        func_0x0001459efab0(fVar26,fVar20,*(float *)(lVar12 + 0x158) / fVar26,fVar10,lVar9,
                            *(undefined8 *)(lVar12 + 0xf0),&local_190);
        bVar3 = true;
        goto LAB_145958972;
      }
    }
    lVar17 = lVar17 + -0x1d8;
    lVar12 = lVar12 + 0x1d8;
  } while (lVar17 != 0);
  bVar3 = false;
LAB_145958972:
  lVar12 = 0;
  do {
    if (((*(long *)(lVar9 + 0xf0 + lVar12) == lVar6) && (*(char *)(lVar9 + 0xb0 + lVar12) == '\0'))
       && ((*(long *)(lVar9 + 0x18 + lVar12) != -1 || (*(char *)(lVar9 + 0x1d0 + lVar12) != '\0'))))
    {
      lVar17 = 0;
      lVar12 = lVar9;
      goto LAB_1459589e0;
    }
    lVar12 = lVar12 + 0x1d8;
  } while (lVar14 - lVar12 != 0);
  goto LAB_1459596bb;
  while( true ) {
    lVar14 = lVar14 + -0x1d8;
    lVar4 = lVar17 + 0x1d8;
    if ((*(long *)(lVar17 + 0xf0) == lVar9) && (*(long *)(lVar17 + 0x18) != -1)) break;
LAB_145958b70:
    lVar17 = lVar4;
    if (lVar14 == 0) {
      if (local_180 != (undefined8 *)0x0) {
        plVar15 = local_188;
        do {
          lVar9 = *plVar15;
          plVar15 = plVar15 + 1;
          lVar17 = 0;
          do {
            if (((*(long *)(lVar13 + 0xf0 + lVar17) == lVar9) &&
                (*(int *)(lVar13 + 0xb0 + lVar17) == 0)) &&
               (*(long *)(lVar13 + 0x18 + lVar17) != -1)) goto LAB_145958c79;
            lVar17 = lVar17 + 0x1d8;
          } while (lVar12 - lVar17 != 0);
        } while (plVar15 != local_188 + (long)local_180);
      }
      break;
    }
  }
  if (local_190 != 0) {
    func_0x0001400021d0();
  }
  return 1;
  while( true ) {
    lVar17 = lVar17 + 0x1d8;
    plVar15 = (long *)(lVar12 + 0xf0);
    lVar12 = lVar12 + 0x1d8;
    if (*plVar15 == lVar6) break;
LAB_1459589e0:
    if (lVar14 - lVar17 == 0) goto LAB_1459596bb;
  }
  fVar20 = *(float *)(lVar9 + -0x48 + lVar17);
  if (fVar20 <= 0.0) {
    uVar5 = *(undefined8 *)(lVar9 + -0x58 + lVar17);
  }
  else {
    fVar20 = (fVar23 - *(float *)(lVar9 + -0x4c + lVar17)) / fVar20;
    fVar26 = 0.0;
    if (0.0 <= fVar20) {
      fVar26 = fVar20;
    }
    if (fVar26 <= fVar22) {
      fVar22 = fVar26;
    }
    uVar5 = *(undefined8 *)(lVar9 + -100 + lVar17);
    uVar1 = *(undefined8 *)(lVar9 + -0x58 + lVar17);
    fVar20 = (float)uVar5;
    fVar26 = (float)((ulong)uVar5 >> 0x20);
    uVar5 = CONCAT44(fVar22 * ((float)((ulong)uVar1 >> 0x20) - fVar26) + fVar26,
                     fVar22 * ((float)uVar1 - fVar20) + fVar20);
  }
  fVar22 = (float)uVar5 - fVar24;
  fVar20 = (float)((ulong)uVar5 >> 0x20) - fVar25;
  if (SQRT(fVar20 * fVar20 + fVar22 * fVar22) <= fVar28) {
    return 1;
  }
LAB_1459596bb:
  if (bVar3) {
    return 1;
  }
LAB_1459596cd:
  local_1a0 = CONCAT44(fVar25,fVar24);
  local_198 = fVar10;
  func_0x00014592b2f0();
  if (local_180 == (undefined8 *)0x0) {
    local_1a8 = 0;
  }
  else {
    local_1a8 = 0;
    plVar15 = local_188;
    do {
      lVar6 = *plVar15;
      plVar15 = plVar15 + 1;
      lVar12 = lVar9;
      lVar17 = lVar13 * 0x1d8;
      while (lVar14 = lVar12, lVar17 != 0) {
        lVar17 = lVar17 + -0x1d8;
        lVar12 = lVar14 + 0x1d8;
        if ((*(long *)(lVar14 + 0xf0) == lVar6) && (*(float *)(lVar14 + 0x1a8) <= fVar23)) {
          local_1a8 = 1;
          goto joined_r0x00014595978f;
        }
      }
    } while (plVar15 != local_188 + (long)local_180);
  }
joined_r0x00014595978f:
  if (local_190 != 0) {
    func_0x0001400021d0();
  }
  return local_1a8;
}
