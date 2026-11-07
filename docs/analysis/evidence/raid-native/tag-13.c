
void FUN_14595a60b(undefined4 param_1,undefined8 param_2,undefined8 param_3,long param_4,
                  undefined8 param_5,long param_6,undefined8 param_7)

{
  code *pcVar1;
  ulong uVar2;
  long unaff_RBP;
  undefined4 uVar3;
  float fVar4;
  float fVar5;
  
  fVar4 = *(float *)(param_6 + 4);
  fVar5 = *(float *)(param_6 + 8);
  uVar3 = 0;
  func_0x000145957320(param_1,param_2,*(undefined4 *)(param_6 + 0xc),0,param_4,
                      *(undefined8 *)(unaff_RBP + 0xf0),param_4,param_7,0);
  func_0x0001459577f0();
  if (0.0 < fVar4) {
    *(float *)(unaff_RBP + 0x14) = fVar5;
    uVar3 = 1;
    fVar5 = fVar4;
  }
  *(float *)(unaff_RBP + 0x10) = fVar5;
  *(undefined4 *)(unaff_RBP + 0xc) = uVar3;
  *(undefined4 *)(unaff_RBP + 0x110) = 0;
  uVar2 = func_0x0001459575e0();
  if (*(ulong *)(param_4 + 0x598) <= uVar2) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *(undefined1 *)(*(long *)(param_4 + 0x590) + 0x7c + uVar2 * 0x80) = 1;
  return;
}

