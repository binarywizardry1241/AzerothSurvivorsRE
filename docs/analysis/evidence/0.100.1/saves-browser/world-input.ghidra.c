
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  char *pcVar1;
  char *pcVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  byte bVar5;
  int iVar6;
  undefined4 uVar7;
  code *pcVar8;
  uint uVar9;
  uint uVar10;
  long lVar11;
  undefined8 uVar12;
  long lVar13;
  long *plVar14;
  ulong uVar15;
  ulong uVar16;
  uint uVar17;
  undefined8 *puVar18;
  long lVar19;
  uint uVar20;
  ushort uVar21;
  ulong uVar22;
  long lVar23;
  long lVar24;
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
  char cVar36;
  char cVar38;
  char cVar39;
  char cVar40;
  char cVar41;
  char cVar42;
  char cVar43;
  undefined8 in_XMM6_Qa;
  char cVar44;
  char cVar45;
  char cVar46;
  char cVar47;
  char cVar48;
  char cVar49;
  char cVar50;
  char cVar51;
  undefined8 in_XMM6_Qb;
  char cVar52;
  undefined1 auVar37 [16];
  char cVar53;
  char cVar55;
  char cVar56;
  char cVar57;
  char cVar58;
  char cVar59;
  char cVar60;
  undefined8 in_XMM7_Qa;
  char cVar61;
  char cVar62;
  char cVar63;
  char cVar64;
  char cVar65;
  char cVar66;
  char cVar67;
  char cVar68;
  undefined8 in_XMM7_Qb;
  char cVar69;
  undefined1 auVar54 [16];
  undefined8 in_XMM8_Qa;
  undefined8 in_XMM8_Qb;
  undefined4 in_XMM9_Da;
  undefined4 in_XMM9_Db;
  undefined4 in_XMM9_Dc;
  undefined4 in_XMM9_Dd;
  undefined8 in_XMM10_Qa;
  undefined8 in_XMM10_Qb;
  undefined8 in_XMM11_Qa;
  undefined8 in_XMM11_Qb;
  undefined8 in_XMM12_Qa;
  undefined8 in_XMM12_Qb;
  undefined8 in_XMM13_Qa;
  undefined8 in_XMM13_Qb;
  undefined8 in_XMM14_Qa;
  undefined8 in_XMM14_Qb;
  undefined8 in_XMM15_Qa;
  undefined8 in_XMM15_Qb;
  undefined1 auVar70 [16];
  undefined8 uStack_48;

  uStack_48 = 0x140287fb6;
  auVar70 = func_0x000145772680();
  auVar54 = _DAT_145951280;
  auVar37 = _DAT_145913190;
  lVar24 = auVar70._8_8_;
  lVar11 = -auVar70._0_8_;
  *(undefined8 *)(&stack0x000010a0 + lVar11) = in_XMM15_Qa;
  *(undefined8 *)(&stack0x000010a8 + lVar11) = in_XMM15_Qb;
  *(undefined8 *)(&stack0x00001090 + lVar11) = in_XMM14_Qa;
  *(undefined8 *)(&stack0x00001098 + lVar11) = in_XMM14_Qb;
  *(undefined8 *)(&stack0x00001080 + lVar11) = in_XMM13_Qa;
  *(undefined8 *)(&stack0x00001088 + lVar11) = in_XMM13_Qb;
  *(undefined8 *)(&stack0x00001070 + lVar11) = in_XMM12_Qa;
  *(undefined8 *)(&stack0x00001078 + lVar11) = in_XMM12_Qb;
  *(undefined8 *)(&stack0x00001060 + lVar11) = in_XMM11_Qa;
  *(undefined8 *)(&stack0x00001068 + lVar11) = in_XMM11_Qb;
  *(undefined8 *)(&stack0x00001050 + lVar11) = in_XMM10_Qa;
  *(undefined8 *)(&stack0x00001058 + lVar11) = in_XMM10_Qb;
  *(undefined4 *)(&stack0x00001040 + lVar11) = in_XMM9_Da;
  *(undefined4 *)(&stack0x00001044 + lVar11) = in_XMM9_Db;
  *(undefined4 *)(&stack0x00001048 + lVar11) = in_XMM9_Dc;
  *(undefined4 *)(&stack0x0000104c + lVar11) = in_XMM9_Dd;
  *(undefined8 *)(&stack0x00001030 + lVar11) = in_XMM8_Qa;
  *(undefined8 *)(&stack0x00001038 + lVar11) = in_XMM8_Qb;
  *(undefined8 *)(&stack0x00001020 + lVar11) = in_XMM7_Qa;
  *(undefined8 *)(&stack0x00001028 + lVar11) = in_XMM7_Qb;
  *(undefined8 *)(&stack0x00001010 + lVar11) = in_XMM6_Qa;
  *(undefined8 *)(&stack0x00001018 + lVar11) = in_XMM6_Qb;
  *(undefined8 *)(&stack0x00001008 + lVar11) = 0xfffffffffffffffe;
  if (*(long *)(lVar24 + 0x90) != 0) {
    lVar13 = *(long *)(lVar24 + 0x78);
    uVar16 = *(ulong *)(lVar24 + 0x80);
    uVar15 = 0x5824c802f396e770;
    lVar19 = 0;
    while( true ) {
      uVar15 = uVar15 & uVar16;
      pcVar1 = (char *)(lVar13 + uVar15);
      cVar36 = DAT_145913190;
      auVar70[0] = -(*pcVar1 == cVar36);
      cVar38 = DAT_145913190._1_1_;
      auVar70[1] = -(pcVar1[1] == cVar38);
      cVar39 = DAT_145913190._2_1_;
      auVar70[2] = -(pcVar1[2] == cVar39);
      cVar40 = DAT_145913190._3_1_;
      auVar70[3] = -(pcVar1[3] == cVar40);
      cVar41 = DAT_145913190._4_1_;
      auVar70[4] = -(pcVar1[4] == cVar41);
      cVar42 = DAT_145913190._5_1_;
      auVar70[5] = -(pcVar1[5] == cVar42);
      cVar43 = DAT_145913190._6_1_;
      auVar70[6] = -(pcVar1[6] == cVar43);
      cVar44 = DAT_145913190._7_1_;
      auVar70[7] = -(pcVar1[7] == cVar44);
      cVar45 = DAT_145913190._8_1_;
      auVar70[8] = -(pcVar1[8] == cVar45);
      cVar46 = DAT_145913190._9_1_;
      auVar70[9] = -(pcVar1[9] == cVar46);
      cVar47 = DAT_145913190._10_1_;
      auVar70[10] = -(pcVar1[10] == cVar47);
      cVar48 = DAT_145913190._11_1_;
      auVar70[0xb] = -(pcVar1[0xb] == cVar48);
      cVar49 = DAT_145913190._12_1_;
      auVar70[0xc] = -(pcVar1[0xc] == cVar49);
      cVar50 = DAT_145913190._13_1_;
      auVar70[0xd] = -(pcVar1[0xd] == cVar50);
      cVar51 = DAT_145913190._14_1_;
      auVar70[0xe] = -(pcVar1[0xe] == cVar51);
      cVar52 = DAT_145913190._15_1_;
      auVar70[0xf] = -(pcVar1[0xf] == cVar52);
      uVar21 = (ushort)(SUB161(auVar70 >> 7,0) & 1) | (ushort)(SUB161(auVar70 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar70 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar70 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar70 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar70 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar70 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar70 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar70 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar70 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar70 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar70 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar70 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar70 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar70 >> 0x77,0) & 1) << 0xe | (ushort)(auVar70[0xf] >> 7) << 0xf;
      uVar17 = (uint)uVar21;
      while (uVar21 != 0) {
        uVar20 = 0;
        for (uVar9 = uVar17; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
          uVar20 = uVar20 + 1;
        }
        uVar22 = uVar20 + uVar15 & uVar16;
        pcVar2 = (char *)(lVar13 + -0x18 + uVar22 * -0x18);
        cVar53 = DAT_145951280;
        auVar29[0] = -(*pcVar2 == cVar53);
        cVar55 = DAT_145951280._1_1_;
        auVar29[1] = -(pcVar2[1] == cVar55);
        cVar56 = DAT_145951280._2_1_;
        auVar29[2] = -(pcVar2[2] == cVar56);
        cVar57 = DAT_145951280._3_1_;
        auVar29[3] = -(pcVar2[3] == cVar57);
        cVar58 = DAT_145951280._4_1_;
        auVar29[4] = -(pcVar2[4] == cVar58);
        cVar59 = DAT_145951280._5_1_;
        auVar29[5] = -(pcVar2[5] == cVar59);
        cVar60 = DAT_145951280._6_1_;
        auVar29[6] = -(pcVar2[6] == cVar60);
        cVar61 = DAT_145951280._7_1_;
        auVar29[7] = -(pcVar2[7] == cVar61);
        cVar62 = DAT_145951280._8_1_;
        auVar29[8] = -(pcVar2[8] == cVar62);
        cVar63 = DAT_145951280._9_1_;
        auVar29[9] = -(pcVar2[9] == cVar63);
        cVar64 = DAT_145951280._10_1_;
        auVar29[10] = -(pcVar2[10] == cVar64);
        cVar65 = DAT_145951280._11_1_;
        auVar29[0xb] = -(pcVar2[0xb] == cVar65);
        cVar66 = DAT_145951280._12_1_;
        auVar29[0xc] = -(pcVar2[0xc] == cVar66);
        cVar67 = DAT_145951280._13_1_;
        auVar29[0xd] = -(pcVar2[0xd] == cVar67);
        cVar68 = DAT_145951280._14_1_;
        auVar29[0xe] = -(pcVar2[0xe] == cVar68);
        cVar69 = DAT_145951280._15_1_;
        auVar29[0xf] = -(pcVar2[0xf] == cVar69);
        if ((ushort)((ushort)(SUB161(auVar29 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar29 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar29 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar29 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar29 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar29 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar29 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar29 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar29 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar29 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar29 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar29 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar29 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar29 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar29 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar29[0xf] >> 7) << 0xf) == 0xffff) {
          uVar15 = *(ulong *)(lVar13 + uVar22 * -0x18 + -8);
          if (*(ulong *)(lVar24 + 0x218) <= uVar15) goto LAB_1402881d2;
          uVar15 = *(ulong *)(*(long *)(lVar24 + 0x210) + uVar15 * 8);
          if (uVar15 == 0) goto LAB_1402881d2;
          lVar19 = *(long *)(lVar24 + 0x1e0);
          lVar23 = ~uVar15 * 0x38;
          if (*(char *)(lVar19 + 0x30 + lVar23) == '\0') goto LAB_1402881d2;
          lVar23 = *(long *)(lVar23 + lVar19 + 0x10);
          if (*(char *)(lVar23 + 0x1a8) != '\x01') {
            return;
          }
          if ((*(long *)(lVar23 + 0x98) != -1) && (*(long *)(lVar23 + 0x28) == 0)) {
            return;
          }
          uVar15 = 0x5824c802f396e770;
          lVar23 = 0;
          goto LAB_14028816b;
        }
        uVar21 = (ushort)(uVar17 - 1) & (ushort)uVar17;
        uVar17 = CONCAT22((short)(uVar17 - 1 >> 0x10),uVar21);
      }
      auVar25[0] = -(*pcVar1 == -1);
      auVar25[1] = -(pcVar1[1] == -1);
      auVar25[2] = -(pcVar1[2] == -1);
      auVar25[3] = -(pcVar1[3] == -1);
      auVar25[4] = -(pcVar1[4] == -1);
      auVar25[5] = -(pcVar1[5] == -1);
      auVar25[6] = -(pcVar1[6] == -1);
      auVar25[7] = -(pcVar1[7] == -1);
      auVar25[8] = -(pcVar1[8] == -1);
      auVar25[9] = -(pcVar1[9] == -1);
      auVar25[10] = -(pcVar1[10] == -1);
      auVar25[0xb] = -(pcVar1[0xb] == -1);
      auVar25[0xc] = -(pcVar1[0xc] == -1);
      auVar25[0xd] = -(pcVar1[0xd] == -1);
      auVar25[0xe] = -(pcVar1[0xe] == -1);
      auVar25[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar25 >> 7,0) & 1) != 0 || (SUB161(auVar25 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar25 >> 0x17,0) & 1) != 0) || (SUB161(auVar25 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar25 >> 0x27,0) & 1) != 0) || (SUB161(auVar25 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar25 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar25 >> 0x3f,0) & 1) != 0) || (SUB161(auVar25 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar25 >> 0x4f,0) & 1) != 0) || (SUB161(auVar25 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar25 >> 0x5f,0) & 1) != 0) || (SUB161(auVar25 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar25 >> 0x6f,0) & 1) != 0) || (SUB161(auVar25 >> 0x77,0) & 1) != 0) ||
          auVar25[0xf] < '\0') break;
      uVar15 = uVar15 + lVar19 + 0x10;
      lVar19 = lVar19 + 0x10;
    }
  }
