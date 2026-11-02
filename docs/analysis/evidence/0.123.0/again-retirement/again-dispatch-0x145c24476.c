
void FUN_145c24476(undefined8 param_1,long param_2)

{
  long *plVar1;
  undefined8 *puVar2;
  int iVar3;
  undefined8 uVar4;
  code *pcVar5;
  uint uVar6;
  undefined8 *puVar7;
  long lVar8;
  undefined8 extraout_RDX;
  long unaff_RBP;
  long lVar9;
  undefined8 *puVar10;
  
  func_0x000145c21730();
  plVar1 = (long *)(param_2 + 0x10);
  lVar8 = *plVar1;
  *plVar1 = 2;
  if (lVar8 != 2) {
    *(long *)(unaff_RBP + -0x50) = lVar8;
    func_0x00014600504b();
    if (*(long *)(param_2 + 0x1190) != 0) {
      lVar9 = 0;
      lVar8 = 0;
LAB_145c244d3:
      if (*(char *)(*(long *)(param_2 + 0x1188) + 0xa8 + lVar8) == '\0') goto code_r0x000145c244e1;
      if (*(long *)(unaff_RBP + -0x40) != 0) {
        func_0x000145c6ab70(lVar9);
        func_0x000145c0bd80();
      }
      func_0x000145b1dd80();
      *(undefined8 *)(unaff_RBP + 0x28a0) = *(undefined8 *)(unaff_RBP + 0xd10);
      *(undefined8 *)(unaff_RBP + 0x28b0) = *(undefined8 *)(unaff_RBP + 0xd18);
      if (*(long *)(unaff_RBP + 0xd20) != 0) {
        puVar10 = *(undefined8 **)(unaff_RBP + 0x28b0);
        puVar2 = puVar10 + *(long *)(unaff_RBP + 0xd20);
        do {
          uVar4 = *puVar10;
          func_0x000140002200();
          puVar7 = (undefined8 *)func_0x0001400021c0();
          if (puVar7 == (undefined8 *)0x0) {
            func_0x0001461add5b();
                    /* WARNING: Does not return */
            pcVar5 = (code *)invalidInstructionException();
            (*pcVar5)();
          }
          *puVar7 = uVar4;
          *(undefined8 *)(unaff_RBP + 0xd10) = 0x20;
          *(undefined8 **)(unaff_RBP + 0xd18) = puVar7;
          *(undefined8 *)(unaff_RBP + 0xd20) = 8;
          *(undefined2 *)(unaff_RBP + 0xd28) = 0xaa;
          func_0x000145c0bd80();
          puVar10 = puVar10 + 1;
        } while (puVar10 != puVar2);
      }
      if (*(long *)(unaff_RBP + 0x28a0) != 0) {
        func_0x0001400021d0();
      }
      func_0x000145c26320();
      if (*(int *)(unaff_RBP + 0xd10) == 2) goto LAB_145c24841;
      func_0x00014600504b();
      uVar6 = *(uint *)(unaff_RBP + 0x273c);
      if (*(uint *)(unaff_RBP + 0x273c) < *(uint *)(unaff_RBP + 0xc7c)) {
        uVar6 = *(uint *)(unaff_RBP + 0xc7c);
      }
      *(uint *)(unaff_RBP + 0x273c) = uVar6;
      *(undefined8 *)(param_2 + 0x14b0) = 0;
      func_0x000145ac8590();
      if (*(long *)(param_2 + 0x14b8) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x14d0) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x14e8) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1500) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1518) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1530) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1548) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1560) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1578) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1590) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x15a8) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x15c0) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x15d8) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x15f0) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1608) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1620) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1638) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1650) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(param_2 + 0x1668) != 0) {
        func_0x0001400021d0();
      }
      func_0x00014600504b();
      *(undefined8 *)(param_2 + 0x1a78) = 0;
      *(undefined8 *)(param_2 + 0x1a80) = 0;
      *(undefined8 *)(param_2 + 0x1a68) = 0;
      *(undefined8 *)(param_2 + 0x1a70) = 0;
      *(undefined8 *)(param_2 + 0x1a58) = 0;
      *(undefined8 *)(param_2 + 0x1a60) = 0;
      *(undefined8 *)(param_2 + 0x1a48) = 0;
      *(undefined8 *)(param_2 + 0x1a50) = 0;
      *(undefined8 *)(param_2 + 0x1a88) = 0;
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c68740();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c0bd80();
      *(undefined4 *)(unaff_RBP + 0x2870) = *(undefined4 *)(unaff_RBP + 0x1f98);
      *(undefined8 *)(unaff_RBP + 0x2868) = *(undefined8 *)(unaff_RBP + 0x1f90);
      iVar3 = *(int *)(unaff_RBP + 0x550);
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145b08d20();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c0bd80();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c67620();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c0bd80();
      func_0x000145aaef50();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c74b00();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c0bd80();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c6a940();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145c0bd80();
      *(int *)(unaff_RBP + 0x2010) = iVar3 + 0xd;
      *(undefined1 *)(unaff_RBP + 0x28bf) = 1;
      func_0x000145b87d50();
      func_0x00014600504b();
      iVar3 = *(int *)plVar1;
      *(long **)(unaff_RBP + 0x28b0) = plVar1;
      if (iVar3 != 2) {
        func_0x000145c027f0();
      }
      func_0x00014600504b();
      uVar4 = *(undefined8 *)(param_2 + 0x19f0);
      lVar8 = *(long *)(param_2 + 0x19f8);
      *(undefined1 *)(unaff_RBP + 0x28bf) = 0;
      func_0x000145b96d40(uVar4,lVar8,extraout_RDX,unaff_RBP + 0xd10);
      *(undefined1 *)(unaff_RBP + 0x28bf) = 0;
      func_0x000145b9b7a0();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 0;
      func_0x000145b9b7a0();
      *(undefined1 *)(unaff_RBP + 0x28bf) = 0;
      func_0x000145b9b440();
      *(undefined8 *)(unaff_RBP + 0x28b0) = *(undefined8 *)(unaff_RBP + 0x2878);
      *(undefined8 *)(unaff_RBP + 0x28a0) = *(undefined8 *)(unaff_RBP + 0x2880);
      (**(code **)(lVar8 + 0x18))();
      if (*(long *)(unaff_RBP + 0x28b0) != 0) {
        func_0x0001400021d0();
      }
      func_0x000145c027f0();
      goto LAB_145c2484b;
    }
LAB_145c24841:
    func_0x000145c027f0();
LAB_145c2484b:
    if ((*(uint *)(unaff_RBP + 0x2898) < 0x14) &&
       ((0xa4e00U >> ((uint)*(undefined8 *)(unaff_RBP + 0x2898) & 0x1f) & 1) != 0)) {
      return;
    }
  }
  func_0x000145c02630();
  return;
code_r0x000145c244e1:
  lVar9 = lVar9 + 1;
  lVar8 = lVar8 + 0xb0;
  if (*(long *)(param_2 + 0x1190) * 0xb0 - lVar8 == 0) goto LAB_145c24841;
  goto LAB_145c244d3;
}

