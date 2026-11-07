undefined8 FUN_14599f500(void)

{
  undefined4 *puVar1;
  ulong uVar2;
  code *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  ulong uVar8;
  char *pcVar9;
  long lVar10;
  int iVar11;
  ulong *in_RCX;
  long in_R9;
  ulong uVar12;
  byte *pbVar13;
  ulong uVar14;
  ulong uVar15;
  long lStack_70;
  long lStack_68;
  ulong uStack_60;

  uVar2 = in_RCX[2];
  if (uVar2 == 0) {
    return 0;
  }
  uVar8 = in_RCX[1];
  uVar14 = 0;
  while ((*(long *)(*(long *)(uVar8 + uVar14) + 0x38) != in_R9 ||
         (iVar7 = func_0x000145c0a3e7(), iVar7 != 0))) {
    uVar14 = uVar14 + 0x10;
    if (uVar2 << 4 == uVar14) {
      return 0;
    }
  }
  if (0x7ffffffffffffff8 < uVar2 << 4 || uVar2 >> 0x3c != 0) {
LAB_14599f59f:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  func_0x000140002200();
  uVar8 = func_0x0001400021c0();
  if (uVar8 == 0) goto LAB_14599f59f;
  func_0x000145c0a3db();
  pcVar9 = (char *)(uVar8 + 8 + uVar14);
  *pcVar9 = *pcVar9 + -1;
  pcVar9 = (char *)(uVar8 + 0x18);
  uVar14 = 0;
  do {
    if (pcVar9[-0x10] == '\0') {
      uVar12 = uVar14 + 1;
      uVar15 = uVar14;
      if (uVar12 < uVar2) {
        if (((int)uVar14 + (int)uVar2 & 1U) == 0) {
          if (*pcVar9 != '\0') {
            *(undefined4 *)(pcVar9 + -0x18) = *(undefined4 *)(pcVar9 + -8);
            *(undefined4 *)(pcVar9 + -0x14) = *(undefined4 *)(pcVar9 + -4);
            *(undefined4 *)(pcVar9 + -0x10) = *(undefined4 *)pcVar9;
            *(undefined4 *)(pcVar9 + -0xc) = *(undefined4 *)(pcVar9 + 4);
            uVar15 = uVar14 + 1;
          }
          uVar12 = uVar14 + 2;
        }
        if (uVar2 - 2 != uVar14) {
          lVar10 = uVar2 - uVar12;
          pcVar9 = (char *)(uVar12 * 0x10 + uVar8 + 0x18);
          do {
            if (pcVar9[-0x10] != '\0') {
              uVar4 = *(undefined4 *)(pcVar9 + -0x14);
              uVar5 = *(undefined4 *)(pcVar9 + -0x10);
              uVar6 = *(undefined4 *)(pcVar9 + -0xc);
              puVar1 = (undefined4 *)(uVar8 + uVar15 * 0x10);
              *puVar1 = *(undefined4 *)(pcVar9 + -0x18);
              puVar1[1] = uVar4;
              puVar1[2] = uVar5;
              puVar1[3] = uVar6;
              uVar15 = uVar15 + 1;
            }
            if (*pcVar9 != '\0') {
              uVar4 = *(undefined4 *)(pcVar9 + -4);
              uVar5 = *(undefined4 *)pcVar9;
              uVar6 = *(undefined4 *)(pcVar9 + 4);
              puVar1 = (undefined4 *)(uVar8 + uVar15 * 0x10);
              *puVar1 = *(undefined4 *)(pcVar9 + -8);
              puVar1[1] = uVar4;
              puVar1[2] = uVar5;
              puVar1[3] = uVar6;
              uVar15 = uVar15 + 1;
            }
            pcVar9 = pcVar9 + 0x20;
            lVar10 = lVar10 + -2;
          } while (lVar10 != 0);
        }
      }
      break;
    }
    uVar14 = uVar14 + 1;
    pcVar9 = pcVar9 + 0x10;
    uVar15 = uVar2;
  } while (uVar2 != uVar14);
  if (0x7ffffffffffffff8 < uVar15 << 4 || uVar15 >> 0x3c != 0) {
LAB_14599f635:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (uVar15 << 4 != 0) {
    func_0x000140002200();
    lVar10 = func_0x0001400021c0();
    if (lVar10 == 0) goto LAB_14599f635;
  }
  if (uVar15 != 0) {
    func_0x000145c0a3db();
  }
  FUN_14599fe20();
  iVar7 = 0;
  iVar11 = 0;
  if (uStack_60 != 0) {
    if (uStack_60 < 4) {
      uVar14 = 0;
      iVar11 = 0;
    }
    else {
      pbVar13 = (byte *)(lStack_68 + 0x38);
      uVar14 = 0;
      iVar11 = 0;
      do {
        iVar11 = (uint)*pbVar13 +
                 (uint)pbVar13[-0x10] + (uint)pbVar13[-0x20] + (uint)pbVar13[-0x30] + iVar11;
        uVar14 = uVar14 + 4;
        pbVar13 = pbVar13 + 0x40;
      } while ((uStack_60 & 0xfffffffffffffffc) != uVar14);
      if ((uStack_60 & 3) == 0) goto LAB_14599f761;
    }
    uVar12 = 0;
    do {
      iVar11 = iVar11 + (uint)*(byte *)(uVar14 * 0x10 + lStack_68 + 8 + uVar12);
      uVar12 = uVar12 + 0x10;
    } while (((uint)uStack_60 & 3) << 4 != uVar12);
  }
LAB_14599f761:
  if (uVar15 != 0) {
    if (uVar15 < 4) {
      uVar14 = 0;
      iVar7 = 0;
    }
    else {
      pbVar13 = (byte *)(uVar8 + 0x38);
      uVar14 = 0;
      iVar7 = 0;
      do {
        iVar7 = (uint)*pbVar13 +
                (uint)pbVar13[-0x10] + (uint)pbVar13[-0x20] + (uint)pbVar13[-0x30] + iVar7;
        uVar14 = uVar14 + 4;
        pbVar13 = pbVar13 + 0x40;
      } while ((uVar15 & 0xffffffffffffffc) != uVar14);
      if ((uVar15 & 3) == 0) goto LAB_14599f801;
    }
    uVar12 = 0;
    do {
      iVar7 = iVar7 + (uint)*(byte *)(uVar14 * 0x10 + uVar8 + 8 + uVar12);
      uVar12 = uVar12 + 0x10;
    } while (((uint)uVar15 & 3) << 4 != uVar12);
  }
LAB_14599f801:
  if (iVar11 != iVar7) {
    if (lStack_70 != 0) {
      func_0x0001400021d0();
    }
    func_0x0001400021d0();
    return 0;
  }
  if (*in_RCX != 0) {
    func_0x0001400021d0();
  }
  *in_RCX = uVar2;
  in_RCX[1] = uVar8;
  in_RCX[2] = uVar15;
  if (lStack_70 != 0) {
    func_0x0001400021d0();
  }
  return 1;
}
