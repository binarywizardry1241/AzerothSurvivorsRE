
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595ab76(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  ulong uVar1;
  code *pcVar2;
  ulong uVar3;
  undefined8 uVar4;
  long unaff_RBP;
  float fVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 in_XMM12_Da;
  undefined4 in_XMM13_Da;
  float in_XMM15_Da;
  float fVar8;
  
  uVar6 = param_4[1];
  uVar7 = param_4[5];
  fVar8 = in_XMM15_Da + (float)param_4[2] + (float)param_4[3];
  func_0x0001459577f0(*(undefined8 *)(unaff_RBP + 0x180),param_2,*(undefined8 *)(unaff_RBP + 0x180),
                      param_2,*param_4);
  fVar5 = (float)func_0x000145bfa12f(in_XMM13_Da,in_XMM12_Da);
  if (fVar5 <= _DAT_145d9d2a0) {
    fVar5 = _DAT_145d9d2a0;
  }
  *(float *)(unaff_RBP + 0x164) = fVar5;
  *(undefined4 *)(unaff_RBP + 0x168) = 0x3fcccccd;
  *(undefined4 *)(unaff_RBP + 0x160) = 2;
  *(undefined4 *)(unaff_RBP + 0x114) = uVar6;
  *(float *)(unaff_RBP + 0x118) = fVar8;
  *(undefined4 *)(unaff_RBP + 0x11c) = uVar7;
  *(undefined4 *)(unaff_RBP + 0x110) = 6;
  uVar3 = func_0x0001459575e0();
  if (*(ulong *)(param_2 + 0x598) <= uVar3) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *(undefined1 *)(*(long *)(param_2 + 0x590) + 0x7c + uVar3 * 0x80) = 1;
  uVar1 = *(ulong *)(unaff_RBP + 0xf0);
  if (*(ulong *)(param_2 + 0x598) <= uVar3) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *(float *)(*(long *)(param_2 + 0x590) + 0x78 + uVar3 * 0x80) = fVar5;
  if (*(ulong *)(param_2 + 0x568) <= uVar1) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  uVar4 = func_0x00014590d9a0();
  func_0x0001458ec500(uVar4,param_2 + 0x618,0x2d,0x14722adb8);
  func_0x0001458c1260();
  func_0x000141196a70();
  return;
}

