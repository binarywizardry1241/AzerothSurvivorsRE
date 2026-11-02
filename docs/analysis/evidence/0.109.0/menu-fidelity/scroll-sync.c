/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  long *plVar2;
  char *pcVar3;
  char cVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  uint uVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  int *piVar14;
  undefined8 uVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  ulong uVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  ulong uVar27;
  long lVar28;
  ulong uVar29;
  ulong uVar30;
  uint *puVar31;
  int *piVar32;
  long lVar33;
  long lVar34;
  long lVar35;
  long lVar36;
  long lVar37;
  long lVar38;
  int iVar39;
  bool bVar40;
  undefined8 uVar41;
  undefined4 uVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  undefined4 uVar46;
  float fVar47;
  float fVar48;
  undefined4 uVar49;
  undefined8 *in_stack_00000028;
  long local_168;
  long local_160;
  long local_138;
  long local_130;
  long local_118;
  long local_108;

  fVar26 = _DAT_145de4d50;
  fVar25 = _DAT_145de4d3c;
  fVar24 = _DAT_145dd4ac8;
  fVar23 = _DAT_145dd4a40;
  fVar22 = _DAT_145dd49c4;
  fVar21 = _DAT_145d9d2d0;
  fVar20 = _DAT_145d9d2a0;
  lVar8 = *param_3;
  lVar9 = param_3[1];
  uVar5 = *(undefined4 *)((long)param_3 + 0x14);
  lVar10 = *param_5;
  lVar11 = param_5[1];
  uVar6 = *(undefined4 *)((long)param_5 + 0x14);
  lVar12 = *param_6;
  lVar13 = param_6[1];
  piVar14 = (int *)*in_stack_00000028;
  puVar31 = *(uint **)(lVar8 + 0xf8);
  puVar1 = puVar31 + *(long *)(lVar8 + 0x100);
  cVar4 = *(char *)(lVar8 + 0x108);
  lVar38 = 0;
  local_108 = 8;
  uVar46 = (undefined4)_DAT_145de4d40;
  uVar19 = (ulong)_DAT_145de4d40 >> 0x20;
  local_168 = 0;
  local_138 = 0;
  local_160 = 0;
  uVar27 = 0;
  do {
    do {
      do {
        if (cVar4 == '\0') {
          if ((int)uVar27 == (int)lVar38) {
            do {
              if (puVar31 == puVar1) {
                return;
              }
              uVar7 = *puVar31;
              puVar31 = puVar31 + 1;
              lVar38 = *(long *)(*(long *)(lVar9 + 0x108) + 0x58 + (ulong)uVar7 * 0xa0);
            } while (lVar38 == 0);
            lVar36 = *(long *)(lVar9 + 0x108) + (ulong)uVar7 * 0xa0;
            uVar27 = (ulong)*(uint *)(lVar36 + 0x94);
            lVar28 = *(long *)(lVar9 + 0x1a8);
            lVar33 = lVar28 + uVar27 * 0x48;
            lVar34 = *(long *)(lVar28 + 0x38 + uVar27 * 0x48);
            uVar27 = *(ulong *)(lVar28 + 0x40 + uVar27 * 0x48);
            if (*(ulong *)(lVar8 + 0x110) < uVar27) {
              uVar30 = *(ulong *)(lVar34 + *(ulong *)(lVar8 + 0x110) * 8);
              lVar33 = *(long *)(lVar33 + 0x18);
              if (uVar30 == 0) {
                uVar30 = *(ulong *)(lVar8 + 0x120);
                goto joined_r0x000140196753;
              }
              local_160 = *(long *)(lVar33 + 0x10 + ~uVar30 * 0x30);
              uVar30 = *(ulong *)(lVar8 + 0x120);
              if (uVar30 < uVar27) goto LAB_1401967e6;
LAB_140196806:
              local_168 = 0;
            }
            else {
              lVar33 = *(long *)(lVar33 + 0x18);
              uVar30 = *(ulong *)(lVar8 + 0x120);
joined_r0x000140196753:
              local_160 = 0;
              if (uVar27 <= uVar30) goto LAB_140196806;
LAB_1401967e6:
              uVar27 = *(ulong *)(lVar34 + uVar30 * 8);
              if (uVar27 == 0) goto LAB_140196806;
              local_168 = *(long *)(lVar33 + 0x10 + ~uVar27 * 0x30);
            }
            lVar28 = ~*(ulong *)(lVar34 + *(long *)(lVar8 + 0x118) * 8) * 0x30;
            local_138 = *(long *)(lVar33 + 0x10 + lVar28);
            local_118 = *(long *)(lVar33 + 0x28 + lVar28);
            local_108 = *(long *)(lVar36 + 0x50);
            uVar27 = 0;
          }
          iVar39 = (int)uVar27;
          uVar27 = (ulong)~*(uint *)(local_108 + 8 + uVar27 * 0x10);
        }
        else {
          if ((int)uVar27 == (int)lVar38) {
            do {
              if (puVar31 == puVar1) {
                return;
              }
              uVar7 = *puVar31;
              puVar31 = puVar31 + 1;
              lVar38 = *(long *)(*(long *)(lVar9 + 0x1a8) + 0x10 + (ulong)uVar7 * 0x48);
            } while (lVar38 == 0);
            lVar33 = *(long *)(lVar9 + 0x1a8) + (ulong)uVar7 * 0x48;
            lVar28 = *(long *)(lVar33 + 0x38);
            uVar27 = *(ulong *)(lVar33 + 0x40);
            if (*(ulong *)(lVar8 + 0x110) < uVar27) {
              uVar30 = *(ulong *)(lVar28 + *(ulong *)(lVar8 + 0x110) * 8);
              lVar33 = *(long *)(lVar33 + 0x18);
              if (uVar30 == 0) {
                uVar30 = *(ulong *)(lVar8 + 0x120);
                goto joined_r0x000140196738;
              }
              local_160 = *(long *)(lVar33 + 0x10 + ~uVar30 * 0x30);
              uVar30 = *(ulong *)(lVar8 + 0x120);
              if (uVar30 < uVar27) goto LAB_140196773;
LAB_140196793:
              local_168 = 0;
            }
            else {
              lVar33 = *(long *)(lVar33 + 0x18);
              uVar30 = *(ulong *)(lVar8 + 0x120);
joined_r0x000140196738:
              local_160 = 0;
              if (uVar27 <= uVar30) goto LAB_140196793;
LAB_140196773:
              uVar27 = *(ulong *)(lVar28 + uVar30 * 8);
              if (uVar27 == 0) goto LAB_140196793;
              local_168 = *(long *)(lVar33 + 0x10 + ~uVar27 * 0x30);
            }
            lVar28 = ~*(ulong *)(lVar28 + *(long *)(lVar8 + 0x118) * 8) * 0x30;
            local_138 = *(long *)(lVar33 + 0x10 + lVar28);
            local_118 = *(long *)(lVar33 + 0x28 + lVar28);
            uVar27 = 0;
          }
          iVar39 = (int)uVar27;
        }
        plVar2 = (long *)(local_160 + uVar27 * 8);
        pcVar3 = (char *)(local_138 + uVar27);
        lVar33 = uVar27 * 4;
        lVar28 = local_168 + uVar27 * 0x18;
        uVar27 = (ulong)(iVar39 + 1);
        lVar34 = *plVar2;
        uVar30 = (ulong)~(uint)lVar34;
        piVar32 = (int *)(uVar30 * 0x18 + *(long *)(lVar13 + 8));
        if (*(ulong *)(lVar13 + 0x10) <= uVar30) {
          piVar32 = (int *)&DAT_145de5448;
        }
      } while ((piVar32[4] != (int)((ulong)lVar34 >> 0x20)) || (*piVar32 == 0));
      uVar30 = *(ulong *)(piVar32 + 1);
    } while ((*(ulong *)(lVar12 + 0x38) <= uVar30 >> 0x20) ||
            ((*(ulong *)(*(long *)(lVar12 + 0x28) + (uVar30 >> 0x26) * 8) >> (uVar30 >> 0x20 & 0x3f)
             & 1) == 0));
    uVar29 = (ulong)(uint)piVar32[3];
    lVar36 = *(long *)(lVar13 + 0x1a8);
    lVar34 = lVar36 + uVar29 * 0x48;
    lVar35 = *(long *)(lVar36 + 0x38 + uVar29 * 0x48);
    if (*(ulong *)(lVar12 + 0x110) < *(ulong *)(lVar36 + 0x40 + uVar29 * 0x48)) {
      uVar29 = *(ulong *)(lVar35 + *(ulong *)(lVar12 + 0x110) * 8);
      lVar34 = *(long *)(lVar34 + 0x18);
      if (uVar29 == 0) goto LAB_14019695e;
      lVar36 = *(long *)(lVar34 + 0x10 + ~uVar29 * 0x30);
    }
    else {
      lVar34 = *(long *)(lVar34 + 0x18);
LAB_14019695e:
      lVar36 = 0;
    }
    lVar34 = *(long *)(lVar34 + 0x10 + ~*(ulong *)(lVar35 + *(long *)(lVar12 + 0x118) * 8) * 0x30);
    lVar35 = (ulong)~(uint)uVar30 * 0x68;
    fVar44 = *(float *)(lVar34 + 100 + lVar35);
    fVar43 = *(float *)(lVar34 + 0x34 + lVar35) * fVar44;
    fVar44 = fVar44 * *(float *)(lVar34 + 0x3c + lVar35);
    fVar47 = fVar44 - fVar43;
    if (fVar47 <= 0.0) {
      fVar47 = 0.0;
    }
    if ((bool)*pcVar3 != fVar47 <= fVar20) {
      *(undefined4 *)(local_118 + lVar33) = uVar5;
      *pcVar3 = fVar47 <= fVar20;
    }
    if (fVar44 <= fVar20) {
      fVar44 = fVar20;
    }
    fVar43 = fVar43 / fVar44;
    fVar44 = fVar24;
    if (fVar24 <= fVar43) {
      fVar44 = fVar43;
    }
    fVar43 = fVar20;
    if (fVar44 <= fVar20) {
      fVar43 = fVar44;
    }
    fVar44 = 0.0;
    if (0.0 < fVar47) {
      fVar47 = *(float *)(lVar36 + 4 + (ulong)~(uint)uVar30 * 8) / fVar47;
      fVar44 = 0.0;
      if (0.0 <= fVar47) {
        fVar44 = fVar47;
      }
      fVar47 = fVar20;
      if (fVar44 <= fVar20) {
        fVar47 = fVar44;
      }
      fVar44 = (fVar20 - fVar43) * fVar47 * fVar21;
    }
    iVar39 = *piVar14;
    if (iVar39 == 0) {
      bVar40 = false;
      lVar33 = *(long *)(lVar28 + 0x10);
    }
    else {
      bVar40 = CONCAT44(piVar14[1],iVar39) == *plVar2;
      lVar33 = *(long *)(lVar28 + 0x10);
    }
    if (lVar33 != 0) {
      lVar28 = *(long *)(lVar28 + 8);
      fVar43 = fVar43 * fVar21;
      lVar34 = 0;
      uVar41 = _DAT_145dd4d50;
      do {
        uVar15 = *(undefined8 *)(lVar28 + lVar34);
        uVar30 = (ulong)~(uint)uVar15;
        piVar32 = (int *)(uVar30 * 0x18 + *(long *)(lVar11 + 8));
        if (*(ulong *)(lVar11 + 0x10) <= uVar30) {
          piVar32 = (int *)&DAT_145de5448;
        }
        if ((piVar32[4] == (int)((ulong)uVar15 >> 0x20)) && (*piVar32 != 0)) {
          uVar30 = *(ulong *)(piVar32 + 1);
          if ((uVar30 >> 0x20 < *(ulong *)(lVar10 + 0x38)) &&
             ((*(ulong *)(*(long *)(lVar10 + 0x28) + (uVar30 >> 0x26) * 8) >>
               (uVar30 >> 0x20 & 0x3f) & 1) != 0)) {
            uVar29 = (ulong)(uint)piVar32[3];
            lVar36 = *(long *)(lVar11 + 0x1a8);
            lVar35 = *(long *)(lVar36 + 0x18 + uVar29 * 0x48);
            lVar16 = *(long *)(lVar36 + 0x38 + uVar29 * 0x48);
            if ((*(ulong *)(lVar10 + 0x118) < *(ulong *)(lVar36 + 0x40 + uVar29 * 0x48)) &&
               (uVar29 = *(ulong *)(lVar16 + *(ulong *)(lVar10 + 0x118) * 8), uVar29 != 0)) {
              local_130 = *(long *)(lVar35 + 0x10 + ~uVar29 * 0x30);
            }
            else {
              local_130 = 0;
            }
            lVar36 = ~*(ulong *)(lVar16 + *(long *)(lVar10 + 0x110) * 8) * 0x30;
            lVar17 = *(long *)(lVar35 + 0x10 + lVar36);
            lVar18 = *(long *)(lVar35 + 0x28 + lVar36);
            lVar37 = ~*(ulong *)(lVar16 + *(long *)(lVar10 + 0x120) * 8) * 0x30;
            lVar16 = *(long *)(lVar35 + 0x28 + lVar37);
            uVar30 = (ulong)~(uint)uVar30;
            lVar36 = lVar17 + uVar30 * 0x180;
            piVar32 = (int *)(uVar30 * 0x14 + *(long *)(lVar35 + 0x10 + lVar37));
            iVar39 = *(int *)(lVar17 + 0x90 + uVar30 * 0x180);
            if (iVar39 == 0) {
LAB_140196caa:
              *(undefined4 *)(lVar18 + uVar30 * 4) = uVar6;
              *(undefined4 *)(lVar36 + 0x90) = 2;
              *(float *)(lVar36 + 0x94) = fVar43;
            }
            else if (iVar39 == 2) {
              if ((*(float *)(lVar36 + 0x94) != fVar43) ||
                 (NAN(*(float *)(lVar36 + 0x94)) || NAN(fVar43))) goto LAB_140196caa;
            }
            else if ((*(float *)(lVar36 + 0x94) != 0.0) ||
                    (((NAN(*(float *)(lVar36 + 0x94)) || (fVar43 != 0.0)) || (NAN(fVar43)))))
            goto LAB_140196caa;
            if (*(int *)(lVar36 + 0x78) == 0) {
LAB_140196d01:
              *(undefined4 *)(lVar18 + uVar30 * 4) = uVar6;
              *(undefined4 *)(lVar36 + 0x78) = 2;
              *(float *)(lVar36 + 0x7c) = fVar44;
            }
            else if (*(int *)(lVar36 + 0x78) == 2) {
              if ((*(float *)(lVar36 + 0x7c) != fVar44) ||
                 (NAN(*(float *)(lVar36 + 0x7c)) || NAN(fVar44))) goto LAB_140196d01;
            }
            else if (((*(float *)(lVar36 + 0x7c) != 0.0) ||
                     ((NAN(*(float *)(lVar36 + 0x7c)) || (fVar44 != 0.0)))) || (NAN(fVar44)))
            goto LAB_140196d01;
            uVar42 = (undefined4)((ulong)uVar41 >> 0x20);
            fVar47 = _DAT_145de4d38;
            fVar45 = fVar25;
            fVar48 = _DAT_145de4d34;
            uVar49 = (int)uVar41;
            if ((!bVar40) && (*(char *)(local_130 + uVar30) == '\x02')) {
              fVar47 = fVar22;
              fVar45 = fVar26;
              fVar48 = fVar23;
              uVar49 = uVar46;
              uVar42 = (int)uVar19;
            }
            if (*piVar32 == 0) {
              uVar41 = _DAT_145dd4d50;
              if (((float)piVar32[1] == fVar45) && (!NAN((float)piVar32[1]) && !NAN(fVar45))) {
                if (((float)piVar32[2] == fVar47) && (!NAN((float)piVar32[2]) && !NAN(fVar47))) {
                  if (((float)piVar32[3] == fVar48) && (!NAN((float)piVar32[3]) && !NAN(fVar48))) {
                    if (((float)piVar32[4] == fVar20) && (!NAN((float)piVar32[4]) && !NAN(fVar20)))
                    goto LAB_140196ac0;
                  }
                }
              }
            }
            *(undefined4 *)(lVar16 + uVar30 * 4) = uVar6;
            *piVar32 = 0;
            *(ulong *)(piVar32 + 1) = CONCAT44(uVar42,uVar49);
            piVar32[3] = (int)fVar48;
            piVar32[4] = 0x3f800000;
          }
        }
LAB_140196ac0:
        lVar34 = lVar34 + 8;
      } while (lVar33 * 8 != lVar34);
    }
  } while( true );
}
