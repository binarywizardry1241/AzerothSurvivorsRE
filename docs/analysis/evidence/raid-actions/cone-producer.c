
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145959bc4(undefined8 param_1,undefined4 param_2,undefined8 param_3,undefined8 param_4,
                  undefined8 param_5,long param_6,undefined8 param_7)

{
  long unaff_RBP;
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  undefined8 uVar5;
  float fVar6;
  float fVar7;
  undefined4 in_XMM11_Da;
  undefined4 uVar8;
  undefined4 uVar9;
  
  fVar3 = *(float *)(param_6 + 0xc);
  uVar5 = *(undefined8 *)(param_6 + 4);
  uVar8 = *(undefined4 *)(unaff_RBP + 0x178);
  uVar9 = 0;
  func_0x000145957320(param_1,param_2,_DAT_145de21f0 + fVar3,param_3,param_4,
                      *(undefined8 *)(unaff_RBP + 0xf0),param_4,param_7,1);
  func_0x0001459577f0();
  *(ulong *)(unaff_RBP + 0x164) =
       CONCAT44((float)((ulong)_DAT_147229990 >> 0x20) * (float)((ulong)uVar5 >> 0x20),
                (float)_DAT_147229990 * (float)uVar5);
  *(undefined4 *)(unaff_RBP + 0x160) = 3;
  *(undefined4 *)(unaff_RBP + 0x110) = 0;
  fVar6 = *(float *)(unaff_RBP + 0x150);
  fVar7 = *(float *)(unaff_RBP + 0x154);
  func_0x0001459575e0();
  fVar4 = (float)uVar5;
  fVar1 = (float)func_0x000145bfa11d(CONCAT44(uVar9,uVar8));
  fVar2 = (float)func_0x000145bfa117(CONCAT44(uVar9,uVar8));
  fVar1 = fVar4 * fVar1 * _DAT_145de2260;
  fVar2 = fVar4 * fVar2 * fRam0000000145de2264;
  *(ulong *)(unaff_RBP + 0x110) = CONCAT44(fVar7 + fVar2,fVar6 + fVar1);
  *(undefined4 *)(unaff_RBP + 0x118) = in_XMM11_Da;
  func_0x00014594e230(CONCAT44(fVar2,fVar1),fVar3);
  return;
}

