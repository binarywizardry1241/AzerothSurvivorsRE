
/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  float fVar3;
  byte bVar4;
  undefined2 uVar5;
  float *pfVar6;
  long lVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  float *pfVar22;
  long lVar23;
  byte bVar24;
  uint uVar25;
  long lVar26;
  undefined8 *unaff_RBP;
  long lVar27;
  ulong uVar28;
  byte bVar29;
  long unaff_R14;
  float *pfVar30;
  float in_XMM6_Da;
  float in_XMM7_Da;
  float in_XMM9_Da;
  float fVar31;
  float in_XMM10_Da;
  float fVar32;
  float in_XMM13_Da;

  fVar31 = *(float *)(unaff_R14 + 0xa0);
  pfVar6 = *(float **)(unaff_R14 + 0x60);
  lVar7 = *(long *)(unaff_R14 + 0x68);
  fVar32 = *(float *)((ulong)(in_XMM10_Da < in_XMM9_Da) * 4 + 0x147229aa0);
  uVar28 = 0;
  pfVar22 = pfVar6;
LAB_14597a2ad:
  do {
    pfVar30 = pfVar22;
    if (pfVar30 == pfVar6 + lVar7) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    fVar3 = *pfVar30;
    *pfVar30 = fVar3 - in_XMM7_Da;
    if (*(ulong *)(unaff_R14 + 0x88) <= uVar28) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    pfVar22 = pfVar30 + 1;
    lVar27 = *(long *)(unaff_R14 + 0x80);
    lVar26 = uVar28 * 0x38;
    uVar28 = uVar28 + 1;
    puVar1 = (undefined4 *)(lVar27 + lVar26);
    uVar8 = *puVar1;
    uVar9 = puVar1[1];
    uVar10 = puVar1[2];
    uVar11 = puVar1[3];
    puVar1 = (undefined4 *)(lVar27 + 0x10 + lVar26);
    uVar12 = *puVar1;
    uVar13 = puVar1[1];
    uVar14 = puVar1[2];
    uVar15 = puVar1[3];
    puVar1 = (undefined4 *)(lVar27 + 0x1d + lVar26);
    uVar16 = puVar1[1];
    uVar17 = puVar1[2];
    uVar18 = puVar1[3];
    *(undefined4 *)((long)unaff_RBP + 0x1d) = *puVar1;
    *(undefined4 *)((long)unaff_RBP + 0x21) = uVar16;
    *(undefined4 *)((long)unaff_RBP + 0x25) = uVar17;
    *(undefined4 *)((long)unaff_RBP + 0x29) = uVar18;
    *(undefined4 *)(unaff_RBP + 2) = uVar12;
    *(undefined4 *)((long)unaff_RBP + 0x14) = uVar13;
    *(undefined4 *)(unaff_RBP + 3) = uVar14;
    *(undefined4 *)((long)unaff_RBP + 0x1c) = uVar15;
    *(undefined4 *)unaff_RBP = uVar8;
    *(undefined4 *)((long)unaff_RBP + 4) = uVar9;
    *(undefined4 *)(unaff_RBP + 1) = uVar10;
    *(undefined4 *)((long)unaff_RBP + 0xc) = uVar11;
  } while (in_XMM13_Da < fVar3 - in_XMM7_Da);
  bVar4 = *(byte *)(lVar27 + 0x2d + lVar26);
  uVar5 = *(undefined2 *)(lVar27 + 0x2e + lVar26);
  if (in_XMM6_Da < fVar31) goto code_r0x00014597a321;
  goto LAB_14597a364;
code_r0x00014597a321:
  bVar24 = bVar4 - 3;
  if (bVar4 < 3) {
    bVar24 = 0x1d;
  }
  if ((bVar24 < 0x20) && ((0xa0180006U >> (bVar24 & 0x1f) & 1) != 0)) {
LAB_14597a364:
    uVar25 = (uint)(byte)(bVar4 - 3);
    if (bVar4 < 3) {
      uVar25 = 0x1d;
    }
    if (((0x1f < (byte)uVar25) || ((0xa0180006U >> (uVar25 & 0x1f) & 1) == 0)) &&
       (unaff_RBP[0x47] != 0)) {
      lVar23 = 0;
      do {
        if (*(long *)(unaff_RBP[0x46] + lVar23) == unaff_RBP[0x44]) {
          bVar24 = *(byte *)(unaff_RBP[0x46] + 0x35 + lVar23);
          bVar29 = bVar24 - 3;
          if (bVar24 < 3) {
            bVar29 = 0x1d;
          }
          if ((0x1f < bVar29) || ((0xa0180006U >> (bVar29 & 0x1f) & 1) == 0)) goto LAB_14597a2ad;
        }
        lVar23 = lVar23 + 0x38;
      } while (unaff_RBP[0x47] * 0x38 - lVar23 != 0);
    }
    *pfVar30 = *(float *)(lVar27 + 0x30 + lVar26) * fVar32;
    lVar27 = unaff_RBP[0x47];
    if (lVar27 == unaff_RBP[0x45]) {
      *(undefined1 *)((long)unaff_RBP + 0x337) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x336) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x335) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x334) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x333) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x332) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x331) = 1;
      *(undefined1 *)(unaff_RBP + 0x66) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x32f) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x32e) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x32d) = 1;
      *(undefined1 *)((long)unaff_RBP + 0x32c) = 1;
      func_0x000145bfada0();
    }
    lVar26 = unaff_RBP[0x46];
    lVar23 = lVar27 * 0x38;
    *(undefined8 *)(lVar26 + lVar23) = unaff_RBP[0x44];
    uVar19 = unaff_RBP[1];
    uVar20 = unaff_RBP[2];
    uVar21 = unaff_RBP[3];
    puVar2 = (undefined8 *)(lVar26 + 8 + lVar23);
    *puVar2 = *unaff_RBP;
    puVar2[1] = uVar19;
    puVar2 = (undefined8 *)(lVar26 + 0x18 + lVar23);
    *puVar2 = uVar20;
    puVar2[1] = uVar21;
    uVar19 = *(undefined8 *)((long)unaff_RBP + 0x25);
    puVar2 = (undefined8 *)(lVar26 + 0x25 + lVar23);
    *puVar2 = *(undefined8 *)((long)unaff_RBP + 0x1d);
    puVar2[1] = uVar19;
    *(byte *)(lVar26 + 0x35 + lVar23) = bVar4;
    *(undefined2 *)(lVar26 + 0x36 + lVar23) = uVar5;
    unaff_RBP[0x47] = lVar27 + 1;
    unaff_R14 = unaff_RBP[0x62];
  }
  goto LAB_14597a2ad;
}
