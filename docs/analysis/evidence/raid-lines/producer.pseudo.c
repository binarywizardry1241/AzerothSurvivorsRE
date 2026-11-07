
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145958665(undefined8 param_1,long param_2)

{
  code *pcVar1;
  ulong uVar2;
  long unaff_RBX;
  long unaff_RBP;
  float fVar3;
  float fVar4;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar5;
  float fVar6;
  float fVar7;
  undefined8 uVar8;
  float fVar9;
  undefined4 uVar10;
  undefined4 in_XMM11_Da;
  
  fVar4 = *(float *)(unaff_RBP + 0x150);
  fVar7 = *(float *)(unaff_RBP + 0x154);
  fVar3 = fVar4 - *(float *)(unaff_RBP + 0xd0);
  fVar6 = fVar7 - *(float *)(unaff_RBP + 0xd4);
  fVar9 = SQRT(fVar6 * fVar6 + fVar3 * fVar3) + _DAT_145dd4988;
  uVar10 = *(undefined4 *)(unaff_RBP + 0x178);
  fVar3 = (float)func_0x000145bfa11d(uVar10);
  fVar6 = (float)func_0x000145bfa117(uVar10);
  fVar4 = fVar9 * fVar3 + fVar4;
  *(ulong *)(unaff_RBP + 0xc0) = CONCAT44(fVar9 * fVar6 + fVar7,fVar4);
  *(undefined4 *)(unaff_RBP + 200) = in_XMM11_Da;
  if (*(long *)(*(long *)(param_2 + 0x998) + 0x40) == -1) {
    *(undefined4 *)(unaff_RBP + 0x80) = *(undefined4 *)(unaff_RBP + 200);
    *(undefined8 *)(unaff_RBP + 0x78) = *(undefined8 *)(unaff_RBP + 0xc0);
  }
  else {
    fVar4 = (float)func_0x0001458d1c90();
  }
  uVar8 = *(undefined8 *)(unaff_RBP + 0x78);
  uVar2 = func_0x0001458d6f90(fVar4,(int)uVar8,(int)((ulong)uVar8 >> 0x20));
  if (*(ulong *)(unaff_RBP + 0xf0) < *(ulong *)(param_2 + 0x568)) {
    uVar10 = extraout_XMM0_Da;
    if ((uVar2 & 1) == 0) {
      uVar10 = *(undefined4 *)(unaff_RBP + 0x80);
    }
    fVar4 = *(float *)(unaff_RBP + 0x150) - (float)uVar8;
    fVar7 = *(float *)(unaff_RBP + 0x154) - (float)((ulong)uVar8 >> 0x20);
    fVar4 = SQRT(fVar7 * fVar7 + fVar4 * fVar4);
    if (fVar4 <= _DAT_145d9d4c8) {
      fVar4 = _DAT_145d9d4c8;
    }
    fVar3 = *(float *)(*(long *)(param_2 + 0x560) + 0x170 + unaff_RBX) * _DAT_145dd4e58;
    fVar7 = _DAT_145d9d4c8;
    if (_DAT_145d9d4c8 <= fVar3) {
      fVar7 = fVar3;
    }
    fVar6 = _DAT_145dd0ee0;
    if (fVar7 <= _DAT_145dd0ee0) {
      fVar6 = fVar7;
    }
    fVar9 = _DAT_145d9d2a0;
    func_0x000145957320(fVar7,fVar3,fVar4 / _DAT_145d9d714 + _DAT_145d9d2a0);
    func_0x0001459577f0();
    *(float *)(unaff_RBP + 0x164) = fVar4;
    *(float *)(unaff_RBP + 0x168) = fVar6;
    *(undefined4 *)(unaff_RBP + 0x160) = 2;
    *(undefined4 *)(unaff_RBP + 0x110) = 0;
    uVar5 = func_0x0001459575e0();
    *(undefined8 *)(unaff_RBP + 0x110) = uVar8;
    *(undefined4 *)(unaff_RBP + 0x118) = uVar10;
    *(undefined1 *)(unaff_RBP + 0x13d) = 0x23;
    func_0x000145957260(uVar5,fVar9);
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
