/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14007cd50(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,
                  char *param_5)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  ulong uVar4;
  code *pcVar5;
  uint uVar6;
  uint uVar7;
  long lVar8;
  ulong uVar9;
  uint uVar10;
  long lVar11;
  ushort uVar12;
  ulong uVar13;
  long lVar14;
  bool bVar15;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  long local_88;
  long local_60;

  cVar3 = *param_5;
  *param_5 = '\x01';
  if (cVar3 == '\0') {
    func_0x000140724570(param_1,param_3,0x145dce443,param_3,9,0x145dcf7cd);
  }
  func_0x00014093fdd0();
  if (local_60 == -1) {
    func_0x0001407279a0();
    local_60 = local_88;
  }
  if (local_60 == -1) {
    bVar15 = true;
  }
  else {
    auVar21 = func_0x000140089200();
    bVar15 = true;
    if (auVar21._8_8_ == 1) {
      bVar15 = *auVar21._0_8_ != '0';
    }
    if (local_60 != 0) {
      func_0x0001400021d0();
    }
  }
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar8 = *(long *)(param_3 + 0x78);
    uVar4 = *(ulong *)(param_3 + 0x80);
    uVar9 = 0x5ad1703cb9f182f4;
    lVar11 = 0;
    while( true ) {
      uVar9 = uVar9 & uVar4;
      pcVar1 = (char *)(lVar8 + uVar9);
      auVar21[0] = -(*pcVar1 == DAT_145d9d660);
      auVar21[1] = -(pcVar1[1] == DAT_145d9d660._1_1_);
      auVar21[2] = -(pcVar1[2] == DAT_145d9d660._2_1_);
      auVar21[3] = -(pcVar1[3] == DAT_145d9d660._3_1_);
      auVar21[4] = -(pcVar1[4] == DAT_145d9d660._4_1_);
      auVar21[5] = -(pcVar1[5] == DAT_145d9d660._5_1_);
      auVar21[6] = -(pcVar1[6] == DAT_145d9d660._6_1_);
      auVar21[7] = -(pcVar1[7] == DAT_145d9d660._7_1_);
      auVar21[8] = -(pcVar1[8] == DAT_145d9d660._8_1_);
      auVar21[9] = -(pcVar1[9] == DAT_145d9d660._9_1_);
      auVar21[10] = -(pcVar1[10] == DAT_145d9d660._10_1_);
      auVar21[0xb] = -(pcVar1[0xb] == DAT_145d9d660._11_1_);
      auVar21[0xc] = -(pcVar1[0xc] == DAT_145d9d660._12_1_);
      auVar21[0xd] = -(pcVar1[0xd] == DAT_145d9d660._13_1_);
      auVar21[0xe] = -(pcVar1[0xe] == DAT_145d9d660._14_1_);
      auVar21[0xf] = -(pcVar1[0xf] == DAT_145d9d660._15_1_);
      uVar12 = (ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar21 >> 0x77,0) & 1) << 0xe | (ushort)(auVar21[0xf] >> 7) << 0xf;
      uVar10 = (uint)uVar12;
      while (uVar12 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar10; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar13 = uVar6 + uVar9 & uVar4;
        pcVar2 = (char *)(lVar8 + -0x18 + uVar13 * -0x18);
        auVar18[0] = -(*pcVar2 == DAT_145d9db10);
        auVar18[1] = -(pcVar2[1] == DAT_145d9db10._1_1_);
        auVar18[2] = -(pcVar2[2] == DAT_145d9db10._2_1_);
        auVar18[3] = -(pcVar2[3] == DAT_145d9db10._3_1_);
        auVar18[4] = -(pcVar2[4] == DAT_145d9db10._4_1_);
        auVar18[5] = -(pcVar2[5] == DAT_145d9db10._5_1_);
        auVar18[6] = -(pcVar2[6] == DAT_145d9db10._6_1_);
        auVar18[7] = -(pcVar2[7] == DAT_145d9db10._7_1_);
        auVar18[8] = -(pcVar2[8] == DAT_145d9db10._8_1_);
        auVar18[9] = -(pcVar2[9] == DAT_145d9db10._9_1_);
        auVar18[10] = -(pcVar2[10] == DAT_145d9db10._10_1_);
        auVar18[0xb] = -(pcVar2[0xb] == DAT_145d9db10._11_1_);
        auVar18[0xc] = -(pcVar2[0xc] == DAT_145d9db10._12_1_);
        auVar18[0xd] = -(pcVar2[0xd] == DAT_145d9db10._13_1_);
        auVar18[0xe] = -(pcVar2[0xe] == DAT_145d9db10._14_1_);
        auVar18[0xf] = -(pcVar2[0xf] == DAT_145d9db10._15_1_);
        if ((ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar18[0xf] >> 7) << 0xf) == 0xffff) {
          uVar9 = *(ulong *)(lVar8 + uVar13 * -0x18 + -8);
          if (*(ulong *)(param_3 + 0x218) <= uVar9) goto LAB_14007cfc5;
          uVar9 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar9 * 8);
          if (uVar9 == 0) goto LAB_14007cfc5;
          lVar11 = *(long *)(param_3 + 0x1e0);
          lVar14 = ~uVar9 * 0x38;
          if (*(char *)(lVar11 + 0x30 + lVar14) == '\0') goto LAB_14007cfc5;
          if (bVar15 == (bool)*(char *)(*(long *)(lVar14 + lVar11 + 0x10) + 0x1c)) {
            return;
          }
          uVar9 = 0x5ad1703cb9f182f4;
          lVar14 = 0;
          goto LAB_14007cf57;
        }
        uVar12 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar12);
      }
      auVar16[0] = -(*pcVar1 == -1);
      auVar16[1] = -(pcVar1[1] == -1);
      auVar16[2] = -(pcVar1[2] == -1);
      auVar16[3] = -(pcVar1[3] == -1);
      auVar16[4] = -(pcVar1[4] == -1);
      auVar16[5] = -(pcVar1[5] == -1);
      auVar16[6] = -(pcVar1[6] == -1);
      auVar16[7] = -(pcVar1[7] == -1);
      auVar16[8] = -(pcVar1[8] == -1);
      auVar16[9] = -(pcVar1[9] == -1);
      auVar16[10] = -(pcVar1[10] == -1);
      auVar16[0xb] = -(pcVar1[0xb] == -1);
      auVar16[0xc] = -(pcVar1[0xc] == -1);
      auVar16[0xd] = -(pcVar1[0xd] == -1);
      auVar16[0xe] = -(pcVar1[0xe] == -1);
      auVar16[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar16 >> 7,0) & 1) != 0 || (SUB161(auVar16 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar16 >> 0x17,0) & 1) != 0) || (SUB161(auVar16 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar16 >> 0x27,0) & 1) != 0) || (SUB161(auVar16 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar16 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar16 >> 0x3f,0) & 1) != 0) || (SUB161(auVar16 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar16 >> 0x4f,0) & 1) != 0) || (SUB161(auVar16 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar16 >> 0x5f,0) & 1) != 0) || (SUB161(auVar16 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar16 >> 0x6f,0) & 1) != 0) || (SUB161(auVar16 >> 0x77,0) & 1) != 0) ||
          auVar16[0xf] < '\0') break;
      uVar9 = uVar9 + lVar11 + 0x10;
      lVar11 = lVar11 + 0x10;
    }
  }
