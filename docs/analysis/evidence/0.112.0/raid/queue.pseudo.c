/* WARNING: Control flow encountered bad instruction data */

void entry(void)

{
  char cVar1;
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
  long lVar14;
  long unaff_RBP;
  long lVar15;

  if (*(long *)(unaff_RBP + 0x238) != 0) {
    lVar14 = *(long *)(unaff_RBP + 0x2f0);
    lVar15 = *(long *)(unaff_RBP + 0x238) * 0x38 + lVar14;
    do {
      cVar1 = *(char *)(lVar14 + 0x35);
      if (cVar1 == -1) {
        halt_baddata();
      }
      uVar2 = *(undefined2 *)(lVar14 + 0x36);
      uVar3 = *(undefined4 *)(lVar14 + 8);
      uVar4 = *(undefined4 *)(lVar14 + 0xc);
      uVar5 = *(undefined4 *)(lVar14 + 0x10);
      uVar6 = *(undefined4 *)(lVar14 + 0x14);
      uVar7 = *(undefined4 *)(lVar14 + 0x18);
      uVar8 = *(undefined4 *)(lVar14 + 0x1c);
      uVar9 = *(undefined4 *)(lVar14 + 0x20);
      uVar10 = *(undefined4 *)(lVar14 + 0x24);
      uVar11 = *(undefined4 *)(lVar14 + 0x29);
      uVar12 = *(undefined4 *)(lVar14 + 0x2d);
      uVar13 = *(undefined4 *)(lVar14 + 0x31);
      *(undefined4 *)(unaff_RBP + 0x27d) = *(undefined4 *)(lVar14 + 0x25);
      *(undefined4 *)(unaff_RBP + 0x281) = uVar11;
      *(undefined4 *)(unaff_RBP + 0x285) = uVar12;
      *(undefined4 *)(unaff_RBP + 0x289) = uVar13;
      *(undefined4 *)(unaff_RBP + 0x270) = uVar7;
      *(undefined4 *)(unaff_RBP + 0x274) = uVar8;
      *(undefined4 *)(unaff_RBP + 0x278) = uVar9;
      *(undefined4 *)(unaff_RBP + 0x27c) = uVar10;
      *(undefined4 *)(unaff_RBP + 0x260) = uVar3;
      *(undefined4 *)(unaff_RBP + 0x264) = uVar4;
      *(undefined4 *)(unaff_RBP + 0x268) = uVar5;
      *(undefined4 *)(unaff_RBP + 0x26c) = uVar6;
      *(char *)(unaff_RBP + 0x28d) = cVar1;
      *(undefined2 *)(unaff_RBP + 0x28e) = uVar2;
      if (cVar1 != '\f') {
        func_0x00014591f790();
      }
      lVar14 = lVar14 + 0x38;
    } while (lVar14 != lVar15);
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
