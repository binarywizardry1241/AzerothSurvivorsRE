/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_37d074f254a16b323961578cfd8b76bc679308eaea37c96c24ffb199c080f5e0
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(long param_1,ulong param_2)

{
  uint uVar1;
  ulong uVar2;
  ulong uVar3;
  undefined8 uVar4;
  long lVar5;
  int *piVar6;
  long unaff_RBP;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  undefined4 unaff_R12D;
  int unaff_R15D;
  undefined8 extraout_XMM0_Qa;
  long lVar10;
  undefined8 extraout_XMM0_Qb;
  long lVar11;
  long lVar12;
  undefined1 auVar13 [16];
  undefined4 uVar14;
  undefined8 in_XMM6_Qa;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined4 uVar19;

  uVar15 = (undefined4)((ulong)in_XMM6_Qa >> 0x20);
  uVar14 = (undefined4)in_XMM6_Qa;
  uVar2 = *(ulong *)(param_1 + 0x530);
  *(undefined4 *)(unaff_RBP + 0x5c) = 0x232d;
  if (uVar2 != 0) {
    lVar5 = *(long *)(param_1 + 0x528);
    if (uVar2 < 4) {
      uVar8 = 0;
      uVar7 = 0;
LAB_14549d521:
      lVar9 = uVar2 - uVar8;
      piVar6 = (int *)(lVar5 + uVar8 * 0x48 + 0x20);
      do {
        uVar7 = uVar7 + (*piVar6 == 2);
        piVar6 = piVar6 + 0x12;
        lVar9 = lVar9 + -1;
      } while (lVar9 != 0);
    }
    else {
      uVar8 = uVar2 & 0xfffffffffffffffc;
      piVar6 = (int *)(lVar5 + 0xf8);
      lVar9 = 0;
      lVar10 = 0;
      lVar11 = 0;
      lVar12 = 0;
      uVar7 = uVar8;
      do {
        auVar13._0_4_ = -(uint)(piVar6[-0x36] == _DAT_146aaeb00);
        auVar13._4_4_ = -(uint)(iRam0000000146aaeb04 == 0);
        auVar13._8_4_ = -(uint)(piVar6[-0x24] == iRam0000000146aaeb08);
        auVar13._12_4_ = -(uint)(iRam0000000146aaeb0c == 0);
        lVar11 = lVar11 + SUB168(auVar13 & _DAT_1458a8220,0);
        lVar12 = lVar12 + SUB168(auVar13 & _DAT_1458a8220,8);
        auVar17._0_4_ = -(uint)(piVar6[-0x12] == _DAT_146aaeb00);
        auVar17._4_4_ = -(uint)(iRam0000000146aaeb04 == 0);
        auVar17._8_4_ = -(uint)(*piVar6 == iRam0000000146aaeb08);
        auVar17._12_4_ = -(uint)(iRam0000000146aaeb0c == 0);
        lVar9 = lVar9 + SUB168(auVar17 & _DAT_1458a8220,0);
        lVar10 = lVar10 + SUB168(auVar17 & _DAT_1458a8220,8);
        piVar6 = piVar6 + 0x48;
        uVar7 = uVar7 - 4;
      } while (uVar7 != 0);
      uVar7 = lVar10 + lVar12 + lVar9 + lVar11;
      if (uVar2 != uVar8) goto LAB_14549d521;
    }
    if (4 < uVar7) {
      uVar7 = 0;
      lVar9 = 0;
      do {
        if (uVar2 * 0x48 == lVar9) goto LAB_14549e16d;
        lVar10 = lVar9 + 0x48;
        uVar7 = uVar7 - 1;
        piVar6 = (int *)(lVar5 + 0x20 + lVar9);
        lVar9 = lVar10;
      } while (*piVar6 != 2);
      uVar8 = ~uVar7;
      uVar2 = uVar2 * 0x48 - lVar10;
      if (uVar2 != 0) {
        lVar9 = lVar5 + lVar10;
        lVar5 = lVar5 + lVar10 + -0x48;
        uVar3 = 0;
        do {
          if (*(int *)(lVar9 + 0x20) == 2) {
            uVar1 = *(uint *)(lVar9 + 0x40);
            param_2 = (ulong)uVar1;
            if ((int)((uint)((int)uVar1 >> 0x1f) >> 1 ^ uVar1) <
                (int)((uint)((int)*(uint *)(lVar5 + 0x40) >> 0x1f) >> 1 ^ *(uint *)(lVar5 + 0x40)))
            {
              uVar8 = uVar3 - uVar7;
              lVar5 = lVar9;
            }
          }
          uVar3 = uVar3 + 1;
          lVar9 = lVar9 + 0x48;
        } while (uVar2 / 0x48 != uVar3);
      }
      func_0x0001454a5d50(param_1,param_2,uVar8,param_1);
    }
  }
LAB_14549e16d:
  lVar5 = *(long *)(param_1 + 0x868);
  uVar2 = func_0x0001453f66f0();
  auVar18._8_4_ = (int)extraout_XMM0_Qb;
  auVar18._0_8_ = extraout_XMM0_Qa;
  auVar18._12_4_ = (int)((ulong)extraout_XMM0_Qb >> 0x20);
  if ((uVar2 & 1) == 0) {
    auVar18 = ZEXT416(*(uint *)(lVar5 + 0x68));
  }
  *(undefined4 *)(unaff_RBP + 0x20) = *(undefined4 *)(unaff_RBP + 0x5c);
  *(undefined8 *)(unaff_RBP + 0x24) = 0x3f80000000000103;
  *(ulong *)(unaff_RBP + 0x60) = CONCAT44(uVar15,uVar14);
  *(int *)(unaff_RBP + 0x68) = auVar18._0_4_;
  uVar4 = func_0x0001454a7540();
  uVar16 = auVar18._0_4_;
  *(undefined8 *)(unaff_RBP + 0x20) = 0;
  *(undefined8 *)(unaff_RBP + 0x28) = 8;
  *(undefined8 *)(unaff_RBP + 0x30) = 0;
  if (unaff_R15D == 6) {
    *(undefined8 *)(unaff_RBP + -0x38) = uVar4;
    *(undefined4 *)(unaff_RBP + 0xc) = 6;
    *(undefined4 *)(unaff_RBP + 8) = unaff_R12D;
    *(undefined8 *)(unaff_RBP + -0x30) = 0xcc700002332;
    *(undefined4 *)(unaff_RBP + -0x28) = 0x3f800000;
    *(undefined8 *)(unaff_RBP + -0x24) = 0x8b800002333;
    *(undefined4 *)(unaff_RBP + -0x1c) = 0x3fcccccd;
    *(undefined8 *)(unaff_RBP + 0x68) = 2;
    *(undefined8 *)(unaff_RBP + 0x70) = *(undefined8 *)(unaff_RBP + -0x30);
    *(undefined4 *)(unaff_RBP + 0x78) = *(undefined4 *)(unaff_RBP + -0x28);
    *(undefined4 *)(unaff_RBP + 0x7c) = *(undefined4 *)(unaff_RBP + -0x24);
    *(undefined8 *)(unaff_RBP + 0x80) = *(undefined8 *)(unaff_RBP + -0x20);
    lVar5 = 0;
    lVar9 = 0;
    while (uVar16 = auVar18._0_4_, lVar9 != 2) {
      lVar9 = lVar9 + 1;
      *(long *)(unaff_RBP + 0x60) = lVar9;
      *(ulong *)(unaff_RBP + -0x18) = CONCAT44(uVar15,uVar14);
      *(undefined4 *)(unaff_RBP + -0x10) = uVar16;
      *(undefined1 *)(unaff_RBP + 0x96) = 1;
      uVar4 = func_0x0001454a7540();
      lVar5 = *(long *)(unaff_RBP + 0x30);
      if (lVar5 == *(long *)(unaff_RBP + 0x20)) {
        *(undefined1 *)(unaff_RBP + 0x96) = 1;
        func_0x000145717ba0();
      }
      *(undefined8 *)(*(long *)(unaff_RBP + 0x28) + lVar5 * 8) = uVar4;
      lVar5 = lVar5 + 1;
      *(long *)(unaff_RBP + 0x30) = lVar5;
    }
    *(undefined8 *)(unaff_RBP + 0x18) = *(undefined8 *)(unaff_RBP + 0x20);
    *(undefined8 *)(unaff_RBP + 0x10) = *(undefined8 *)(unaff_RBP + 0x28);
    unaff_R12D = *(undefined4 *)(unaff_RBP + 8);
    unaff_R15D = *(int *)(unaff_RBP + 0xc);
    uVar4 = *(undefined8 *)(unaff_RBP + -0x38);
    uVar19 = *(undefined4 *)(param_1 + 0x8d4);
    lVar9 = *(long *)(param_1 + 0x530);
    if (lVar9 != *(long *)(param_1 + 0x520)) goto LAB_14549e345;
  }
  else {
    *(undefined8 *)(unaff_RBP + 0x10) = 8;
    lVar5 = 0;
    *(undefined8 *)(unaff_RBP + 0x18) = 0;
    uVar19 = *(undefined4 *)(param_1 + 0x8d4);
    lVar9 = *(long *)(param_1 + 0x530);
    if (lVar9 != *(long *)(param_1 + 0x520)) goto LAB_14549e345;
  }
  func_0x000145717c80();
  uVar16 = auVar18._0_4_;
LAB_14549e345:
  lVar10 = *(long *)(param_1 + 0x528);
  *(undefined8 *)(lVar10 + lVar9 * 0x48) = *(undefined8 *)(unaff_RBP + 0x18);
  *(undefined8 *)(lVar10 + 8 + lVar9 * 0x48) = *(undefined8 *)(unaff_RBP + 0x10);
  *(long *)(lVar10 + 0x10 + lVar9 * 0x48) = lVar5;
  *(undefined4 *)(lVar10 + 0x18 + lVar9 * 0x48) = 0;
  *(int *)(lVar10 + 0x20 + lVar9 * 0x48) = unaff_R15D;
  *(undefined4 *)(lVar10 + 0x24 + lVar9 * 0x48) = unaff_R12D;
  *(undefined8 *)(lVar10 + 0x28 + lVar9 * 0x48) = uVar4;
  *(undefined4 *)(lVar10 + 0x30 + lVar9 * 0x48) = *(undefined4 *)(unaff_RBP + 0x5c);
  *(ulong *)(lVar10 + 0x34 + lVar9 * 0x48) = CONCAT44(uVar15,uVar14);
  *(undefined4 *)(lVar10 + 0x3c + lVar9 * 0x48) = uVar16;
  *(undefined4 *)(lVar10 + 0x40 + lVar9 * 0x48) = uVar19;
  *(long *)(param_1 + 0x530) = lVar9 + 1;
  return;
}
