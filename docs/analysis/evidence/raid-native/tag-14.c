
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145958553(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,
                  undefined8 param_5,undefined4 *param_6)

{
  code *pcVar1;
  ulong uVar2;
  long unaff_RBX;
  long unaff_RBP;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar3;
  float in_XMM15_Da;
  float fVar4;
  
  uVar3 = param_6[1];
  fVar4 = in_XMM15_Da + _DAT_145d9d2a0 + (float)param_6[2];
  func_0x0001459577f0(*(undefined8 *)(unaff_RBP + 0x180),param_4,*(undefined8 *)(unaff_RBP + 0x180),
                      param_4,*param_6);
  *(undefined4 *)(unaff_RBP + 0x164) = uVar3;
  *(undefined4 *)(unaff_RBP + 0x160) = 0;
  *(float *)(unaff_RBP + 0x114) = fVar4;
  *(ulong *)(unaff_RBP + 0x118) = (ulong)_DAT_145d9d2a4;
  *(undefined4 *)(unaff_RBP + 0x110) = 3;
  uVar2 = func_0x0001459575e0();
  if (uVar2 < *(ulong *)(param_4 + 0x598)) {
    *(undefined1 *)(*(long *)(param_4 + 0x590) + 0x7c + uVar2 * 0x80) = 1;
    uVar2 = *(ulong *)(unaff_RBP + 0xf0);
    func_0x000145957320(extraout_XMM0_Da,param_2,_DAT_145d9d2a0);
    if (uVar2 < *(ulong *)(param_4 + 0x568)) {
      *(float *)(*(long *)(param_4 + 0x560) + 0x1c8 + unaff_RBX) = fVar4;
    }
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}

