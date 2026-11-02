
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,float param_2)

{
  int *piVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  long *plVar4;
  byte bVar5;
  undefined1 uVar6;
  ushort uVar7;
  code *pcVar8;
  float fVar9;
  ulong uVar10;
  char cVar11;
  int iVar12;
  undefined4 uVar13;
  double *pdVar14;
  char *pcVar15;
  long in_RCX;
  float *pfVar16;
  long lVar17;
  float *pfVar18;
  ulong uVar19;
  long lVar20;
  int *piVar21;
  undefined4 uVar22;
  undefined8 uVar23;
  int *piVar24;
  float *in_R8;
  int *piVar25;
  int *piVar26;
  ulong uVar27;
  char in_R9B;
  ulong uVar28;
  ulong uVar29;
  int iVar30;
  long lVar31;
  float *pfVar32;
  ulong uVar33;
  bool bVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  float fVar39;
  double dVar40;
  float local_164;
  undefined8 local_160;
  undefined8 local_150;
  undefined8 local_148;
  undefined4 local_140;
  float *local_138;
  undefined4 uStack_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  float fStack_120;
  undefined4 uStack_11c;
  undefined2 local_118;
  float *local_110;
  undefined8 uStack_108;
  undefined8 uStack_100;
  float fStack_f8;
  undefined2 uStack_f4;
  undefined2 uStack_f2;
  undefined2 local_f0;
  undefined2 uStack_ee;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 local_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 local_cc;
  undefined4 uStack_c8;
  undefined8 uStack_c4;
  float *local_b8;
  char local_a9;
  float *local_a8;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  piVar21 = (int *)&local_148;
  local_a0 = 0xfffffffffffffffe;
  if (*(char *)(in_RCX + 0x95f) != '\x01') {
    return;
  }
  if (*(char *)(in_RCX + 0x958) != '\0') {
    return;
  }
  fVar35 = *(float *)(in_RCX + 0x8e4);
  piVar26 = *(int **)(in_RCX + 0x2f8);
  uVar33 = *(ulong *)(in_RCX + 0x300);
  lVar17 = uVar33 * 0x18;
  piVar24 = piVar26;
  while (piVar25 = piVar24, lVar17 != 0) {
    lVar17 = lVar17 + -0x18;
    piVar24 = piVar25 + 6;
    if ((fVar35 < (float)piVar25[4]) && (*piVar25 == 0xb)) {
      return;
    }
  }
  fVar39 = (_DAT_1458eb480 - *(float *)(in_RCX + 0x478)) * param_2;
  fVar38 = *(float *)(in_RCX + 0x404);
  local_164 = fVar35;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  if (0.0 < fVar38) {
    fVar36 = fVar39;
    if (fVar38 <= fVar39) {
      fVar36 = fVar38;
    }
    fVar36 = (float)(-(uint)NAN(fVar36) & (uint)fVar39 | ~-(uint)NAN(fVar36) & (uint)fVar36);
    *(float *)(in_RCX + 0x404) = fVar38 - fVar36;
    iVar12 = *(int *)(in_RCX + 0x3d8);
    bVar34 = fVar36 < *(float *)(in_RCX + 0x3dc);
    iVar30 = 0;
    if (bVar34) {
      iVar30 = iVar12;
    }
    fVar37 = 0.0;
    if (bVar34 || iVar12 == 0) {
      fVar37 = *(float *)(in_RCX + 0x3dc) - fVar36;
    }
    fVar39 = fVar39 - fVar36;
    *(int *)(in_RCX + 0x3d8) = iVar30;
    *(float *)(in_RCX + 0x3dc) = fVar37;
    if (fVar38 - fVar36 <= 0.0) {
      *(undefined8 *)(in_RCX + 0x3d8) = 0;
      if (uVar33 != 0) {
        uVar28 = 0;
        piVar24 = piVar26;
        do {
          if (*piVar24 == 7) {
            uVar29 = uVar28 + 1;
            if (uVar29 < uVar33) {
              uVar27 = uVar28 - uVar33;
              uVar19 = uVar28;
              uVar10 = uVar27;
              if ((uVar27 & 1) == 0) {
                if (piVar24[6] != 7) {
                  *(undefined8 *)(piVar24 + 4) = *(undefined8 *)(piVar24 + 10);
                  *(undefined8 *)piVar24 = *(undefined8 *)(piVar24 + 6);
                  *(undefined8 *)(piVar24 + 2) = *(undefined8 *)(piVar24 + 8);
                  uVar19 = uVar28 + 1;
                }
                uVar29 = uVar28 + 2;
                uVar10 = uVar19;
              }
              uVar28 = uVar10;
              if (uVar27 != 0xfffffffffffffffe) {
                piVar24 = piVar26 + uVar29 * 6;
                lVar17 = uVar33 - uVar29;
                uVar28 = uVar19;
                do {
                  if (*piVar24 == 7) {
                    iVar12 = piVar24[6];
                  }
                  else {
                    *(undefined8 *)(piVar26 + uVar28 * 6 + 4) = *(undefined8 *)(piVar24 + 4);
                    uVar23 = *(undefined8 *)(piVar24 + 2);
                    *(undefined8 *)(piVar26 + uVar28 * 6) = *(undefined8 *)piVar24;
                    *(undefined8 *)(piVar26 + uVar28 * 6 + 2) = uVar23;
                    uVar28 = uVar28 + 1;
                    iVar12 = piVar24[6];
                  }
                  if (iVar12 != 7) {
                    *(undefined8 *)(piVar26 + uVar28 * 6 + 4) = *(undefined8 *)(piVar24 + 10);
                    uVar23 = *(undefined8 *)(piVar24 + 8);
                    *(undefined8 *)(piVar26 + uVar28 * 6) = *(undefined8 *)(piVar24 + 6);
                    *(undefined8 *)(piVar26 + uVar28 * 6 + 2) = uVar23;
                    uVar28 = uVar28 + 1;
                  }
                  piVar24 = piVar24 + 0xc;
                  lVar17 = lVar17 + -2;
                } while (lVar17 != 0);
              }
            }
            goto LAB_1454908fc;
          }
          uVar28 = uVar28 + 1;
          piVar24 = piVar24 + 6;
        } while (uVar28 != uVar33);
      }
    }
    else {
      if (bVar34 || iVar12 == 0) {
        *(float *)(in_RCX + 0xf8) = *(float *)(in_RCX + 0xf8) + fVar36;
        fVar36 = *(float *)(in_RCX + 0xfc);
        fVar37 = fVar36;
        if (fVar36 <= fVar38) {
          fVar37 = fVar38;
        }
        *(uint *)(in_RCX + 0xfc) =
             -(uint)NAN(fVar37) & (uint)fVar36 | ~-(uint)NAN(fVar37) & (uint)fVar37;
        goto LAB_14548f735;
      }
      if (uVar33 != 0) {
        uVar28 = 0;
        piVar24 = piVar26;
LAB_14548f5d0:
        if (piVar24[3] != iVar12) goto code_r0x00014548f5da;
        uVar29 = uVar28 + 1;
        if (uVar29 < uVar33) {
          uVar27 = uVar28 - uVar33;
          uVar10 = uVar27;
          uVar19 = uVar28;
          if ((uVar27 & 1) == 0) {
            if (piVar24[9] != iVar12) {
              *(undefined8 *)(piVar24 + 4) = *(undefined8 *)(piVar24 + 10);
              *(undefined8 *)piVar24 = *(undefined8 *)(piVar24 + 6);
              *(undefined8 *)(piVar24 + 2) = *(undefined8 *)(piVar24 + 8);
              uVar19 = uVar28 + 1;
            }
            uVar29 = uVar28 + 2;
            uVar10 = uVar19;
          }
          uVar28 = uVar10;
          if (uVar27 != 0xfffffffffffffffe) {
            piVar24 = piVar26 + uVar29 * 6;
            lVar17 = uVar33 - uVar29;
            uVar28 = uVar19;
            do {
              if (piVar24[3] == iVar12) {
                iVar30 = piVar24[9];
              }
              else {
                *(undefined8 *)(piVar26 + uVar28 * 6 + 4) = *(undefined8 *)(piVar24 + 4);
                uVar23 = *(undefined8 *)(piVar24 + 2);
                *(undefined8 *)(piVar26 + uVar28 * 6) = *(undefined8 *)piVar24;
                *(undefined8 *)(piVar26 + uVar28 * 6 + 2) = uVar23;
                uVar28 = uVar28 + 1;
                iVar30 = piVar24[9];
              }
              if (iVar30 != iVar12) {
                *(undefined8 *)(piVar26 + uVar28 * 6 + 4) = *(undefined8 *)(piVar24 + 10);
                uVar23 = *(undefined8 *)(piVar24 + 8);
                *(undefined8 *)(piVar26 + uVar28 * 6) = *(undefined8 *)(piVar24 + 6);
                *(undefined8 *)(piVar26 + uVar28 * 6 + 2) = uVar23;
                uVar28 = uVar28 + 1;
              }
              piVar24 = piVar24 + 0xc;
              lVar17 = lVar17 + -2;
            } while (lVar17 != 0);
          }
        }
LAB_1454908fc:
        *(ulong *)(in_RCX + 0x300) = uVar28;
      }
    }
LAB_14548f629:
    func_0x00014548d2b0();
    fVar36 = *(float *)(in_RCX + 0xf8) + fVar36;
    fVar37 = *(float *)(in_RCX + 0xfc);
    fVar9 = fVar37;
    if (fVar37 <= fVar38) {
      fVar9 = fVar38;
    }
    fVar37 = (float)(-(uint)NAN(fVar9) & (uint)fVar37 | ~-(uint)NAN(fVar9) & (uint)fVar9);
    *(undefined8 *)(in_RCX + 0xf8) = 0;
    fVar38 = fVar36;
    if (fVar37 <= fVar36) {
      fVar38 = fVar37;
    }
    fVar38 = (float)(-(uint)NAN(fVar38) & (uint)fVar36 | ~-(uint)NAN(fVar38) & (uint)fVar38);
    if ((0.0 < fVar38) && (*(long *)(in_RCX + 0x700) != 0)) {
      uStack_100._4_4_ = *(undefined4 *)(in_RCX + 0x3f0);
      uStack_108._4_4_ = (float)*(undefined8 *)(in_RCX + 1000);
      uStack_100._0_4_ = (undefined4)((ulong)*(undefined8 *)(in_RCX + 1000) >> 0x20);
      uStack_108._0_4_ = 0;
      local_110 = (float *)0x0;
      uStack_f4 = 0x600;
      uStack_f2 = 0;
      local_f0 = 0;
      fStack_f8 = fVar38;
      func_0x0001454b9930();
    }
  }
LAB_14548f735:
  *(float *)(in_RCX + 0x400) = *(float *)(in_RCX + 0x400) - fVar39;
  *(float *)(in_RCX + 0x4bc) = fVar35;
  dVar40 = (double)fVar39;
  *(double *)(in_RCX + 0x618) = *(double *)(in_RCX + 0x618) + dVar40;
  piVar24 = *(int **)(in_RCX + 0x4c8);
  pfVar32 = (float *)0x1469aaf2c;
  lVar17 = 0;
  piVar26 = piVar24;
  do {
    lVar20 = lVar17;
    if (*(long *)(in_RCX + 0x4d0) * 0x160 - lVar20 == 0) {
      piVar24 = (int *)0x4;
      goto LAB_14548f81c;
    }
    piVar25 = piVar26 + 0x22;
    piVar26 = piVar26 + 0x58;
    lVar17 = lVar20 + 0x160;
  } while (*(float **)piVar25 != in_R8);
  if (*(long *)((long)piVar24 + lVar20 + 0x18) == -1) {
    bVar5 = *(byte *)((long)piVar24 + lVar20 + 0x158);
    pfVar18 = (float *)0x1469aaf44;
    if (in_R9B != '\0') {
      pfVar18 = (float *)0x1469aaf4d;
    }
    pfVar32 = (float *)0x1469aa946;
    if (bVar5 == 0) {
      pfVar32 = pfVar18;
    }
    piVar24 = (int *)((ulong)(bVar5 ^ 1) * 4 + 5);
  }
  else {
    pfVar32 = (float *)0x1469aaf30;
    if (in_R9B != '\0') {
      pfVar32 = (float *)0x1469aaf3a;
    }
    piVar24 = (int *)0xa;
  }
LAB_14548f81c:
  pfVar18 = (float *)(in_RCX + 0x620);
  pfVar16 = *(float **)(in_RCX + 0x620);
  local_a9 = in_R9B;
  if (pfVar16 != (float *)0x0) {
    lVar17 = *(long *)(in_RCX + 0x628);
    local_b8 = pfVar18;
    do {
      uVar7 = *(ushort *)((long)pfVar16 + 0x112);
      lVar20 = (ulong)uVar7 << 4;
      uVar33 = 0xffffffffffffffff;
      local_a8 = pfVar16;
      do {
        uVar28 = (ulong)uVar7;
        if (lVar20 == 0) goto LAB_14548f8d0;
        piVar26 = *(int **)(pfVar16 + 2);
        lVar31 = (long)piVar24 - (long)piVar26;
        if (piVar24 < piVar26) {
          piVar26 = piVar24;
        }
        pfVar16 = pfVar16 + 4;
        iVar12 = func_0x000145756dd7();
        if (iVar12 != 0) {
          lVar31 = (long)iVar12;
        }
        uVar33 = uVar33 + 1;
        lVar20 = lVar20 + -0x10;
      } while ((char)((0 < lVar31) - (lVar31 < 0)) == '\x01');
      uVar28 = uVar33;
      if (0 < lVar31 == lVar31 < 0) {
        uStack_108._0_4_ = SUB84(local_a8,0);
        uStack_108._4_4_ = (float)((ulong)local_a8 >> 0x20);
        uStack_100._0_4_ = (undefined4)lVar17;
        uStack_100._4_4_ = (undefined4)((ulong)lVar17 >> 0x20);
        fStack_f8 = (float)uVar33;
        uStack_f4 = (undefined2)(uVar33 >> 0x20);
        uStack_f2 = (undefined2)(uVar33 >> 0x30);
        local_f0 = SUB82(local_b8,0);
        uStack_ee = (undefined2)((ulong)local_b8 >> 0x10);
        uStack_ec = (undefined4)((ulong)local_b8 >> 0x20);
        local_110 = (float *)0x0;
        goto LAB_14548f91b;
      }
LAB_14548f8d0:
      bVar34 = lVar17 == 0;
      lVar17 = lVar17 + -1;
      if (bVar34) goto LAB_1454905d0;
      pfVar16 = *(float **)(local_a8 + uVar28 * 2 + 0x46);
    } while( true );
  }
  uStack_108._0_4_ = SUB84(piVar24,0);
  uStack_108._4_4_ = 0.0;
  fStack_f8 = 0.0;
  uStack_f4 = 0;
  uStack_f2 = 0;
  local_110 = pfVar32;
  goto LAB_14548f93d;
code_r0x00014548f5da:
  uVar28 = uVar28 + 1;
  piVar24 = piVar24 + 6;
  if (uVar28 == uVar33) goto LAB_14548f629;
  goto LAB_14548f5d0;
LAB_1454905d0:
  fStack_f8 = SUB84(local_a8,0);
  uStack_f4 = (undefined2)((ulong)local_a8 >> 0x20);
  uStack_f2 = (undefined2)((ulong)local_a8 >> 0x30);
  local_f0 = 0;
  uStack_ee = 0;
  uStack_ec = 0;
  uStack_e8 = (undefined4)uVar28;
  uStack_e4 = (undefined4)(uVar28 >> 0x20);
  uStack_108._0_4_ = SUB84(piVar24,0);
  uStack_108._4_4_ = (float)((ulong)piVar24 >> 0x20);
  uStack_100._0_4_ = SUB84(local_b8,0);
  uStack_100._4_4_ = (undefined4)((ulong)local_b8 >> 0x20);
  local_110 = pfVar32;
LAB_14548f91b:
  pfVar18 = (float *)CONCAT44(uStack_100._4_4_,(undefined4)uStack_100);
LAB_14548f93d:
  uStack_100 = pfVar18;
  pdVar14 = (double *)func_0x0001454276d0();
  *pdVar14 = dVar40 + *pdVar14;
  uVar33 = *(ulong *)(in_RCX + 0x300);
  if (uVar33 == 0) {
LAB_14548fa50:
    if (((in_R8 != (float *)0x0) && (local_a9 != '\0')) && (*(char *)(in_RCX + 0x95f) == '\x01')) {
LAB_14548fa70:
      uVar33 = *(ulong *)(in_RCX + 0x6d0);
      if (uVar33 != 0) {
        lVar17 = *(long *)(in_RCX + 0x6c8);
        fVar35 = _DAT_1458f667c;
        if (uVar33 == 1) {
          uVar28 = 0;
LAB_14548faea:
          if (*(char *)(lVar17 + uVar28 * 8) == '\x16') {
            fVar35 = fVar35 + *(float *)(lVar17 + 4 + uVar28 * 8);
          }
        }
        else {
          uVar28 = 0;
          do {
            if (*(char *)(lVar17 + uVar28 * 8) == '\x16') {
              fVar35 = fVar35 + *(float *)(lVar17 + 4 + uVar28 * 8);
              cVar11 = *(char *)(lVar17 + 8 + uVar28 * 8);
            }
            else {
              cVar11 = *(char *)(lVar17 + 8 + uVar28 * 8);
            }
            if (cVar11 == '\x16') {
              fVar35 = fVar35 + *(float *)(lVar17 + 0xc + uVar28 * 8);
            }
            uVar28 = uVar28 + 2;
          } while ((uVar33 & 0xfffffffffffffffe) != uVar28);
          if ((uVar33 & 1) != 0) goto LAB_14548faea;
        }
        if ((0.0 < param_2) && (0.0 < fVar35)) {
          uVar6 = *(undefined1 *)(in_RCX + 0x111);
          *(undefined1 *)(in_RCX + 0x111) = 3;
          func_0x0001454c2eb0();
          *(undefined1 *)(in_RCX + 0x111) = uVar6;
        }
      }
      uStack_100._4_4_ = *(undefined4 *)(in_RCX + 0x3f0);
      uStack_108._4_4_ = (float)*(undefined8 *)(in_RCX + 1000);
      uStack_100._0_4_ = (undefined4)((ulong)*(undefined8 *)(in_RCX + 1000) >> 0x20);
      uStack_130 = 0;
      uStack_12c = (undefined4)*(undefined8 *)(in_RCX + 1000);
      uStack_128 = (undefined4)((ulong)*(undefined8 *)(in_RCX + 1000) >> 0x20);
      uStack_124 = *(undefined4 *)(in_RCX + 0x3f0);
      uStack_11c = 0x400;
      local_118 = 0;
      local_138 = in_R8;
      fStack_120 = fVar39;
      func_0x0001454b9930();
      uStack_108._0_4_ = 0;
      uStack_f4 = 0x500;
      uStack_f2 = 0;
      local_f0 = 0;
      piVar26 = (int *)0x0;
      local_110 = in_R8;
      fStack_f8 = fVar39;
      func_0x0001454b9930();
    }
  }
  else {
    piVar24 = *(int **)(in_RCX + 0x2f8);
    fVar38 = _DAT_1458f667c;
    if (uVar33 == 1) {
      piVar25 = (int *)0x0;
LAB_14548f9e5:
      piVar26 = (int *)((long)piVar25 * 3);
      if ((fVar35 < (float)piVar24[(long)piVar25 * 6 + 4]) &&
         (piVar26 = piVar24 + (long)piVar25 * 6, *piVar26 == 0xc)) {
        fVar38 = fVar38 + (float)piVar26[1];
      }
    }
    else {
      piVar25 = (int *)0x0;
      piVar26 = piVar24;
      do {
        if ((fVar35 < (float)piVar26[4]) && (*piVar26 == 0xc)) {
          fVar38 = fVar38 + (float)piVar26[1];
        }
        if ((fVar35 < (float)piVar26[10]) && (piVar26[6] == 0xc)) {
          fVar38 = fVar38 + (float)piVar26[7];
        }
        piVar25 = (int *)((long)piVar25 + 2);
        piVar26 = piVar26 + 0xc;
      } while ((int *)(uVar33 & 0xfffffffffffffffe) != piVar25);
      piVar26 = piVar25;
      if ((uVar33 & 1) != 0) goto LAB_14548f9e5;
    }
    if (fVar38 <= 0.0) goto LAB_14548fa50;
    piVar26 = (int *)CONCAT71((int7)((ulong)piVar26 >> 8),in_R8 == (float *)0x0);
    if (local_a9 == '\x01' && in_R8 != (float *)0x0) {
      piVar25 = (int *)0x0;
      do {
        if ((int *)(uVar33 * 0x18) == piVar25) break;
        piVar26 = piVar25 + 6;
        piVar1 = (int *)((long)piVar24 + (long)piVar25);
        piVar25 = piVar26;
      } while (*piVar1 != 0xc);
      func_0x0001454c2eb0();
      if (*(char *)(in_RCX + 0x95f) != '\x01') goto LAB_14548fbca;
      goto LAB_14548fa70;
    }
  }
LAB_14548fbca:
  fVar35 = *(float *)(in_RCX + 0x400);
  if (*(char *)(in_RCX + 0x95a) != '\0') {
    if (fVar35 <= _DAT_1458eb480) {
      fVar35 = _DAT_1458eb480;
    }
    *(float *)(in_RCX + 0x400) = fVar35;
  }
  fVar38 = 0.0;
  if (fVar35 <= 0.0) {
    if (((*(float **)(in_RCX + 0x378))[0x1a] == 1.54143e-44) && (*(float *)(in_RCX + 900) <= 0.0)) {
      uStack_108._0_4_ = *(undefined4 *)(in_RCX + 0x380);
      fStack_f8 = *(float *)(in_RCX + 0x390);
      local_dc = *(undefined4 *)(in_RCX + 0x3ac);
      uStack_ec = (undefined4)*(undefined8 *)(in_RCX + 0x39c);
      uStack_e8 = (undefined4)((ulong)*(undefined8 *)(in_RCX + 0x39c) >> 0x20);
      uStack_e4 = (undefined4)*(undefined8 *)(in_RCX + 0x3a4);
      uStack_e0 = (undefined4)((ulong)*(undefined8 *)(in_RCX + 0x3a4) >> 0x20);
      uStack_d8 = *(undefined4 *)(in_RCX + 0x3b0);
      uStack_d4 = *(undefined4 *)(in_RCX + 0x3b4);
      uStack_d0 = *(undefined4 *)(in_RCX + 0x3b8);
      uStack_c4 = *(undefined8 *)(in_RCX + 0x3c4);
      _local_cc = CONCAT44((int)((ulong)*(undefined8 *)(in_RCX + 0x3bc) >> 0x20),
                           *(undefined4 *)(in_RCX + 0x3bc));
      uStack_100._0_4_ = (undefined4)*(undefined8 *)(in_RCX + 0x388);
      uStack_100._4_4_ = (undefined4)((ulong)*(undefined8 *)(in_RCX + 0x388) >> 0x20);
      uVar23 = *(undefined8 *)(in_RCX + 0x394);
      uStack_f4 = (undefined2)uVar23;
      uStack_f2 = (undefined2)((ulong)uVar23 >> 0x10);
      local_f0 = (undefined2)((ulong)uVar23 >> 0x20);
      uStack_ee = (undefined2)((ulong)uVar23 >> 0x30);
      *(undefined4 *)(in_RCX + 0x400) = 0x3f800000;
      local_110 = *(float **)(in_RCX + 0x378);
      uStack_108._4_4_ = *(float *)(in_RCX + 900);
      cVar11 = func_0x0001454e7a20();
      if (cVar11 != '\0') {
        fVar35 = *(float *)(*(long *)(in_RCX + 0x378) + 0x48) * _DAT_1458f8d40 *
                 *(float *)(in_RCX + 0x38c) * *(float *)(in_RCX + 0x3b4) *
                 *(float *)(in_RCX + 0x460);
        if (fVar35 <= _DAT_1458ed010) {
          fVar35 = _DAT_1458ed010;
        }
        *(float *)(in_RCX + 900) = fVar35;
        fVar35 = fVar35 * _DAT_145930f10;
        uVar22 = 0;
        if (0.0 <= fVar35) {
          uVar22 = (undefined4)(long)fVar35;
        }
        fVar39 = *(float *)(*(long *)(in_RCX + 0x378) + 0x40);
        uVar13 = 0xffffffff;
        if (fVar35 <= _DAT_1458eb51c) {
          uVar13 = uVar22;
        }
        local_148 = CONCAT44(uVar13,fVar39);
        func_0x000145442f60(in_RCX + 0x538);
        lVar17 = *(long *)(in_RCX + 0x548);
        piVar26 = piVar21;
        if (lVar17 == *(long *)(in_RCX + 0x538)) {
          func_0x0001457580b0();
          piVar26 = piVar21;
        }
        lVar20 = *(long *)(in_RCX + 0x540);
        puVar3 = (undefined4 *)(lVar20 + 0x10 + lVar17 * 0x20);
        *puVar3 = uStack_128;
        puVar3[1] = uStack_124;
        puVar3[2] = fStack_120;
        puVar3[3] = uStack_11c;
        puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
        *puVar2 = local_138;
        puVar2[1] = CONCAT44(uStack_12c,uStack_130);
        *(long *)(in_RCX + 0x548) = lVar17 + 1;
        uVar23 = *(undefined8 *)(in_RCX + 0x3d0);
        func_0x000140002200();
        pfVar32 = (float *)func_0x0001400021c0();
        if (pfVar32 == (float *)0x0) {
          func_0x0001458e721b();
                    /* WARNING: Does not return */
          pcVar8 = (code *)invalidInstructionException();
          (*pcVar8)();
        }
        *pfVar32 = fVar39;
        *(undefined8 *)(pfVar32 + 1) = uVar23;
        lVar17 = *(long *)(in_RCX + 0x548);
        local_a8 = pfVar32;
        if (lVar17 == *(long *)(in_RCX + 0x538)) {
          func_0x0001457580b0();
        }
        lVar20 = *(long *)(in_RCX + 0x540);
        lVar31 = lVar17 * 0x20;
        *(undefined8 *)(lVar20 + lVar31) = 0x20;
        *(float **)(lVar20 + 8 + lVar31) = local_a8;
        *(undefined8 *)(lVar20 + 0x10 + lVar31) = 0xc;
        *(undefined2 *)(lVar20 + 0x18 + lVar31) = 0x135;
        *(long *)(in_RCX + 0x548) = lVar17 + 1;
        goto LAB_14548fbfd;
      }
      *(float *)(in_RCX + 0x400) = fVar35;
    }
    fVar35 = *(float *)(in_RCX + 0x8e4);
    lVar17 = *(long *)(in_RCX + 0x700);
    if (lVar17 != 0) {
      pcVar15 = *(char **)(in_RCX + 0x6f8);
      if (*pcVar15 == '\x13') {
LAB_145490046:
        if (*(float *)(in_RCX + 0x100) <= fVar35) {
          fVar39 = *(float *)(pcVar15 + 0xc);
          fVar36 = *(float *)(pcVar15 + 8);
          *(float *)(in_RCX + 0x100) = *(float *)(pcVar15 + 4) + fVar35;
          *(float *)(in_RCX + 0x400) = fVar36 * *(float *)(in_RCX + 0x458);
          func_0x00014570c440();
          if (fVar39 <= 0.0) {
            local_150 = *(undefined8 *)(in_RCX + 0x3d0);
            local_148 = CONCAT44(local_148._4_4_,2);
            local_160 = (ulong)local_160._4_4_ << 0x20;
            func_0x00014544b1a0();
            lVar17 = *(long *)(in_RCX + 0x548);
            if (lVar17 == *(long *)(in_RCX + 0x538)) {
              func_0x0001457580b0();
            }
            lVar20 = *(long *)(in_RCX + 0x540);
            plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
            *plVar4 = (long)uStack_100;
            *(float *)(plVar4 + 1) = fStack_f8;
            *(uint *)((long)plVar4 + 0xc) = CONCAT22(uStack_f2,uStack_f4);
            puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
            *puVar2 = local_110;
            puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
            *(long *)(in_RCX + 0x548) = lVar17 + 1;
            func_0x000145452400(CONCAT44(uStack_12c,uStack_130),0x13,0x13,0x1469ab330);
            func_0x00014543f640();
            lVar17 = *(long *)(in_RCX + 0x548);
            if (lVar17 == *(long *)(in_RCX + 0x538)) {
              func_0x0001457580b0();
            }
            lVar20 = *(long *)(in_RCX + 0x540);
            plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
            *plVar4 = (long)uStack_100;
            *(float *)(plVar4 + 1) = fStack_f8;
            *(uint *)((long)plVar4 + 0xc) = CONCAT22(uStack_f2,uStack_f4);
            puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
            *puVar2 = local_110;
            puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
            *(long *)(in_RCX + 0x548) = lVar17 + 1;
            uStack_100._4_4_ = *(undefined4 *)(in_RCX + 0x3f0);
            uStack_108._4_4_ = (float)*(undefined8 *)(in_RCX + 1000);
            uStack_100._0_4_ = (undefined4)((ulong)*(undefined8 *)(in_RCX + 1000) >> 0x20);
            uStack_108._0_4_ = 0;
            uStack_f4 = 0x700;
            local_110 = (float *)0x0;
            fStack_f8 = 0.0;
            uStack_f2 = 0;
            local_f0 = 0;
            piVar26 = (int *)0x0;
            func_0x0001454b9930();
          }
          else {
            local_150 = *(undefined8 *)(in_RCX + 0x3d0);
            local_148 = CONCAT44(local_148._4_4_,2);
            local_160 = (ulong)local_160._4_4_ << 0x20;
            func_0x00014544b1a0();
            lVar17 = *(long *)(in_RCX + 0x548);
            if (lVar17 == *(long *)(in_RCX + 0x538)) {
              func_0x0001457580b0();
            }
            lVar20 = *(long *)(in_RCX + 0x540);
            plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
            *plVar4 = (long)uStack_100;
            *(float *)(plVar4 + 1) = fStack_f8;
            *(uint *)((long)plVar4 + 0xc) = CONCAT22(uStack_f2,uStack_f4);
            puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
            *puVar2 = local_110;
            puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
            *(long *)(in_RCX + 0x548) = lVar17 + 1;
            lVar17 = *(long *)(in_RCX + 0x300);
            if (lVar17 == *(long *)(in_RCX + 0x2f0)) {
              func_0x000145763c20();
            }
            lVar20 = *(long *)(in_RCX + 0x2f8);
            *(undefined4 *)(lVar20 + lVar17 * 0x18) = 0xb;
            *(undefined4 *)(lVar20 + 0xc + lVar17 * 0x18) = 0x740;
            *(float *)(lVar20 + 0x10 + lVar17 * 0x18) = fVar35 + fVar39;
            *(undefined4 *)(lVar20 + 0x14 + lVar17 * 0x18) = 0;
            *(long *)(in_RCX + 0x300) = lVar17 + 1;
            func_0x00014548d2b0();
            piVar26 = (int *)CONCAT44(uStack_124,uStack_128);
            func_0x000145452400(CONCAT44(uStack_12c,uStack_130),0x10,0x10,0x1469ab343);
            func_0x00014543f640();
            lVar17 = *(long *)(in_RCX + 0x548);
            if (lVar17 == *(long *)(in_RCX + 0x538)) {
              func_0x0001457580b0();
            }
            lVar20 = *(long *)(in_RCX + 0x540);
            plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
            *plVar4 = (long)uStack_100;
            plVar4[1] = CONCAT26(uStack_f2,CONCAT24(uStack_f4,fStack_f8));
            puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
            *puVar2 = local_110;
            puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
            *(long *)(in_RCX + 0x548) = lVar17 + 1;
          }
          if (local_138 != (float *)0x0) {
            piVar26 = (int *)0x1;
            func_0x0001400021d0();
          }
          goto LAB_14548fbfd;
        }
      }
      else if (lVar17 != 1) {
        lVar17 = lVar17 * 0x40 + -0x40;
        do {
          pcVar15 = pcVar15 + 0x40;
          if (*pcVar15 == '\x13') goto LAB_145490046;
          lVar17 = lVar17 + -0x40;
        } while (lVar17 != 0);
      }
    }
    if (*(int *)(in_RCX + 0x4a8) == 0) {
      *(undefined4 *)(in_RCX + 0x400) = 0;
      *(undefined1 *)(in_RCX + 0x95f) = 4;
      *(undefined4 *)(in_RCX + 0x860) = 1;
      *(float *)(in_RCX + 0x864) = fVar35;
      func_0x000145492fd0();
      piVar26 = (int *)0x1469ab018;
      func_0x0001454b6620();
      lVar17 = *(long *)(in_RCX + 0x560);
      if (lVar17 == *(long *)(in_RCX + 0x550)) {
        local_a8 = local_110;
        local_b8 = (float *)CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
        func_0x000145757f60();
      }
      lVar20 = *(long *)(in_RCX + 0x558);
      *(float **)(lVar20 + 0x10 + lVar17 * 0x18) = uStack_100;
      puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x18);
      *puVar2 = local_110;
      puVar2[1] = uStack_108;
      *(long *)(in_RCX + 0x560) = lVar17 + 1;
    }
    else {
      *(int *)(in_RCX + 0x4a8) = *(int *)(in_RCX + 0x4a8) + -1;
      *(float *)(in_RCX + 0x400) = *(float *)(in_RCX + 0x458) * _DAT_1458eb488;
      local_160 = *(long *)(in_RCX + 0x3d0);
      local_138 = (float *)CONCAT44(local_138._4_4_,2);
      local_148 = local_148 & 0xffffffff00000000;
      func_0x00014544b1a0();
      lVar17 = *(long *)(in_RCX + 0x548);
      if (lVar17 == *(long *)(in_RCX + 0x538)) {
        func_0x0001457580b0();
      }
      lVar20 = *(long *)(in_RCX + 0x540);
      plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
      *plVar4 = (long)uStack_100;
      *(float *)(plVar4 + 1) = fStack_f8;
      *(uint *)((long)plVar4 + 0xc) = CONCAT22(uStack_f2,uStack_f4);
      puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
      *puVar2 = local_110;
      puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
      *(long *)(in_RCX + 0x548) = lVar17 + 1;
      func_0x00014570c440();
      local_a8 = (float *)CONCAT44(uStack_12c,uStack_130);
      piVar26 = (int *)CONCAT44(uStack_124,uStack_128);
      func_0x000145452400();
      func_0x00014543f640();
      lVar17 = *(long *)(in_RCX + 0x548);
      if (lVar17 == *(long *)(in_RCX + 0x538)) {
        func_0x0001457580b0();
      }
      lVar20 = *(long *)(in_RCX + 0x540);
      plVar4 = (long *)(lVar20 + 0x10 + lVar17 * 0x20);
      *plVar4 = (long)uStack_100;
      *(float *)(plVar4 + 1) = fStack_f8;
      *(uint *)((long)plVar4 + 0xc) = CONCAT22(uStack_f2,uStack_f4);
      puVar2 = (undefined8 *)(lVar20 + lVar17 * 0x20);
      *puVar2 = local_110;
      puVar2[1] = CONCAT44(uStack_108._4_4_,(undefined4)uStack_108);
      *(long *)(in_RCX + 0x548) = lVar17 + 1;
      if (local_138 != (float *)0x0) {
        piVar26 = (int *)0x1;
        func_0x0001400021d0();
      }
      local_140 = *(undefined4 *)(in_RCX + 0x3f0);
      local_148 = *(ulong *)(in_RCX + 1000);
      local_110 = *(float **)(in_RCX + 0x4c8);
      uStack_108 = local_110 + *(long *)(in_RCX + 0x4d0) * 0x58;
      uStack_100 = &local_164;
      fStack_f8 = SUB84(piVar21,0);
      uStack_f4 = (undefined2)((ulong)piVar21 >> 0x20);
      uStack_f2 = (undefined2)((ulong)piVar21 >> 0x30);
      func_0x000145531620();
      local_b8 = local_138;
      local_a8 = (float *)CONCAT44(uStack_12c,uStack_130);
      lVar17 = CONCAT44(uStack_124,uStack_128) << 3;
      lVar20 = 0;
      while (lVar17 != lVar20) {
        lVar20 = lVar20 + 8;
        func_0x0001454c2eb0();
      }
      if (local_b8 != (float *)0x0) {
        piVar26 = (int *)0x8;
        func_0x0001400021d0();
      }
    }
  }
