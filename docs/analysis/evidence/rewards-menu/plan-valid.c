/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong FUN_1458d7780(undefined8 param_1,undefined8 param_2,long param_3,long param_4)

{
  char *pcVar1;
  byte *pbVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  int *piVar6;
  byte bVar7;
  long *plVar8;
  int *piVar9;
  bool bVar10;
  code *pcVar11;
  byte bVar12;
  int iVar13;
  int *piVar14;
  long lVar15;
  uint uVar16;
  uint uVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  ulong uVar21;
  long lVar22;
  long lVar23;
  ulong uVar24;
  long lVar25;
  ulong uVar26;
  long lVar27;
  long lVar28;
  long lVar29;
  ulong uVar30;
  undefined1 auVar31 [16];
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  long lStack_130;
  ulong uStack_120;
  long lStack_b8;
  long lStack_b0;
  long lStack_a8;
  long lStack_50;

  func_0x0001459cbdd0();
  uVar26 = *(ulong *)(param_3 + 0x118);
  if (0x7ffffffffffffffc < uVar26 * 4 || uVar26 >> 0x3e != 0) {
LAB_1458d77eb:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar11 = (code *)invalidInstructionException();
    (*pcVar11)();
  }
  if (uVar26 * 4 == 0) {
    piVar14 = (int *)0x4;
    uVar24 = 0;
  }
  else {
    func_0x000140002200();
    piVar14 = (int *)func_0x0001400021c0(4);
    uVar24 = uVar26;
    if (piVar14 == (int *)0x0) goto LAB_1458d77eb;
  }
  if (uVar26 != 0) {
    func_0x000145bfa0e7();
  }
  lVar28 = *(long *)(param_4 + 8);
  lVar22 = *(long *)(param_4 + 0x10);
  lVar29 = lVar22 * 0x20;
  if (lVar22 == 0) {
    lVar20 = lStack_a8 << 5;
    lVar18 = lStack_b0;
    do {
      if (lVar20 == 0) goto LAB_1458d7b9a;
      lVar20 = lVar20 + -0x20;
      pcVar1 = (char *)(lVar18 + 0x18);
      lVar18 = lVar18 + 0x20;
    } while (*pcVar1 == '\0');
LAB_1458d7b0e:
    lStack_50 = lStack_b0;
    bVar10 = false;
  }
  else {
    lVar18 = *(long *)(param_3 + 0xb0);
    uVar30 = *(ulong *)(param_3 + 0xb8);
    lVar20 = lVar28;
    do {
      lVar19 = *(long *)(lVar20 + 0x10);
      lVar15 = FUN_1458e54e0(lVar19,*(undefined8 *)(lVar20 + 8),lVar19,*(undefined8 *)(lVar20 + 8));
      if ((lVar15 == 0) || (bVar7 = *(byte *)(lVar20 + 0x18), *(byte *)(lVar15 + 0x38) < bVar7))
      goto LAB_1458d7b0e;
      if (lStack_a8 == 0) {
        if (bVar7 != 0) goto LAB_1458d798f;
      }
      else {
        lVar25 = 0;
        do {
          if ((*(long *)(lStack_b0 + 0x10 + lVar25) == lVar19) &&
             (iVar13 = func_0x000145bfa0e1(), iVar13 == 0)) {
            bVar12 = *(byte *)(lStack_b0 + 0x18 + lVar25);
            goto LAB_1458d7962;
          }
          lVar25 = lVar25 + 0x20;
        } while (lStack_a8 * 0x20 != lVar25);
        bVar12 = 0;
LAB_1458d7962:
        if (bVar12 < bVar7) {
LAB_1458d798f:
          lStack_50 = lStack_b0;
          lVar19 = *(long *)(lVar15 + 0x58);
          lVar25 = 0;
          bVar10 = false;
          if (uVar30 != 1) {
            if (uVar30 == 0) goto LAB_1458d7c9b;
            uVar21 = uVar30;
            lVar23 = 0;
            do {
              lVar25 = lVar23 + (uVar21 >> 1);
              lVar27 = *(long *)(lVar18 + 0x10 + lVar25 * 0x18) - lVar19;
              iVar13 = func_0x000145bfa0e1();
              if (iVar13 != 0) {
                lVar27 = (long)iVar13;
              }
              if (0 < lVar27) {
                lVar25 = lVar23;
              }
              uVar21 = uVar21 - (uVar21 >> 1);
              lVar23 = lVar25;
            } while (1 < uVar21);
          }
          lVar19 = *(long *)(lVar18 + 0x10 + lVar25 * 0x18) - lVar19;
          iVar13 = func_0x000145bfa0e1();
          if (iVar13 != 0) {
            lVar19 = (long)iVar13;
          }
          if (lVar19 != 0) goto LAB_1458d7b0e;
        }
      }
      if (*(long *)(lVar15 + 0x60) != 0) {
        lVar19 = *(long *)(lVar15 + 0x68);
        lVar15 = 0;
        while ((*(long *)(lVar28 + 0x10 + lVar15) != lVar19 ||
               (iVar13 = func_0x000145bfa0e1(), iVar13 != 0))) {
          lVar15 = lVar15 + 0x20;
          if (lVar29 == lVar15) goto LAB_1458d7b0e;
        }
        if (*(char *)(lVar28 + 0x18 + lVar15) == '\0') goto LAB_1458d7b0e;
      }
      lStack_50 = lStack_b0;
      lVar20 = lVar20 + 0x20;
    } while (lVar20 != lVar29 + lVar28);
    lVar18 = lStack_b0;
LAB_1458d7b34:
    do {
      if (lVar18 == lStack_a8 * 0x20 + lStack_b0) goto LAB_1458d7b9a;
      lVar20 = *(long *)(lVar18 + 0x10);
      lVar19 = 0;
      do {
        if ((*(long *)(lVar28 + 0x10 + lVar19) == lVar20) &&
           (iVar13 = func_0x000145bfa0e1(), iVar13 == 0)) {
          bVar10 = false;
          pbVar2 = (byte *)(lVar18 + 0x18);
          lVar18 = lVar18 + 0x20;
          if (*(byte *)(lVar28 + 0x18 + lVar19) < *pbVar2) goto LAB_1458d7c9b;
          goto LAB_1458d7b34;
        }
        lVar19 = lVar19 + 0x20;
      } while (lVar29 != lVar19);
      bVar10 = false;
      pcVar1 = (char *)(lVar18 + 0x18);
      lVar18 = lVar18 + 0x20;
    } while (*pcVar1 == '\0');
  }
  goto LAB_1458d7c9b;
  while (piVar3 = (int *)(lVar22 + (uVar30 & 0x1ffffffffffffff0) * 4 + uVar26), uVar26 = uVar26 + 4,
        *piVar3 != iVar13) {
LAB_1458d7de0:
    if (((uint)uVar30 & 0xf) << 2 == uVar26) goto LAB_1458d7d05;
  }
  while (piVar14 != piVar9) {
LAB_1458d7d71:
    iVar13 = *piVar14;
    piVar14 = piVar14 + 1;
    uVar26 = 0;
    do {
      if ((uVar30 & 0x1ffffffffffffff0) == uVar26) {
        uVar26 = 0;
        goto LAB_1458d7de0;
      }
      piVar3 = (int *)(lVar22 + uVar26 * 4);
      piVar4 = (int *)(lVar22 + 0x10 + uVar26 * 4);
      piVar5 = (int *)(lVar22 + 0x20 + uVar26 * 4);
      piVar6 = (int *)(lVar22 + 0x30 + uVar26 * 4);
      auVar33._0_4_ = -(uint)(*piVar4 == iVar13);
      auVar33._4_4_ = -(uint)(piVar4[1] == iVar13);
      auVar33._8_4_ = -(uint)(piVar4[2] == iVar13);
      auVar33._12_4_ = -(uint)(piVar4[3] == iVar13);
      auVar31._0_4_ = -(uint)(*piVar3 == iVar13);
      auVar31._4_4_ = -(uint)(piVar3[1] == iVar13);
      auVar31._8_4_ = -(uint)(piVar3[2] == iVar13);
      auVar31._12_4_ = -(uint)(piVar3[3] == iVar13);
      auVar31 = packssdw(auVar31,auVar33);
      auVar32._0_4_ = -(uint)(*piVar5 == iVar13);
      auVar32._4_4_ = -(uint)(piVar5[1] == iVar13);
      auVar32._8_4_ = -(uint)(piVar5[2] == iVar13);
      auVar32._12_4_ = -(uint)(piVar5[3] == iVar13);
      auVar34._0_4_ = -(uint)(*piVar6 == iVar13);
      auVar34._4_4_ = -(uint)(piVar6[1] == iVar13);
      auVar34._8_4_ = -(uint)(piVar6[2] == iVar13);
      auVar34._12_4_ = -(uint)(piVar6[3] == iVar13);
      auVar33 = packssdw(auVar32,auVar34);
      auVar31 = packsswb(auVar31,auVar33);
      uVar26 = uVar26 + 0x10;
    } while ((((((((((((((((SUB161(auVar31 >> 7,0) & 1) == 0 && (SUB161(auVar31 >> 0xf,0) & 1) == 0)
                         && (SUB161(auVar31 >> 0x17,0) & 1) == 0) &&
                        (SUB161(auVar31 >> 0x1f,0) & 1) == 0) &&
                       (SUB161(auVar31 >> 0x27,0) & 1) == 0) && (SUB161(auVar31 >> 0x2f,0) & 1) == 0
                      ) && (SUB161(auVar31 >> 0x37,0) & 1) == 0) &&
                    (SUB161(auVar31 >> 0x3f,0) & 1) == 0) && (SUB161(auVar31 >> 0x47,0) & 1) == 0)
                  && (SUB161(auVar31 >> 0x4f,0) & 1) == 0) && (SUB161(auVar31 >> 0x57,0) & 1) == 0)
                && (SUB161(auVar31 >> 0x5f,0) & 1) == 0) && (SUB161(auVar31 >> 0x67,0) & 1) == 0) &&
              (SUB161(auVar31 >> 0x6f,0) & 1) == 0) && (SUB161(auVar31 >> 0x77,0) & 1) == 0) &&
             -1 < auVar31[0xf]);
  }
LAB_1458d7dfd:
  if (bVar10) {
    uVar16 = FUN_1458d7590();
    iVar13 = 0xd;
    if (_DAT_14808d0d0 < 0xd) {
      iVar13 = (int)_DAT_14808d0d0;
    }
    lVar22 = (ulong)(uint)(iVar13 << 5) + 0x14808a3e8;
    if (*(int *)((ulong)(uint)(iVar13 << 5) + 0x14808a400) != 0) {
      func_0x000145d7e194();
    }
    lVar29 = *(long *)(lVar22 + 0x10);
    if (lVar29 == 0) {
      uVar17 = 0;
    }
    else {
      lVar22 = *(long *)(lVar22 + 8);
      lVar18 = *(long *)(param_3 + 0xb0);
      uVar26 = *(ulong *)(param_3 + 0xb8);
      uVar17 = 0;
      lVar19 = 0;
      lVar20 = lVar28;
      do {
        iVar13 = 0;
        lVar28 = lVar20;
        if (uVar26 != 0) {
          lVar25 = lVar19 * 0x70;
          lVar28 = *(long *)(lVar22 + 8 + lVar25);
          lVar15 = *(long *)(lVar22 + 0x10 + lVar25);
          if (uVar26 == 1) {
            lVar27 = 0;
            lVar28 = lVar20;
          }
          else {
            lVar20 = 0;
            uVar30 = uVar26;
            do {
              lVar27 = lVar20 + (uVar30 >> 1);
              lVar23 = *(long *)(lVar18 + 0x10 + lVar27 * 0x18) - lVar15;
              iVar13 = func_0x000145bfa0e1();
              if (iVar13 != 0) {
                lVar23 = (long)iVar13;
              }
              if (0 < lVar23) {
                lVar27 = lVar20;
              }
              uVar30 = uVar30 - (uVar30 >> 1);
              lVar20 = lVar27;
            } while (1 < uVar30);
          }
          lVar15 = *(long *)(lVar18 + 0x10 + lVar27 * 0x18) - lVar15;
          iVar13 = func_0x000145bfa0e1();
          if (iVar13 != 0) {
            lVar15 = (long)iVar13;
          }
          iVar13 = 0;
          if (lVar15 == 0) {
            iVar13 = *(int *)(lVar25 + lVar22 + 0x68);
          }
        }
        uVar17 = uVar17 + iVar13;
        lVar19 = lVar19 + 1;
        lVar20 = lVar28;
      } while (lVar19 != lVar29);
    }
    uVar26 = CONCAT71((int7)((ulong)lVar28 >> 8),uVar16 <= uVar17);
    goto joined_r0x0001458d7f93;
  }
  goto LAB_1458d7d05;
LAB_1458d7b9a:
  lStack_50 = lStack_b0;
  func_0x0001459bae00();
  if (lVar22 == 0) {
    uVar21 = 0;
    uVar30 = 0;
  }
  else {
    uVar21 = 0;
    lVar22 = 0;
    do {
      if ((*(long *)(lVar28 + 0x10 + lVar22) == 9) &&
         (plVar8 = *(long **)(lVar28 + 8 + lVar22),
         (char)plVar8[1] == 'n' && *plVar8 == 0x6f696e61706d6f63)) {
        uVar21 = (ulong)(*(char *)(lVar28 + 0x18 + lVar22) != '\0');
        break;
      }
      lVar22 = lVar22 + 0x20;
    } while (lVar29 != lVar22);
    uVar30 = 0;
    lVar22 = 0;
    do {
      if ((*(long *)(lVar28 + 0x10 + lVar22) == 6) &&
         (piVar9 = *(int **)(lVar28 + 8 + lVar22),
         (short)piVar9[1] == 0x646e && *piVar9 == 0x6f636573)) {
        uVar30 = (ulong)(*(char *)(lVar28 + 0x18 + lVar22) != '\0');
        break;
      }
      lVar22 = lVar22 + 0x20;
    } while (lVar29 != lVar22);
  }
  uVar21 = uVar21 + uVar30;
  if (lStack_130 != 0) {
    func_0x0001400021d0();
  }
  bVar10 = uStack_120 <= uVar21;
LAB_1458d7c9b:
  lVar22 = *(long *)(param_4 + 0x20);
  uVar30 = *(ulong *)(param_4 + 0x28);
  lVar29 = 0;
  do {
    if (uVar30 * 4 - lVar29 == 0) {
      if (uVar26 == 0) goto LAB_1458d7dfd;
      piVar9 = piVar14 + uVar26;
      goto LAB_1458d7d71;
    }
    uVar16 = *(int *)(lVar22 + lVar29) - 0x15f91;
    lVar28 = 0;
  } while (((uVar16 < 0x18) && ((0xfffc3fU >> ((byte)uVar16 & 0x1f) & 1) != 0)) &&
          (lVar29 = lVar29 + 4, *(long *)(*(long *)((ulong)uVar16 * 8 + 0x146bf0fe8) + 0x20) == 0));
LAB_1458d7d05:
  uVar26 = 0;
  lStack_b0 = lStack_50;
joined_r0x0001458d7f93:
  if (lStack_a8 != 0) {
    lVar22 = lStack_b0 + 8;
    do {
      if (*(long *)(lVar22 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar22 = lVar22 + 0x20;
      lStack_a8 = lStack_a8 + -1;
    } while (lStack_a8 != 0);
  }
  if (lStack_b8 != 0) {
    func_0x0001400021d0();
  }
  if (uVar24 != 0) {
    func_0x0001400021d0();
  }
  return uVar26 & 0xffffffff;
}
