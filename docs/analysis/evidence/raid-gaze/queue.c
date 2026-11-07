
/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  byte bVar1;
  undefined2 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  char cVar14;
  long lVar15;
  long unaff_RBP;
  undefined8 uVar16;
  long lVar17;

  if (*(long *)(unaff_RBP + 0x280) != 0) {
    lVar17 = *(long *)(unaff_RBP + 0x388);
    lVar15 = *(long *)(unaff_RBP + 0x280) * 0x38 + lVar17;
    uVar16 = 0x1d;
    do {
      bVar1 = *(byte *)(lVar17 + 0x35);
      if (bVar1 == 0xff) {
        halt_baddata();
      }
      uVar2 = *(undefined2 *)(lVar17 + 0x36);
      uVar3 = *(undefined4 *)(lVar17 + 8);
      uVar4 = *(undefined4 *)(lVar17 + 0xc);
      uVar5 = *(undefined4 *)(lVar17 + 0x10);
      uVar6 = *(undefined4 *)(lVar17 + 0x14);
      uVar7 = *(undefined4 *)(lVar17 + 0x18);
      uVar8 = *(undefined4 *)(lVar17 + 0x1c);
      uVar9 = *(undefined4 *)(lVar17 + 0x20);
      uVar10 = *(undefined4 *)(lVar17 + 0x24);
      uVar11 = *(undefined4 *)(lVar17 + 0x29);
      uVar12 = *(undefined4 *)(lVar17 + 0x2d);
      uVar13 = *(undefined4 *)(lVar17 + 0x31);
      *(undefined4 *)(unaff_RBP + 0x2ad) = *(undefined4 *)(lVar17 + 0x25);
      *(undefined4 *)(unaff_RBP + 0x2b1) = uVar11;
      *(undefined4 *)(unaff_RBP + 0x2b5) = uVar12;
      *(undefined4 *)(unaff_RBP + 0x2b9) = uVar13;
      *(undefined4 *)(unaff_RBP + 0x2a0) = uVar7;
      *(undefined4 *)(unaff_RBP + 0x2a4) = uVar8;
      *(undefined4 *)(unaff_RBP + 0x2a8) = uVar9;
      *(undefined4 *)(unaff_RBP + 0x2ac) = uVar10;
      *(undefined4 *)(unaff_RBP + 0x290) = uVar3;
      *(undefined4 *)(unaff_RBP + 0x294) = uVar4;
      *(undefined4 *)(unaff_RBP + 0x298) = uVar5;
      *(undefined4 *)(unaff_RBP + 0x29c) = uVar6;
      *(byte *)(unaff_RBP + 0x2bd) = bVar1;
      *(undefined2 *)(unaff_RBP + 0x2be) = uVar2;
      cVar14 = bVar1 - 3;
      if (bVar1 < 3) {
        cVar14 = (char)uVar16;
      }
      if ((cVar14 != '\t') && (cVar14 != '\x17')) {
        func_0x00014591d320();
      }
      lVar17 = lVar17 + 0x38;
    } while (lVar17 != lVar15);
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
