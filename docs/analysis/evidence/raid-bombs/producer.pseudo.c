
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145957d4b(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  undefined8 uVar1;
  code *pcVar2;
  ulong uVar3;
  long unaff_RBP;
  float fVar4;
  float fVar5;
  undefined4 uVar6;
  float in_XMM14_Da;
  float in_XMM15_Da;
  undefined1 auVar7 [16];
  
  uVar6 = param_4[1];
  fVar5 = (float)param_4[2];
  fVar4 = (float)param_4[4];
  func_0x0001459577f0(*(undefined8 *)(unaff_RBP + 0x180),param_2,*(undefined8 *)(unaff_RBP + 0x180),
                      param_2,*param_4);
  *(undefined4 *)(unaff_RBP + 0x164) = uVar6;
  *(undefined4 *)(unaff_RBP + 0x160) = 0;
  *(undefined4 *)(unaff_RBP + 0x110) = 0;
  uVar3 = func_0x0001459575e0();
  if (*(ulong *)(param_2 + 0x598) <= uVar3) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  fVar5 = fVar5 + _DAT_147229920;
  if (fVar5 <= 0.0) {
    fVar5 = 0.0;
  }
  *(float *)(*(long *)(param_2 + 0x590) + 0x58 + uVar3 * 0x80) = in_XMM15_Da + fVar5;
  if (*(ulong *)(param_2 + 0x598) <= uVar3) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *(float *)(*(long *)(param_2 + 0x590) + 0x74 + uVar3 * 0x80) = in_XMM14_Da * fVar4;
  uVar1 = *(undefined8 *)(param_2 + 0x460);
  *(undefined8 *)(unaff_RBP + 0x88) = uVar1;
  *(undefined8 *)(unaff_RBP + 0x168) = uVar1;
  *(undefined4 *)(unaff_RBP + 0x160) = 0;
  *(undefined4 *)(unaff_RBP + 0xc0) = 0;
  func_0x0001458cd770();
  func_0x000141196a70();
  if (*(ulong *)(param_2 + 0x568) <= *(ulong *)(unaff_RBP + 0xf0)) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  auVar7 = func_0x00014590d9a0();
  func_0x0001458ec500(auVar7._8_8_,auVar7._0_8_,0x2a,0x14722af08);
  func_0x0001458c1260();
  func_0x000141196a70();
  return;
}
