
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,ulong *param_4,undefined1 param_5)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  ulong uVar3;
  code *pcVar4;
  undefined1 auVar5 [16];
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  long lVar18;
  int *piVar19;
  uint uVar20;
  int *piVar21;
  uint *puVar22;
  char *pcVar23;
  char *pcVar24;
  ulong uVar25;
  uint uVar26;
  long lVar27;
  ulong uVar28;
  ulong uVar29;
  uint *puVar30;
  uint uVar31;
  ulong uVar32;
  ulong uVar33;
  long lVar34;
  byte bVar35;
  undefined8 in_XMM3_Qa;
  undefined4 in_XMM3_Dc;
  undefined4 in_XMM3_Dd;
  undefined8 uVar36;
  undefined1 auVar37 [16];
  undefined1 auVar39 [16];
  undefined4 uVar40;
  undefined4 in_stack_00000028;
  uint in_stack_00000030;
  undefined4 in_stack_00000038;
  ulong in_stack_00000040;
  long in_stack_00000048;
  long in_stack_00000050;
  undefined4 in_stack_00000058;
  undefined1 auVar38 [16];
  
  auVar39._8_4_ = in_XMM3_Dc;
  auVar39._0_8_ = in_XMM3_Qa;
  auVar39._12_4_ = in_XMM3_Dd;
  uVar25 = param_3 & 0xffffffff;
  uVar26 = (uint)param_3;
  uVar33 = param_4[2];
  if (uVar33 != 0) {
    uVar3 = param_4[1];
    piVar19 = (int *)(uVar3 + 0x20);
    if ((in_stack_00000040 & 1) == 0) {
      uVar15 = 0;
      do {
        if (((piVar19[-4] == uVar26) && ((char)piVar19[-8] == '\0')) && (*piVar19 == 0))
        goto LAB_14540d500;
        uVar15 = uVar15 + 1;
        piVar19 = piVar19 + 0xc;
      } while (uVar33 != uVar15);
    }
    else {
      uVar15 = 0;
      do {
        if ((((piVar19[-4] == uVar26) && (piVar19[-8] == 1)) &&
            (*(long *)(piVar19 + -6) == in_stack_00000048)) && (*piVar19 == 0)) goto LAB_14540d500;
        uVar15 = uVar15 + 1;
        piVar19 = piVar19 + 0xc;
      } while (uVar33 != uVar15);
    }
    goto LAB_14540d58b;
  }
  goto LAB_14540d89b;
code_r0x00014540d88c:
  uVar33 = 0;
  goto LAB_14540d89e;
