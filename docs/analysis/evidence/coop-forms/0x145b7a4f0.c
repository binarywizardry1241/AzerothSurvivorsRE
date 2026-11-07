
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  ulong uVar1;
  long lVar2;
  long lVar3;
  undefined1 uVar4;
  long lVar5;

  uVar1 = *(ulong *)(param_4 + 0x10);
  lVar2 = *param_3;
  lVar3 = param_3[2];
  if ((ulong)(lVar2 - lVar3) < 4) {
    func_0x000145e9e020(param_4,param_3,lVar3,param_3,4);
    lVar2 = *param_3;
    lVar3 = param_3[2];
  }
  lVar5 = param_3[1];
  *(int *)(lVar5 + lVar3) = (int)uVar1;
  lVar3 = lVar3 + 4;
  param_3[2] = lVar3;
  if ((ulong)(lVar2 - lVar3) < uVar1) {
    func_0x000145e9e020();
    lVar3 = param_3[2];
    lVar2 = *param_3;
    lVar5 = param_3[1];
LAB_145b7a547:
    func_0x000145d145fb();
  }
  else if (uVar1 != 0) goto LAB_145b7a547;
  lVar3 = lVar3 + uVar1;
  param_3[2] = lVar3;
  uVar4 = *(undefined1 *)(param_4 + 0x49);
  if (lVar3 == lVar2) {
    func_0x000145eb6ec0();
    lVar5 = param_3[1];
  }
  *(undefined1 *)(lVar5 + lVar3) = uVar4;
  lVar3 = lVar3 + 1;
  param_3[2] = lVar3;
  uVar1 = *(ulong *)(param_4 + 0x28);
  lVar2 = *param_3;
  if ((ulong)(lVar2 - lVar3) < 4) {
    func_0x000145e9e020();
    lVar2 = *param_3;
    lVar3 = param_3[2];
  }
  *(int *)(param_3[1] + lVar3) = (int)uVar1;
  lVar3 = lVar3 + 4;
  param_3[2] = lVar3;
  if ((ulong)(lVar2 - lVar3) < uVar1) {
    func_0x000145e9e020();
    lVar3 = param_3[2];
LAB_145b7a5b6:
    func_0x000145d145fb();
  }
  else if (uVar1 != 0) goto LAB_145b7a5b6;
  lVar3 = lVar3 + uVar1;
  param_3[2] = lVar3;
  uVar4 = *(undefined1 *)(param_4 + 0x48);
  if (lVar3 == *param_3) {
    func_0x000145eb6ec0();
  }
  *(undefined1 *)(param_3[1] + lVar3) = uVar4;
  lVar3 = lVar3 + 1;
  param_3[2] = lVar3;
  uVar1 = *(ulong *)(param_4 + 0x40);
  lVar2 = *param_3;
  if ((ulong)(lVar2 - lVar3) < 4) {
    func_0x000145e9e020();
    lVar2 = *param_3;
    lVar3 = param_3[2];
  }
  *(int *)(param_3[1] + lVar3) = (int)uVar1;
  lVar3 = lVar3 + 4;
  param_3[2] = lVar3;
  if ((ulong)(lVar2 - lVar3) < uVar1) {
    func_0x000145e9e020();
    lVar3 = param_3[2];
  }
  else if (uVar1 == 0) goto LAB_145b7a62f;
  func_0x000145d145fb();
LAB_145b7a62f:
  lVar3 = lVar3 + uVar1;
  param_3[2] = lVar3;
  uVar4 = *(undefined1 *)(param_4 + 0x4a);
  if (lVar3 == *param_3) {
    func_0x000145eb6ec0();
  }
  *(undefined1 *)(param_3[1] + lVar3) = uVar4;
  param_3[2] = lVar3 + 1;
  return;
}
