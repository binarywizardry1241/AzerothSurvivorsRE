
/* WARNING: Control flow encountered bad instruction data */

void entry(long param_1)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  byte bVar3;
  long lVar4;
  long lVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  undefined8 uVar21;
  char cVar22;
  long lVar23;
  long unaff_RBP;
  long lVar24;
  long in_R8;
  undefined4 unaff_R14D;
  undefined4 unaff_000000b4;

  *(uint *)(in_R8 + 0xa4) = *(uint *)(in_R8 + 0xa4) | 1 << ((byte)unaff_R14D & 0x1f);
  if (*(ulong *)(param_1 + 0x28) <= CONCAT44(unaff_000000b4,unaff_R14D)) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  lVar4 = *(long *)(param_1 + 0x20);
  lVar24 = CONCAT44(unaff_000000b4,unaff_R14D) + CONCAT44(unaff_000000b4,unaff_R14D) * 8;
  puVar1 = (undefined4 *)(lVar4 + 0x10 + lVar24 * 8);
  uVar6 = *puVar1;
  uVar7 = puVar1[1];
  uVar8 = puVar1[2];
  uVar9 = puVar1[3];
  puVar1 = (undefined4 *)(lVar4 + 0x20 + lVar24 * 8);
  uVar10 = *puVar1;
  uVar11 = puVar1[1];
  uVar12 = puVar1[2];
  uVar13 = puVar1[3];
  puVar1 = (undefined4 *)(lVar4 + 0x30 + lVar24 * 8);
  uVar14 = puVar1[1];
  uVar15 = puVar1[2];
  uVar16 = puVar1[3];
  *(undefined4 *)(unaff_RBP + 0x2b0) = *puVar1;
  *(undefined4 *)(unaff_RBP + 0x2b4) = uVar14;
  *(undefined4 *)(unaff_RBP + 0x2b8) = uVar15;
  *(undefined4 *)(unaff_RBP + 700) = uVar16;
  *(undefined4 *)(unaff_RBP + 0x2a0) = uVar10;
  *(undefined4 *)(unaff_RBP + 0x2a4) = uVar11;
  *(undefined4 *)(unaff_RBP + 0x2a8) = uVar12;
  *(undefined4 *)(unaff_RBP + 0x2ac) = uVar13;
  *(undefined4 *)(unaff_RBP + 0x290) = uVar6;
  *(undefined4 *)(unaff_RBP + 0x294) = uVar7;
  *(undefined4 *)(unaff_RBP + 0x298) = uVar8;
  *(undefined4 *)(unaff_RBP + 0x29c) = uVar9;
  lVar4 = *(long *)(unaff_RBP + 0x280);
  if (lVar4 == *(long *)(unaff_RBP + 0x270)) {
    *(undefined1 *)(unaff_RBP + 0x3b7) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b6) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b5) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b4) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b3) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b2) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b1) = 1;
    *(undefined1 *)(unaff_RBP + 0x3b0) = 1;
    *(undefined1 *)(unaff_RBP + 0x3af) = 1;
    *(undefined1 *)(unaff_RBP + 0x3ae) = 1;
    *(undefined1 *)(unaff_RBP + 0x3ad) = 1;
    *(undefined1 *)(unaff_RBP + 0x3ac) = 1;
    *(undefined1 *)(unaff_RBP + 0x3ab) = 1;
    func_0x000145cfa070();
  }
  lVar5 = *(long *)(unaff_RBP + 0x278);
  lVar23 = lVar4 * 0x38;
  *(undefined8 *)(lVar5 + lVar23) = *(undefined8 *)(unaff_RBP + 0x2e8);
  uVar17 = *(undefined8 *)(unaff_RBP + 0x298);
  uVar18 = *(undefined8 *)(unaff_RBP + 0x2a0);
  uVar19 = *(undefined8 *)(unaff_RBP + 0x2a8);
  uVar20 = *(undefined8 *)(unaff_RBP + 0x2b0);
  uVar21 = *(undefined8 *)(unaff_RBP + 0x2b8);
  puVar2 = (undefined8 *)(lVar5 + 8 + lVar23);
  *puVar2 = *(undefined8 *)(unaff_RBP + 0x290);
  puVar2[1] = uVar17;
  puVar2 = (undefined8 *)(lVar5 + 0x18 + lVar23);
  *puVar2 = uVar18;
  puVar2[1] = uVar19;
  puVar2 = (undefined8 *)(lVar5 + 0x28 + lVar23);
  *puVar2 = uVar20;
  puVar2[1] = uVar21;
  *(long *)(unaff_RBP + 0x280) = lVar4 + 1;
  if (CONCAT44(unaff_000000b4,unaff_R14D) < *(ulong *)(param_1 + 0x28)) {
    bVar3 = *(byte *)(*(long *)(param_1 + 0x20) + 0x3d + lVar24 * 8);
    cVar22 = bVar3 - 3;
    if (bVar3 < 3) {
      cVar22 = '\x1d';
    }
    if ((cVar22 != '\t') && (cVar22 != '\x17')) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
