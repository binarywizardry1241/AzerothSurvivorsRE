
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  uint *puVar1;
  char *pcVar2;
  char *pcVar3;
  byte bVar4;
  byte bVar5;
  byte bVar6;
  undefined4 uVar7;
  byte *pbVar8;
  long lVar9;
  code *pcVar10;
  uint uVar11;
  uint uVar12;
  byte bVar13;
  uint uVar14;
  undefined4 *puVar15;
  long lVar16;
  long lVar17;
  undefined4 *puVar18;
  ulong uVar19;
  long lVar20;
  ushort uVar21;
  ulong uVar22;
  int iVar23;
  int iVar24;
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined1 auVar31 [16];
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  undefined1 auVar35 [16];
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  float fVar39;
  float fVar40;
  undefined1 auVar41 [16];
  uint *local_e0;
  long local_d8;
  char local_d0;
  long local_c8;
  
  bVar13 = func_0x000140666540();
  auVar38 = _DAT_1462602e0;
  auVar37 = _DAT_146258d30;
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar16 = *(long *)(param_3 + 0x78);
    uVar19 = 0x3bf3b42c574dae36;
    lVar20 = 0;
    while( true ) {
      uVar19 = uVar19 & *(ulong *)(param_3 + 0x80);
      auVar41 = *(undefined1 (*) [16])(lVar16 + uVar19);
      auVar27[0] = -(auVar41[0] == DAT_146258d30);
      auVar27[1] = -(auVar41[1] == DAT_146258d30._1_1_);
      auVar27[2] = -(auVar41[2] == DAT_146258d30._2_1_);
      auVar27[3] = -(auVar41[3] == DAT_146258d30._3_1_);
      auVar27[4] = -(auVar41[4] == DAT_146258d30._4_1_);
      auVar27[5] = -(auVar41[5] == DAT_146258d30._5_1_);
      auVar27[6] = -(auVar41[6] == DAT_146258d30._6_1_);
      auVar27[7] = -(auVar41[7] == DAT_146258d30._7_1_);
      auVar27[8] = -(auVar41[8] == DAT_146258d30._8_1_);
      auVar27[9] = -(auVar41[9] == DAT_146258d30._9_1_);
      auVar27[10] = -(auVar41[10] == DAT_146258d30._10_1_);
      auVar27[0xb] = -(auVar41[0xb] == DAT_146258d30._11_1_);
      auVar27[0xc] = -(auVar41[0xc] == DAT_146258d30._12_1_);
      auVar27[0xd] = -(auVar41[0xd] == DAT_146258d30._13_1_);
      auVar27[0xe] = -(auVar41[0xe] == DAT_146258d30._14_1_);
      auVar27[0xf] = -(auVar41[0xf] == DAT_146258d30._15_1_);
      uVar21 = (ushort)(SUB161(auVar27 >> 7,0) & 1) | (ushort)(SUB161(auVar27 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar27 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar27 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar27 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar27 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar27 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar27 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar27 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar27 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar27 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar27 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar27 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar27 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar27 >> 0x77,0) & 1) << 0xe | (ushort)(auVar27[0xf] >> 7) << 0xf;
      uVar14 = (uint)uVar21;
      while (uVar21 != 0) {
        uVar11 = 0;
        for (uVar12 = uVar14; (uVar12 & 1) == 0; uVar12 = uVar12 >> 1 | 0x80000000) {
          uVar11 = uVar11 + 1;
        }
        uVar22 = uVar11 + uVar19 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar16 + -0x18 + uVar22 * -0x18);
        auVar33[0] = -(*pcVar2 == DAT_1462602e0);
        auVar33[1] = -(pcVar2[1] == DAT_1462602e0._1_1_);
        auVar33[2] = -(pcVar2[2] == DAT_1462602e0._2_1_);
        auVar33[3] = -(pcVar2[3] == DAT_1462602e0._3_1_);
        auVar33[4] = -(pcVar2[4] == DAT_1462602e0._4_1_);
        auVar33[5] = -(pcVar2[5] == DAT_1462602e0._5_1_);
        auVar33[6] = -(pcVar2[6] == DAT_1462602e0._6_1_);
        auVar33[7] = -(pcVar2[7] == DAT_1462602e0._7_1_);
        auVar33[8] = -(pcVar2[8] == DAT_1462602e0._8_1_);
        auVar33[9] = -(pcVar2[9] == DAT_1462602e0._9_1_);
        auVar33[10] = -(pcVar2[10] == DAT_1462602e0._10_1_);
        auVar33[0xb] = -(pcVar2[0xb] == DAT_1462602e0._11_1_);
        auVar33[0xc] = -(pcVar2[0xc] == DAT_1462602e0._12_1_);
        auVar33[0xd] = -(pcVar2[0xd] == DAT_1462602e0._13_1_);
        auVar33[0xe] = -(pcVar2[0xe] == DAT_1462602e0._14_1_);
        auVar33[0xf] = -(pcVar2[0xf] == DAT_1462602e0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar33 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar33 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar33 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar33 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar33 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar33 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar33 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar33 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar33 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar33 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar33 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar33 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar33 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar33 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar33 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar33[0xf] >> 7) << 0xf) == 0xffff) {
          uVar19 = *(ulong *)(lVar16 + uVar22 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x218) <= uVar19) ||
             (uVar19 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar19 * 8), uVar19 == 0))
          goto LAB_1402dd9d2;
          lVar16 = ~uVar19 * 0x38;
          if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar16) == '\0') goto LAB_1402dd9d2;
          lVar16 = *(long *)(param_3 + 0x1e0) + lVar16;
          pbVar8 = *(byte **)(lVar16 + 0x10);
          uVar7 = *(undefined4 *)(param_3 + 0x5b0);
          bVar4 = pbVar8[0x18];
          bVar13 = bVar13 | bVar4;
          bVar5 = *pbVar8;
          auVar41._8_8_ = 0;
          auVar41._0_8_ = *(ulong *)(pbVar8 + 4);
          *(undefined4 *)(lVar16 + 0x2c) = uVar7;
          pbVar8[0x18] = 0;
          if (bVar13 == 0) {
            *(undefined4 *)(lVar16 + 0x2c) = uVar7;
            pbVar8[0] = 0;
            pbVar8[1] = 0;
            pbVar8[2] = 0;
            pbVar8[3] = 0;
          }
          bVar6 = pbVar8[0xc];
          fVar40 = *(float *)(pbVar8 + 0x10);
          fVar39 = *(float *)(pbVar8 + 0x14);
          func_0x00014047ef20();
          uVar7 = *(undefined4 *)(param_3 + 0x5b0);
          func_0x0001404790a0();
          puVar1 = local_e0 + local_d8;
          if (local_d0 == '\0') {
            lVar16 = local_d8 << 2;
            goto LAB_1402dda10;
          }
          lVar16 = local_d8 << 2;
          goto LAB_1402dd970;
        }
        uVar21 = (ushort)(uVar14 - 1) & (ushort)uVar14;
        uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar21);
      }
      auVar30[0] = -(auVar41[0] == -1);
      auVar30[1] = -(auVar41[1] == -1);
      auVar30[2] = -(auVar41[2] == -1);
      auVar30[3] = -(auVar41[3] == -1);
      auVar30[4] = -(auVar41[4] == -1);
      auVar30[5] = -(auVar41[5] == -1);
      auVar30[6] = -(auVar41[6] == -1);
      auVar30[7] = -(auVar41[7] == -1);
      auVar30[8] = -(auVar41[8] == -1);
      auVar30[9] = -(auVar41[9] == -1);
      auVar30[10] = -(auVar41[10] == -1);
      auVar30[0xb] = -(auVar41[0xb] == -1);
      auVar30[0xc] = -(auVar41[0xc] == -1);
      auVar30[0xd] = -(auVar41[0xd] == -1);
      auVar30[0xe] = -(auVar41[0xe] == -1);
      auVar30[0xf] = -(auVar41[0xf] == -1);
      if ((((((((((((((((SUB161(auVar30 >> 7,0) & 1) != 0 || (SUB161(auVar30 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar30 >> 0x17,0) & 1) != 0) || (SUB161(auVar30 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar30 >> 0x27,0) & 1) != 0) || (SUB161(auVar30 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar30 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar30 >> 0x3f,0) & 1) != 0) || (SUB161(auVar30 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar30 >> 0x4f,0) & 1) != 0) || (SUB161(auVar30 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar30 >> 0x5f,0) & 1) != 0) || (SUB161(auVar30 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar30 >> 0x6f,0) & 1) != 0) || (SUB161(auVar30 >> 0x77,0) & 1) != 0) ||
          auVar30[0xf] < '\0') break;
      uVar19 = uVar19 + lVar20 + 0x10;
      lVar20 = lVar20 + 0x10;
    }
  }
LAB_1402dd9d2:
  func_0x000146208ee0();
                    /* WARNING: Does not return */
  pcVar10 = (code *)invalidInstructionException();
  (*pcVar10)();
  while( true ) {
    uVar14 = *local_e0;
    local_e0 = local_e0 + 1;
    lVar20 = *(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0);
    lVar16 = lVar16 + -4;
    if (lVar20 != 0) break;
LAB_1402dda10:
    if (lVar16 == 0) goto LAB_1402ddad1;
  }
  lVar16 = *(long *)(param_3 + 0x108) + (ulong)uVar14 * 0xa0;
  uVar19 = (ulong)*(uint *)(lVar16 + 0x94);
  lVar9 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x18 + uVar19 * 0x48);
  lVar17 = ~*(ulong *)(*(long *)(*(long *)(param_3 + 0x1a8) + 0x38 + uVar19 * 0x48) + local_c8 * 8)
           * 0x30;
  uVar19 = (ulong)~*(uint *)(*(long *)(lVar16 + 0x50) + 8);
  lVar16 = uVar19 * 0xf8 + *(long *)(lVar9 + 0x10 + lVar17);
  puVar18 = (undefined4 *)(uVar19 * 4 + *(long *)(lVar9 + 0x28 + lVar17));
  iVar23 = 1;
  goto LAB_1402dda94;
LAB_1402ddad1:
  puVar18 = (undefined4 *)0x0;
  lVar20 = 0;
  iVar24 = 0;
  iVar23 = 0;
  lVar16 = 0;
  local_e0 = puVar1;
  goto joined_r0x0001402dd9c7;
LAB_1402ddb1d:
  if (lVar16 != 0) {
    puVar15 = (undefined4 *)(lVar16 + 200);
    if (*(char *)(lVar16 + 0xb8) != '\0') {
      puVar15 = (undefined4 *)(lVar16 + 0xbc);
    }
    auVar25._0_8_ = *(ulong *)(lVar16 + 0xc0) & 0xffffffff;
    auVar25._8_4_ = (int)(*(ulong *)(lVar16 + 0xc0) >> 0x20);
    auVar25._12_4_ = 0;
    auVar26._0_4_ = (float)(SUB168(auVar25 | _DAT_146260120,0) - (double)DAT_146260120);
    auVar26._4_4_ = (float)(SUB168(auVar25 | _DAT_146260120,8) - DAT_146260120._8_8_);
    auVar26._8_8_ = 0;
    auVar31._4_4_ = *puVar15;
    auVar31._0_4_ = *puVar15;
    auVar31._8_8_ = 0;
    auVar27 = divps(auVar26,auVar31);
    auVar28._0_4_ = auVar27._0_4_ * _DAT_1462777d0;
    auVar28._4_4_ = auVar27._4_4_ * fRam00000001462777d4;
    auVar28._8_4_ = auVar27._8_4_ * fRam00000001462777d8;
    auVar28._12_4_ = auVar27._12_4_ * fRam00000001462777dc;
    uVar14 = (uint)(bVar4 & bVar5);
    auVar32._0_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar32._4_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar32._8_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar32._12_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar41 = ~auVar32 & auVar28 | auVar41 & auVar32;
    uVar14 = (uint)bVar13;
    auVar29._0_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar29._4_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar29._8_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar29._12_4_ = (int)(uVar14 << 0x1f) >> 0x1f;
    auVar29 = auVar29 & auVar41;
    if ((bVar6 != 2) && (((bVar6 ^ bVar13) & 1) == 0)) {
      if ((fVar40 == auVar29._0_4_) && (!NAN(fVar40) && !NAN(auVar29._0_4_))) {
        if ((fVar39 == auVar29._4_4_) && (!NAN(fVar39) && !NAN(auVar29._4_4_))) goto LAB_1402ddd12;
      }
    }
    if (bVar13 != *(byte *)(lVar16 + 0xe1)) {
      *puVar18 = uVar7;
      *(byte *)(lVar16 + 0xe1) = bVar13;
    }
    if (bVar13 != 0) {
      if ((*(float *)(lVar16 + 0xb0) == auVar41._0_4_) &&
         (!NAN(*(float *)(lVar16 + 0xb0)) && !NAN(auVar41._0_4_))) {
        if ((*(float *)(lVar16 + 0xb4) == auVar41._4_4_) &&
           (!NAN(*(float *)(lVar16 + 0xb4)) && !NAN(auVar41._4_4_))) goto LAB_1402ddc25;
      }
      *puVar18 = uVar7;
      *(long *)(lVar16 + 0xb0) = auVar41._0_8_;
    }
LAB_1402ddc25:
    if (*(long *)(param_3 + 0x90) != 0) {
      lVar16 = *(long *)(param_3 + 0x78);
      uVar19 = 0x3bf3b42c574dae36;
      lVar20 = 0;
      while( true ) {
        uVar19 = uVar19 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar16 + uVar19);
        auVar35[0] = -(*pcVar2 == auVar37[0]);
        auVar35[1] = -(pcVar2[1] == auVar37[1]);
        auVar35[2] = -(pcVar2[2] == auVar37[2]);
        auVar35[3] = -(pcVar2[3] == auVar37[3]);
        auVar35[4] = -(pcVar2[4] == auVar37[4]);
        auVar35[5] = -(pcVar2[5] == auVar37[5]);
        auVar35[6] = -(pcVar2[6] == auVar37[6]);
        auVar35[7] = -(pcVar2[7] == auVar37[7]);
        auVar35[8] = -(pcVar2[8] == auVar37[8]);
        auVar35[9] = -(pcVar2[9] == auVar37[9]);
        auVar35[10] = -(pcVar2[10] == auVar37[10]);
        auVar35[0xb] = -(pcVar2[0xb] == auVar37[0xb]);
        auVar35[0xc] = -(pcVar2[0xc] == auVar37[0xc]);
        auVar35[0xd] = -(pcVar2[0xd] == auVar37[0xd]);
        auVar35[0xe] = -(pcVar2[0xe] == auVar37[0xe]);
        auVar35[0xf] = -(pcVar2[0xf] == auVar37[0xf]);
        uVar21 = (ushort)(SUB161(auVar35 >> 7,0) & 1) | (ushort)(SUB161(auVar35 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar35 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar35 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar35 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar35 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar35 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar35 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar35 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar35 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar35 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar35 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar35 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar35 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar35 >> 0x77,0) & 1) << 0xe | (ushort)(auVar35[0xf] >> 7) << 0xf
        ;
        uVar14 = (uint)uVar21;
        while (uVar21 != 0) {
          uVar11 = 0;
          for (uVar12 = uVar14; (uVar12 & 1) == 0; uVar12 = uVar12 >> 1 | 0x80000000) {
            uVar11 = uVar11 + 1;
          }
          uVar22 = uVar11 + uVar19 & *(ulong *)(param_3 + 0x80);
          pcVar3 = (char *)(lVar16 + -0x18 + uVar22 * -0x18);
          auVar36[0] = -(*pcVar3 == auVar38[0]);
          auVar36[1] = -(pcVar3[1] == auVar38[1]);
          auVar36[2] = -(pcVar3[2] == auVar38[2]);
          auVar36[3] = -(pcVar3[3] == auVar38[3]);
          auVar36[4] = -(pcVar3[4] == auVar38[4]);
          auVar36[5] = -(pcVar3[5] == auVar38[5]);
          auVar36[6] = -(pcVar3[6] == auVar38[6]);
          auVar36[7] = -(pcVar3[7] == auVar38[7]);
          auVar36[8] = -(pcVar3[8] == auVar38[8]);
          auVar36[9] = -(pcVar3[9] == auVar38[9]);
          auVar36[10] = -(pcVar3[10] == auVar38[10]);
          auVar36[0xb] = -(pcVar3[0xb] == auVar38[0xb]);
          auVar36[0xc] = -(pcVar3[0xc] == auVar38[0xc]);
          auVar36[0xd] = -(pcVar3[0xd] == auVar38[0xd]);
          auVar36[0xe] = -(pcVar3[0xe] == auVar38[0xe]);
          auVar36[0xf] = -(pcVar3[0xf] == auVar38[0xf]);
          if ((ushort)((ushort)(SUB161(auVar36 >> 7,0) & 1) |
                       (ushort)(SUB161(auVar36 >> 0xf,0) & 1) << 1 |
                       (ushort)(SUB161(auVar36 >> 0x17,0) & 1) << 2 |
                       (ushort)(SUB161(auVar36 >> 0x1f,0) & 1) << 3 |
                       (ushort)(SUB161(auVar36 >> 0x27,0) & 1) << 4 |
                       (ushort)(SUB161(auVar36 >> 0x2f,0) & 1) << 5 |
                       (ushort)(SUB161(auVar36 >> 0x37,0) & 1) << 6 |
                       (ushort)(SUB161(auVar36 >> 0x3f,0) & 1) << 7 |
                       (ushort)(SUB161(auVar36 >> 0x47,0) & 1) << 8 |
                       (ushort)(SUB161(auVar36 >> 0x4f,0) & 1) << 9 |
                       (ushort)(SUB161(auVar36 >> 0x57,0) & 1) << 10 |
                       (ushort)(SUB161(auVar36 >> 0x5f,0) & 1) << 0xb |
                       (ushort)(SUB161(auVar36 >> 0x67,0) & 1) << 0xc |
                       (ushort)(SUB161(auVar36 >> 0x6f,0) & 1) << 0xd |
                       (ushort)(SUB161(auVar36 >> 0x77,0) & 1) << 0xe |
                      (ushort)(auVar36[0xf] >> 7) << 0xf) == 0xffff) {
            uVar19 = *(ulong *)(lVar16 + uVar22 * -0x18 + -8);
            if ((*(ulong *)(param_3 + 0x218) <= uVar19) ||
               (uVar19 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar19 * 8), uVar19 == 0))
            goto LAB_1402ddd55;
            lVar16 = ~uVar19 * 0x38;
            if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar16) == '\0') goto LAB_1402ddd55;
            lVar16 = *(long *)(param_3 + 0x1e0) + lVar16;
            lVar20 = *(long *)(lVar16 + 0x10);
            *(undefined4 *)(lVar16 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
            *(byte *)(lVar20 + 0xc) = bVar13;
            *(long *)(lVar20 + 0x10) = auVar29._0_8_;
            goto LAB_1402ddd12;
          }
          uVar21 = (ushort)(uVar14 - 1) & (ushort)uVar14;
          uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar21);
        }
        auVar34[0] = -(*pcVar2 == -1);
        auVar34[1] = -(pcVar2[1] == -1);
        auVar34[2] = -(pcVar2[2] == -1);
        auVar34[3] = -(pcVar2[3] == -1);
        auVar34[4] = -(pcVar2[4] == -1);
        auVar34[5] = -(pcVar2[5] == -1);
        auVar34[6] = -(pcVar2[6] == -1);
        auVar34[7] = -(pcVar2[7] == -1);
        auVar34[8] = -(pcVar2[8] == -1);
        auVar34[9] = -(pcVar2[9] == -1);
        auVar34[10] = -(pcVar2[10] == -1);
        auVar34[0xb] = -(pcVar2[0xb] == -1);
        auVar34[0xc] = -(pcVar2[0xc] == -1);
        auVar34[0xd] = -(pcVar2[0xd] == -1);
        auVar34[0xe] = -(pcVar2[0xe] == -1);
        auVar34[0xf] = -(pcVar2[0xf] == -1);
        if ((((((((((((((((SUB161(auVar34 >> 7,0) & 1) != 0 || (SUB161(auVar34 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar34 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar34 >> 0x1f,0) & 1) != 0) || (SUB161(auVar34 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar34 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar34 >> 0x37,0) & 1) != 0) || (SUB161(auVar34 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar34 >> 0x47,0) & 1) != 0) || (SUB161(auVar34 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar34 >> 0x57,0) & 1) != 0) || (SUB161(auVar34 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar34 >> 0x67,0) & 1) != 0) || (SUB161(auVar34 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar34 >> 0x77,0) & 1) != 0) || auVar34[0xf] < '\0') break;
        uVar19 = uVar19 + lVar20 + 0x10;
        lVar20 = lVar20 + 0x10;
      }
    }
LAB_1402ddd55:
    func_0x000146208ee0();
                    /* WARNING: Does not return */
    pcVar10 = (code *)invalidInstructionException();
    (*pcVar10)();
  }
  goto LAB_1402ddd12;
  while( true ) {
    uVar14 = *local_e0;
    local_e0 = local_e0 + 1;
    lVar20 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48);
    lVar16 = lVar16 + -4;
    if (lVar20 != 0) break;
LAB_1402dd970:
    if (lVar16 == 0) goto LAB_1402ddad1;
  }
  lVar16 = *(long *)(param_3 + 0x1a8) + (ulong)uVar14 * 0x48;
  lVar9 = *(long *)(lVar16 + 0x18);
  lVar17 = ~*(ulong *)(*(long *)(lVar16 + 0x38) + local_c8 * 8) * 0x30;
  lVar16 = *(long *)(lVar9 + 0x10 + lVar17);
  puVar18 = *(undefined4 **)(lVar9 + 0x28 + lVar17);
  iVar24 = 1;
  iVar23 = 1;
joined_r0x0001402dd9c7:
  if (local_d0 == '\0') {
LAB_1402dda94:
    if (iVar23 == (int)lVar20) {
      do {
        if (local_e0 == puVar1) goto LAB_1402ddb1d;
        uVar14 = *local_e0;
        local_e0 = local_e0 + 1;
      } while (*(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0);
    }
  }
  else if (iVar24 == (int)lVar20) {
    do {
      if (local_e0 == puVar1) goto LAB_1402ddb1d;
      uVar14 = *local_e0;
      local_e0 = local_e0 + 1;
    } while (*(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) == 0);
  }
LAB_1402ddd12:
  func_0x000140059910();
  return;
}

