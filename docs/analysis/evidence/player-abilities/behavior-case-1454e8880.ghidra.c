
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(float param_1,long param_2,long param_3)

{
  int *piVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  ulong uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined8 uVar14;
  ulong uVar15;
  long lVar16;
  ulong uVar17;
  long unaff_RBX;
  long lVar18;
  long unaff_RBP;
  undefined4 *puVar19;
  ulong uVar20;
  undefined8 *unaff_R14;
  int iVar21;
  undefined4 uVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float in_XMM9_Da;
  float in_XMM11_Da;
  float fVar26;
  undefined8 uStack0000000000000020;
  long lStack0000000000000028;
  
  fVar25 = *(float *)(param_3 + 0x58) * _DAT_1458f8d40 * *(float *)(unaff_RBX + 0x20) *
           *(float *)(unaff_RBX + 0x48);
  if (fVar25 <= _DAT_1458f6620) {
    fVar25 = _DAT_1458f6620;
  }
  fVar24 = *(float *)(param_2 + 0x8e4);
  uVar4 = *(uint *)(param_3 + 0x68);
  if (uVar4 < 0xb) {
    if ((0x70eU >> (uVar4 & 0x1f) & 1) != 0) goto LAB_1454e88ca;
    if (uVar4 == 7) {
      lVar16 = *(long *)(param_2 + 0x2f8);
      lVar18 = *(long *)(param_2 + 0x300) * 0x18;
      while (lVar18 != 0) {
        lVar18 = lVar18 + -0x18;
        piVar1 = (int *)(lVar16 + 0xc);
        lVar16 = lVar16 + 0x18;
        if (*piVar1 == *(int *)(param_3 + 0x40)) {
          return 0;
        }
      }
      fVar23 = (*(float *)(param_2 + 0x498) + _DAT_1458eb480) *
               SQRT(in_XMM9_Da * in_XMM11_Da) * _DAT_1458f8d40 *
               param_1 * *(float *)(unaff_RBX + 0x50) * *(float *)(param_3 + 0x6c);
      fVar26 = *(float *)(param_2 + 0x404) - *(float *)(param_2 + 0x3dc);
      if (fVar26 <= 0.0) {
        fVar26 = 0.0;
      }
      *(float *)(param_2 + 0x404) = fVar26 + fVar23;
      *(undefined4 *)(param_2 + 0x3d8) = *(undefined4 *)(param_3 + 0x40);
      *(float *)(param_2 + 0x3dc) = fVar23;
      *(undefined8 *)(unaff_RBP + 0x90) = *(undefined8 *)(param_2 + 0x3d0);
      *(undefined4 *)(unaff_RBP + 0xb8) = 2;
      *(undefined4 *)(unaff_RBP + 0x50) = 0;
      lStack0000000000000028 = unaff_RBP + 0xb8;
      uStack0000000000000020 = 1;
      func_0x00014544b1a0();
      func_0x000140bd39f0();
      func_0x000145523170();
      uVar22 = *(undefined4 *)(param_3 + 0x40);
      func_0x00014548c410();
      fVar24 = fVar24 + fVar25;
      lVar16 = *(long *)(param_2 + 0x300);
      if (lVar16 == *(long *)(param_2 + 0x2f0)) {
        func_0x000145763c20();
      }
      lVar18 = *(long *)(param_2 + 0x2f8);
      *(undefined4 *)(lVar18 + 8 + lVar16 * 0x18) = *(undefined4 *)(unaff_RBP + 0xe8);
      *(undefined8 *)(lVar18 + lVar16 * 0x18) = *(undefined8 *)(unaff_RBP + 0xe0);
      *(undefined4 *)(lVar18 + 0xc + lVar16 * 0x18) = uVar22;
      *(float *)(lVar18 + 0x10 + lVar16 * 0x18) = fVar24;
      *(undefined4 *)(lVar18 + 0x14 + lVar16 * 0x18) = 0;
      goto LAB_1454eb198;
    }
  }
  if (uVar4 == 6) {
    if (_DAT_1458fcdf0 * param_1 < *(float *)(param_2 + 0x400)) {
      return 0;
    }
    fVar23 = SQRT(in_XMM9_Da * in_XMM11_Da) * _DAT_1458f8d40 * param_1 * *(float *)(param_3 + 0x6c);
    *(undefined8 *)(unaff_RBP + 0x90) = *(undefined8 *)(param_2 + 0x3d0);
    *(undefined4 *)(unaff_RBP + 0xb8) = 2;
    *(undefined4 *)(unaff_RBP + 0x50) = 0;
    lStack0000000000000028 = unaff_RBP + 0xb8;
    uStack0000000000000020 = 1;
    func_0x00014544b1a0();
    func_0x000140bd39f0();
    fVar26 = *(float *)(param_3 + 0x58);
    if (fVar26 <= 0.0) {
      *(undefined8 *)(unaff_RBP + 0xe0) = 0xfffffffffffffffe;
      func_0x000145493fc0(fVar26,fVar23);
      return 1;
    }
    func_0x000145523170();
    uVar22 = *(undefined4 *)(param_3 + 0x40);
    func_0x00014548c410();
    fVar24 = fVar24 + fVar25;
    lVar16 = *(long *)(param_2 + 0x300);
    if (lVar16 == *(long *)(param_2 + 0x2f0)) {
      func_0x000145763c20();
    }
    lVar18 = *(long *)(param_2 + 0x2f8);
    *(undefined4 *)(lVar18 + 8 + lVar16 * 0x18) = *(undefined4 *)(unaff_RBP + 0xe8);
    *(undefined8 *)(lVar18 + lVar16 * 0x18) = *(undefined8 *)(unaff_RBP + 0xe0);
    *(undefined4 *)(lVar18 + 0xc + lVar16 * 0x18) = uVar22;
    *(float *)(lVar18 + 0x10 + lVar16 * 0x18) = fVar24;
    *(float *)(lVar18 + 0x14 + lVar16 * 0x18) = fVar23;
LAB_1454eb198:
    *(long *)(param_2 + 0x300) = lVar16 + 1;
    func_0x00014548d2b0();
    return 1;
  }
  if (uVar4 == 0xb) {
    if (*(float *)(param_2 + 0x400) <= param_1 * _DAT_1458eb508) {
      *(undefined8 *)(unaff_RBP + 0x90) = *(undefined8 *)(param_2 + 0x3d0);
      *(undefined4 *)(unaff_RBP + 0xb8) = 2;
      *(undefined4 *)(unaff_RBP + 0x50) = 0;
      lStack0000000000000028 = unaff_RBP + 0xb8;
      uStack0000000000000020 = 1;
      func_0x00014544b1a0();
      func_0x000140bd39f0();
      uVar22 = *(undefined4 *)(param_3 + 0x40);
      func_0x00014548c410();
      fVar24 = fVar24 + fVar25;
      lVar16 = *(long *)(param_2 + 0x300);
      if (lVar16 == *(long *)(param_2 + 0x2f0)) {
        func_0x000145763c20();
      }
      lVar18 = *(long *)(param_2 + 0x2f8);
      *(undefined4 *)(lVar18 + 8 + lVar16 * 0x18) = *(undefined4 *)(unaff_RBP + 0xe8);
      *(undefined8 *)(lVar18 + lVar16 * 0x18) = *(undefined8 *)(unaff_RBP + 0xe0);
      *(undefined4 *)(lVar18 + 0xc + lVar16 * 0x18) = uVar22;
      *(float *)(lVar18 + 0x10 + lVar16 * 0x18) = fVar24;
      *(undefined4 *)(lVar18 + 0x14 + lVar16 * 0x18) = 0;
      *(long *)(param_2 + 0x300) = lVar16 + 1;
      func_0x00014548d2b0();
      return 1;
    }
    return 0;
  }
LAB_1454e88ca:
  *(undefined4 *)(unaff_RBP + 0xc0) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0xb8) = *unaff_R14;
  lStack0000000000000028 = 0;
  uStack0000000000000020 = 8;
  func_0x0001454ee0d0(param_2,param_3,param_2,unaff_RBP + 0xe0,unaff_RBP + 0xb8);
  lVar16 = *(long *)(unaff_RBP + 0xf0);
  if (*(long *)(unaff_RBP + 0xe0) != 0) {
    func_0x0001400021d0();
  }
  if (lVar16 == 0) {
    return 0;
  }
  *(undefined8 *)(unaff_RBP + 0x90) = *(undefined8 *)(param_2 + 0x3d0);
  *(undefined4 *)(unaff_RBP + 0xb8) = 2;
  *(undefined4 *)(unaff_RBP + 0x50) = 0;
  uStack0000000000000020 = 1;
  lStack0000000000000028 = unaff_RBP + 0xb8;
  func_0x00014544b1a0();
  lVar16 = *(long *)(param_2 + 0x548);
  if (lVar16 == *(long *)(param_2 + 0x538)) {
    func_0x0001457580b0();
  }
  lVar18 = *(long *)(param_2 + 0x540);
  uVar22 = *(undefined4 *)(unaff_RBP + 0xe0);
  uVar8 = *(undefined4 *)(unaff_RBP + 0xe4);
  uVar9 = *(undefined4 *)(unaff_RBP + 0xe8);
  uVar10 = *(undefined4 *)(unaff_RBP + 0xec);
  uVar11 = *(undefined4 *)(unaff_RBP + 0xf4);
  uVar12 = *(undefined4 *)(unaff_RBP + 0xf8);
  uVar13 = *(undefined4 *)(unaff_RBP + 0xfc);
  puVar3 = (undefined4 *)(lVar18 + 0x10 + lVar16 * 0x20);
  *puVar3 = *(undefined4 *)(unaff_RBP + 0xf0);
  puVar3[1] = uVar11;
  puVar3[2] = uVar12;
  puVar3[3] = uVar13;
  puVar3 = (undefined4 *)(lVar18 + lVar16 * 0x20);
  *puVar3 = uVar22;
  puVar3[1] = uVar8;
  puVar3[2] = uVar9;
  puVar3[3] = uVar10;
  *(long *)(param_2 + 0x548) = lVar16 + 1;
  lVar16 = *(long *)(unaff_RBP + 0x88);
  iVar5 = *(int *)(lVar16 + 0x68);
  fVar26 = *(float *)(lVar16 + 0x6c);
  if (iVar5 - 1U < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e8a0d */
                    /* WARNING: Treating indirect jump as call */
    uVar14 = (*(code *)((long)*(int *)((ulong)(iVar5 - 1U) * 4 + 0x1469acf24) + 0x1469acf24))
                       (*(undefined4 *)(unaff_RBX + 0x50));
    return uVar14;
  }
  uVar22 = *(undefined4 *)(lVar16 + 0x70);
  if (iVar5 == 0xc) {
    fVar26 = in_XMM11_Da * in_XMM9_Da * fVar26;
  }
  uVar7 = *(ulong *)(param_2 + 0x300);
  iVar21 = *(int *)(lVar16 + 0x40);
  if (uVar7 == 0) {
    uVar17 = 0;
LAB_1454ea97b:
    fVar23 = fVar24 + fVar25;
    if (uVar17 == *(ulong *)(param_2 + 0x2f0)) {
LAB_1454ea985:
      fVar23 = fVar24 + fVar25;
      func_0x000145763c20();
    }
LAB_1454ea98a:
    lVar16 = *(long *)(param_2 + 0x2f8);
    *(int *)(lVar16 + uVar17 * 0x18) = iVar5;
    *(float *)(lVar16 + 4 + uVar17 * 0x18) = fVar26;
    *(undefined4 *)(lVar16 + 8 + uVar17 * 0x18) = uVar22;
    *(int *)(lVar16 + 0xc + uVar17 * 0x18) = iVar21;
    *(float *)(lVar16 + 0x10 + uVar17 * 0x18) = fVar23;
    *(undefined4 *)(lVar16 + 0x14 + uVar17 * 0x18) = 0;
    *(ulong *)(param_2 + 0x300) = uVar17 + 1;
    func_0x0001454950d0();
    func_0x00014548d2b0();
    return 1;
  }
  puVar3 = *(undefined4 **)(param_2 + 0x2f8);
  uVar15 = 0;
  puVar19 = puVar3;
