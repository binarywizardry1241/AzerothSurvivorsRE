
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595a587(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  long lVar1;
  long lVar2;
  code *pcVar3;
  ulong uVar4;
  undefined8 unaff_RBX;
  long unaff_RBP;
  float fVar5;
  float fVar6;
  undefined4 uVar7;
  undefined4 extraout_XMM0_Da;
  float fVar8;
  undefined8 uVar9;
  undefined4 in_XMM11_Da;
  uint in_XMM15_Da;
  
  *(undefined4 *)(unaff_RBP + 0x150) = *param_4;
  fVar8 = (float)param_4[1];
  uVar7 = *(undefined4 *)(unaff_RBP + 0x178);
  fVar5 = (float)func_0x000145bfa11d(uVar7);
  fVar6 = (float)func_0x000145bfa117(uVar7);
  *(ulong *)(unaff_RBP + 0xc0) =
       CONCAT44(fVar8 * fVar6 + *(float *)(unaff_RBP + 0xd4),
                fVar8 * fVar5 + *(float *)(unaff_RBP + 0xd0));
  *(undefined4 *)(unaff_RBP + 200) = in_XMM11_Da;
  if (*(long *)(*(long *)(param_2 + 0x998) + 0x40) == -1) {
    *(undefined4 *)(unaff_RBP + 0x38) = *(undefined4 *)(unaff_RBP + 200);
    *(undefined8 *)(unaff_RBP + 0x30) = *(undefined8 *)(unaff_RBP + 0xc0);
  }
  else {
    func_0x0001458d1c90();
  }
  *(undefined8 *)(unaff_RBP + 0x90) = unaff_RBX;
  uVar7 = func_0x00014594e170();
  uVar9 = *(undefined8 *)(unaff_RBP + 0x110);
  fVar8 = (float)((ulong)uVar9 >> 0x20);
  uVar4 = func_0x0001458d6f90(uVar7,(int)uVar9,fVar8);
  uVar7 = extraout_XMM0_Da;
  if ((uVar4 & 1) == 0) {
    uVar7 = *(undefined4 *)(unaff_RBP + 0x118);
  }
  *(undefined4 *)(unaff_RBP + 0x16c) = *(undefined4 *)(unaff_RBP + 0xb0);
  *(undefined8 *)(unaff_RBP + 0x164) = *(undefined8 *)(unaff_RBP + 0xa8);
  *(undefined4 *)(unaff_RBP + 0x160) = 1;
  *(undefined4 *)(unaff_RBP + -0x1c) = 0;
  func_0x0001458cd770();
  func_0x000141196a70();
  *(undefined8 *)(unaff_RBP + 0x164) = uVar9;
  *(undefined4 *)(unaff_RBP + 0x16c) = uVar7;
  *(undefined4 *)(unaff_RBP + 0x160) = 1;
  func_0x0001458cd770();
  func_0x000141196a70();
  if (*(ulong *)(unaff_RBP + 0xf0) < *(ulong *)(param_2 + 0x568)) {
    lVar1 = *(long *)(param_2 + 0x560);
    lVar2 = *(long *)(unaff_RBP + 0x90);
    *(undefined8 *)(lVar1 + 0x174 + lVar2) = uVar9;
    *(undefined4 *)(lVar1 + 0x17c + lVar2) = uVar7;
    *(undefined8 *)(lVar1 + 0x180 + lVar2) = uVar9;
    *(undefined4 *)(lVar1 + 0x188 + lVar2) = uVar7;
    *(ulong *)(lVar1 + 0x18c + lVar2) = (ulong)in_XMM15_Da;
    func_0x000145bfa123(*(float *)(unaff_RBP + 0xe0) - fVar8,
                        *(float *)(unaff_RBP + 0xd0) - (float)uVar9);
    func_0x000145957320();
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}

