/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  char *pcVar1;
  undefined4 *puVar2;
  char *pcVar3;
  undefined4 uVar4;
  code *pcVar5;
  uint uVar6;
  uint uVar7;
  long lVar8;
  uint *puVar9;
  ulong uVar10;
  byte bVar11;
  uint uVar12;
  ulong uVar13;
  long lVar14;
  long lVar15;
  long lVar16;
  ulong uVar17;
  ushort uVar18;
  ulong uVar19;
  long lVar20;
  char cVar21;
  int iVar22;
  long lVar23;
  byte bVar24;
  int iVar25;
  byte bVar26;
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
  float in_XMM7_Da;
  float fVar40;
  float in_XMM8_Da;
  float fVar41;
  undefined8 local_1d8;
  undefined8 local_1d0;
  float fStack_1cc;
  float local_1c8;
  uint *local_e0;
  long local_d8;
  char local_d0;
  ulong local_c8;
  long local_c0;
  long local_b0;
  long local_a0;

  func_0x0001405f7710();
  if ((int)local_1d8 == 1) {
    in_XMM7_Da = fStack_1cc;
    in_XMM8_Da = local_1d8._4_4_;
    if (_DAT_1464d5b60 < fStack_1cc - local_1d8._4_4_) {
      bVar24 = 1;
      fVar39 = local_1c8 + _DAT_1464d5b30;
      goto LAB_1403119cf;
    }
  }
  bVar24 = 0;
  fVar39 = _DAT_1465154d4;
  fStack_1cc = in_XMM7_Da;
