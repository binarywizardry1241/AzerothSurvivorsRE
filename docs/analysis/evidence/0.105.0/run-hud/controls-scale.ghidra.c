/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,char *param_5)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  code *pcVar4;
  uint uVar5;
  uint uVar6;
  float fVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  float fVar11;
  uint uVar12;
  long lVar13;
  ushort uVar14;
  ulong uVar15;
  long lVar16;
  float fVar17;
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  long local_58;

  cVar3 = *param_5;
  *param_5 = '\x01';
  if (cVar3 == '\0') {
    func_0x00014063a3d0(param_1,param_3,0x145d711f0,param_3,8,0x145d70ef0);
  }
  func_0x00014063cd20();
  fVar17 = _DAT_145d6d36c;
  if (local_58 != -1) {
    func_0x00014006f550();
    uVar8 = func_0x000145baaf70();
    if (local_58 != 0) {
      func_0x0001400021d0();
    }
    fVar17 = _DAT_145d6d36c;
    if (((uVar8 & 1) == 0) && (fVar11 = (float)(uVar8 >> 0x20), (uint)ABS(fVar11) < 0x7f800000)) {
      fVar7 = _DAT_145d6d754;
      if (_DAT_145d6d754 <= fVar11) {
        fVar7 = fVar11;
      }
      fVar17 = _DAT_145d6d42c;
      if (fVar7 <= _DAT_145d6d42c) {
        fVar17 = fVar7;
      }
    }
  }
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar9 = *(long *)(param_3 + 0x78);
    uVar8 = *(ulong *)(param_3 + 0x80);
    uVar10 = 0x9770b9d20072f145;
    lVar13 = 0;
    while( true ) {
      uVar10 = uVar10 & uVar8;
      pcVar1 = (char *)(lVar9 + uVar10);
      auVar20[0] = -(*pcVar1 == DAT_145d6d8e0);
      auVar20[1] = -(pcVar1[1] == DAT_145d6d8e0._1_1_);
      auVar20[2] = -(pcVar1[2] == DAT_145d6d8e0._2_1_);
      auVar20[3] = -(pcVar1[3] == DAT_145d6d8e0._3_1_);
      auVar20[4] = -(pcVar1[4] == DAT_145d6d8e0._4_1_);
      auVar20[5] = -(pcVar1[5] == DAT_145d6d8e0._5_1_);
      auVar20[6] = -(pcVar1[6] == DAT_145d6d8e0._6_1_);
      auVar20[7] = -(pcVar1[7] == DAT_145d6d8e0._7_1_);
      auVar20[8] = -(pcVar1[8] == DAT_145d6d8e0._8_1_);
      auVar20[9] = -(pcVar1[9] == DAT_145d6d8e0._9_1_);
      auVar20[10] = -(pcVar1[10] == DAT_145d6d8e0._10_1_);
      auVar20[0xb] = -(pcVar1[0xb] == DAT_145d6d8e0._11_1_);
      auVar20[0xc] = -(pcVar1[0xc] == DAT_145d6d8e0._12_1_);
      auVar20[0xd] = -(pcVar1[0xd] == DAT_145d6d8e0._13_1_);
      auVar20[0xe] = -(pcVar1[0xe] == DAT_145d6d8e0._14_1_);
      auVar20[0xf] = -(pcVar1[0xf] == DAT_145d6d8e0._15_1_);
      uVar14 = (ushort)(SUB161(auVar20 >> 7,0) & 1) | (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar20 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar20 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar20 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar20 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar20 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar20 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar20 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar20 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar20 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar20 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar20 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar20 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe | (ushort)(auVar20[0xf] >> 7) << 0xf;
      uVar12 = (uint)uVar14;
      while (uVar14 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar12; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar15 = uVar5 + uVar10 & uVar8;
        pcVar2 = (char *)(lVar9 + -0x18 + uVar15 * -0x18);
        auVar21[0] = -(*pcVar2 == DAT_145d6d9b0);
        auVar21[1] = -(pcVar2[1] == DAT_145d6d9b0._1_1_);
        auVar21[2] = -(pcVar2[2] == DAT_145d6d9b0._2_1_);
        auVar21[3] = -(pcVar2[3] == DAT_145d6d9b0._3_1_);
        auVar21[4] = -(pcVar2[4] == DAT_145d6d9b0._4_1_);
        auVar21[5] = -(pcVar2[5] == DAT_145d6d9b0._5_1_);
        auVar21[6] = -(pcVar2[6] == DAT_145d6d9b0._6_1_);
        auVar21[7] = -(pcVar2[7] == DAT_145d6d9b0._7_1_);
        auVar21[8] = -(pcVar2[8] == DAT_145d6d9b0._8_1_);
        auVar21[9] = -(pcVar2[9] == DAT_145d6d9b0._9_1_);
        auVar21[10] = -(pcVar2[10] == DAT_145d6d9b0._10_1_);
        auVar21[0xb] = -(pcVar2[0xb] == DAT_145d6d9b0._11_1_);
        auVar21[0xc] = -(pcVar2[0xc] == DAT_145d6d9b0._12_1_);
        auVar21[0xd] = -(pcVar2[0xd] == DAT_145d6d9b0._13_1_);
        auVar21[0xe] = -(pcVar2[0xe] == DAT_145d6d9b0._14_1_);
        auVar21[0xf] = -(pcVar2[0xf] == DAT_145d6d9b0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar21 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar21 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar21 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar21 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar21 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar21 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar21 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar21 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar21 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar21 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar21 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar21 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar21 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar21 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar21[0xf] >> 7) << 0xf) == 0xffff) {
          uVar10 = *(ulong *)(lVar9 + uVar15 * -0x18 + -8);
          if (*(ulong *)(param_3 + 0x218) <= uVar10) goto LAB_14003dd82;
          uVar10 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar10 * 8);
          if (uVar10 == 0) goto LAB_14003dd82;
          lVar13 = *(long *)(param_3 + 0x1e0);
          lVar16 = ~uVar10 * 0x38;
          if (*(char *)(lVar13 + 0x30 + lVar16) == '\0') goto LAB_14003dd82;
          fVar11 = **(float **)(lVar16 + lVar13 + 0x10);
          if ((fVar11 == fVar17) && (!NAN(fVar11) && !NAN(fVar17))) {
            return;
          }
          uVar10 = 0x9770b9d20072f145;
          lVar16 = 0;
          goto LAB_14003dd1d;
        }
        uVar14 = (ushort)(uVar12 - 1) & (ushort)uVar12;
        uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar14);
      }
      auVar18[0] = -(*pcVar1 == -1);
      auVar18[1] = -(pcVar1[1] == -1);
      auVar18[2] = -(pcVar1[2] == -1);
      auVar18[3] = -(pcVar1[3] == -1);
      auVar18[4] = -(pcVar1[4] == -1);
      auVar18[5] = -(pcVar1[5] == -1);
      auVar18[6] = -(pcVar1[6] == -1);
      auVar18[7] = -(pcVar1[7] == -1);
      auVar18[8] = -(pcVar1[8] == -1);
      auVar18[9] = -(pcVar1[9] == -1);
      auVar18[10] = -(pcVar1[10] == -1);
      auVar18[0xb] = -(pcVar1[0xb] == -1);
      auVar18[0xc] = -(pcVar1[0xc] == -1);
      auVar18[0xd] = -(pcVar1[0xd] == -1);
      auVar18[0xe] = -(pcVar1[0xe] == -1);
      auVar18[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar18 >> 7,0) & 1) != 0 || (SUB161(auVar18 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar18 >> 0x17,0) & 1) != 0) || (SUB161(auVar18 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar18 >> 0x27,0) & 1) != 0) || (SUB161(auVar18 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar18 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar18 >> 0x3f,0) & 1) != 0) || (SUB161(auVar18 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar18 >> 0x4f,0) & 1) != 0) || (SUB161(auVar18 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar18 >> 0x5f,0) & 1) != 0) || (SUB161(auVar18 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar18 >> 0x6f,0) & 1) != 0) || (SUB161(auVar18 >> 0x77,0) & 1) != 0) ||
          auVar18[0xf] < '\0') break;
      uVar10 = uVar10 + lVar13 + 0x10;
      lVar13 = lVar13 + 0x10;
    }
  }
