
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  undefined4 uVar1;
  ulong uVar2;
  undefined8 uVar3;
  long lVar4;
  long lVar5;
  long lVar6;

  uVar2 = *(ulong *)(param_4 + 0x10);
  lVar4 = *param_3;
  lVar6 = param_3[2];
  if ((ulong)(lVar4 - lVar6) < 4) {
    func_0x000145e9e020(lVar6,param_3,lVar6,param_3,4);
    lVar4 = *param_3;
    lVar6 = param_3[2];
  }
  lVar5 = param_3[1];
  *(int *)(lVar5 + lVar6) = (int)uVar2;
  lVar6 = lVar6 + 4;
  param_3[2] = lVar6;
  if ((ulong)(lVar4 - lVar6) < uVar2) {
    func_0x000145e9e020();
    lVar6 = param_3[2];
    lVar4 = *param_3;
    lVar5 = param_3[1];
LAB_145b7a297:
    func_0x000145d145fb();
  }
  else if (uVar2 != 0) goto LAB_145b7a297;
  lVar6 = lVar6 + uVar2;
  param_3[2] = lVar6;
  uVar3 = *(undefined8 *)(param_4 + 0x48);
  if ((ulong)(lVar4 - lVar6) < 8) {
    func_0x000145e9e020();
    lVar5 = param_3[1];
    lVar6 = param_3[2];
  }
  *(undefined8 *)(lVar5 + lVar6) = uVar3;
  lVar6 = lVar6 + 8;
  param_3[2] = lVar6;
  uVar1 = *(undefined4 *)(param_4 + 0x58);
  lVar4 = *param_3;
  if ((ulong)(lVar4 - lVar6) < 4) {
    func_0x000145e9e020();
    lVar4 = *param_3;
    lVar6 = param_3[2];
  }
  lVar5 = param_3[1];
  *(undefined4 *)(lVar5 + lVar6) = uVar1;
  lVar6 = lVar6 + 4;
  param_3[2] = lVar6;
  uVar2 = *(ulong *)(param_4 + 0x28);
  if ((ulong)(lVar4 - lVar6) < 4) {
    func_0x000145e9e020();
    lVar6 = param_3[2];
    lVar4 = *param_3;
    lVar5 = param_3[1];
  }
  *(int *)(lVar5 + lVar6) = (int)uVar2;
  lVar6 = lVar6 + 4;
  param_3[2] = lVar6;
  if ((ulong)(lVar4 - lVar6) < uVar2) {
    func_0x000145e9e020();
    lVar6 = param_3[2];
LAB_145b7a324:
    func_0x000145d145fb();
    lVar4 = *param_3;
  }
  else if (uVar2 != 0) goto LAB_145b7a324;
  lVar6 = lVar6 + uVar2;
  param_3[2] = lVar6;
  uVar3 = *(undefined8 *)(param_4 + 0x50);
  if ((ulong)(lVar4 - lVar6) < 8) {
    func_0x000145e9e020();
    lVar4 = *param_3;
    lVar6 = param_3[2];
  }
  lVar5 = param_3[1];
  *(undefined8 *)(lVar5 + lVar6) = uVar3;
  lVar6 = lVar6 + 8;
  param_3[2] = lVar6;
  uVar2 = *(ulong *)(param_4 + 0x40);
  if ((ulong)(lVar4 - lVar6) < 4) {
    func_0x000145e9e020();
    lVar6 = param_3[2];
    lVar4 = *param_3;
    lVar5 = param_3[1];
  }
  *(int *)(lVar5 + lVar6) = (int)uVar2;
  lVar6 = lVar6 + 4;
  param_3[2] = lVar6;
  if ((ulong)(lVar4 - lVar6) < uVar2) {
    func_0x000145e9e020();
    lVar6 = param_3[2];
  }
  else if (uVar2 == 0) goto LAB_145b7a39c;
  func_0x000145d145fb();
LAB_145b7a39c:
  param_3[2] = lVar6 + uVar2;
  return;
}