LAB_1454e8a50:
  if (puVar19[3] != iVar21) goto code_r0x0001454e8a5a;
  uVar20 = uVar15 + 1;
  uVar17 = uVar15;
  if (uVar20 < uVar7) {
    lVar16 = *(long *)(unaff_RBP + 0x88);
    if (((int)uVar7 + (int)uVar15 & 1U) == 0) {
      if (puVar19[9] != iVar21) {
        *(undefined8 *)(puVar19 + 4) = *(undefined8 *)(puVar19 + 10);
        *puVar19 = puVar19[6];
        puVar19[1] = puVar19[7];
        puVar19[2] = puVar19[8];
        puVar19[3] = puVar19[9];
        uVar17 = uVar15 + 1;
      }
      uVar20 = uVar15 + 2;
    }
    if (uVar7 - 2 != uVar15) {
      puVar19 = puVar3 + uVar20 * 6;
      lVar18 = uVar7 - uVar20;
      do {
        if (puVar19[3] == iVar21) {
          iVar6 = puVar19[9];
        }
        else {
          *(undefined8 *)(puVar3 + uVar17 * 6 + 4) = *(undefined8 *)(puVar19 + 4);
          uVar8 = puVar19[1];
          uVar9 = puVar19[2];
          uVar10 = puVar19[3];
          puVar2 = puVar3 + uVar17 * 6;
          *puVar2 = *puVar19;
          puVar2[1] = uVar8;
          puVar2[2] = uVar9;
          puVar2[3] = uVar10;
          uVar17 = uVar17 + 1;
          iVar6 = puVar19[9];
        }
        if (iVar6 != iVar21) {
          *(undefined8 *)(puVar3 + uVar17 * 6 + 4) = *(undefined8 *)(puVar19 + 10);
          uVar8 = puVar19[7];
          uVar9 = puVar19[8];
          uVar10 = puVar19[9];
          puVar2 = puVar3 + uVar17 * 6;
          *puVar2 = puVar19[6];
          puVar2[1] = uVar8;
          puVar2[2] = uVar9;
          puVar2[3] = uVar10;
          uVar17 = uVar17 + 1;
        }
        puVar19 = puVar19 + 0xc;
        lVar18 = lVar18 + -2;
      } while (lVar18 != 0);
    }
  }
  *(ulong *)(param_2 + 0x300) = uVar17;
  iVar21 = *(int *)(lVar16 + 0x40);
  fVar23 = fVar24 + fVar25;
  if (uVar17 != *(ulong *)(param_2 + 0x2f0)) goto LAB_1454ea98a;
  goto LAB_1454ea985;
code_r0x0001454e8a5a:
  uVar15 = uVar15 + 1;
  puVar19 = puVar19 + 6;
  uVar17 = uVar7;
  if (uVar7 == uVar15) goto LAB_1454ea97b;
  goto LAB_1454e8a50;
}

