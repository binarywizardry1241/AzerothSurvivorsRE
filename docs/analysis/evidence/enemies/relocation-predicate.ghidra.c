/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  long lVar2;
  float *pfVar3;
  undefined8 *puVar4;
  code *pcVar5;
  undefined8 *puVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  long lVar10;
  long lVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  long local_88;

  if (param_3[4] != 0) {
    lVar8 = param_3[4] + -1;
    param_3[4] = lVar8;
    fVar17 = _DAT_14670e5a4;
    fVar16 = _DAT_1458eb480;
    lVar2 = param_3[1];
    if (*param_3 != lVar2) {
      pfVar3 = (float *)param_3[2];
      puVar4 = (undefined8 *)param_3[3];
      lVar11 = *param_3;
      do {
        lVar10 = lVar11 + 0x160;
        if ((((*(char *)(lVar11 + 0x68) == '\0') && (*(long *)(lVar11 + 0x90) != 0)) &&
            (*(long *)(lVar11 + 0x18) == -1)) &&
           ((*(long *)(lVar11 + 0x40) == -1 && (*(char *)(lVar11 + 0x78) == '\0')))) {
          if (0.0 < *(float *)(lVar11 + 0x128)) {
            fVar14 = (*pfVar3 - *(float *)(lVar11 + 0x124)) / *(float *)(lVar11 + 0x128);
            fVar12 = 0.0;
            if (0.0 <= fVar14) {
              fVar12 = fVar14;
            }
            fVar14 = _DAT_1458eb480;
            if (fVar12 <= _DAT_1458eb480) {
              fVar14 = fVar12;
            }
            fVar12 = (float)*(undefined8 *)(lVar11 + 0x10c);
            fVar13 = (float)((ulong)*(undefined8 *)(lVar11 + 0x10c) >> 0x20);
            uVar9 = CONCAT44(fVar14 * ((float)((ulong)*(undefined8 *)(lVar11 + 0x118) >> 0x20) -
                                      fVar13) + fVar13,
                             fVar14 * ((float)*(undefined8 *)(lVar11 + 0x118) - fVar12) + fVar12);
          }
          else {
            uVar9 = *(undefined8 *)(lVar11 + 0x118);
          }
          uVar1 = *puVar4;
          fVar12 = (float)uVar9 - (float)uVar1;
          fVar14 = (float)((ulong)uVar9 >> 0x20) - (float)((ulong)uVar1 >> 0x20);
          if (_DAT_14670e5a4 < fVar14 * fVar14 + fVar12 * fVar12) {
            *param_3 = lVar10;
            uVar9 = *(undefined8 *)(lVar11 + 0x88);
            func_0x000140002200();
            puVar6 = (undefined8 *)func_0x0001400021c0();
            if (puVar6 == (undefined8 *)0x0) {
              func_0x0001458e721b();
                    /* WARNING: Does not return */
              pcVar5 = (code *)invalidInstructionException();
              (*pcVar5)();
            }
            *puVar6 = uVar9;
            local_88 = 1;
            if (lVar8 == 0) goto LAB_145531f8b;
            fVar12 = 0.0;
            goto LAB_145531e77;
          }
        }
        lVar7 = lVar11 + 0x160;
        lVar11 = lVar10;
      } while (lVar7 != lVar2);
    }
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return;
LAB_145531e77:
  if (lVar10 != lVar2) {
    lVar8 = lVar8 + -1;
    lVar11 = lVar10;
    do {
      lVar10 = lVar11 + 0x160;
      if (((*(char *)(lVar11 + 0x68) == '\0') && (*(long *)(lVar11 + 0x90) != 0)) &&
         ((*(long *)(lVar11 + 0x18) == -1 &&
          ((*(long *)(lVar11 + 0x40) == -1 && (*(char *)(lVar11 + 0x78) == '\0')))))) {
        if (*(float *)(lVar11 + 0x128) <= fVar12) {
          uVar9 = *(undefined8 *)(lVar11 + 0x118);
        }
        else {
          fVar13 = (*pfVar3 - *(float *)(lVar11 + 0x124)) / *(float *)(lVar11 + 0x128);
          fVar14 = 0.0;
          if (0.0 <= fVar13) {
            fVar14 = fVar13;
          }
          fVar13 = fVar16;
          if (fVar14 <= fVar16) {
            fVar13 = fVar14;
          }
          fVar14 = (float)*(undefined8 *)(lVar11 + 0x10c);
          fVar15 = (float)((ulong)*(undefined8 *)(lVar11 + 0x10c) >> 0x20);
          uVar9 = CONCAT44(fVar13 * ((float)((ulong)*(undefined8 *)(lVar11 + 0x118) >> 0x20) -
                                    fVar15) + fVar15,
                           fVar13 * ((float)*(undefined8 *)(lVar11 + 0x118) - fVar14) + fVar14);
        }
        uVar1 = *puVar4;
        fVar14 = (float)uVar9 - (float)uVar1;
        fVar13 = (float)((ulong)uVar9 >> 0x20) - (float)((ulong)uVar1 >> 0x20);
        if (fVar17 < fVar13 * fVar13 + fVar14 * fVar14) goto LAB_145531f39;
      }
      lVar11 = lVar10;
      if (lVar10 == lVar2) break;
    } while( true );
  }
  goto LAB_145531f8b;
LAB_145531f39:
  uVar9 = *(undefined8 *)(lVar11 + 0x88);
  if (local_88 == 4) {
    func_0x000145757d40();
  }
  puVar6[local_88] = uVar9;
  local_88 = local_88 + 1;
  if (lVar8 == 0) {
LAB_145531f8b:
    param_4[2] = local_88;
    *param_4 = 4;
    param_4[1] = puVar6;
    return;
  }
  goto LAB_145531e77;
}
