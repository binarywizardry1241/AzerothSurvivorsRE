/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,ulong param_5)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  uint uVar4;
  long lVar5;

  iVar3 = 0xb;
  if (param_5 < 0xb) {
    iVar3 = (int)param_5;
  }
  uVar1 = *(uint *)((ulong)(uint)(iVar3 << 5) + 0x146bf4f28);
  uVar2 = *(undefined4 *)((ulong)(uint)(iVar3 << 5) + 0x146bf4f2c);
  uVar4 = *(int *)(param_4 + 0xa78) + 1;
  *(uint *)(param_4 + 0xa78) = uVar4;
  func_0x00014593c570(param_3,param_4,
                      (ulong)(uVar4 & 0xffffff) | (ulong)(uVar1 & 0xffffff) << 0x18 |
                      0xf130000000000000,param_4,uVar1,uVar2);
  func_0x000145898dc0();
  lVar5 = *(long *)(param_4 + 0x570);
  if (lVar5 == *(long *)(param_4 + 0x560)) {
    func_0x000145d8d160();
  }
  func_0x000145c0a3db();
  *(long *)(param_4 + 0x570) = lVar5 + 1;
  return;
}