LAB_1403119cf:
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar8 = *(long *)(param_3 + 0x78);
    uVar17 = *(ulong *)(param_3 + 0x80);
    uVar10 = 0x36c22034ac5287d5;
    lVar15 = 0;
    while( true ) {
      uVar10 = uVar10 & uVar17;
      pcVar1 = (char *)(lVar8 + uVar10);
      auVar31[0] = -(*pcVar1 == DAT_1464d5330);
      auVar31[1] = -(pcVar1[1] == DAT_1464d5330._1_1_);
      auVar31[2] = -(pcVar1[2] == DAT_1464d5330._2_1_);
      auVar31[3] = -(pcVar1[3] == DAT_1464d5330._3_1_);
      auVar31[4] = -(pcVar1[4] == DAT_1464d5330._4_1_);
      auVar31[5] = -(pcVar1[5] == DAT_1464d5330._5_1_);
      auVar31[6] = -(pcVar1[6] == DAT_1464d5330._6_1_);
      auVar31[7] = -(pcVar1[7] == DAT_1464d5330._7_1_);
      auVar31[8] = -(pcVar1[8] == DAT_1464d5330._8_1_);
      auVar31[9] = -(pcVar1[9] == DAT_1464d5330._9_1_);
      auVar31[10] = -(pcVar1[10] == DAT_1464d5330._10_1_);
      auVar31[0xb] = -(pcVar1[0xb] == DAT_1464d5330._11_1_);
      auVar31[0xc] = -(pcVar1[0xc] == DAT_1464d5330._12_1_);
      auVar31[0xd] = -(pcVar1[0xd] == DAT_1464d5330._13_1_);
      auVar31[0xe] = -(pcVar1[0xe] == DAT_1464d5330._14_1_);
      auVar31[0xf] = -(pcVar1[0xf] == DAT_1464d5330._15_1_);
      uVar18 = (ushort)(SUB161(auVar31 >> 7,0) & 1) | (ushort)(SUB161(auVar31 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar31 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar31 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar31 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar31 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar31 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar31 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar31 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar31 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar31 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar31 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar31 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar31 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar31 >> 0x77,0) & 1) << 0xe | (ushort)(auVar31[0xf] >> 7) << 0xf;
      uVar12 = (uint)uVar18;
      while (uVar18 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar12; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar19 = uVar6 + uVar10 & uVar17;
        pcVar3 = (char *)(lVar8 + -0x18 + uVar19 * -0x18);
        auVar32[0] = -(*pcVar3 == DAT_1464e7a00);
        auVar32[1] = -(pcVar3[1] == cRam00000001464e7a01);
        auVar32[2] = -(pcVar3[2] == cRam00000001464e7a02);
        auVar32[3] = -(pcVar3[3] == cRam00000001464e7a03);
        auVar32[4] = -(pcVar3[4] == cRam00000001464e7a04);
        auVar32[5] = -(pcVar3[5] == cRam00000001464e7a05);
        auVar32[6] = -(pcVar3[6] == cRam00000001464e7a06);
        auVar32[7] = -(pcVar3[7] == cRam00000001464e7a07);
        auVar32[8] = -(pcVar3[8] == cRam00000001464e7a08);
        auVar32[9] = -(pcVar3[9] == cRam00000001464e7a09);
        auVar32[10] = -(pcVar3[10] == cRam00000001464e7a0a);
        auVar32[0xb] = -(pcVar3[0xb] == cRam00000001464e7a0b);
        auVar32[0xc] = -(pcVar3[0xc] == cRam00000001464e7a0c);
        auVar32[0xd] = -(pcVar3[0xd] == cRam00000001464e7a0d);
        auVar32[0xe] = -(pcVar3[0xe] == cRam00000001464e7a0e);
        auVar32[0xf] = -(pcVar3[0xf] == cRam00000001464e7a0f);
        if ((ushort)((ushort)(SUB161(auVar32 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar32 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar32 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar32 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar32 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar32 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar32 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar32 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar32 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar32 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar32 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar32 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar32 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar32 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar32 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar32[0xf] >> 7) << 0xf) == 0xffff) {
          uVar10 = *(ulong *)(lVar8 + uVar19 * -0x18 + -8);
          uVar19 = *(ulong *)(param_3 + 0x218);
          if (uVar19 <= uVar10) goto LAB_140311b64;
          lVar15 = *(long *)(param_3 + 0x210);
          uVar10 = *(ulong *)(lVar15 + uVar10 * 8);
          if (uVar10 == 0) goto LAB_140311b64;
          lVar14 = *(long *)(param_3 + 0x1e0);
          lVar20 = ~uVar10 * 0x38;
          if (*(char *)(lVar14 + 0x30 + lVar20) == '\0') goto LAB_140311b64;
          if (*(char *)(*(long *)(lVar20 + lVar14 + 0x10) + 0xec) != '\x01') goto LAB_140311bd5;
          uVar10 = 0x9bc51e947efb66b;
          lVar20 = 0;
          goto LAB_140311afb;
        }
        uVar18 = (ushort)(uVar12 - 1) & (ushort)uVar12;
        uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar18);
      }
      auVar27[0] = -(*pcVar1 == -1);
      auVar27[1] = -(pcVar1[1] == -1);
      auVar27[2] = -(pcVar1[2] == -1);
      auVar27[3] = -(pcVar1[3] == -1);
      auVar27[4] = -(pcVar1[4] == -1);
      auVar27[5] = -(pcVar1[5] == -1);
      auVar27[6] = -(pcVar1[6] == -1);
      auVar27[7] = -(pcVar1[7] == -1);
      auVar27[8] = -(pcVar1[8] == -1);
      auVar27[9] = -(pcVar1[9] == -1);
      auVar27[10] = -(pcVar1[10] == -1);
      auVar27[0xb] = -(pcVar1[0xb] == -1);
      auVar27[0xc] = -(pcVar1[0xc] == -1);
      auVar27[0xd] = -(pcVar1[0xd] == -1);
      auVar27[0xe] = -(pcVar1[0xe] == -1);
      auVar27[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar27 >> 7,0) & 1) != 0 || (SUB161(auVar27 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar27 >> 0x17,0) & 1) != 0) || (SUB161(auVar27 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar27 >> 0x27,0) & 1) != 0) || (SUB161(auVar27 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar27 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar27 >> 0x3f,0) & 1) != 0) || (SUB161(auVar27 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar27 >> 0x4f,0) & 1) != 0) || (SUB161(auVar27 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar27 >> 0x5f,0) & 1) != 0) || (SUB161(auVar27 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar27 >> 0x6f,0) & 1) != 0) || (SUB161(auVar27 >> 0x77,0) & 1) != 0) ||
          auVar27[0xf] < '\0') break;
      uVar10 = uVar10 + lVar15 + 0x10;
      lVar15 = lVar15 + 0x10;
    }
  }
