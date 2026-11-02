
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2)

{
  int *piVar1;
  ulong uVar2;
  undefined8 *puVar3;
  long lVar4;
  ulong uVar5;
  ulong uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  uint uVar9;
  undefined8 uVar10;
  ulong uVar11;
  long unaff_RBX;
  long unaff_RBP;
  long lVar12;
  ulong uVar13;
  long lVar14;
  float fVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  float fVar18;
  float in_XMM6_Da;
  float fVar19;
  float in_XMM10_Da;
  
  in_XMM6_Da = in_XMM6_Da *
               *(float *)(unaff_RBX + 0x1c) * *(float *)(unaff_RBX + 0x44) *
               *(float *)(param_2 + 0x4c);
  if (_DAT_145bfc414 < in_XMM6_Da) {
    fVar19 = _DAT_1458f8de0;
    fVar15 = (float)func_0x000145756f57((in_XMM6_Da + _DAT_14698ebd0) / _DAT_1458f8de0);
    in_XMM6_Da = fVar15 * fVar19 + _DAT_145bfc414;
  }
  *(float *)(unaff_RBP + -0xc) = in_XMM6_Da;
  uVar17 = *(undefined4 *)(param_1 + 0x3f4);
  uVar16 = func_0x000145756e31(uVar17);
  uVar17 = func_0x000145756e2b(uVar17);
  *(undefined4 *)(unaff_RBP + 0x44) = uVar16;
  *(undefined4 *)(unaff_RBP + 0x40) = uVar17;
  *(undefined4 *)(unaff_RBP + 0x18) = *(undefined4 *)(param_1 + 0x8e4);
  lVar4 = *(long *)(param_1 + 0x4c8);
  lVar12 = *(long *)(param_1 + 0x4d0);
  *(long *)(unaff_RBP + 0xe0) = lVar4;
  *(long *)(unaff_RBP + 0xe8) = lVar12 * 0x160 + lVar4;
  *(long *)(unaff_RBP + 0xf0) = unaff_RBP + 0x18;
  *(long *)(unaff_RBP + 0xf8) = unaff_RBP + 8;
  *(long *)(unaff_RBP + 0x100) = unaff_RBP + -0xc;
  *(long *)(unaff_RBP + 0x108) = unaff_RBP + 0x44;
  *(long *)(unaff_RBP + 0x110) = unaff_RBP + 0x40;
  func_0x000145530e40();
  lVar4 = *(long *)(unaff_RBP + 200);
  if (lVar4 == 0) {
    if (*(long *)(unaff_RBP + 0xb8) != 0) {
      func_0x0001400021d0();
    }
    uVar10 = 0;
  }
  else {
    *(undefined4 *)(unaff_RBP + 0x50) = 2;
    *(undefined4 *)(unaff_RBP + 0x90) = 0;
    *(undefined1 *)(unaff_RBP + 0xb7) = 1;
    *(undefined8 *)(unaff_RBP + 0x118) = *(undefined8 *)(unaff_RBP + 0xc0);
    func_0x00014544b1a0();
    lVar12 = *(long *)(param_1 + 0x548);
    if (lVar12 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar14 = *(long *)(param_1 + 0x540);
    uVar10 = *(undefined8 *)(unaff_RBP + 0xe0);
    uVar7 = *(undefined8 *)(unaff_RBP + 0xe8);
    uVar8 = *(undefined8 *)(unaff_RBP + 0xf8);
    puVar3 = (undefined8 *)(lVar14 + 0x10 + lVar12 * 0x20);
    *puVar3 = *(undefined8 *)(unaff_RBP + 0xf0);
    puVar3[1] = uVar8;
    puVar3 = (undefined8 *)(lVar14 + lVar12 * 0x20);
    *puVar3 = uVar10;
    puVar3[1] = uVar7;
    *(long *)(param_1 + 0x548) = lVar12 + 1;
    *(undefined8 *)(unaff_RBP + 0x48) = *(undefined8 *)(unaff_RBP + 0xb8);
    lVar12 = *(long *)(unaff_RBP + 0x88);
    piVar1 = (int *)(lVar12 + 0x68);
    lVar14 = 0;
    fVar19 = _DAT_1459eb3c0;
    do {
      uVar5 = *(ulong *)(param_1 + 0x880);
      uVar2 = *(ulong *)(param_1 + 0x898) + uVar5;
      uVar6 = *(ulong *)(param_1 + 0x888);
      uVar13 = *(ulong *)(param_1 + 0x890) ^ uVar5;
      uVar11 = *(ulong *)(param_1 + 0x898) ^ uVar6;
      *(ulong *)(param_1 + 0x888) = uVar6 ^ uVar13;
      *(ulong *)(param_1 + 0x880) = uVar5 ^ uVar11;
      *(ulong *)(param_1 + 0x890) = uVar13 ^ uVar6 << 0x11;
      *(ulong *)(param_1 + 0x898) = uVar11 << 0x2d | uVar11 >> 0x13;
      fVar18 = (float)(uint)((uVar2 * 0x800000 | uVar2 >> 0x29) + uVar5 >> 0x28) * fVar19;
      fVar15 = in_XMM10_Da;
      if (fVar18 < *(float *)(param_1 + 0x464)) {
        fVar15 = *(float *)(param_1 + 0x468) * in_XMM10_Da;
      }
      func_0x0001454c2eb0(fVar18,*(float *)(param_1 + 0x464),fVar15);
      uVar9 = *piVar1 - 1;
      if (uVar9 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e8570 */
                    /* WARNING: Treating indirect jump as call */
        uVar10 = (*(code *)((long)*(int *)((ulong)uVar9 * 4 + 0x1469acf4c) + 0x1469acf4c))();
        return uVar10;
      }
      *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(lVar12 + 0x70);
      *(undefined8 *)(unaff_RBP + 0xe0) = *(undefined8 *)piVar1;
      func_0x0001454ed630();
      lVar14 = lVar14 + 8;
    } while (lVar4 << 3 != lVar14);
    if (*(long *)(unaff_RBP + 0x48) != 0) {
      func_0x0001400021d0();
    }
    uVar10 = 1;
  }
  return uVar10;
}

