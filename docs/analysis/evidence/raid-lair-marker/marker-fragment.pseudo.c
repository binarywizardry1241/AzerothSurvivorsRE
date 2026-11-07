/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(long param_1)

{
  long lVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  char cVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined8 uVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  long unaff_RBP;
  long lVar13;
  long lVar14;
  long *plVar15;
  char *pcVar16;
  undefined8 uVar17;
  ulong uVar18;
  ulong in_R9;
  long *plVar19;
  long lVar20;
  long unaff_R13;
  float fVar21;
  undefined8 uVar22;
  float fVar24;
  undefined1 auVar23 [16];
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar29;
  undefined1 auVar28 [16];

  fVar25 = (float)*(undefined8 *)(param_1 + 0x4d0);
  fVar26 = (float)((ulong)*(undefined8 *)(param_1 + 0x4d0) >> 0x20);
  lVar13 = *(long *)(param_1 + 0x670);
  lVar14 = in_R9 * 0x28;
  uVar18 = 0;
  lVar10 = 0;
  do {
    if (lVar14 == lVar10) {
      if (in_R9 == 0) {
        halt_baddata();
      }
      if (in_R9 == 1) {
        uVar11 = 0;
      }
      else {
        uVar9 = 1;
        uVar18 = 0;
        lVar20 = lVar13;
        lVar10 = lVar13;
        do {
          uVar11 = uVar9;
          lVar12 = lVar10 + 0x28;
          if ((int)((uint)((int)*(uint *)(lVar20 + 0x24) >> 0x1f) >> 1 ^ *(uint *)(lVar20 + 0x24))
              <= (int)((uint)((int)*(uint *)(lVar10 + 0x4c) >> 0x1f) >> 1 ^ *(uint *)(lVar10 + 0x4c)
                      )) {
            uVar11 = uVar18;
            lVar12 = lVar20;
          }
          lVar1 = (lVar14 - 0x28U >> 3) * 0x3333333333333333 + uVar9;
          uVar9 = uVar9 + 1;
          uVar18 = uVar11;
          lVar20 = lVar12;
          lVar10 = lVar10 + 0x28;
        } while (lVar1 != 0);
      }
      goto LAB_1459074be;
    }
    lVar20 = lVar10 + 0x28;
    uVar18 = uVar18 - 1;
    plVar15 = (long *)(lVar13 + lVar10);
    lVar10 = lVar20;
  } while (*plVar15 == 0);
  uVar11 = ~uVar18;
  if (lVar14 - lVar20 != 0) {
    plVar15 = (long *)(lVar13 + lVar20);
    plVar19 = (long *)(lVar13 + lVar20 + -0x28);
    uVar9 = 0;
    do {
      if ((*plVar15 != 0) &&
         (fVar21 = (float)plVar19[3] - fVar25, fVar24 = (float)((ulong)plVar19[3] >> 0x20) - fVar26,
         fVar27 = (float)plVar15[3] - fVar25, fVar29 = (float)((ulong)plVar15[3] >> 0x20) - fVar26,
         auVar23._0_4_ = fVar21 * fVar21 + fVar24 * fVar24,
         auVar23._8_4_ = fVar27 * fVar27 + fVar29 * fVar29, auVar23._4_4_ = auVar23._8_4_,
         auVar23._12_4_ = 0, auVar23 = sqrtps(auVar23,auVar23),
         auVar28._0_4_ = (uint)(auVar23._0_4_ >> 0x1f) >> 1,
         auVar28._4_4_ = (uint)(auVar23._4_4_ >> 0x1f) >> 1,
         auVar28._8_4_ = (uint)(auVar23._8_4_ >> 0x1f) >> 1,
         auVar28._12_4_ = (uint)(auVar23._12_4_ >> 0x1f) >> 1,
         SUB164(auVar28 ^ auVar23,4) < SUB164(auVar28 ^ auVar23,0))) {
        uVar11 = uVar9 - uVar18;
        plVar19 = plVar15;
      }
      uVar9 = uVar9 + 1;
      plVar15 = plVar15 + 5;
    } while ((ulong)(lVar14 - lVar20) / 0x28 != uVar9);
  }
LAB_1459074be:
  pcVar16 = *(char **)(unaff_RBP + 0x438);
  if (pcVar16[0xacc] == '\0') {
    pcVar16[0] = '\x01';
    pcVar16[1] = '\0';
    pcVar16[2] = '\0';
    pcVar16[3] = '\0';
    pcVar16[4] = '\0';
    pcVar16[5] = '\0';
    pcVar16[6] = '\0';
    pcVar16[7] = '\0';
    *(ulong *)(pcVar16 + 8) = uVar11;
    cVar4 = pcVar16[0xacd];
    pcVar16[0xacd] = '\0';
    if (cVar4 != '\0') {
      func_0x0001458c28a0();
      lVar13 = *(long *)(pcVar16 + 0x630);
      if (lVar13 == *(long *)(pcVar16 + 0x620)) {
        func_0x000145c0dbd0();
      }
      lVar14 = *(long *)(pcVar16 + 0x628);
      uVar22 = *(undefined8 *)(unaff_RBP + 0xa0);
      uVar17 = *(undefined8 *)(unaff_RBP + 0xa8);
      uVar8 = *(undefined8 *)(unaff_RBP + 0xb8);
      puVar2 = (undefined8 *)(lVar14 + 0x10 + lVar13 * 0x20);
      *puVar2 = *(undefined8 *)(unaff_RBP + 0xb0);
      puVar2[1] = uVar8;
      puVar2 = (undefined8 *)(lVar14 + lVar13 * 0x20);
      *puVar2 = uVar22;
      puVar2[1] = uVar17;
      *(long *)(pcVar16 + 0x630) = lVar13 + 1;
    }
  }
  else {
    if (*pcVar16 == '\0') {
      fVar25 = **(float **)(unaff_RBP + 0x2f0);
    }
    else {
      fVar25 = *(float *)(pcVar16 + 0xa4c);
      if (((*(ulong *)(pcVar16 + 8) == uVar11) && (pcVar16[0xacd] != '\0')) &&
         (fVar25 - *(float *)(pcVar16 + 0xa70) <= _DAT_146c060d0)) {
        halt_baddata();
      }
    }
    pcVar16[0] = '\x01';
    pcVar16[1] = '\0';
    pcVar16[2] = '\0';
    pcVar16[3] = '\0';
    pcVar16[4] = '\0';
    pcVar16[5] = '\0';
    pcVar16[6] = '\0';
    pcVar16[7] = '\0';
    *(ulong *)(pcVar16 + 8) = uVar11;
    *(float *)(pcVar16 + 0xa70) = fVar25;
    pcVar16[0xacd] = '\x01';
    if (in_R9 <= uVar11) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    lVar14 = uVar11 * 5;
    lVar10 = func_0x000145898dc0(pcVar16,lVar14,*(undefined8 *)(pcVar16 + 0x2b0),
                                 *(undefined8 *)(pcVar16 + 0x2a8));
    uVar18 = *(ulong *)(lVar13 + 0x10 + lVar14 * 8);
    if (*(ulong *)(lVar10 * 0xf0 + 0x80 + unaff_R13) <= uVar18) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    lVar10 = *(long *)(unaff_R13 + lVar10 * 0xf0 + 0x78);
    lVar12 = uVar18 * 0x50;
    *(long *)(unaff_RBP + 0x300) = lVar10 + lVar12 + 0x20;
    *(undefined8 *)(unaff_RBP + 0x308) = 0x145beebe0;
    func_0x000145bdd130();
    lVar20 = *(long *)(lVar10 + 0x10 + lVar12);
    uVar22 = *(undefined8 *)(lVar10 + 0x18 + lVar12);
    *(undefined8 *)(unaff_RBP + 0x410) = *(undefined8 *)(unaff_RBP + 0xa8);
    auVar23 = func_0x00014598ddd0();
    uVar17 = auVar23._8_8_;
    lVar10 = auVar23._0_8_;
    plVar15 = (long *)(lVar13 + lVar14 * 8);
    lVar13 = *(long *)(unaff_RBP + 0x438);
    if (*(long *)(unaff_RBP + 0xa0) != 0) {
      func_0x0001400021d0();
    }
    if (lVar10 == 0) {
      uVar17 = uVar22;
      lVar10 = lVar20;
    }
    *(long *)(unaff_RBP + 0x280) = lVar10;
    *(undefined8 *)(unaff_RBP + 0x288) = uVar17;
    if (*plVar15 == 0) {
      *(long *)(unaff_RBP + 0xa0) = unaff_RBP + 0x280;
      *(undefined8 *)(unaff_RBP + 0xa8) = 0x1400020c0;
    }
    else {
      *(long *)(unaff_RBP + 0xa0) = unaff_RBP + 0x280;
      *(undefined8 *)(unaff_RBP + 0xa8) = 0x1400020c0;
    }
    uVar22 = func_0x000145bdd130();
    lVar14 = plVar15[3];
    *(undefined8 *)(unaff_RBP + 0x410) = *(undefined8 *)(unaff_RBP + 0x308);
    func_0x0001458c28a0(uVar22,(int)lVar14);
    lVar14 = *(long *)(lVar13 + 0x630);
    if (lVar14 == *(long *)(lVar13 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar10 = *(long *)(lVar13 + 0x628);
    uVar22 = *(undefined8 *)(unaff_RBP + 0xa0);
    uVar17 = *(undefined8 *)(unaff_RBP + 0xa8);
    uVar5 = *(undefined4 *)(unaff_RBP + 0xb4);
    uVar6 = *(undefined4 *)(unaff_RBP + 0xb8);
    uVar7 = *(undefined4 *)(unaff_RBP + 0xbc);
    puVar3 = (undefined4 *)(lVar10 + 0x10 + lVar14 * 0x20);
    *puVar3 = *(undefined4 *)(unaff_RBP + 0xb0);
    puVar3[1] = uVar5;
    puVar3[2] = uVar6;
    puVar3[3] = uVar7;
    puVar2 = (undefined8 *)(lVar10 + lVar14 * 0x20);
    *puVar2 = uVar22;
    puVar2[1] = uVar17;
    *(long *)(lVar13 + 0x630) = lVar14 + 1;
    if (*(long *)(unaff_RBP + 0x300) != 0) {
      func_0x0001400021d0();
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