LAB_140311b64:
  func_0x0001464ce5f0();
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
LAB_140311afb:
  uVar10 = uVar10 & uVar17;
  pcVar1 = (char *)(lVar8 + uVar10);
  auVar33[0] = -(*pcVar1 == DAT_1464d4690);
  auVar33[1] = -(pcVar1[1] == DAT_1464d4690._1_1_);
  auVar33[2] = -(pcVar1[2] == DAT_1464d4690._2_1_);
  auVar33[3] = -(pcVar1[3] == DAT_1464d4690._3_1_);
  auVar33[4] = -(pcVar1[4] == DAT_1464d4690._4_1_);
  auVar33[5] = -(pcVar1[5] == DAT_1464d4690._5_1_);
  auVar33[6] = -(pcVar1[6] == DAT_1464d4690._6_1_);
  auVar33[7] = -(pcVar1[7] == DAT_1464d4690._7_1_);
  auVar33[8] = -(pcVar1[8] == DAT_1464d4690._8_1_);
  auVar33[9] = -(pcVar1[9] == DAT_1464d4690._9_1_);
  auVar33[10] = -(pcVar1[10] == DAT_1464d4690._10_1_);
  auVar33[0xb] = -(pcVar1[0xb] == DAT_1464d4690._11_1_);
  auVar33[0xc] = -(pcVar1[0xc] == DAT_1464d4690._12_1_);
  auVar33[0xd] = -(pcVar1[0xd] == DAT_1464d4690._13_1_);
  auVar33[0xe] = -(pcVar1[0xe] == DAT_1464d4690._14_1_);
  auVar33[0xf] = -(pcVar1[0xf] == DAT_1464d4690._15_1_);
  uVar18 = (ushort)(SUB161(auVar33 >> 7,0) & 1) | (ushort)(SUB161(auVar33 >> 0xf,0) & 1) << 1 |
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
           (ushort)(SUB161(auVar33 >> 0x77,0) & 1) << 0xe | (ushort)(auVar33[0xf] >> 7) << 0xf;
  uVar12 = (uint)uVar18;
  while (uVar18 != 0) {
    uVar6 = 0;
    for (uVar7 = uVar12; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
      uVar6 = uVar6 + 1;
    }
    uVar13 = uVar6 + uVar10 & uVar17;
    pcVar3 = (char *)(lVar8 + -0x18 + uVar13 * -0x18);
    auVar34[0] = -(*pcVar3 == DAT_14653d050);
    auVar34[1] = -(pcVar3[1] == DAT_14653d050._1_1_);
    auVar34[2] = -(pcVar3[2] == DAT_14653d050._2_1_);
    auVar34[3] = -(pcVar3[3] == DAT_14653d050._3_1_);
    auVar34[4] = -(pcVar3[4] == DAT_14653d050._4_1_);
    auVar34[5] = -(pcVar3[5] == DAT_14653d050._5_1_);
    auVar34[6] = -(pcVar3[6] == DAT_14653d050._6_1_);
    auVar34[7] = -(pcVar3[7] == DAT_14653d050._7_1_);
    auVar34[8] = -(pcVar3[8] == DAT_14653d050._8_1_);
    auVar34[9] = -(pcVar3[9] == DAT_14653d050._9_1_);
    auVar34[10] = -(pcVar3[10] == DAT_14653d050._10_1_);
    auVar34[0xb] = -(pcVar3[0xb] == DAT_14653d050._11_1_);
    auVar34[0xc] = -(pcVar3[0xc] == DAT_14653d050._12_1_);
    auVar34[0xd] = -(pcVar3[0xd] == DAT_14653d050._13_1_);
    auVar34[0xe] = -(pcVar3[0xe] == DAT_14653d050._14_1_);
    auVar34[0xf] = -(pcVar3[0xf] == DAT_14653d050._15_1_);
    if ((ushort)((ushort)(SUB161(auVar34 >> 7,0) & 1) | (ushort)(SUB161(auVar34 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar34 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar34 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar34 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar34 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar34 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar34 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar34 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar34 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar34 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar34 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar34 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar34 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar34 >> 0x77,0) & 1) << 0xe | (ushort)(auVar34[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar10 = *(ulong *)(lVar8 + uVar13 * -0x18 + -8);
      if (((uVar19 <= uVar10) || (uVar10 = *(ulong *)(lVar15 + uVar10 * 8), uVar10 == 0)) ||
         (lVar20 = ~uVar10 * 0x38, *(char *)(lVar14 + 0x30 + lVar20) == '\0')) goto LAB_140311d5d;
      if (**(char **)(lVar20 + lVar14 + 0x10) != '\0') goto LAB_140311bd5;
      uVar10 = 0x42040e6896aac7bf;
      lVar20 = 0;
      goto LAB_140311dad;
    }
    uVar18 = (ushort)(uVar12 - 1) & (ushort)uVar12;
    uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar18);
  }
  goto LAB_140311b47;
LAB_140311bd5:
  bVar26 = 0;
LAB_140311bd8:
  uVar10 = 0x87db0d2fa0781a24;
  lVar20 = 0;
  do {
    uVar10 = uVar10 & uVar17;
    auVar31 = *(undefined1 (*) [16])(lVar8 + uVar10);
    auVar35[0] = -(auVar31[0] == DAT_1464d48f0);
    auVar35[1] = -(auVar31[1] == DAT_1464d48f0._1_1_);
    auVar35[2] = -(auVar31[2] == DAT_1464d48f0._2_1_);
    auVar35[3] = -(auVar31[3] == DAT_1464d48f0._3_1_);
    auVar35[4] = -(auVar31[4] == DAT_1464d48f0._4_1_);
    auVar35[5] = -(auVar31[5] == DAT_1464d48f0._5_1_);
    auVar35[6] = -(auVar31[6] == DAT_1464d48f0._6_1_);
    auVar35[7] = -(auVar31[7] == DAT_1464d48f0._7_1_);
    auVar35[8] = -(auVar31[8] == DAT_1464d48f0._8_1_);
    auVar35[9] = -(auVar31[9] == DAT_1464d48f0._9_1_);
    auVar35[10] = -(auVar31[10] == DAT_1464d48f0._10_1_);
    auVar35[0xb] = -(auVar31[0xb] == DAT_1464d48f0._11_1_);
    auVar35[0xc] = -(auVar31[0xc] == DAT_1464d48f0._12_1_);
    auVar35[0xd] = -(auVar31[0xd] == DAT_1464d48f0._13_1_);
    auVar35[0xe] = -(auVar31[0xe] == DAT_1464d48f0._14_1_);
    auVar35[0xf] = -(auVar31[0xf] == DAT_1464d48f0._15_1_);
    uVar18 = (ushort)(SUB161(auVar35 >> 7,0) & 1) | (ushort)(SUB161(auVar35 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar35 >> 0x17,0) & 1) << 2 |
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
             (ushort)(SUB161(auVar35 >> 0x77,0) & 1) << 0xe | (ushort)(auVar35[0xf] >> 7) << 0xf;
    uVar12 = (uint)uVar18;
    while (uVar18 != 0) {
      uVar6 = 0;
      for (uVar7 = uVar12; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
        uVar6 = uVar6 + 1;
      }
      uVar13 = uVar6 + uVar10 & uVar17;
      pcVar1 = (char *)(lVar8 + -0x18 + uVar13 * -0x18);
      auVar36[0] = -(*pcVar1 == DAT_1464e4140);
      auVar36[1] = -(pcVar1[1] == DAT_1464e4140._1_1_);
      auVar36[2] = -(pcVar1[2] == DAT_1464e4140._2_1_);
      auVar36[3] = -(pcVar1[3] == DAT_1464e4140._3_1_);
      auVar36[4] = -(pcVar1[4] == DAT_1464e4140._4_1_);
      auVar36[5] = -(pcVar1[5] == DAT_1464e4140._5_1_);
      auVar36[6] = -(pcVar1[6] == DAT_1464e4140._6_1_);
      auVar36[7] = -(pcVar1[7] == DAT_1464e4140._7_1_);
      auVar36[8] = -(pcVar1[8] == DAT_1464e4140._8_1_);
      auVar36[9] = -(pcVar1[9] == DAT_1464e4140._9_1_);
      auVar36[10] = -(pcVar1[10] == DAT_1464e4140._10_1_);
      auVar36[0xb] = -(pcVar1[0xb] == DAT_1464e4140._11_1_);
      auVar36[0xc] = -(pcVar1[0xc] == DAT_1464e4140._12_1_);
      auVar36[0xd] = -(pcVar1[0xd] == DAT_1464e4140._13_1_);
      auVar36[0xe] = -(pcVar1[0xe] == DAT_1464e4140._14_1_);
      auVar36[0xf] = -(pcVar1[0xf] == DAT_1464e4140._15_1_);
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
        uVar17 = *(ulong *)(lVar8 + uVar13 * -0x18 + -8);
        if (((uVar19 <= uVar17) || (uVar17 = *(ulong *)(lVar15 + uVar17 * 8), uVar17 == 0)) ||
           (lVar8 = ~uVar17 * 0x38, *(char *)(lVar14 + 0x30 + lVar8) == '\0')) goto LAB_140311d07;
        fVar40 = **(float **)(lVar14 + lVar8 + 0x10);
        func_0x0001404fdea0();
        func_0x0001404ed4c0();
        if (local_1d8 != *(long *)(param_3 + 0x5a0)) {
          func_0x000146495680();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        if (local_d0 == '\0') {
          lVar15 = 0;
          lVar8 = 8;
          lVar14 = 0;
          uVar12 = 0;
          puVar9 = local_e0;
          goto LAB_140311eb5;
        }
        lVar8 = 0;
        lVar15 = 0;
        puVar9 = local_e0;
        uVar17 = 0;
        goto LAB_140311e36;
      }
      uVar18 = (ushort)(uVar12 - 1) & (ushort)uVar12;
      uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar18);
    }
    auVar29[0] = -(auVar31[0] == -1);
    auVar29[1] = -(auVar31[1] == -1);
    auVar29[2] = -(auVar31[2] == -1);
    auVar29[3] = -(auVar31[3] == -1);
    auVar29[4] = -(auVar31[4] == -1);
    auVar29[5] = -(auVar31[5] == -1);
    auVar29[6] = -(auVar31[6] == -1);
    auVar29[7] = -(auVar31[7] == -1);
    auVar29[8] = -(auVar31[8] == -1);
    auVar29[9] = -(auVar31[9] == -1);
    auVar29[10] = -(auVar31[10] == -1);
    auVar29[0xb] = -(auVar31[0xb] == -1);
    auVar29[0xc] = -(auVar31[0xc] == -1);
    auVar29[0xd] = -(auVar31[0xd] == -1);
    auVar29[0xe] = -(auVar31[0xe] == -1);
    auVar29[0xf] = -(auVar31[0xf] == -1);
    if ((((((((((((((((SUB161(auVar29 >> 7,0) & 1) != 0 || (SUB161(auVar29 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar29 >> 0x17,0) & 1) != 0) || (SUB161(auVar29 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar29 >> 0x27,0) & 1) != 0) || (SUB161(auVar29 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar29 >> 0x37,0) & 1) != 0) || (SUB161(auVar29 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar29 >> 0x47,0) & 1) != 0) || (SUB161(auVar29 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar29 >> 0x57,0) & 1) != 0) || (SUB161(auVar29 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar29 >> 0x67,0) & 1) != 0) || (SUB161(auVar29 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar29 >> 0x77,0) & 1) != 0) || auVar29[0xf] < '\0') {
LAB_140311d07:
      func_0x0001464ce5f0();
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
    uVar10 = uVar10 + lVar20 + 0x10;
    lVar20 = lVar20 + 0x10;
  } while( true );
LAB_140311dad:
  uVar10 = uVar10 & uVar17;
  pcVar1 = (char *)(lVar8 + uVar10);
  auVar37[0] = -(*pcVar1 == DAT_1464d4590);
  auVar37[1] = -(pcVar1[1] == DAT_1464d4590._1_1_);
  auVar37[2] = -(pcVar1[2] == DAT_1464d4590._2_1_);
  auVar37[3] = -(pcVar1[3] == DAT_1464d4590._3_1_);
  auVar37[4] = -(pcVar1[4] == DAT_1464d4590._4_1_);
  auVar37[5] = -(pcVar1[5] == DAT_1464d4590._5_1_);
  auVar37[6] = -(pcVar1[6] == DAT_1464d4590._6_1_);
  auVar37[7] = -(pcVar1[7] == DAT_1464d4590._7_1_);
  auVar37[8] = -(pcVar1[8] == DAT_1464d4590._8_1_);
  auVar37[9] = -(pcVar1[9] == DAT_1464d4590._9_1_);
  auVar37[10] = -(pcVar1[10] == DAT_1464d4590._10_1_);
  auVar37[0xb] = -(pcVar1[0xb] == DAT_1464d4590._11_1_);
  auVar37[0xc] = -(pcVar1[0xc] == DAT_1464d4590._12_1_);
  auVar37[0xd] = -(pcVar1[0xd] == DAT_1464d4590._13_1_);
  auVar37[0xe] = -(pcVar1[0xe] == DAT_1464d4590._14_1_);
  auVar37[0xf] = -(pcVar1[0xf] == DAT_1464d4590._15_1_);
  uVar18 = (ushort)(SUB161(auVar37 >> 7,0) & 1) | (ushort)(SUB161(auVar37 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar37 >> 0x17,0) & 1) << 2 |
           (ushort)(SUB161(auVar37 >> 0x1f,0) & 1) << 3 |
           (ushort)(SUB161(auVar37 >> 0x27,0) & 1) << 4 |
           (ushort)(SUB161(auVar37 >> 0x2f,0) & 1) << 5 |
           (ushort)(SUB161(auVar37 >> 0x37,0) & 1) << 6 |
           (ushort)(SUB161(auVar37 >> 0x3f,0) & 1) << 7 |
           (ushort)(SUB161(auVar37 >> 0x47,0) & 1) << 8 |
           (ushort)(SUB161(auVar37 >> 0x4f,0) & 1) << 9 |
           (ushort)(SUB161(auVar37 >> 0x57,0) & 1) << 10 |
           (ushort)(SUB161(auVar37 >> 0x5f,0) & 1) << 0xb |
           (ushort)(SUB161(auVar37 >> 0x67,0) & 1) << 0xc |
           (ushort)(SUB161(auVar37 >> 0x6f,0) & 1) << 0xd |
           (ushort)(SUB161(auVar37 >> 0x77,0) & 1) << 0xe | (ushort)(auVar37[0xf] >> 7) << 0xf;
  uVar12 = (uint)uVar18;
  while (uVar18 != 0) {
    uVar6 = 0;
    for (uVar7 = uVar12; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
      uVar6 = uVar6 + 1;
    }
    uVar13 = uVar6 + uVar10 & uVar17;
    pcVar3 = (char *)(lVar8 + -0x18 + uVar13 * -0x18);
    auVar38[0] = -(*pcVar3 == DAT_1465425b0);
    auVar38[1] = -(pcVar3[1] == DAT_1465425b0._1_1_);
    auVar38[2] = -(pcVar3[2] == DAT_1465425b0._2_1_);
    auVar38[3] = -(pcVar3[3] == DAT_1465425b0._3_1_);
    auVar38[4] = -(pcVar3[4] == DAT_1465425b0._4_1_);
    auVar38[5] = -(pcVar3[5] == DAT_1465425b0._5_1_);
    auVar38[6] = -(pcVar3[6] == DAT_1465425b0._6_1_);
    auVar38[7] = -(pcVar3[7] == DAT_1465425b0._7_1_);
    auVar38[8] = -(pcVar3[8] == DAT_1465425b0._8_1_);
    auVar38[9] = -(pcVar3[9] == DAT_1465425b0._9_1_);
    auVar38[10] = -(pcVar3[10] == DAT_1465425b0._10_1_);
    auVar38[0xb] = -(pcVar3[0xb] == DAT_1465425b0._11_1_);
    auVar38[0xc] = -(pcVar3[0xc] == DAT_1465425b0._12_1_);
    auVar38[0xd] = -(pcVar3[0xd] == DAT_1465425b0._13_1_);
    auVar38[0xe] = -(pcVar3[0xe] == DAT_1465425b0._14_1_);
    auVar38[0xf] = -(pcVar3[0xf] == DAT_1465425b0._15_1_);
    if ((ushort)((ushort)(SUB161(auVar38 >> 7,0) & 1) | (ushort)(SUB161(auVar38 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar38 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar38 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar38 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar38 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar38 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar38 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar38 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar38 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar38 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar38 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar38 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar38 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar38 >> 0x77,0) & 1) << 0xe | (ushort)(auVar38[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar10 = *(ulong *)(lVar8 + uVar13 * -0x18 + -8);
      if (((uVar19 <= uVar10) || (uVar10 = *(ulong *)(lVar15 + uVar10 * 8), uVar10 == 0)) ||
         (lVar20 = ~uVar10 * 0x38, *(char *)(lVar14 + 0x30 + lVar20) == '\0')) goto LAB_1403122fd;
      bVar26 = *(byte *)(*(long *)(lVar20 + lVar14 + 0x10) + 10);
      goto LAB_140311bd8;
    }
    uVar18 = (ushort)(uVar12 - 1) & (ushort)uVar12;
    uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar18);
  }
  goto LAB_140311dfd;
LAB_140311e36:
  do {
    if ((int)uVar17 == (int)lVar8) {
      do {
        if (puVar9 == local_e0 + local_d8) goto LAB_140311f1d;
        uVar12 = *puVar9;
        puVar9 = puVar9 + 1;
        lVar8 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48);
      } while (lVar8 == 0);
      lVar15 = *(long *)(param_3 + 0x1a8) + (ulong)uVar12 * 0x48;
      if ((local_c8 < *(ulong *)(lVar15 + 0x40)) &&
         (uVar17 = *(ulong *)(*(long *)(lVar15 + 0x38) + local_c8 * 8), uVar17 != 0)) {
        lVar15 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar17 * 0x30);
      }
      else {
        lVar15 = 0;
      }
      uVar17 = 0;
    }
    lVar14 = uVar17 * 0x18;
    uVar17 = (ulong)((int)uVar17 + 1);
  } while (*(long *)(lVar15 + 0x10 + lVar14) == 0);
  goto LAB_14031232c;
  while (uVar17 = (ulong)uVar12, uVar12 = uVar12 + 1,
        *(long *)(lVar14 + 0x10 + (ulong)~*(uint *)(lVar8 + 8 + uVar17 * 0x10) * 0x18) == 0) {
LAB_140311eb5:
    if (uVar12 == (uint)lVar15) {
      do {
        if (puVar9 == local_e0 + local_d8) goto LAB_140311f1d;
        uVar12 = *puVar9;
        puVar9 = puVar9 + 1;
        lVar15 = *(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0);
      } while (lVar15 == 0);
      lVar8 = (ulong)uVar12 * 0xa0 + *(long *)(param_3 + 0x108);
      uVar17 = (ulong)*(uint *)(lVar8 + 0x94);
      if (local_c8 < *(ulong *)(*(long *)(param_3 + 0x1a8) + 0x40 + uVar17 * 0x48)) {
        lVar14 = *(long *)(param_3 + 0x1a8) + uVar17 * 0x48;
        uVar17 = *(ulong *)(*(long *)(lVar14 + 0x38) + local_c8 * 8);
        if (uVar17 == 0) goto LAB_140311e8b;
        lVar14 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar17 * 0x30);
      }
      else {
LAB_140311e8b:
        lVar14 = 0;
      }
      lVar8 = *(long *)(lVar8 + 0x50);
      uVar12 = 0;
    }
  }
LAB_14031232c:
  bVar11 = 1;
LAB_140311f1f:
  func_0x000140061090();
  func_0x00014050a710();
  uVar4 = *(undefined4 *)(param_3 + 0x5b0);
  func_0x0001404faa70();
  puVar9 = local_e0 + local_d8;
  uVar17 = (ulong)(bVar26 & bVar11);
  fVar39 = fVar39 / fVar40;
  fVar41 = in_XMM8_Da / fVar40;
  fVar40 = (fStack_1cc - in_XMM8_Da) / fVar40;
  lVar15 = 0;
  local_b0 = 8;
  lVar14 = 0;
  lVar8 = 0;
  uVar10 = 0;
LAB_140311fb7:
  if (local_d0 == '\0') {
    if ((int)uVar10 == (int)lVar8) {
      do {
        if (local_e0 == puVar9) goto LAB_14031228c;
        uVar12 = *local_e0;
        local_e0 = local_e0 + 1;
        lVar8 = *(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0);
      } while (lVar8 == 0);
      lVar16 = *(long *)(param_3 + 0x108) + (ulong)uVar12 * 0xa0;
      uVar17 = (ulong)*(uint *)(lVar16 + 0x94);
      lVar20 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x18 + uVar17 * 0x48);
      lVar14 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x38 + uVar17 * 0x48);
      lVar23 = ~*(ulong *)(lVar14 + local_c8 * 8) * 0x30;
      lVar15 = *(long *)(lVar20 + 0x10 + lVar23);
      local_a0 = *(long *)(lVar20 + 0x28 + lVar23);
      lVar23 = ~*(ulong *)(lVar14 + local_c0 * 8) * 0x30;
      lVar14 = *(long *)(lVar20 + 0x10 + lVar23);
      uVar17 = *(ulong *)(lVar20 + 0x28 + lVar23);
      local_b0 = *(long *)(lVar16 + 0x50);
      uVar10 = 0;
    }
    iVar25 = (int)uVar10;
    uVar10 = (ulong)~*(uint *)(local_b0 + 8 + uVar10 * 0x10);
  }
  else {
    if ((int)uVar10 == (int)lVar8) {
      do {
        if (local_e0 == puVar9) {
LAB_14031228c:
          func_0x000140061090();
          return;
        }
        uVar12 = *local_e0;
        local_e0 = local_e0 + 1;
        lVar8 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48);
      } while (lVar8 == 0);
      lVar15 = *(long *)(param_3 + 0x1a8) + (ulong)uVar12 * 0x48;
      lVar20 = *(long *)(lVar15 + 0x18);
      lVar14 = *(long *)(lVar15 + 0x38);
      lVar16 = ~*(ulong *)(lVar14 + local_c8 * 8) * 0x30;
      lVar15 = *(long *)(lVar20 + 0x10 + lVar16);
      local_a0 = *(long *)(lVar20 + 0x28 + lVar16);
      lVar16 = ~*(ulong *)(lVar14 + local_c0 * 8) * 0x30;
      lVar14 = *(long *)(lVar20 + 0x10 + lVar16);
      uVar17 = *(ulong *)(lVar20 + 0x28 + lVar16);
      uVar10 = 0;
    }
    iVar25 = (int)uVar10;
  }
  lVar16 = uVar10 * 0x180 + lVar15;
  puVar2 = (undefined4 *)(local_a0 + uVar10 * 4);
  pcVar1 = (char *)(lVar14 + uVar10);
  lVar20 = uVar10 * 4;
  cVar21 = '\x01';
  if ((bVar24 & bVar26 & bVar11) == 0) goto LAB_140312160;
  if (*(int *)(lVar16 + 0x68) == 0) {
LAB_1403121a0:
    *puVar2 = uVar4;
    *(undefined4 *)(lVar16 + 0x68) = 1;
    *(float *)(lVar16 + 0x6c) = fVar41;
    iVar22 = *(int *)(lVar16 + 0x78);
    if (iVar22 == 0) goto LAB_140312200;
LAB_1403121ba:
    if (iVar22 == 1) {
      if ((*(float *)(lVar16 + 0x7c) == fVar39) && (!NAN(*(float *)(lVar16 + 0x7c)) && !NAN(fVar39))
         ) goto LAB_1403121f0;
      goto LAB_140312200;
    }
    if (((*(float *)(lVar16 + 0x7c) != 0.0) || ((NAN(*(float *)(lVar16 + 0x7c)) || (fVar39 != 0.0)))
        ) || (NAN(fVar39))) goto LAB_140312200;
LAB_1403121f0:
    iVar22 = *(int *)(lVar16 + 0x88);
    if (iVar22 != 0) goto LAB_14031221d;
LAB_140312260:
    *puVar2 = uVar4;
    *(undefined4 *)(lVar16 + 0x88) = 1;
    *(float *)(lVar16 + 0x8c) = fVar40;
    cVar21 = '\0';
    uVar10 = (ulong)(iVar25 + 1);
    if (*pcVar1 != '\0') goto LAB_140311fb0;
    goto LAB_140311fb7;
  }
  if (*(int *)(lVar16 + 0x68) == 1) {
    if ((*(float *)(lVar16 + 0x6c) == fVar41) && (!NAN(*(float *)(lVar16 + 0x6c)) && !NAN(fVar41)))
    goto LAB_140312190;
    goto LAB_1403121a0;
  }
  if ((fVar41 != 0.0) ||
     (((NAN(fVar41) || (*(float *)(lVar16 + 0x6c) != 0.0)) || (NAN(*(float *)(lVar16 + 0x6c))))))
  goto LAB_1403121a0;
LAB_140312190:
  iVar22 = *(int *)(lVar16 + 0x78);
  if (iVar22 != 0) goto LAB_1403121ba;
LAB_140312200:
  *puVar2 = uVar4;
  *(undefined4 *)(lVar16 + 0x78) = 1;
  *(float *)(lVar16 + 0x7c) = fVar39;
  iVar22 = *(int *)(lVar16 + 0x88);
  if (iVar22 == 0) goto LAB_140312260;
LAB_14031221d:
  if (iVar22 == 1) {
    if ((*(float *)(lVar16 + 0x8c) != fVar40) || (NAN(*(float *)(lVar16 + 0x8c)) || NAN(fVar40)))
    goto LAB_140312260;
  }
  else if ((((fVar40 != 0.0) || (NAN(fVar40))) || (*(float *)(lVar16 + 0x8c) != 0.0)) ||
          (NAN(*(float *)(lVar16 + 0x8c)))) goto LAB_140312260;
  cVar21 = '\0';
  uVar10 = (ulong)(iVar25 + 1);
  if (*pcVar1 == '\0') goto LAB_140311fb7;
LAB_140311fb0:
  *(undefined4 *)(uVar17 + lVar20) = uVar4;
  *pcVar1 = cVar21;
  goto LAB_140311fb7;
LAB_140311f1d:
  bVar11 = 0;
  goto LAB_140311f1f;
LAB_140312160:
  uVar10 = (ulong)(iVar25 + 1);
  if (*pcVar1 == '\x01') goto LAB_140311fb7;
  goto LAB_140311fb0;
LAB_140311dfd:
  auVar30[0] = -(*pcVar1 == -1);
  auVar30[1] = -(pcVar1[1] == -1);
  auVar30[2] = -(pcVar1[2] == -1);
  auVar30[3] = -(pcVar1[3] == -1);
  auVar30[4] = -(pcVar1[4] == -1);
  auVar30[5] = -(pcVar1[5] == -1);
  auVar30[6] = -(pcVar1[6] == -1);
  auVar30[7] = -(pcVar1[7] == -1);
  auVar30[8] = -(pcVar1[8] == -1);
  auVar30[9] = -(pcVar1[9] == -1);
  auVar30[10] = -(pcVar1[10] == -1);
  auVar30[0xb] = -(pcVar1[0xb] == -1);
  auVar30[0xc] = -(pcVar1[0xc] == -1);
  auVar30[0xd] = -(pcVar1[0xd] == -1);
  auVar30[0xe] = -(pcVar1[0xe] == -1);
  auVar30[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar30 >> 7,0) & 1) != 0 || (SUB161(auVar30 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar30 >> 0x17,0) & 1) != 0) || (SUB161(auVar30 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar30 >> 0x27,0) & 1) != 0) || (SUB161(auVar30 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar30 >> 0x37,0) & 1) != 0) || (SUB161(auVar30 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar30 >> 0x47,0) & 1) != 0) || (SUB161(auVar30 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar30 >> 0x57,0) & 1) != 0) || (SUB161(auVar30 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar30 >> 0x67,0) & 1) != 0) || (SUB161(auVar30 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar30 >> 0x77,0) & 1) != 0) || auVar30[0xf] < '\0') {
LAB_1403122fd:
    func_0x0001464ce5f0();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  uVar10 = uVar10 + lVar20 + 0x10;
  lVar20 = lVar20 + 0x10;
  goto LAB_140311dad;
LAB_140311b47:
  auVar28[0] = -(*pcVar1 == -1);
  auVar28[1] = -(pcVar1[1] == -1);
  auVar28[2] = -(pcVar1[2] == -1);
  auVar28[3] = -(pcVar1[3] == -1);
  auVar28[4] = -(pcVar1[4] == -1);
  auVar28[5] = -(pcVar1[5] == -1);
  auVar28[6] = -(pcVar1[6] == -1);
  auVar28[7] = -(pcVar1[7] == -1);
  auVar28[8] = -(pcVar1[8] == -1);
  auVar28[9] = -(pcVar1[9] == -1);
  auVar28[10] = -(pcVar1[10] == -1);
  auVar28[0xb] = -(pcVar1[0xb] == -1);
  auVar28[0xc] = -(pcVar1[0xc] == -1);
  auVar28[0xd] = -(pcVar1[0xd] == -1);
  auVar28[0xe] = -(pcVar1[0xe] == -1);
  auVar28[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar28 >> 7,0) & 1) != 0 || (SUB161(auVar28 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar28 >> 0x17,0) & 1) != 0) || (SUB161(auVar28 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar28 >> 0x27,0) & 1) != 0) || (SUB161(auVar28 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar28 >> 0x37,0) & 1) != 0) || (SUB161(auVar28 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar28 >> 0x47,0) & 1) != 0) || (SUB161(auVar28 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar28 >> 0x57,0) & 1) != 0) || (SUB161(auVar28 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar28 >> 0x67,0) & 1) != 0) || (SUB161(auVar28 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar28 >> 0x77,0) & 1) != 0) || auVar28[0xf] < '\0') {
LAB_140311d5d:
    func_0x0001464ce5f0();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  uVar10 = uVar10 + lVar20 + 0x10;
  lVar20 = lVar20 + 0x10;
  goto LAB_140311afb;
}
