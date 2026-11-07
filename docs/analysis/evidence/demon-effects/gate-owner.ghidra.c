
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  bool bVar5;
  long lVar6;
  undefined4 *puVar7;
  ulong uVar8;
  long lVar9;
  long unaff_RBP;
  long *plVar10;
  ulong uVar11;
  char *pcVar12;
  long lVar13;
  ulong uVar14;
  undefined8 unaff_R12;
  undefined7 uVar15;
  long unaff_R13;
  char *pcVar16;
  ulong uVar17;
  int iVar18;
  undefined8 *puVar19;
  char cVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;

  if (*(char *)(unaff_R13 + 0xa73) != '\x01') {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  uVar8 = *(ulong *)(unaff_R13 + 0x780);
  if (uVar8 == 0) {
    bVar5 = false;
    uVar15 = 0;
    goto LAB_1459041b0;
  }
  lVar6 = *(long *)(unaff_R13 + 0x778);
  fVar21 = _DAT_145d70c70;
  if (uVar8 == 1) {
    uVar11 = 0;
LAB_14590419a:
    if (*(char *)(lVar6 + uVar11 * 8) == ' ') {
      fVar21 = fVar21 + *(float *)(lVar6 + 4 + uVar11 * 8);
    }
  }
  else {
    uVar11 = 0;
    do {
      if (*(char *)(lVar6 + uVar11 * 8) == ' ') {
        fVar21 = fVar21 + *(float *)(lVar6 + 4 + uVar11 * 8);
        cVar20 = *(char *)(lVar6 + 8 + uVar11 * 8);
      }
      else {
        cVar20 = *(char *)(lVar6 + 8 + uVar11 * 8);
      }
      if (cVar20 == ' ') {
        fVar21 = fVar21 + *(float *)(lVar6 + 0xc + uVar11 * 8);
      }
      uVar11 = uVar11 + 2;
    } while ((uVar8 & 0xfffffffffffffffe) != uVar11);
    if ((uVar8 & 1) != 0) goto LAB_14590419a;
  }
  bVar5 = 0.0 < fVar21;
  uVar15 = (undefined7)((ulong)unaff_R12 >> 8);
LAB_1459041b0:
  uVar8 = *(ulong *)(unaff_R13 + 0x7b0);
  uVar11 = uVar8 << 6;
  if (uVar11 < 0x7ffffffffffffff9 && uVar8 >> 0x3a == 0) {
    fVar21 = *(float *)(unaff_R13 + 0x9ec);
    if (uVar11 == 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    func_0x000140002200();
    lVar6 = func_0x0001400021c0();
    *(long *)(unaff_RBP + 0x350) = lVar6;
    if (lVar6 != 0) {
      *(ulong *)(unaff_RBP + 0x370) = uVar8;
      pcVar16 = *(char **)(unaff_RBP + 0x350);
      if (uVar8 != 0) {
        func_0x000145bc977b();
      }
      pcVar12 = pcVar16 + uVar11;
      puVar19 = (undefined8 *)(unaff_R13 + 0x4c8);
      *(long *)(unaff_RBP + 0x360) = unaff_R13 + 0x958;
      *(int *)(unaff_RBP + 0x348) = (int)CONCAT71((int7)((ulong)(unaff_R13 + 0x958) >> 8),2);
      uVar8 = 0;
      uVar11 = CONCAT71(uVar15,~bVar5);
      fVar24 = 0.0;
      fVar23 = _DAT_145d70c70;
LAB_14590428b:
      uVar17 = uVar8;
      do {
        if ((pcVar16 == pcVar12) || (*pcVar16 == -1)) {
          if (*(long *)(unaff_RBP + 0x370) != 0) {
            func_0x0001400021d0();
          }
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        if (*pcVar16 == ' ') {
          fVar22 = 0.0;
          if (uVar17 < *(ulong *)(unaff_R13 + 0x78)) {
            fVar22 = *(float *)(*(long *)(unaff_R13 + 0x70) + uVar17 * 4);
          }
          if (((byte)uVar11 & fVar22 <= fVar21) != 0) goto LAB_1459042de;
        }
        pcVar16 = pcVar16 + 0x40;
        uVar17 = uVar17 + 1;
      } while( true );
    }
  }
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
LAB_1459042de:
  fVar22 = *(float *)(pcVar16 + 4);
  *(undefined4 *)(unaff_RBP + 0x338) = *(undefined4 *)(pcVar16 + 8);
  cVar20 = (char)*(undefined4 *)(unaff_RBP + 0x348);
  if (cVar20 == '\x02') {
    *(undefined4 *)(unaff_RBP + 0x238) = *(undefined4 *)(puVar19 + 1);
    *(undefined8 *)(unaff_RBP + 0x230) = *puVar19;
    func_0x000145925c80();
    lVar6 = *(long *)(unaff_RBP + 0xb0);
    if (*(long *)(unaff_RBP + 0xa0) != 0) {
      func_0x0001400021d0();
    }
    cVar20 = lVar6 != 0;
  }
  uVar8 = uVar17 + 1;
  pcVar16 = pcVar16 + 0x40;
  *(undefined4 *)(unaff_RBP + 0x348) = 0;
  unaff_R13 = *(long *)(unaff_RBP + 0x378);
  if (cVar20 != '\x01') goto LAB_14590428b;
  *(ulong *)(unaff_RBP + 0x328) = uVar8;
  if (uVar17 < *(ulong *)(unaff_R13 + 0x78)) {
    fVar22 = fVar22 * *(float *)(unaff_R13 + 0x480);
    if (fVar22 <= _DAT_145d9aecc) {
      fVar22 = _DAT_145d9aecc;
    }
    *(float *)(*(long *)(unaff_R13 + 0x70) + uVar17 * 4) = fVar22 + fVar21;
  }
  uVar8 = *(ulong *)(unaff_R13 + 0x780);
  if (uVar8 == 0) {
    bVar5 = false;
    goto LAB_145904441;
  }
  lVar6 = *(long *)(unaff_R13 + 0x778);
  fVar22 = fVar23;
  if (uVar8 == 1) {
    uVar14 = 0;
LAB_14590442e:
    if (*(char *)(lVar6 + uVar14 * 8) == ' ') {
      fVar22 = fVar22 + *(float *)(lVar6 + 4 + uVar14 * 8);
    }
  }
  else {
    uVar14 = 0;
    do {
      if (*(char *)(lVar6 + uVar14 * 8) == ' ') {
        fVar22 = fVar22 + *(float *)(lVar6 + 4 + uVar14 * 8);
        cVar20 = *(char *)(lVar6 + 8 + uVar14 * 8);
      }
      else {
        cVar20 = *(char *)(lVar6 + 8 + uVar14 * 8);
      }
      if (cVar20 == ' ') {
        fVar22 = fVar22 + *(float *)(lVar6 + 0xc + uVar14 * 8);
      }
      uVar14 = uVar14 + 2;
    } while ((uVar8 & 0xfffffffffffffffe) != uVar14);
    if ((uVar8 & 1) != 0) goto LAB_14590442e;
  }
  bVar5 = fVar24 < fVar22;
LAB_145904441:
  *(bool *)(unaff_RBP + 0x2e0) = bVar5;
  lVar6 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x7a8);
  lVar13 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x7b0);
  *(long *)(unaff_RBP + 0xa0) = lVar6;
  *(long *)(unaff_RBP + 0xa8) = lVar13 * 0x40 + lVar6;
  *(long *)(unaff_RBP + 0xb0) = unaff_RBP + 0x2e0;
  func_0x00014599cd90();
  lVar6 = *(long *)(unaff_RBP + 0x240) << 3;
  lVar13 = 0;
  do {
    if (lVar6 == lVar13) {
      lVar9 = 0;
      break;
    }
    lVar9 = *(long *)(*(long *)(unaff_RBP + 0x238) + lVar13);
    lVar13 = lVar13 + 8;
  } while ((*(byte *)(lVar9 + 0x39) & 0xe) != 2);
  if (*(long *)(unaff_RBP + 0x230) != 0) {
    lVar6 = func_0x0001400021d0();
  }
  *(int *)(unaff_RBP + 0x348) = (int)CONCAT71((int7)((ulong)lVar6 >> 8),1);
  unaff_R13 = *(long *)(unaff_RBP + 0x378);
  uVar8 = uVar17 + 1;
  if (*(int *)(unaff_RBP + 0x338) != 0) {
    *(undefined8 **)(unaff_RBP + 0x330) = puVar19;
    iVar18 = 0;
    *(int *)(unaff_RBP + 0x2a0) = (int)uVar11;
    do {
      uVar8 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8);
      if (uVar8 != 0) {
        lVar6 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0);
        if (uVar8 == 1) {
          uVar14 = 0;
          uVar17 = 0;
LAB_1459045c5:
          uVar17 = uVar17 + ((byte)(*(char *)(*(long *)(lVar6 + 0x18 + uVar14 * 0x78) + 0x39) - 1U)
                            < 4);
        }
        else {
          plVar10 = (long *)(lVar6 + 0x90);
          uVar14 = 0;
          uVar17 = 0;
          do {
            uVar17 = uVar17 + ((byte)(*(char *)(plVar10[-0xf] + 0x39) - 1U) < 4) +
                     (ulong)((byte)(*(char *)(*plVar10 + 0x39) - 1U) < 4);
            uVar14 = uVar14 + 2;
            plVar10 = plVar10 + 0x1e;
          } while ((uVar8 & 0xfffffffffffffffe) != uVar14);
          uVar11 = (ulong)*(uint *)(unaff_RBP + 0x2a0);
          if ((uVar8 & 1) != 0) goto LAB_1459045c5;
        }
        if (9 < uVar17) break;
      }
      func_0x000140002200();
      puVar7 = (undefined4 *)func_0x0001400021c0();
      if (puVar7 == (undefined4 *)0x0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      *(undefined8 *)(unaff_RBP + 0xa0) = 2;
      *(undefined4 **)(unaff_RBP + 0xa8) = puVar7;
      uVar4 = uRam0000000146e77ef4;
      uVar3 = uRam0000000146e77ef0;
      uVar2 = uRam0000000146e77eec;
      *puVar7 = _DAT_146e77ee8;
      puVar7[1] = uVar2;
      puVar7[2] = uVar3;
      puVar7[3] = uVar4;
      *(undefined8 *)(unaff_RBP + 0xb0) = 2;
      if (lVar9 != 0) {
        uVar8 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8);
        if (uVar8 != 0) {
          plVar10 = *(long **)(*(long *)(unaff_RBP + 0x378) + 0xd0);
          if (uVar8 == 1) {
            uVar14 = 0;
            uVar17 = 0;
LAB_1459046cd:
            if (plVar10[uVar14 * 0xf + 3] == lVar9) {
              lVar6 = plVar10[uVar14 * 0xf];
            }
            else {
              lVar6 = 0;
            }
            uVar17 = uVar17 + lVar6;
          }
          else {
            *(long **)(unaff_RBP + 0x318) = plVar10;
            uVar14 = 0;
            uVar17 = 0;
            do {
              lVar6 = 0;
              if (plVar10[3] == lVar9) {
                lVar6 = *plVar10;
              }
              lVar13 = 0;
              if (plVar10[0x12] == lVar9) {
                lVar13 = plVar10[0xf];
              }
              uVar17 = uVar17 + lVar6 + lVar13;
              uVar14 = uVar14 + 2;
              plVar10 = plVar10 + 0x1e;
            } while ((uVar8 & 0xfffffffffffffffe) != uVar14);
            uVar11 = (ulong)*(uint *)(unaff_RBP + 0x2a0);
            plVar10 = *(long **)(unaff_RBP + 0x318);
            if ((uVar8 & 1) != 0) goto LAB_1459046cd;
          }
          if (1 < uVar17) goto LAB_145904712;
        }
        func_0x000145bcb370();
        *(long *)(*(long *)(unaff_RBP + 0xa8) + 0x10) = lVar9;
        *(undefined8 *)(unaff_RBP + 0xb0) = 3;
      }
LAB_145904712:
      lVar6 = func_0x0001458df010();
      if (lVar6 == 0) {
        if (*(long *)(unaff_RBP + 0xa0) != 0) {
          func_0x0001400021d0();
        }
        break;
      }
      func_0x00014594e4f0();
      if (*(long *)(unaff_RBP + 0xa0) != 0) {
        func_0x0001400021d0();
      }
      iVar18 = iVar18 + 1;
    } while (iVar18 != *(int *)(unaff_RBP + 0x338));
    unaff_R13 = *(long *)(unaff_RBP + 0x378);
    puVar19 = *(undefined8 **)(unaff_RBP + 0x330);
    uVar8 = *(ulong *)(unaff_RBP + 0x328);
  }
  goto LAB_14590428b;
}
