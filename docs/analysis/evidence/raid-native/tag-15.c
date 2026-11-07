
void FUN_14595870b(undefined4 param_1,undefined8 param_2,undefined8 param_3,long param_4,
                  undefined8 param_5,long param_6,undefined8 param_7)

{
  float fVar1;
  ulong uVar2;
  ulong uVar3;
  code *pcVar4;
  ulong uVar5;
  ulong uVar6;
  undefined8 uVar7;
  long unaff_RBP;
  ulong uVar8;
  float fVar9;
  float fVar10;
  float in_XMM15_Da;
  
  fVar9 = *(float *)(param_6 + 0xc);
  fVar10 = *(float *)(param_6 + 0x10);
  uVar7 = *(undefined8 *)(param_6 + 4);
  func_0x000145957320(param_1,param_2,fVar9 + fVar10,param_3,param_4,
                      *(undefined8 *)(unaff_RBP + 0xf0),param_4,param_7,1);
  func_0x0001459577f0();
  uVar2 = *(ulong *)(param_4 + 0x9a0);
  uVar6 = *(ulong *)(param_4 + 0x9b8) + uVar2;
  uVar3 = *(ulong *)(param_4 + 0x9a8);
  uVar8 = *(ulong *)(param_4 + 0x9b0) ^ uVar2;
  uVar5 = *(ulong *)(param_4 + 0x9b8) ^ uVar3;
  *(ulong *)(param_4 + 0x9a8) = uVar3 ^ uVar8;
  *(ulong *)(param_4 + 0x9a0) = uVar2 ^ uVar5;
  *(ulong *)(param_4 + 0x9b0) = uVar8 ^ uVar3 << 0x11;
  *(ulong *)(param_4 + 0x9b8) = uVar5 << 0x2d | uVar5 >> 0x13;
  fVar1 = *(float *)(((long)((uVar6 * 0x800000 | uVar6 >> 0x29) + uVar2) >> 0x3f) * -4 + 0x147229988
                    );
  *(undefined8 *)(unaff_RBP + 0x164) = uVar7;
  *(undefined4 *)(unaff_RBP + 0x160) = 2;
  *(float *)(unaff_RBP + 0x114) = in_XMM15_Da + fVar9 + fVar10;
  *(undefined4 *)(unaff_RBP + 0x118) = 0x3e800000;
  *(float *)(unaff_RBP + 0x11c) = fVar1 / fVar10;
  *(undefined4 *)(unaff_RBP + 0x110) = 3;
  uVar6 = func_0x0001459575e0();
  if (*(ulong *)(param_4 + 0x598) <= uVar6) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  *(undefined1 *)(*(long *)(param_4 + 0x590) + 0x7c + uVar6 * 0x80) = 1;
  if (*(ulong *)(param_4 + 0x568) <= *(ulong *)(unaff_RBP + 0xf0)) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  uVar7 = func_0x00014590d9a0();
  func_0x0001458ec500(uVar7);
  func_0x0001458c1260();
  func_0x000141196a70();
  return;
}

