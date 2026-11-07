/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  long *plVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  ulong uVar14;
  long unaff_RBX;
  long unaff_RBP;
  ulong uVar15;
  long lVar16;
  long unaff_R13;
  bool in_ZF;

  if (in_ZF) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  uVar4 = *(ulong *)(unaff_R13 + 0xd8);
  if (uVar4 == 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  lVar5 = *(long *)(unaff_R13 + 0xd0);
  lVar6 = *(long *)(unaff_RBP + 0x328);
  uVar14 = 0;
  do {
    lVar16 = 0;
    while (unaff_RBX << 4 != lVar16) {
      plVar1 = (long *)(lVar6 + lVar16);
      lVar16 = lVar16 + 0x10;
      if (*plVar1 == *(long *)(lVar5 + 0x20 + uVar14 * 0x78)) {
        uVar15 = uVar14 + 1;
        if (uVar4 <= uVar15) goto LAB_1459323e6;
        goto LAB_145932455;
      }
    }
    uVar14 = uVar14 + 1;
    if (uVar14 == uVar4) {
      halt_baddata();
    }
  } while( true );
LAB_145932455:
  puVar2 = (undefined8 *)(lVar5 + uVar15 * 0x78);
  lVar16 = 0;
  do {
    if (unaff_RBX << 4 == lVar16) {
      lVar16 = uVar14 * 0x78;
      *(undefined8 *)(lVar5 + 0x70 + lVar16) = puVar2[0xe];
      uVar7 = puVar2[0xd];
      puVar3 = (undefined8 *)(lVar5 + 0x60 + lVar16);
      *puVar3 = puVar2[0xc];
      puVar3[1] = uVar7;
      uVar7 = puVar2[0xb];
      puVar3 = (undefined8 *)(lVar5 + 0x50 + lVar16);
      *puVar3 = puVar2[10];
      puVar3[1] = uVar7;
      uVar7 = puVar2[9];
      puVar3 = (undefined8 *)(lVar5 + 0x40 + lVar16);
      *puVar3 = puVar2[8];
      puVar3[1] = uVar7;
      uVar7 = *puVar2;
      uVar8 = puVar2[1];
      uVar9 = puVar2[2];
      uVar10 = puVar2[3];
      uVar11 = puVar2[4];
      uVar12 = puVar2[5];
      uVar13 = puVar2[7];
      puVar3 = (undefined8 *)(lVar5 + 0x30 + lVar16);
      *puVar3 = puVar2[6];
      puVar3[1] = uVar13;
      puVar2 = (undefined8 *)(lVar5 + 0x20 + lVar16);
      *puVar2 = uVar11;
      puVar2[1] = uVar12;
      puVar2 = (undefined8 *)(lVar5 + 0x10 + lVar16);
      *puVar2 = uVar9;
      puVar2[1] = uVar10;
      *(undefined8 *)(lVar5 + lVar16) = uVar7;
      ((undefined8 *)(lVar5 + lVar16))[1] = uVar8;
      uVar14 = uVar14 + 1;
      break;
    }
    plVar1 = (long *)(lVar6 + lVar16);
    lVar16 = lVar16 + 0x10;
  } while (*plVar1 != *(long *)(lVar5 + 0x20 + uVar15 * 0x78));
  uVar15 = uVar15 + 1;
  if (uVar15 == uVar4) {
LAB_1459323e6:
    *(ulong *)(unaff_R13 + 0xd8) = uVar14;
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  goto LAB_145932455;
}
