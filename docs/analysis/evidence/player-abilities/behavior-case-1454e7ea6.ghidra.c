
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2)

{
  undefined4 *puVar1;
  ulong uVar2;
  undefined8 *puVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  uint uVar10;
  undefined8 uVar11;
  ulong uVar12;
  long unaff_RBX;
  long unaff_RBP;
  long lVar13;
  long lVar14;
  ulong uVar15;
  long lVar16;
  undefined8 *unaff_R14;
  float fVar17;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar18;
  undefined4 extraout_XMM0_Da_00;
  float in_XMM6_Da;
  float fVar19;
  float fVar20;
  float in_XMM10_Da;
  
  in_XMM6_Da = in_XMM6_Da *
               *(float *)(unaff_RBX + 0x1c) * *(float *)(unaff_RBX + 0x44) *
               *(float *)(param_2 + 0x50);
  if (_DAT_145bfc414 < in_XMM6_Da) {
    func_0x000145756f57((in_XMM6_Da + _DAT_14698ebd0) / _DAT_1458f8de0);
  }
  *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0xe0) = *unaff_R14;
  func_0x0001454ee0d0();
  lVar4 = *(long *)(unaff_RBP + 200);
  if ((lVar4 == 0) && (*(int *)(param_2 + 0x68) != 6)) {
    if (*(long *)(unaff_RBP + 0xb8) != 0) {
      func_0x0001400021d0();
    }
    uVar11 = 0;
  }
  else {
    *(undefined4 *)(unaff_RBP + 0x50) = 2;
    *(undefined4 *)(unaff_RBP + 0x90) = 0;
    *(undefined1 *)(unaff_RBP + 0xdf) = 1;
    *(undefined8 *)(unaff_RBP + 0x118) = *(undefined8 *)(unaff_RBP + 0xc0);
    func_0x00014544b1a0();
    lVar13 = *(long *)(param_1 + 0x548);
    if (lVar13 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar14 = *(long *)(param_1 + 0x540);
    uVar18 = *(undefined4 *)(unaff_RBP + 0xe0);
    uVar7 = *(undefined4 *)(unaff_RBP + 0xe4);
    uVar8 = *(undefined4 *)(unaff_RBP + 0xe8);
    uVar9 = *(undefined4 *)(unaff_RBP + 0xec);
    uVar11 = *(undefined8 *)(unaff_RBP + 0xf8);
    puVar3 = (undefined8 *)(lVar14 + 0x10 + lVar13 * 0x20);
    *puVar3 = *(undefined8 *)(unaff_RBP + 0xf0);
    puVar3[1] = uVar11;
    puVar1 = (undefined4 *)(lVar14 + lVar13 * 0x20);
    *puVar1 = uVar18;
    puVar1[1] = uVar7;
    puVar1[2] = uVar8;
    puVar1[3] = uVar9;
    *(long *)(param_1 + 0x548) = lVar13 + 1;
    *(undefined8 *)(unaff_RBP + 0x48) = *(undefined8 *)(unaff_RBP + 0xb8);
    lVar13 = *(long *)(unaff_RBP + 0x88);
    lVar14 = lVar13;
    if (lVar4 != 0) {
      lVar16 = 0;
      fVar20 = _DAT_1459eb3c0;
      do {
        uVar5 = *(ulong *)(param_1 + 0x880);
        uVar2 = *(ulong *)(param_1 + 0x898) + uVar5;
        uVar6 = *(ulong *)(param_1 + 0x888);
        uVar15 = *(ulong *)(param_1 + 0x890) ^ uVar5;
        uVar12 = *(ulong *)(param_1 + 0x898) ^ uVar6;
        *(ulong *)(param_1 + 0x888) = uVar6 ^ uVar15;
        *(ulong *)(param_1 + 0x880) = uVar5 ^ uVar12;
        *(ulong *)(param_1 + 0x890) = uVar15 ^ uVar6 << 0x11;
        *(ulong *)(param_1 + 0x898) = uVar12 << 0x2d | uVar12 >> 0x13;
        fVar17 = (float)(uint)((uVar2 * 0x800000 | uVar2 >> 0x29) + uVar5 >> 0x28) * fVar20;
        fVar19 = in_XMM10_Da;
        if (fVar17 < *(float *)(param_1 + 0x464)) {
          fVar19 = *(float *)(param_1 + 0x468) * in_XMM10_Da;
        }
        func_0x0001454c2eb0(fVar17,*(float *)(param_1 + 0x464),fVar19);
        uVar10 = *(int *)(lVar13 + 0x68) - 1;
        if (uVar10 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e8110 */
                    /* WARNING: Treating indirect jump as call */
          uVar11 = (*(code *)((long)*(int *)((ulong)uVar10 * 4 + 0x1469ad014) + 0x1469ad014))();
          return uVar11;
        }
        *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(lVar13 + 0x70);
        *(undefined8 *)(unaff_RBP + 0xe0) = *(undefined8 *)(lVar13 + 0x68);
        func_0x0001454ed630();
        lVar16 = lVar16 + 8;
        uVar18 = extraout_XMM0_Da;
      } while (lVar4 << 3 != lVar16);
    }
    if (*(long *)(unaff_RBP + 0x48) != 0) {
      func_0x0001400021d0();
      uVar18 = extraout_XMM0_Da_00;
    }
    if (*(int *)(lVar14 + 0x68) == 6) {
      fVar20 = *(float *)(lVar14 + 0x6c);
      fVar19 = *(float *)(param_1 + 0x458);
      *(undefined8 *)(unaff_RBP + 0xe0) = 0xfffffffffffffffe;
      *(undefined1 *)(unaff_RBP + 0xdf) = 0;
      func_0x000145493fc0(uVar18,fVar20 * fVar19);
    }
    uVar11 = 1;
  }
  return uVar11;
}

