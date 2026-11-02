
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  char *pcVar1;
  char cVar2;
  long lVar3;
  long *plVar4;
  ulong uVar5;
  ulong uVar6;
  code *pcVar7;
  long *plVar8;
  long lVar9;
  long *plVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  long local_80;
  long local_50;

  plVar8 = param_3 + 7;
  lVar16 = param_3[4];
  lVar18 = param_3[5];
  lVar19 = param_3[6];
  lVar3 = param_3[1];
  uVar14 = param_3[2];
  plVar4 = (long *)param_3[3];
  lVar13 = *param_3;
  while( true ) {
    if (lVar16 != 0) {
      while (lVar17 = lVar19, lVar11 = lVar16 + 0x58, lVar16 != lVar18) {
        param_3[4] = lVar11;
        lVar19 = lVar17 + 1;
        cVar2 = *(char *)(lVar16 + 0x54);
        param_3[6] = lVar19;
        lVar16 = lVar11;
        if (cVar2 == '\0') goto LAB_14552cd12;
      }
      param_3[4] = 0;
      lVar19 = lVar17;
    }
    if (lVar13 == 0) break;
    lVar11 = lVar13;
    lVar17 = 0;
    do {
      lVar13 = lVar11;
      if (lVar13 == lVar3) {
        lVar16 = param_3[8];
        uVar14 = uVar14 + lVar17;
        goto joined_r0x00014552ccb9;
      }
      lVar11 = lVar13 + 0xf0;
      *param_3 = lVar11;
      lVar16 = 4;
      if (uVar14 + lVar17 < 0xc) {
        lVar16 = *(long *)(uVar14 * 8 + lVar17 * 8 + 0x146985910);
      }
      lVar9 = lVar17 + 1;
      lVar12 = *plVar4;
      param_3[2] = uVar14 + lVar17 + 1;
      lVar17 = lVar9;
    } while (lVar16 != lVar12);
    lVar16 = *(long *)(lVar13 + 0x88);
    lVar18 = *(long *)(lVar13 + 0x90) * 0x58 + lVar16;
    param_3[4] = lVar16;
    param_3[5] = lVar18;
    param_3[6] = 0;
    lVar19 = uVar14 + lVar9;
    uVar14 = uVar14 + lVar9;
    param_3[7] = lVar19 + -1;
    lVar19 = 0;
    lVar13 = lVar11;
  }
  lVar13 = 0;
  lVar16 = param_3[8];
joined_r0x00014552ccb9:
  if (lVar16 == 0) {
LAB_14552cf38:
    *param_4 = 0;
    param_4[1] = 8;
    param_4[2] = 0;
  }
  else {
    plVar8 = param_3 + 0xb;
    lVar17 = param_3[10] + -1;
    lVar11 = 0;
    do {
      if (lVar16 == param_3[9]) goto LAB_14552cf38;
      param_3[8] = lVar16 + 0x58;
      lVar9 = lVar17 + 2;
      lVar17 = lVar17 + 1;
      cVar2 = *(char *)(lVar16 + 0x54);
      param_3[10] = lVar9;
      lVar16 = lVar16 + 0x58;
    } while (cVar2 != '\0');
LAB_14552cd12:
    lVar16 = *plVar8;
    func_0x000140002200();
    plVar8 = (long *)func_0x0001400021c0();
    if (plVar8 == (long *)0x0) {
      func_0x0001458e721b();
                    /* WARNING: Does not return */
      pcVar7 = (code *)invalidInstructionException();
      (*pcVar7)();
    }
    *plVar8 = lVar16;
    plVar8[1] = lVar17;
    uVar5 = param_3[7];
    lVar16 = param_3[8];
    lVar17 = param_3[9];
    local_80 = param_3[10];
    uVar6 = param_3[0xb];
    local_50 = 1;
joined_r0x00014552cdc1:
    while (uVar15 = uVar14, lVar11 != 0) {
      lVar12 = 0;
      lVar9 = lVar11;
      do {
        if (lVar9 == lVar18) {
          lVar19 = lVar19 - lVar12;
          goto LAB_14552cdf7;
        }
        lVar11 = lVar9 + 0x58;
        lVar12 = lVar12 + -1;
        pcVar1 = (char *)(lVar9 + 0x54);
        lVar9 = lVar11;
      } while (*pcVar1 != '\0');
      lVar19 = lVar19 - lVar12;
      uVar14 = uVar5;
      lVar9 = lVar19;
joined_r0x00014552ced7:
      if (local_50 == 4) {
        func_0x000145757d40();
      }
      plVar8[local_50 * 2] = uVar14;
      plVar8[local_50 * 2 + 1] = lVar9 + -1;
      local_50 = local_50 + 1;
      uVar14 = uVar15;
    }
LAB_14552cdf7:
    if (lVar13 != 0) {
      plVar10 = (long *)(uVar15 * 8 + 0x146985910);
      uVar14 = uVar15;
      do {
        uVar15 = uVar14;
        lVar9 = lVar13;
        if (lVar9 == lVar3) goto joined_r0x00014552cf0e;
        lVar11 = 4;
        if (uVar15 < 0xc) {
          lVar11 = *plVar10;
        }
        lVar13 = lVar9 + 0xf0;
        plVar10 = plVar10 + 1;
        uVar14 = uVar15 + 1;
      } while (lVar11 != *plVar4);
      lVar11 = *(long *)(lVar9 + 0x88);
      lVar18 = *(long *)(lVar9 + 0x90) * 0x58 + lVar11;
      lVar19 = 0;
      uVar5 = uVar15;
      goto joined_r0x00014552cdc1;
    }
    lVar9 = 0;
joined_r0x00014552cf0e:
    if (lVar16 != 0) {
      lVar11 = 0;
      lVar13 = lVar16;
      do {
        if (lVar13 == lVar17) goto LAB_14552cf14;
        lVar16 = lVar13 + 0x58;
        lVar11 = lVar11 + -1;
        pcVar1 = (char *)(lVar13 + 0x54);
        lVar13 = lVar16;
      } while (*pcVar1 != '\0');
      local_80 = local_80 - lVar11;
      lVar11 = 0;
      lVar13 = lVar9;
      uVar14 = uVar6;
      lVar9 = local_80;
      goto joined_r0x00014552ced7;
    }
LAB_14552cf14:
    param_4[2] = local_50;
    *param_4 = 4;
    param_4[1] = plVar8;
  }
  return;
}