LAB_14548fbfd:
  fVar35 = (float)func_0x000145756e6d();
  uVar22 = 0;
  piVar21 = (int *)((long)fVar35 & 0xffffffff);
  if (fVar35 < fVar38) {
    piVar21 = (int *)0x0;
  }
  if (_DAT_1458eb51c < fVar35) {
    piVar21 = (int *)0xffffffff;
  }
  fVar35 = _DAT_1458eb51c;
  fVar39 = (float)func_0x000145756e6d();
  uVar13 = (int)(long)fVar39;
  if (fVar39 < fVar38) {
    uVar13 = uVar22;
  }
  if (fVar35 < fVar39) {
    uVar13 = 0xffffffff;
  }
  plVar4 = (long *)(in_RCX + 0x8b8);
  lVar17 = *(long *)(in_RCX + 0x8b8);
  if (lVar17 != 0) {
    lVar20 = *(long *)(in_RCX + 0x8c0);
    do {
      uVar33 = (ulong)((uint)*(ushort *)(lVar17 + 0x36) * 2);
      piVar24 = (int *)0xffffffffffffffff;
      do {
        piVar26 = (int *)(ulong)*(ushort *)(lVar17 + 0x36);
        if (uVar33 == 0) goto LAB_14548fcbe;
        uVar7 = *(ushort *)(lVar17 + 0x3a + (long)piVar24 * 2);
        piVar26 = (int *)((long)piVar24 + 1);
        uVar33 = uVar33 - 2;
        piVar24 = piVar26;
      } while ((char)((uVar7 < 0x16) - (0x16 < uVar7)) == '\x01');
      if (uVar7 < 0x16 == 0x16 < uVar7) {
        *(int *)(lVar17 + 8 + (long)piVar26 * 4) = (int)piVar21;
        lVar17 = *plVar4;
        if (lVar17 != 0) goto LAB_14548fce0;
        goto LAB_14548ffa8;
      }
LAB_14548fcbe:
      bVar34 = lVar20 == 0;
      lVar20 = lVar20 + -1;
      if (bVar34) goto LAB_14548ff70;
      lVar17 = *(long *)(lVar17 + 0x50 + (long)piVar26 * 8);
    } while( true );
  }
  lVar17 = 0;
