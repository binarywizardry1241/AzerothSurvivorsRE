
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2)

{
  long *plVar1;
  long *plVar2;
  undefined8 *puVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  uint uVar9;
  undefined8 uVar10;
  long lVar11;
  ulong uVar12;
  long *plVar13;
  long unaff_RBP;
  long lVar14;
  long lVar15;
  long lVar16;
  ulong uVar17;
  undefined8 *unaff_R14;
  ulong uVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float in_XMM10_Da;
  float fVar22;
  float fVar23;
  
  *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0xe0) = *unaff_R14;
  func_0x0001454ee2a0(param_1,param_2,param_1,unaff_RBP + 0xb8,unaff_RBP + 0xe0);
  uVar18 = *(ulong *)(unaff_RBP + 200);
  if (uVar18 == 0) {
    if (*(long *)(unaff_RBP + 0xb8) != 0) {
      func_0x0001400021d0();
    }
    uVar10 = 0;
  }
  else {
    if (*(char *)(param_2 + 0x75) == '\a') {
      *(undefined4 *)(unaff_RBP + 0x18) = *(undefined4 *)(param_1 + 0x8e4);
      *(long *)(unaff_RBP + 0xe0) = param_1;
      *(long *)(unaff_RBP + 0xe8) = unaff_RBP + 0x18;
      *(long *)(unaff_RBP + 0x90) = unaff_RBP + 0xe0;
      *(long *)(unaff_RBP + 0x50) = unaff_RBP + 0x90;
      if (uVar18 != 1) {
        if (uVar18 < 0x15) {
          lVar14 = uVar18 * 8;
          lVar15 = 8;
          do {
            func_0x0001454f1030();
            lVar15 = lVar15 + 8;
          } while (lVar14 != lVar15);
        }
        else {
          *(undefined1 *)(unaff_RBP + 0xde) = 1;
          func_0x00014553a210();
        }
      }
    }
    if (1 < uVar18) {
      uVar18 = 1;
    }
    plVar13 = *(long **)(unaff_RBP + 0xc0);
    *(long *)(unaff_RBP + 0x58) = *plVar13;
    *(undefined4 *)(unaff_RBP + 0x50) = 0;
    *(undefined4 *)(unaff_RBP + 0x90) = 0;
    *(undefined1 *)(unaff_RBP + 0xde) = 1;
    func_0x00014544b1a0();
    lVar14 = *(long *)(param_1 + 0x548);
    if (lVar14 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar15 = *(long *)(param_1 + 0x540);
    uVar10 = *(undefined8 *)(unaff_RBP + 0xe0);
    uVar7 = *(undefined8 *)(unaff_RBP + 0xe8);
    uVar8 = *(undefined8 *)(unaff_RBP + 0xf8);
    puVar3 = (undefined8 *)(lVar15 + 0x10 + lVar14 * 0x20);
    *puVar3 = *(undefined8 *)(unaff_RBP + 0xf0);
    puVar3[1] = uVar8;
    puVar3 = (undefined8 *)(lVar15 + lVar14 * 0x20);
    *puVar3 = uVar10;
    puVar3[1] = uVar7;
    *(long *)(param_1 + 0x548) = lVar14 + 1;
    *(undefined8 *)(unaff_RBP + 0x118) = *(undefined8 *)(unaff_RBP + 0xb8);
    fVar23 = _DAT_1459eb3c0;
    fVar22 = _DAT_14590ae44;
    plVar2 = plVar13 + uVar18;
    fVar21 = in_XMM10_Da + in_XMM10_Da;
    lVar14 = *(long *)(unaff_RBP + 0x88);
    *(long **)(unaff_RBP + 0x78) = plVar13;
    lVar15 = lVar14;
    do {
      fVar20 = in_XMM10_Da;
      if (*(char *)(lVar15 + 0x75) == '\a') {
        lVar4 = *(long *)(param_1 + 0x4c8);
        lVar11 = 0;
        lVar16 = lVar4;
        do {
          if (*(long *)(param_1 + 0x4d0) * 0x160 - lVar11 == 0) goto LAB_1454e8dd4;
          lVar11 = lVar11 + 0x160;
          plVar1 = (long *)(lVar16 + 0x88);
          lVar16 = lVar16 + 0x160;
        } while (*plVar1 != *plVar13);
        if (*(float *)(lVar4 + -0x70 + lVar11) / *(float *)(lVar4 + -0x6c + lVar11) < fVar22) {
          fVar20 = fVar21;
        }
      }
LAB_1454e8dd4:
      uVar5 = *(ulong *)(param_1 + 0x880);
      uVar18 = *(ulong *)(param_1 + 0x898) + uVar5;
      uVar6 = *(ulong *)(param_1 + 0x888);
      uVar17 = *(ulong *)(param_1 + 0x890) ^ uVar5;
      uVar12 = *(ulong *)(param_1 + 0x898) ^ uVar6;
      *(ulong *)(param_1 + 0x888) = uVar6 ^ uVar17;
      *(ulong *)(param_1 + 0x880) = uVar5 ^ uVar12;
      *(ulong *)(param_1 + 0x890) = uVar17 ^ uVar6 << 0x11;
      *(ulong *)(param_1 + 0x898) = uVar12 << 0x2d | uVar12 >> 0x13;
      fVar19 = (float)(uint)((uVar18 * 0x800000 | uVar18 >> 0x29) + uVar5 >> 0x28) * fVar23;
      if (fVar19 < *(float *)(param_1 + 0x464)) {
        fVar20 = fVar20 * *(float *)(param_1 + 0x468);
      }
      func_0x0001454c2eb0(fVar19,*(float *)(param_1 + 0x464),fVar20);
      uVar9 = *(int *)(lVar14 + 0x68) - 1;
      if (uVar9 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e8e89 */
                    /* WARNING: Treating indirect jump as call */
        uVar10 = (*(code *)((long)*(int *)((ulong)uVar9 * 4 + 0x1469acf9c) + 0x1469acf9c))();
        return uVar10;
      }
      *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(lVar14 + 0x70);
      *(undefined8 *)(unaff_RBP + 0xe0) = *(undefined8 *)(lVar14 + 0x68);
      func_0x0001454ed630();
      plVar13 = plVar13 + 1;
    } while (plVar13 != plVar2);
    if (*(long *)(unaff_RBP + 0x118) != 0) {
      func_0x0001400021d0();
    }
    uVar10 = 1;
  }
  return uVar10;
}