LAB_14540d7af:
  uVar28 = uVar16 + 1;
  if (uVar28 < uVar33) {
    uVar20 = *puVar30;
    do {
      if (uVar33 <= uVar28) {
        func_0x0001458e75b3();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      if (puVar22[-4] == uVar26) {
        if (puVar22[-8] == 1) {
          if (((in_stack_00000040 & 1) != 0) && (*(long *)(puVar22 + -6) == in_stack_00000048)) {
LAB_14540d7c5:
            uVar31 = *puVar22;
            if (uVar31 < uVar20) {
              uVar16 = uVar28;
            }
            if (uVar31 <= uVar20) {
              uVar20 = uVar31;
            }
          }
        }
        else if ((in_stack_00000040 & 1) == 0) goto LAB_14540d7c5;
      }
      puVar22 = puVar22 + 0xc;
      uVar28 = uVar28 + 1;
      lVar17 = lVar17 + -1;
    } while (lVar17 != 0);
  }
  if (uVar16 < uVar33) {
    lVar17 = *(long *)(uVar3 + uVar16 * 0x30);
    func_0x000145756dd1();
    uVar26 = (uint)uVar25;
    uVar33 = uVar33 - 1;
    param_4[2] = uVar33;
    if (lVar17 != 2) {
      lVar34 = lVar34 + 1;
      lVar27 = lVar27 + -1;
      if (uVar33 == 0) goto code_r0x00014540d88c;
      goto LAB_14540d5e0;
    }
  }
  func_0x0001458e72eb();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
LAB_14540d500:
  if (uVar15 + 1 < uVar33) {
    lVar18 = ~uVar15 + uVar33;
    if ((in_stack_00000040 & 1) == 0) {
      pcVar24 = (char *)(uVar15 * 0x30 + uVar3);
      do {
        pcVar23 = pcVar24 + 0x30;
        if (((*(uint *)(pcVar24 + 0x40) != uVar26) || (*pcVar23 != '\0')) ||
           (*(int *)(pcVar24 + 0x50) != 0)) {
          lVar27 = uVar15 * 0x30;
          uVar40 = *(undefined4 *)pcVar23;
          uVar10 = *(undefined4 *)(pcVar24 + 0x34);
          uVar11 = *(undefined4 *)(pcVar24 + 0x38);
          uVar12 = *(undefined4 *)(pcVar24 + 0x3c);
          uVar36 = *(undefined8 *)(pcVar24 + 0x40);
          uVar13 = *(undefined8 *)(pcVar24 + 0x48);
          uVar14 = *(undefined8 *)(pcVar24 + 0x58);
          puVar2 = (undefined8 *)(uVar3 + 0x20 + lVar27);
          *puVar2 = *(undefined8 *)(pcVar24 + 0x50);
          puVar2[1] = uVar14;
          puVar2 = (undefined8 *)(uVar3 + 0x10 + lVar27);
          *puVar2 = uVar36;
          puVar2[1] = uVar13;
          puVar1 = (undefined4 *)(uVar3 + lVar27);
          *puVar1 = uVar40;
          puVar1[1] = uVar10;
          puVar1[2] = uVar11;
          puVar1[3] = uVar12;
          uVar15 = uVar15 + 1;
        }
        lVar18 = lVar18 + -1;
        pcVar24 = pcVar23;
      } while (lVar18 != 0);
    }
    else {
      piVar19 = (int *)(uVar15 * 0x30 + uVar3);
      do {
        piVar21 = piVar19 + 0xc;
        if ((((piVar19[0x10] != uVar26) || (*piVar21 != 1)) ||
            (*(long *)(piVar19 + 0xe) != in_stack_00000048)) || (piVar19[0x14] != 0)) {
          lVar27 = uVar15 * 0x30;
          iVar6 = *piVar21;
          iVar7 = piVar19[0xd];
          iVar8 = piVar19[0xe];
          iVar9 = piVar19[0xf];
          uVar36 = *(undefined8 *)(piVar19 + 0x10);
          uVar13 = *(undefined8 *)(piVar19 + 0x12);
          uVar14 = *(undefined8 *)(piVar19 + 0x16);
          puVar2 = (undefined8 *)(uVar3 + 0x20 + lVar27);
          *puVar2 = *(undefined8 *)(piVar19 + 0x14);
          puVar2[1] = uVar14;
          puVar2 = (undefined8 *)(uVar3 + 0x10 + lVar27);
          *puVar2 = uVar36;
          puVar2[1] = uVar13;
          piVar19 = (int *)(uVar3 + lVar27);
          *piVar19 = iVar6;
          piVar19[1] = iVar7;
          piVar19[2] = iVar8;
          piVar19[3] = iVar9;
          uVar15 = uVar15 + 1;
        }
        lVar18 = lVar18 + -1;
        piVar19 = piVar21;
      } while (lVar18 != 0);
    }
  }
  param_4[2] = uVar15;
  uVar33 = uVar15;
  if (uVar15 != 0) {
LAB_14540d58b:
    uVar15 = in_stack_00000040 & 0xffffffff ^ 1;
    lVar18 = uVar33 - 1;
    lVar34 = 0;
    lVar27 = lVar18;
LAB_14540d5e0:
    uVar26 = (uint)uVar25;
    if ((in_stack_00000040 & 1) == 0) {
      if (lVar18 == lVar34) {
        uVar28 = 0;
        uVar16 = 0;
      }
      else {
        uVar28 = 0;
        uVar16 = 0;
        puVar22 = (uint *)(uVar3 + 0x40);
        do {
          if (puVar22[-0xc] == uVar26) {
            uVar29 = *(ulong *)(puVar22 + -0x10) ^ 1;
            if (*puVar22 != uVar26) goto LAB_14540d6e8;
LAB_14540d6b0:
            uVar32 = *(ulong *)(puVar22 + -4) ^ 1;
          }
          else {
            uVar29 = 0;
            if (*puVar22 == uVar26) goto LAB_14540d6b0;
LAB_14540d6e8:
            uVar32 = 0;
          }
          uVar16 = uVar16 + uVar29 + uVar32;
          uVar28 = uVar28 + 2;
          puVar22 = puVar22 + 0x18;
        } while ((uVar33 & 0xfffffffffffffffe) != uVar28);
        if ((uVar33 & 1) == 0) goto LAB_14540d74f;
      }
      if (*(uint *)(uVar3 + 0x10 + uVar28 * 0x30) == uVar26) {
        uVar28 = *(ulong *)(uVar28 * 0x30 + uVar3) ^ 1;
      }
      else {
        uVar28 = 0;
      }
LAB_14540d74c:
      uVar16 = uVar16 + uVar28;
    }
    else {
      uVar20 = (uint)uVar15;
      if (lVar18 == lVar34) {
        uVar28 = 0;
        uVar16 = 0;
LAB_14540d6f6:
        if (*(uint *)(uVar3 + 0x10 + uVar28 * 0x30) == uVar26) {
          piVar19 = (int *)(uVar28 * 0x30 + uVar3);
          if (*piVar19 == 1) {
            uVar20 = (uint)(*(long *)(piVar19 + 2) == in_stack_00000048);
          }
        }
        else {
          uVar20 = 0;
        }
        uVar28 = (ulong)(uVar20 & 1);
        goto LAB_14540d74c;
      }
      uVar28 = 0;
      uVar16 = 0;
      puVar22 = (uint *)(uVar3 + 0x40);
      do {
        if (puVar22[-0xc] == uVar26) {
          bVar35 = (byte)uVar15;
          if (puVar22[-0x10] == 1) {
            bVar35 = *(long *)(puVar22 + -0xe) == in_stack_00000048;
          }
        }
        else {
          bVar35 = 0;
        }
        if (*puVar22 == uVar26) {
          uVar31 = uVar20;
          if (puVar22[-4] == 1) {
            uVar31 = (uint)(*(long *)(puVar22 + -2) == in_stack_00000048);
          }
        }
        else {
          uVar31 = 0;
        }
        uVar16 = (ulong)(uVar31 & 1) + uVar16 + (bVar35 & 1);
        uVar28 = uVar28 + 2;
        puVar22 = puVar22 + 0x18;
      } while ((uVar33 & 0xfffffffffffffffe) != uVar28);
      if ((uVar33 & 1) != 0) goto LAB_14540d6f6;
    }
LAB_14540d74f:
    if (in_stack_00000050 + (ulong)(in_stack_00000050 == 0) <= uVar16) {
      uVar16 = 0;
      lVar17 = lVar27;
      puVar22 = (uint *)(uVar3 + 0x50);
      puVar30 = (uint *)(uVar3 + 0x20);
      do {
        if (uVar33 == uVar16) {
          func_0x0001458e75b3();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        if (puVar30[-4] == uVar26) {
          if (puVar30[-8] == 1) {
            if (((in_stack_00000040 & 1) != 0) && (*(long *)(puVar30 + -6) == in_stack_00000048))
            goto LAB_14540d7af;
          }
          else if ((in_stack_00000040 & 1) == 0) goto LAB_14540d7af;
        }
        uVar16 = uVar16 + 1;
        puVar30 = puVar30 + 0xc;
        puVar22 = puVar22 + 0xc;
        lVar17 = lVar17 + -1;
        if (uVar33 == uVar16) {
          func_0x0001458e7510();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
      } while( true );
    }
    goto LAB_14540d89e;
  }
LAB_14540d89b:
  uVar33 = 0;
LAB_14540d89e:
  uVar36 = auVar39._0_8_;
  uVar25 = (ulong)in_stack_00000030;
  uVar40 = 0;
  if (uVar33 == *param_4) {
    func_0x000145758190();
    uVar36 = auVar39._0_8_;
  }
  uVar3 = param_4[1];
  lVar18 = uVar33 * 0x30;
  *(ulong *)(uVar3 + lVar18) = in_stack_00000040;
  *(long *)(uVar3 + 8 + lVar18) = in_stack_00000048;
  *(uint *)(uVar3 + 0x10 + lVar18) = uVar26;
  auVar38._8_4_ = (int)((ulong)uVar36 >> 0x20);
  auVar38._0_8_ = uVar36;
  auVar38._12_4_ = uVar40;
  auVar37._8_8_ = auVar38._8_8_;
  auVar37._0_4_ = (undefined4)uVar36;
  auVar37._4_4_ = in_stack_00000028;
  auVar5._4_4_ = (float)(uVar25 & 0xffffffff);
  auVar5._0_4_ = (float)(uVar25 & 0xffffffff);
  auVar5._8_8_ = 0;
  auVar39 = divps(auVar37,auVar5);
  *(long *)(uVar3 + 0x14 + lVar18) = auVar39._0_8_;
  *(undefined4 *)(uVar3 + 0x1c + lVar18) = in_stack_00000058;
  *(int *)(uVar3 + 0x20 + lVar18) = (int)uVar25;
  *(int *)(uVar3 + 0x24 + lVar18) = (int)uVar25;
  *(undefined4 *)(uVar3 + 0x28 + lVar18) = in_stack_00000038;
  *(undefined1 *)(uVar3 + 0x2c + lVar18) = param_5;
  param_4[2] = uVar33 + 1;
  return;
}

