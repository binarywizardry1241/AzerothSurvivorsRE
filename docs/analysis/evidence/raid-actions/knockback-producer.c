
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145957f34(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,
                  undefined8 param_5,long param_6,undefined8 param_7)

{
  code *pcVar1;
  ulong uVar2;
  long unaff_RBP;
  undefined4 uVar3;
  undefined4 uVar4;
  
  uVar4 = *(undefined4 *)(param_6 + 4);
  uVar3 = *(undefined4 *)(param_6 + 0xc);
  func_0x000145957320(param_1,param_2,_DAT_145de2250,param_3,param_4,
                      *(undefined8 *)(unaff_RBP + 0xf0),param_4,param_7,0);
  func_0x0001459577f0();
  *(undefined4 *)(unaff_RBP + 0x164) = uVar4;
  *(undefined4 *)(unaff_RBP + 0x160) = 0;
  *(undefined4 *)(unaff_RBP + 0x110) = 0;
  uVar2 = func_0x0001459575e0();
  if (*(ulong *)(param_4 + 0x598) <= uVar2) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *(undefined1 *)(*(long *)(param_4 + 0x590) + 0x7c + uVar2 * 0x80) = 1;
  if (uVar2 < *(ulong *)(param_4 + 0x598)) {
    *(undefined4 *)(*(long *)(param_4 + 0x590) + 0x6c + uVar2 * 0x80) = uVar3;
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}