LAB_14007cfc5:
  func_0x000145d99830();
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
LAB_14007cf57:
  uVar9 = uVar9 & uVar4;
  pcVar1 = (char *)(lVar8 + uVar9);
  auVar19[0] = -(*pcVar1 == DAT_145d9d660);
  auVar19[1] = -(pcVar1[1] == DAT_145d9d660._1_1_);
  auVar19[2] = -(pcVar1[2] == DAT_145d9d660._2_1_);
  auVar19[3] = -(pcVar1[3] == DAT_145d9d660._3_1_);
  auVar19[4] = -(pcVar1[4] == DAT_145d9d660._4_1_);
  auVar19[5] = -(pcVar1[5] == DAT_145d9d660._5_1_);
  auVar19[6] = -(pcVar1[6] == DAT_145d9d660._6_1_);
  auVar19[7] = -(pcVar1[7] == DAT_145d9d660._7_1_);
  auVar19[8] = -(pcVar1[8] == DAT_145d9d660._8_1_);
  auVar19[9] = -(pcVar1[9] == DAT_145d9d660._9_1_);
  auVar19[10] = -(pcVar1[10] == DAT_145d9d660._10_1_);
  auVar19[0xb] = -(pcVar1[0xb] == DAT_145d9d660._11_1_);
  auVar19[0xc] = -(pcVar1[0xc] == DAT_145d9d660._12_1_);
  auVar19[0xd] = -(pcVar1[0xd] == DAT_145d9d660._13_1_);
  auVar19[0xe] = -(pcVar1[0xe] == DAT_145d9d660._14_1_);
  auVar19[0xf] = -(pcVar1[0xf] == DAT_145d9d660._15_1_);
  uVar12 = (ushort)(SUB161(auVar19 >> 7,0) & 1) | (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar19 >> 0x17,0) & 1) << 2 |
           (ushort)(SUB161(auVar19 >> 0x1f,0) & 1) << 3 |
           (ushort)(SUB161(auVar19 >> 0x27,0) & 1) << 4 |
           (ushort)(SUB161(auVar19 >> 0x2f,0) & 1) << 5 |
           (ushort)(SUB161(auVar19 >> 0x37,0) & 1) << 6 |
           (ushort)(SUB161(auVar19 >> 0x3f,0) & 1) << 7 |
           (ushort)(SUB161(auVar19 >> 0x47,0) & 1) << 8 |
           (ushort)(SUB161(auVar19 >> 0x4f,0) & 1) << 9 |
           (ushort)(SUB161(auVar19 >> 0x57,0) & 1) << 10 |
           (ushort)(SUB161(auVar19 >> 0x5f,0) & 1) << 0xb |
           (ushort)(SUB161(auVar19 >> 0x67,0) & 1) << 0xc |
           (ushort)(SUB161(auVar19 >> 0x6f,0) & 1) << 0xd |
           (ushort)(SUB161(auVar19 >> 0x77,0) & 1) << 0xe | (ushort)(auVar19[0xf] >> 7) << 0xf;
  uVar10 = (uint)uVar12;
  while (uVar12 != 0) {
    uVar6 = 0;
    for (uVar7 = uVar10; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
      uVar6 = uVar6 + 1;
    }
    uVar13 = uVar6 + uVar9 & uVar4;
    pcVar2 = (char *)(lVar8 + -0x18 + uVar13 * -0x18);
    auVar20[0] = -(*pcVar2 == DAT_145d9db10);
    auVar20[1] = -(pcVar2[1] == DAT_145d9db10._1_1_);
    auVar20[2] = -(pcVar2[2] == DAT_145d9db10._2_1_);
    auVar20[3] = -(pcVar2[3] == DAT_145d9db10._3_1_);
    auVar20[4] = -(pcVar2[4] == DAT_145d9db10._4_1_);
    auVar20[5] = -(pcVar2[5] == DAT_145d9db10._5_1_);
    auVar20[6] = -(pcVar2[6] == DAT_145d9db10._6_1_);
    auVar20[7] = -(pcVar2[7] == DAT_145d9db10._7_1_);
    auVar20[8] = -(pcVar2[8] == DAT_145d9db10._8_1_);
    auVar20[9] = -(pcVar2[9] == DAT_145d9db10._9_1_);
    auVar20[10] = -(pcVar2[10] == DAT_145d9db10._10_1_);
    auVar20[0xb] = -(pcVar2[0xb] == DAT_145d9db10._11_1_);
    auVar20[0xc] = -(pcVar2[0xc] == DAT_145d9db10._12_1_);
    auVar20[0xd] = -(pcVar2[0xd] == DAT_145d9db10._13_1_);
    auVar20[0xe] = -(pcVar2[0xe] == DAT_145d9db10._14_1_);
    auVar20[0xf] = -(pcVar2[0xf] == DAT_145d9db10._15_1_);
    if ((ushort)((ushort)(SUB161(auVar20 >> 7,0) & 1) | (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar20 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe | (ushort)(auVar20[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar4 = *(ulong *)(lVar8 + uVar13 * -0x18 + -8);
      if (((uVar4 < *(ulong *)(param_3 + 0x218)) &&
          (uVar4 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar4 * 8), uVar4 != 0)) &&
         (lVar8 = ~uVar4 * 0x38, *(char *)(lVar11 + 0x30 + lVar8) != '\0')) {
        lVar11 = lVar11 + lVar8;
        *(undefined4 *)(lVar11 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
        *(bool *)(*(long *)(lVar11 + 0x10) + 0x1c) = bVar15;
        return;
      }
      goto LAB_14007d038;
    }
    uVar12 = (ushort)(uVar10 - 1) & (ushort)uVar10;
    uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar12);
  }
  auVar17[0] = -(*pcVar1 == -1);
  auVar17[1] = -(pcVar1[1] == -1);
  auVar17[2] = -(pcVar1[2] == -1);
  auVar17[3] = -(pcVar1[3] == -1);
  auVar17[4] = -(pcVar1[4] == -1);
  auVar17[5] = -(pcVar1[5] == -1);
  auVar17[6] = -(pcVar1[6] == -1);
  auVar17[7] = -(pcVar1[7] == -1);
  auVar17[8] = -(pcVar1[8] == -1);
  auVar17[9] = -(pcVar1[9] == -1);
  auVar17[10] = -(pcVar1[10] == -1);
  auVar17[0xb] = -(pcVar1[0xb] == -1);
  auVar17[0xc] = -(pcVar1[0xc] == -1);
  auVar17[0xd] = -(pcVar1[0xd] == -1);
  auVar17[0xe] = -(pcVar1[0xe] == -1);
  auVar17[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar17 >> 7,0) & 1) != 0 || (SUB161(auVar17 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar17 >> 0x17,0) & 1) != 0) || (SUB161(auVar17 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar17 >> 0x27,0) & 1) != 0) || (SUB161(auVar17 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar17 >> 0x37,0) & 1) != 0) || (SUB161(auVar17 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar17 >> 0x47,0) & 1) != 0) || (SUB161(auVar17 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar17 >> 0x57,0) & 1) != 0) || (SUB161(auVar17 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar17 >> 0x67,0) & 1) != 0) || (SUB161(auVar17 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar17 >> 0x77,0) & 1) != 0) || auVar17[0xf] < '\0') {
LAB_14007d038:
    func_0x000145d99830();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  uVar9 = uVar9 + lVar14 + 0x10;
  lVar14 = lVar14 + 0x10;
  goto LAB_14007cf57;
}
