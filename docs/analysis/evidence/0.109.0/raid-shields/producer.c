
void FUN_145959aa1(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined4 uVar1;
  code *pcVar2;
  long unaff_RBX;
  long unaff_RBP;
  undefined8 uVar3;
  float fVar4;
  float in_XMM15_Da;
  
  if (*(ulong *)(param_2 + 0x568) <= *(ulong *)(unaff_RBP + 0xf0)) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  fVar4 = (float)param_4[1];
  uVar1 = *param_4;
  *(float *)(*(long *)(param_2 + 0x560) + 0x1cc + unaff_RBX) = in_XMM15_Da + fVar4;
  func_0x00014590d9a0();
  uVar3 = func_0x000145980540();
  *(undefined4 *)(unaff_RBP + 0x110) = uVar1;
  *(undefined1 *)(unaff_RBP + 0x13d) = 0x25;
  func_0x000145957260(uVar3,fVar4);
  *(undefined4 *)(unaff_RBP + 0x160) = 2;
  *(undefined4 *)(unaff_RBP + 0xc0) = 0;
  func_0x0001458cd770();
  func_0x000141196a70();
  func_0x0001458ec500();
  func_0x0001458c1260();
  func_0x000141196a70();
  return;
}