LAB_14003dd82:
  func_0x000145d699c0();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
LAB_14003dd1d:
  uVar10 = uVar10 & uVar8;
  pcVar1 = (char *)(lVar9 + uVar10);
  auVar22[0] = -(*pcVar1 == DAT_145d6d8e0);
  auVar22[1] = -(pcVar1[1] == DAT_145d6d8e0._1_1_);
  auVar22[2] = -(pcVar1[2] == DAT_145d6d8e0._2_1_);
  auVar22[3] = -(pcVar1[3] == DAT_145d6d8e0._3_1_);
  auVar22[4] = -(pcVar1[4] == DAT_145d6d8e0._4_1_);
  auVar22[5] = -(pcVar1[5] == DAT_145d6d8e0._5_1_);
  auVar22[6] = -(pcVar1[6] == DAT_145d6d8e0._6_1_);
  auVar22[7] = -(pcVar1[7] == DAT_145d6d8e0._7_1_);
  auVar22[8] = -(pcVar1[8] == DAT_145d6d8e0._8_1_);
  auVar22[9] = -(pcVar1[9] == DAT_145d6d8e0._9_1_);
  auVar22[10] = -(pcVar1[10] == DAT_145d6d8e0._10_1_);
  auVar22[0xb] = -(pcVar1[0xb] == DAT_145d6d8e0._11_1_);
  auVar22[0xc] = -(pcVar1[0xc] == DAT_145d6d8e0._12_1_);
  auVar22[0xd] = -(pcVar1[0xd] == DAT_145d6d8e0._13_1_);
  auVar22[0xe] = -(pcVar1[0xe] == DAT_145d6d8e0._14_1_);
  auVar22[0xf] = -(pcVar1[0xf] == DAT_145d6d8e0._15_1_);
  uVar14 = (ushort)(SUB161(auVar22 >> 7,0) & 1) | (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar22 >> 0x17,0) & 1) << 2 |
           (ushort)(SUB161(auVar22 >> 0x1f,0) & 1) << 3 |
           (ushort)(SUB161(auVar22 >> 0x27,0) & 1) << 4 |
           (ushort)(SUB161(auVar22 >> 0x2f,0) & 1) << 5 |
           (ushort)(SUB161(auVar22 >> 0x37,0) & 1) << 6 |
           (ushort)(SUB161(auVar22 >> 0x3f,0) & 1) << 7 |
           (ushort)(SUB161(auVar22 >> 0x47,0) & 1) << 8 |
           (ushort)(SUB161(auVar22 >> 0x4f,0) & 1) << 9 |
           (ushort)(SUB161(auVar22 >> 0x57,0) & 1) << 10 |
           (ushort)(SUB161(auVar22 >> 0x5f,0) & 1) << 0xb |
           (ushort)(SUB161(auVar22 >> 0x67,0) & 1) << 0xc |
           (ushort)(SUB161(auVar22 >> 0x6f,0) & 1) << 0xd |
           (ushort)(SUB161(auVar22 >> 0x77,0) & 1) << 0xe | (ushort)(auVar22[0xf] >> 7) << 0xf;
  uVar12 = (uint)uVar14;
  while (uVar14 != 0) {
    uVar5 = 0;
    for (uVar6 = uVar12; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
      uVar5 = uVar5 + 1;
    }
    uVar15 = uVar5 + uVar10 & uVar8;
    pcVar2 = (char *)(lVar9 + -0x18 + uVar15 * -0x18);
    auVar23[0] = -(*pcVar2 == DAT_145d6d9b0);
    auVar23[1] = -(pcVar2[1] == DAT_145d6d9b0._1_1_);
    auVar23[2] = -(pcVar2[2] == DAT_145d6d9b0._2_1_);
    auVar23[3] = -(pcVar2[3] == DAT_145d6d9b0._3_1_);
    auVar23[4] = -(pcVar2[4] == DAT_145d6d9b0._4_1_);
    auVar23[5] = -(pcVar2[5] == DAT_145d6d9b0._5_1_);
    auVar23[6] = -(pcVar2[6] == DAT_145d6d9b0._6_1_);
    auVar23[7] = -(pcVar2[7] == DAT_145d6d9b0._7_1_);
    auVar23[8] = -(pcVar2[8] == DAT_145d6d9b0._8_1_);
    auVar23[9] = -(pcVar2[9] == DAT_145d6d9b0._9_1_);
    auVar23[10] = -(pcVar2[10] == DAT_145d6d9b0._10_1_);
    auVar23[0xb] = -(pcVar2[0xb] == DAT_145d6d9b0._11_1_);
    auVar23[0xc] = -(pcVar2[0xc] == DAT_145d6d9b0._12_1_);
    auVar23[0xd] = -(pcVar2[0xd] == DAT_145d6d9b0._13_1_);
    auVar23[0xe] = -(pcVar2[0xe] == DAT_145d6d9b0._14_1_);
    auVar23[0xf] = -(pcVar2[0xf] == DAT_145d6d9b0._15_1_);
    if ((ushort)((ushort)(SUB161(auVar23 >> 7,0) & 1) | (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar23 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar23 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar23 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar23 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar23 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar23 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar23 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar23 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar23 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar23 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar23 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar23 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar23 >> 0x77,0) & 1) << 0xe | (ushort)(auVar23[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar8 = *(ulong *)(lVar9 + uVar15 * -0x18 + -8);
      if (((uVar8 < *(ulong *)(param_3 + 0x218)) &&
          (uVar8 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar8 * 8), uVar8 != 0)) &&
         (lVar9 = ~uVar8 * 0x38, *(char *)(lVar13 + 0x30 + lVar9) != '\0')) {
        lVar13 = lVar13 + lVar9;
        *(undefined4 *)(lVar13 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
        **(float **)(lVar13 + 0x10) = fVar17;
        return;
      }
      goto LAB_14003ddf1;
    }
    uVar14 = (ushort)(uVar12 - 1) & (ushort)uVar12;
    uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar14);
  }
  auVar19[0] = -(*pcVar1 == -1);
  auVar19[1] = -(pcVar1[1] == -1);
  auVar19[2] = -(pcVar1[2] == -1);
  auVar19[3] = -(pcVar1[3] == -1);
  auVar19[4] = -(pcVar1[4] == -1);
  auVar19[5] = -(pcVar1[5] == -1);
  auVar19[6] = -(pcVar1[6] == -1);
  auVar19[7] = -(pcVar1[7] == -1);
  auVar19[8] = -(pcVar1[8] == -1);
  auVar19[9] = -(pcVar1[9] == -1);
  auVar19[10] = -(pcVar1[10] == -1);
  auVar19[0xb] = -(pcVar1[0xb] == -1);
  auVar19[0xc] = -(pcVar1[0xc] == -1);
  auVar19[0xd] = -(pcVar1[0xd] == -1);
  auVar19[0xe] = -(pcVar1[0xe] == -1);
  auVar19[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar19 >> 7,0) & 1) != 0 || (SUB161(auVar19 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar19 >> 0x17,0) & 1) != 0) || (SUB161(auVar19 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar19 >> 0x27,0) & 1) != 0) || (SUB161(auVar19 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar19 >> 0x37,0) & 1) != 0) || (SUB161(auVar19 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar19 >> 0x47,0) & 1) != 0) || (SUB161(auVar19 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar19 >> 0x57,0) & 1) != 0) || (SUB161(auVar19 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar19 >> 0x67,0) & 1) != 0) || (SUB161(auVar19 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar19 >> 0x77,0) & 1) != 0) || auVar19[0xf] < '\0') {
LAB_14003ddf1:
    func_0x000145d699c0();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  uVar10 = uVar10 + lVar16 + 0x10;
  lVar16 = lVar16 + 0x10;
  goto LAB_14003dd1d;
}
