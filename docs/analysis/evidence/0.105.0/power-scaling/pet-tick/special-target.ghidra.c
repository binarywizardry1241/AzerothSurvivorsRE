
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  long lVar1;
  float *pfVar2;
  undefined8 uVar3;
  int iVar4;
  code *pcVar5;
  bool bVar6;
  long lVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  ulong uVar13;
  uint uVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  long *plVar18;
  long *plVar19;
  long lVar20;
  byte *pbVar21;
  long lVar22;
  uint uVar23;
  float fVar24;
  undefined8 uVar25;
  float fVar26;
  float fVar27;
  uint uVar30;
  undefined1 auVar28 [16];
  uint uVar32;
  undefined1 auVar31 [16];
  undefined4 in_XMM6_Da;
  float fVar33;
  undefined4 in_XMM7_Da;
  float fVar34;
  undefined1 auVar35 [16];
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  float fVar38;
  float fVar39;
  undefined4 uVar40;
  undefined4 uVar41;
  float fVar42;
  float fVar43;
  undefined1 auVar44 [16];
  undefined1 auVar45 [16];
  undefined8 local_190;
  long local_130;
  long *local_128;
  ulong local_120;
  long local_118;
  byte *local_110;
  long *local_108;
  long local_100;
  long local_f8;
  ulong local_f0;
  undefined4 local_e8;
  undefined4 local_d8;
  undefined1 auVar29 [16];

  uVar13 = *(ulong *)(param_4 + 0xd8);
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  if (uVar13 <= param_3) {
    func_0x000145d697e3(param_1,param_3,uVar13,param_3,0x146e7a928);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  fVar33 = *(float *)(param_4 + 0x9ec);
  lVar22 = *(long *)(param_4 + 0xd0);
  lVar10 = param_3 * 0x78;
  lVar1 = lVar22 + lVar10;
  lVar16 = *(long *)(lVar22 + 0x18 + lVar10);
  fVar26 = *(float *)(lVar22 + 0x5c + lVar10);
  if (fVar26 <= 0.0) {
    fVar26 = (float)*(undefined8 *)(lVar1 + 0x4c);
    fVar34 = (float)((ulong)*(undefined8 *)(lVar1 + 0x4c) >> 0x20);
  }
  else {
    fVar26 = (fVar33 - *(float *)(lVar1 + 0x58)) / fVar26;
    fVar34 = 0.0;
    if (0.0 <= fVar26) {
      fVar34 = fVar26;
    }
    fVar27 = _DAT_145d6d36c;
    if (fVar34 <= _DAT_145d6d36c) {
      fVar27 = fVar34;
    }
    fVar26 = (float)*(undefined8 *)(lVar1 + 0x40);
    fVar34 = (float)((ulong)*(undefined8 *)(lVar1 + 0x40) >> 0x20);
    fVar26 = fVar27 * ((float)*(undefined8 *)(lVar1 + 0x4c) - fVar26) + fVar26;
    fVar34 = fVar27 * ((float)((ulong)*(undefined8 *)(lVar1 + 0x4c) >> 0x20) - fVar34) + fVar34;
  }
  fVar27 = (float)*(undefined8 *)(param_4 + 0x4c8);
  fVar43 = (float)((ulong)*(undefined8 *)(param_4 + 0x4c8) >> 0x20);
  lVar10 = *(long *)(lVar1 + 0x28);
  if (*(char *)(lVar16 + 0x39) == '\x05') {
    if (*(long *)(param_4 + 0x568) != 0) {
      lVar1 = *(long *)(param_4 + 0x560);
      lVar20 = *(long *)(param_4 + 0x568) * 0x160;
      lVar15 = 0;
      do {
        if (((*(long *)(lVar1 + 0x88 + lVar15) == lVar10) &&
            (*(char *)(lVar1 + 0x68 + lVar15) == '\0')) &&
           ((*(long *)(lVar1 + 0x18 + lVar15) != -1 || (*(char *)(lVar1 + 0x15c + lVar15) != '\0')))
           ) {
          lVar17 = 0;
          lVar15 = lVar1;
          goto LAB_14594cfe0;
        }
        lVar15 = lVar15 + 0x160;
      } while (lVar20 - lVar15 != 0);
      goto LAB_14594de12;
    }
  }
  else if (*(char *)(lVar16 + 0x39) == '\a') {
    lVar10 = *(long *)(lVar1 + 0x30);
    func_0x000145925c80(*(undefined4 *)(param_4 + 0x4d0),param_3,param_4,&local_130);
    uVar11 = local_120 & 0xffffffffffffff8;
    uVar12 = 0;
    while (uVar11 != uVar12) {
      if (((local_128[uVar12] == lVar10) || (local_128[uVar12 + 1] == lVar10)) ||
         ((local_128[uVar12 + 2] == lVar10 ||
          ((((local_128[uVar12 + 3] == lVar10 || (local_128[uVar12 + 4] == lVar10)) ||
            (local_128[uVar12 + 5] == lVar10)) ||
           ((local_128[uVar12 + 6] == lVar10 ||
            (lVar1 = uVar12 + 7, uVar12 = uVar12 + 8, local_128[lVar1] == lVar10))))))))
      goto LAB_14594d10e;
    }
    uVar14 = (int)local_120 * 8 & 0x38;
    if ((uVar14 == 0) ||
       ((local_128[uVar11] != lVar10 &&
        ((uVar14 == 8 ||
         ((local_128[uVar11 + 1] != lVar10 &&
          ((uVar14 == 0x10 ||
           ((local_128[uVar11 + 2] != lVar10 &&
            ((uVar14 == 0x18 ||
             ((local_128[uVar11 + 3] != lVar10 &&
              ((uVar14 == 0x20 ||
               ((local_128[uVar11 + 4] != lVar10 &&
                ((uVar14 == 0x28 ||
                 ((local_128[uVar11 + 5] != lVar10 &&
                  ((uVar14 == 0x30 || ((local_128[uVar11 + 6] != lVar10 && (uVar14 == 0x38))))))))))
               )))))))))))))))))) goto LAB_14594d286;
LAB_14594d10e:
    if (*(long *)(param_4 + 0x568) != 0) {
      lVar1 = *(long *)(param_4 + 0x560);
      lVar15 = *(long *)(param_4 + 0x568) * 0x160;
      lVar20 = 0;
      do {
        if (((*(long *)(lVar1 + 0x88 + lVar20) == lVar10) &&
            (*(char *)(lVar1 + 0x68 + lVar20) == '\0')) &&
           ((lVar17 = lVar15, lVar7 = lVar1, *(long *)(lVar1 + 0x18 + lVar20) != -1 ||
            (*(char *)(lVar1 + 0x15c + lVar20) != '\0')))) goto LAB_14594d180;
        lVar20 = lVar20 + 0x160;
      } while (lVar15 - lVar20 != 0);
    }
LAB_14594d286:
    if ((local_120 == 0) || (*(long *)(param_4 + 0x568) == 0)) {
      bVar6 = false;
    }
    else {
      lVar1 = *(long *)(param_4 + 0x560);
      lVar15 = *(long *)(param_4 + 0x568) * 0x160;
      plVar18 = local_128;
      do {
        lVar10 = *plVar18;
        plVar18 = plVar18 + 1;
        lVar20 = 0;
        do {
          if (((*(long *)(lVar1 + 0x88 + lVar20) == lVar10) &&
              (*(int *)(lVar1 + 0x68 + lVar20) == 0)) && (*(long *)(lVar1 + 0x18 + lVar20) != -1))
          goto LAB_14594d2f6;
          lVar20 = lVar20 + 0x160;
        } while (lVar15 - lVar20 != 0);
        plVar19 = local_128;
      } while (plVar18 != local_128 + local_120);
      do {
        lVar10 = *plVar19;
        plVar19 = plVar19 + 1;
        lVar20 = 0;
        do {
          if (((*(long *)(lVar1 + 0x88 + lVar20) == lVar10) &&
              (*(int *)(lVar1 + 0x68 + lVar20) == 0)) && (*(char *)(lVar1 + 0x15c + lVar20) != '\0')
             ) goto LAB_14594d2f6;
          lVar20 = lVar20 + 0x160;
        } while (lVar15 - lVar20 != 0);
        bVar6 = false;
      } while (plVar19 != local_128 + local_120);
    }
    goto LAB_14594d2fd;
  }
  goto LAB_14594d331;
  while( true ) {
    lVar17 = lVar17 + 0x160;
    plVar18 = (long *)(lVar15 + 0x88);
    lVar15 = lVar15 + 0x160;
    if (*plVar18 == lVar10) break;
LAB_14594cfe0:
    if (lVar20 - lVar17 == 0) goto LAB_14594de12;
  }
  fVar24 = *(float *)(lVar1 + -0x38 + lVar17);
  if (fVar24 <= 0.0) {
    uVar25 = *(undefined8 *)(lVar1 + -0x48 + lVar17);
  }
  else {
    fVar24 = (fVar33 - *(float *)(lVar1 + -0x3c + lVar17)) / fVar24;
    fVar38 = 0.0;
    if (0.0 <= fVar24) {
      fVar38 = fVar24;
    }
    fVar24 = _DAT_145d6d36c;
    if (fVar38 <= _DAT_145d6d36c) {
      fVar24 = fVar38;
    }
    uVar25 = *(undefined8 *)(lVar1 + -0x54 + lVar17);
    uVar3 = *(undefined8 *)(lVar1 + -0x48 + lVar17);
    fVar38 = (float)uVar25;
    fVar42 = (float)((ulong)uVar25 >> 0x20);
    uVar25 = CONCAT44(fVar24 * ((float)((ulong)uVar3 >> 0x20) - fVar42) + fVar42,
                      fVar24 * ((float)uVar3 - fVar38) + fVar38);
  }
  fVar24 = (float)uVar25 - fVar27;
  fVar38 = (float)((ulong)uVar25 >> 0x20) - fVar43;
  local_190 = 1;
  if (SQRT(fVar38 * fVar38 + fVar24 * fVar24) <= _DAT_145d9de20) goto LAB_14594dd67;
LAB_14594de12:
  lVar15 = 0;
  do {
    if ((*(char *)(lVar1 + 0x68 + lVar15) == '\0') &&
       (((*(long *)(lVar1 + 0x18 + lVar15) != -1 || (*(char *)(lVar1 + 0x15c + lVar15) != '\0')) &&
        (*(float *)(lVar1 + 0x140 + lVar15) <= fVar33)))) {
      fVar24 = *(float *)(lVar1 + 0x128 + lVar15);
      if (fVar24 <= 0.0) {
        uVar25 = *(undefined8 *)(lVar1 + 0x118 + lVar15);
        fVar24 = (float)uVar25;
        fVar38 = (float)((ulong)uVar25 >> 0x20);
      }
      else {
        fVar24 = (fVar33 - *(float *)(lVar1 + 0x124 + lVar15)) / fVar24;
        fVar38 = 0.0;
        if (0.0 <= fVar24) {
          fVar38 = fVar24;
        }
        fVar42 = _DAT_145d6d36c;
        if (fVar38 <= _DAT_145d6d36c) {
          fVar42 = fVar38;
        }
        pfVar2 = (float *)(lVar1 + 0x10c + lVar15);
        fVar24 = *pfVar2;
        fVar38 = pfVar2[1];
        uVar25 = *(undefined8 *)(lVar1 + 0x118 + lVar15);
        fVar24 = fVar42 * ((float)uVar25 - fVar24) + fVar24;
        fVar38 = fVar42 * ((float)((ulong)uVar25 >> 0x20) - fVar38) + fVar38;
      }
      if (SQRT((fVar38 - fVar43) * (fVar38 - fVar43) + (fVar24 - fVar27) * (fVar24 - fVar27)) <=
          _DAT_145d9de20) {
        lVar22 = lVar1 + lVar15;
        if (lVar20 + -0x160 != lVar15) {
          uVar13 = ((lVar20 - lVar15) - 0x160U) / 0x160;
          lVar16 = lVar22;
          lVar1 = lVar1 + lVar15;
          do {
            lVar22 = lVar16;
            if (((*(char *)(lVar1 + 0x1c8) == '\0') &&
                ((*(long *)(lVar1 + 0x178) != -1 || (*(char *)(lVar1 + 700) != '\0')))) &&
               (*(float *)(lVar1 + 0x2a0) <= fVar33)) {
              if (*(float *)(lVar1 + 0x288) <= 0.0) {
                uVar25 = *(undefined8 *)(lVar1 + 0x278);
              }
              else {
                fVar34 = (fVar33 - *(float *)(lVar1 + 0x284)) / *(float *)(lVar1 + 0x288);
                fVar26 = 0.0;
                if (0.0 <= fVar34) {
                  fVar26 = fVar34;
                }
                fVar34 = _DAT_145d6d36c;
                if (fVar26 <= _DAT_145d6d36c) {
                  fVar34 = fVar26;
                }
                fVar26 = (float)*(undefined8 *)(lVar1 + 0x26c);
                fVar24 = (float)((ulong)*(undefined8 *)(lVar1 + 0x26c) >> 0x20);
                uVar25 = CONCAT44(fVar34 * ((float)((ulong)*(undefined8 *)(lVar1 + 0x278) >> 0x20) -
                                           fVar24) + fVar24,
                                  fVar34 * ((float)*(undefined8 *)(lVar1 + 0x278) - fVar26) + fVar26
                                 );
              }
              fVar26 = (float)uVar25 - fVar27;
              fVar34 = (float)((ulong)uVar25 >> 0x20) - fVar43;
              if (SQRT(fVar34 * fVar34 + fVar26 * fVar26) <= _DAT_145d9de20) {
                uVar25 = *(undefined8 *)(lVar16 + 0xf0);
                uVar32 = (uint)((ulong)*(undefined8 *)(lVar1 + 0x250) >> 0x20);
                auVar28._0_4_ = (undefined4)uVar25;
                uVar30 = (uint)((ulong)uVar25 >> 0x20);
                auVar36._4_4_ = uVar32;
                auVar36._0_4_ = uVar30;
                auVar36._8_8_ = 0;
                auVar44 = maxps(auVar36,_DAT_145d70ca0);
                uVar14 = -(uint)NAN(auVar44._0_4_);
                uVar23 = -(uint)NAN(auVar44._4_4_);
                auVar37._0_4_ = ~uVar14 & (uint)auVar44._0_4_;
                auVar37._4_4_ = ~uVar23 & (uint)auVar44._4_4_;
                auVar37._8_4_ = ~-(uint)NAN(auVar44._8_4_) & (uint)auVar44._8_4_;
                auVar37._12_4_ = ~-(uint)NAN(auVar44._12_4_) & (uint)auVar44._12_4_;
                auVar44._4_4_ = uVar32 & uVar23;
                auVar44._0_4_ = uVar30 & uVar14;
                auVar44._8_8_ = 0;
                auVar29._8_4_ = uVar30;
                auVar29._0_8_ = uVar25;
                auVar29._12_4_ = uVar32;
                auVar28._8_8_ = auVar29._8_8_;
                auVar28._4_4_ = (int)*(undefined8 *)(lVar1 + 0x250);
                auVar44 = divps(auVar28,auVar37 | auVar44);
                auVar31._0_4_ = (uint)(auVar44._0_4_ >> 0x1f) >> 1;
                auVar31._4_4_ = (uint)(auVar44._4_4_ >> 0x1f) >> 1;
                auVar31._8_4_ = (uint)(auVar44._8_4_ >> 0x1f) >> 1;
                auVar31._12_4_ = (uint)(auVar44._12_4_ >> 0x1f) >> 1;
                lVar22 = lVar1 + 0x160;
                if (SUB164(auVar31 ^ auVar44,0) <= SUB164(auVar31 ^ auVar44,4)) {
                  lVar22 = lVar16;
                }
              }
            }
            uVar13 = uVar13 - 1;
            lVar16 = lVar22;
            lVar1 = lVar1 + 0x160;
          } while (uVar13 != 0);
        }
        lVar10 = *(long *)(lVar22 + 0x88);
        local_190 = 1;
        goto LAB_14594dd67;
      }
    }
    lVar15 = lVar15 + 0x160;
  } while (lVar20 - lVar15 != 0);
  goto LAB_14594d331;
  while( true ) {
    lVar17 = lVar17 + -0x160;
    lVar7 = lVar20 + 0x160;
    if ((*(long *)(lVar20 + 0x88) == lVar10) && (*(long *)(lVar20 + 0x18) != -1)) break;
LAB_14594d180:
    lVar20 = lVar7;
    if (lVar17 == 0) {
      bVar6 = true;
      if (local_120 != 0) {
        plVar18 = local_128;
        do {
          lVar20 = *plVar18;
          plVar18 = plVar18 + 1;
          lVar17 = 0;
          do {
            if (((*(long *)(lVar1 + 0x88 + lVar17) == lVar20) &&
                (*(int *)(lVar1 + 0x68 + lVar17) == 0)) && (*(long *)(lVar1 + 0x18 + lVar17) != -1))
            goto LAB_14594d286;
            lVar17 = lVar17 + 0x160;
          } while (lVar15 - lVar17 != 0);
        } while (plVar18 != local_128 + local_120);
      }
      goto LAB_14594d2fd;
    }
  }
LAB_14594d2f6:
  bVar6 = true;
LAB_14594d2fd:
  if (local_130 != 0) {
    func_0x0001400021d0();
  }
  local_190 = 1;
  if (bVar6) goto LAB_14594dd67;
LAB_14594d331:
  iVar4 = *(int *)(lVar16 + 0x34);
  func_0x000145925c80();
  if (local_120 == 0) {
    if (local_130 != 0) {
      func_0x0001400021d0();
    }
    local_190 = 0;
  }
  else {
    fVar24 = (((float)*(uint *)(param_4 + 0x4d8) + _DAT_145d73d14) * _DAT_145db5ef4 + _DAT_145d6d36c
             ) * *(float *)(lVar16 + 0x2c) * *(float *)(param_4 + 0x47c);
    local_100 = local_130;
    plVar18 = local_128 + local_120;
    lVar1 = *(long *)(param_4 + 0x560);
    lVar10 = *(long *)(param_4 + 0x590);
    uVar12 = *(ulong *)(param_4 + 0x598);
    if (fVar24 <= _DAT_145d6d36c) {
      fVar24 = _DAT_145d6d36c;
    }
    local_f0 = uVar12 & 0xfffffffffffffffe;
    local_110 = (byte *)(lVar10 + 0xf9);
    local_f8 = lVar22 + 0xa0;
    lVar22 = 0x20;
    local_190 = 0;
    local_108 = local_128;
    do {
      local_118 = lVar10;
      if (local_128 == plVar18) break;
      lVar22 = lVar22 + -1;
      lVar20 = *local_128;
      local_128 = local_128 + 1;
      lVar17 = 0;
      lVar15 = lVar1;
      do {
        if (*(long *)(param_4 + 0x568) * 0x160 - lVar17 == 0) goto LAB_14594d4c0;
        lVar17 = lVar17 + 0x160;
        plVar19 = (long *)(lVar15 + 0x88);
        lVar15 = lVar15 + 0x160;
      } while (*plVar19 != lVar20);
      fVar38 = *(float *)(lVar1 + -0x38 + lVar17);
      if (fVar38 <= 0.0) {
        uVar25 = *(undefined8 *)(lVar1 + -0x48 + lVar17);
        fVar38 = (float)uVar25;
        fVar42 = (float)((ulong)uVar25 >> 0x20);
        if (iVar4 == 0) goto LAB_14594d56b;
LAB_14594d598:
        if (*(float *)(lVar1 + -0x20 + lVar17) <= fVar33) {
          if ((*(long *)(lVar1 + -0x148 + lVar17) != -1) ||
             (*(char *)(lVar1 + -4 + lVar17) == '\x01')) goto LAB_14594d6d8;
          auVar35 = ZEXT416(_DAT_145d70c70);
          if (uVar12 != 0) {
            if (uVar12 == 1) {
              uVar11 = 0;
              auVar35 = ZEXT416(_DAT_145d70c70);
            }
            else {
              uVar11 = 0;
              auVar35 = ZEXT416(_DAT_145d70c70);
              pbVar21 = local_110;
              do {
                fVar38 = auVar35._0_4_;
                uVar40 = auVar35._8_4_;
                uVar41 = auVar35._12_4_;
                if ((pbVar21[-0x80] & 1) == 0) {
                  fVar42 = *(float *)(pbVar21 + -0x85) + fVar38;
                  uVar8 = 0;
                  uVar9 = 0;
                  if (*(long *)(pbVar21 + -0xa9) == lVar20) goto LAB_14594d679;
LAB_14594d647:
                  if ((*pbVar21 & 1) != 0) goto LAB_14594d687;
LAB_14594d651:
                  uVar40 = 0;
                  uVar41 = 0;
                  fVar38 = *(float *)(pbVar21 + -5) + auVar35._0_4_;
                  lVar15 = *(long *)(pbVar21 + -0x29);
                }
                else {
                  fVar42 = fVar38;
                  uVar8 = uVar40;
                  uVar9 = uVar41;
                  if (*(long *)(pbVar21 + -0xa9) != lVar20) goto LAB_14594d647;
LAB_14594d679:
                  uVar41 = uVar9;
                  uVar40 = uVar8;
                  fVar38 = fVar42;
                  auVar35._4_4_ = 0;
                  auVar35._0_4_ = fVar38;
                  auVar35._8_4_ = uVar40;
                  auVar35._12_4_ = uVar41;
                  if ((*pbVar21 & 1) == 0) goto LAB_14594d651;
LAB_14594d687:
                  lVar15 = *(long *)(pbVar21 + -0x29);
                }
                if (lVar15 == lVar20) {
                  auVar35._4_4_ = 0;
                  auVar35._0_4_ = fVar38;
                  auVar35._8_4_ = uVar40;
                  auVar35._12_4_ = uVar41;
                }
                uVar11 = uVar11 + 2;
                pbVar21 = pbVar21 + 0x100;
              } while (local_f0 != uVar11);
              if ((uVar12 & 1) == 0) goto LAB_14594d6cc;
            }
            lVar15 = uVar11 * 0x80;
            fVar38 = auVar35._0_4_;
            uVar40 = auVar35._8_4_;
            uVar41 = auVar35._12_4_;
            if ((*(byte *)(lVar10 + 0x79 + lVar15) & 1) == 0) {
              uVar40 = 0;
              uVar41 = 0;
              fVar38 = *(float *)(lVar10 + 0x74 + lVar15) + fVar38;
            }
            if (*(long *)(lVar10 + 0x50 + lVar15) == lVar20) {
              auVar35._4_4_ = 0;
              auVar35._0_4_ = fVar38;
              auVar35._8_4_ = uVar40;
              auVar35._12_4_ = uVar41;
            }
          }
LAB_14594d6cc:
          if (auVar35._0_4_ < *(float *)(lVar1 + -0x70 + lVar17)) {
LAB_14594d6d8:
            if (uVar13 != 1) {
              uVar12 = 0;
              do {
                uVar12 = uVar12 + 2;
              } while (uVar12 != (uVar13 & 0xfffffffffffffffe));
            }
                    /* WARNING: Could not emulate address calculation at 0x00014594d8f4 */
                    /* WARNING: Treating indirect jump as call */
            auVar44 = (*(code *)((long)*(int *)((ulong)*(byte *)(lVar16 + 0x39) * 4 + 0x146e7b754) +
                                0x146e7b754))(fVar24,_DAT_145d6d36c,CONCAT44(fVar43,fVar27));
            return auVar44;
          }
        }
      }
      else {
        fVar38 = (fVar33 - *(float *)(lVar1 + -0x3c + lVar17)) / fVar38;
        fVar42 = 0.0;
        if (0.0 <= fVar38) {
          fVar42 = fVar38;
        }
        fVar39 = _DAT_145d6d36c;
        if (fVar42 <= _DAT_145d6d36c) {
          fVar39 = fVar42;
        }
        uVar25 = *(undefined8 *)(lVar1 + -0x54 + lVar17);
        uVar3 = *(undefined8 *)(lVar1 + -0x48 + lVar17);
        fVar38 = (float)uVar25;
        fVar42 = (float)((ulong)uVar25 >> 0x20);
        fVar38 = fVar39 * ((float)uVar3 - fVar38) + fVar38;
        fVar42 = fVar39 * ((float)((ulong)uVar3 >> 0x20) - fVar42) + fVar42;
        if (iVar4 != 0) goto LAB_14594d598;
LAB_14594d56b:
        if (SQRT((fVar42 - fVar34) * (fVar42 - fVar34) + (fVar38 - fVar26) * (fVar38 - fVar26)) <=
            _DAT_145db7cd0) goto LAB_14594d598;
      }
LAB_14594d4c0:
    } while (lVar22 != 0);
    if (local_130 != 0) {
      func_0x0001400021d0();
    }
  }
LAB_14594dd67:
  auVar45._8_8_ = lVar10;
  auVar45._0_8_ = local_190;
  return auVar45;
}
