
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595b097(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  code *pcVar1;
  ulong uVar2;
  undefined8 uVar3;
  long unaff_RBP;
  float in_XMM15_Da;
  
  func_0x0001459577f0(*(undefined8 *)(unaff_RBP + 0x180),param_2,*(undefined8 *)(unaff_RBP + 0x180),
                      param_2,*param_4);
  *(undefined8 *)(unaff_RBP + 0x160) = 0x4020000000000000;
  in_XMM15_Da = in_XMM15_Da + _DAT_145de4d30;
  *(float *)(unaff_RBP + 0x114) = in_XMM15_Da;
  *(undefined4 *)(unaff_RBP + 0x110) = 4;
  uVar2 = func_0x0001459575e0();
  if (*(ulong *)(param_2 + 0x598) <= uVar2) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *(float *)(*(long *)(param_2 + 0x590) + 0x58 + uVar2 * 0x80) = in_XMM15_Da;
  if (*(ulong *)(param_2 + 0x568) <= *(ulong *)(unaff_RBP + 0xf0)) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  uVar3 = func_0x00014590d9a0();
  func_0x0001458ec500(uVar3,param_2 + 0x618,0x26,0x14722ae18);
  func_0x0001458c1260();
  func_0x000141196a70();
  return;
}

