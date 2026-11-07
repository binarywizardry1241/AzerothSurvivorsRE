
void FUN_14595a4d0(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
                  undefined8 param_5,long param_6,undefined8 param_7)

{
  long unaff_RBP;
  undefined8 uVar1;
  undefined4 uStack0000000000000020;
  
  uVar1 = *(undefined8 *)(param_6 + 4);
  uStack0000000000000020 = *(undefined4 *)(unaff_RBP + 0x178);
  func_0x000145957320(param_1,param_2,*(undefined4 *)(param_6 + 0xc),param_3,param_4,
                      *(undefined8 *)(unaff_RBP + 0xf0),param_4,param_7,1);
  func_0x0001459577f0();
  *(undefined8 *)(unaff_RBP + 0x164) = uVar1;
  *(undefined4 *)(unaff_RBP + 0x160) = 2;
  *(undefined4 *)(unaff_RBP + 0x110) = 0;
  func_0x0001459575e0();
  return;
}