LAB_14548ff70:
  uStack_108._0_4_ = (undefined4)lVar17;
  uStack_108._4_4_ = (float)((ulong)lVar17 >> 0x20);
  uStack_100._0_4_ = 0;
  uStack_100._4_4_ = 0;
  fStack_f8 = SUB84(piVar26,0);
  uStack_f4 = (undefined2)((ulong)piVar26 >> 0x20);
  uStack_f2 = (undefined2)((ulong)piVar26 >> 0x30);
  local_f0 = 0x16;
  uStack_ee = 0;
  uStack_ec = 0;
  local_110 = (float *)plVar4;
  func_0x000145427a50();
  lVar17 = *plVar4;
  piVar26 = piVar21;
  if (lVar17 == 0) {
LAB_14548ffa8:
    lVar17 = 0;
LAB_14548ffaa:
    uStack_108._0_4_ = (undefined4)lVar17;
    uStack_108._4_4_ = (float)((ulong)lVar17 >> 0x20);
    uStack_100._0_4_ = 0;
    uStack_100._4_4_ = 0;
    fStack_f8 = SUB84(piVar26,0);
    uStack_f4 = (undefined2)((ulong)piVar26 >> 0x20);
    uStack_f2 = (undefined2)((ulong)piVar26 >> 0x30);
    local_f0 = 0x1c;
    uStack_ee = 0;
    uStack_ec = 0;
    local_110 = (float *)plVar4;
    func_0x000145427a50();
    return;
  }
LAB_14548fce0:
  lVar20 = *(long *)(in_RCX + 0x8c0);
  do {
    uVar33 = (ulong)((uint)*(ushort *)(lVar17 + 0x36) * 2);
    piVar21 = (int *)0xffffffffffffffff;
    do {
      piVar26 = (int *)(ulong)*(ushort *)(lVar17 + 0x36);
      if (uVar33 == 0) goto LAB_14548fd2e;
      uVar7 = *(ushort *)(lVar17 + 0x3a + (long)piVar21 * 2);
      piVar26 = (int *)((long)piVar21 + 1);
      uVar33 = uVar33 - 2;
      piVar21 = piVar26;
    } while ((char)((uVar7 < 0x1c) - (0x1c < uVar7)) == '\x01');
    if (uVar7 < 0x1c == 0x1c < uVar7) {
      *(undefined4 *)(lVar17 + 8 + (long)piVar26 * 4) = uVar13;
      return;
    }
LAB_14548fd2e:
    bVar34 = lVar20 == 0;
    lVar20 = lVar20 + -1;
    if (bVar34) goto LAB_14548ffaa;
    lVar17 = *(long *)(lVar17 + 0x50 + (long)piVar26 * 8);
  } while( true );
}
