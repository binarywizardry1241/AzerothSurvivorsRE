
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * FUN_145be0a60(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,long *param_5)

{
  ulong uVar1;
  ulong uVar2;
  char *pcVar3;
  char cVar4;
  bool bVar5;
  code *pcVar6;
  ushort uVar7;
  short sVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  ulong uVar12;
  long lVar13;
  undefined1 uVar14;
  ulong uVar15;
  long lVar16;
  ushort uVar17;
  ulong uVar18;
  long lVar19;
  bool bVar20;
  bool bVar21;
  byte bVar22;
  float fVar23;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined8 extraout_XMM1_Qb;
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  double dVar31;
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  float fVar34;
  undefined8 in_XMM3_Qa;
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  undefined8 in_XMM6_Qa;
  undefined1 auVar39 [16];
  float fVar40;
  undefined4 uVar41;
  undefined8 in_XMM7_Qa;
  float fVar42;
  undefined4 uVar43;
  undefined4 uVar44;
  undefined4 uVar45;
  float fVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  float in_XMM10_Da;
  float in_XMM11_Da;
  float in_XMM12_Da;
  double dVar49;
  undefined1 auVar50 [16];
  long lStack_188;
  long lStack_180;
  ulong uStack_178;
  long lStack_158;
  undefined8 uStack_150;
  float fStack_148;
  double dStack_140;
  undefined8 uStack_138;
  undefined8 uStack_130;
  float fStack_128;
  undefined8 uStack_124;
  float fStack_11c;
  undefined4 uStack_114;
  float fStack_110;
  float fStack_10c;
  float fStack_108;
  long lStack_100;
  undefined8 uStack_f8;
  float fStack_f0;
  long lStack_e8;
  undefined8 uStack_e0;
  float fStack_d8;
  float fStack_c8;
  double dVar35;
  
  fVar42 = (float)((ulong)in_XMM7_Qa >> 0x20);
  fVar40 = (float)in_XMM7_Qa;
  fVar46 = (float)((ulong)in_XMM6_Qa >> 0x20);
  fVar23 = (float)in_XMM6_Qa;
  uVar48 = (undefined4)((ulong)in_XMM3_Qa >> 0x20);
  uVar47 = (undefined4)in_XMM3_Qa;
  uStack_e0 = 0xfffffffffffffffe;
  uVar17 = *(ushort *)(param_5 + 3);
  fStack_d8 = fVar23;
  fStack_c8 = fVar40;
  if (uVar17 == 0xaa) {
    if (7 < (ulong)param_5[2]) {
      lVar13 = *(long *)param_5[1];
      lStack_188 = lVar13;
      uVar12 = func_0x000140051b90(param_5,param_4,&lStack_188,param_3 + 0x40);
      lVar16 = *(long *)(param_3 + 0x20);
      uVar15 = *(ulong *)(param_3 + 0x28);
      bVar22 = (byte)(uVar12 >> 0x39);
      auVar50 = ZEXT216(CONCAT11(bVar22,bVar22));
      auVar50 = pshuflw(auVar50,auVar50,0);
      lVar19 = 0;
      while( true ) {
        uVar12 = uVar12 & uVar15;
        pcVar3 = (char *)(lVar16 + uVar12);
        auVar36[0] = -(*pcVar3 == auVar50[0]);
        auVar36[1] = -(pcVar3[1] == auVar50[1]);
        auVar36[2] = -(pcVar3[2] == auVar50[2]);
        auVar36[3] = -(pcVar3[3] == auVar50[3]);
        auVar36[4] = -(pcVar3[4] == auVar50[4]);
        auVar36[5] = -(pcVar3[5] == auVar50[5]);
        auVar36[6] = -(pcVar3[6] == auVar50[6]);
        auVar36[7] = -(pcVar3[7] == auVar50[7]);
        auVar36[8] = -(pcVar3[8] == auVar50[0]);
        auVar36[9] = -(pcVar3[9] == auVar50[1]);
        auVar36[10] = -(pcVar3[10] == auVar50[2]);
        auVar36[0xb] = -(pcVar3[0xb] == auVar50[3]);
        auVar36[0xc] = -(pcVar3[0xc] == auVar50[4]);
        auVar36[0xd] = -(pcVar3[0xd] == auVar50[5]);
        auVar36[0xe] = -(pcVar3[0xe] == auVar50[6]);
        auVar36[0xf] = -(pcVar3[0xf] == auVar50[7]);
        uVar17 = (ushort)(SUB161(auVar36 >> 7,0) & 1) | (ushort)(SUB161(auVar36 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar36 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar36 >> 0x77,0) & 1) << 0xe | (ushort)(auVar36[0xf] >> 7) << 0xf
        ;
        uVar11 = (uint)uVar17;
        while (uVar17 != 0) {
          uVar9 = 0;
          for (uVar10 = uVar11; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
            uVar9 = uVar9 + 1;
          }
          uVar18 = uVar9 + uVar12 & uVar15;
          if (lVar13 == *(long *)(lVar16 + -0x30 + uVar18 * -0x30)) {
            lVar13 = ((long)(uVar18 * 0x30) >> 4) * -0x5555555555555555;
            uVar15 = lVar13 - 0x10U & uVar15;
            pcVar3 = (char *)(lVar16 + uVar15);
            auVar50[0] = -(*pcVar3 == -1);
            auVar50[1] = -(pcVar3[1] == -1);
            auVar50[2] = -(pcVar3[2] == -1);
            auVar50[3] = -(pcVar3[3] == -1);
            auVar50[4] = -(pcVar3[4] == -1);
            auVar50[5] = -(pcVar3[5] == -1);
            auVar50[6] = -(pcVar3[6] == -1);
            auVar50[7] = -(pcVar3[7] == -1);
            auVar50[8] = -(pcVar3[8] == -1);
            auVar50[9] = -(pcVar3[9] == -1);
            auVar50[10] = -(pcVar3[10] == -1);
            auVar50[0xb] = -(pcVar3[0xb] == -1);
            auVar50[0xc] = -(pcVar3[0xc] == -1);
            auVar50[0xd] = -(pcVar3[0xd] == -1);
            auVar50[0xe] = -(pcVar3[0xe] == -1);
            auVar50[0xf] = -(pcVar3[0xf] == -1);
            uVar7 = (ushort)(SUB161(auVar50 >> 7,0) & 1) |
                    (ushort)(SUB161(auVar50 >> 0xf,0) & 1) << 1 |
                    (ushort)(SUB161(auVar50 >> 0x17,0) & 1) << 2 |
                    (ushort)(SUB161(auVar50 >> 0x1f,0) & 1) << 3 |
                    (ushort)(SUB161(auVar50 >> 0x27,0) & 1) << 4 |
                    (ushort)(SUB161(auVar50 >> 0x2f,0) & 1) << 5 |
                    (ushort)(SUB161(auVar50 >> 0x37,0) & 1) << 6 |
                    (ushort)(SUB161(auVar50 >> 0x3f,0) & 1) << 7 |
                    (ushort)(SUB161(auVar50 >> 0x47,0) & 1) << 8 |
                    (ushort)(SUB161(auVar50 >> 0x4f,0) & 1) << 9 |
                    (ushort)(SUB161(auVar50 >> 0x57,0) & 1) << 10 |
                    (ushort)(SUB161(auVar50 >> 0x5f,0) & 1) << 0xb |
                    (ushort)(SUB161(auVar50 >> 0x67,0) & 1) << 0xc |
                    (ushort)(SUB161(auVar50 >> 0x6f,0) & 1) << 0xd |
                    (ushort)(SUB161(auVar50 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar50[0xf] >> 7) << 0xf;
            pcVar3 = (char *)(lVar16 + lVar13);
            auVar25[0] = -(*pcVar3 == -1);
            auVar25[1] = -(pcVar3[1] == -1);
            auVar25[2] = -(pcVar3[2] == -1);
            auVar25[3] = -(pcVar3[3] == -1);
            auVar25[4] = -(pcVar3[4] == -1);
            auVar25[5] = -(pcVar3[5] == -1);
            auVar25[6] = -(pcVar3[6] == -1);
            auVar25[7] = -(pcVar3[7] == -1);
            auVar25[8] = -(pcVar3[8] == -1);
            auVar25[9] = -(pcVar3[9] == -1);
            auVar25[10] = -(pcVar3[10] == -1);
            auVar25[0xb] = -(pcVar3[0xb] == -1);
            auVar25[0xc] = -(pcVar3[0xc] == -1);
            auVar25[0xd] = -(pcVar3[0xd] == -1);
            auVar25[0xe] = -(pcVar3[0xe] == -1);
            auVar25[0xf] = -(pcVar3[0xf] == -1);
            uVar17 = 0xf;
            if (uVar7 != 0) {
              for (; uVar7 >> uVar17 == 0; uVar17 = uVar17 - 1) {
              }
            }
            sVar8 = 0;
            for (uVar11 = (ushort)((ushort)(SUB161(auVar25 >> 7,0) & 1) |
                                   (ushort)(SUB161(auVar25 >> 0xf,0) & 1) << 1 |
                                   (ushort)(SUB161(auVar25 >> 0x17,0) & 1) << 2 |
                                   (ushort)(SUB161(auVar25 >> 0x1f,0) & 1) << 3 |
                                   (ushort)(SUB161(auVar25 >> 0x27,0) & 1) << 4 |
                                   (ushort)(SUB161(auVar25 >> 0x2f,0) & 1) << 5 |
                                   (ushort)(SUB161(auVar25 >> 0x37,0) & 1) << 6 |
                                   (ushort)(SUB161(auVar25 >> 0x3f,0) & 1) << 7 |
                                   (ushort)(SUB161(auVar25 >> 0x47,0) & 1) << 8 |
                                   (ushort)(SUB161(auVar25 >> 0x4f,0) & 1) << 9 |
                                   (ushort)(SUB161(auVar25 >> 0x57,0) & 1) << 10 |
                                   (ushort)(SUB161(auVar25 >> 0x5f,0) & 1) << 0xb |
                                   (ushort)(SUB161(auVar25 >> 0x67,0) & 1) << 0xc |
                                   (ushort)(SUB161(auVar25 >> 0x6f,0) & 1) << 0xd |
                                   (ushort)(SUB161(auVar25 >> 0x77,0) & 1) << 0xe |
                                  (ushort)(auVar25[0xf] >> 7) << 0xf) | 0x10000; (uVar11 & 1) == 0;
                uVar11 = uVar11 >> 1 | 0x80000000) {
              sVar8 = sVar8 + 1;
            }
            uVar14 = 0x80;
            if ((ushort)(sVar8 + (uVar17 ^ 0xf)) < 0x10) {
              *(long *)(param_3 + 0x30) = *(long *)(param_3 + 0x30) + 1;
              uVar14 = 0xff;
            }
            *(undefined1 *)(lVar16 + lVar13) = uVar14;
            *(undefined1 *)(lVar16 + 0x10 + uVar15) = uVar14;
            *(long *)(param_3 + 0x38) = *(long *)(param_3 + 0x38) + -1;
            goto LAB_145be13a5;
          }
          uVar17 = (ushort)(uVar11 - 1) & (ushort)uVar11;
          uVar11 = CONCAT22((short)(uVar11 - 1 >> 0x10),uVar17);
        }
        auVar32[0] = -(*pcVar3 == -1);
        auVar32[1] = -(pcVar3[1] == -1);
        auVar32[2] = -(pcVar3[2] == -1);
        auVar32[3] = -(pcVar3[3] == -1);
        auVar32[4] = -(pcVar3[4] == -1);
        auVar32[5] = -(pcVar3[5] == -1);
        auVar32[6] = -(pcVar3[6] == -1);
        auVar32[7] = -(pcVar3[7] == -1);
        auVar32[8] = -(pcVar3[8] == -1);
        auVar32[9] = -(pcVar3[9] == -1);
        auVar32[10] = -(pcVar3[10] == -1);
        auVar32[0xb] = -(pcVar3[0xb] == -1);
        auVar32[0xc] = -(pcVar3[0xc] == -1);
        auVar32[0xd] = -(pcVar3[0xd] == -1);
        auVar32[0xe] = -(pcVar3[0xe] == -1);
        auVar32[0xf] = -(pcVar3[0xf] == -1);
        if ((((((((((((((((SUB161(auVar32 >> 7,0) & 1) != 0 || (SUB161(auVar32 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar32 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar32 >> 0x1f,0) & 1) != 0) || (SUB161(auVar32 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar32 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar32 >> 0x37,0) & 1) != 0) || (SUB161(auVar32 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar32 >> 0x47,0) & 1) != 0) || (SUB161(auVar32 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar32 >> 0x57,0) & 1) != 0) || (SUB161(auVar32 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar32 >> 0x67,0) & 1) != 0) || (SUB161(auVar32 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar32 >> 0x77,0) & 1) != 0) || auVar32[0xf] < '\0') break;
        uVar12 = uVar12 + lVar19 + 0x10;
        lVar19 = lVar19 + 0x10;
      }
    }
  }
  else if (uVar17 == 0xdd) {
    lVar13 = *param_5;
    lStack_e8 = param_5[1];
    uVar15 = param_5[2];
    auVar50 = func_0x000145be19a0();
    auVar29._0_8_ = auVar50._8_8_;
    auVar26._0_8_ = auVar50._0_8_;
    auVar29._8_8_ = extraout_XMM1_Qb;
    auVar26._8_8_ = extraout_XMM0_Qb;
    if ((char)lStack_188 != '\0') {
      if (uStack_178 < 0xfffffffffffffffc && uStack_178 + 4 <= uVar15) {
        if (uVar15 < uStack_178 + 0xc || uVar15 < uStack_178 + 8) {
          bVar22 = 0;
        }
        else {
          fVar23 = *(float *)(lStack_e8 + uStack_178);
          fVar46 = ((float *)(lStack_e8 + uStack_178))[1];
          in_XMM10_Da = *(float *)(lStack_e8 + 8 + uStack_178);
          bVar22 = 1;
        }
      }
      else {
        bVar22 = 0;
      }
      uVar18 = uStack_178 + 0xc;
      uVar12 = uStack_178 + 0x10;
      if (uVar12 <= uVar15 && uVar18 < 0xfffffffffffffffc) {
        uStack_114 = *(undefined4 *)(lStack_e8 + uVar18);
      }
      if ((bool)(uVar18 < 0xfffffffffffffffc & uVar12 < uVar15 & bVar22)) {
        cVar4 = *(char *)(lStack_e8 + uVar12);
        uVar44 = (undefined4)*(undefined8 *)(param_3 + 0x50);
        uVar45 = (undefined4)((ulong)*(undefined8 *)(param_3 + 0x50) >> 0x20);
        lStack_100 = param_3 + 0x20;
        lStack_158 = lVar13;
        fStack_110 = fVar23;
        fStack_10c = fVar46;
        fStack_108 = in_XMM10_Da;
        if (*(long *)(param_3 + 0x38) != 0) {
          uVar12 = func_0x000140051b90();
          lVar13 = *(long *)(param_3 + 0x20);
          bVar22 = (byte)(uVar12 >> 0x39);
          auVar50 = ZEXT216(CONCAT11(bVar22,bVar22));
          auVar50 = pshuflw(auVar50,auVar50,0);
          auVar26._0_8_ = auVar50._0_8_;
          auVar26._8_4_ = auVar50._0_4_;
          auVar26._12_4_ = auVar50._4_4_;
          lVar16 = 0;
          auVar29._8_4_ = 0xffffffff;
          auVar29._0_8_ = 0xffffffffffffffff;
          auVar29._12_4_ = 0xffffffff;
          while( true ) {
            uVar12 = uVar12 & *(ulong *)(param_3 + 0x28);
            pcVar3 = (char *)(lVar13 + uVar12);
            auVar33[0] = -(*pcVar3 == auVar50[0]);
            auVar33[1] = -(pcVar3[1] == auVar50[1]);
            auVar33[2] = -(pcVar3[2] == auVar50[2]);
            auVar33[3] = -(pcVar3[3] == auVar50[3]);
            auVar33[4] = -(pcVar3[4] == auVar50[4]);
            auVar33[5] = -(pcVar3[5] == auVar50[5]);
            auVar33[6] = -(pcVar3[6] == auVar50[6]);
            auVar33[7] = -(pcVar3[7] == auVar50[7]);
            auVar33[8] = -(pcVar3[8] == auVar50[0]);
            auVar33[9] = -(pcVar3[9] == auVar50[1]);
            auVar33[10] = -(pcVar3[10] == auVar50[2]);
            auVar33[0xb] = -(pcVar3[0xb] == auVar50[3]);
            auVar33[0xc] = -(pcVar3[0xc] == auVar50[4]);
            auVar33[0xd] = -(pcVar3[0xd] == auVar50[5]);
            auVar33[0xe] = -(pcVar3[0xe] == auVar50[6]);
            auVar33[0xf] = -(pcVar3[0xf] == auVar50[7]);
            uVar17 = (ushort)(SUB161(auVar33 >> 7,0) & 1) |
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
                     (ushort)(auVar33[0xf] >> 7) << 0xf;
            uVar11 = (uint)uVar17;
            if (uVar17 != 0) {
              do {
                uVar9 = 0;
                for (uVar10 = uVar11; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
                  uVar9 = uVar9 + 1;
                }
                lVar19 = (uVar9 + uVar12 & *(ulong *)(param_3 + 0x28)) * -0x30;
                if (lStack_180 == *(long *)(lVar13 + -0x30 + lVar19)) {
                  lVar13 = lVar13 + lVar19;
                  fVar34 = _DAT_1461b2200;
                  if (0.0 < *(double *)(lVar13 + -0x28)) {
                    dVar31 = (((double)CONCAT44(uVar48,uVar47) - *(double *)(lVar13 + -0x20)) *
                             _DAT_1461bb888) / *(double *)(lVar13 + -0x28);
                    dVar49 = 0.0;
                    if (0.0 <= dVar31) {
                      dVar49 = dVar31;
                    }
                    dVar31 = _DAT_1461b80b0;
                    if (dVar49 <= _DAT_1461b80b0) {
                      dVar31 = dVar49;
                    }
                    fVar34 = (float)dVar31;
                  }
                  fVar40 = (float)*(undefined8 *)(lVar13 + -0x18);
                  fVar42 = (float)((ulong)*(undefined8 *)(lVar13 + -0x18) >> 0x20);
                  fVar40 = fVar34 * ((float)*(undefined8 *)(lVar13 + -0xc) - fVar40) + fVar40;
                  fVar42 = fVar34 * ((float)((ulong)*(undefined8 *)(lVar13 + -0xc) >> 0x20) - fVar42
                                    ) + fVar42;
                  in_XMM11_Da = (*(float *)(lVar13 + -4) - *(float *)(lVar13 + -0x10)) * fVar34 +
                                *(float *)(lVar13 + -0x10);
                  if (cVar4 != '\0') {
                    uStack_f8 = CONCAT44(fVar42,fVar40);
                    fStack_f0 = in_XMM11_Da;
                    fVar23 = (float)func_0x000146005081();
                    bVar5 = false;
                    bVar21 = false;
                    if (_DAT_1461b26f4 < fVar23) goto LAB_145be10b7;
                    goto LAB_145be10cd;
                  }
                  auVar29._4_4_ = fVar42;
                  auVar29._0_4_ = fVar42;
                  auVar29._8_8_ = 0;
                  bVar5 = false;
                  auVar26._4_4_ = fVar42;
                  auVar26._0_4_ = fVar40;
                  auVar26._8_8_ = 0;
                  goto LAB_145be11e3;
                }
                uVar17 = (ushort)(uVar11 - 1) & (ushort)uVar11;
                uVar11 = CONCAT22((short)(uVar11 - 1 >> 0x10),uVar17);
              } while (uVar17 != 0);
            }
            auVar38[0] = -(*pcVar3 == -1);
            auVar38[1] = -(pcVar3[1] == -1);
            auVar38[2] = -(pcVar3[2] == -1);
            auVar38[3] = -(pcVar3[3] == -1);
            auVar38[4] = -(pcVar3[4] == -1);
            auVar38[5] = -(pcVar3[5] == -1);
            auVar38[6] = -(pcVar3[6] == -1);
            auVar38[7] = -(pcVar3[7] == -1);
            auVar38[8] = -(pcVar3[8] == -1);
            auVar38[9] = -(pcVar3[9] == -1);
            auVar38[10] = -(pcVar3[10] == -1);
            auVar38[0xb] = -(pcVar3[0xb] == -1);
            auVar38[0xc] = -(pcVar3[0xc] == -1);
            auVar38[0xd] = -(pcVar3[0xd] == -1);
            auVar38[0xe] = -(pcVar3[0xe] == -1);
            auVar38[0xf] = -(pcVar3[0xf] == -1);
            if ((((((((((((((((SUB161(auVar38 >> 7,0) & 1) != 0 ||
                             (SUB161(auVar38 >> 0xf,0) & 1) != 0) ||
                            (SUB161(auVar38 >> 0x17,0) & 1) != 0) ||
                           (SUB161(auVar38 >> 0x1f,0) & 1) != 0) ||
                          (SUB161(auVar38 >> 0x27,0) & 1) != 0) ||
                         (SUB161(auVar38 >> 0x2f,0) & 1) != 0) ||
                        (SUB161(auVar38 >> 0x37,0) & 1) != 0) ||
                       (SUB161(auVar38 >> 0x3f,0) & 1) != 0) || (SUB161(auVar38 >> 0x47,0) & 1) != 0
                      ) || (SUB161(auVar38 >> 0x4f,0) & 1) != 0) ||
                    (SUB161(auVar38 >> 0x57,0) & 1) != 0) || (SUB161(auVar38 >> 0x5f,0) & 1) != 0)
                  || (SUB161(auVar38 >> 0x67,0) & 1) != 0) || (SUB161(auVar38 >> 0x6f,0) & 1) != 0)
                || (SUB161(auVar38 >> 0x77,0) & 1) != 0) || auVar38[0xf] < '\0') break;
            uVar12 = uVar12 + lVar16 + 0x10;
            lVar16 = lVar16 + 0x10;
          }
        }
        bVar5 = true;
        bVar21 = true;
        if (cVar4 == '\0') {
LAB_145be11e3:
          uVar12 = uStack_178 + 0x15;
          uVar18 = uStack_178 + 0x19;
          uVar11 = 0xffffffff;
          if (uVar18 <= uVar15 && uVar12 < 0xfffffffffffffffc) {
            uVar11 = *(int *)(lStack_e8 + uVar12) + (uint)(*(int *)(lStack_e8 + uVar12) == 0);
          }
          bVar20 = uVar18 < 0xfffffffffffffffc;
          uVar2 = uStack_178 + 0x1d;
          bVar21 = bVar20;
          if (uVar2 <= uVar15 && bVar20) {
            bVar21 = *(int *)(lStack_e8 + uVar18) == 1;
          }
          if (((uStack_178 + 0x21 <= uVar15 && uVar2 < 0xfffffffffffffffc) &&
              (uStack_178 + 0x29 <= uVar15 && uStack_178 + 0x25 <= uVar15)) &&
             ((uVar18 <= uVar15 && uVar12 < 0xfffffffffffffffc) && (uVar2 <= uVar15 && bVar20))) {
            uStack_150 = *(undefined8 *)(lStack_e8 + uVar2);
            fStack_148 = *(float *)(lStack_e8 + 8 + uVar2);
            if (bVar21) {
              dVar31 = (double)(~-(ulong)((double)CONCAT44(uVar45,uVar44) < _DAT_14645d7e0) &
                               CONCAT44(uVar45,uVar44));
              uVar44 = SUB84(dVar31,0);
              uVar45 = (undefined4)((ulong)dVar31 >> 0x20);
              dVar49 = (double)uVar11;
              dVar35 = dVar31 / dVar49;
              if (_DAT_1461b80b0 <= dVar31 / dVar49) {
                dVar35 = _DAT_1461b80b0;
              }
              fVar34 = (float)dVar35;
              fVar23 = fVar34 * ((float)uStack_150 - fVar23) + fVar23;
              fVar46 = fVar34 * ((float)((ulong)uStack_150 >> 0x20) - fVar46) + fVar46;
              fStack_f0 = (fStack_148 - in_XMM10_Da) * fVar34 + in_XMM10_Da;
              uStack_f8 = CONCAT44(fVar46,fVar23);
              if ((!bVar5) &&
                 (auVar27._4_12_ = auVar26._4_12_, auVar27._0_4_ = auVar26._0_4_ - fVar23,
                 auVar30._4_12_ = auVar29._4_12_, auVar30._0_4_ = auVar29._0_4_ - fVar46,
                 fVar23 = (float)func_0x000146005081(auVar27._0_8_,auVar30._0_8_),
                 fVar23 <= _DAT_1461b26f4)) {
                uStack_f8 = CONCAT44(fVar42,fVar40);
                fStack_f0 = in_XMM11_Da;
              }
              uVar41 = 0;
              uVar43 = 0;
              if ((((double)CONCAT44(uVar45,uVar44) != 0.0) ||
                  (NAN((double)CONCAT44(uVar45,uVar44)))) ||
                 (fVar23 = (float)func_0x000146005081(), _DAT_1461b21b0 <= fVar23)) {
                fVar23 = (float)func_0x000146005081();
                fVar46 = (float)func_0x000146005081();
                fVar23 = fVar23 / ((float)uVar11 / _DAT_1461c0c48);
                if (fVar23 <= _DAT_1461b2200) {
                  fVar23 = _DAT_1461b2200;
                }
                dVar49 = dVar49 - (double)CONCAT44(uVar45,uVar44);
                if (dVar49 <= (double)CONCAT44(uVar43,uVar41)) {
                  dVar49 = (double)CONCAT44(uVar43,uVar41);
                }
                dStack_140 = (double)(fVar46 / (fVar23 * _DAT_1461be040)) * _DAT_1461bb888;
                if (dStack_140 <= dVar49) {
                  dStack_140 = dVar49;
                }
                if (dStack_140 <= _DAT_1461b80b0) {
                  dStack_140 = _DAT_1461b80b0;
                }
                fStack_128 = fStack_f0;
                uStack_130 = uStack_f8;
                uStack_124 = uStack_150;
                fStack_11c = fStack_148;
                uStack_138 = CONCAT44(uVar48,uVar47);
                FUN_145bde900();
                func_0x000145c67c50();
                goto LAB_145be117c;
              }
              fStack_128 = fStack_108;
              uStack_130 = CONCAT44(fStack_10c,fStack_110);
              uStack_124 = uStack_150;
              fStack_11c = fStack_148;
              uStack_138 = CONCAT44(uVar48,uVar47);
              dStack_140 = dVar49;
              FUN_145bde900();
            }
          }
        }
        else {
LAB_145be10b7:
          bVar5 = bVar21;
          uStack_f8 = CONCAT44(fStack_10c,fStack_110);
          fStack_f0 = fStack_108;
LAB_145be10cd:
          fVar23 = (float)func_0x000146005081();
          if ((!bVar5) && (_DAT_1461b2200 < fVar23)) {
            dStack_140 = (double)(fVar23 / _DAT_1461ba31c) * _DAT_1461bb888;
            fStack_128 = fStack_f0;
            uStack_130 = uStack_f8;
            uStack_124 = CONCAT44(fStack_10c,fStack_110);
            fStack_11c = fStack_108;
            uStack_138 = CONCAT44(uVar48,uVar47);
            FUN_145bde900();
            func_0x000145c67c50();
LAB_145be117c:
            if (lStack_158 != 0) {
              func_0x0001400021d0();
              return param_4;
            }
            return param_4;
          }
          fStack_128 = fStack_108;
          uStack_130 = CONCAT44(fStack_10c,fStack_110);
          fStack_11c = fStack_108;
          dStack_140 = 0.0;
          uStack_138 = CONCAT44(uVar48,uVar47);
          uStack_124 = uStack_130;
          FUN_145bde900();
        }
      }
    }
  }
  else if ((uVar17 != 199 && (ushort)(uVar17 - 0xb5) < 0x17) ||
          ((uVar17 - 0xda < 0x15 && ((0x100003U >> (uVar17 - 0xda & 0x1f) & 1) != 0)))) {
    dVar49 = (double)(~-(ulong)(*(double *)(param_3 + 0x50) < _DAT_14645d7e0) &
                     (ulong)*(double *)(param_3 + 0x50));
    uVar47 = SUB84(dVar49,0);
    uVar48 = (undefined4)((ulong)dVar49 >> 0x20);
    if ((dVar49 != 0.0) || (NAN(dVar49))) {
      lVar13 = *param_5;
      lVar16 = param_5[1];
      uVar15 = param_5[2];
      func_0x000145be19a0(param_5,param_4,lVar16,&lStack_188,uVar15);
      if ((char)lStack_188 != '\0') {
        uVar12 = uStack_178 + 4;
        bVar5 = uVar12 <= uVar15;
        if (bVar5 && uStack_178 < 0xfffffffffffffffc) {
          uVar12 = (ulong)*(uint *)(lVar16 + uStack_178);
        }
        uVar18 = uStack_178 + 8;
        uVar2 = uStack_178 + 0xc;
        if (uVar2 <= uVar15 && uVar18 < 0xfffffffffffffffc) {
          in_XMM11_Da = *(float *)(lVar16 + uVar18);
        }
        uVar1 = uStack_178 + 0x10;
        if (uVar1 <= uVar15 && uVar2 < 0xfffffffffffffffc) {
          in_XMM12_Da = *(float *)(lVar16 + uVar2);
        }
        if ((uStack_178 + 0x18 <= uVar15 && uStack_178 + 0x14 < 0xfffffffffffffffc) &&
           ((uVar1 <= uVar15 && uVar2 < 0xfffffffffffffffc) &&
            ((bVar5 && uStack_178 < 0xfffffffffffffffc) &&
            (uVar2 <= uVar15 && uVar18 < 0xfffffffffffffffc)))) {
          uVar11 = (uint)uVar12;
          auVar37._4_4_ = _DAT_1461b2200;
          auVar37._0_4_ = _DAT_1461b2200;
          auVar37._8_8_ = 0;
          auVar28._0_4_ = -(uint)((uVar11 & _DAT_1476a0f90) == _DAT_1476a0f90);
          auVar28._4_4_ = -(uint)((uVar11 & uRam00000001476a0f94) == uRam00000001476a0f94);
          auVar28._8_4_ = 0xffffffff;
          auVar28._12_4_ = 0xffffffff;
          auVar28 = auVar28 & auVar37;
          auVar39._0_4_ = -(uint)((uVar11 & _DAT_1476a0fa0) == 0);
          auVar39._4_4_ = -(uint)((uVar11 & uRam00000001476a0fa4) == 0);
          auVar39._8_4_ = -(uint)((uVar11 & uRam00000001476a0fa8) == 0);
          auVar39._12_4_ = -(uint)((uVar11 & uRam00000001476a0fac) == 0);
          auVar24._0_4_ = _DAT_146213df0 + auVar28._0_4_;
          auVar24._4_4_ = fRam0000000146213df4 + auVar28._4_4_;
          auVar24._8_4_ = fRam0000000146213df8 + auVar28._8_4_;
          auVar24._12_4_ = fRam0000000146213dfc + auVar28._12_4_;
          auVar50 = ~auVar39 & auVar24 | auVar28 & auVar39;
          fVar46 = auVar50._4_4_;
          lStack_e8 = lVar13;
          fVar23 = (float)func_0x000146005081(auVar50._0_8_,CONCAT44(fVar46,fVar46));
          if ((fVar23 != 0.0) || (NAN(fVar23))) {
            fVar40 = (float)func_0x00014600509f();
            fVar42 = (float)func_0x00014600508d();
            lStack_100 = lVar16;
            if (uVar2 < uVar18) {
              func_0x0001461ae300();
            }
            else {
              dVar49 = (double)CONCAT44(uVar48,uVar47) / _DAT_1461bb888;
              if (_DAT_1461b80b0 <= dVar49) {
                dVar49 = _DAT_1461b80b0;
              }
              fVar23 = ((float)dVar49 * _DAT_1461ba31c) / fVar23;
              *(float *)(lVar16 + uVar18) =
                   in_XMM11_Da + (auVar50._0_4_ * fVar40 - auVar50._4_4_ * fVar42) * fVar23;
              if (uVar2 <= uVar1) {
                *(float *)(lVar16 + uVar2) =
                     in_XMM12_Da + (fVar46 * fVar40 + fVar42 * auVar50._0_4_) * fVar23;
                goto LAB_145be13a5;
              }
              func_0x0001461ae300();
            }
                    /* WARNING: Does not return */
            pcVar6 = (code *)invalidInstructionException();
            (*pcVar6)();
          }
        }
      }
    }
  }
LAB_145be13a5:
  lVar13 = *param_5;
  lVar16 = param_5[1];
  lVar19 = param_5[3];
  param_4[2] = param_5[2];
  param_4[3] = lVar19;
  *param_4 = lVar13;
  param_4[1] = lVar16;
  return param_4;
}

