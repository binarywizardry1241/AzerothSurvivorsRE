
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  undefined4 local_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 local_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  
  lVar2 = *(long *)(param_4 + 0x778);
  if (lVar2 == *(long *)(param_4 + 0x768)) {
    func_0x000145758200();
  }
  lVar3 = *(long *)(param_4 + 0x770);
  *(undefined8 *)(lVar3 + lVar2 * 0x10) = param_3;
  *(undefined4 *)(lVar3 + 8 + lVar2 * 0x10) = 0x40800000;
  *(long *)(param_4 + 0x778) = lVar2 + 1;
  func_0x00014544b1a0();
  lVar2 = *(long *)(param_4 + 0x548);
  if (lVar2 == *(long *)(param_4 + 0x538)) {
    func_0x0001457580b0();
  }
  lVar3 = *(long *)(param_4 + 0x540);
  puVar1 = (undefined4 *)(lVar3 + 0x10 + lVar2 * 0x20);
  *puVar1 = local_60;
  puVar1[1] = uStack_5c;
  puVar1[2] = uStack_58;
  puVar1[3] = uStack_54;
  puVar1 = (undefined4 *)(lVar3 + lVar2 * 0x20);
  *puVar1 = local_70;
  puVar1[1] = uStack_6c;
  puVar1[2] = uStack_68;
  puVar1[3] = uStack_64;
  *(long *)(param_4 + 0x548) = lVar2 + 1;
  func_0x0001454d13a0();
  return;
}

