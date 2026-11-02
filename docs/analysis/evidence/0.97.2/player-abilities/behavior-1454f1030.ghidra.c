
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4,long *param_5)

{
  long *plVar1;
  float fVar2;
  long lVar3;
  float *pfVar4;
  long lVar5;
  bool bVar6;
  long lVar7;
  byte bVar8;
  byte bVar9;
  long lVar10;
  long lVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  
  lVar3 = *param_3;
  lVar11 = *(long *)*param_5;
  pfVar4 = (float *)((long *)*param_5)[1];
  lVar5 = *(long *)(lVar11 + 0x4c8);
  lVar7 = *(long *)(lVar11 + 0x4d0) * 0x160;
  lVar10 = 0;
  fVar12 = 0.0;
  lVar11 = lVar5;
  do {
    bVar9 = 4;
    if (lVar7 - lVar10 == 0) goto LAB_1454f10dc;
    lVar10 = lVar10 + 0x160;
    plVar1 = (long *)(lVar11 + 0x88);
    lVar11 = lVar11 + 0x160;
  } while (*plVar1 != lVar3);
  fVar13 = *(float *)(lVar5 + -0x20 + lVar10);
  if (fVar13 < *pfVar4 || fVar13 == *pfVar4) {
    fVar12 = *(float *)(lVar5 + -0x70 + lVar10) / *(float *)(lVar5 + -0x6c + lVar10);
    if (*(long *)(lVar5 + -0x148 + lVar10) == -1) {
      bVar9 = 1;
      if (*(char *)(lVar5 + -8 + lVar10) == '\0') {
        bVar6 = fVar12 < _DAT_14590ae44;
        if (_DAT_14590ae44 <= fVar12) {
          fVar12 = 0.0;
        }
        bVar9 = bVar6 ^ 3;
      }
    }
    else {
      bVar9 = 0;
    }
  }
LAB_1454f10dc:
  lVar10 = 0;
  fVar13 = 0.0;
  lVar11 = lVar5;
  do {
    bVar8 = 4;
    if (lVar7 - lVar10 == 0) goto LAB_1454f115b;
    lVar10 = lVar10 + 0x160;
    plVar1 = (long *)(lVar11 + 0x88);
    lVar11 = lVar11 + 0x160;
  } while (*plVar1 != param_3[-1]);
  fVar14 = *(float *)(lVar5 + -0x20 + lVar10);
  if (fVar14 < *pfVar4 || fVar14 == *pfVar4) {
    fVar13 = *(float *)(lVar5 + -0x70 + lVar10) / *(float *)(lVar5 + -0x6c + lVar10);
    if (*(long *)(lVar5 + -0x148 + lVar10) == -1) {
      bVar8 = 1;
      if (*(char *)(lVar5 + -8 + lVar10) == '\0') {
        bVar6 = fVar13 < _DAT_14590ae44;
        if (_DAT_14590ae44 <= fVar13) {
          fVar13 = 0.0;
        }
        bVar8 = bVar6 ^ 3;
      }
    }
    else {
      bVar8 = 0;
    }
  }
LAB_1454f115b:
  if (bVar9 == bVar8) {
    if ((int)((uint)((int)fVar13 >> 0x1f) >> 1 ^ (uint)fVar13) <=
        (int)((uint)((int)fVar12 >> 0x1f) >> 1 ^ (uint)fVar12)) {
      return;
    }
  }
  else if (bVar8 <= bVar9) {
    return;
  }
  *param_3 = param_3[-1];
  fVar12 = _DAT_14590ae44;
  do {
    param_3 = param_3 + -1;
    if (param_3 == param_4) {
      *param_3 = lVar3;
      return;
    }
    lVar11 = *(long *)*param_5;
    pfVar4 = (float *)((long *)*param_5)[1];
    lVar5 = *(long *)(lVar11 + 0x4c8);
    lVar7 = *(long *)(lVar11 + 0x4d0) * 0x160;
    lVar10 = 0;
    lVar11 = lVar5;
    do {
      bVar9 = 4;
      fVar13 = 0.0;
      if (lVar7 - lVar10 == 0) goto LAB_1454f1260;
      lVar10 = lVar10 + 0x160;
      plVar1 = (long *)(lVar11 + 0x88);
      lVar11 = lVar11 + 0x160;
    } while (*plVar1 != lVar3);
    fVar14 = *(float *)(lVar5 + -0x20 + lVar10);
    if (fVar14 < *pfVar4 || fVar14 == *pfVar4) {
      fVar13 = *(float *)(lVar5 + -0x70 + lVar10) / *(float *)(lVar5 + -0x6c + lVar10);
      if (*(long *)(lVar5 + -0x148 + lVar10) == -1) {
        bVar9 = 1;
        if (*(char *)(lVar5 + -8 + lVar10) == '\0') {
          bVar6 = fVar13 < fVar12;
          if (fVar12 <= fVar13) {
            fVar13 = 0.0;
          }
          bVar9 = bVar6 ^ 3;
        }
      }
      else {
        bVar9 = 0;
      }
    }
LAB_1454f1260:
    lVar10 = 0;
    lVar11 = lVar5;
    do {
      bVar8 = 4;
      fVar14 = 0.0;
      if (lVar7 - lVar10 == 0) goto LAB_1454f12e0;
      lVar10 = lVar10 + 0x160;
      plVar1 = (long *)(lVar11 + 0x88);
      lVar11 = lVar11 + 0x160;
    } while (*plVar1 != param_3[-1]);
    fVar2 = *(float *)(lVar5 + -0x20 + lVar10);
    if (fVar2 < *pfVar4 || fVar2 == *pfVar4) {
      fVar14 = *(float *)(lVar5 + -0x70 + lVar10) / *(float *)(lVar5 + -0x6c + lVar10);
      if (*(long *)(lVar5 + -0x148 + lVar10) == -1) {
        bVar8 = 1;
        if (*(char *)(lVar5 + -8 + lVar10) == '\0') {
          bVar6 = fVar14 < fVar12;
          if (fVar12 <= fVar14) {
            fVar14 = 0.0;
          }
          bVar8 = bVar6 ^ 3;
        }
      }
      else {
        bVar8 = 0;
      }
    }
LAB_1454f12e0:
    if (bVar9 == bVar8) {
      if ((int)((uint)((int)fVar14 >> 0x1f) >> 1 ^ (uint)fVar14) <=
          (int)((uint)((int)fVar13 >> 0x1f) >> 1 ^ (uint)fVar13)) {
LAB_1454f1315:
        *param_3 = lVar3;
        return;
      }
    }
    else if (bVar8 <= bVar9) goto LAB_1454f1315;
    *param_3 = param_3[-1];
  } while( true );
}

