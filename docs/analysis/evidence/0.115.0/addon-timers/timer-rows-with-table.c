
void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  char cVar1;
  ulong uVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  bool bVar7;
  long lVar8;
  long lVar9;
  char *pcVar10;
  undefined8 uVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  long local_f0;
  
  uVar2 = *(ulong *)(param_3 + 0x810);
  if (uVar2 == 0) {
    bVar7 = false;
    goto LAB_1459722a8;
  }
  lVar3 = *(long *)(param_3 + 0x808);
  fVar15 = DAT_145ee0430;
  if (uVar2 == 1) {
    uVar12 = 0;
LAB_14597228e:
    if (*(char *)(lVar3 + uVar12 * 8) == ' ') {
      fVar15 = fVar15 + *(float *)(lVar3 + 4 + uVar12 * 8);
    }
  }
  else {
    uVar12 = 0;
    do {
      if (*(char *)(lVar3 + uVar12 * 8) == ' ') {
        fVar15 = fVar15 + *(float *)(lVar3 + 4 + uVar12 * 8);
        cVar1 = *(char *)(lVar3 + 8 + uVar12 * 8);
      }
      else {
        cVar1 = *(char *)(lVar3 + 8 + uVar12 * 8);
      }
      if (cVar1 == ' ') {
        fVar15 = fVar15 + *(float *)(lVar3 + 0xc + uVar12 * 8);
      }
      uVar12 = uVar12 + 2;
    } while ((uVar2 & 0xfffffffffffffffe) != uVar12);
    if ((uVar2 & 1) != 0) goto LAB_14597228e;
  }
  bVar7 = 0.0 < fVar15;
LAB_1459722a8:
  fVar15 = *(float *)(param_3 + 0x498);
  local_f0 = 0;
  uVar2 = *(ulong *)(param_3 + 0x840);
  if (uVar2 != 0) {
    lVar3 = *(long *)(param_3 + 0x838);
    uVar12 = *(ulong *)(param_3 + 0x90);
    lVar4 = *(long *)(param_3 + 0x88);
    lVar5 = *(long *)(param_3 + 0x70);
    uVar6 = *(ulong *)(param_3 + 0x78);
    fVar19 = *(float *)(param_3 + 0xb9c);
    fVar20 = *(float *)(param_3 + 0x198);
    lVar9 = 0;
    fVar21 = 0.0;
    lVar13 = 0;
    uVar14 = 0;
    fVar22 = DAT_145edff10;
    fVar23 = DAT_145ee55c0;
    do {
      switch(*(undefined1 *)(lVar3 + lVar13)) {
      case 0:
      case 0x10:
      case 0x11:
        fVar24 = *(float *)(lVar3 + 8 + lVar13);
        goto joined_r0x0001459724c8;
      case 10:
        fVar24 = *(float *)(lVar3 + 4 + lVar13);
joined_r0x0001459724c8:
        if (fVar21 < fVar24) {
          uVar11 = 8;
          fVar16 = 0.0;
          if (uVar14 < uVar6) {
            fVar16 = *(float *)(lVar5 + uVar14 * 4);
            pcVar10 = s_cooldown_147330552;
          }
          else {
LAB_14597250a:
            uVar11 = 8;
            pcVar10 = s_cooldown_147330552;
          }
joined_r0x000145972535:
          if (lVar9 == 0) {
            FUN_145d150f0();
          }
          lVar8 = lVar9 * 0x20;
          *(char **)(lVar8 + 8) = pcVar10;
          *(undefined8 *)(lVar8 + 0x10) = uVar11;
          *(ulong *)(lVar8 + 0x18) = uVar14;
          *(float *)(lVar8 + 0x20) = fVar16;
          *(float *)(lVar8 + 0x24) = fVar24;
          lVar9 = lVar9 + 1;
          local_f0 = lVar9;
        }
        break;
      case 0x13:
        fVar24 = *(float *)(lVar3 + 4 + lVar13);
        fVar16 = fVar20;
        goto LAB_14597250a;
      case 0x20:
        fVar24 = fVar22;
        if ((!bVar7) && (fVar24 = *(float *)(lVar3 + 4 + lVar13) * fVar15, fVar24 <= fVar23)) {
          fVar24 = fVar23;
        }
        uVar11 = 6;
        fVar16 = 0.0;
        if (uVar14 < uVar6) {
          fVar16 = *(float *)(lVar5 + uVar14 * 4);
          pcVar10 = s_summon_1473320ba;
        }
        else {
          pcVar10 = s_summon_1473320ba;
        }
        goto joined_r0x000145972535;
      case 0x22:
        if ((uVar14 < uVar2) && (*(char *)(lVar3 + lVar13) == '\"')) {
          fVar16 = fVar19;
          if ((uVar14 < uVar12) && (*(int *)(lVar4 + uVar14 * 4) != 0)) {
            fVar16 = 0.0;
            if (uVar14 < uVar6) {
              fVar16 = *(float *)(lVar5 + uVar14 * 4);
            }
            fVar17 = *(float *)(lVar3 + 8 + lVar13) * fVar15;
            fVar24 = *(float *)(lVar3 + 0xc + lVar13);
            fVar18 = fVar17;
            if (fVar17 <= fVar24) {
              fVar18 = fVar24;
            }
            fVar16 = (float)(~-(uint)NAN(fVar18) & (uint)fVar18 | (uint)fVar17 & -(uint)NAN(fVar18))
                     + fVar16;
          }
          fVar17 = *(float *)(lVar3 + 8 + lVar13) * fVar15;
          fVar24 = *(float *)(lVar3 + 0xc + lVar13);
          fVar18 = fVar17;
          if (fVar17 <= fVar24) {
            fVar18 = fVar24;
          }
          fVar24 = (float)(~-(uint)NAN(fVar18) & (uint)fVar18 | (uint)fVar17 & -(uint)NAN(fVar18));
          uVar11 = 6;
          pcVar10 = s_summon_1473320ba;
          goto joined_r0x000145972535;
        }
      }
      lVar13 = lVar13 + 0x40;
      uVar14 = uVar14 + 1;
    } while (uVar2 << 6 != lVar13);
  }
  param_4[2] = local_f0;
  *param_4 = 0;
  param_4[1] = 8;
  return;
}