LAB_1402881d2:
  *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00001006 + lVar11;
  *(undefined8 *)(&stack0x000003a8 + lVar11) = 0x14500b840;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288208;
  func_0x000145903d10();
                    /* WARNING: Does not return */
  pcVar8 = (code *)invalidInstructionException();
  (*pcVar8)();
LAB_14028816b:
  uVar15 = uVar15 & uVar16;
  pcVar1 = (char *)(lVar13 + uVar15);
  auVar30[0] = -(*pcVar1 == cVar36);
  auVar30[1] = -(pcVar1[1] == cVar38);
  auVar30[2] = -(pcVar1[2] == cVar39);
  auVar30[3] = -(pcVar1[3] == cVar40);
  auVar30[4] = -(pcVar1[4] == cVar41);
  auVar30[5] = -(pcVar1[5] == cVar42);
  auVar30[6] = -(pcVar1[6] == cVar43);
  auVar30[7] = -(pcVar1[7] == cVar44);
  auVar30[8] = -(pcVar1[8] == cVar45);
  auVar30[9] = -(pcVar1[9] == cVar46);
  auVar30[10] = -(pcVar1[10] == cVar47);
  auVar30[0xb] = -(pcVar1[0xb] == cVar48);
  auVar30[0xc] = -(pcVar1[0xc] == cVar49);
  auVar30[0xd] = -(pcVar1[0xd] == cVar50);
  auVar30[0xe] = -(pcVar1[0xe] == cVar51);
  auVar30[0xf] = -(pcVar1[0xf] == cVar52);
  uVar21 = (ushort)(SUB161(auVar30 >> 7,0) & 1) | (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
           (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
           (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
           (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
           (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
           (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
           (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
           (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
           (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
           (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
           (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
           (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
           (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe | (ushort)(auVar30[0xf] >> 7) << 0xf;
  uVar17 = (uint)uVar21;
  while (uVar21 != 0) {
    uVar20 = 0;
    for (uVar9 = uVar17; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
      uVar20 = uVar20 + 1;
    }
    uVar22 = uVar20 + uVar15 & uVar16;
    pcVar2 = (char *)(lVar13 + -0x18 + uVar22 * -0x18);
    auVar31[0] = -(*pcVar2 == cVar53);
    auVar31[1] = -(pcVar2[1] == cVar55);
    auVar31[2] = -(pcVar2[2] == cVar56);
    auVar31[3] = -(pcVar2[3] == cVar57);
    auVar31[4] = -(pcVar2[4] == cVar58);
    auVar31[5] = -(pcVar2[5] == cVar59);
    auVar31[6] = -(pcVar2[6] == cVar60);
    auVar31[7] = -(pcVar2[7] == cVar61);
    auVar31[8] = -(pcVar2[8] == cVar62);
    auVar31[9] = -(pcVar2[9] == cVar63);
    auVar31[10] = -(pcVar2[10] == cVar64);
    auVar31[0xb] = -(pcVar2[0xb] == cVar65);
    auVar31[0xc] = -(pcVar2[0xc] == cVar66);
    auVar31[0xd] = -(pcVar2[0xd] == cVar67);
    auVar31[0xe] = -(pcVar2[0xe] == cVar68);
    auVar31[0xf] = -(pcVar2[0xf] == cVar69);
    if ((ushort)((ushort)(SUB161(auVar31 >> 7,0) & 1) | (ushort)(SUB161(auVar31 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar31 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar31 >> 0x77,0) & 1) << 0xe | (ushort)(auVar31[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar16 = *(ulong *)(lVar13 + uVar22 * -0x18 + -8);
      if (((*(ulong *)(lVar24 + 0x218) <= uVar16) ||
          (uVar16 = *(ulong *)(*(long *)(lVar24 + 0x210) + uVar16 * 8), uVar16 == 0)) ||
         (lVar13 = ~uVar16 * 0x38, *(char *)(lVar19 + 0x30 + lVar13) == '\0')) goto LAB_1402883d2;
      lVar19 = lVar19 + lVar13;
      lVar13 = *(long *)(lVar19 + 0x10);
      *(undefined4 *)(lVar19 + 0x2c) = *(undefined4 *)(lVar24 + 0x5b0);
      *(undefined8 *)(&stack0x00000e40 + lVar11) = *(undefined8 *)(lVar13 + 0x28);
      uVar12 = *(undefined8 *)(lVar13 + 0x20);
      *(undefined8 *)(&stack0x00000e30 + lVar11) = *(undefined8 *)(lVar13 + 0x18);
      *(undefined8 *)(&stack0x00000e38 + lVar11) = uVar12;
      *(undefined8 *)(lVar13 + 0x18) = 0;
      *(undefined8 *)(lVar13 + 0x20) = 8;
      *(undefined8 *)(lVar13 + 0x28) = 0;
      if (*(long *)(lVar24 + 0x90) == 0) goto LAB_14028840a;
      lVar13 = *(long *)(lVar24 + 0x78);
      uVar16 = 0x5824c802f396e770;
      lVar19 = 0;
      goto LAB_1402882a9;
    }
    uVar21 = (ushort)(uVar17 - 1) & (ushort)uVar17;
    uVar17 = CONCAT22((short)(uVar17 - 1 >> 0x10),uVar21);
  }
  goto LAB_1402881b5;
LAB_1402882a9:
  uVar16 = uVar16 & *(ulong *)(lVar24 + 0x80);
  auVar70 = *(undefined1 (*) [16])(lVar13 + uVar16);
  auVar32[0] = -(auVar70[0] == cVar36);
  auVar32[1] = -(auVar70[1] == cVar38);
  auVar32[2] = -(auVar70[2] == cVar39);
  auVar32[3] = -(auVar70[3] == cVar40);
  auVar32[4] = -(auVar70[4] == cVar41);
  auVar32[5] = -(auVar70[5] == cVar42);
  auVar32[6] = -(auVar70[6] == cVar43);
  auVar32[7] = -(auVar70[7] == cVar44);
  auVar32[8] = -(auVar70[8] == cVar45);
  auVar32[9] = -(auVar70[9] == cVar46);
  auVar32[10] = -(auVar70[10] == cVar47);
  auVar32[0xb] = -(auVar70[0xb] == cVar48);
  auVar32[0xc] = -(auVar70[0xc] == cVar49);
  auVar32[0xd] = -(auVar70[0xd] == cVar50);
  auVar32[0xe] = -(auVar70[0xe] == cVar51);
  auVar32[0xf] = -(auVar70[0xf] == cVar52);
  uVar21 = (ushort)(SUB161(auVar32 >> 7,0) & 1) | (ushort)(SUB161(auVar32 >> 0xf,0) & 1) << 1 |
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
           (ushort)(SUB161(auVar32 >> 0x77,0) & 1) << 0xe | (ushort)(auVar32[0xf] >> 7) << 0xf;
  uVar20 = (uint)uVar21;
  while( true ) {
    if (uVar21 == 0) goto LAB_1402882fb;
    uVar9 = 0;
    for (uVar10 = uVar20; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
      uVar9 = uVar9 + 1;
    }
    uVar15 = uVar9 + uVar16 & *(ulong *)(lVar24 + 0x80);
    pcVar1 = (char *)(lVar13 + -0x18 + uVar15 * -0x18);
    auVar33[0] = -(*pcVar1 == cVar53);
    auVar33[1] = -(pcVar1[1] == cVar55);
    auVar33[2] = -(pcVar1[2] == cVar56);
    auVar33[3] = -(pcVar1[3] == cVar57);
    auVar33[4] = -(pcVar1[4] == cVar58);
    auVar33[5] = -(pcVar1[5] == cVar59);
    auVar33[6] = -(pcVar1[6] == cVar60);
    auVar33[7] = -(pcVar1[7] == cVar61);
    auVar33[8] = -(pcVar1[8] == cVar62);
    auVar33[9] = -(pcVar1[9] == cVar63);
    auVar33[10] = -(pcVar1[10] == cVar64);
    auVar33[0xb] = -(pcVar1[0xb] == cVar65);
    auVar33[0xc] = -(pcVar1[0xc] == cVar66);
    auVar33[0xd] = -(pcVar1[0xd] == cVar67);
    auVar33[0xe] = -(pcVar1[0xe] == cVar68);
    auVar33[0xf] = -(pcVar1[0xf] == cVar69);
    if ((ushort)((ushort)(SUB161(auVar33 >> 7,0) & 1) | (ushort)(SUB161(auVar33 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar33 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar33 >> 0x77,0) & 1) << 0xe | (ushort)(auVar33[0xf] >> 7) << 0xf
                ) == 0xffff) break;
    uVar21 = (ushort)(uVar20 - 1) & (ushort)uVar20;
    uVar20 = CONCAT22((short)(uVar20 - 1 >> 0x10),uVar21);
  }
  uVar16 = *(ulong *)(lVar13 + uVar15 * -0x18 + -8);
  if ((*(ulong *)(lVar24 + 0x218) <= uVar16) ||
     (uVar16 = *(ulong *)(*(long *)(lVar24 + 0x210) + uVar16 * 8), uVar16 == 0)) goto LAB_14028840a;
  lVar13 = *(long *)(lVar24 + 0x1e0);
  lVar19 = ~uVar16 * 0x38;
  if (*(char *)(lVar13 + 0x30 + lVar19) == '\0') goto LAB_14028840a;
  *(long *)(&stack0x00000e28 + lVar11) = lVar24 + 0x78;
  lVar13 = lVar13 + lVar19;
  lVar19 = *(long *)(lVar13 + 0x10);
  *(undefined4 *)(lVar13 + 0x2c) = *(undefined4 *)(lVar24 + 0x5b0);
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288391;
  func_0x0001457731ed(uVar22 * -3,lVar19,lVar19 + 0x98,&stack0x00000d30 + lVar11,0xd8);
  *(undefined8 *)(lVar19 + 0x98) = 0xffffffffffffffff;
  lVar13 = *(long *)(&stack0x00000d30 + lVar11);
  if (lVar13 == -1) {
    *(undefined8 *)(&stack0x00000e70 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000e78 + lVar11) = 8;
    *(undefined8 *)(&stack0x00000e80 + lVar11) = 0;
    *(undefined8 *)(&stack0x000001d0 + lVar11) = 0x145954c18;
    *(undefined8 *)(&stack0x000001d8 + lVar11) = 0x145958518;
    *(long *)(&stack0x000001e0 + lVar11) = lVar24;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028848f;
    func_0x000140002200();
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028849e;
    lVar13 = func_0x0001400021c0();
    if (lVar13 == 0) {
      *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a6c3;
      func_0x00014590379b();
      goto LAB_14028a6c4;
    }
    *(undefined8 *)(&stack0x00000ad0 + lVar11) = 0x60;
    *(long *)(&stack0x00000ad8 + lVar11) = lVar13;
    *(undefined8 *)(&stack0x00000ae0 + lVar11) = 0;
    *(long *)(&stack0x000003b0 + lVar11) = lVar13;
    *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00000ae0 + lVar11;
    *(undefined8 *)(&stack0x000003a8 + lVar11) = 0;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x1402884f7;
    func_0x000140036490();
    *(undefined8 *)(&stack0x00000000 + lVar11) = *(undefined8 *)(&stack0x00000ad0 + lVar11);
    *(undefined8 *)((long)(&stack0x00000000 + lVar11) + 8) =
         *(undefined8 *)(&stack0x00000ad8 + lVar11);
    *(undefined8 *)(&stack0x00000010 + lVar11) = *(undefined8 *)(&stack0x00000ae0 + lVar11);
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028851f;
    func_0x000140649f30();
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028852c;
    func_0x00014064ba70();
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288532;
    plVar14 = (long *)func_0x0001456ff6a0();
    if ((char)plVar14[2] == '\x01') {
      lVar13 = *plVar14;
      *(long *)(&stack0x00000ff8 + lVar11) = plVar14[1];
    }
    else {
      *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a648;
      auVar70 = func_0x000145712ca0();
      lVar13 = auVar70._0_8_;
      *(long *)(&stack0x00000ff8 + lVar11) = auVar70._8_8_;
      *plVar14 = lVar13;
      plVar14[1] = *(long *)(&stack0x00000ff8 + lVar11);
      *(undefined1 *)(plVar14 + 2) = 1;
    }
    *(long *)(&stack0x00000fd8 + lVar11) = lVar13;
    *plVar14 = lVar13 + 1;
    *(undefined8 *)(&stack0x000003b0 + lVar11) = *(undefined8 *)(&stack0x00000e80 + lVar11);
    *(undefined8 *)(&stack0x000003a0 + lVar11) = *(undefined8 *)(&stack0x00000e70 + lVar11);
    *(undefined8 *)(&stack0x000003a8 + lVar11) = *(undefined8 *)(&stack0x00000e78 + lVar11);
    uVar12 = *(undefined8 *)((long)(&stack0x00000000 + lVar11) + 8);
    *(undefined8 *)(&stack0x000003b8 + lVar11) = *(undefined8 *)(&stack0x00000000 + lVar11);
    *(undefined8 *)(&stack0x000003c0 + lVar11) = uVar12;
    *(undefined8 *)(&stack0x000003c8 + lVar11) = *(undefined8 *)(&stack0x00000010 + lVar11);
    *(undefined8 *)(&stack0x000003d0 + lVar11) = *(undefined8 *)(&stack0x000001d0 + lVar11);
    *(undefined8 *)(&stack0x000003d8 + lVar11) = *(undefined8 *)(&stack0x000001d8 + lVar11);
    *(undefined8 *)(&stack0x000003e0 + lVar11) = *(undefined8 *)(&stack0x000001e0 + lVar11);
    *(undefined8 *)(&stack0x000003e8 + lVar11) = *(undefined8 *)(&stack0x00000ad0 + lVar11);
    *(undefined8 *)(&stack0x000003f0 + lVar11) = *(undefined8 *)(&stack0x00000ad8 + lVar11);
    *(undefined8 *)(&stack0x000003f8 + lVar11) = *(undefined8 *)(&stack0x00000ae0 + lVar11);
    *(undefined8 *)(&stack0x00000b20 + lVar11) = *(undefined8 *)(&stack0x000003f0 + lVar11);
    *(undefined8 *)(&stack0x00000b28 + lVar11) = *(undefined8 *)(&stack0x000003f8 + lVar11);
    *(undefined8 *)(&stack0x00000b10 + lVar11) = *(undefined8 *)(&stack0x000003e0 + lVar11);
    *(undefined8 *)(&stack0x00000b18 + lVar11) = *(undefined8 *)(&stack0x000003e8 + lVar11);
    *(undefined8 *)(&stack0x00000af0 + lVar11) = *(undefined8 *)(&stack0x000003c0 + lVar11);
    *(undefined8 *)(&stack0x00000af8 + lVar11) = *(undefined8 *)(&stack0x000003c8 + lVar11);
    *(undefined8 *)(&stack0x00000b00 + lVar11) = *(undefined8 *)(&stack0x000003d0 + lVar11);
    *(undefined8 *)(&stack0x00000b08 + lVar11) = *(undefined8 *)(&stack0x000003d8 + lVar11);
    *(undefined8 *)(&stack0x00000ae0 + lVar11) = *(undefined8 *)(&stack0x000003b0 + lVar11);
    *(undefined8 *)(&stack0x00000ae8 + lVar11) = *(undefined8 *)(&stack0x000003b8 + lVar11);
    *(undefined8 *)(&stack0x00000ad0 + lVar11) = *(undefined8 *)(&stack0x000003a0 + lVar11);
    *(undefined8 *)(&stack0x00000ad8 + lVar11) = *(undefined8 *)(&stack0x000003a8 + lVar11);
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288642;
    func_0x0001402682d0();
    *(undefined8 *)(&stack0x00000d80 + lVar11) = *(undefined8 *)(&stack0x00000b20 + lVar11);
    *(undefined8 *)(&stack0x00000d88 + lVar11) = *(undefined8 *)(&stack0x00000b28 + lVar11);
    *(undefined8 *)(&stack0x00000d70 + lVar11) = *(undefined8 *)(&stack0x00000b10 + lVar11);
    *(undefined8 *)(&stack0x00000d78 + lVar11) = *(undefined8 *)(&stack0x00000b18 + lVar11);
    *(undefined4 *)(&stack0x00000d60 + lVar11) = *(undefined4 *)(&stack0x00000b00 + lVar11);
    *(undefined4 *)(&stack0x00000d64 + lVar11) = *(undefined4 *)(&stack0x00000b04 + lVar11);
    *(undefined4 *)(&stack0x00000d68 + lVar11) = *(undefined4 *)(&stack0x00000b08 + lVar11);
    *(undefined4 *)(&stack0x00000d6c + lVar11) = *(undefined4 *)(&stack0x00000b0c + lVar11);
    *(undefined8 *)(&stack0x00000d50 + lVar11) = *(undefined8 *)(&stack0x00000af0 + lVar11);
    *(undefined8 *)(&stack0x00000d58 + lVar11) = *(undefined8 *)(&stack0x00000af8 + lVar11);
    *(undefined8 *)(&stack0x00000d40 + lVar11) = *(undefined8 *)(&stack0x00000ae0 + lVar11);
    *(undefined8 *)(&stack0x00000d48 + lVar11) = *(undefined8 *)(&stack0x00000ae8 + lVar11);
    *(undefined8 *)(&stack0x00000d30 + lVar11) = *(undefined8 *)(&stack0x00000ad0 + lVar11);
    *(undefined8 *)(&stack0x00000d38 + lVar11) = *(undefined8 *)(&stack0x00000ad8 + lVar11);
    *(undefined8 *)(&stack0x00000d90 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000d98 + lVar11) = 8;
    *(undefined8 *)(&stack0x00000da0 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000da8 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000db0 + lVar11) = 8;
    *(undefined8 *)(&stack0x00000db8 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000dc0 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000dc8 + lVar11) = 8;
    *(undefined8 *)(&stack0x00000dd0 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000de8 + lVar11) = _DAT_145952220;
    *(undefined8 *)(&stack0x00000df0 + lVar11) = uRam0000000145952228;
    *(undefined8 *)(&stack0x00000dd8 + lVar11) = _DAT_145952210;
    *(undefined8 *)(&stack0x00000de0 + lVar11) = uRam0000000145952218;
    *(undefined8 *)(&stack0x00000df8 + lVar11) = *(undefined8 *)(&stack0x00000fd8 + lVar11);
    *(undefined8 *)(&stack0x00000e00 + lVar11) = *(undefined8 *)(&stack0x00000ff8 + lVar11);
    lVar13 = *(long *)(&stack0x00000d30 + lVar11);
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028873d;
    func_0x0001457731ed();
    if (lVar13 == -1) {
      (&stack0x00001004)[lVar11] = 0;
      (&stack0x00001003)[lVar11] = 1;
      *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a63d;
      func_0x000145903a90();
      goto LAB_14028a6c4;
    }
  }
  else {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x1402883cd;
    func_0x0001457731ed();
  }
  *(long *)(&stack0x00000e20 + lVar11) = lVar24 + 0x1d8;
  *(long *)(&stack0x00000e70 + lVar11) = lVar13;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028876e;
  func_0x0001457731ed();
  *(undefined8 *)(&stack0x00000f90 + lVar11) = *(undefined8 *)(&stack0x00000e30 + lVar11);
  lVar13 = *(long *)(&stack0x00000e38 + lVar11);
  *(long *)(&stack0x00000f70 + lVar11) = lVar13 + *(long *)(&stack0x00000e40 + lVar11) * 0x38;
  *(long *)(&stack0x00000f78 + lVar11) = lVar24 + 0x40;
  *(long *)(&stack0x00000e60 + lVar11) = lVar24 + 0x5a8;
  *(long *)(&stack0x00000f80 + lVar11) = lVar13;
  *(long *)(&stack0x00000fd8 + lVar11) = lVar13;
  *(long *)(&stack0x00000fd0 + lVar11) = lVar24;
  plVar14 = *(long **)(&stack0x00000fd8 + lVar11);
  if (plVar14 == *(long **)(&stack0x00000f70 + lVar11)) {
    lVar13 = *(long *)(&stack0x00000f70 + lVar11);
    lVar19 = lVar13;
  }
  else {
    *(long **)(&stack0x00000fd8 + lVar11) = plVar14 + 7;
    lVar19 = *plVar14;
    if (lVar19 != -1) {
      *(long *)(&stack0x00000e50 + lVar11) = *(long *)(&stack0x00000e40 + lVar11) * 0x38 + -0x38;
      *(long *)(&stack0x00000fb8 + lVar11) = lVar13 + 0x38;
      uVar17 = *(uint *)(plVar14 + 1);
      *(ulong *)(&stack0x00000ff8 + lVar11) = (ulong)uVar17;
      uVar3 = *(undefined1 *)((long)plVar14 + 0xc);
      uVar4 = *(undefined1 *)((long)plVar14 + 0xd);
      bVar5 = *(byte *)((long)plVar14 + 0xf);
      uVar16 = plVar14[2];
      *(long *)(&stack0x00000fc0 + lVar11) = plVar14[3];
      *(long *)(&stack0x00000f98 + lVar11) = plVar14[4];
      *(long *)(&stack0x00000f88 + lVar11) = plVar14[5];
      *(long *)(&stack0x00000e58 + lVar11) = plVar14[6];
      if (-1 < lVar19) {
        lVar19 = 2;
      }
      iVar6 = *(int *)(lVar19 * 4 + 0x14595b778);
      (&stack0x00000fc8)[lVar11] = uVar3;
      *(ulong *)(&stack0x00000fe8 + lVar11) = (ulong)bVar5;
                    /* WARNING: Could not recover jumptable at 0x000140288933. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)iVar6 + 0x14595b778))
                (uVar16 >> 0x30,bVar5,uVar16 >> 0x28,uVar4,uVar17 >> 0x10,uVar16 >> 0x20);
      return;
    }
    lVar13 = *(long *)(&stack0x00000f70 + lVar11);
    lVar19 = *(long *)(&stack0x00000fd8 + lVar11);
  }
  *(ulong *)(&stack0x00000fb8 + lVar11) = ((ulong)(lVar13 - lVar19) >> 3) * 0x6db6db6db6db6db7;
  *(undefined8 *)(&stack0x00000ff8 + lVar11) = 0;
  *(long *)(&stack0x00000fd8 + lVar11) = lVar19;
  while (*(long *)(&stack0x00000fb8 + lVar11) != *(long *)(&stack0x00000ff8 + lVar11)) {
    *(long *)(&stack0x00000ff8 + lVar11) = *(long *)(&stack0x00000ff8 + lVar11) + 1;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289e13;
    func_0x000140179d00();
  }
  if (*(long *)(&stack0x00000f90 + lVar11) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289e3b;
    func_0x0001400021d0();
  }
  (&stack0x00001007)[lVar11] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289e4e;
  func_0x000140649500();
  *(undefined8 *)(&stack0x00000fd8 + lVar11) = *(undefined8 *)(&stack0x00000ee0 + lVar11);
  *(undefined8 *)(&stack0x00000ff8 + lVar11) = 0;
  *(undefined8 *)(&stack0x00000fb8 + lVar11) = *(undefined8 *)(&stack0x00000ed8 + lVar11);
  while (*(long *)(&stack0x00000fd8 + lVar11) != *(long *)(&stack0x00000ff8 + lVar11)) {
    *(long *)(&stack0x00000ff8 + lVar11) = *(long *)(&stack0x00000ff8 + lVar11) + 1;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289ea3;
    func_0x000140198a70();
  }
  if (*(long *)(&stack0x00000ed0 + lVar11) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289ecb;
    func_0x0001400021d0();
  }
  *(undefined8 *)(&stack0x00000ee0 + lVar11) = *(undefined8 *)(&stack0x000003b0 + lVar11);
  *(undefined8 *)(&stack0x00000ed0 + lVar11) = *(undefined8 *)(&stack0x000003a0 + lVar11);
  *(undefined8 *)(&stack0x00000ed8 + lVar11) = *(undefined8 *)(&stack0x000003a8 + lVar11);
  (&stack0x00001007)[lVar11] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289efc;
  func_0x00014543a9c0();
  if (*(long *)(&stack0x000001d0 + lVar11) == -1) {
LAB_140289fc2:
    *(undefined8 *)(&stack0x000001d0 + lVar11) = 0;
    *(undefined8 *)(&stack0x000001d8 + lVar11) = 8;
    *(undefined8 *)(&stack0x000001e0 + lVar11) = 0;
  }
  else {
    *(long *)(&stack0x00000ff8 + lVar11) = *(long *)(&stack0x000001d0 + lVar11);
    *(undefined8 *)(&stack0x00000fd8 + lVar11) = *(undefined8 *)(&stack0x000001d8 + lVar11);
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289f36;
    func_0x000145712640();
    lVar13 = *(long *)(&stack0x000003a0 + lVar11);
    uVar16 = *(ulong *)(&stack0x000003a8 + lVar11);
    if (lVar13 != 2) {
      *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289f64;
      func_0x0001457731ed(lVar13,uVar16,&stack0x000003b0 + lVar11,&stack0x00000ad0 + lVar11);
    }
    if (*(long *)(&stack0x00000ff8 + lVar11) != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289f82;
      func_0x0001400021d0();
    }
    if ((int)lVar13 == 2) {
      if ((1 < ((uint)uVar16 & 3) - 2) && ((uVar16 & 3) != 0)) {
        *(ulong *)(&stack0x000003a8 + lVar11) = uVar16 - 1;
        (&stack0x000003a0)[lVar11] = 3;
        (&stack0x00001007)[lVar11] = 1;
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140289fc1;
        func_0x00014573b330();
      }
      goto LAB_140289fc2;
    }
    *(ulong *)(&stack0x00000868 + lVar11) = uVar16;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a0b0;
    func_0x0001457731ed();
    *(undefined8 *)(&stack0x000003a0 + lVar11) = 0;
    *(undefined8 *)(&stack0x00000600 + lVar11) = 0;
    *(long *)(&stack0x00000860 + lVar11) = lVar13;
    (&stack0x00001007)[lVar11] = 1;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a0e7;
    func_0x0001401abbc0();
    lVar13 = *(long *)(&stack0x00000ad8 + lVar11);
    uVar16 = *(ulong *)(&stack0x00000ae0 + lVar11);
    *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00001006 + lVar11;
    if (1 < uVar16) {
      if (uVar16 < 0x15) {
        lVar19 = uVar16 * 0x48;
        lVar23 = 0x48;
        lVar24 = *(long *)(&stack0x00000fd0 + lVar11);
        do {
          *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a694;
          func_0x000140230ff0();
          lVar23 = lVar23 + 0x48;
        } while (lVar19 != lVar23);
      }
      else {
        (&stack0x00000fe7)[lVar11] = 1;
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a6f0;
        func_0x00014017b800();
        lVar24 = *(long *)(&stack0x00000fd0 + lVar11);
      }
    }
    *(long *)(&stack0x000003a0 + lVar11) = lVar13;
    *(long *)(&stack0x000003a8 + lVar11) = lVar13;
    *(undefined8 *)(&stack0x000003b0 + lVar11) = *(undefined8 *)(&stack0x00000ad0 + lVar11);
    *(ulong *)(&stack0x000003b8 + lVar11) = lVar13 + uVar16 * 0x48;
    (&stack0x00000fe7)[lVar11] = 0;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a153;
    func_0x00014017a6c0();
  }
  lVar13 = *(long *)(&stack0x00000ef8 + lVar11);
  if (lVar13 != 0) {
    lVar19 = *(long *)(&stack0x00000ef0 + lVar11) + 0x20;
    do {
      if (*(long *)(lVar19 + -0x20) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a1a1;
        func_0x0001400021d0();
      }
      if (*(long *)(lVar19 + -8) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a1b8;
        func_0x0001400021d0();
      }
      lVar19 = lVar19 + 0x38;
      lVar13 = lVar13 + -1;
    } while (lVar13 != 0);
  }
  puVar18 = (undefined8 *)(&stack0x00000ee8 + lVar11);
  if (*(long *)(&stack0x00000ee8 + lVar11) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a1e3;
    func_0x0001400021d0();
  }
  puVar18[2] = *(undefined8 *)(&stack0x000001e0 + lVar11);
  uVar12 = *(undefined8 *)(&stack0x000001d8 + lVar11);
  *puVar18 = *(undefined8 *)(&stack0x000001d0 + lVar11);
  puVar18[1] = uVar12;
  lVar13 = *(long *)(&stack0x00000f10 + lVar11);
  if (lVar13 != 0) {
    lVar19 = *(long *)(&stack0x00000f08 + lVar11) + 0x20;
    do {
      if (*(long *)(lVar19 + -0x20) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a241;
        func_0x0001400021d0();
      }
      if (*(long *)(lVar19 + -8) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a258;
        func_0x0001400021d0();
      }
      lVar19 = lVar19 + 0x30;
      lVar13 = lVar13 + -1;
    } while (lVar13 != 0);
  }
  if (*(long *)(&stack0x00000f00 + lVar11) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a280;
    func_0x0001400021d0();
  }
  *(undefined8 *)(&stack0x00000f00 + lVar11) = 0;
  *(undefined8 *)(&stack0x00000f08 + lVar11) = 8;
  *(undefined8 *)(&stack0x00000f10 + lVar11) = 0;
  *(undefined8 *)(&stack0x000003a0 + lVar11) = 0x145954c18;
  *(undefined8 *)(&stack0x000003a8 + lVar11) = 0x145958518;
  *(long *)(&stack0x000003b0 + lVar11) = lVar24;
  (&stack0x00001007)[lVar11] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a2d7;
  func_0x0001401af6f0();
  lVar13 = *(long *)(&stack0x00000e80 + lVar11);
  if (lVar13 != 0) {
    lVar19 = *(long *)(&stack0x00000e78 + lVar11) + 8;
    do {
      if (*(long *)(lVar19 + -8) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a320;
        func_0x0001400021d0();
      }
      lVar19 = lVar19 + 0x18;
      lVar13 = lVar13 + -1;
    } while (lVar13 != 0);
  }
  if (*(long *)(&stack0x00000e70 + lVar11) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a348;
    func_0x0001400021d0();
  }
  *(undefined8 *)(&stack0x00000e80 + lVar11) = *(undefined8 *)(&stack0x00000ae0 + lVar11);
  *(undefined8 *)(&stack0x00000e70 + lVar11) = *(undefined8 *)(&stack0x00000ad0 + lVar11);
  *(undefined8 *)(&stack0x00000e78 + lVar11) = *(undefined8 *)(&stack0x00000ad8 + lVar11);
  *(long *)(&stack0x00000ad0 + lVar11) = *(long *)(&stack0x00000ec0 + lVar11);
  *(long *)(&stack0x00000ad8 + lVar11) =
       *(long *)(&stack0x00000ec8 + lVar11) * 0x30 + *(long *)(&stack0x00000ec0 + lVar11);
  *(long *)(&stack0x00000ae0 + lVar11) = lVar24;
  (&stack0x00001007)[lVar11] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a3ae;
  func_0x00014017fcf0();
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a3bb;
  func_0x00014002a540();
  *(undefined8 *)(&stack0x00000f38 + lVar11) = *(undefined8 *)(&stack0x000003c0 + lVar11);
  *(undefined8 *)(&stack0x00000f40 + lVar11) = *(undefined8 *)(&stack0x000003c8 + lVar11);
  *(undefined8 *)(&stack0x00000f28 + lVar11) = *(undefined8 *)(&stack0x000003b0 + lVar11);
  *(undefined8 *)(&stack0x00000f30 + lVar11) = *(undefined8 *)(&stack0x000003b8 + lVar11);
  *(undefined8 *)(&stack0x00000f18 + lVar11) = *(undefined8 *)(&stack0x000003a0 + lVar11);
  *(undefined8 *)(&stack0x00000f20 + lVar11) = *(undefined8 *)(&stack0x000003a8 + lVar11);
  if (*(long *)(lVar24 + 0x90) != 0) {
    lVar13 = *(long *)(lVar24 + 0x78);
    uVar16 = 0x5824c802f396e770;
    lVar19 = 0;
    while( true ) {
      uVar16 = uVar16 & *(ulong *)(lVar24 + 0x80);
      auVar70 = *(undefined1 (*) [16])(lVar13 + uVar16);
      auVar34[0] = -(auVar70[0] == auVar37[0]);
      auVar34[1] = -(auVar70[1] == auVar37[1]);
      auVar34[2] = -(auVar70[2] == auVar37[2]);
      auVar34[3] = -(auVar70[3] == auVar37[3]);
      auVar34[4] = -(auVar70[4] == auVar37[4]);
      auVar34[5] = -(auVar70[5] == auVar37[5]);
      auVar34[6] = -(auVar70[6] == auVar37[6]);
      auVar34[7] = -(auVar70[7] == auVar37[7]);
      auVar34[8] = -(auVar70[8] == auVar37[8]);
      auVar34[9] = -(auVar70[9] == auVar37[9]);
      auVar34[10] = -(auVar70[10] == auVar37[10]);
      auVar34[0xb] = -(auVar70[0xb] == auVar37[0xb]);
      auVar34[0xc] = -(auVar70[0xc] == auVar37[0xc]);
      auVar34[0xd] = -(auVar70[0xd] == auVar37[0xd]);
      auVar34[0xe] = -(auVar70[0xe] == auVar37[0xe]);
      auVar34[0xf] = -(auVar70[0xf] == auVar37[0xf]);
      uVar21 = (ushort)(SUB161(auVar34 >> 7,0) & 1) | (ushort)(SUB161(auVar34 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar34 >> 0x17,0) & 1) << 2 |
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
               (ushort)(SUB161(auVar34 >> 0x77,0) & 1) << 0xe | (ushort)(auVar34[0xf] >> 7) << 0xf;
      uVar17 = (uint)uVar21;
      while (uVar21 != 0) {
        uVar20 = 0;
        for (uVar9 = uVar17; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
          uVar20 = uVar20 + 1;
        }
        uVar15 = uVar20 + uVar16 & *(ulong *)(lVar24 + 0x80);
        pcVar1 = (char *)(lVar13 + -0x18 + uVar15 * -0x18);
        auVar35[0] = -(*pcVar1 == auVar54[0]);
        auVar35[1] = -(pcVar1[1] == auVar54[1]);
        auVar35[2] = -(pcVar1[2] == auVar54[2]);
        auVar35[3] = -(pcVar1[3] == auVar54[3]);
        auVar35[4] = -(pcVar1[4] == auVar54[4]);
        auVar35[5] = -(pcVar1[5] == auVar54[5]);
        auVar35[6] = -(pcVar1[6] == auVar54[6]);
        auVar35[7] = -(pcVar1[7] == auVar54[7]);
        auVar35[8] = -(pcVar1[8] == auVar54[8]);
        auVar35[9] = -(pcVar1[9] == auVar54[9]);
        auVar35[10] = -(pcVar1[10] == auVar54[10]);
        auVar35[0xb] = -(pcVar1[0xb] == auVar54[0xb]);
        auVar35[0xc] = -(pcVar1[0xc] == auVar54[0xc]);
        auVar35[0xd] = -(pcVar1[0xd] == auVar54[0xd]);
        auVar35[0xe] = -(pcVar1[0xe] == auVar54[0xe]);
        auVar35[0xf] = -(pcVar1[0xf] == auVar54[0xf]);
        if ((ushort)((ushort)(SUB161(auVar35 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar35 >> 0xf,0) & 1) << 1 |
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
                     (ushort)(SUB161(auVar35 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar35[0xf] >> 7) << 0xf) == 0xffff) {
          uVar16 = *(ulong *)(lVar13 + uVar15 * -0x18 + -8);
          if ((uVar16 < *(ulong *)(lVar24 + 0x218)) &&
             (uVar16 = *(ulong *)(*(long *)(lVar24 + 0x210) + uVar16 * 8), uVar16 != 0)) {
            lVar13 = ~uVar16 * 0x38;
            if (*(char *)(*(long *)(lVar24 + 0x1e0) + 0x30 + lVar13) != '\0') {
              lVar13 = *(long *)(lVar24 + 0x1e0) + lVar13;
              lVar19 = *(long *)(lVar13 + 0x10);
              uVar7 = *(undefined4 *)(lVar24 + 0x5b0);
              *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a4f4;
              func_0x0001457731ed(lVar19,lVar13,&stack0x00000e70 + lVar11,&stack0x000003a0 + lVar11,
                                  0xd8);
              *(undefined4 *)(lVar13 + 0x2c) = uVar7;
              *(long *)(&stack0x00000ff8 + lVar11) = lVar19 + 0x98;
              *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a50a;
              func_0x0001402682d0();
              *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a524;
              func_0x0001457731ed();
              *(undefined4 *)(lVar13 + 0x2c) = uVar7;
              *(int *)(lVar19 + 0x1a0) = *(int *)(lVar19 + 0x1a0) + 1;
              return;
            }
          }
          goto LAB_14028a58f;
        }
        uVar21 = (ushort)(uVar17 - 1) & (ushort)uVar17;
        uVar17 = CONCAT22((short)(uVar17 - 1 >> 0x10),uVar21);
      }
      auVar28[0] = -(auVar70[0] == -1);
      auVar28[1] = -(auVar70[1] == -1);
      auVar28[2] = -(auVar70[2] == -1);
      auVar28[3] = -(auVar70[3] == -1);
      auVar28[4] = -(auVar70[4] == -1);
      auVar28[5] = -(auVar70[5] == -1);
      auVar28[6] = -(auVar70[6] == -1);
      auVar28[7] = -(auVar70[7] == -1);
      auVar28[8] = -(auVar70[8] == -1);
      auVar28[9] = -(auVar70[9] == -1);
      auVar28[10] = -(auVar70[10] == -1);
      auVar28[0xb] = -(auVar70[0xb] == -1);
      auVar28[0xc] = -(auVar70[0xc] == -1);
      auVar28[0xd] = -(auVar70[0xd] == -1);
      auVar28[0xe] = -(auVar70[0xe] == -1);
      auVar28[0xf] = -(auVar70[0xf] == -1);
      if ((((((((((((((((SUB161(auVar28 >> 7,0) & 1) != 0 || (SUB161(auVar28 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar28 >> 0x17,0) & 1) != 0) || (SUB161(auVar28 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar28 >> 0x27,0) & 1) != 0) || (SUB161(auVar28 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar28 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar28 >> 0x3f,0) & 1) != 0) || (SUB161(auVar28 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar28 >> 0x4f,0) & 1) != 0) || (SUB161(auVar28 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar28 >> 0x5f,0) & 1) != 0) || (SUB161(auVar28 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar28 >> 0x6f,0) & 1) != 0) || (SUB161(auVar28 >> 0x77,0) & 1) != 0) ||
          auVar28[0xf] < '\0') break;
      uVar16 = uVar16 + lVar19 + 0x10;
      lVar19 = lVar19 + 0x10;
    }
  }
LAB_14028a58f:
  *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00001006 + lVar11;
  *(undefined8 *)(&stack0x000003a8 + lVar11) = 0x14500b840;
  (&stack0x00001007)[lVar11] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar11) = 0x14028a5cc;
  func_0x000145903d10();
  goto LAB_14028a6c4;
LAB_1402882fb:
  auVar27[0] = -(auVar70[0] == -1);
  auVar27[1] = -(auVar70[1] == -1);
  auVar27[2] = -(auVar70[2] == -1);
  auVar27[3] = -(auVar70[3] == -1);
  auVar27[4] = -(auVar70[4] == -1);
  auVar27[5] = -(auVar70[5] == -1);
  auVar27[6] = -(auVar70[6] == -1);
  auVar27[7] = -(auVar70[7] == -1);
  auVar27[8] = -(auVar70[8] == -1);
  auVar27[9] = -(auVar70[9] == -1);
  auVar27[10] = -(auVar70[10] == -1);
  auVar27[0xb] = -(auVar70[0xb] == -1);
  auVar27[0xc] = -(auVar70[0xc] == -1);
  auVar27[0xd] = -(auVar70[0xd] == -1);
  auVar27[0xe] = -(auVar70[0xe] == -1);
  auVar27[0xf] = -(auVar70[0xf] == -1);
  if ((((((((((((((((SUB161(auVar27 >> 7,0) & 1) != 0 || (SUB161(auVar27 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar27 >> 0x17,0) & 1) != 0) || (SUB161(auVar27 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar27 >> 0x27,0) & 1) != 0) || (SUB161(auVar27 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar27 >> 0x37,0) & 1) != 0) || (SUB161(auVar27 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar27 >> 0x47,0) & 1) != 0) || (SUB161(auVar27 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar27 >> 0x57,0) & 1) != 0) || (SUB161(auVar27 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar27 >> 0x67,0) & 1) != 0) || (SUB161(auVar27 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar27 >> 0x77,0) & 1) != 0) || auVar27[0xf] < '\0') {
LAB_14028840a:
    *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00001006 + lVar11;
    *(undefined8 *)(&stack0x000003a8 + lVar11) = 0x14500b840;
    (&stack0x00000ff4)[lVar11] = 1;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288447;
    func_0x000145903d10(uVar22 * -3,uVar17,&stack0x000003a0 + lVar11,0x1459513c0,0x1459585f8);
LAB_14028a6c4:
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  uVar16 = uVar16 + lVar19 + 0x10;
  lVar19 = lVar19 + 0x10;
  goto LAB_1402882a9;
LAB_1402881b5:
  auVar26[0] = -(*pcVar1 == -1);
  auVar26[1] = -(pcVar1[1] == -1);
  auVar26[2] = -(pcVar1[2] == -1);
  auVar26[3] = -(pcVar1[3] == -1);
  auVar26[4] = -(pcVar1[4] == -1);
  auVar26[5] = -(pcVar1[5] == -1);
  auVar26[6] = -(pcVar1[6] == -1);
  auVar26[7] = -(pcVar1[7] == -1);
  auVar26[8] = -(pcVar1[8] == -1);
  auVar26[9] = -(pcVar1[9] == -1);
  auVar26[10] = -(pcVar1[10] == -1);
  auVar26[0xb] = -(pcVar1[0xb] == -1);
  auVar26[0xc] = -(pcVar1[0xc] == -1);
  auVar26[0xd] = -(pcVar1[0xd] == -1);
  auVar26[0xe] = -(pcVar1[0xe] == -1);
  auVar26[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar26 >> 7,0) & 1) != 0 || (SUB161(auVar26 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar26 >> 0x17,0) & 1) != 0) || (SUB161(auVar26 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar26 >> 0x27,0) & 1) != 0) || (SUB161(auVar26 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar26 >> 0x37,0) & 1) != 0) || (SUB161(auVar26 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar26 >> 0x47,0) & 1) != 0) || (SUB161(auVar26 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar26 >> 0x57,0) & 1) != 0) || (SUB161(auVar26 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar26 >> 0x67,0) & 1) != 0) || (SUB161(auVar26 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar26 >> 0x77,0) & 1) != 0) || auVar26[0xf] < '\0') {
LAB_1402883d2:
    *(undefined1 **)(&stack0x000003a0 + lVar11) = &stack0x00001006 + lVar11;
    *(undefined8 *)(&stack0x000003a8 + lVar11) = 0x14500b840;
    *(undefined8 *)((long)&uStack_48 + lVar11) = 0x140288408;
    func_0x000145903d10();
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  uVar15 = uVar15 + lVar23 + 0x10;
  lVar23 = lVar23 + 0x10;
  goto LAB_14028816b;
}
