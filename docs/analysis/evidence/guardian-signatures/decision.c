
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,float *param_3,long param_4,undefined8 *param_5)

{
  float *pfVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  long lVar9;
  ulong uVar10;
  code *pcVar11;
  float fVar12;
  ulong uVar13;
  float *pfVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  ulong uVar18;
  long lVar19;
  float fVar20;
  undefined8 uVar21;
  float fVar22;
  float in_XMM3_Da;
  float fVar23;
  float fVar24;

  if (*(float *)(param_4 + 400) <= 0.0) {
    uVar21 = *(undefined8 *)(param_4 + 0x180);
    lVar17 = *(long *)(param_4 + 0x58);
  }
  else {
    fVar23 = (in_XMM3_Da - *(float *)(param_4 + 0x18c)) / *(float *)(param_4 + 400);
    fVar20 = 0.0;
    if (0.0 <= fVar23) {
      fVar20 = fVar23;
    }
    fVar23 = _DAT_145d9d2a0;
    if (fVar20 <= _DAT_145d9d2a0) {
      fVar23 = fVar20;
    }
    fVar20 = (float)*(undefined8 *)(param_4 + 0x174);
    fVar22 = (float)((ulong)*(undefined8 *)(param_4 + 0x174) >> 0x20);
    uVar21 = CONCAT44(fVar23 * ((float)((ulong)*(undefined8 *)(param_4 + 0x180) >> 0x20) - fVar22) +
                      fVar22,fVar23 * ((float)*(undefined8 *)(param_4 + 0x180) - fVar20) + fVar20);
    lVar17 = *(long *)(param_4 + 0x58);
  }
  if (lVar17 == -1) {
    return 3;
  }
  fVar20 = *(float *)(param_4 + 0x15c);
  if (*(char *)(param_4 + 0xa8) != '\0') {
    fVar23 = *param_3 - (float)*param_5;
    fVar22 = param_3[1] - (float)((ulong)*param_5 >> 0x20);
    if (SQRT(fVar22 * fVar22 + fVar23 * fVar23) <= _DAT_146be7e50) {
      return 3;
    }
    *(undefined1 *)(param_4 + 0xa8) = 0;
    *(undefined4 *)(param_4 + 0xa4) = 0;
    lVar9 = *(long *)(param_4 + 0x70);
    uVar10 = *(ulong *)(param_4 + 0x78);
    *(long *)(param_4 + 0x80) = lVar9;
    *(ulong *)(param_4 + 0x88) = uVar10;
    if (uVar10 == 0) {
      uVar13 = 4;
    }
    else {
      func_0x000140002200();
      uVar13 = func_0x0001400021c0();
      if (uVar13 == 0) {
        func_0x000145d992bb();
                    /* WARNING: Does not return */
        pcVar11 = (code *)invalidInstructionException();
        (*pcVar11)();
      }
      if ((uVar10 < 0xc) ||
         (uVar13 < (uVar10 * 0x38 + lVar9) - 4 && lVar9 + 0x30U < uVar13 + uVar10 * 4)) {
        uVar15 = 0;
      }
      else {
        uVar15 = uVar10 & 0xfffffffffffffff8;
        pfVar14 = (float *)(lVar9 + 0x1b8);
        uVar16 = 0;
        fVar23 = (float)DAT_145da8cd0;
        fVar22 = DAT_145da8cd0._4_4_;
        fVar24 = DAT_145da8cd0._8_4_;
        fVar12 = DAT_145da8cd0._12_4_;
        do {
          fVar2 = pfVar14[-0x54];
          fVar3 = pfVar14[-0x46];
          fVar4 = pfVar14[-0x38];
          fVar5 = *pfVar14;
          fVar6 = pfVar14[-0xe];
          fVar7 = pfVar14[-0x1c];
          fVar8 = pfVar14[-0x2a];
          pfVar1 = (float *)(uVar13 + uVar16 * 4);
          *pfVar1 = pfVar14[-0x62] * fVar23;
          pfVar1[1] = fVar2 * fVar22;
          pfVar1[2] = fVar3 * fVar24;
          pfVar1[3] = fVar4 * fVar12;
          pfVar1 = (float *)(uVar13 + 0x10 + uVar16 * 4);
          *pfVar1 = fVar8 * fVar23;
          pfVar1[1] = fVar7 * fVar22;
          pfVar1[2] = fVar6 * fVar24;
          pfVar1[3] = fVar5 * fVar12;
          uVar16 = uVar16 + 8;
          pfVar14 = pfVar14 + 0x70;
        } while (uVar15 != uVar16);
        if (uVar10 == uVar15) goto LAB_14589a107;
      }
      fVar23 = _DAT_145d9d2a4;
      uVar18 = uVar10 & 3;
      uVar16 = uVar15;
      if (uVar18 != 0) {
        lVar19 = 0;
        do {
          *(float *)(uVar13 + uVar16 * 4) =
               *(float *)(uVar15 * 0x38 + lVar9 + 0x30 + lVar19 * 4) * fVar23;
          uVar16 = uVar16 + 1;
          lVar19 = lVar19 + 0xe;
        } while ((ulong)(uint)((int)uVar18 << 4) + uVar18 * -2 != lVar19);
      }
      fVar23 = _DAT_145d9d2a4;
      if (uVar15 - uVar10 < 0xfffffffffffffffd) {
        pfVar14 = (float *)(uVar16 * 0x38 + lVar9 + 0xd8);
        do {
          *(float *)(uVar13 + uVar16 * 4) = pfVar14[-0x2a] * fVar23;
          *(float *)(uVar13 + 4 + uVar16 * 4) = pfVar14[-0x1c] * fVar23;
          *(float *)(uVar13 + 8 + uVar16 * 4) = pfVar14[-0xe] * fVar23;
          *(float *)(uVar13 + 0xc + uVar16 * 4) = *pfVar14 * fVar23;
          uVar16 = uVar16 + 4;
          pfVar14 = pfVar14 + 0x38;
        } while (uVar10 != uVar16);
      }
    }
LAB_14589a107:
    if (lVar17 != 0) {
      func_0x0001400021d0(uVar13,lVar17 << 2,lVar17 << 2,*(undefined8 *)(param_4 + 0x60),4);
    }
    *(ulong *)(param_4 + 0x58) = uVar10;
    *(ulong *)(param_4 + 0x60) = uVar13;
    *(ulong *)(param_4 + 0x68) = uVar10;
    *(float *)(param_4 + 0x158) = fVar20;
    *(undefined4 *)(param_4 + 0x1cc) = 0;
    *(undefined8 *)(param_4 + 0x10) = 0;
    *(undefined8 *)(param_4 + 0x100) = 0;
    return 2;
  }
  fVar23 = (float)((ulong)uVar21 >> 0x20);
  fVar22 = (float)uVar21 - *param_3;
  fVar24 = fVar23 - param_3[1];
  if (SQRT(fVar24 * fVar24 + fVar22 * fVar22) <= _DAT_145dcced0) {
    if ((*(float *)(param_4 + 0x158) < fVar20) ||
       (fVar20 = (float)uVar21 - (float)*param_5, fVar23 = fVar23 - (float)((ulong)*param_5 >> 0x20)
       , SQRT(fVar23 * fVar23 + fVar20 * fVar20) <= _DAT_145d9d220)) goto LAB_14589a0f7;
  }
  else if (*(float *)(param_4 + 0x158) < fVar20) {
LAB_14589a0f7:
    *(undefined1 *)(param_4 + 0xa8) = 1;
    return 1;
  }
  return 0;
}
