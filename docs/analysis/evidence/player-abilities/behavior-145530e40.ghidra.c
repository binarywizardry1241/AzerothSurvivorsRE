
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  long lVar2;
  float *pfVar3;
  undefined8 *puVar4;
  float *pfVar5;
  float *pfVar6;
  code *pcVar7;
  undefined8 *puVar8;
  float *pfVar9;
  long lVar10;
  long lVar11;
  undefined8 uVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  long local_98;
  
  fVar18 = _DAT_14594f310;
  fVar19 = _DAT_1458eb488;
  fVar17 = _DAT_1458eb480;
  lVar2 = param_3[1];
  if (*param_3 != lVar2) {
    pfVar3 = (float *)param_3[2];
    puVar4 = (undefined8 *)param_3[3];
    pfVar5 = (float *)param_3[4];
    pfVar9 = (float *)param_3[5];
    pfVar6 = (float *)param_3[6];
    lVar11 = *param_3;
    do {
      lVar10 = lVar11 + 0x160;
      if (*(char *)(lVar11 + 0x68) == '\0') {
        if (*(float *)(lVar11 + 0x128) <= 0.0) {
          uVar12 = *(undefined8 *)(lVar11 + 0x118);
        }
        else {
          fVar15 = (*pfVar3 - *(float *)(lVar11 + 0x124)) / *(float *)(lVar11 + 0x128);
          fVar13 = 0.0;
          if (0.0 <= fVar15) {
            fVar13 = fVar15;
          }
          fVar15 = _DAT_1458eb480;
          if (fVar13 <= _DAT_1458eb480) {
            fVar15 = fVar13;
          }
          fVar13 = (float)*(undefined8 *)(lVar11 + 0x10c);
          fVar16 = (float)((ulong)*(undefined8 *)(lVar11 + 0x10c) >> 0x20);
          uVar12 = CONCAT44(fVar15 * ((float)((ulong)*(undefined8 *)(lVar11 + 0x118) >> 0x20) -
                                     fVar16) + fVar16,
                            fVar15 * ((float)*(undefined8 *)(lVar11 + 0x118) - fVar13) + fVar13);
        }
        uVar1 = *puVar4;
        fVar13 = (float)uVar12 - (float)uVar1;
        fVar15 = (float)((ulong)uVar12 >> 0x20) - (float)((ulong)uVar1 >> 0x20);
        fVar16 = SQRT(fVar15 * fVar15 + fVar13 * fVar13);
        if (((fVar16 <= *pfVar5) && (_DAT_14594f310 < fVar16)) &&
           (_DAT_1458eb488 < (fVar15 * *pfVar6 + fVar13 * *pfVar9) / fVar16)) {
          *param_3 = lVar10;
          uVar12 = *(undefined8 *)(lVar11 + 0x88);
          func_0x000140002200();
          puVar8 = (undefined8 *)func_0x0001400021c0();
          if (puVar8 != (undefined8 *)0x0) {
            *puVar8 = uVar12;
            local_98 = 1;
            if (lVar10 != lVar2) {
              fVar13 = 0.0;
              do {
                lVar11 = lVar10 + 0x160;
                if (*(char *)(lVar10 + 0x68) == '\0') {
                  if (*(float *)(lVar10 + 0x128) <= fVar13) {
                    uVar12 = *(undefined8 *)(lVar10 + 0x118);
                  }
                  else {
                    fVar16 = (*pfVar3 - *(float *)(lVar10 + 0x124)) / *(float *)(lVar10 + 0x128);
                    fVar15 = 0.0;
                    if (0.0 <= fVar16) {
                      fVar15 = fVar16;
                    }
                    fVar16 = fVar17;
                    if (fVar15 <= fVar17) {
                      fVar16 = fVar15;
                    }
                    fVar15 = (float)*(undefined8 *)(lVar10 + 0x10c);
                    fVar14 = (float)((ulong)*(undefined8 *)(lVar10 + 0x10c) >> 0x20);
                    uVar12 = CONCAT44(fVar16 * ((float)((ulong)*(undefined8 *)(lVar10 + 0x118) >>
                                                       0x20) - fVar14) + fVar14,
                                      fVar16 * ((float)*(undefined8 *)(lVar10 + 0x118) - fVar15) +
                                      fVar15);
                  }
                  uVar1 = *puVar4;
                  fVar15 = (float)uVar12 - (float)uVar1;
                  fVar16 = (float)((ulong)uVar12 >> 0x20) - (float)((ulong)uVar1 >> 0x20);
                  fVar14 = SQRT(fVar16 * fVar16 + fVar15 * fVar15);
                  if (((fVar14 <= *pfVar5) && (fVar18 < fVar14)) &&
                     (fVar19 < (fVar16 * *pfVar6 + fVar15 * *pfVar9) / fVar14)) {
                    uVar12 = *(undefined8 *)(lVar10 + 0x88);
                    if (local_98 == 4) {
                      func_0x000145757d40();
                    }
                    puVar8[local_98] = uVar12;
                    local_98 = local_98 + 1;
                  }
                }
                lVar10 = lVar11;
              } while (lVar11 != lVar2);
            }
            param_4[2] = local_98;
            *param_4 = 4;
            param_4[1] = puVar8;
            return param_4;
          }
          func_0x0001458e721b();
                    /* WARNING: Does not return */
          pcVar7 = (code *)invalidInstructionException();
          (*pcVar7)();
        }
      }
      lVar11 = lVar10;
    } while (lVar10 != lVar2);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}

